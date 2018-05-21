def bereinigen(entry, wurzel_verz)
  File.expand_path(entry).partition(File.expand_path(wurzel_verz) + File::SEPARATOR)[2]
end

def sammle_dateien(aktuell_verz = ".", wurzel_verz = aktuell_verz)
  erg = Array.new()
  Dir.entries(aktuell_verz)
      .find_all {|entry| entry != "." && entry != ".."}
      .map {|entry| File.join(aktuell_verz, entry)}
      .each {|entry|
        if File::directory?(entry)
          erg.concat(sammle_dateien(entry, wurzel_verz))
        else
          erg <<  bereinigen(entry, wurzel_verz)
        end
      }
  return erg
end

p sammle_dateien()