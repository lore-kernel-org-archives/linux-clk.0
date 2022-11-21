Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA87C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 20:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbiKUUNS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 15:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbiKUUNQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 15:13:16 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3575C6584D
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 12:13:14 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so9651283wms.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 12:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaJml6B45GINP8nvpvWNlH6+dLeFFe+BHZD8DKIginQ=;
        b=v+X7X/u9lJ/H+xBNZXa8t/6nqQ3v+jSAJmIroCZMGbv75Sf7M1btDkn0SQKkzegIU8
         cmfR9aKFMNrn4fGGNc+l7h9+pSFoU7PKVxuimUzmNCBOPZCTRBT6kJcKvxKixUwIWwUj
         N1TQoOUG+v7qt0vQPGwoUi7GBVJ3gLKiKHt5CpwFZjud8qLO9jmLCcrFMVFJbf62EQko
         Wg3+3Dw8uSSQB3/yZvS5E67kwqcxSTuQbnQb7IGXto63qByYSgx6Aw6HGAlFlM4xiRTk
         ty0C1gueGzafw1Pj7wEUCrwueHi54xUPhoiZ/k1qRUYdRXoefEPCugJq5mAfOTbHZfS4
         rH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaJml6B45GINP8nvpvWNlH6+dLeFFe+BHZD8DKIginQ=;
        b=g75oXRD+jwQ0q3wp/aTbfksJTSHSCftgAovXG91RnZsciiT6GHXKXcIG8w2fTIjd6m
         CsgD6MTVCi0R9nkp2+DEk21dBXogHVgN4Ch5el8XBv7rBuIBCvWjUTsQ4zDpev2jbbYu
         m0hdotqJxodylxZHEWo4BKgdPW/kKRDvVx+myr0vlRe+AWd5Q9X1o+0tgJ2UXga5QSJl
         hQozEjREok1E/bTm3JV2CNXVm5YORWilD+5XuGpkazktpnms09kefGbihnUr4+0Y3nSC
         pBVQkFijQM8aU+Jlo6vB7ubvqd0AOApwqyc5gTemTL4A/VpGZoRtKZvuuuWpiX2BQrLN
         mSaA==
X-Gm-Message-State: ANoB5pmbOk+MkIrp+Z9bKyMK1pbYelVlIEW3DoYfmP/RHoZiSaqbpwk5
        QnhN21VBkpfUWc1qgayb29GcLA==
X-Google-Smtp-Source: AA0mqf6RBlJyCNs6T/UJivikFhLC8pbMTe7ir2MDgF84bzycAp/GDrV5vndGJXD/KxzgYxXwoA6uEg==
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id y18-20020a1c4b12000000b003cf90de7724mr17577759wma.18.1669061592691;
        Mon, 21 Nov 2022 12:13:12 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id c20-20020a7bc854000000b003b476cabf1csm14733865wml.26.2022.11.21.12.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:13:12 -0800 (PST)
Date:   Mon, 21 Nov 2022 22:13:10 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Peng Fan <peng.fan@nxp.com>
Cc:     linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        michael@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: imx: replace osc_hdmi with dummy
Message-ID: <Y3vb1r8G+B8n3T+A@linaro.org>
References: <20221117113637.1978703-1-dario.binacchi@amarulasolutions.com>
 <20221117113637.1978703-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117113637.1978703-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-17 12:36:34, Dario Binacchi wrote:
> There is no occurrence of the hdmi oscillator in the reference manual
> (document IMX8MNRM Rev 2, 07/2022). Further, if we consider the indexes
> 76-81 and 134 of the "Clock Root" table of chapter 5 of the RM, there is
> no entry for the source select bits 101b, which is the setting referenced
> by "osc_hdmi".
> Fix by renaming "osc_hdmi" with "dummy", a clock which has already been
> used for missing source select bits.
> 
> Tested on the BSH SystemMaster (SMM) S2 board.
> 
> Fixes: 96d6392b54dbb ("clk: imx: Add support for i.MX8MN clock driver")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I don't think this is correct. It might even break the EVKs HDMI
support.

Peng, can you please confirm ?

> ---
> 
> (no changes since v1)
> 
>  drivers/clk/imx/clk-imx8mn.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index 72f9563a0ff6..0fae97e61e2c 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -108,27 +108,27 @@ static const char * const imx8mn_disp_pixel_sels[] = {"osc_24m", "video_pll1_out
>  						      "sys_pll3_out", "clk_ext4", };
>  
>  static const char * const imx8mn_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
> -						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
> +						"video_pll1_out", "sys_pll1_133m", "dummy",
>  						"clk_ext3", "clk_ext4", };
>  
>  static const char * const imx8mn_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
> -						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
> +						"video_pll1_out", "sys_pll1_133m", "dummy",
>  						"clk_ext3", "clk_ext4", };
>  
>  static const char * const imx8mn_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
> -						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
> +						"video_pll1_out", "sys_pll1_133m", "dummy",
>  						"clk_ext2", "clk_ext3", };
>  
>  static const char * const imx8mn_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
> -						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
> +						"video_pll1_out", "sys_pll1_133m", "dummy",
>  						"clk_ext3", "clk_ext4", };
>  
>  static const char * const imx8mn_sai7_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
> -						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
> +						"video_pll1_out", "sys_pll1_133m", "dummy",
>  						"clk_ext3", "clk_ext4", };
>  
>  static const char * const imx8mn_spdif1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
> -						  "video_pll1_out", "sys_pll1_133m", "osc_hdmi",
> +						  "video_pll1_out", "sys_pll1_133m", "dummy",
>  						  "clk_ext2", "clk_ext3", };
>  
>  static const char * const imx8mn_enet_ref_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_50m",
> -- 
> 2.32.0
> 
