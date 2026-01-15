Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707751917F1
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 00:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768437718; cv=none; b=GdVG+jtN0B1b9rpxYCfqYHwkYVdm4qG9uC1VRNUzNOF9eLJKeKOIVlDt908eVzfpJuUX4n/CTSo6Fay5lNNfFCxX2vTM2Ouey7U13NpwCfE+B7faqYqO0RrxQZHM9i6PK3wAvBR5iqUbb+MVcUQKej6efcK558NbVVVWEw4QI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768437718; c=relaxed/simple;
	bh=y4e4xuGoQqKP3BmW+PApsUpdlOaPMih9cFoFw7GhlH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgWKSn9ggXEmdK2PRpam4CcL8qA0A0D9aBfzSwEJCAp8fBEl1D2YbeTlGVRYrg31wfGygKUMuMOUqUWh3NQfejUmFH7wl7MmMvJ98pmPe2LaAerwRh5M+sTSKROtyMtViUelOil+n1qFeXbMyisLvXkWzWyXlk9UHTvhaUICXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fQccNHr+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KB5Hu+4c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fQccNHr+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KB5Hu+4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768437716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iz8Jm8YOl06MASb/gCMt5lvamGotRmUJlirY757kvWQ=;
	b=fQccNHr+X5rkXwrjUhnhRRReNWzjRKyzsOOyjlHxyAk2gMLiF5U78mcYK5MNrC1yXuPI6H
	PctXNtBIrAJNER/Lfe5cRoB5dIqnGf+J3iVbGJvxUlASHwQN7md+unqvAD/BjydBxdskAW
	S7hMEXMy5hqRy//L7ejoSNMog4JYWRI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231--pwNlHnsMGiH9KY9lgbv2A-1; Wed, 14 Jan 2026 19:41:53 -0500
X-MC-Unique: -pwNlHnsMGiH9KY9lgbv2A-1
X-Mimecast-MFC-AGG-ID: -pwNlHnsMGiH9KY9lgbv2A_1768437712
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c38129a433so102919085a.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 16:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768437712; x=1769042512; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iz8Jm8YOl06MASb/gCMt5lvamGotRmUJlirY757kvWQ=;
        b=KB5Hu+4crgcIcahtJqVqtczKS4xq3EUA3Y+HjskYTclmU42RmJ8ZSraSXB/rZrGpRY
         kFg9bpZoi5DzUlmY8uSzmIcW78f6ha6h21daxnXQO9RuBBsnz8MnQ0dBkPG5ULuoDy5M
         PyDyTUmLLxWvukBqyRT+8Ax3E8y4x85SvgPWVHQXHWgbuL2oJroICXI97Ixtb1DFeTY/
         SLG+e2TocZrPIqbyaj5LGBhRL2Pm4SaCoVmWEDH4Lwm1ZOHCqIBpbem7sA3zjE5gKFgy
         oSCfK+PEzhkPZnSqCjXEACBKK5OeO/bYxL9dfplhzkpQpjgwlWhZN1LaW1efaXg9znjW
         nccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768437712; x=1769042512;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iz8Jm8YOl06MASb/gCMt5lvamGotRmUJlirY757kvWQ=;
        b=o2SqZJO+qhMNJGakc4T7BhishLximI9pQ9Z9w19fwQH7SKSuH4/h6QXpmvQSDQ8QOp
         C1HNsZECM//Rs4Y6m+DHjnGhW8p1j/miJf2S8QbjlIlQptrUYbt00nAD344v6HHXDGPY
         /+WaU68zsTQHjGZfDIC77c9wX/yAzh/WVdrCEE94ghiGuDf0sext0jUaS9mnwLh0/ccc
         CN2lCBPIc/BwsCe9yltUsnHsnRRFpEd/9pmNGcx4/fGhkRcMy9NlWdmJ1B/jPJreKF7+
         pEy0zFkUXDpk7kVNuQe9EAPYGbnb9tFqAHOQseaDJ1HlxQtP5PvaY9KV5W3hWQ5F/nw5
         6/mw==
