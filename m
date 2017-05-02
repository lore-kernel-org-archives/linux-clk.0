Return-Path: <dcb314@hotmail.com>
From: David Binderman <dcb314@hotmail.com>
To: "emilio@elopez.com.ar" <emilio@elopez.com.ar>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
	"wens@csie.org" <wens@csie.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: linux-4.11/drivers/clk/sunxi/clk-sun9i-core.c:63]: (error) Signed
 integer overflow
Date: Tue, 2 May 2017 08:15:37 +0000
Message-ID: <HE1PR0801MB186509E9A0A1A0E5AED5FE369C170@HE1PR0801MB1865.eurprd08.prod.outlook.com>
Content-Type: multipart/alternative;
	boundary="_000_HE1PR0801MB186509E9A0A1A0E5AED5FE369C170HE1PR0801MB1865_"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

--_000_HE1PR0801MB186509E9A0A1A0E5AED5FE369C170HE1PR0801MB1865_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hello there,


Source code is


    if (n > 255)
        n =3D 255;
    else if (n < 12)
        n =3D 12;

    req->rate =3D ((24000000 * n) >> p) / (m + 1);


24e6 * 255 is about 6e9, which won't fit into a 32 bit signed int.


Regards


David Binderman


--_000_HE1PR0801MB186509E9A0A1A0E5AED5FE369C170HE1PR0801MB1865_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;" dir=3D"ltr">
<p>hello there,</p>
<p><br>
</p>
<p>Source code is</p>
<p><br>
</p>
<p></p>
<div>&nbsp;&nbsp;&nbsp; if (n &gt; 255)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n =3D 255;<br>
&nbsp;&nbsp;&nbsp; else if (n &lt; 12)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n =3D 12;<br>
<br>
&nbsp;&nbsp;&nbsp; req-&gt;rate =3D ((24000000 * n) &gt;&gt; p) / (m &#43; =
1);<br>
</div>
<p></p>
<p><br>
</p>
<p>24e6 * 255 is about 6e9, which won't fit into a 32 bit signed int.</p>
<p><br>
</p>
<p>Regards</p>
<p><br>
</p>
<p>David Binderman</p>
<p><br>
</p>
</div>
</body>
</html>

--_000_HE1PR0801MB186509E9A0A1A0E5AED5FE369C170HE1PR0801MB1865_--
