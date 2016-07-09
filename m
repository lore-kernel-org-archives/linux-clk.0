Return-Path: <narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20160707091844.196a7930@endymion>
References: <20160707091844.196a7930@endymion>
Date: Sat, 9 Jul 2016 23:08:34 +0200
Message-ID: <CAA3gFWvv7U_Q3W2LdnFnyq+V0ciSRuaFxDLGjMrgFJQHgfseQQ@mail.gmail.com>
Subject: Re: [PATCH] clk: oxnas: Add hardware dependencies
From: Neil Armstrong <narmstrong@baylibre.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Content-Type: multipart/alternative; boundary=001a11406d2a75112805373a52e6
List-ID: <linux-clk.vger.kernel.org>

--001a11406d2a75112805373a52e6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le jeudi 7 juillet 2016, Jean Delvare <jdelvare@suse.de> a =C3=A9crit :

> The clk-oxnas driver is specific to its architecture, so do not
> propose it on other architectures, unless build-testing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de <javascript:;>>
> Cc: Neil Armstrong <narmstrong@baylibre.com <javascript:;>>
> Cc: Stephen Boyd <sboyd@codeaurora.org <javascript:;>>
> ---
>  drivers/clk/Kconfig |    1 +
>  1 file changed, 1 insertion(+)


Acked-by: Neil Armstrong <narmstrong@baylibre.com>


--=20
Neil Armstrong
Embedded Linux Software Engineer
BayLibre - At the Heart of Embedded Linux
www.baylibre.com

--001a11406d2a75112805373a52e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le=C2=A0jeudi 7 juillet 2016, Jean Delvare &lt;<a href=3D"mailto:jdelvare@s=
use.de">jdelvare@suse.de</a>&gt; a =C3=A9crit=C2=A0:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">The clk-oxnas driver is specific to its architecture, so do n=
ot<br>
propose it on other architectures, unless build-testing.<br>
<br>
Signed-off-by: Jean Delvare &lt;<a href=3D"javascript:;" onclick=3D"_e(even=
t, &#39;cvml&#39;, &#39;jdelvare@suse.de&#39;)">jdelvare@suse.de</a>&gt;<br=
>
Cc: Neil Armstrong &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39;c=
vml&#39;, &#39;narmstrong@baylibre.com&#39;)">narmstrong@baylibre.com</a>&g=
t;<br>
Cc: Stephen Boyd &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvm=
l&#39;, &#39;sboyd@codeaurora.org&#39;)">sboyd@codeaurora.org</a>&gt;<br>
---<br>
=C2=A0drivers/clk/Kconfig |=C2=A0 =C2=A0 1 +<br>
=C2=A01 file changed, 1 insertion(+)</blockquote><div><br></div><div>Acked-=
by: Neil Armstrong &lt;<a href=3D"mailto:narmstrong@baylibre.com">narmstron=
g@baylibre.com</a>&gt;</div><br><br>-- <br><div dir=3D"ltr"><div><div>Neil =
Armstrong<br></div><div>Embedded Linux Software Engineer<br></div>BayLibre =
- At the Heart of Embedded Linux<br></div><a href=3D"http://www.baylibre.co=
m" target=3D"_blank">www.baylibre.com</a><br></div><br>

--001a11406d2a75112805373a52e6--
