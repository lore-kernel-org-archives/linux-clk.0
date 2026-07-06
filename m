Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D813E9C19
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783370593; cv=none; b=oH2zeRakmDC09WuE7dyGqIYF2M83W5oKjuQjGpJtv3x3rrWy8cfsw9aqtaapiTPRD+E/KYyX15C0HlDWPC47Tl9g7r/T2T1kTlB05wX9Jeg02kYj3NvIlcFHDomtPbQDYlsuqTvsjTvvu0vKkqohLTvqYHRkKRRf8ZH1dqPdtXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783370593; c=relaxed/simple;
	bh=rdHWKQtKnLg83grHgN5IAyACJE//06tR6Xap9IRwE2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDhLvRAxmwi3EadS0M+n/RFdNtitA1T0Ogune1q637hZdy9jMGcSxyKgDSJFyrR8A0v8TzMGhBFShE25iA3ETb7YVokWHyfcI6xLmt0O/2dLnD+dhOPMKPFS1xtRbozsBfTvSbUC/YHybQ0NOBS1A7Z68poF9GPHXYS2QH2VpZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FfkYQ49Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CkpKR+UL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FfkYQ49Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CkpKR+UL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783370590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0yT3cRB/ZfiLQ4mk1Xbwro2I/aUVBk2/yCRP+/Pzhg=;
	b=FfkYQ49YRDCrHT6hDF4LdhaTVFkAHeNerEUccyTT4UfY9TFDe1fGongQMrcK71r95VQTW3
	2zofffZxE1Rx8U6mmE1NuRv85/aJ4lK19utWhThg0dQh/5CUq7stkl4K57AAAJJs64SMLk
	bxiBD79IpjcDmGJH8BlO1svg2YmgOEs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-lrYiC1uWMNSwqm7pv6K0sQ-1; Mon, 06 Jul 2026 16:43:09 -0400
X-MC-Unique: lrYiC1uWMNSwqm7pv6K0sQ-1
X-Mimecast-MFC-AGG-ID: lrYiC1uWMNSwqm7pv6K0sQ_1783370588
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f45dde7595so39384056d6.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783370588; x=1783975388; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a0yT3cRB/ZfiLQ4mk1Xbwro2I/aUVBk2/yCRP+/Pzhg=;
        b=CkpKR+ULNyObLROQ8kW5wSukIH8hOtxDzeLxrjcMAZHlXKFQcFxnfMGVkRfm3Msjau
         1LWcYUlxmItIMyb3BE++5J0FlTVnEF30xt5nz8jn7IYJ5a9i/5JRvWBd+Le1uRpteFnG
         jNAFry2OMwnOejfTty/+oi20tMCnlQoXslFZ3C1Q+HqOWxeHX75JvO1CB1L065K/PuOA
         JmeZ7bQUOPwx9MgQ/Yir7dqNSTUnVqKiAVudaGjs0iRBtwsMT2ZcowR5Rv2jlXcrsoap
         APSNaZXlIns6nkbyzhZHmzIAt38l+nTffsd02ENrF+w21w408Z0/IGSFk/F2X73qYQ1i
         bXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783370588; x=1783975388;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0yT3cRB/ZfiLQ4mk1Xbwro2I/aUVBk2/yCRP+/Pzhg=;
        b=OCNGJrf4ExELS9xed/Z1S6QKozHhZE+GFJqraOQn/3qfM6QraGFEXoVoyM1+NiOOws
         wLn5oU537L5ayK/4F7Xfj8pJHI3HMzOZvAlQPo7wWqs5g6zmoxcn+FRCJqDFRpLoPpHF
         YqBn4vYW4V/ZHrb6Mpk7lOE59s7UxPuPHx4NpbsSKmKDI541/Y6SpSaCgjr75gLVNf59
         ngD0ymvkV2Vgj8dEXW4ajN/BgRQMIMbYGheFAljRIzQ8/ruR8fR9utINGBlSDL+Rlvko
         V+69YQSdnfTix+7Mcx1EWsUFKiPcskLExPv9p/3ZXxDWhctaIJHuouDKe6f1B3FnVwP2
         K2Cw==
X-Forwarded-Encrypted: i=1; AHgh+RqRjknvnzlNL0NsyeyZrPD25o4iznZhEiAW/5Fh2VZnxoCVULkbS0H/7nJRPVtVh3O9DMrPACQRo9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyctDorScRPgITJQjEzcSWc4AcRcqpDTMB7PXa3Nig+m+XHxuxw
	iKmKSi9KF9ZN40Y8o6xH9719tGJNQfXGi9W+jBN0+xfqCfsw1MtHfO/dQdPqnqzpp8MpPMpqay0
	qGEOipJXRhfOM+sYfbwjgNXCraYvCR4I+jt0hMwRVoofoQHUubKoK+1AGgn0cTw==
