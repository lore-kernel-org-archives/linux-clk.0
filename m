Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E923395F
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368097; cv=none; b=nKBjURkd7oYQFxj7aVpYXw2cGxpb09db16D3QCAyejXxq5DTzeNNIfejrW1c+IkVw8p3QcdL5+iMBe8NKr8U+45lAA1bJaDbGX532VjtjzkkfC+CUbZZ9tpEN5n1EiJUeFX21+YbEagPgzX6CuyNySmiuHb+fWoc6h6KqMdToUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368097; c=relaxed/simple;
	bh=nVB9WHTsYYBpGmRfCYApDPLoE9C1PJXqoELbdeFQULo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNcX+UPSjjFY+8QwRKKWJUfWJSqvvIiOfh/ezeECIrUKhY3cR9S9dvwGUZW0pEQQ7S7enCjAY3IM5gTPpAZ4Mt/MsUYZg6gv6f/q0x+t3D7ABTfo7mxEW1rijRtftx9wu/qfZHGBQ3iiUG4afJFH4SxirOwvdTQQ/PCwk3QKc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=csDsfXS8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YOOsdg8n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="csDsfXS8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YOOsdg8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783368095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=;
	b=csDsfXS8I1UfzI/MbvtARWHu9vsvttxlqvLr1wY0YAYAv7l+XAiAuYHmMIJGYeDA/lxmSQ
	CbVaomcWFLLXjArsOi8i0tpDKz260Co9//AkqtAa+ePgTsBRUf3iuVl9s27YAIXqyHobi9
	xrWMoSB6Gpf5Eje+B5PIQ5nKQg0XatQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-BxfvDaLOMsab1pqgwqvz0g-1; Mon, 06 Jul 2026 16:01:34 -0400
X-MC-Unique: BxfvDaLOMsab1pqgwqvz0g-1
X-Mimecast-MFC-AGG-ID: BxfvDaLOMsab1pqgwqvz0g_1783368094
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so259277085a.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783368093; x=1783972893; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=;
        b=YOOsdg8nS9wJP/8koGEDRkxLlNHBrkl3MOIaN7rD1MV8MYEMelIrQWWKpK8YCrkbmu
         1B812NIUxMy7FpWC7l8oSV2Q+MmLdtAsYfM8dTY+GgkO5Go4vQXC1VoZz/5bB8ZPhENI
         +OHzQhPRbI//1Zec/B3nVcIXimMUrobFYw/NdvO8HczCPneq9ZA3eqI+Q/gMuX2ECA0R
         1zoYLKe7lmNITtbLn3NhRrfhUelb/FZu2srkiHX0RqR/IDXuJUMuelalJSmf6VVs8c96
         wOHlealtd6PiQUo3+JJDhH1IFbhVB0E9CTbV+50YYD5PdYjlb65s4b/q9yP6U4/GWJFk
         h7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368093; x=1783972893;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=;
        b=Sa8BUaCYQoYcxptCb6XVwxc4aDW0WukRoVnBUsaS1JoRjE2AYXNp179IEZISDx1NWo
         BCaxItWjvMNEJlLBoPun2bul/bHFQ808nNBqM//mGBlQu64TtR3ipm8dIjhTq7yVxE1Q
         tgz8qngaq9e3tOxiDDGdElq7TGsn9G1wqFipGfuzHE4K63otsDY/GoQd7NQ8STENJspN
         Kcpge8lvsuZcVL62jl84P5KygCv/a6hgghE/Us58Gr9LjtyjSrGK1k0SkOwQUmOm7kVt
         lbi6uoUcT6WtSFfFGvuVtLKJ04W0qlSFNj/hBdAIHDg+g7d0P+lkBCU9rF0CcpR44hJx
         NJPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrLdxQq0TKnBhnY9pupLCENhyrKpOJBy0RpMOQn966s2XNCpcA/hngXkhxsgRhf2DD3JHr5QSzdDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXTtD7DusahSl8CjBDpZ4oKGtLANfO+U0hwyioJZokFt5pYog8
	K/vIxtVKpL5HbVPsdq2JzwdQWt+2QlBN2CxJpeeQW0W/S4wrMN9Mxm0sftSsWf4W8EFPin1/7aL
	s/cPLgEukBHtMvKMD+Y1hRFirYQsC9M6YC/qZFrG3Qcsv3uZAwjbxq8EJiKkZLw==