X-Forwarded-Encrypted: i=1; AJvYcCWhb4RYL1HpvVd7oTyJE2/uw/f3XctIISba9iG3xNGHdmf8SqbCm/o2M9Dc72YfRVsByfhLvXJwBhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHpNOGPxvyNdkBT61lztRst/5lLY2fYNdykdFA5dNw30jBzgIo
	QdVxOiSeYPAI5GWee8l/YxqO85Up7P+IYEti20bZYlCo9b4VXbdqwlkVLegp2zynyqvFQAO2bWI
	4a5G3nveLgGcgbHjqgP6Jk8/rGzJm62kQOgLG9ExW8lMmpYTTddeUPdfHRwpzng==
X-Gm-Gg: AY/fxX67rUixw9DVm0Zg2caDYhZ2dYhLIh9bBhKILvo9/3ILUzHub5k3VSq7zFlbL73
	GvY0PgIJXzKbObZByEnBELTT8eM9vBFCWnTkbxCr/7Tp3FgyKgeypKV+uAjFQGshdaMdZaooHXX
	QuDdqT89DJcjuI8LqRuyioHmPtxTiTJ2Ads1UNjTYSs0XB7jscTgGNUjQQw0sZqoR1QIEYq5fmG
	qkD2M48hbQD4M5P22jKb8+1InNhVkTXWnIr7cOWBPkozL7WRBLqxCj8sgZ8a3mYkd73YytC2G9F
	VqrjkXxUcZ0RYirc0riZMzMIrnz1lkvtr1vRF62IhNne/8+gMyAj63syD3AEeOwd2x9QlabY8wt
	7nD/YO8GDZiDK/UMnSk//K+XCx2VCmxd66nUTSiLXE4y5
X-Received: by 2002:a05:620a:4445:b0:8c5:2ce6:dbf with SMTP id af79cd13be357-8c52fb2ed87mr747772685a.17.1768437712513;
        Wed, 14 Jan 2026 16:41:52 -0800 (PST)
X-Received: by 2002:a05:620a:4445:b0:8c5:2ce6:dbf with SMTP id af79cd13be357-8c52fb2ed87mr747771285a.17.1768437712079;
        Wed, 14 Jan 2026 16:41:52 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce985sm184304896d6.11.2026.01.14.16.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:41:51 -0800 (PST)
Date: Wed, 14 Jan 2026 19:41:50 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: st: clkgen-pll: Add a cleaup in
 clkgen_c32_pll_setup()
Message-ID: <aWg3ztytIYtkkDj-@redhat.com>
References: <20260107092250.3423379-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107092250.3423379-1-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Haoxiang,

The subject has a typo: 'cleaup' should be 'cleanup'. Several notes
below.

On Wed, Jan 07, 2026 at 05:22:50PM +0800, Haoxiang Li wrote:
> Add a iounmap() to release the memory allocated by
> clkgen_get_register_base().
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  drivers/clk/st/clkgen-pll.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
> index c258ff87a171..cc1dd9523fb2 100644
> --- a/drivers/clk/st/clkgen-pll.c
> +++ b/drivers/clk/st/clkgen-pll.c
> @@ -777,7 +777,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  	clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
>  				  np->name, datac->data->lock);
>  	if (IS_ERR(clk))
> -		return;
> +		goto err_unmap;
>  
>  	pll_name = __clk_get_name(clk);
>  
> @@ -785,7 +785,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  
>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>  	if (!clk_data)
> -		return;
> +		goto err_unmap;

These look fine, along with the err_unmap below. It looks like there's
several other leaks in this code though.

>  	clk_data->clk_num = num_odfs;
>  	clk_data->clks = kcalloc(clk_data->clk_num, sizeof(struct clk *),
> @@ -827,6 +827,9 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
>  	kfree(pll_name);
              ^^^^^^^^^

I know this isn't part of your patch, however pll_name is actually the
return value from __clk_get_name(), which is name member from
struct device_node. Is that correct to free here in the case of an
error?

Additionaly, clkgen_pll_register() calls kzalloc() for struct
clkgen_pll, and it won't be freed on the error case.

In clkgen_c32_pll_setup():

> clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
>                           np->name, datac->data->lock);
> if (IS_ERR(clk))
>         return;
>
> pll_name = __clk_get_name(clk);
>
> num_odfs = datac->data->num_odfs;
>
> clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
> if (!clk_data)
>         return;

        ^^^ clk is not freed here, along with pll_base does not have
            iounmap called on it.

Brian

