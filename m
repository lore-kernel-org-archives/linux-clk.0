Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:35075 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753332AbdERShR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2017 14:37:17 -0400
Received: by mail-wm0-f45.google.com with SMTP id b84so211786420wmh.0
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2017 11:37:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFBinCDjysBNJLQYsvzBU7U2p7gv0Lxa+qe8f5YMn0BgUw6P0g@mail.gmail.com>
References: <CAFBinCDjysBNJLQYsvzBU7U2p7gv0Lxa+qe8f5YMn0BgUw6P0g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 May 2017 20:36:55 +0200
Message-ID: <CAFBinCDr2ocZ3J4JEvXF-W=tT8Zw-t02J09Ciiud6RTrkcEidA@mail.gmail.com>
Subject: Re: corrupt clk_core instance in clk_disable_unused_subtree (ARM
 Meson MX platform)
To: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Cc: balbes-150@yandex.ru, jbrunet@baylibre.com, narmstrong@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, May 14, 2017 at 11:20 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Hello,
>
> it seems that I am seeing some strange memory corruption on one of my
> Amlogic Meson MX (32-bit) devices.
> disclaimer: I have some patches in my tree which are not mainlined yet
> (see [0]), but cannot see that any of these patches would cause memory
> corruption of a clk_core instance.
>
> Oleg (who is CC'ed) has first reported this when testing my kernel tree: [1]
> in the meantime I have rebased all of my patches to Linus' mainline
> tree, commit 0fcc3ab23d7395f58e8ab0834e7913e2e4314a83 [3]
>
> what I am seeing is a NULL deref in clk_disable_unused_subtree, full
> log attached and can be found here: [3]
> an explanation of what seems to be going on in my own words is:
> - in line #5 of the log the internal PWM mux clock for the first PWM
> channel is being registered (everything looks good with
> clk_core=0xeddfbf80 and clk_hw=0xeddfbf30)
> - the default parent of this mux is "xtal"
> - in line #31 of the log the "disable unused clocks" cleanup starts
> and checks the first child of the "xtal" clock and seems to find
> clk_core=0xeddfbf80 *BUT* clk_hw=0x00000003
> - this doesn't seem right and a crash is pretty obvious
>
> I also attached the patch which introduces this additional logspam -
> just in case anyone wants to know what these values mean exactly.
>
> now the interesting part:
> I can reproduce this with multi_v7_defconfig and
> arch/arm/boot/dts/meson8m2-m8s.dts from my tree.
> if I leave everything as it is and *only* enable CONFIG_DEBUG_SPINLOCK
> then this crash goes away. so this *might* be a race-condition
> somewhere...
a user named "wilson2000" (since I missed you on IRC: thank you!)
pointed out on IRC that there's a memory corruption bug in v4.11 and
early v4.12 kernels which is fixed by [0] "perf/core: Avoid removing
shared pmu_context on unregister"
I have not tested this yet but this looks suspicious (so the common
clock framework may be innocent). I will report back once I had time
to test this.

> has anybody seen this crash before? I can help debugging/testing
> potential fixes/trying out various things to solve this - just let me
> know!
>
>
> Regards,
> Martin
>
>
> [0] https://github.com/xdarklight/linux/tree/meson-mx-integration-4.12-20170513
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-May/003497.html
> [2] https://github.com/torvalds/linux/commit/0fcc3ab23d7395f58e8ab0834e7913e2e4314a83
> [3] https://paste.kde.org/pbefvmqgr


[0] https://cgit.freedesktop.org/drm/drm-intel/commit/?h=drm-intel-nightly&id=73ac44749e71333bce7d2f8c0bbdc1bbc57dae1b
