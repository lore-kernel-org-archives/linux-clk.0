Return-Path: <kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH 5/6] clk: bcm2835: correctly enable fractional clock support
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <87lh63jd4f.fsf@eliezer.anholt.net>
Date: Tue, 1 Mar 2016 06:52:46 +0100
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <79C68128-C4B6-4AE2-9177-6A961573F90B@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-6-git-send-email-kernel@martin.sperl.org> <87mvqj5k9r.fsf@eliezer.anholt.net> <0ED2FB7F-B112-487B-B222-08E5FAEE27F9@martin.sperl.org> <87lh63jd4f.fsf@eliezer.anholt.net>
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>


> On 01.03.2016, at 00:44, Eric Anholt <eric@anholt.net> wrote:
>=20
> Once again, trusting the docs turns out to be a bad idea.  You're =
right,
> the non-MASH clocks *do* have a bit 9 to enable fractional mode.  =
Sigh.
>=20
> So, this patch is:
>=20
> Reviewed-by: Eric Anholt <eric@anholt.net>

The only really reliable =E2=80=9Cdocs=E2=80=9D on registers I have =
found outside
of probably signing a NDA are those header files for the VC4 provided
by broadcom.=20

That is why I have taken the effort to translate those into something
much more easily readable/searchable (i.e html pages on the web).

And that is where I have =E2=80=9Cguessed=E2=80=9D all the information =
on the clock
tree structure.

The main thing that is sometimes missing from those documents is
some extra context like: what is that pllt clock with a mux of
8 parent clocks (not 4 or 16 as typical) and what do those
corresponding 4 counter really do?

See:
=
https://github.com/msperl/rpi-registers/blob/master/md/Region_CM.md#cm_pll=
tctl

Martin=
