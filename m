Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7920F2D7DC6
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194046; cv=none; b=pVg5SZRCnEzxTrilGEDp8ZqQ0WhdePiSsiGnPxZcHdrACDlFnA0NOhjK7eiijOz/tCqxIRUJf5xM0uPeJDpUPBxMPhd9hC7MWKuBJDflOolsmzSOpDVTRFbcTD9AH3hua9+CVcU9E2xHP1J3kJ6klnIqc9S03Vnrmc/O+rM3Bv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194046; c=relaxed/simple;
	bh=vT1xlYOGQzAE7vqDwWmrOOi6+3ztl7fZzWwFl63Ks7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3kY0FMf7acDOaj9f3N+yFT65b/+/CCzZVZQyLSwpOMzrxL2WPLvEDMCnRrd0TcidjzQ0vTcfbRrfMe9Dwy2e2moOXLqHtGLhEUxPNkTHNYgFNBo8m0o+EHIZppT4oAtj8MAz4t6QmVsA6asWqU2+dpFMkzlqMaFVcv+Q5fM1DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fDqxFGFa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rj9cVayM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fDqxFGFa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rj9cVayM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778194043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPx3biXZ5x7Ot03ePSnGmceAWBV5EsYi4yVjJ9EvQ+c=;
	b=fDqxFGFa2TEJqj8Fg17oFpGGRdnUjtaHGRu+/zKpTCKcnGMiHKr6kwojCHRF4YTpFOBjru
	T6XO1sYKDk29IefJTmOqVMp3Stmn19Wnl8fs4O13LCEl/5M4hvFV4k676/TPHbkR8gdUKO
	pBA/uXQH2PRUJkbrfqBUWfKJqJTALyk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-jWJu5dzNMvy8OBmN0GtUrA-1; Thu, 07 May 2026 18:47:22 -0400
X-MC-Unique: jWJu5dzNMvy8OBmN0GtUrA-1
X-Mimecast-MFC-AGG-ID: jWJu5dzNMvy8OBmN0GtUrA_1778194042
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7b3e41a97f0so23698257b3.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 15:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778194041; x=1778798841; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPx3biXZ5x7Ot03ePSnGmceAWBV5EsYi4yVjJ9EvQ+c=;
        b=Rj9cVayMJBtfxzQG/cji3dRCPPGG+3JwWfyDuuPb2ZvaZMyvJMkjMSpnk4OhjieoW8
         yJ4D/80p5qn2SrWwHMqIzdpsSbv53lqX8hwJ2hJXGjSsuWqPOyMD9+NuO732ldD/G4NM
         WaPAYt6svag2ON11ePeTs1gVNc8o5kGq1JRwbZpiMnD88rR12Y2/cFd16p6MujuKt70N
         J56hifkBf+3RRzZzHl4nv4NedkJrEelhAyMY+izJRJFYTX1C0X8/nRkyD7GGJdv6KO/6
         mU9TWW1AXIZxbl6dywFMQGfncyWG5+xqM0mIfFjL5LvCyaOiKHh0zQ89DKLHP7BLhSit
         wMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194041; x=1778798841;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPx3biXZ5x7Ot03ePSnGmceAWBV5EsYi4yVjJ9EvQ+c=;
        b=jxq3XriozUhTkPMB9ElmpxSDdLKQyRR7bXR3BTWtum8f90UBrbC0mbcAc7Q1M1PRLy
         vizxzdidx4Uj9oFAh1dbI3+X3rgcx4hbfIFNSCw0GGa5KT6EkhY6lhjH0/0u/p3+Ecw/
         PMqRieY7N8ljh0GMXW0xmHW4T3I24jdwrU4aFtgqz0Q6ztJaJEoQ+9DDHqAT635eav9T
         qWyMirSzxAHZXhq1xymLl7WjYl4K26WPm6CV51+9RCv13YutoLrM7B+g+Z5O3w/rqO7k
         fZDl7rRAS7j9WmAWQIttztRm4VcoHPKo3gn8fsIBjfsI3niHQIK5+meuq2toz9dsC+ws
         3W8w==
X-Gm-Message-State: AOJu0Yx1De/69SFVadyu1wdZxTXXIgVtsZRAtwtK+bkMLExwXCnbVvHy
	u+MytvLuViVYSyPg+85PEkdZ51KFV8IW4+Nrk7q7qXNTYY8biPhsBDs1UicbUklKCq5hdAvh1vL
	KEJCOhP3KqQ5LRR2fK0iONra5N63gAJZ3cQ/QwldH/oNiFxdgIFM0xn6VQRJcWg==
X-Gm-Gg: Acq92OFY6HtaYfPRb+W26yEq03/ERHFkLfqFaxWXAf0zIkE5yVbj9zbBSBzTdQr/wgz
	UAzUdMcDoSKtaefMiCFdrmnm1TEtlLbH6sON4aTORARqzP8pExfCgRWkD2MkoYMQLIIajsjl+xs
	fsyfmgx7aw7bVCDy6WEMpR+cxQBf1rqnzzw8x+YMt1UV926iZwQJOVQIAJb9drCdJhi1IGWtVI9
	8OHpIgTugBsDVETtvifzxJyF9zgPbVCpE8UJLK7ikWogKDJp2rPsCsdd8SB78NZB5qHm94s7/OG
	1tb9IvkN9/NoPe4phvYqj2A52OAWylGhBWPTLKkTuAlJVqdm4O12GosFMnMiUSW73JlnFEZBs6a
	5Q4Ta2FsPQgw3GHqkeWu9
X-Received: by 2002:a05:690c:4886:b0:7bd:4792:671e with SMTP id 00721157ae682-7bdf5f0f291mr121682027b3.44.1778194041671;
        Thu, 07 May 2026 15:47:21 -0700 (PDT)
X-Received: by 2002:a05:690c:4886:b0:7bd:4792:671e with SMTP id 00721157ae682-7bdf5f0f291mr121681787b3.44.1778194041269;
        Thu, 07 May 2026 15:47:21 -0700 (PDT)
Received: from redhat.com ([2600:382:811f:130c:1e79:48c3:5ed1:4c22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6652744asm102657847b3.1.2026.05.07.15.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:47:20 -0700 (PDT)
Date: Thu, 7 May 2026 18:47:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: lan966x: use devm_platform_ioremap_resource()
Message-ID: <af0WdmaITTSzHA13@redhat.com>
References: <20260506233532.176285-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506233532.176285-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Rosen,

On Wed, May 06, 2026 at 04:35:32PM -0700, Rosen Penev wrote:
> Use it as another instance is used above. This one is optional so treat
> it as such.

The second sentence show go under the ---.

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/clk-lan966x.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/clk-lan966x.c b/drivers/clk/clk-lan966x.c
> index 3c7a48c616bb..8c7b273eb756 100644
> --- a/drivers/clk/clk-lan966x.c
> +++ b/drivers/clk/clk-lan966x.c
> @@ -253,7 +253,6 @@ static int lan966x_clk_probe(struct platform_device *pdev)
>  	struct clk_hw_onecell_data *hw_data;
>  	struct device *dev = &pdev->dev;
>  	void __iomem *gate_base;
> -	struct resource *res;
>  	int i, ret;
>  
>  	data = device_get_match_data(dev);
> @@ -283,12 +282,8 @@ static int lan966x_clk_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (res) {
> -		gate_base = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(gate_base))
> -			return PTR_ERR(gate_base);
> -
> +	gate_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (!IS_ERR(gate_base)) {

The original code makes the gate clock as optional. With this change, if
the memory range is not specified, then a warning message will appear in
dmesg.

Brian

