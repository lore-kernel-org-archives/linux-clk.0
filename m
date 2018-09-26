Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3BDC43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A07B21480
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NITxWUJF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A07B21480
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbeIZQJR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 12:09:17 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46730 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbeIZQJR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 12:09:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id q4-v6so14427851otf.13
        for <linux-clk@vger.kernel.org>; Wed, 26 Sep 2018 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=md4l+5Iug9AkGGsujIhZSq8jzDsFkbZIqfYl0zS01/w=;
        b=NITxWUJFCCm2WEdqlT9G8kcHTXTZZ8Uh/T8qGog25Zxf+7fZ4HcYloCjhheCk0sNwK
         ylq1FXnBJ8i0LJxA1r5+nwVgnR5ZoSm8sO3O36IAoTvneYUGnJWhj7mTtKpnyr5pN76w
         OtK/LB6i20EzkRf67lEi6Wdlnp24dmAsuMLmyt3B6JqCheKoUURHWestN4PDL4ZDe3Ce
         GkPgL1I70QsO2sZMSQ552kGV7s7jVuCO7FRCo8Y9pYdx3qDbCYYYRXVl37E+VDVRelWU
         A+lueUSRhz43IVUOuCErAjNoL3TmHbmmgNYdGAMBKLXuc8x55VoCWu9oM7N4qe3Ph55T
         RcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=md4l+5Iug9AkGGsujIhZSq8jzDsFkbZIqfYl0zS01/w=;
        b=LgYTl91/0Z78ZECn1NfYaD+ywQ17cOaVTTosgACC5Spe/4FJ1ImqqiJ7aK3b2b50Hq
         DdKCfgIkjbPkAvcrpuj67gh0GwEe/p/EbtmzmckC2sZxaV6XCT6jAEaDa/Mo0SpPo7Dg
         Nd+lbBXikjHFq0ebQFmelb4h5FCfjekmB4rsbrdYr4ZADvhlzp6xchmdEzpzPuBT8dSw
         QIDWHK7oTm7dnETCUItE7KD5YYV9IMUttZXc3i7/+sl/nqVLbjlpbGC1IZQEjDxkejJK
         Zt412XQKtgOh8TstIB7nNj2KpG0L1TQiZVvadhM3ApBeapDTBJJ3mHA9u4JYWVoQhN4x
         Hwcw==
X-Gm-Message-State: ABuFfoj+MgS7x9sMK8lGmI8FN9JONhR5ziqsUNmJfCQZuAC+hliZ8OGR
        9lkYVaJ/Ncr21BIEvVxKpCg8+2Zyg35tJurA3kw=
X-Google-Smtp-Source: ACcGV63WYxLkQvBRGDg5K1tJTfe6xosA9XSU+i7xDp9EuvefB1pycGGNRW8WJ3eTgL+U0CHzyF0LttHwo/yEUtc1GAc=
X-Received: by 2002:a9d:12c2:: with SMTP id g60-v6mr3534520otg.174.1537955826380;
 Wed, 26 Sep 2018 02:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180721172537.15639-1-martin.blumenstingl@googlemail.com> <1532337101.26720.89.camel@baylibre.com>
In-Reply-To: <1532337101.26720.89.camel@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 26 Sep 2018 11:56:55 +0200
Message-ID:
 <CAFBinCAxB7MLK_dypQMkKD7=GeFSCN-L47Yoz3PqRssD88bZsw@mail.gmail.com>
Subject: Re: [PATCH 0/2] meson8b: add the CPU_DIV16 clock for the ARM TWD
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        carlo@caione.org, khilman@baylibre.com, sboyd@kernel.org,
        mturquette@baylibre.com, jianxin.pan@amlogic.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926095655.ufQ3R76GG6JiZw4STYIYpCpSXn74NcYfmoKIgjFfr90@z>

Hi Jerome,

