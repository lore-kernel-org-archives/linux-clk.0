Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABDA1DE3A9
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936404; cv=none; b=bb8jKEeXyqyrM+WApXDkjhCV3aQ5KH97cNudpA81ddnrVecc6mdFN7pV44ydOQezxLWB2okHuDxVDh8hc+u3bDaqF2jClaT0vRRT+FVpPJVk73QN4nL6rfd9DvQXSq7HK33rnyJZrCf+PL0gbceY/+DWF5+tzh20L2Oh73mdTHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936404; c=relaxed/simple;
	bh=IZxCC/20iwP/7bKPshvoeShLuu3TwAqQL3G2CrRUJqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBJe8TmUTB0Ka4uXIxaozr7b8jLM/prNlA6HdIKer3feWJYYf5d4d0uQGAiyv6oVAKC2B7UgvR6DZCleuGsTY2N4nD5pEo/CJ5f2odQmbaOiPrG0EXM+wpKjyS05wLcM2WIVcK6J02i+l0uwyCpVf0zm7OEVY2NUnGz2FaalwZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=RkFTJSix; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="RkFTJSix"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21654fdd5daso32945195ad.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 09:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1733936402; x=1734541202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcWqO7y57cWM6CWwmLstYLccTGjvJS+PAY2Pr1FYpjA=;
        b=RkFTJSixL7Tf0fU5HCVAKDkLBsLl45b1Mi8zY0oxvMZcDu/BqNUaEVtQyfg+mPsgTG
         Jx41LgdeDDNf6Xop73cLHuY+fQTI0h2M9apZVCtRu7pq+glKn+rA547GsoZi7e6tJSbt
         y290IDRucG5vFtgVi1VtCNW+VsfMD3V4NLPr1jb9wP09zFhkj1cA8Fk6OTj4Yf+9UznT
         Pc03CCMQ7fLT91pgPRwUhyaK98ERTP4OIjES9lGb2djEemDDXGGJregYFCRknJrQc7eX
         nEUvPs8ToukG+OWRSinZBlK0Qx7uV954oz3VQ0LyIL00Aykgz9tFZQNTK7kTo7vSZ49e
         KbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936402; x=1734541202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcWqO7y57cWM6CWwmLstYLccTGjvJS+PAY2Pr1FYpjA=;
        b=cTnZ1e6vi7JWdILIUlAm/Z/vFa6JRcitGhCq3pRla6q5QTVvKNmUPKfl+EcHxa9Jam
         RfC8nvV9/y/7Rhc00dRNQMB/Jz2J1B6oHTPvPJdzCBfZYpNZYqL9h+aXlqGcVln+IVeO
         vKOt7dlvXmqdWBgilildalw2+HdM6if1x+A0QOatgC64uJCFQfVJVGAqOYgz6Cu95qO0
         joaunSTLvaTDFcIJ9P7n6Ezg810WgE3ILub7H8QU+RtDAO/WRdrkFtJeeHv0hW+BFLLA
         bYquF/QpK/TsHHFZmlf5ogqkNM7wBmxrntFmIXBtvXFusWzLIwGns+2M/dvPRcyUNEap
         ZraA==
X-Forwarded-Encrypted: i=1; AJvYcCWP2Kmb8PpQ2Lf3o/F656N+0BQ0uXR05X8CZ5KXLXwQsLfsFHNM24GD3EP7iBRsvoaDdhPZCwlteII=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrXVs9EgRe9c1b/uCuly1Q0Si+pmdIEMW7PokHX+5RWpB2M0D
	jX/h3/8LrC467gLLY8dPUk/Ucy3MpDPXHqJodxIEOXNyKYfimrBuCr5gEiJlwz8=
X-Gm-Gg: ASbGncsn/1MmbdGGGWzMAs2tLn1VbHF5hdgciMcR+nDKivDv406bib5YmcnXgsbrEM2
	CmnSKSDK8gylJ8lyNXwsPG1//rKvyqfaErx1/mMbYTPMhMgx1+8tdznJaBmieGY1phVeCQpz8Ry
	V5URVaph/AL0HDUKjFEOBDrkTq/ZSM2sHe0shPcTy5CJCqxeDL+b/TrareZfeyA4GRnti+BolJ2
	J4pEnfv9VQWJqCwRpofSYsWHV4Uts/Lj4lpJEu8s618X17BGuBtKZK9MaEtwxwpTZ8wCcT4xVm2
	SA==
