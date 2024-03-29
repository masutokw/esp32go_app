unit Esp32gounit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.DateUtils, System.IOutils,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.Edit, FMX.Controls.Presentation, FMX.EditBox,
  FMX.NumberBox, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.ListBox, System.Bluetooth,
  System.Bluetooth.Components,system.permissions, System.Sensors,
  System.Sensors.Components;

type
  TEsp32GoForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    GestureManager1: TGestureManager;
    IdTCPClient1: TIdTCPClient;
    Timer1: TTimer;
    StyleBook1: TStyleBook;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    ButtonCon: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button_s: TButton;
    Button_E: TButton;
    Label13: TLabel;
    Mount: TTabItem;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    NumberBoxcountaz: TNumberBox;
    Numberboxcountalt: TNumberBox;
    NumberBoxspgalt: TNumberBox;
    NumberBoxspgaz: TNumberBox;
    NumberBoxspcaz: TNumberBox;
    NumberBoxspcalt: TNumberBox;
    NumberBoxspfaz: TNumberBox;
    NumberBoxspfalt: TNumberBox;
    NumberBoxspsaz: TNumberBox;
    NumberBoxspsalt: TNumberBox;
    NumberBoxrampaz: TNumberBox;
    NumberBoxrampalt: TNumberBox;
    NumberBoxbackpaz: TNumberBox;
    NumberBoxbackpalt: TNumberBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    TabItem3: TTabItem;
    Button1: TButton;
    TabItem4: TTabItem;
    TrackBar1: TTrackBar;
    GroupBox1: TGroupBox;
    Button_n: TButton;
    Label5: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Button_w: TButton;
    Memo1: TMemo;
    Label17: TLabel;
    ButtonRconf: TButton;
    Button2: TButton;
    ComboBoxEqmode: TComboBox;
    ComboBoxtrack: TComboBox;
    CheckBoxbackaz: TCheckBox;
    CheckBoxbackalt: TCheckBox;
    TabItem2: TTabItem;
    CheckBoxflip: TCheckBox;
    CheckBoxinvaz: TCheckBox;
    CheckBoxinvAlt: TCheckBox;
    NumberBoxlat: TNumberBox;
    NumberBoxlong: TNumberBox;
    NumberBoxgmtoff: TNumberBox;
    Label12: TLabel;
    Label18: TLabel;
    NumberBoxpresc: TNumberBox;
    Label19: TLabel;
    NumberBoxFMax: TNumberBox;
    NumberBoxFLow: TNumberBox;
    NumberBoxFsp: TNumberBox;
    EditSSID: TEdit;
    Editpass: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Editmask: TEdit;
    EditGateway: TEdit;
    EditDNS: TEdit;
    EditIPaddress: TEdit;
    CheckBoxOTA: TCheckBox;
    ButtonSetWest: TButton;
    ButtonSetEast: TButton;
    Park: TButton;
    ButtonHome: TButton;
    ButtonGPH: TButton;
    Buttonwifi: TButton;
    CheckBoxAP: TCheckBox;
    Buttondatetime: TButton;
    Label26: TLabel;
    Label27: TLabel;
    Buttonstar1: TButton;
    Buttonstar2: TButton;
    ButtonAlign: TButton;
    Buttonrestak: TButton;
    Label28: TLabel;
    Buttonnunchuk: TButton;
    Buttondisnunchuk: TButton;
    Bluetooth1: TBluetooth;
    Cbxpaired: TComboBox;
    Buttonpaired: TButton;
    Buttonbtconnect: TButton;
    Label29: TLabel;
    Button3: TButton;
    buttonbtp: TButton;
    LocationSensor1: TLocationSensor;
    ButtonGPS: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure ButtonConClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure buttonbtpClick(Sender: TObject);
    procedure Button_nMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Button_nMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sendstr(command: string);
    function readstr(endstr: string): string;
    procedure getcoords;
    procedure FormSaveState(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ButtonRconfClick(Sender: TObject);
    procedure ButtonwifiClick(Sender: TObject);
    procedure ButtondatetimeClick(Sender: TObject);
    procedure ButtonHomeClick(Sender: TObject);
    procedure Buttonstar1Click(Sender: TObject);
    procedure Buttonstar2Click(Sender: TObject);
    procedure ButtonAlignClick(Sender: TObject);
    procedure ButtonrestakClick(Sender: TObject);
    procedure ButtonGPHClick(Sender: TObject);
    procedure ParkClick(Sender: TObject);
    procedure ButtonSetEastClick(Sender: TObject);
    procedure ButtonSetWestClick(Sender: TObject);
    procedure ButtonnunchukClick(Sender: TObject);
    procedure ButtondisnunchukClick(Sender: TObject);
    procedure ButtonpairedClick(Sender: TObject);

    procedure ButtonbtconnectClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonGPSClick(Sender: TObject);
     private const
    LOCATION_PERMISSION = 'android.permission.ACCESS_FINE_LOCATION';
    BLUETOOTH_SCAN_PERMISSION = 'android.permission.BLUETOOTH_SCAN';
    BLUETOOTH_ADVERTISE_PERMISSION = 'android.permission.BLUETOOTH_ADVERTISE';
    BLUETOOTH_CONNECT_PERMISSION = 'android.permission.BLUETOOTH_CONNECT';

  private
    { Private declarations }
    Fsocket: Tbluetoothsocket;
    function connectbt(pdevice: string): Boolean;
  public
    { Public declarations }
  end;

var
  Esp32GoForm: TEsp32GoForm;

implementation

{$R *.fmx}
{$R *.Moto360.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

const
  UUID = '{00001101-0000-1000-8000-00805F9B34FB}';

procedure TEsp32GoForm.ButtonConClick(Sender: TObject);
var
  IPS: string;
begin
  if not IdTCPClient1.Connected then
  begin
    Timer1.Enabled := true;
    IdTCPClient1.Port := 10001;

    if CheckBoxAP.IsChecked then
      IPS := '192.168.4.1'
    else
      IPS := EditIPaddress.Text;

    IdTCPClient1.HOST := IPS;

    Label13.Text := IPS;

    // ... try to connect to Server
    try
      IdTCPClient1.Connect;
    except
      on E: Exception do
      begin
        Label1.Text := E.Message;

      end;

    end;

    if IdTCPClient1.Connected then
    begin
      Label1.Text := 'Connected';
      ButtonCon.Text := 'Disconnect';
      ButtonRconfClick(self);

    end;
  end

  else
  begin
    IdTCPClient1.Disconnect;
    // Timer1.Enabled := false;
    Label1.Text := 'Not Connected';
    ButtonCon.Text := 'Connect';
  end;

end;

procedure TEsp32GoForm.ButtonHomeClick(Sender: TObject);
begin
  sendstr(':pH#');
end;

procedure TEsp32GoForm.ButtonnunchukClick(Sender: TObject);
begin
  sendstr(':pnk1#');
end;

procedure TEsp32GoForm.ButtonpairedClick(Sender: TObject);
var
  ldevice: Tbluetoothdevice;
begin
bluetooth1.Enabled := true;
  Cbxpaired.Items.Clear;
  for ldevice in Bluetooth1.PairedDevices do
  begin
    Cbxpaired.Items.Add(ldevice.DeviceName)
  end;

end;

procedure TEsp32GoForm.ButtonRconfClick(Sender: TObject);
var
  cstring: string;
  lines: Tstringlist;
begin
  if IdTCPClient1.Connected then
    lines := Tstringlist.Create();
  begin
    Memo1.lines.Clear;
    Timer1.Enabled := false;
    sendstr(':cA#');
    repeat

      cstring := IdTCPClient1.Socket.ReadLn(#13#10);
      Memo1.lines.Add(cstring);
      cstring := stringreplace(cstring, '.', ',', [rfReplaceAll]);
      lines.Add(cstring);
    until IdTCPClient1.Socket.InputBufferIsEmpty;


    Timer1.Enabled := true;

    Label17.Text := inttostr(Memo1.lines.Count);
    NumberBoxcountaz.Text := lines[0];
    Numberboxcountalt.Text := lines[1];
    NumberBoxspgaz.Text := lines[2];
    NumberBoxspcaz.Text := lines[3];
    NumberBoxspfaz.Text := lines[4];
    NumberBoxspsaz.Text := lines[5];
    NumberBoxspgalt.Text := lines[6];
    NumberBoxspcalt.Text := lines[7];
    NumberBoxspfalt.Text := lines[8];
    NumberBoxspsalt.Text := lines[9];
    NumberBoxpresc.Text := lines[10];
    NumberBoxlat.Text := lines[11];
    NumberBoxlong.Text := lines[12];
    NumberBoxgmtoff.Text := lines[13];
    NumberBoxFMax.Text := lines[14];
    NumberBoxFLow.Text := lines[15];
    NumberBoxFsp.Text := lines[16];
    NumberBoxrampaz.Text := lines[17];
    NumberBoxrampalt.Text := lines[18];
    NumberBoxbackpaz.Text := lines[19];
    NumberBoxbackpalt.Text := lines[20];
    ComboBoxEqmode.ItemIndex := lines[21].tointeger;
    ComboBoxtrack.ItemIndex := strtoint(lines[22]);
    CheckBoxflip.IsChecked := lines[23] = '1';
    CheckBoxinvaz.IsChecked := lines[24] = '1';
    CheckBoxinvAlt.IsChecked := lines[25] = '1';

    CheckBoxbackaz.IsChecked := lines[27] = '1';
    CheckBoxbackalt.IsChecked := lines[28] = '1';

    lines.Destroy
  end;
end;

procedure TEsp32GoForm.ButtonrestakClick(Sender: TObject);
begin
  sendstr(':a3#');
end;

procedure TEsp32GoForm.ButtonSetEastClick(Sender: TObject);
begin
  sendstr(':pse#');
  sendstr(':pS#');
  Label28.Text := readstr('#');

  sendstr(#6);
  Label28.Text := Label28.Text + IdTCPClient1.Socket.readchar();
end;

procedure TEsp32GoForm.ButtonSetWestClick(Sender: TObject);
begin
  sendstr(':psw#');
  sendstr(':pS#');
  Label28.Text := readstr('#');

  sendstr(#6);
  Label28.Text := Label28.Text + IdTCPClient1.Socket.readchar();
end;

procedure TEsp32GoForm.Buttonstar1Click(Sender: TObject);
begin
  sendstr(':a1#');
end;

procedure TEsp32GoForm.Buttonstar2Click(Sender: TObject);
begin
  sendstr(':a2#');
end;

procedure TEsp32GoForm.ButtonwifiClick(Sender: TObject);
var
  sfile, sOTA: string;
begin
  sfile := ':cw' + EditSSID.Text + #13#10 + Editpass.Text + #13#10 + '#';
  sendstr(sfile);
  sleep(100);
  sOTA := CheckBoxOTA.IsChecked.tointeger.ToString;
  sfile := ':cn' + EditIPaddress.Text + #13#10 + Editmask.Text + #13#10 +
    EditGateway.Text + #13#10 + EditDNS.Text + #13#10 + sOTA + #13#10'#';
  sendstr(sfile);

end;

procedure TEsp32GoForm.Button2Click(Sender: TObject);
var
  s: string;
  I: Integer;
  lines: Tstringlist;
  bytes: Tbytes;
begin

  Label17.Text := inttostr(Memo1.lines.Count);
  { lines.add(NumberBoxcountaz.Text);
    lines.add(Numberboxcountalt.Text);
    lines.add(NumberBoxspgaz.Text);
    lines.add(NumberBoxspcaz.Text);
    lines.add(NumberBoxspfaz.Text);
    lines.add(NumberBoxspsaz.Text);
    lines.add(NumberBoxspgalt.Text);
    lines.add(NumberBoxspcalt.Text);
    lines.add(NumberBoxspfalt.Text);
    lines.add(NumberBoxspsalt.Text);
    lines.add(NumberBoxpresc.Text);
    lines.add(NumberBoxlat.Text);
    lines.add(NumberBoxlong.Text);
    lines.add(NumberBoxgmtoff.Text);
    lines.add(NumberBoxFMax.Text);
    lines.add(NumberBoxFLow.Text);
    lines.add(NumberBoxFsp.Text);
    lines.add(NumberBoxrampaz.Text);
    lines.add(NumberBoxrampalt.Text);
    lines.add(NumberBoxbackpaz.Text);
    lines.add(NumberBoxbackpalt.Text);
    lines.add(inttostr(ComboBoxEqmode.ItemIndex));
    lines.add(inttostr(ComboBoxtrack.ItemIndex));
    lines.add(CheckBoxflip.IsChecked.ToInteger.tostring);
    lines.add(CheckBoxinvaz.IsChecked.ToInteger.tostring);
    lines.add(CheckBoxinvAlt.IsChecked.ToInteger.tostring);
    lines.add('150');
    lines.add(CheckBoxbackaz.IsChecked.ToInteger.tostring);
    lines.add(CheckBoxbackalt.IsChecked .ToInteger.tostring); }

  s := ':cs';
  for I := 0 to 28 do
    s := s + Memo1.lines[I]+ #13#10;

  s := s + '#';
  sendstr(s);

end;

procedure TEsp32GoForm.Button_nMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  send: string;
begin

  case TButton(Sender).tag of
    0:
      send := ':Mn#';
    1:
      send := ':Ms#';
    2:
      send := ':Me#';
    3:
      send := ':Mw#';
    4:
      send := ':Mn#:Me#';
    5:
      send := ':Ms#:Me#';
    6:
      send := ':Ms#:Mw#';
    7:
      send := ':Mn#:Mw#';

  end;
  sendstr(send);
end;

procedure TEsp32GoForm.Button_nMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  sendsp, send: string;
  spd: cardinal;
begin

  case TButton(Sender).tag of
    0:
      send := ':Qn#';
    1:
      send := ':Qs#';
    2:
      send := ':Qe#';
    3:
      send := ':Qw#';
    4:
      send := ':Qn#:Qe#';
    5:
      send := ':Qs#:Qe#';
    6:
      send := ':Qs#:Qw#';
    7:
      send := ':Qn#:Qw#';

  end;
  sendstr(send);
end;

procedure TEsp32GoForm.ButtondatetimeClick(Sender: TObject);
var
  UTCNOW: tdatetime;
  lxtime, lxdate, response: string;
  c, d: Char;
begin
  // UTCNow := TTimeZone.Local.ToUniversalTime(Now);
  UTCNOW := now;
  DateTimeToString(lxtime, 'hh:nn:ss#', UTCNOW);

  DateTimeToString(lxdate, 'mm/dd/yy#', UTCNOW);
  // label26.text:=utcnow.NowUTC.tostring+' '+Now.tostring+'  '+TTimeZone.Local.GetUtcOffset(now).hours.ToString;
  Label26.Text := lxtime + '  ' + lxdate;
  sendstr(':SC' + lxdate);
  c := IdTCPClient1.Socket.readchar();
  if c = '1' then
    response := readstr('#');
  sendstr(':SL' + lxtime);
  d := IdTCPClient1.Socket.readchar();
  Label27.Text := response + c + 't' + d;

end;

procedure TEsp32GoForm.ButtondisnunchukClick(Sender: TObject);
begin
  sendstr(':pnk0#');
end;

procedure TEsp32GoForm.ButtonGPHClick(Sender: TObject);
begin
  sendstr(':hP#');
end;

procedure TEsp32GoForm.Button3Click(Sender: TObject);
var
  recv: string;
  bytes: Tbytes;
begin
  if (Fsocket <> nil) and (Fsocket.Connected) then
  begin
    sendstr(':GR#:GD#');
    bytes := Fsocket.readData(500);
    recv := stringof(bytes);
    Label2.Text := recv;
  end;
end;

procedure TEsp32GoForm.ButtonGPSClick(Sender: TObject);
var
 // vLocationSensor: TLocationSensor;
  vLat: Extended;
  vLng: Extended;
begin
  try
  //  LocationSensor1 := TLocationSensor.Create(Nil);
    LocationSensor1.Active := True;

    vLat := LocationSensor1.Sensor.Latitude;
    vLng := LocationSensor1.Sensor.Longitude;

    showmessage('Mi posición es: Lat=' + FloatToStr(vLat) + ' Lng=' + FloatToStr(vLat));

    LocationSensor1.Active := False;
  finally
   // FreeAndNil(vLocationSensor);
  end;
end;

procedure TEsp32GoForm.buttonbtpClick(Sender: TObject);
var
 Permissions: TArray<string>;
begin

  if TOSVersion.Check(12) then
    Permissions := [LOCATION_PERMISSION, BLUETOOTH_SCAN_PERMISSION, BLUETOOTH_ADVERTISE_PERMISSION, BLUETOOTH_CONNECT_PERMISSION]
  else
    Permissions := [LOCATION_PERMISSION];

  PermissionsService.RequestPermissions(Permissions,
    procedure(const Permissions: TClassicStringDynArray; const GrantResults: TClassicPermissionStatusDynArray)
    begin
      if ((Length(GrantResults) = 4) and (GrantResults[0] = TPermissionStatus.Granted)
                                     and (GrantResults[1] = TPermissionStatus.Granted)
                                     and (GrantResults[2] = TPermissionStatus.Granted)
                                     and (GrantResults[3] = TPermissionStatus.Granted)) or
         ((Length(GrantResults) = 1) and (GrantResults[0] = TPermissionStatus.Granted)) then
        Bluetooth1.DiscoverDevices(5000);
    end);

end;

procedure TEsp32GoForm.ButtonAlignClick(Sender: TObject);
begin
  sendstr(':a0#');
end;

procedure TEsp32GoForm.ButtonbtconnectClick(Sender: TObject);
begin
  if connectbt(Cbxpaired.Selected.Text) then
  begin
    Label29.Text := 'btconnected';
    Label1.Text := 'bluetooth connection';
  end
  else
    Label29.Text := 'bt not connected'
end;

procedure TEsp32GoForm.FormCreate(Sender: TObject);
var
  ldevice: Tbluetoothdevice;
var
  R: TBinaryReader;
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
  {bluetooth1.Enabled := true;
  Cbxpaired.Items.Clear;
  for ldevice in Bluetooth1.PairedDevices do
  begin
    Cbxpaired.Items.Add(ldevice.DeviceName)
  end;}

  SaveState.StoragePath := TPath.GetHomePath;
  if SaveState.Stream.Size > 0 then
  begin
    R := TBinaryReader.Create(SaveState.Stream);
    try
      try
        EditSSID.Text := R.ReadString;
        Editpass.Text := R.ReadString;
        EditIPaddress.Text := R.ReadString;
        Editmask.Text := R.ReadString;
        EditGateway.Text := R.ReadString;
        EditDNS.Text := R.ReadString;
        CheckBoxOTA.IsChecked := R.ReadBoolean;
        CheckBoxAP.IsChecked := R.ReadBoolean;
      except
        on E: Exception do
        begin
          Label13.Text := E.Message;;
        end;
      end;
    finally
      R.Free;
    end;

  end
  else
    // If no saved data found
    // Edit1.Text := 'Hello again';

end;

procedure TEsp32GoForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount - 1]
        then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex + 1];
        Handled := true;
      end;

    sgiRight:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex - 1];
        Handled := true;
      end;
  end;
{$ENDIF}
end;

procedure TEsp32GoForm.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  Label13.Text := (KeyChar);
end;

procedure TEsp32GoForm.FormSaveState(Sender: TObject);
var
  W: TBinaryWriter;

begin
  SaveState.StoragePath := TPath.GetHomePath;
  SaveState.Stream.Clear;
  W := TBinaryWriter.Create(SaveState.Stream);
  try
    W.Write(EditSSID.Text);
    W.Write(Editpass.Text);
    W.Write(EditIPaddress.Text);
    W.Write(Editmask.Text);
    W.Write(EditGateway.Text);
    W.Write(EditDNS.Text);
    W.Write(CheckBoxOTA.IsChecked);
    W.Write(CheckBoxAP.IsChecked);

  finally
    W.Free;
  end;

end;

procedure TEsp32GoForm.SpeedButton1Click(Sender: TObject);
var
  ctime: tdatetime;
  // ASystemTime: TSystemTime;
  UTCnowDateTime: tdatetime;
begin

  { gmtoffset := LongEditgmt.Value;
    set_offset(gmtoffset);
    sleep(20);
    GetSystemTime(ASystemTime);
    UTCnowDateTime := SystemTimeToDateTime(ASystemTime);
    ctime := UTCnow() + (gmtoffset / 24.0);

    Set_localtime(ctime);
    sleep(20);
    Set_date(ctime);
    sleep(20); }
end;

procedure TEsp32GoForm.Timer1Timer(Sender: TObject);
begin

  // if IdTCPClient1.Connected then
  getcoords;

end;

procedure TEsp32GoForm.TrackBar1Change(Sender: TObject);
var
  sendsp: string;
  spd: cardinal;

begin
  // label1.Text:=floattostr(trackbar1.Value);
  spd := trunc(TrackBar1.value);
  case spd of
    0:
      begin
        sendsp := ':RG#';
        GroupBox1.Text := 'Guide';
      end;
    1:
      begin
        sendsp := ':RC#';
        GroupBox1.Text := 'Center';
      end;
    2:
      begin
        sendsp := ':RM#';
        GroupBox1.Text := 'Find';
      end;
    3:
      begin
        sendsp := ':RS#';
        GroupBox1.Text := 'Slew';
      end;
  end;
  // if IdTCPClient1.Connected then
  sendstr(sendsp);
end;

procedure TEsp32GoForm.sendstr(command: string);
var
  bytes: Tbytes;
begin
  if IdTCPClient1.Connected then
    IdTCPClient1.Socket.Write(command)

  else
  begin
    bytes := BytesOf(command);
    if (Fsocket <> nil) and (Fsocket.Connected) then
    begin
      Fsocket.SendData(bytes);
    end;

  end;
end;

function TEsp32GoForm.readstr(endstr: string): string;
var
  bytes: Tbytes;
  s: string;
begin
  if IdTCPClient1.Connected then
    s := IdTCPClient1.Socket.ReadLn(endstr)
  else if (Fsocket <> nil) and (Fsocket.Connected) then
  begin
    Fsocket.ReceiveData(300);
    s := stringof(bytes);
  end;
  result := s;
end;

procedure TEsp32GoForm.getcoords();
var
  recv, recvde: string;
  b: byte;
  bytes: Tbytes;
  i: Integer;
begin

  if IdTCPClient1.Connected then
  begin
    while not IdTCPClient1.Socket.InputBufferIsEmpty do
      IdTCPClient1.Socket.ReadByte();

    sendstr(':GR#:GD#');

    try
      recv := readstr('#');
      recvde := readstr('#');

    except
      on E: Exception do
      begin
        Label13.Text := E.Message;

      end;

    end;
    recv := recv + ' ' + recvde;
    if recv.Length = 20 then
    begin

      recv[15] := 'º';
      recv[18] := '''';
      Label2.Text := recv;
    end;
    // Label13.Text := inttostr(ord(recvde.Chars[3]));
  end
  else if (Fsocket <> nil) and (Fsocket.Connected) then
  begin
    sendstr(':GR#:GD#');
    bytes := Fsocket.readData(300);
    for i := 0 to length(bytes) do
    recv:=recv+char(bytes[i]);
    recv:=stringreplace(recv,'#',' ',[rfignorecase]);
    recv:=stringreplace(recv,'#','',[rfignorecase]);//cv := stringof(bytes);
    Label2.Text := recv;
  end;

end;

procedure TEsp32GoForm.ParkClick(Sender: TObject);
begin
  sendstr(':Mh#');

end;

function TEsp32GoForm.connectbt(pdevice: string): Boolean;
var
  ldevice: Tbluetoothdevice;

begin
result := false;
  for ldevice in Bluetooth1.PairedDevices do
  begin

    if ldevice.DeviceName = pdevice then
    begin
      Fsocket := ldevice.CreateClientSocket(stringtoguid(UUID), false);
      if Fsocket <> nil then
      begin
        Fsocket.Connect;
        result := Fsocket.Connected

      end;

    end;

  end;
end;

end.