On Mon, Jul 23, 2018 at 11:11 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat, 2018-07-21 at 19:25 +0200, Martin Blumenstingl wrote:
> > Carlo sent a .dts patch for the ARM TWD (timer watchdog) a long time
> > ago: [0]
> > This patch was never applied. While resurrecting it I found out (by
> > trial and error) that the TWD clock is derived from the CPU clock by
> > dividing the existing CPU clock by 16.
> > An additional hint was also given by Neil's clock measurer patch [1]
> > as the GX SoCs explicitly define a "sys_cpu_div16" clock with ID 18,
> > however old u-boot seems to call that CTS_LED_PLL_CLK. The rate of
> > this clock also matches CPU clock divided by 16 on my boards.
> >
> > It's not clear if there is an additional gate for this clock. If there
> > is then it's not documented anywhere.
> >
> >
> > [0] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/391928.html
> > [1] https://patchwork.kernel.org/patch/10504083/
> >
> > Martin Blumenstingl (2):
> >   dt-bindings: clock: meson8b: export the CPU_DIV16 clock
> >   clk: meson: meson8b: add the CPU_DIV16 clock
> >
> >  drivers/clk/meson/meson8b.c              | 12 ++++++++++++
> >  drivers/clk/meson/meson8b.h              |  2 +-
> >  include/dt-bindings/clock/meson8b-clkc.h |  1 +
> >  3 files changed, 14 insertions(+), 1 deletion(-)
> >
>
> Queued for 4.20
sorry, but I found out that this doesn't work.
I'm not sure why I assumed that this has to be a CPU_DIV16 clock but
it's most likely a "divide by 4" (more details below).
so please feel free to revert this / drop the patches until I have
more information

my test-case is:
- CPU frequency scaling is disabled
- TWD timer node is added *without* clock in .dts (it will auto-detect
the clock rate)
- modify the CPU clock in u-boot
- boot Linux

case #1: EC-100 with it's default boot settings:

[    0.000252] smp_twd: clock not found -2
[    0.000736] Calibrating local timer... 197.86MHz.

# cat /sys/kernel/debug/clk/clk_summary
                                 enable  prepare  protect
                  duty
   clock                          count    count    count        rate
 accuracy phase  cycle
---------------------------------------------------------------------------------------------
...
    sys_pll_dco                       1        1        0  1584000000
        0     0  50000
       sys_pll                        1        1        0   792000000
        0     0  50000
          cpu_in_sel                  1        1        0   792000000
        0     0  50000
             cpu_scale_out_sel        1        1        0   792000000
        0     0  50000
                cpu_clk               1        1        0   792000000
        0     0  50000
                   cpu_clk_div4       0        0        0   198000000
        0     0  50000
...


case #2: switch the parent of the cpu_in_sel clock to xtal:

m8b_m201_1G#md.l 0xC110419C 1
c110419c: 000000b1    ....
m8b_m201_1G#mw.l 0xC110419C 0xb0 1
m8b_m201_1G#md.l 0xC110419C
c110419c: 000000b0    ....

[    0.007005] smp_twd: clock not found -2
[    0.022680] Calibrating local timer... 5.98MHz.

# cat /sys/kernel/debug/clk/clk_summary
                                 enable  prepare  protect
                  duty
   clock                          count    count    count        rate
 accuracy phase  cycle
---------------------------------------------------------------------------------------------
 xtal                                 4        4        0    24000000
        0     0  50000
...
    cpu_in_sel                        1        1        0    24000000
        0     0  50000
       cpu_scale_out_sel              1        1        0    24000000
        0     0  50000
          cpu_clk                     1        1        0    24000000
        0     0  50000
             cpu_clk_div4             0        0        0     6000000
        0     0  50000
...


case #3: set cpu_scale_div to cpu_in_sel/4 and use cpu_scale_div as
parent of cpu_scale_out_sel

m8b_m201_1G#mw.l 0xC110419C 0x30 1
m8b_m201_1G#md.l 0xC110415C 1
c110415c: 800016a2    ....
m8b_m201_1G#mw.l 0xC110415C 0x802016A2 1
odroidc#md.l 0xC110415C 1
c110415c: 802016a2    .. .
m8b_m201_1G#mw.l 0xC110419C 0xbd 1

[    0.001317] smp_twd: clock not found -2
[    0.003975] Calibrating local timer... 32.93MHz.


# cat /sys/kernel/debug/clk/clk_summary
                                 enable  prepare  protect
                  duty
   clock                          count    count    count        rate
 accuracy phase  cycle
---------------------------------------------------------------------------------------------
...
    sys_pll_dco                       1        1        0  1584000000
        0     0  50000
       sys_pll                        1        1        0   792000000
        0     0  50000
          cpu_in_sel                  1        1        0   792000000
        0     0  50000
             cpu_scale_div            1        1        0   198000000
        0     0  50000
                cpu_scale_out_sel       1        1        0
198000000          0     0  50000
                   cpu_clk            1        1        0   198000000
        0     0  50000
                      cpu_clk_div4       0        0        0
49500000          0     0  50000
...

as you can see case dividing "cpu_clk" by 4 works fine in case #1 and #2
however, as soon as cpu_scale_div is involved this doesn't work
anymore: in my test-case the clock is off by 16.5MHz (which is way too
much for a timer)
I am not yet sure *why* this is though
I'll come back with a fixed patchset once I know how it works correctly


Regards
Martin
