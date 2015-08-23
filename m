Return-Path: <michael.allwright@upb.de>
MIME-Version: 1.0
In-Reply-To: <55D9BC20.6020300@ti.com>
References: <CALcgO_7+iDr6FvaUjXdRWXpTpHu8shVKS6nqQ6i9gC=9TmfBGw@mail.gmail.com>
	<55D9BC20.6020300@ti.com>
Date: Sun, 23 Aug 2015 15:28:09 +0200
Message-ID: <CALcgO_7VLUntGPgXhVJrqGoYmPaJTNZWkayH+CqCOn-inzpD_g@mail.gmail.com>
Subject: Re: [RFC] Allow for gate and mux control using non-atomic GPIO
From: Michael Allwright <michael.allwright@upb.de>
To: Jyri Sarha <jsarha@ti.com>
Cc: ce3a@gmx.de, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 23 August 2015 at 14:27, Jyri Sarha <jsarha@ti.com> wrote:
> I did not have time to give this a full review and test, but there is
> atleast one comment bellow.
>
> Best regards,
> Jyri
...
> Shouldn't the .prepare .unprepare .is_prepared be assigned to *prepare() functions and leave .enable etc. as null?
>
> Does this even work, doesn't the CCF complain about sleeping in .enable() etc. callbacks?

Hi Jyri,

Yes, you are completely right, the functions were supposed to be
assigned to the .(un/is_)prepare function pointers with the enable
pointers left at NULL which the CCF will then ignore. Sleeping, as you
said, is not possible which is what what motivate this patch in the
first place.

As this was the only issue issue mentioned here, I assume that there
are no complaints regarding this approach and will post back on a
different thread with a tested patch.

All the best,


Michael Allwright

PhD Student
Paderborn Institute for Advanced Studies in Computer Science and Engineering

University of Paderborn
Office-number 02-10
Zukunftsmeile 1
33102 Paderborn
Germany
