Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC70C10F14
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 11:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D62D2070B
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 11:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfqPTuJm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730031AbfJCL2B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 07:28:01 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40714 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729891AbfJCL2B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 07:28:01 -0400
Received: by mail-lf1-f65.google.com with SMTP id d17so1536604lfa.7;
        Thu, 03 Oct 2019 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DX8a7Wlt/Jyh2iSwaP1Iud+IQGHxDyI7SdlcgZ9JV7Y=;
        b=pfqPTuJmFynvCqEI3kn+T5pWyCZffPTOYirFNHFp0FbLKRR+DK3QmmtLKlMpDrUPPd
         xDHTetajrPgm4b4CMV68RYsM8qSAC49VSKGhj1fydy3VhTMYDaVVOBfLgAg3wuEA6gfZ
         K0UD09GaX5UFcOr2cWAmRqirvAgq2N2mVTtby678jD4Hp9E8bSshqX2zEnBoIfL/bdPg
         xPV2gDDNbCOE8FVjwq/1rhKsa5fsGsbL/Vb9JQ0H4xtvy3oEX1d/cKvHUv0NF2SAUZiZ
         j4SvyvLd/8+fve1rVEtIW5nvsZesjmZi9KeYZdSRLx3nn6z0tnm1O7H+ElwoA+C/se4l
         4cUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DX8a7Wlt/Jyh2iSwaP1Iud+IQGHxDyI7SdlcgZ9JV7Y=;
        b=OZOGJ6jnAlTHGR7pKVofjxt+K6rHuta0yrKgWAol/rAp3VhDFzvxjoQjHjkwjEO9DO
         K8uhq6Vsi787TuiaTLubqP/mE9/a2O4EYSEBHLRv3b41I+LEjmie6V0qw7bbUTdDcbAl
         k/tlNpzUw2mU/6R6GXfbZeNSdmFaShr2N3r0q76FTjH7QPbCy5s5XaYJKoXzb62s5nr9
         PSNY9AHv17z+nxCNocFM5YPIgfXXH97MUKmTgrKw5lhPocTozaznqSIj1YlLvsZmG/bG
         7/2lgExbhluAEbt2/WgeYa3DeWl8TqZw9nVRcMck1gzNxc9ECS6mxp9yrRpk7ruildqC
         yGew==
X-Gm-Message-State: APjAAAVib4MBsGzB5Q9jFCtDV9FJDAqg4CUocoLmHRHf4NXfy0WmES5q
        to4XtxpQayRNrIcZ3orNtO4=
X-Google-Smtp-Source: APXvYqxCzTx3UVy7LuF2MGP2yfgdzHfJL60X+llcTt9cRqi0W6LnmbkFaXU0eI545HYjmvDNlGYALQ==
X-Received: by 2002:ac2:43b8:: with SMTP id t24mr3801098lfl.24.1570102079035;
        Thu, 03 Oct 2019 04:27:59 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
        by smtp.googlemail.com with ESMTPSA id q19sm466598ljj.73.2019.10.03.04.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 04:27:58 -0700 (PDT)
Subject: Re: [PATCH 2/4] ARM: tegra: Enable PLLP bypass during Tegra124 LP1
To:     Stephen Warren <swarren@wwwdotorg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
 <20191001211346.104400-2-swarren@wwwdotorg.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <437f030b-9e20-43e5-42ce-f98430d2149b@gmail.com>
Date:   Thu, 3 Oct 2019 14:27:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191001211346.104400-2-swarren@wwwdotorg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

02.10.2019 00:13, Stephen Warren пишет:
> From: Stephen Warren <swarren@nvidia.com>
> 
> For a little over a year, U-Boot has configured the flow controller to
> perform automatic RAM re-repair on off->on power transitions of the CPU
> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
> re-repair relies on certain clocks, which the kernel must enable and
> leave running. PLLP is one of those clocks. This clock is shut down
> during LP1 in order to save power. Enable bypass (which I believe routes
> osc_div_clk, essentially the crystal clock, to the PLL output) so that
> this clock signal toggles even though the PLL is not active. This is
> required so that LP1 power mode (system suspend) operates correctly.
> 
> The bypass configuration must then be undone when resuming from LP1, so
> that all peripheral clocks run at the expected rate. Without this, many
> peripherals won't work correctly; for example, the UART baud rate would
> be incorrect.
> 
> NVIDIA's downstream kernel code only does this if not compiled for
> Tegra30, so the added code is made conditional upon the chip ID. NVIDIA's
> downstream code makes this change conditional upon the active CPU
> cluster. The upstream kernel currently doesn't support cluster switching,
> so this patch doesn't test the active CPU cluster ID.
> 
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
> index b408fa56eb89..6922dd8d3e2d 100644
> --- a/arch/arm/mach-tegra/sleep-tegra30.S
> +++ b/arch/arm/mach-tegra/sleep-tegra30.S
> @@ -370,6 +370,14 @@ _pll_m_c_x_done:
>  	pll_locked r1, r0, CLK_RESET_PLLC_BASE
>  	pll_locked r1, r0, CLK_RESET_PLLX_BASE
>  
> +	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
> +	cmp	r1, #TEGRA30
> +	beq	1f

What about T114, or does it need enabled PLLP as well?

> +	ldr	r1, [r0, #CLK_RESET_PLLP_BASE]
> +	bic	r1, r1, #(1<<31)	@ disable PllP bypass
> +	str	r1, [r0, #CLK_RESET_PLLP_BASE]
> +1:
> +
>  	mov32	r7, TEGRA_TMRUS_BASE
>  	ldr	r1, [r7]
>  	add	r1, r1, #LOCK_DELAY
> @@ -630,7 +638,10 @@ tegra30_switch_cpu_to_clk32k:
>  	str	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
>  
>  	/* disable PLLP, PLLA, PLLC and PLLX */
> +	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
> +	cmp	r1, #TEGRA30
>  	ldr	r0, [r5, #CLK_RESET_PLLP_BASE]
> +	orrne	r0, r0, #(1 << 31)	@ enable PllP bypass on fast cluster
>  	bic	r0, r0, #(1 << 30)
>  	str	r0, [r5, #CLK_RESET_PLLP_BASE]
>  	ldr	r0, [r5, #CLK_RESET_PLLA_BASE]
> 

