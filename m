Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4889434EF1B
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775229061; cv=none; b=d/3qehOvacKrKXRZzlxUiOL8eFn63AylBJTXVjy5B19LOusH4xuQuqTFxEvROroK9VsAf70Vp+YjXI2K8VqLSxBvbKc1yLNU9Sa1g29Zyemnbin+d1bnaCuQDMltC6WJY3J4VgmCRplSQsmlNcjlP7XyEqeqV3k5THLc/LgGINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775229061; c=relaxed/simple;
	bh=9I1I/BIyjb9Nx0MjMIMlzcmDOLFfYlve50gfaKykPKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPjlLaNYmQG98Xeb6n37+rwpFRcU5Vu9DWzCOMwqlqi29/van9YYI1fO0QVQ3NN7wQpjZSnfHMLQXzkEZbyzBNE+a4ipIpKBII3Q6na+cVeg+juFTsppK/Q21GIu+YUmoxPewot7r8ZJvUMk6AnuHICOU4jEBQeQ1WTDmnzcocQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bbUfXjkf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZdmovOvp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bbUfXjkf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZdmovOvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775229059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=;
	b=bbUfXjkfrLtJ8jX2Asp/kUonoOyFUzOFgKrqJ2SY5qn5lGAWP7KK/CSlpACr/aTduRtw1J
	0pqHegopOUgqeTl348gJ3KmkPh3oVOP6Dt3ThBp0CTls+Fhz8tvi9JSG9l4E8eMcUI7wSw
	xdtTTUNz5z2fRD2JNB/G3neZ3a4zTyU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-NdnGH7AiOpuZ7yLXj4TSMA-1; Fri, 03 Apr 2026 11:10:58 -0400
X-MC-Unique: NdnGH7AiOpuZ7yLXj4TSMA-1
X-Mimecast-MFC-AGG-ID: NdnGH7AiOpuZ7yLXj4TSMA_1775229058
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso27377461cf.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775229058; x=1775833858; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=;
        b=ZdmovOvpxcAq5WR4tGPdNqCjjIiXKOW2+d/LUx5ttXqk2UCbf3lydTjF1RMhDjCex1
         3ALfMqQ0CinF/h3fuIlD6cmRQFyj3y17HyRd1bXL+whEEWoVypMfSXPQynSYdJRDV5Mi
         S309cbR1pj6nQVc9cCd8hC1FeH6wqFwUSDnvLxT6fjWN7qU7a4BCm8fGBBdZnvtDDLci
         A5fnS1CxnB5F0W3J9yConqEHFrdIlrQwXEa3Gfv/vv1mZIDAalMazYp6tLCL1BqNxC6x
         dvix/B6SaOrnl1rTni/rjk+067DrSzW+QOfxDbUioxQ1tvAJCQvg4jNVvXgRl4Jbm2Rl
         Btqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775229058; x=1775833858;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=;
        b=Wzg6DrPYvAJUVELmSRmA2AtxHYkP7Ndm4klDPCdDtlR7O6h017ien/Tb+mUDZZqc97
         veaGGw5NJ4fhNlYR2dTgWQxTDGBFHMY5gPQuF9ipUxwSO4YF0anoHX/w9+Mx/A4VeR2E
         StkcCTnaHLF8l5yOxpXMxqilJe/g7DaW0sObkeMJgAR3Ial83OE0/Ac9g7oNgC0Qcm86
         UtFCrytV/JnRJcmHz6mTOGkSLZW2msZ6ATbuNAxOsu4SwP/Ls2c8bpuXQ8meseYrm049
         wZfdRcyEEK3T4gcyFEI3WGQfEf9UYUCdmFFEzS1rZ1sfMThPnfeekrLheGw2vdGhwSQk
         iZfw==
X-Forwarded-Encrypted: i=1; AJvYcCW55+zhc4qVapWwDmD34LA2l37XrrRl8lf2Bipev33Us4bVhsZXJyaWuYZrWjCUKaV8WPY69gbHhr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Hqc8CHw2eE6Ut68rZXBBXV0hPyJOSrfVmnAuTUqJHM4LChl1
	NxlzY8CN7RFN9/V5lOAiBfVyB73I5UOjusmKZISJv0pThxbockUOqTzLibC4crbOWMsNZ9c+C3m
	e1KAMU70DMblixC8WEqZ0YJKbkdbqu86GMFWf+EpFGo69HgLHbBAZYT+AgSN8yQ==
X-Gm-Gg: ATEYQzxb0a2TkH8GuYfB8mF/EliWdMmBCXHgwH4b2YqiNIdTaY2fVjWeVWgyHb7q7wC
	jilCdmnM1lEImJy1tu3yxVziCQo/JAcvQlnVv0DCNr/qY9FkNKwpwscWRNNw4Bwc0wnmkb2VSOP
	ozsMXBBcYUoI2IpiYiFnJfMNNCUximtJNQt5nc4FLNkQWw+8Enka0Ll+VMEMTjutu5aWF54H6nr
	6oZT2LAVZZ5DYX6uV/gNAN8K/VnEcgzO45SwtouER7jwRA+Oaw7QJ1PBgkvMzTe5Vh+g9A4nwKx
	3v6Xuh2P6aXB+HbaROtl51nUxLQyyieJhK1uBTSJTmZyuCaTDMC4SvFX6AWEqaKkqf2oO7ba//g
	2A9AIU1/S2aH32g4Gn5aWPWB1JfoNLpebPD21kBU1foWYpr+9lhrL55F0
X-Received: by 2002:a05:620a:44ce:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8d419284f7fmr493256885a.25.1775229056580;
        Fri, 03 Apr 2026 08:10:56 -0700 (PDT)
X-Received: by 2002:a05:620a:44ce:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8d419284f7fmr493247485a.25.1775229056024;
        Fri, 03 Apr 2026 08:10:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596a0a655sm49296476d6.29.2026.04.03.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:10:55 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:10:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 07/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <ac_YfHe0dscb3MPw@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-8-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-8-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Yu-Chun,

I should have finished going through Sashiko while manually reviewing
your patches.

On Thu, Apr 02, 2026 at 03:39:54PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val = PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_n(clkm, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_ext_f(clkm, 1517);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 31 ... 46:
> +		ret |= set_pi_ibselh(clkm, 3);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 2);

Sashiko reports:
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

    Is it intended to use bitwise OR to accumulate these return values? Because
    these hardware operations return standard negative error codes on failure,
    performing a bitwise OR on multiple negative integers will merge their bit
    patterns and create a corrupted error code.

> +		break;
> +
> +	case 20 ... 30:
> +		ret |= set_pi_ibselh(clkm, 2);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 10 ... 19:
> +		ret |= set_pi_ibselh(clkm, 1);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 5 ... 9:
> +		ret |= set_pi_ibselh(clkm, 0);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 0);
> +		break;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> +				 PLL_NCODE_SSC_EMMC_MASK,
> +				 27 << PLL_NCODE_SSC_EMMC_SHIFT);

Sashiko reports:
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

    Are the mask and shift values mismatched here? PLL_FLAG_INITAL_EMMC_MASK is
    defined as BIT(1) (0x02), but PLL_FLAG_INITAL_EMMC_SHIFT is 8.

    When regmap_update_bits() applies the 0x02 mask to a value shifted by 8,
    won't it evaluate to 0 and fail to set the intended initialization flag?

Brian

