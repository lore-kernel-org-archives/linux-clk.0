Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5EB32939B
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577842; cv=none; b=dqP3Tb4OgfVKuPZ3t87s5GeGJVMeBEQ3nib4ZHSWkSO+LHvqZy6kWPW/MlED1od5dWysmVz9M98td6kbqQdT8wno+CPPhS6sGVcAM0cmV0scoqjlU8W39UeUwOzwLEuB7mittBv3aWx+MBO1pRuc0BxQdZnhgKJABhyPrxIIW6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577842; c=relaxed/simple;
	bh=/9f36ilOXF23oECHvG4OsAZ/divNmXTLrDifAZQ7xFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5CyRlpowaAqKPKsZFgnq9JRDy8XQstSObewLrLOYHv5pokpJ2GwHDo1Q615eK5U9dP5HQ/5nFVwJgz+Gw/l6eLIvSqYKw6wyV9NPlZJxOARdYGvzJ/Oo/QscsIAf4BBPOh9aQQSHgaK38099LBljt9XHZeIRm7hLA3wHEn5IGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UphSMN1Z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qMHhPybX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UphSMN1Z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qMHhPybX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768577840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aXpSo+h8rDvzqpoMUmkOIpY8JAj42K+xxDqiiPj/TNo=;
	b=UphSMN1ZE79gQd+Cz8TSJBI5/1UCeVipAtAjz7LcamgxBmN3ZaxGEtMVjBa+HfC5evqi2r
	h6a/fThm+uz5CJtFrxo+oZ14BCZTyY/cUPCtpdxQB2aev9FTJHJ4WU/gXA4inFEJGw1jmN
	2FIShWUFbLNTrcGaES4CJygg2VEnR/I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-8BIV0yRAPGGD7_KTyddFOA-1; Fri, 16 Jan 2026 10:37:19 -0500
X-MC-Unique: 8BIV0yRAPGGD7_KTyddFOA-1
X-Mimecast-MFC-AGG-ID: 8BIV0yRAPGGD7_KTyddFOA_1768577839
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8888447ffebso58867876d6.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768577839; x=1769182639; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXpSo+h8rDvzqpoMUmkOIpY8JAj42K+xxDqiiPj/TNo=;
        b=qMHhPybXqODWR7cYCSbw8WFgk1/xNabY0H8H2385hbae3w54I6mBbWefwhsElUJKIe
         aZGOQkbB+riDU2VohQ22t/1Ek6c9UUpJs8s45niVPRtYbcizid5Z3hR1z6+himM2zgYw
         jfaj5yS0JEhbhXTvGwO3Wjuf9hfYJ+MBVwSakAQLqr/6E6vd7csYAaOOZYTZWUl+/KtH
         gkqBskP8XGhcPNPPWm0pyyG0ytOwVs3OTMCIZ9kK9cta/RNowwGQPD+IFqUbQUlLbDjx
         j2qyFffWUKuwt+3aM9weiSWqQhjao9Szb6ORzNigxse0PCpDDfVbyq3Uzbt/NfdAoKad
         X8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577839; x=1769182639;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aXpSo+h8rDvzqpoMUmkOIpY8JAj42K+xxDqiiPj/TNo=;
        b=oQLyRbhstaBrhDJRzmlZWJsajw8D78bt+cmk1iK4SycjSt/8XLmy5LRxy7yb4QGaJ8
         BMhzTB8vjZFOfr12hNFDNev1BFlPMiboizax+Vx/HMZ7RlTYk3EXXt7H9Jjcf0XIAcT8
         bJNjcNnnzfjCIGrn9odLlJxXsfj69ml3X/fAhJxmrC1hhWnMghty8OzI/jPP35BvQttK
         EIdBL2ZbIZC6sXMFKumqym5EX4eKrUyFI0yTJITPR0y1/vJUIBTqDa0SdBQSQudZPBRa
         oi+k99P9WuG5zqOVEVZN0TY8FQX3NH8qNwB9qivgGaEma7y4Ny0gzFpwfPO9eL35Frl9
         +rmA==
