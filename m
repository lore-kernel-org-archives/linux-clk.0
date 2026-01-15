Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457A395268
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480463; cv=none; b=jddEzwi48CAtzOIQviMJTGqObuxnX8EinezNpYaBsxMs66vuQLV7Bq+Y5Ev6eFA1lAfAIAJnRZmW5w/Eu54U8emYpHXCAuI8+P/VylSgeKOrUQLHiBXan/2+P2kkCveNz0fCfPGN2zKcLFGrYkpcDPoLEIDT2u+AOERE+ntCuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480463; c=relaxed/simple;
	bh=0DhpSjvfpByGwWWxOmMrQayWYnhrw3lEnX0Y7SfxVQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOCQbous+dkpBhsRg3isc0G6wWiQz3XEQsIjHdRERxP6I4MYCyRZc37aEvOiY4mnDXz5pZEwjVjylStUyi2JtnreXFEo10XvoyhR22MpFCPlUz7AknCoILxh2qBIXYF2YAgQIEA/1sG5hmRu95sl5t3ZDMbnCpCDX+4QxVyJlJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hpp2oms7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H6ptA+BQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hpp2oms7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H6ptA+BQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768480461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNPf7AyEdd66U2b9EqbJGKRCPDJ9Ni2qNv6cJ5EgabI=;
	b=Hpp2oms7EOhrA8au3uhiOPW2EfiCwTAWwd1HvWJNAQxVIwL3PLtHER+GzMB3fPGpSh4rOM
	VvtSKqKm51EirKHetXDGdb5yT5Ak4BMix6fEXudRiy5dkhLu65/VJCUiOP5DQujgzEsxxn
	ni1SXtLAplmv0eE/dSI9T0iU/88sXzQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-Coh0-cUmOi2Bo7TDp1U6-g-1; Thu, 15 Jan 2026 07:34:20 -0500
X-MC-Unique: Coh0-cUmOi2Bo7TDp1U6-g-1
X-Mimecast-MFC-AGG-ID: Coh0-cUmOi2Bo7TDp1U6-g_1768480460
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014d8b3ae0so19655261cf.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768480460; x=1769085260; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNPf7AyEdd66U2b9EqbJGKRCPDJ9Ni2qNv6cJ5EgabI=;
        b=H6ptA+BQ7phrtzMfq7/hodb6VRvUoWQ3TYmXuwgBomjjVMozauVcy3/GsTRZ0d41aC
         wKzbzqfUy0qCU8IqrlK5GrqUAJFpiVt5z06VU3Bak8LxRJmw7HDEg+WYrq9mt3gAKzss
         W7jnKleZLnMto30g8y4cFiLI2J9GyLTVPUwMhGnAxSKCuGPxBd9u40PMvflQ1mUvGLEJ
         26zpvc/Mubgj0E/RlSatW8Q27nHycVGcgRUuxLSI/CX0kKDDM//1fXYa9BnbK4t0lzM8
         aP2SANhXFu267X1p1+c0UZTTQg5Xo1ln+0U2bsY1rVL6fsmq/Rhxq8cDGpbAjSAGZ8qE
         s7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768480460; x=1769085260;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNPf7AyEdd66U2b9EqbJGKRCPDJ9Ni2qNv6cJ5EgabI=;
        b=dicBHCWh4IijGFeBMsG8UWt24B7QJurazRjVkT9E2ldV7u5hQ6y+CgdSLXWeto1CES
         qVW90HfjRziRxV7BjxZm9YLqlL4JnwI1qvHXae8Hqm/Eo7CRtWp2G/5p4GU6GRunZBy/
         l6PEh5mIsqFpAt8P5DXAFLeiFIlwHFGb548FpMhxjh0eSUVvxzZhTYLSlB3C9IVwE23C
         nMaRdlXZozSPo52BUAzGqDuA1dgs7q16Yohkl3xSOnYBYPkuG/zDfYQbNjIWeykSNcSA
         N/vUk/szgpiei6+M/0Nsrdqp6V4lbYrBD8ttnkLAvZfpdSwK2PcKzZPwj/nFkRo/c7WL
         mwqg==