X-Google-Smtp-Source: AGHT+IHKMDJy+8aMTo0L9V3kptUu4ExSspBRWYnaTTDSkbDRcqUrBQ6wSExEs1ilCcg4ibGX1mWAlw==
X-Received: by 2002:a17:902:e74d:b0:216:4b66:1f1f with SMTP id d9443c01a7336-2178aee74e6mr7394085ad.54.1733936401569;
        Wed, 11 Dec 2024 09:00:01 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2166ef8b8d7sm35272785ad.67.2024.12.11.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 09:00:01 -0800 (PST)
Date: Wed, 11 Dec 2024 08:59:59 -0800
From: Drew Fustini <dfustini@tenstorrent.com>
To: bigunclemax@gmail.com
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yangtao Li <frank.li@vivo.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: thead: Fix TH1520 emmc and shdci clock rate
Message-ID: <Z1nFD5XHGzhYMVXj@x1>
References: <20241210083029.92620-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210083029.92620-1-bigunclemax@gmail.com>

On Tue, Dec 10, 2024 at 11:30:27AM +0300, bigunclemax@gmail.com wrote:
> From: Maksim Kiselev <bigunclemax@gmail.com>
> 
> In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
> is 198Mhz which is got through frequency division of source clock
> VIDEO PLL by 4 [1].
> 
> But now the AP_SUBSYS driver sets the CLK EMMC SDIO to the same
> frequency as the VIDEO PLL, equal to 792 MHz. This causes emmc/sdhci
> to work 4 times slower.
> 
> Let's fix this issue by adding fixed factor clock that divides
> VIDEO PLL by 4 for emmc/sdhci.
> 
> Link: https://github.com/revyos/thead-kernel/blob/7563179071a314f41cdcdbfd8cf6e101e73707f3/drivers/clk/thead/clk-light-fm.c#L454
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 17e32ae08720..1015fab95251 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -779,6 +779,13 @@ static struct ccu_div dpu1_clk = {
>  	},
>  };
>  
> +static CLK_FIXED_FACTOR_HW(emmc_sdio_ref_clk, "emmc-sdio-ref",
> +			   &video_pll_clk.common.hw, 4, 1, 0);
> +
> +static const struct clk_parent_data emmc_sdio_ref_clk_pd[] = {
> +	{ .hw = &emmc_sdio_ref_clk.hw },
> +};
> +
>  static CCU_GATE(CLK_BROM, brom_clk, "brom", ahb2_cpusys_hclk_pd, 0x100, BIT(4), 0);
>  static CCU_GATE(CLK_BMU, bmu_clk, "bmu", axi4_cpusys2_aclk_pd, 0x100, BIT(5), 0);
>  static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_aclk_pd,
> @@ -798,7 +805,7 @@ static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", p
>  		0x150, BIT(12), 0);
>  static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), 0);
>  static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, BIT(13), 0);
> -static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", video_pll_clk_pd, 0x204, BIT(30), 0);
> +static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, BIT(30), 0);
>  static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, BIT(26), 0);
>  static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, BIT(24), 0);
>  static CCU_GATE(CLK_DSMART, dsmart_clk, "dsmart", perisys_apb_pclk_pd, 0x204, BIT(23), 0);
> @@ -1059,6 +1066,10 @@ static int th1520_clk_probe(struct platform_device *pdev)
>  		return ret;
>  	priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
>  
> +	ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
> +	if (ret)
> +		return ret;
> +
>  	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
>  	if (ret)
>  		return ret;
> -- 
> 2.45.2
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

Thanks for fixing this. Reads are over 3 times faster now.

6.13-rc1:

  debian@lpi4amain:~$ dd bs=1M count=512 if=/dev/zero of=zero_512M.bin oflag=direct
  512+0 records in
  512+0 records out
  536870912 bytes (537 MB, 512 MiB) copied, 11.8457 s, 45.3 MB/s

  debian@lpi4amain:~$ dd bs=1M if=zero_512M.bin iflag=direct of=/dev/null
  512+0 records in
  512+0 records out
  536870912 bytes (537 MB, 512 MiB) copied, 6.60576 s, 81.3 MB/s

6.13-rc1 with patch:

  debian@lpi4amain:~$ dd bs=1M count=512 if=/dev/zero of=zero_512M.bin oflag=direct
  512+0 records in
  512+0 records out
  536870912 bytes (537 MB, 512 MiB) copied, 11.5359 s, 46.5 MB/s

  debian@lpi4amain:~$ dd bs=1M if=zero_512M.bin iflag=direct of=/dev/null
  512+0 records in
  512+0 records out
  536870912 bytes (537 MB, 512 MiB) copied, 2.03638 s, 264 MB/s

-Drew
