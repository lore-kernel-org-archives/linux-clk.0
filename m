Return-Path: <michael.allwright@upb.de>
MIME-Version: 1.0
In-Reply-To: <CALcgO_7+iDr6FvaUjXdRWXpTpHu8shVKS6nqQ6i9gC=9TmfBGw@mail.gmail.com>
References: <CALcgO_7+iDr6FvaUjXdRWXpTpHu8shVKS6nqQ6i9gC=9TmfBGw@mail.gmail.com>
Date: Sun, 23 Aug 2015 12:22:09 +0200
Message-ID: <CALcgO_64qS9OyNuN1UnEM85CsS_7Ygq3dDFXRFsKE-_8FfGA4g@mail.gmail.com>
Subject: Re: [RFC] Allow for gate and mux control using non-atomic GPIO
From: Michael Allwright <michael.allwright@upb.de>
To: Jyri Sarha <jsarha@ti.com>, ce3a@gmx.de, Michael Turquette <mturquette@baylibre.com>,
	sboyd@codeaurora.org, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 18 August 2015 at 17:40, Michael Allwright <michael.allwright@upb.de> wrote:
> Hi,
>
> The current implementation of clk-gpio completely ignores the use case
> where GPIO pins may be accessed over a message based bus like SPI or
> I2C. To fix this, and following the comments in clk.h, we should use
> the prepare/unprepare methods to do the work where the GPIO operation
> would be non-atomic. I propose the following UNTESTED patch (should
> apply cleanly over linux-next).
>
> From 7a21c155e561d84741ce11f0cc4c1f8c5b97d7dc Mon Sep 17 00:00:00 2001
> From: Michael Allwright <allsey87@gmail.com>
> Date: Tue, 18 Aug 2015 17:26:34 +0200
> Subject: [PATCH] Allow non-atomic GPIO ops to control gates and muxes.
>  Following the comments in clk.h, use prepare/unprepare methods to do the GPIO
>  work in cases where the specified pin can sleep

Sorry about this, but this thread needs a *BUMP*

Michael Allwright

PhD Student
Paderborn Institute for Advanced Studies in Computer Science and Engineering

University of Paderborn
Office-number 02-10
Zukunftsmeile 1
33102 Paderborn
Germany