X-Forwarded-Encrypted: i=1; AJvYcCU3PUawFD4P/xTdNQivzM3fhJt9Ns9rXG5/7OA8gtd20GYrCy52LdBlR2kFS1pvdunUpKxbj16UrUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhc39fw8FBuz/WNW0Iz65kTo6mAOsyTnWjCsKrvmbiVCvg7a1
	K7f35HROqY98i1L3TJbvRqoJP2kLMRpMDi7q2WuykJoUge0ZOjKOmZ0omjwyxawpKBB1DbXbqz7
	giYpE7NjG6ryoqA9djOd5M066OZLenEIraAai4xu0WXADk3qOwYlTKAN8bZCGGQ==
X-Gm-Gg: AY/fxX7rCczp996nMImzTlobbzN3lK9GEMwxnBT8g3BmBT4afsMCPLaLCk4dOlVhl5S
	HraeJlMcfC1NWRuJgEOAkUqWkaNEFnZh/Njr/d2t10U1/BGazs6gmvb7EvtAO0fWnPwZP8ebtve
	woVRmiFQAGDq76dU5CFgR66WV0Dt1FzQNe3CnrvYtICcy+BQSd7Y10+KsVxukWpR02n8XKNx1rz
	h2UKe3tJ2q+HR2DXNuVJyzABOJ/3kgtnG4stbx9RZB2UEA4WIjHrQFmqc9pTc1DSEOacQnni88T
	SL4Pam2D09fLhhN/Kw5GBKMp6k2zVu1uRSNLdWhSX4f9foMKhfb9VpkhsOh644cQ2KEISVI7GW8
	WO2fHtD4MTC72c5f/x/3sWZMe58NrZfUvAQf99Nr+etLa
X-Received: by 2002:a05:622a:22aa:b0:4ff:c295:3c3e with SMTP id d75a77b69052e-501481e4073mr69470261cf.10.1768480459602;
        Thu, 15 Jan 2026 04:34:19 -0800 (PST)
X-Received: by 2002:a05:622a:22aa:b0:4ff:c295:3c3e with SMTP id d75a77b69052e-501481e4073mr69468971cf.10.1768480457851;
        Thu, 15 Jan 2026 04:34:17 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm68145076d6.30.2026.01.15.04.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:34:17 -0800 (PST)
Date: Thu, 15 Jan 2026 07:34:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: st: clkgen-pll: Add cleaup in
 clkgen_c32_pll_setup()
Message-ID: <aWjeyNfrfY5dQLg3@redhat.com>
References: <20260115044439.632676-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115044439.632676-1-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Haoxiang,

Thanks for the patch!

On Thu, Jan 15, 2026 at 12:44:39PM +0800, Haoxiang Li wrote:
> In clkgen_c32_pll_setup(), there exists several leaks if errors ouccers.
> Add iounmap() to free the memory allocated by clkgen_get_register_base().
> Add clk_unregister() and kfree to do the cleaup for clkgen_pll_register().
> Add a while to do the cleaup for clkgen_odf_register().
> Use distinct variable names for two register calls' return values.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

There's a lot going on in this patch, and it's hard for someone else to
review. Can you break this up into several patches? For example:

- The kfree(pll_name) should be in it's own patch, with it's own
  explanation.

- It would help if the rename of 'clk' to 'pll_clk' was in it's own
  patch. Along with the rename of 'clk' to 'odf_clk' in a separate
  patch. You can say in these two commit messages that the renames
  are in preparation for cleaning up some memory leaks.

I'll pick up below with more suggestions.

