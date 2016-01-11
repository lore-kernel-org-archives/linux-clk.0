Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Martin Sperl <kernel@martin.sperl.org>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Russell King <linux@arm.linux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Remi Pommarel <repk@triplefau.lt>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Reichl <hias@horus.com>, lFlorian Meier <florian.meier@koalo.de>
Subject: Re: [PATCH 2/5] clk: bcm2835: enable management of PCM clock
Date: Mon, 11 Jan 2016 14:38:03 +0100
Message-ID: <4412078.STjb1rKkbV@wuerfel>
In-Reply-To: <39E8C95F-C7DC-46C3-B29A-93A865485942@martin.sperl.org>
References: <1452331558-2520-1-git-send-email-kernel@martin.sperl.org> <20160110115858.GV6588@sirena.org.uk> <39E8C95F-C7DC-46C3-B29A-93A865485942@martin.sperl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Sunday 10 January 2016 13:17:17 Martin Sperl wrote:
>=20
> What you propose is a major change to the clock framework, so I would=

> hope that Eric (the original author of this clock-driver) would addre=
ss
> it.
>=20
> Maybe someone has a better idea for a pattern to use to achieve=20
> the required while maintaining =E2=80=9Csynchronization=E2=80=9D betw=
een defines
> inside the dt-binding and the driver.

It's funny to look at the register list:

#define CM_VPUCTL               0x008
#define CM_VPUDIV               0x00c
#define CM_SYSCTL               0x010
#define CM_SYSDIV               0x014
#define CM_PERIACTL             0x018
#define CM_PERIADIV             0x01c
#define CM_PERIICTL             0x020
#define CM_PERIIDIV             0x024
#define CM_H264CTL              0x028
#define CM_H264DIV              0x02c

This one seems completely regular, there is always a pair of CTL and DI=
V
registers, so I would have guessed that we could just take the index
of that to completely avoid the need for the header file and just have
a lookup table of each index.

I can see two possible ways forward:

a) deprecate the existing binding and write a new simpler driver to
   replace it with one that does not need the header. We probably need
   to keep both drivers around indefinitely though to deal with people
   that have their own dtb files, so this is a bit awkward.

b) look at all the holes in the table and define new numbers for them
   now, then remove the count as the driver can simply hardcode the
   maximum number as it knows it will never change.

=09Arnd