X-Forwarded-Encrypted: i=1; AJvYcCV6VAQVoBhNeAJeQxhZ074N7cbakTNvir9GsZxbekwIZ0FfFRBHAc+O557kw53vBRtN9lAMSg4CYLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNMduKNqnGAXPyBE1KLE+HktdXuVNUQxfzmE4W6QtKkwEWPS/D
	SIaFMSa8dBM05nMiMT+kZVMXQ7whs2wWGtLy/YcDnWuLfY53Y34h5EsUrgMihgXVJS90G9nZZE2
	NpPUkWJ3rGu2IsRBKbsWLX8/bmYC0LVzCW4t8tcA9adw4RMqaEnVfSehwbv1qfA==
X-Gm-Gg: AY/fxX7M91x02mLp7ASDiN7zF1gF4vwmWbYLNXlIToxjxTGx+t3XLGPKAI7/0TgKnqC
	+2nmmfJUl5JEVa+tNN1QNe8nAISe6JHoVvhEKE9KPdmhVH/p103T6540pyeFL/j7qqkd31jIMQQ
	HNAWHKv6HDO4ArG5YfW1lGDVQLpDECSpbBPFu+RLmlL0NVa175TFdxjO1d3a+YPUp+I8hUmmzZ3
	EwyANqiyhSaGp5KiuPrdZq1QhPdm/ojH3YBIJPAqrROnG1vPco8vpr1gq3FxIfbBWsB7Gbjfswo
	CRo2C1tw4pyp+Q3pknglAClSNFHHBGoqRX/KEtYDcxUXj+kBGjYDzY9UypHgffAWYHmy/fmFCG3
	mz7RSdf5JXVyu2b3hCiHefc+CsMrEhpuKe71XyhK9xi4F
X-Received: by 2002:ad4:5b8f:0:b0:88a:3113:3ac3 with SMTP id 6a1803df08f44-8942dcf87d0mr42114956d6.10.1768577838860;
        Fri, 16 Jan 2026 07:37:18 -0800 (PST)
X-Received: by 2002:ad4:5b8f:0:b0:88a:3113:3ac3 with SMTP id 6a1803df08f44-8942dcf87d0mr42114466d6.10.1768577838288;
        Fri, 16 Jan 2026 07:37:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e554esm25946626d6.7.2026.01.16.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:37:17 -0800 (PST)
Date: Fri, 16 Jan 2026 10:37:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: st: clkgen-pll: Rename some variables in
 clkgen_c32_pll_setup()
Message-ID: <aWpbLPXu1p37m9IR@redhat.com>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
 <20260116113847.1827694-4-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113847.1827694-4-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Haoxiang,

On Fri, Jan 16, 2026 at 07:38:43PM +0800, Haoxiang Li wrote:
> In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name.
> This patch rename the later `clk` to `odf_clk`.
> The rename is in preparation for cleaning up some memory leaks.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  drivers/clk/st/clkgen-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
> index 0390f6834a0d..4ff9b35fe399 100644
> --- a/drivers/clk/st/clkgen-pll.c
> +++ b/drivers/clk/st/clkgen-pll.c
> @@ -797,7 +797,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  		goto err;
>  
>  	for (odf = 0; odf < num_odfs; odf++) {
> -		struct clk *clk;
> +		struct clk *odf_clk;
>  		const char *clk_name;
>  		unsigned long odf_flags = 0;
>  
> @@ -813,13 +813,13 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  			of_clk_detect_critical(np, odf, &odf_flags);
>  		}
>  
> -		clk = clkgen_odf_register(pll_name, pll_base, datac->data,
> +		odf_clk = clkgen_odf_register(pll_name, pll_base, datac->data,
>  				odf_flags, odf, &clkgena_c32_odf_lock,
>  				clk_name);
> -		if (IS_ERR(clk))
>  			goto err;
> +		if (IS_ERR(odf_clk))

This if shouldn't have been moved below the goto.

Also for the subject:

> Subject: [PATCH 2/7] clk: st: clkgen-pll: Rename some variables in clkgen_c32_pll_setup()

I would use the specific variable name like this:

clk: st: clkgen-pll: Rename clk variable in clkgen_c32_pll_setup()

Brian

>  
> -		clk_data->clks[odf] = clk;
> +		clk_data->clks[odf] = odf_clk;
>  	}
>  
>  	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
> -- 
> 2.25.1
> 

