Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F8541B34C
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514864; cv=none; b=tU5vsW+KNjydNpd/MtjaBOB8fulpOmHluaqlDQC1vx4wWmRuNBtvfSuWZOUUxCPxleI9YF8EeKhVBJjPArzMbaLWxuQN07XteGq3DW10LKJ93W+JngpQ7PKw4V0XXG5018n3icLE5ns2voc8zXU05SfvjHat7piWwMfa5Y8YHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514864; c=relaxed/simple;
	bh=95D6FMP9rTRrO7GBPP7sa/pk3GG2dHrOx1ZZ4Tnncuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2Q6W6HflB1JRoFmsnkTQAH4V8fMxunmCYrjkDplT1o4AcMa/Mj9TiUfretclUxJ5CHu/IECdAFwPOYWXOpGyRJonhitN70DTr+yqFzMYI0YUuiQVUcDOSFzSltpwyebuidXITh8h0pA16P0JNtOEruGmByvnQe4O7wTRdxWB1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iWW10nDw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XSerTxHa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iWW10nDw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XSerTxHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778514861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EFvHwBgw7SDS0ea7gVysmplnDFATWu2WitfyMZ3Xaps=;
	b=iWW10nDwn6StvNmfUhoXSi8l0paTUkL1oaC+bGPOFMjnJ4iQcA59r1pu0l5IF/n6fnztmV
	sgj12ajMssNji458X6ihT/yktkgsOg/S13na6NBOcpR67Tcfp7Azy3Ak7D27/a3fcvey1O
	hNnl8+Pn7OJ3cj5ZFg5U2uGlk+O0rz0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-2m-Butw_MfifNUedjqpgyg-1; Mon, 11 May 2026 11:54:19 -0400
X-MC-Unique: 2m-Butw_MfifNUedjqpgyg-1
X-Mimecast-MFC-AGG-ID: 2m-Butw_MfifNUedjqpgyg_1778514859
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b7105dfb5eso98266736d6.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778514859; x=1779119659; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFvHwBgw7SDS0ea7gVysmplnDFATWu2WitfyMZ3Xaps=;
        b=XSerTxHah2rPPu23QHxHeHhRFVoVssa0rG6Azi11nxsE3qvtL++1241SLE17/y11Wc
         Q1Yl4J1tdi/bBAp4fdgq1WX/gBCzohR1lYdi3ggmkDHnz1BdaeAY12nlGWiWE8pMdXFe
         LLA0O2RueBIRMTDHOvvW/i035xdsBmANWa+AKT1QAAADa1znca8twcGr/XI2k6BAxc3z
         A1oEitVzqdJnoIGvQwf2jTeGb2ig1jleMFeFoEzjgUa8Zr6Nwk58IMhXJjfmHIZQwwQ5
         g+1nMnd6cD35WKa2M76JJ/J/zz0EnKpD0VZLFMPgpCil9d7JAMvXV9hxySWE4QiJX0jb
         vPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514859; x=1779119659;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFvHwBgw7SDS0ea7gVysmplnDFATWu2WitfyMZ3Xaps=;
        b=JOf0daHeorqaGLmnX54g/0RlfSzNCcDjQyIlWN66FjnaFYfB1g7CKf6FbFCEpmChD9
         Doa8GD+lWwyzXM02Rs4SuH690oSOGmE6QwjqeUStq2BUprjazQI4VflcqtMQgjH3+bEA
         KZiUz8n7sOjWGDi7qwHvHaSi0y+WQYvinXOFwl4zcay20TgDkAJ/EFZQewkrN2QLdvac
         qOJsESamieQV1ZC/Uj72sFEimJ2Nt1C8ImGxe8p+6MTT97jBsp2WkEbCoUp5s6mtWinV
         phq3DEo9e2eGU0jXAhkbV5QkJ1rR7f/7LIh6aEfUT2haP3BgXb4Es9PyLJxmi9Hz6WpN
         nmKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cFiZClTmw1/6pURgKdmqELiAARl56sUr+OYjW58FiLaBUVKCTffSJ1jn7AwrtCP+s+M/JBZ0ZUic=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfbDggwZv/XZAQr0lBDCL1FsqPJzwDJWQowO49dj1d3Kz7DFh
	5PsFSVkkmIYv5ehzgAP7SuzWoUmga7cu40x5U0etcnpmz7ehukaafcPXdELdTEKDgf6xTApbdcR
	YlLgF03YrQsFd0qmLMghMEdG32E0vJabPTt7k9sJVz3/kHVxQtfWEio5oZtBWJg==
X-Gm-Gg: Acq92OF4srQ5euVE7qvV9TyIjG68asslmjaM8QEDoCo5MxFSTZ7TBNN7De517hfGHI5
	rRyRcc+O5aRGdlKbI0qvh2MJA8Bt1H5jqJzg7oeKvOkeAvSxS6NEHwuGdLaijRQox8lYLFw1vTD
	jR7zPlFOpQwd7zpQEt5zfvJPwE3mDroUaIZuP9sNfDaKgL4rheMu5chZK7xjrIxF0Sgcb9NV2fJ
	TcM2nRsmfMFMOKC2SEM0jOEPRXTTh8WV5ss5skjARsxMUa8OeM2ndACCbDA5WkgBPYGVscMwhcJ
	ezeuxolHWOzwnPMxUqcFCQJ2HWfOf6DPIVvYwzsCJQcr6rppPhUSrj1f73vgDRY9r+WrndHi2vy
	y8jJpZ/p1SQCCuQAGqRfzx8xKodWD79VEby3UpxAY/K9wAllI65Alayz6