> ---
> Changes in v2:
> - Add several cleanups. Thanks, Brian!
> - Modify the changelog.
> ---
>  drivers/clk/st/clkgen-pll.c | 44 +++++++++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
> index c258ff87a171..100172f9fdf8 100644
> --- a/drivers/clk/st/clkgen-pll.c
> +++ b/drivers/clk/st/clkgen-pll.c
> @@ -752,11 +752,10 @@ static struct clk * __init clkgen_odf_register(const char *parent_name,
>  	return clk;
>  }
>  
> -
>  static void __init clkgen_c32_pll_setup(struct device_node *np,
>  		struct clkgen_pll_data_clks *datac)
>  {
> -	struct clk *clk;
> +	struct clk *pll_clk;
>  	const char *parent_name, *pll_name;
>  	void __iomem *pll_base;
>  	int num_odfs, odf;
> @@ -774,18 +773,18 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  
>  	of_clk_detect_critical(np, 0, &pll_flags);
>  
> -	clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
> +	pll_clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
>  				  np->name, datac->data->lock);
> -	if (IS_ERR(clk))
> -		return;
> +	if (IS_ERR(pll_clk))
> +		goto err_unmap;
>  
> -	pll_name = __clk_get_name(clk);
> +	pll_name = __clk_get_name(pll_clk);
>  
>  	num_odfs = datac->data->num_odfs;
>  
>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>  	if (!clk_data)
> -		return;
> +		goto err_pll_unregister;

This could also be it's own cleanup patch.

>  
>  	clk_data->clk_num = num_odfs;
>  	clk_data->clks = kcalloc(clk_data->clk_num, sizeof(struct clk *),
> @@ -795,7 +794,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  		goto err;
>  
>  	for (odf = 0; odf < num_odfs; odf++) {
> -		struct clk *clk;
> +		struct clk *odf_clk;
>  		const char *clk_name;
>  		unsigned long odf_flags = 0;
>  
> @@ -806,28 +805,45 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  			if (of_property_read_string_index(np,
>  							  "clock-output-names",
>  							  odf, &clk_name))
> -				return;
> +				goto err;
>  
>  			of_clk_detect_critical(np, odf, &odf_flags);
>  		}
>  
> -		clk = clkgen_odf_register(pll_name, pll_base, datac->data,
> +		odf_clk = clkgen_odf_register(pll_name, pll_base, datac->data,
>  				odf_flags, odf, &clkgena_c32_odf_lock,
>  				clk_name);
> -		if (IS_ERR(clk))
> -			goto err;
> +		if (IS_ERR(odf_clk))
> +			goto err_odf_unregister;
>  
> -		clk_data->clks[odf] = clk;
> +		clk_data->clks[odf] = odf_clk;
>  	}
>  
>  	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
>  	return;
>  
> +err_odf_unregister:
> +	while (odf--) {

odf is not initialized at the top of the function. It would be good to
default it to 0. I know it is in the for loop, but just to be safe.

> +		struct clk_gate *gate = to_clk_gate(__clk_get_hw(clk_data->clks[odf]));
> +		struct clk_divider *div = to_clk_divider(__clk_get_hw(clk_data->clks[odf]));
> +
> +		clk_unregister_composite(clk_data->clks[odf]);
> +		kfree(div);
> +		kfree(gate);
> +	}
>  err:
> -	kfree(pll_name);
>  	kfree(clk_data->clks);
>  	kfree(clk_data);
> +err_pll_unregister:
> +	struct clkgen_pll *pll = to_clkgen_pll(__clk_get_hw(pll_clk));

Generally declarations go at the top of the function, or the top of an
if / while.

Since you are making changes to the top of the function, it would be
good to add another patch to put the variables in reverse Christmas tree
order (longest to shortest by name).

> +
> +       clk_unregister(pll_clk);

The clk_unregister() can also be it's own cleanup patch.

> +       kfree(pll);
> +err_unmap:
> +       if (pll_base)
> +               iounmap(pll_base);

The iounmap() can also be in it's own patch like you had in v1.

You may end up with 6-8 patches, but each one will be small, boring, and
it will make it easier for others review.

Thanks!

Brian

