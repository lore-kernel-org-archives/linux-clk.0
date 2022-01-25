Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E96C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 15:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379974AbiAYPAh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 10:00:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1581058AbiAYOyi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 09:54:38 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C17C06173D
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 06:54:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id e2so4994142wra.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L4EjSQRW8FE0Hy1a1OCObXW1JPeDhbxfCUQxQfcGCdA=;
        b=PdWSH25XO3nst6j4LhWnxbuH6rcneAReUC+ulVlbs4Mn+5m+zvlBtMxnpsqbYWvNpt
         QREr+1C4LTD/cQKwvU7FvyGRsnILtoIFcP4S+OMzNhBcxv7HgVj8Jf+JEAGrOzOVsc03
         0qbP+JM2T3BVds+4LoRvEQY9TWUbDX3Kj19RLWTNnZADdPdp1hjVOC5H83Kx/KVlsg6D
         OJlqN77co5fKXAhBxX6+VyZGR+MxsIoO36/VU+uRMcS30WV4mfvD73bU8Xl5esjmOkV2
         r5RhTdqmNV+1QTjK76qxgxHwL7IN1AgD5GeeBY58Zbh9ijFPT96ny/JBAzfY0bPkzQU+
         K+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=L4EjSQRW8FE0Hy1a1OCObXW1JPeDhbxfCUQxQfcGCdA=;
        b=f117BomIbVzXJd/clGXkdS/cUvmdThup3fcQM5qgK+XfjmaFcigUyRR2XSQtgyvCw9
         earGDnHuERf4VypwawfmNbKnAN2di9jfEaQBtcK1EIKIZGEBQg3uI2LW+18FxjrDWAek
         fCNX5UXG4flemMvDqw1fE7nTtN10AJGqmClLZYxYn0GYUimhxe/DoEvuZ/JNKf9PkdHc
         e754te3HjhntHkYwaISAsJkF0j9O+GizfZqlDgopE9TkpM7j1240iHv3UuMkoOmmujv+
         5JhGB6Z2bhoVTYjtz51P/PSALeN015EH5bWSNLjsuBQ2mgyStnZrQxRFw+Px6hKf3X6y
         XZiw==
X-Gm-Message-State: AOAM531eugxKHUNGiJVrKo6fPuROfz/fUDVyr9SRQQflG9HljHVs/6BE
        Bqf3FhmBNjJE6VCPgx9krkEPuw==
X-Google-Smtp-Source: ABdhPJzumuKere4mTeyM17OgS2jGkO+i0UITKhP0vksIIJO0J6DMs4WkxBnFoLezAGiFq2bQUyIbxw==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr5117625wri.22.1643122475496;
        Tue, 25 Jan 2022 06:54:35 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:e03f:56c1:665f:b320? ([2001:861:44c0:66c0:e03f:56c1:665f:b320])
        by smtp.gmail.com with ESMTPSA id z17sm526375wmf.47.2022.01.25.06.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 06:54:34 -0800 (PST)
Subject: Re: [PATCH v10 0/4] clk: meson: add a sub EMMC clock controller
 support
To:     Liang Yang <liang.yang@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        XianWei Zhao <xianwei.zhao@amlogic.com>,
        Kelvin Zhang <kelvin.zhang@amlogic.com>,
        BiChao Zheng <bichao.zheng@amlogic.com>,
        YongHui Yu <yonghui.yu@amlogic.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220121074508.42168-1-liang.yang@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <f5a429f2-ffbc-ea03-810a-45a0f90959a2@baylibre.com>
Date:   Tue, 25 Jan 2022 15:54:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220121074508.42168-1-liang.yang@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Liang,

On 21/01/2022 08:45, Liang Yang wrote:
> This driver will add a MMC clock controller driver support.
> The original idea about adding a clock controller is during the
> discussion in the NAND driver mainline effort[1].
> 
> This driver is tested in the S400 board (AXG platform) with NAND driver.

Thanks a lot for providing a fixed and updated version of this serie.

After some chat with Jerome and Kevin, it seems the way the eMMC clock reuse
for NAND was designed nearly 4 years doesn't look accurate anymore.

Having a separate clk driver designed to replace the eMMC node when NAND is
used on the board seems over engineered.

Actually having the clock code you add in this serie _but_ directly in
the NAND looks far better, and more coherent since having Linux runtime
detection of eMMC vs NAND will never happen and even this serie required
some DT modification from the bootloader.

I'll let Jerome or Kevin add more details if they want, but I think you should resurrect
the work you pushed in [1] & [2] but:
- passing the eMMC clk registers as a third "reg" cell
- passing the same "clocks" phandle as the eMMC node
- adding the eMMC clock code in the NAND driver directly

