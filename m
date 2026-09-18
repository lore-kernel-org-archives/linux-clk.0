Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AD37FF68
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 22:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771368; cv=none; b=bxSWIcYxMeWwxygu1rTNUKKHtuMg0owJ5ItVdRzjkm95tsTV/9GvvDImrt1xm4vAQ6K2MrPB6KvsXyZR0mx0/89hvehBX20+/XH3sQOqevZ8JpjGZnWEpRp9EZ/ACRoebIoM600e6szAIe/OCJbul16WraJiykEOrrDGI3W74uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771368; c=relaxed/simple;
	bh=MkPzqZeR3+qlWqlud+iPO/JWjWS7F6vl07CGk4gnzzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qd7moAdElxhU9rm1tecTPtQIJSqabcct2KlQFr1LL0Bpdf90xESoFj9v6kcIvznoT2tLQUaAFK10UKwZPL/kS0VEVD5fO2EGowS95mDMWJoiZ9d4jHB+HD4B8rebOf30ZV+g/WwAZGeQ43f2ZfFjb3qNktyN7p2UJpcy2mSS9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MztgzOMi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=C2LatyLH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MztgzOMi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="C2LatyLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789771366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/n/7UN6+yP2YInvvqD1Jw1p+AQ2bWsxeusuuVpsPbog=;
	b=MztgzOMiKtaDiAAaKnLqtxq4aLYEEB9flDc3wBmPop8oyBHJcrw6JW64VCzuFpyBYSqYlY
	hzRwb9NjBWggdLT5E2b/qwS3nn0wnPCS2nUOsKBeDIK4AR9jc05dkW2Y/rKgxqnd2hp+Mf
	JrUvLR+AY6kA/rlCtaxoNuysIbZTf+g=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-tP_TI3AANrm2v8692TkViQ-1; Fri, 18 Sep 2026 18:42:45 -0400
X-MC-Unique: tP_TI3AANrm2v8692TkViQ-1
X-Mimecast-MFC-AGG-ID: tP_TI3AANrm2v8692TkViQ_1789771364
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9124b265371so26161836d6.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789771364; x=1790376164; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/n/7UN6+yP2YInvvqD1Jw1p+AQ2bWsxeusuuVpsPbog=;
        b=C2LatyLHDJcnSv0mjZA3IEWV0+1wKf+qyPwCZTZAR0Bc19lyEMoQSocgsfM3MOOHMQ
         5jaLv4y1dYQDwOuT36YjMqLkSZ7uxFSF9iO98re/NeqR6DoUDrdZEybyqjvJO6/aOdo+
         b/DZWfB90YGvULRRxj5R6H1TWtiPBJtlXgB8oj4lWaysb4+09ZiVy4Pkn87jUJjsR8Ga
         gvqnTdPqpLAhT6VjXotq5kOvsCUcwKFNtF+4HxLKJ2Luq04LUdjvxvAfq4pk2L01iO+Q
         hi5tGA3QMSYpolhA3F+6NrSWfcz9VRF4UJANJImV9n26DUkX0rj7Tlhrl3yblRbX5N5Z
         OsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771364; x=1790376164;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/n/7UN6+yP2YInvvqD1Jw1p+AQ2bWsxeusuuVpsPbog=;
        b=O8o6RKZLCv9Dnm1YyptczTl5Uo5EzXc1PW2pTMldKsyYTUcNgNUCGZrQYk95p3leNj
         NVnNfrA/GS+up3XRDvU43lB6R89X46SQBoZi7BvOFFIngvVXY7FdK4+ikWzEATnLnMkl
         MhkgeCK/27ElJ33NHE3p62JGidn16/43fQr2Yk5lc/RWvAmLRc+lKj3oQe06ZqZFon3O
         f92Kqd3M3AcBxdbYsFm4Wg7Irllm2CAS4eTcaGBwgVkU1tpMlW1iH8TnWwkz6r8Fimrs
         nB5kMD8xFtSS2a2kfXT/uHJ020d3wl3bODH4WQ6kN+plSZK+z971Nqqiel07IImPelCN
         6MNg==
X-Forwarded-Encrypted: i=1; AKwUvBzOdkLuU5fneFilc7OLNG16SIq0vjt7zKBXvUMHMOzyiifjKOg2qhO4uHlB0UCixZrFbk3mvZ+L2I0=@vger.kernel.org
X-Gm-Message-State: AFuF++kThrIrGTpQqISiWeh9sgTvVMDR1WbEI6xVEhKwwiujPKTCjDbQ
	xAhs5BdHTvxcZM4ST0/owCFfgUzbAzO66Z/FYB8bJ5zkdczUfpSwiCwYw7F5xnZ6z2RAG76NhPe
	z4QAFrFLExyOJaMemMcEGj5s++kAqJdUplxZjhPmxJj67vQLveiK7kojp14tXhw==
X-Gm-Gg: AYBFou1mh+ksItGObnDhRhxdqI/XitGGQwCcawmzFApGeOt/gfz/au8NzXtCk5obEoR
	C3wTCWI93MoVABxyaZDrVSzsDSH2QYlV5ycHsviMNzBx6qTMrf/xet4VuWe4apLSDXwSL+C+1dY
	d+SFN2R58hgCPg3Wdzzj72UX/X3JbdPTubkgofDZii3lj+rS92vPpyn5y/r1hqvQLOU63wyts35
	aUjTndE5yf3uzTFWKVHPTd+NbwtGb+kIjk7poOBIEVkHN8dx8vwEOsMyMWk08Odtzwy1s6nxzbB
	ddeadHPjoU3H5PID3SWtnLKTIRLWNFx1wLyGpojmwPvXFHM3Wh15UJtBGnzX4IgfadYIpKY=