X-Received: by 2002:a05:620a:178f:b0:8cd:9322:d449 with SMTP id af79cd13be357-907bbda9b99mr2293086085a.56.1778514859255;
        Mon, 11 May 2026 08:54:19 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8cd:9322:d449 with SMTP id af79cd13be357-907bbda9b99mr2293079485a.56.1778514858771;
        Mon, 11 May 2026 08:54:18 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c9229c8sm3387777485a.36.2026.05.11.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:54:18 -0700 (PDT)
Date: Mon, 11 May 2026 11:54:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: nuvoton: ma35d1: fix PLL frequency calculation
Message-ID: <agH7qJypv48vkZOr@redhat.com>
References: <20260511031600.31929-1-a0987203069@gmail.com>
 <20260511031600.31929-2-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511031600.31929-2-a0987203069@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Joey,

On Mon, May 11, 2026 at 11:15:59AM +0800, Joey Lu wrote:
> Fix four bugs in the MA35D1 PLL driver:
> 
> 1. PLL_CTL1_FRAC was defined as GENMASK(31, 24) (8 bits), but the
>    hardware fractional field spans bits [31:8] (24 bits). This caused
>    wrong frequency calculation in fractional and spread-spectrum modes.
> 
> 2. div_u64() does not modify its argument in-place; the quotient must
>    be assigned from the return value. Both ma35d1_calc_smic_pll_freq()
>    and ma35d1_calc_pll_freq() discarded the return value, leaving
>    pll_freq undivided and orders of magnitude too high.
> 
> 3. The fractional-mode calculation divided x by FIELD_MAX(PLL_CTL1_FRAC)
>    to get 2 decimal digits. After correcting the mask to 24 bits, update
>    the arithmetic to use 3 decimal digits with proper 24-bit fixed-point
>    rounding.
> 
> 4. ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
>    unconditionally before the switch, but then overwrote its result by
>    reading the current hardware registers for every PLL type. Move the
>    find_closest() call inside the configurable-PLL branch (APLL, EPLL,
>    VPLL). CAPLL and DDRPLL do not support runtime rate changes and
>    correctly return the current hardware rate.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Thanks for the patch, however this should really be broken up into more
patches. If possible, one patch for each of the fixes.

Brian


> ---
>  drivers/clk/nuvoton/clk-ma35d1-pll.c | 34 +++++++++++++--------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> index 4620acfe47e8..314b81e7727c 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> @@ -48,7 +48,7 @@
>  #define PLL_CTL1_PD		BIT(0)
>  #define PLL_CTL1_BP		BIT(1)
>  #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
> -#define PLL_CTL1_FRAC		GENMASK(31, 24)
> +#define PLL_CTL1_FRAC		GENMASK(31, 8)
>  #define PLL_CTL2_SLOPE		GENMASK(23, 0)
>  
>  #define INDIV_MIN		1
> @@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
>  	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
>  	outdiv = 1 << p;
>  	pll_freq = (u64)parent_rate * n;
> -	div_u64(pll_freq, m * outdiv);
> +	pll_freq = div_u64(pll_freq, m * outdiv);
>  	return pll_freq;
>  }
>  
> @@ -110,12 +110,12 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
>  
>  	if (mode == PLL_MODE_INT) {
>  		pll_freq = (u64)parent_rate * n;
> -		div_u64(pll_freq, m * p);
> +		pll_freq = div_u64(pll_freq, m * p);
>  	} else {
>  		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
> -		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
> -		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
> -		pll_freq = div_u64(parent_rate * n, 100 * m * p);
> +		/* x is 24-bit fractional part, convert to 3 decimal digits */
> +		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
> +		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
>  	}
>  	return pll_freq;
>  }
> @@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
>  	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
>  		return -EINVAL;
>  
> -	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
> -				      reg_ctl, &pll_freq);
> -	if (ret < 0)
> -		return ret;
> -
>  	switch (pll->id) {
>  	case CAPLL:
> +	case DDRPLL:
> +		/* Read-only PLLs: return current rate */
>  		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
> -		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
> +		if (pll->id == CAPLL) {
> +			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
> +		} else {
> +			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
> +			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
> +		}
>  		req->rate = pll_freq;
> -
>  		return 0;
> -	case DDRPLL:
>  	case APLL:
>  	case EPLL:
>  	case VPLL:
> -		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
> -		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
> -		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
> +		/* Configurable PLLs: find closest achievable rate */
> +		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
> +					      reg_ctl, &pll_freq);
> +		if (ret < 0)
> +			return ret;
>  		req->rate = pll_freq;
> -
>  		return 0;
>  	}
>  
>  	req->rate = 0;
> -
>  	return 0;
>  }
>  
> -- 
> 2.49.0

