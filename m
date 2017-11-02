Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:48326 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbdKBHWb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Nov 2017 03:22:31 -0400
Received: by mail-lf0-f42.google.com with SMTP id r135so4474112lfe.5
        for <linux-clk@vger.kernel.org>; Thu, 02 Nov 2017 00:22:30 -0700 (PDT)
Received: from android-fee78d8a8fd46114.lan (78-57-212-189.static.zebra.lt. [78.57.212.189])
        by smtp.gmail.com with ESMTPSA id f14sm412182lfg.53.2017.11.02.00.22.28
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Nov 2017 00:22:29 -0700 (PDT)
Date: Thu, 02 Nov 2017 09:22:27 +0200
In-Reply-To: <24C08A61-4CBD-4890-8C7A-DEC665A04E9A@gmail.com>
References: <24C08A61-4CBD-4890-8C7A-DEC665A04E9A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH] RESEND: clk: Avoid sending high rates to downstream clocks during set_rate
To: linux-clk@vger.kernel.org
From: Modestas <montvid@gmail.com>
Message-ID: <CB50A9B9-4BAD-441D-B9B8-CACFA5B51471@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



Thanks for the information=2E As I understand there is no @ when this will=
 be upstreamed=2E My Krait device can not boot the linux kernel to login wi=
thout this patch so this patch is critical=2E Without it i just see a blank=
 screen without any dmesg info=2E=C2=A0

On November 2, 2017 9:00:03 AM GMT+02:00, Stephen Boyd <sboyd@codeaurora=
=2Eorg> wrote:

On 10/04, Linus Walleij wrote:

From: Stephen Boyd <sboyd@codeaurora=2Eorg>

If a clock is on and we call clk_set_rate() on it we may get into
a situation where the clock temporarily increases in rate
dramatically while we walk the tree and call =2Eset_rate() ops=2E For
example, consider a case where a PLL feeds into a divider=2E
Initially the divider is set to divide by 1 and the PLL is
running fairly slow (100MHz)=2E The downstream consumer of the
divider output can only handle rates =3D< 400 MHz, but the divider
can only choose between divisors of 1 and 4=2E

+-----+ +----------------+
| PLL |-->| div 1 or div 4 |---> consumer device
+-----+ +----------------+

To achieve a rate of 400MHz on the output of the divider, we
would have to set the rate of the PLL to 1=2E6 GHz and then divide
it by 4=2E The current code would set the PLL to 1=2E6GHz first while
the divider is still set to 1, thus causing the downstream
consumer of the clock to receive a few clock cycles of 1=2E6GHz
clock (far beyond it's maximum acceptable rate)=2E We should be
changing the divider first before increasing the PLL rate to
avoid this problem=2E

Therefore, set the rate of any child clocks that are increasing
in rate from their current rate so that they can increase their
dividers if necessary=2E We assume that there isn't such a thing as
minimum rate requirements=2E

Cc: Opera <montvid@gmail=2Ecom>
Cc: John Stultz <john=2Estultz@linaro=2Eorg>
Signed-off-by: Stephen Boyd <sboyd@codeaurora=2Eorg>
---
Stephen: just wanted to check what's up with this patch=2E
When I apply it on my kernel I get graphics on the Nexus7,
when I don't, I don't=2E

OpenWRT has started to carry the patch in their tree I noticed=2E
I found it in John Stultz patch stack=2E

Is there some similar patch floating in some other series, is
it fundamentally wrong or something else?

Just wanted to reboot the discussion so we know where this is
standing=2E


This patch wants to go away and be replaced with coordinated clk
rates code=2E So far, nothing has appeared for that though, so this
problem is stuck in limbo, blocking Krait CPUfreq=2E

I have no idea why it matters for your Nexus7 graphics stuff=2E As
far as I know the GPU clk on Nexus7 is a plain old dynamic rcg
that can switch rates glitch free and we don't do anything odd
like reprogramming the parent PLL of the rcg to use faster rates,
which is mostly what this patch is for=2E

I wrote this patch for Krait CPUfreq originally=2E In that case we
reprogram PLLs higher up in tree and then have to adjust dividers
below that and doing that in the wrong order causes high
frequencies to come down the tree into the CPU that we can't turn
off=2E

I suspect OpenWRT has pulled in the patch for Krait CPUfreq=2E It
could be that you also need it for that=2E Or it could be that odd
line where we don't look at the result of clk_recalc, and just
blast in the calculated new rate into core->rate somehow fixes
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