X-Received: by 2002:a05:620a:8399:b0:93b:d8b3:f9ca with SMTP id af79cd13be357-93bdc6db3b6mr634724685a.21.1789771364447;
        Fri, 18 Sep 2026 15:42:44 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93b:d8b3:f9ca with SMTP id af79cd13be357-93bdc6db3b6mr634721885a.21.1789771364010;
        Fri, 18 Sep 2026 15:42:44 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9126078cab2sm6905196d6.0.2026.09.18.15.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:42:43 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:42:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: adrian.ho.yin.ng@altera.com
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
Message-ID: <aq2-Ysy2wbLeBWd1@redhat.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Adrian,

On Fri, Sep 11, 2026 at 03:01:18PM +0800, adrian.ho.yin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> Register Agilex and eASIC N5X clocks at of_clk_init() so they are
> available before platform devices probe.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>  drivers/clk/socfpga/clk-agilex.c | 83 +++++++++++---------------------
>  1 file changed, 28 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
> index 2bdea1997b5e..64a20c727d16 100644
> --- a/drivers/clk/socfpga/clk-agilex.c
> +++ b/drivers/clk/socfpga/clk-agilex.c
> @@ -4,8 +4,9 @@
>   */
>  #include <linux/slab.h>
>  #include <linux/clk-provider.h>
> +#include <linux/io.h>
>  #include <linux/of.h>
> -#include <linux/platform_device.h>
> +#include <linux/of_address.h>
>  
>  #include <dt-bindings/clock/agilex-clock.h>
>  
> @@ -454,24 +455,26 @@ static int n5x_clk_register_pll(const struct stratix10_pll_clock *clks,
>  	return 0;
>  }
>  
> -static int agilex_clkmgr_init(struct platform_device *pdev)
> +static void __init agilex_clkmgr_init(struct device_node *np)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> -	struct device *dev = &pdev->dev;
>  	struct stratix10_clock_data *clk_data;
>  	void __iomem *base;
>  	int i, num_clks;
>  
> -	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	base = of_iomap(np, 0);
> +	if (!base) {
> +		pr_err("%s: failed to map clock registers\n", __func__);
> +		return;
> +	}
>  
>  	num_clks = AGILEX_NUM_CLKS;
>  
> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
> -				num_clks), GFP_KERNEL);
> -	if (!clk_data)
> -		return -ENOMEM;
> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
> +			   GFP_KERNEL);
> +	if (!clk_data) {
> +		iounmap(base);
> +		return;
> +	}
>  
>  	clk_data->clk_data.num = num_clks;
>  	clk_data->base = base;
> @@ -491,27 +494,28 @@ static int agilex_clkmgr_init(struct platform_device *pdev)
>  	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>  			      clk_data);
>  	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
> -	return 0;
>  }
>  
> -static int n5x_clkmgr_init(struct platform_device *pdev)
> +static void __init n5x_clkmgr_init(struct device_node *np)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> -	struct device *dev = &pdev->dev;
>  	struct stratix10_clock_data *clk_data;
>  	void __iomem *base;
>  	int i, num_clks;
>  
> -	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	base = of_iomap(np, 0);
> +	if (!base) {
> +		pr_err("%s: failed to map clock registers\n", __func__);
> +		return;
> +	}
>  
>  	num_clks = AGILEX_NUM_CLKS;
>  
> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
> -				num_clks), GFP_KERNEL);
> -	if (!clk_data)
> -		return -ENOMEM;
> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
> +			   GFP_KERNEL);
> +	if (!clk_data) {
> +		iounmap(base);
> +		return;
> +	}
>  
>  	clk_data->base = base;
>  	clk_data->clk_data.num = num_clks;
> @@ -531,38 +535,7 @@ static int n5x_clkmgr_init(struct platform_device *pdev)
>  	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>  			      clk_data);
>  	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
> -	return 0;
> -}
> -
> -static int agilex_clkmgr_probe(struct platform_device *pdev)
> -{
> -	int (*probe_func)(struct platform_device *init_func);
> -
> -	probe_func = of_device_get_match_data(&pdev->dev);
> -	if (!probe_func)
> -		return -ENODEV;
> -	return	probe_func(pdev);
>  }
>  
> -static const struct of_device_id agilex_clkmgr_match_table[] = {
> -	{ .compatible = "intel,agilex-clkmgr",
> -	  .data = agilex_clkmgr_init },
> -	{ .compatible = "intel,easic-n5x-clkmgr",
> -	  .data = n5x_clkmgr_init },
> -	{ }
> -};
> -
> -static struct platform_driver agilex_clkmgr_driver = {
> -	.probe		= agilex_clkmgr_probe,
> -	.driver		= {
> -		.name	= "agilex-clkmgr",
> -		.suppress_bind_attrs = true,
> -		.of_match_table = agilex_clkmgr_match_table,
> -	},
> -};
> -
> -static int __init agilex_clk_init(void)
> -{
> -	return platform_driver_register(&agilex_clkmgr_driver);
> -}
> -core_initcall(agilex_clk_init);
> +CLK_OF_DECLARE(agilex_clkmgr, "intel,agilex-clkmgr", agilex_clkmgr_init);
> +CLK_OF_DECLARE(n5x_clkmgr, "intel,easic-n5x-clkmgr", n5x_clkmgr_init);

Why do all of these clk providers need to be registered so early?
CLK_OF_DECLARE is abused quite a bit today and the majority of the clk
drivers that use it don't actually need it.

core_initcall() is pretty early as well. Can you use subsys_initcall
instead so that it's available by time the platform devices probe?

I recently introduced a subsys_platform_driver() macro to simplify the
code that should do what you need.

https://lore.kernel.org/linux-clk/20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com/

Brian