I'm open to discussions if you consider the current approach is still superior.

Thanks,
Neil

[1] https://lore.kernel.org/r/20220106033130.37623-1-liang.yang@amlogic.com
[2] https://lore.kernel.org/r/20220106032504.23310-1-liang.yang@amlogic.com

> 
> Changes since v9 [10]
>  - use clk_parent_data instead of parent_names
> 
> Changes since v8 [9]
>  - use MESON_SCLK_ONE_BASED instead of CLK_DIVIDER_ONE_BASED
>  - use struct_size to caculate onecell_data
>  - add clk-phase-delay.h
>  - define CLK_DELAY_STEP_PS_GX and CLK_DELAY_STEP_PS_AXG
> 
> Changes since v7 [8]
>  - move meson_clk_get_phase_delay_data() from header to driver
>  - CONFIG sclk-div with COMMON_CLK_AMLOGIC instead of COMMON_CLK_AMLOGIC_AUDIO
>  - remove onecell date and ID for internal MUX clk
>  - use helper for functions for ONE_BASED in sclk-div
>  - add ONE_BASED support for duty cycle
> 
> Changes since v6 [7]:
>  - add one based support for sclk divier
>  - alloc sclk in probe for multiple instance
>  - fix coding styles
> 
> Changes since v5 [6]:
>  - remove divider ops with .init and use sclk_div instead
>  - drop CLK_DIVIDER_ROUND_CLOSEST in mux and div
>  - drop the useless type cast 
> 
> Changes since v4 [5]:
>  - use struct parm in phase delay driver
>  - remove 0 delay releted part in phase delay driver
>  - don't rebuild the parent name once again
>  - add divider ops with .init
> 
> Changes since v3 [4]:
>  - separate clk-phase-delay driver
>  - replace clk_get_rate() with clk_hw_get_rate()
>  - collect Rob's R-Y
>  - drop 'meson-' prefix from compatible string
> 
>  Changes since v2 [3]:
>  - squash dt-binding clock-id patch
>  - update license
>  - fix alignment
>  - construct a clk register helper() function
> 
> Changes since v1 [2]:
>  - implement phase clock
>  - update compatible name
>  - adjust file name
>  - divider probe() into small functions, and re-use them
> 
> [1] https://lkml.kernel.org/r/20180628090034.0637a062@xps13
> [2] https://lkml.kernel.org/r/20180703145716.31860-1-yixun.lan@amlogic.com
> [3] https://lkml.kernel.org/r/20180710163658.6175-1-yixun.lan@amlogic.com
> [4] https://lkml.kernel.org/r/20180712211244.11428-1-yixun.lan@amlogic.com
> [5] https://lkml.kernel.org/r/20180809070724.11935-4-yixun.lan@amlogic.com
> [6] https://lkml.kernel.org/r/1539839245-13793-1-git-send-email-jianxin.pan@amlogic.com
> [7] https://lkml.kernel.org/r/1541089855-19356-1-git-send-email-jianxin.pan@amlogic.com
> [8] https://lkml.kernel.org/r/1544457877-51301-1-git-send-email-jianxin.pan@amlogic.com
> [9] https://lkml.kernel.org/r/1545063850-21504-1-git-send-email-jianxin.pan@amlogic.com
> [10] https://lore.kernel.org/all/20220113115745.45826-1-liang.yang@amlogic.com/
> Liang Yang (4):
>   clk: meson: add one based divider support for sclk
>   clk: meson: add emmc sub clock phase delay driver
>   clk: meson: add DT documentation for emmc clock controller
>   clk: meson: add sub MMC clock controller driver
> 
>  .../bindings/clock/amlogic,mmc-clkc.yaml      |  64 ++++
>  drivers/clk/meson/Kconfig                     |  18 ++
>  drivers/clk/meson/Makefile                    |   2 +
>  drivers/clk/meson/clk-phase-delay.c           |  69 ++++
>  drivers/clk/meson/clk-phase-delay.h           |  20 ++
>  drivers/clk/meson/mmc-clkc.c                  | 302 ++++++++++++++++++
>  drivers/clk/meson/sclk-div.c                  |  59 ++--
>  drivers/clk/meson/sclk-div.h                  |   3 +
>  include/dt-bindings/clock/amlogic,mmc-clkc.h  |  14 +
>  9 files changed, 529 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
>  create mode 100644 drivers/clk/meson/clk-phase-delay.c
>  create mode 100644 drivers/clk/meson/clk-phase-delay.h
>  create mode 100644 drivers/clk/meson/mmc-clkc.c
>  create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h
> 

