Return-Path: <kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH 2/8] clk: bcm2835: add missing PLL clock divider
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <87y49hjb4l.fsf@eliezer.anholt.net>
Date: Thu, 17 Mar 2016 18:38:51 +0100
Cc: Jonathan Corbet <corbet@lwn.net>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Lee Jones <lee@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-doc@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <C5EA56E8-F1A1-453D-A421-3E29853F3127@martin.sperl.org>
References: <1456760642-2412-1-git-send-email-kernel@martin.sperl.org> <1456760642-2412-3-git-send-email-kernel@martin.sperl.org> <87y49hjb4l.fsf@eliezer.anholt.net>
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>


> On 17.03.2016, at 17:57, Eric Anholt <eric@anholt.net> wrote:
>=20
>=20
> These don't exist on the hardware as far as I've been able to find.  =
"I
> found it in a header file somewhere" is not sufficient justification =
to
> expose it.
>=20
> I'm working on getting a series of all of these reviewed and ready, so
> I'm just dropping these PLLB hunks.

Fine with that - my test shows that these are not configured by the =
firmware.

As for headers: my experience is that these are the better resource
compared to all the public available documentation=E2=80=A6

If you remember the =E2=80=9Cfrac=E2=80=9D bit discussion where you =
said:

  Once again, trusting the docs turns out to be a bad idea.  You're =
right,
  the non-MASH clocks *do* have a bit 9 to enable fractional mode.  =
Sigh.

Also my understanding is that those headers are still used by the =
firmware
developers, so I guess that these are pretty stable and well maintained
(even if the ones available are by now a bit dated).

They even contain ifdefs for some earlier versions of the chip -=20
see the dma-channels and their interrupts=E2=80=A6
I.e: BCM2708A0 which does not have the DMA channels 9 to 15

So I would not discount all those pieces of information as totally
irrelevant.
