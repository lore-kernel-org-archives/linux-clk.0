Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9F33C1A6
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578802; cv=none; b=GQc9GB/+WKgidhimbqj1GkxgKdb9JJOS7EiplK7Kqnl5lUrnN9gK9Doa26QBItY8lLTGHTv5z6VIntfx7McTGdUFNXVfSbru3Yz9+JUbKems/O7Ov/t+oJW9p1IBx8YdNhPWY8HEMlnEkARMV48trt0Cs7EayI6gfJ9PMj+82Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578802; c=relaxed/simple;
	bh=tUIzXBRcsa82Ow3akZ9yIu7FKEN2cx3y9Mw0/MZvzz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyZcYC+Z5XgljCaEeQjQB6vMCIW+XZOWKdPwLnEn+pcz0nxAWybFv3g9Sgl1+yP/C744oNPvhWZojTDF6KIMg4NKKn7bHu75ohf/WlMqr4FNhNE3DNgGGqQ6vsYbDrcNT34L4FnmYI9Bth2BwB/2q+Ea4xhZB7mZJulSGUo+cxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eLOpIHnQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P2/u0iU9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLOpIHnQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P2/u0iU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768578800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WU6nLWwBmoRVgJX2Z7FpKifeDQ1VOBSEjGQogfq6V+M=;
	b=eLOpIHnQjlSh2W/SSN2OuSIRmkVb5J2+421sb/Hl7V4HBPjULXkLMYrT43rSNiSvX8Rj7B
	h3jMsvP8bvnGAETktsJtVUK0pbL1WgthuftIBxWfieXE+rWm2HY92L7snxxq4rXzXyU6m7
	/miYq3pu+YR+1mtzjmDIrAPUwLacr9k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-y2iYngcYNSKEF06qo41jow-1; Fri, 16 Jan 2026 10:53:19 -0500
X-MC-Unique: y2iYngcYNSKEF06qo41jow-1
X-Mimecast-MFC-AGG-ID: y2iYngcYNSKEF06qo41jow_1768578798
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a291e7faso584648085a.3
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 07:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768578798; x=1769183598; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU6nLWwBmoRVgJX2Z7FpKifeDQ1VOBSEjGQogfq6V+M=;
        b=P2/u0iU93WQ6GTcz4EID7JzLZrnHvkl0Wa6qKZeXO2HRmp9bGk/Ez0yOnlF6knzQBk
         M1yuNgVDIICnxsG6flZcaYhVeFT+vPCK6ONXtvYmkW1fA7LhUEfhDY7eFGfop+xkBrgH
         MWLiipifB8ZbKqumWmtEOY4wSFCS8CYnXZ23a+QXjv/A7LhO9vTBJDCcUiYSy42kqiAL
         NexSCMG8goNcpPb0G99MlikpUAooj7HBXkyAdgxYcG648s6TDjxxn4MmC1WOxySmxyuA
         7lPIIt4HIV7Jk91sz8Uz65VRwsje6YIVIK6K5/L0nYiSYxxBc8E5+6TAS+F5ouk6kUVs
         p5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768578798; x=1769183598;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WU6nLWwBmoRVgJX2Z7FpKifeDQ1VOBSEjGQogfq6V+M=;
        b=kKnJao66HMQO0dJff52Gk+y7jacXm55F8cWr3bBNppcDxpe1jp10g73nsYWnA3kaJw
         Awrpyp0VvlrIJw1hAK6V8BU/54/XdnEQzYW7wSbOEjv6Pe9axEMf+aKspx0+RtCEuj4h
         5wk3FxAIIMvvjYNV++U/NX19bxVHuzAyFdsHMvR0awIfoPerOcTUgXAKjUtz854iHQwc
         +rzA4b8xPvAMfUdObxwPJpiwSDbNlLuRmp4vupezUizh+0hDHN9almT6PsAEETINwHxH
         pfA8282iYsNvH0O/kySxAq3JxW55K94UIq67/P3rU/xRVRf0h2BqEoB0OgiWV6b8HaTf
         eO6g==
X-Forwarded-Encrypted: i=1; AJvYcCWlwdEynjQyP38PVUZDnN2uNULnVXmbKnVtd9VGNgTC3WmJkWP7rQTQEXAujzBK0vgWsymhvfag7H0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9I2RH0fs2saDX4lM8Pl9DxPod33bhgO7miraV8BJNzWNeoHqb
	pi3xirZjeDADR9Aexl2hYlpETqUKsTPzpyVFiMM9wBYZRbrdpEFdaoFRF5kdXzdxBmT3FgKP9dC
	vPPie3yf5CBAJSRh7kkjRdqF5Nf48AfUB8v4m4+h7ROkvYpsMA0CRkDWYuttGB9ZRYPcLTQ==
