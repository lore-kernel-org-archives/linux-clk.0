Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dianders@chromium.org, briannorris@chromium.org, huangtao@rock-chips.com, zhangqing@rock-chips.com
Subject: Re: [PATCH v3 7/7] clk: rockchip: rk3399: Add support frac mode frequencies
Date: Fri, 05 Aug 2016 15:26:54 +0200
Message-ID: <4367690.gXaPoSdE52@diego>
In-Reply-To: <57A49342.3020309@rock-chips.com>
References: <1470122401-31934-1-git-send-email-zhengxing@rock-chips.com> <1786762.HqNHoLusdi@diego> <57A49342.3020309@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 5. August 2016, 21:23:14 schrieb Xing Zheng:
> Hi Heiko,
>=20
> On 2016=E5=B9=B408=E6=9C=8805=E6=97=A5 16:48, Heiko St=C3=BCbner wrot=
e:
> > Hi Xing,
> >=20
> > Am Freitag, 5. August 2016, 10:26:57 schrieb Xing Zheng:
> >> On 2016=E5=B9=B408=E6=9C=8805=E6=97=A5 03:19, Heiko St=C3=BCbner w=
rote:
> >>> Am Dienstag, 2. August 2016, 15:22:59 schrieb Xing Zheng:
> >>>> We need to support various display resolutions for external
> >>>> display devices like HDMI/DP, the frac mode can help us to
> >>>> acquire almost any frequencies, and need higher VCOs to reduce
> >>>> clock jitters.
> >>>>=20
> >>>> Signed-off-by: Xing Zheng<zhengxing@rock-chips.com>
> >>>=20
> >>> why does this need to be a separate rate array and cannot live in=
 the
> >>> general pll rate array?
> >>>=20
> >>> The plls are general purpose, so we shouldn't limit them arbitari=
ly.
> >>=20
> >> Yes, I understand your mean. :-)
> >>=20
> >>> I currently only see some frequencies (594MHz, 297MHz, 54MHz) tha=
t are
> >>> present in both arrays but have different settings. As your patch=

> >>> description says that these settings reduce clock jitter, wouldn'=
t the
> >>> general frequencies also profit from merging these new values int=
o the
> >>> general rate array?
> >>=20
> >> and here are some of our ideas:
> >>=20
> >> "WIth the frac mode and higher VCO to reduce clock jitters" that
> >> suggestion is from IC designer.
> >> There are many and various kinds resolution and needed frequencies=
 for
> >> external disaplay devices. For example, the DP needs:
> >> 3840x2160 533250KHz
> >> 3840x2160 297000KHz
> >> 3840x2160 296703KHz
> >> 2560x1440 241500KHz
> >> 1920x1080 148500KHz
> >> 1920x1080 148352KHz
> >> 1680x1050 146250KHz
> >> 1600x900 108000KHz
> >> 1280x1024 135000KHz
> >> 1280x1024 108000KHz
> >> ... and so on
> >>=20
> >> There some frequencies must be allocated with frac mode. We separa=
te
> >> these frequencies that are only used for display (VPLL) from the g=
eneral
> >> rate table, and put them to be classified into a frac mode table, =
we can
> >> reduce the frequency of the query time, the two rate tables will n=
ot
> >> interfere with each other. Because other PLLs don't need to assgin=
 these
> >> various frequencies with frac mode.
> >=20
> > Hmm, you're adding 14 frequencies to that new table (4 or so of the=
m
> > duplicating existing frequencies). So even if the effective number =
of new
> > frequencies goes from now 10 to 20, I don't think walking that tabl=
e will
> > take an excessive time longer than now.
> >=20
> > After the patch introducing the automatic rate calculation, the rat=
e table
> > we need to walk, will even get smaller.
> >=20
> > Other components might also profit from the updated standard freque=
ncies
> > with less jitter you're introducing here.
> >=20
> > And of course there is also the possibility somebody might want to =
build
> > some rk3399 device without any graphics output at all [arm-server s=
eem to
> > be the new hype :-) ], so may want to use the vpll for something el=
se
> > completely.
> >=20
> > So I still don't see an argument why it needs to be a separate tabl=
e, as I
> > currently don't see a case were it will really hurt the other PLLs.=

> >=20
> >=20
> > Heiko
>=20
> Yes, sorry to this idea is not comprehensive. I will try to find a
> better way.
>=20
> Thanks for your comments. :-)

as I said, to me just merging the new clock rates into the existing pll=
 rate=20
array looks like it should work just fine :-)
