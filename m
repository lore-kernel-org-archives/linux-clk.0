Return-Path: <zhengxing@rock-chips.com>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-10537173-9248-455C-BCE7-951783D30B01
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 4/8] clk: rockchip: add new pll-type for rk3036 and similar socs
From: Xing Zheng <zhengxing@rock-chips.com>
In-Reply-To: <1474048.ydSsx6D3zg@diego>
Date: Sat, 24 Oct 2015 21:19:51 +0800
Cc: linux-rockchip@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <35318EAB-055B-48BE-9DF6-62CB92CFEE37@rock-chips.com>
References: <1445682629-21632-1-git-send-email-zhengxing@rock-chips.com> <1445682629-21632-5-git-send-email-zhengxing@rock-chips.com> <1474048.ydSsx6D3zg@diego>
To: =?GB2312?Q?Heiko_St=A8=B9bner?= <heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>


--Apple-Mail-10537173-9248-455C-BCE7-951783D30B01
Content-Type: text/plain;
	charset=gb2312
Content-Transfer-Encoding: quoted-printable


I'm sorry I ignored this, I'll fix it soon.

Thanks.

> =D4=DA 2015=C4=EA10=D4=C224=C8=D5=A3=AC19:10=A3=ACHeiko St=A8=B9bner <heik=
o@sntech.de> =D0=B4=B5=C0=A3=BA
>=20
> Hi,
>=20
> Am Samstag, 24. Oktober 2015, 18:30:25 schrieb Xing Zheng:
>> The rk3036's pll and clock are different with base on the rk3066(rk3188,
>> rk3288, rk3368 use it), there are different adjust foctors and control
>> registers, so these should be independent and separate from the series
>> of rk3066s.
>>=20
>> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>=20
>> +static void rockchip_rk3036_pll_init(struct clk_hw *hw)
>> +{
>=20
> In the previous version, Stephen requested that we don't use regular clock=

> APIs in the init-callback. I did a modification for the already present pl=
l-
> type in [0], which got already accepted. So you should probably also modif=
y
> your pll-type in this fashion :-) .
>=20
> Oh and I guess patches 3 and 4 should switch places ... adding the pll-typ=
e
> before the code in the clock-controller using it.
>=20
>=20
> Heiko
>=20
>=20
> [0] https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/commit/?h=3D=
clk-next&id=3D8334c0e7b983fb27e0d8788901e9621d1946ba93
>=20
>=20
>=20

--Apple-Mail-10537173-9248-455C-BCE7-951783D30B01
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><br><div class=3D"text-wrap" style=3D"=
min-height: 18px;"><div class=3D"translation" style=3D"padding-right: 32px; d=
irection: ltr;"><span style=3D"background-color: rgba(255, 255, 255, 0);">I'=
m sorry I ignored this, I'll fix it soon.</span></div><div class=3D"translat=
ion" style=3D"padding-right: 32px; direction: ltr;"><span style=3D"backgroun=
d-color: rgba(255, 255, 255, 0);"><br></span></div><div class=3D"translation=
" style=3D"padding-right: 32px; direction: ltr;"><span style=3D"background-c=
olor: rgba(255, 255, 255, 0);">Thanks.</span></div></div></div><div><div><br=
></div>=E5=9C=A8 2015=E5=B9=B410=E6=9C=8824=E6=97=A5=EF=BC=8C19:10=EF=BC=8CH=
eiko St=C3=BCbner &lt;<a href=3D"mailto:heiko@sntech.de">heiko@sntech.de</a>=
&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><br></div><blockquote type=3D"cite"><div=
><span>Hi,</span><br><span></span><br><span>Am Samstag, 24. Oktober 2015, 18=
:30:25 schrieb Xing Zheng:</span><br><blockquote type=3D"cite"><span>The rk3=
036's pll and clock are different with base on the rk3066(rk3188,</span><br>=
</blockquote><blockquote type=3D"cite"><span>rk3288, rk3368 use it), there a=
re different adjust foctors and control</span><br></blockquote><blockquote t=
ype=3D"cite"><span>registers, so these should be independent and separate fr=
om the series</span><br></blockquote><blockquote type=3D"cite"><span>of rk30=
66s.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blo=
ckquote><blockquote type=3D"cite"><span>Signed-off-by: Xing Zheng &lt;<a hre=
f=3D"mailto:zhengxing@rock-chips.com">zhengxing@rock-chips.com</a>&gt;</span=
><br></blockquote><blockquote type=3D"cite"><span>Reviewed-by: Heiko Stuebne=
r &lt;<a href=3D"mailto:heiko@sntech.de">heiko@sntech.de</a>&gt;</span><br><=
/blockquote><blockquote type=3D"cite"><span>---</span><br></blockquote><bloc=
kquote type=3D"cite"><span></span><br></blockquote><span></span><br><blockqu=
ote type=3D"cite"><span>+static void rockchip_rk3036_pll_init(struct clk_hw *=
hw)</span><br></blockquote><blockquote type=3D"cite"><span>+{</span><br></bl=
ockquote><span></span><br><span>In the previous version, Stephen requested t=
hat we don't use regular clock</span><br><span>APIs in the init-callback. I d=
id a modification for the already present pll-</span><br><span>type in [0], w=
hich got already accepted. So you should probably also modify</span><br><spa=
n>your pll-type in this fashion :-) .</span><br><span></span><br><span>Oh an=
d I guess patches 3 and 4 should switch places ... adding the pll-type</span=
><br><span>before the code in the clock-controller using it.</span><br><span=
></span><br><span></span><br><span>Heiko</span><br><span></span><br><span></=
span><br><span>[0] <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/c=
lk/linux.git/commit/?h=3Dclk-next&amp;id=3D8334c0e7b983fb27e0d8788901e9621d1=
946ba93">https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/commit/?=
h=3Dclk-next&amp;id=3D8334c0e7b983fb27e0d8788901e9621d1946ba93</a></span><br=
><span></span><br><span></span><br><span></span><br></div></blockquote></bod=
y></html>=

--Apple-Mail-10537173-9248-455C-BCE7-951783D30B01--
