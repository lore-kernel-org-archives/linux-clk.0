Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB4E2C2360
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782753294; cv=none; b=Q8kVaNv7h/gkOFWeNqdLSasjtLcdhkMZqoWdlKuy56mntH8YktLFctVMuT0SnO1E2yq1aaDz0Esj9S/9vKuVhMhAKUxP/uvdvepNDLxvfIJYMTjzhk+nc3615ghVwkl+K/mYbSCEA9E1Yf+HbZQ7TbV7RmM9PcybFmi+5pJXA8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782753294; c=relaxed/simple;
	bh=XSUEmhwwi/42Sdu7vuNDFIiMroiCvSQdbZUp/vr1iHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIok1g+Dj2VakAogJ1zCjifqWjlnWpDeZrC4B1gY/US3k4It2FX50dS/q8K3lm80AE/lCKYKApmQm9Cgn/5vbcgC6JgpQPRz4nVrTnY2W/ZjZTGAAt4Y4LzLDVffWpaoH4H8i3c6XpUElUTXId0yCfiBX084Yqqu7rxac5acAp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQx1Hj9w; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mis7bhl/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQx1Hj9w";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mis7bhl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782753291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mloHFD8lHRGWc9buHYqgCWKHRZzcSqlxB20ESS9JMes=;
	b=jQx1Hj9w3N8GB5esr6S41hCWzcUhH8vreDWO9MS4MKdD6aBT9tJfnU5nXfQtm+k3Bpmv33
	HLkM1/MWxFFf64L5YTqC6jgZzgp5n0/CUgahyzhNoSbUbcfBZC9dvGp/dWCwy/6Zv0ttzr
	Gd82/BBtDVXGzaKbwCGqUIOu+B10pXk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-7QEsHg0cM0ih0RXKkdT2dQ-1; Mon, 29 Jun 2026 13:14:50 -0400
X-MC-Unique: 7QEsHg0cM0ih0RXKkdT2dQ-1
X-Mimecast-MFC-AGG-ID: 7QEsHg0cM0ih0RXKkdT2dQ_1782753290
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dd6a429cb6so42556176d6.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782753290; x=1783358090; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mloHFD8lHRGWc9buHYqgCWKHRZzcSqlxB20ESS9JMes=;
        b=mis7bhl/As0V1MUP3rv30f92gSaBIbEsPMhAZaskYT7EV3e8EYLBDOHgs9qMIB3Crj
         uMCh7r9iJmt+BZG5xOvxYhOLxyCaGj7CA1Q6C8pkEAPcM/F5Xx4TvENafFXFA/eN9QVR
         pyOTTTmAuXKZoMUUzrgj26TH6TYhoPoUhCFQ7apkaGkBuru79bRlq3a1s35q+/XiKCNN
         ju7q44GlU0vRVhNP6SJoOPT+zh+tTjScsEiFuiRDlxo3gEZNyCoiDRxV3EThP0JRP5Os
         WNlD8oUQxH+pDdb2hQ63QhcGJPkW2abOE50IUngdu+yazfQwA0Ux43azXJHrDy8M2Zg6
         PNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782753290; x=1783358090;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mloHFD8lHRGWc9buHYqgCWKHRZzcSqlxB20ESS9JMes=;
        b=cH3cLqgKtw7O1uBbi/Hd+bMUeEwJyMZq+DwGnGVE8uNsg4GQHyk3YIn71zpXMRYg06
         edCFwq2TRjFGpCM/oU57tyTXdgjVTGgPsb4epDnycLXUwIlsWEcVyBJDTmhjPJQ5DXWd
         OHM9qSsknYLS52W0pUiJvb/HcaCRSEnVvE90MhjtVNg7cJKY3oSR0rpQh09RnsU3YOU1
         HufbqheJrNy3Ifu7yOsQdP6ve4VjKmcx/iNL2OM9RczJjMNyM9Yqxa2VLwMvm+gLYxpU
         bFL2z0KB2NqWgfIMT83NHnevPEqMinH9poKQ34eaBJpbut3WDeBwSg4v5u9JYvKds/Ga
         //Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rpk5BbxiapHeivpMbUKcRIBjbR0bInTik5zEHfibGJQTrjE4WtKNn0oCSnbKGHkItTOwbldKO6cmdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYnVnkn/LmQM6ct1A66ja+MkPFQ5gLRUdDnfND8GvLDWiYgaG
	9wKKepls1M1z8bGq6wbrxWJYx8fbpnDOHJj4PwLYZIn1FjzdNJCgtmaJMzersm22aw22y8B74ZA
	YonbmwYZvy+zSio8R6Ra/6252OpPH1AC8pMhozxuJCtiirTcF1w/htdVkidS47Q==
