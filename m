Return-Path: <kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH 2/2] clk: bcm2835: expose current divider, parent and mash via debugfs
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <87h9gr5jt3.fsf@eliezer.anholt.net>
Date: Mon, 29 Feb 2016 22:11:19 +0100
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <058897BC-1090-4171-B239-D2A289F1D626@martin.sperl.org>
References: <1456755616-2472-1-git-send-email-kernel@martin.sperl.org> <1456755616-2472-3-git-send-email-kernel@martin.sperl.org> <87h9gr5jt3.fsf@eliezer.anholt.net>
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>


> On 29.02.2016, at 21:43, Eric Anholt <eric@anholt.net> wrote:
>=20
> kernel@martin.sperl.org writes:
>=20
>> From: Martin Sperl <kernel@martin.sperl.org>
>>=20
>> For each clock expose the following values via debugfs:
>> * current_parent - the currently selected parent
>> * current_divi - the integer portion of the currently set divider
>> * current_divf - the fractional portion of the currently set divider
>> * current_frac - the current frac/mash settings for the divider
>=20
> current_parent can already be found through /debug/clk/clk_summary =
quite
> nicely I think.  If we wanted a per-clock parent file, that seems like
> something the core ought to be doing.
>=20
> current_frac is looking at a bit that doesn't exist for non-MASH =
clocks.
>=20
> divi/divf are OK, I guess, but don't seem particularly useful given =
the
> raw register output already.  A cooked floating point point divider
> debugfs entry would be nice, but I don't know if we can do that.

The reason I had those is because I wanted to allow people to
see quickly what is the parent clock and what is the used=20
parent and divider=E2=80=A6

While discussing with the PCM/I2s people they were always concerned
about those details - so I needed to provide them with a way to access
those things easily. And explaining to them the register format was -
for me - out of the question.

Especially the mapping of =E2=80=9Cid=E2=80=9D to real parent was a bit =
of a pain.

What do you mean by cooked? Something like: "33+27/4096=E2=80=9D?

Martin=
