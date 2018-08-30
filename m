Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728273AbeH3RNO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Aug 2018 13:13:14 -0400
MIME-Version: 1.0
References: <CGME20180829155059eucas1p16fecde00348e0a2e6707aaf2a76320be@eucas1p1.samsung.com>
 <20180829155046.29359-1-m.szyprowski@samsung.com> <20180829155046.29359-4-m.szyprowski@samsung.com>
 <CAJKOXPfP5zshtEsk81-0bM97jLYrDiW2BNg58Uf9pBz55bHZXQ@mail.gmail.com> <20180830125011eucas1p2ac6ec1898971927237cc3cb0580255b3~PqnOf7I2C1196311963eucas1p2x@eucas1p2.samsung.com>
In-Reply-To: <20180830125011eucas1p2ac6ec1898971927237cc3cb0580255b3~PqnOf7I2C1196311963eucas1p2x@eucas1p2.samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 30 Aug 2018 15:10:55 +0200
Message-ID: <CAJKOXPfFXx+sRW9MmrLKn8+uZeb=iap0PhAPKBNLatXh=UVepw@mail.gmail.com>
Subject: Re: [PATCH 03/10] clk: samsung: s3c2412: Use generic helper for
 handling suspend/resume
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
        <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, 30 Aug 2018 at 14:50, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Krzysztof,
>
> On 2018-08-30 08:42, Krzysztof Kozlowski wrote:
> > On Wed, 29 Aug 2018 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> Replace common suspend/resume handling code by generic helper.
> >> No functional change.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>   drivers/clk/samsung/clk-s3c2412.c | 43 ++-----------------------------
> >>   1 file changed, 2 insertions(+), 41 deletions(-)
> >>
> >> diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
> >> index 6bc94d3aff78..dd1159050a5a 100644
> >> --- a/drivers/clk/samsung/clk-s3c2412.c
> >> +++ b/drivers/clk/samsung/clk-s3c2412.c
> >> @@ -11,7 +11,6 @@
> >>   #include <linux/clk-provider.h>
> >>   #include <linux/of.h>
> >>   #include <linux/of_address.h>
> >> -#include <linux/syscore_ops.h>
> >>   #include <linux/reboot.h>
> >>
> >>   #include <dt-bindings/clock/s3c2412.h>
> >> @@ -29,9 +28,6 @@
> >>
> >>   static void __iomem *reg_base;
> >>
> >> -#ifdef CONFIG_PM_SLEEP
> >> -static struct samsung_clk_reg_dump *s3c2412_save;
> >> -
> >>   /*
> >>    * list of controller registers to be saved and restored during a
> >>    * suspend/resume cycle.
> >> @@ -45,42 +41,6 @@ static unsigned long s3c2412_clk_regs[] __initdata = {
> >>          CLKSRC,
> > Did you try building without PM_SLEEP? Now this will be included
> > always so you might have to mark it __maybe_unused.
>
> Nope, there is no such need, because *_regs arrays are passed to a
> samsung_clk_sleep_init() noop function not a noop marco.

Right.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
