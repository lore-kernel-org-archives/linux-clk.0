Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D93133859C
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422486; cv=none; b=ZIQb+42vU43/edDheP8QnQkem8xs7Q7uqxDUJyjzefmEX6RCa/oI9uRgN99QxA+WvYi/RiomSiSVWHcjJaeWoSfXOdqu0xB0pjx7agmAvk+/fgbk6If3gxDkA4czFxgEijT2zwe326bsUXDdI23r2awJAUPtYqLEKlJXkIOQ5F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422486; c=relaxed/simple;
	bh=lWhMCgGwZqY405F2HVxzFZrIU7/we6NJ0xph2yEOyQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMsmmxMS86VN0dcjeA+4KizK9hssp2knzeP4bnwb2uLFRyz+Gc8D4TuOkj92hBmkZlNySEwk/qHn60YdveKSDhcXyPcXBxo+nMsPZT8W8nWqCaItQcpM7zQhPy/eregHuX+q9QZz9QlDLi002ijGMuRRDZTStI8CNB7dqBumTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HKqCKEMy; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HKqCKEMy"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35b88a4f123so317350a91.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 00:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774422483; x=1775027283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KMORzaHZIt/O0p0OreFRdLlztvWKjQgycAj/ZTHugc=;
        b=HKqCKEMy6ZnpVAKSdnPAEpIjuapWrSQKYnILqu6PsFiHjSp1ePioKaI54EG5aPoWBR
         N3qdWs9fnHyu/ZH4L/SPF6jUc4la+g/Ey919OUV8NMCAQOGdMT30ZCYAq9lAe0qGw/kQ
         2g8RUlHsVVpoS8EvkY/7OcHBiAAhfdUNXI93eY+szNi5NIJ/yeWWkbHC3u9uZWh6FWpo
         4wmZBAxU0Gd0DN0NPewiOCvrI4gnGJOGyJzEPTVUuyCTBCRlq6R+XSh+T3Qa9nVhhSR2
         ZUN1YywLurZnadYP3rrWsJLIeGF58SDaCjH09YYrNCQTUjxFP1bM6qut2U/9u6wqIBYp
         uFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422483; x=1775027283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KMORzaHZIt/O0p0OreFRdLlztvWKjQgycAj/ZTHugc=;
        b=diAI50uORQCBpf5zLVhKxr+un0/HZ0X5WZ9MBk7PC1yZkZ1buxVKRAjhAbQ5NHDl7U
         2w3bgV788Skb84QvizOuOvVWI8d4inYwYF2BMB/vjt8iUHjQ0ANboHxgK7bCV1BHdVsJ
         jZaNvb9Sob7TEBGzStilo/sSeoE/qVKDUWY+V5vyjG63Kww2Ifs3EjpwQvhAi9lsj+vX
         l4qja77f8xwxK2kbJHlsXRUSPmBU6DhYxsSEIlISxsv+BqT0UYswA5CA619+C0bRepNE
         eRO7ixWFJVCurmSzro9+rT/5yc1Pcatw5H5/Vtijp/N2OVCQrPEJJEefx3faGcwQtre9
         QJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWKTjJnQI+Y19weTARxR0g06UaGq4Q0LShyadNfJpLJi0W/O4QQYcraIuLsGRCPfdprWMH0HoH+pVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YySLhnKC24n6x5VZ8k7Z2Ze1h0PHN8cFaoHmjamWJgTugEiadHe
	D9yxYJAlebNC+cgNwR89sO/tRk8fUAEqVQpohMb0dzoRXuycyVHcBiLZLmUKD7Cgqkc=
X-Gm-Gg: ATEYQzxXm0XYOohutumzy4X0YNyZWLxwCtCRiaqLhHHYzDhgWMVQOjlLFzRHjuKn1Dv
	G07uudwXKgBfp0BxUB2vRrCp4S+QoYjSEtB+1CobJZ7aDqZF5m2OIW4aqLliHKBqVzr+A6c4hU7
	M7ARTwGdvf51ZV5jXxzXA09QqyKinlTl82jqjIWWBFzPwJphxKmrpXwig8sjTnjbilOyK3C3hT3
	NlKGAtKZEiDOC9V2Y8OOk3ih5+QJ6vLaedu+4RJsBpsbqDPA1qU/yNcQHqjMv+bgg1o9pAWmTE9
	Fq9pr9VfNNBnv/rUK2eTf2iYyelp2UtIGjEll2yiNBOt90UbQpv0/ZECDsxXQVqZYKh88DDp596
	i+pjgaAbCJCEHTcJLokE7O4sO3R118M/dae3odrnpARPaVy/QlFoVJ3wuAD0I/0nCHY3od9jafU
	jWgPDz/mekvc7EVrLUihzrCA8x
X-Received: by 2002:a17:90b:1dcd:b0:35c:69c:2a12 with SMTP id 98e67ed59e1d1-35c0cffc5eemr2303037a91.0.1774422483131;
        Wed, 25 Mar 2026 00:08:03 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0ea4807dsm442644a91.10.2026.03.25.00.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:08:02 -0700 (PDT)
Date: Wed, 25 Mar 2026 12:37:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: vireshk@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spear: fix resource leak in clk_register_vco_pll()
Message-ID: <brk43cgzeibwism24x5ub2uz5f3uveuljibgnztl4zrtd6jke6@lb7nipf5dq6m>
References: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>

On 25-03-26, 14:22, Haoxiang Li wrote:
> Add a goto label in clk_register_vco_pll(), unregister vco_clk
> if tpll_clk is failed to be registered.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  drivers/clk/spear/clk-vco-pll.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spear/clk-vco-pll.c b/drivers/clk/spear/clk-vco-pll.c
> index 723a6eb67754..ceb82723fa8c 100644
> --- a/drivers/clk/spear/clk-vco-pll.c
> +++ b/drivers/clk/spear/clk-vco-pll.c
> @@ -343,13 +343,15 @@ struct clk *clk_register_vco_pll(const char *vco_name, const char *pll_name,
>  
>  	tpll_clk = clk_register(NULL, &pll->hw);
>  	if (IS_ERR_OR_NULL(tpll_clk))
> -		goto free_pll;
> +		goto unregister_clk;
>  
>  	if (pll_clk)
>  		*pll_clk = tpll_clk;
>  
>  	return vco_clk;
>  
> +unregister_clk:
> +	clk_unregister(vco_clk);
>  free_pll:
>  	kfree(pll);
>  free_vco:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