X-Gm-Gg: AY/fxX7+z+YuIwMIs8gZ7zw8GBZ6W1dFfuzKia5XDMMxuzLT3KM1POxsVe918ev9JrX
	bliNn2jHLu5uA+GyO7zXgya6AyEcTz9k7y2dvbTdsrpbluPpVgZO9NGh1F/pCy6SHbWgWxK1bfi
	4sZTG0OwOc3/mdyr1M+s7wU8vyesMUSMjWJE1z+ek/Mr7Cn27lCy4Hiw0/xoZ+ImjnbXQGGbOYD
	YBqdN1Hz7dKyXiJCtG16kcQa9MBziOHyTI+f57akvPnfi1XaJfqXa0/h0+h8sHYMAUs3F3DO5KL
	HccbSBjTleT0vX1nNYo3hbF/nAX5faKwIS3uDYKtKAY0sbigb4Fh/jAbMiBIlBh+OHnBS1uParG
	xwNehN68nDBxEmyxq11UP+tcmLe3BaEI6Uu9aWjUphPFI
X-Received: by 2002:a05:620a:1a89:b0:8bb:a037:fd8f with SMTP id af79cd13be357-8c6a68155ccmr452317485a.0.1768578798496;
        Fri, 16 Jan 2026 07:53:18 -0800 (PST)
X-Received: by 2002:a05:620a:1a89:b0:8bb:a037:fd8f with SMTP id af79cd13be357-8c6a68155ccmr452314785a.0.1768578798104;
        Fri, 16 Jan 2026 07:53:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71d8314sm256755585a.24.2026.01.16.07.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:53:17 -0800 (PST)
Date: Fri, 16 Jan 2026 10:53:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: st: clkgen-pll: Add clk_unregister for odf_clk
 in clkgen_c32_pll_setup()
Message-ID: <aWpe7MWiJlduga23@redhat.com>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
 <20260116113847.1827694-8-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113847.1827694-8-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Haoxiang,

On Fri, Jan 16, 2026 at 07:38:47PM +0800, Haoxiang Li wrote:
> In clkgen_c32_pll_setup(), clkgen_odf_register() allocated
> clk_gate and clk_divider memory and registered a clk. Add
> clk_unregister() and kfree() to release the memory if
> error occurs. Initialize odf to zero for safe.
> 
> Fixes: b9b8e614b580 ("clk: st: Support for PLLs inside ClockGenA(s)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  drivers/clk/st/clkgen-pll.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
> index 89f0454fa72e..3fc0af4b77c6 100644
> --- a/drivers/clk/st/clkgen-pll.c
> +++ b/drivers/clk/st/clkgen-pll.c
> @@ -761,10 +761,12 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  	struct clk *pll_clk;
>  	const char *parent_name, *pll_name;
>  	void __iomem *pll_base;
> -	int num_odfs, odf;
> +	int num_odfs, odf = 0;
>  	struct clk_onecell_data *clk_data;
>  	unsigned long pll_flags = 0;
>  	struct clkgen_pll *pll;
> +	struct clk_gate *gate;
> +	struct clk_divider *div;
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  	if (!parent_name)
> @@ -808,7 +810,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  			if (of_property_read_string_index(np,
>  							  "clock-output-names",
>  							  odf, &clk_name))
> -				return;
> +				goto err_odf_unregister;
>  
>  			of_clk_detect_critical(np, odf, &odf_flags);
>  		}
> @@ -816,8 +818,8 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  		odf_clk = clkgen_odf_register(pll_name, pll_base, datac->data,
>  				odf_flags, odf, &clkgena_c32_odf_lock,
>  				clk_name);
> -			goto err;
>  		if (IS_ERR(odf_clk))
> +			goto err_odf_unregister;
>  
>  		clk_data->clks[odf] = odf_clk;
>  	}
> @@ -825,6 +827,14 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
>  	return;
>  
> +err_odf_unregister:
> +	while (--odf >= 0) {

I think the prefix -- is not appropriate here. If clkgen_odf_register()
fails for the first odf (ie odf=0), then when we jump to
err_odf_unregister, odf will still be set to 0, --odf will set it to -1,
the while loop will not run, and won't free anything.

What do you think about using the postfix operator instead?

	while (odf-- >= 0)

Brian