X-Gm-Gg: AfdE7cl5WF626/tVy63zen2pZGMnNw7k22p6lMyar1N+w0+c24Z8b1FPsbCqZY0awRZ
	sqVWbZIUzP4kTWAWxQz0/GMf2OzbJF21/8TMEVg1T0FJrDdfeHw4IxpGnGZt8wYDfA05/ScUB5k
	iLAYbnWcW5tVJsBUdkfvohPryWahAFkBBV4nTysZGDPitSJmVQlgJu95tT3d0CUzUBBfePnwwVK
	ZWHcZQuqapadqD2ItvouhKPqaWk+4OpMDM5LrTWeHF0rTqlAbJ/jzTXujIRC/L0R8vYmYq5BU1M
	pf9V9ZlpjrEWYXAM4n6h828loAtquHSa+zQVe5gPbcxwkOwqcdBbFK/CMSKsmhgE+9l/g7h/RWU
	kDoeXtFttRzyKaX0jmeeBbJZ7bDCb1uyhyZGjfxy8H0sUvg==
X-Received: by 2002:a05:620a:170c:b0:92e:9cb3:3f71 with SMTP id af79cd13be357-92ebb56bfa3mr271401385a.36.1783368093604;
        Mon, 06 Jul 2026 13:01:33 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:92e:9cb3:3f71 with SMTP id af79cd13be357-92ebb56bfa3mr271386185a.36.1783368091707;
        Mon, 06 Jul 2026 13:01:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b81342sm1006981285a.7.2026.07.06.13.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:01:30 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:01:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] clk: mediatek: fix memory leak on module removal
Message-ID: <akwJmKqZJS1sJzFk@redhat.com>
References: <20260629142348.273766-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629142348.273766-1-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Akari,

On Mon, Jun 29, 2026 at 11:23:40PM +0900, Akari Tsuyukusa wrote:
> Some MediaTek clock drivers do not call platform_set_drvdata() during
> probe(), but their remove() callback calls platform_get_drvdata(). This
> results in platform_get_drvdata() returning NULL, which leads to calling
> mtk_free_clk_data(NULL) -> kfree(NULL).
> Therefore, the actual clk_data is never released, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
> Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
> Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
> Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
> Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt6795-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt6795-pericfg.c    | 1 +
>  drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt7622-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 1 +
>  10 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> index 54b18e9f83f8..24522fc24019 100644
> --- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> @@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>  		goto unregister_plls;
>  	}
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;

Please add a newline before the return.

Also, please split each fix out into their own patch to make backporting
to downstream kernels easier.

Brian


>  
>  unregister_plls:
> diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> index 123d5d7fea85..b607592a7c37 100644
> --- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> @@ -175,6 +175,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
>  	dev_dbg(dev, "Performing initial setup for MD1\n");
>  	clk_mt6795_apmixed_setup_md1(base);
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
> index e4559569f5b0..12146bb3b726 100644
> --- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
> @@ -116,6 +116,7 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_cpumuxes;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_cpumuxes:
> diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
> index d48240eb2a67..28faeb2e657a 100644
> --- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
> +++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
> @@ -125,6 +125,7 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_composites;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_composites:
> diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> index 8a29eaab0cfc..a9fc2e5536b3 100644
> --- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> @@ -109,6 +109,7 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_gates:
> diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
> index cfdf3b07c3e0..b44baf521d2f 100644
> --- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
> @@ -90,6 +90,7 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_cpumuxes;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_cpumuxes:
> diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> index 19e4ee489ec3..41e5cfbcbb76 100644
> --- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> @@ -66,6 +66,7 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_plls;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_plls:
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> index d7d416172ab3..fe36d2eac3da 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -179,6 +179,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_ref2usb;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> index fa2d1d557e04..b923b73c64f6 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> @@ -128,6 +128,7 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_clk_hw;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_clk_hw:
> diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> index b0563a285bd6..446c55b77777 100644
> --- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> @@ -176,6 +176,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return r;
>  
>  unregister_gates:
> -- 
> 2.54.0
> 

