Return-Path: <SRS0=Wk/U=7Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13F3C433E0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 13:13:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C926020738
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 13:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B+sJbp19"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgFCNNk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jun 2020 09:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgFCNNk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jun 2020 09:13:40 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BBDC08C5C1
        for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2020 06:13:39 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k26so2009968wmi.4
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2020 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YvTYA3i3ql71PlM8AImNAHj0MEK/O19mMWzQp9IXa1c=;
        b=B+sJbp19CMkL1IePV7SRjLL3NuueuIDnhgcTjsWMypxSEFEsr4Xi3kdwOgDaCnhtja
         v29EADJmF0KGTZpbhsDR3QCgYXtMEc+HiHQ6Wn4GSp6Bbh3D2zyfB1Ah9AaTYU5/wFSv
         uO4p5rj3+oMPLRlfhLADZ8bsB4BoiRx0kAKBS9fHGAVJ/q5UqIZOzOqTSWvV/ZytASMH
         06f4JyIz/jAyxn5a1WoqF9OWvMLLOeAzMm5aAI19ioVk8O5JEYxbFFksq5eCtWkcD7AJ
         GDEfI7umcefJunD1gNX8h/Mn+DQ/JzAmVulGKhFhb9DmnjcdaYGG7smoXTBZPlGdmA/o
         l/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YvTYA3i3ql71PlM8AImNAHj0MEK/O19mMWzQp9IXa1c=;
        b=BBf5HGpeZCbyzDo5uERnNG7iqHF6bdcBHbpL7PcKDZORu/eT5eliryIPqCIdxZuYiK
         QyWrxE7P0T4C29lZIrjd7m5a2/vew3F4vUSx+GjWissq+TmC1b8EONLFBDaZ6+qYoOhe
         5FdWbQZZk4Va9k/72lC3nAOgmaSobtSn4An829ADHwx75dsN1R9UyoFUK1VBndsxkLSH
         BEsmiJBTEG5YSCYw4Qu3G4h0whX4zyNj79bU1Roj3RvCWRUj6zFJ2XPOkJj2f6PbYMQY
         CL1NINyURjjjntMEAx7GxbcQFadhPEwZSHZaGs0i24ZePhiKBa/zO0YZXC+k8DKIHZOK
         YuyA==
X-Gm-Message-State: AOAM530hLBO3Bj1HLQpTHRMVLYIJm7A62JlTIGTYvm04307m1PlGCMdZ
        Qgo+ifpd9Gionut9ZxKeLekTxQ==
X-Google-Smtp-Source: ABdhPJz+8uZwZ5cW2ShXPRloMcUIcKMg45z3XnlS1ugHLPn7vS7DyOPoTzg6JGlGZfSiZeZmIvoBFQ==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr8478525wmc.142.1591190018583;
        Wed, 03 Jun 2020 06:13:38 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id l204sm3103888wmf.19.2020.06.03.06.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 06:13:37 -0700 (PDT)
Date:   Wed, 3 Jun 2020 15:13:35 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
Message-ID: <20200603131335.GA3597@Red>
References: <20200603111923.3545261-1-thierry.reding@gmail.com>
 <20200603111923.3545261-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603111923.3545261-2-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 03, 2020 at 01:19:23PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> added checks to avoid enabling PLLs that have already been enabled by
> the bootloader. However, the PLL_E configuration inherited from the
> bootloader isn't necessarily the one that is needed for the kernel.
> 
> This can cause SATA to fail like this:
> 
>     [    5.310270] phy phy-sata.6: phy poweron failed --> -110
>     [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
>     [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> 
> Fix this by always programming the PLL_E. This ensures that any mis-
> configuration by the bootloader will be overwritten by the kernel.
> 
> Fixes: bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> Reported-by: LABBE Corentin <clabbe@baylibre.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 583d2ac61e9e..b2d39a66f0fa 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1601,9 +1601,6 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
>  	unsigned long flags = 0;
>  	unsigned long input_rate;
>  
> -	if (clk_pll_is_enabled(hw))
> -		return 0;
> -
>  	input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
>  
>  	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
> -- 
> 2.24.1
> 

Tested-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
