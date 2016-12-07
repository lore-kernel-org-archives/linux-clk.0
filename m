Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vinson Lee <vlee@freedesktop.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: uniphier: Fix build with gcc-4.4.
Date: Wed, 07 Dec 2016 23:48:45 +0100
Message-ID: <13497466.7JOeCiPKAN@wuerfel>
In-Reply-To: <20161206231642.GA4388@codeaurora.org>
References: <1480725436-9628-1-git-send-email-vlee@freedesktop.org> <CAK7LNATeswNhoFsA90k=qF4Jock0ytNT-pPT6j+0b9MJFJwu9Q@mail.gmail.com> <20161206231642.GA4388@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tuesday, December 6, 2016 3:16:42 PM CET Stephen Boyd wrote:
> On 12/03, Masahiro Yamada wrote:
> > 2016-12-03 9:37 GMT+09:00 Vinson Lee <vlee@freedesktop.org>:
> > > gcc-4.4 has issues with anonymous unions in initializers.
> > >
> > >   CC      drivers/clk/uniphier/clk-uniphier-sys.o
> > > drivers/clk/uniphier/clk-uniphier-sys.c:45: error: unknown field ‘factor’ specified in initializer
> > > 
> I'll go drop all three patches and wreck Andrew's merge of this
> patch to -mm.

While the specific bug is resolved now, I'm curious about the
motivation for the first fix: Vinson, are you actually using
a seven year old compiler to build modern kernels in order
to run them on real systems, or is this for the purpose of
build testing only?

It would be good to know if there are actual requirements
for using compilers this old (or even older, as according
to the README file, we theoretically support building even
with gcc-3.2 from 2002), in case we ever want to officially
raise the minimum required versions.

I see that gcc-4.3 builds an ARM defconfig kernel 17% faster than
gcc-7.0, which may be nice for build testing, but it also produces
thousands of false-positive warnings, which makes it rather
useless for actually finding bugs in build testing.

	Arnd
