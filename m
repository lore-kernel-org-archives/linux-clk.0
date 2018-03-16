Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35543 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753668AbeCPQ7x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Mar 2018 12:59:53 -0400
Received: by mail-wm0-f67.google.com with SMTP id 5so4283530wmh.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Mar 2018 09:59:53 -0700 (PDT)
Message-ID: <1521219591.6569.82.camel@baylibre.com>
Subject: Re: [PATCH v2 1/1] clk: meson: meson8b: add support for the NAND
 clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Cc: carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org
Date: Fri, 16 Mar 2018 17:59:51 +0100
In-Reply-To: <152121876042.70929.5606827507365233258@swboyd.mtv.corp.google.com>
References: <20180101210139.29808-1-martin.blumenstingl@googlemail.com>
         <20180101210139.29808-2-martin.blumenstingl@googlemail.com>
         <152121876042.70929.5606827507365233258@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-03-16 at 09:46 -0700, Stephen Boyd wrote:
> Quoting Martin Blumenstingl (2018-01-01 13:01:39)
> > This adds the NAND clocks (from the HHI_NAND_CLK_CNTL register) to the
> > Meson8b clock driver. There are three NAND clocks: a gate which enables
> > or disables the NAND clock, a mux and a divider (which divides the mux
> > output).
> > Unfortunately the public S805 datasheet does not document the mux
> > parents. However, the vendor kernel has a few hints for us which allows
> > us to make an educated guess about the clock parents. To do this we need
> > to have a look at set_nand_core_clk() from the vendor's NAND driver (see
> > [0]):
> > - XTAL = (4<<9) | (1<<8) | 0
> > - 160MHz = (0<<9) | (1<<8) | 3)
> > - 182MHz = (3<<9) | (1<<8) | 1)
> > - 212MHz = (1<<9) | (1<<8) | 3)
> > - 255MHz = (2<<9) | (1<<8) | 1)
> > 
> > While there is a comment for the XTAL parent (which indicates that it
> > should only be used for debugging) we have to do a bit of math for the
> > other parents: target_freq * divider = rate of parent clock
> > Bit 8 above is the enable bit, so we can ignore it here. Bits 11:9 are
> > the mux index and bits 6:0 are the 0-based divider (so we need to add
> > 1). This gives us:
> > - mux 0 (160MHz * 4) = fclk_div4 (actual rate = 637.5MHz, off by 2.5MHz)
> > - mux 1 (212MHz * 4) = fclk_div3 (actual rate = 850MHz, off by 2MHz)
> > - mux 2 (255MHz * 2) = fclk_div5 (matches exactly 510MHz)
> > - mux 3 (182MHz * 2) = fclk_div7 (actual rate = 346.3MHz, off by 0.3MHz)
> > 
> > [0] https://github.com/khadas/linux/blob/9587681285cb/drivers/amlogic/amlnf/dev/amlnf_ctrl.c#L314
> > 
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> 
> Is this patch still needed? (Leaving patch below for interested
> readers).
> 
> -Stephen

Hi Stephen,

I guess we missed it after new year's day :(

The patch looks fine to me but, following the rework of meson clocks, we'll need
to migrate the clocks inserted to our clk_regmap and change the IDs (96-98 are
used now)

Martin, I can do this rebase if you want ? As you prefer

Cheers
Jerome