X-Gm-Gg: AfdE7cnDb84hGP0wijM7wcIBStRCszLhrEi4a3Gt1qWdS3gaIOeqEdcrDAEJcAmy8i/
	Io8jaDMw+FiMtvsN+9jHJilFqUPimu5R+LeQr8o4q6+x2ClMhNEBIyuYGj/VNpEMzjkq/l9etae
	gDq3J6zoXlImie7dH4naHvohhQGT5M9uKI0ex9Dy8hDSVIZ3oQGHiibDEMPHk2WhWRC5YI8x0Xg
	gdhsjJpA5iGGmsB9cIrJav8D1lkCNddszFArMdJtQEaip+FVQ4z2hXi9q8i1XpL1ZfH6gczMptT
	IGaFpZ3r6h98Rxj12ybq3NGEI+XzQQK/sjCPUGdmEA/p4eWacboiH2xVXpmkE3RZWrZ73l71swk
	03CtOFjNUPJYEr2KdwmOiUCYihZ60tdmKFC2v9SqrhQY6ng==
X-Received: by 2002:a05:6214:1d01:b0:8f3:f17a:a3f with SMTP id 6a1803df08f44-8fcb25aa951mr31607466d6.3.1783370588058;
        Mon, 06 Jul 2026 13:43:08 -0700 (PDT)
X-Received: by 2002:a05:6214:1d01:b0:8f3:f17a:a3f with SMTP id 6a1803df08f44-8fcb25aa951mr31607136d6.3.1783370587551;
        Mon, 06 Jul 2026 13:43:07 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f472a9ad1fsm143039156d6.47.2026.07.06.13.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:43:06 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:43:05 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] clk: palmas: Balance external-control clock prepare
Message-ID: <akwTWVaXuJ57OqSO@redhat.com>
References: <20260624070602.10328-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624070602.10328-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Myeonghun,

On Wed, Jun 24, 2026 at 04:05:42PM +0900, Myeonghun Pak wrote:
> palmas_clks_init_configure() prepares the clock when an external control
> pin is configured.  The current driver only drops that prepare reference
> when external control configuration fails.
> 
> If provider registration fails after that point, or if the driver is later
> removed, the prepare reference remains held.
> 
> Use devm_add_action_or_reset() to manage the prepare reference.  Use
> devm_of_clk_add_hw_provider() to manage provider registration.  This
> balances the prepare reference on probe failure and driver removal.
> 
> Fixes: 942d1d674931 ("clk: Add driver for Palmas clk32kg and clk32kgaudio clocks")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Please split these into two separate patches. Otherwise, it looks good
to me.

Brian


> ---
> Changes in v2:
> - Use devm_of_clk_add_hw_provider() for provider cleanup.
> - Manage the external-control clk_prepare() with devm_add_action_or_reset().
> - Remove the manual provider remove callback.
> 
>  drivers/clk/clk-palmas.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
> index 39049f62db..fdbf8445eb 100644
> --- a/drivers/clk/clk-palmas.c
> +++ b/drivers/clk/clk-palmas.c
> @@ -194,6 +194,13 @@ static void palmas_clks_get_clk_data(struct platform_device *pdev,
>  	cinfo->ext_control_pin = prop;
>  }
>  
> +static void palmas_clks_unprepare_ext_control(void *data)
> +{
> +	struct palmas_clock_info *cinfo = data;
> +
> +	clk_unprepare(cinfo->hw.clk);
> +}
> +
>  static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
>  {
>  	int ret;
> @@ -214,13 +221,18 @@ static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
>  			return ret;
>  		}
>  
> +		ret = devm_add_action_or_reset(cinfo->dev,
> +					       palmas_clks_unprepare_ext_control,
> +					       cinfo);
> +		if (ret)
> +			return ret;
> +
>  		ret = palmas_ext_control_req_config(cinfo->palmas,
>  					cinfo->clk_desc->sleep_reqstr_id,
>  					cinfo->ext_control_pin, true);
>  		if (ret < 0) {
>  			dev_err(cinfo->dev, "Ext config for %s failed, %d\n",
>  				cinfo->clk_desc->clk_name, ret);
> -			clk_unprepare(cinfo->hw.clk);
>  			return ret;
>  		}
>  	}
> @@ -230,7 +242,6 @@ static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
>  static int palmas_clks_probe(struct platform_device *pdev)
>  {
>  	struct palmas *palmas = dev_get_drvdata(pdev->dev.parent);
> -	struct device_node *node = pdev->dev.of_node;
>  	const struct palmas_clks_of_match_data *match_data;
>  	struct palmas_clock_info *cinfo;
>  	int ret;
> @@ -264,24 +275,19 @@ static int palmas_clks_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, &cinfo->hw);
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get,
> +					  &cinfo->hw);
>  	if (ret < 0)
>  		dev_err(&pdev->dev, "Fail to add clock driver, %d\n", ret);
>  	return ret;
>  }
>  
> -static void palmas_clks_remove(struct platform_device *pdev)
> -{
> -	of_clk_del_provider(pdev->dev.of_node);
> -}
> -
>  static struct platform_driver palmas_clks_driver = {
>  	.driver = {
>  		.name = "palmas-clk",
>  		.of_match_table = palmas_clks_of_match,
>  	},
>  	.probe = palmas_clks_probe,
> -	.remove = palmas_clks_remove,
>  };
>  
>  module_platform_driver(palmas_clks_driver);
> -- 
> 2.47.1

