Facter.add('domain_membership_custom') do
  confine :osfamily => :windows
  setcode do
    begin
      require 'win32ole'
      wmi = WIN32OLE.connect("winmgmts:\\\\.\\root\\cimv2")
      systemInfo = wmi.ExecQuery("SELECT * FROM Win32_ComputerSystem").each.first

      systemInfo.Domain
    rescue
    end
  end
end
