Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v.1] clk:clk-rockchip:-of_iomap failed to remap then abort clock initialization.
Date: Wed, 24 Aug 2016 16:56:08 +0200
Message-ID: <2854111.gibmD6ORig@diego>
In-Reply-To: <fa254e23-818c-0698-cbbc-68c983e83203@gmail.com>
References: <1471101978-1881-1-git-send-email-arvind.yadav.cs@gmail.com> <1528160.BtdbmuP27T@diego> <fa254e23-818c-0698-cbbc-68c983e83203@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Arvind,

Am Mittwoch, 24. August 2016, 19:52:45 schrieb arvind Yadav:
> yes, I am referring this code for clock control.

Please definitly do not use that old gate driver anymore!

Instead please look at the real clock drivers for specific Rockchip soc=
s in the=20
same directory.
Which Rockchip soc are you working on?


Heiko

> On Tuesday 23 August 2016 09:45 PM, Heiko St=FCbner wrote:
> > Hi Arvind,
> >=20
> > Am Samstag, 13. August 2016, 20:56:18 schrieb Arvind Yadav:
> >> -check return of 'of_iomap'.if It's falied to remap then abort.
> >>=20
> >> -Unmap a region obtained by remap. iounmap frees the mapping when =
failed
> >> to allocate the memory.
> >>=20
> >> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> >> ---
> >>=20
> >>   drivers/clk/rockchip/clk-rockchip.c | 7 ++++++-
> >=20
> > I've applied the patch, after rewording both patch subject and mess=
age
> > [0].
> >=20
> > That driver is deprecated for quite some time, see
> > Documenation/devicetree/bindings/clock/rockchip.txt - so I'm hoping=
 this
> > is
> > more of a random find and you're not actually using it?
> >=20
> >=20
> > Thanks
> > Heiko
> >=20
> > [0]
> > https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.g=
it/com
> > mit/?id=3D023a8280b8355a0aebe094299afec8d8b7b264cd
