{ lib
, fetchPypi
, buildPythonPackage
, pythonOlder
}:

buildPythonPackage rec {
  pname = "sabyenc3";
  version = "5.1.1";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-muqJCn5FcSp5KNZqfW433NCOxfj1DvFvlZPClmNkPR0=";
  };

  # Tests are not included in pypi distribution
  doCheck = false;

  pythonImportsCheck = [
    "sabyenc3"
  ];

  meta = with lib; {
    description = "yEnc Decoding for Python 3";
    homepage = "https://github.com/sabnzbd/sabyenc/";
    license = licenses.lgpl3Plus;
    maintainers = with maintainers; [ lovek323 ];
  };
}