X-Gm-Gg: AfdE7cmaRdvWL5p9bzu/9zxbUwnE/EdePjXvFrMGt4xxl9dYEClrcOgZL0rpXWdnBgz
	E28C6JpXHo78Vz13pSK0ngJZvZDLdlfIGmqaTMYpnFbtbW8tXkRszf6xWR8dGqIqcq62+7avN9P
	V1qk9Ue7oUfnB5gNzyVi7dcT1/HwJUCuK/S7WtSE5OPkNcHSgIA9WxAugEAQimkchCG+QGkGtQ5
	G7CPEF2SPyeV/0TMTAds0ea5Knpbz3npgmfcJGaPSUbmtY3Elx7cAxTfs1mLpGSl2s6fR6ZF1L5
	MlWrU8/yD1OpMOiLcT79NX/huCGT0GZFPwJk+aApqBRbwMKxYwhIJDajWkhG4hLUNe8Q+NSZrqm
	8iETBnzD6xXaWGfZayteUPLB2uBNzvH9t7jsTSssOEF/Png==
X-Received: by 2002:ad4:5ceb:0:b0:8e9:f62b:8f9c with SMTP id 6a1803df08f44-8f1be38d9e3mr1780686d6.49.1782753289815;
        Mon, 29 Jun 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:ad4:5ceb:0:b0:8e9:f62b:8f9c with SMTP id 6a1803df08f44-8f1be38d9e3mr1780026d6.49.1782753289258;
        Mon, 29 Jun 2026 10:14:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a736d5fcsm2694296d6.39.2026.06.29.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 10:14:48 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:14:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <akKoB3CV6AtEQBVu@redhat.com>
References: <20260617014126.1716291-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617014126.1716291-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Wentao,

On Wed, Jun 17, 2026 at 01:41:26AM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.
> 
> Rather than adding clk_put() calls, replace the of_clk_get() +
> __clk_get_name() pattern with of_clk_get_parent_name(), which is
> the intended API for this use case and handles the reference
> counting internally.  This matches the pattern already used by the
> sibling drivers clk-cpu.c and clk-corediv.c.
> 
> Fixes: f756e362d9384 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v3: Replace incorrect Fixes tag.
> v2: Replace of_clk_get() + __clk_get_name() with of_clk_get_parent_name()
>     as suggested by Brian Masney, instead of adding clk_put() calls.
>     Also correct the Fixes: tag to point to the original commit that
>     introduced the leak.
> ---
>  drivers/clk/mvebu/ap-cpu-clk.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
> index a8175908e353..1cf63c7a0bc3 100644
> --- a/drivers/clk/mvebu/ap-cpu-clk.c
> +++ b/drivers/clk/mvebu/ap-cpu-clk.c
> @@ -288,7 +288,6 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
>  		char *clk_name = "cpu-cluster-0";
>  		struct clk_init_data init;
>  		const char *parent_name;
> -		struct clk *parent;
>  		u64 cpu;
>  
>  		cpu = of_get_cpu_hwid(dn, 0);
> @@ -304,13 +303,12 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
>  		if (ap_cpu_data->hws[cluster_index])
>  			continue;
>  
> -		parent = of_clk_get(np, cluster_index);
> -		if (IS_ERR(parent)) {
> -			dev_err(dev, "Could not get the clock parent\n");
> +		parent_name = of_clk_get_parent_name(np, cluster_index);
> +		if (!parent_name) {
> +			dev_err(dev, "Could not get the clock parent name\n");
>  			of_node_put(dn);
>  			return -EINVAL;
>  		}
> -		parent_name =  __clk_get_name(parent);
>  		clk_name[12] += cluster_index;
>  		ap_cpu_clk[cluster_index].clk_name =
>  			ap_cp_unique_name(dev, np->parent, clk_name);
> @@ -328,11 +326,9 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
>  		ret = devm_clk_hw_register(dev, &ap_cpu_clk[cluster_index].hw);
>  		if (ret) {
>  			of_node_put(dn);
> -			clk_put(parent);
>  			return ret;
>  		}
>  		ap_cpu_data->hws[cluster_index] = &ap_cpu_clk[cluster_index].hw;
> -		clk_put(parent);
>  	}

This doesn't apply against Linus's latest tree. It looks like it's just
this last chunk that's the issue. What version of the kernel did you develop
this against? The last change to this driver upstream was from me in August
2025.

Please submit a new version that applies cleanly upstream.

Brian

