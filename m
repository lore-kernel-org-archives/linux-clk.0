Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139DA1E51D
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 21:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756849764; cv=none; b=IObOqxmm4X/CwiwymX3zYlgp6CO0o6bgM/GVMv3NEa+avXaGoiy+tA3xbfAXMQ58pnYkPSnn4bi/+F/6hxu0+RXVK2XfwJ4vBRExuFsTbqxTQr+vRTcNeZRO7aMQgzQzr/ksysWclm3f7wQ7OMpeK6w+aly6lfrIZm9y9o8C38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756849764; c=relaxed/simple;
	bh=neN4/Xko4YcDJzuw40O/2fBeVJJQtw7JPWEFeXXUNzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEbME6x9HdlUbkWau8Q6RBw3hjR7nmAGlik/r51s+bGbr6Q1+99ScZQG1nFHqjFBFIODuTKVNqWM38HaY0/1jPqiLJwGtuepZNhvLuLP8zfj/V6zltqZ9YszwZeQ+M5qQyjhku6fm0kHs2IdToJLw2eTN3FBSbpf7SM5fNZGh9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5XzPNru; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5XzPNru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756849761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hsHmX5g0hW2RuOd+pFemlGczz+YYMgcCD+tzI6cEH+Y=;
	b=e5XzPNruVwIa5n3YPpbPJSxwK0Sty0D02i/oMxKLLKsCxTGecGH63Bo8bwZqvsn9Oz9LPB
	PdCAlbGH9E/W3xTRmhmPQS4uhJ3xXJIdbXlK6TV/H32OAQOPFn1SpAGHmDwicT4kvQYUXX
	DL+G2oDMVsXAALzZgkduUvP6c6+TucM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-P4SCoaVBPTK9sVjTEfCFQA-1; Tue, 02 Sep 2025 17:49:20 -0400
X-MC-Unique: P4SCoaVBPTK9sVjTEfCFQA-1
X-Mimecast-MFC-AGG-ID: P4SCoaVBPTK9sVjTEfCFQA_1756849760
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72048b6e865so23911736d6.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 14:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849760; x=1757454560;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsHmX5g0hW2RuOd+pFemlGczz+YYMgcCD+tzI6cEH+Y=;
        b=pZ4ux332KL5XgwlGbqplTNyDNHhL7anbi2K9x3RUr4jYEfXAIitviV3WraCtxgbF2u
         TBPwaHauRuBz6joEfdGyUiO1Zk95eigO+FtGIMs/ecPUn9XNAHGSO0QgzBm+Yx9O754S
         PO3bSOotBaye4n4+vYaCwj8lDRis19M2ccJS1Nv0d1Wc2/lKIq+dY0ilt3pZk0ik77jz
         lBg4ZY7iyHt6fVUAnVT/uo2y8+9XavB8Vpbj4PJv0PCTMUpvx+BxFKPhthJ7dmIYiMMF
         MagTejxE7wtMjXO8BMZ4URcz16IvPcaAGYEIKmzN3N5mAHZPpQexeWdVe8YLPXFiNrG8
         PObw==
X-Forwarded-Encrypted: i=1; AJvYcCUzUyIeQCgKRYVIFvHxmO+/AMcGAzzGwqri+85s/DqJfBtnVL5mZUlj8ok0NbwGPFp4zcLUcyKKsCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVesJcwfqO/21eGmpyTdA0vcQYD+Y3RD5mWtkw/g1DhOzxPlmI
	hsofNe+oXQoxSKqfqf86farFZ3r4qb+bkZIX+ltzIBKlEERsDvnq8tMG+jM2nNsCBy/okwiKpRG
	2lJLREWqQt0P8F/3aHrlHg8B0Yy/pTUaeWu/HCZW1cQqQUo8egr+60yMP6FDfAQ==
X-Gm-Gg: ASbGncu1y+GvwRoZIsaNXza15n35zhonLZR9Ffz1Ks4NEXmxFk7MaCNQ8Ne/ji70Vvl
	Kuw6VWXN5gIrT+OLc7sNuKN8LDRMeKkoAx/aNRmPWyHk48eQoyon32W2udS9Da+hEToYJrchKTm
	nypp+VS+u4WVeRfl7UqZIuE+N0LvcMzppVW+LWsJ+AivKPiG+WS530eLOTcs5VvKI/wORM0Xda2
	gZF26fa89krmInZhhz+JSuF8VpGjG/M3QrDD0myNmUeLFb9W2JYqku0kDmalRIuZL7W5mAzf5bw
	2cyYmB18iQaYktN4QsgB4xFBzcOC5lPhrbxuwxFDVvoVQWhj2VKc8kbdChLpr2VliUO9nMnHpZk
	Qdgjbd9zF1QmgF/HVSFs=
X-Received: by 2002:a05:6214:c67:b0:71b:f511:7228 with SMTP id 6a1803df08f44-71bf52ff870mr81595626d6.51.1756849760167;
        Tue, 02 Sep 2025 14:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwgG5MrCRiY+YEj7wHA6pGiT+So5GhjsjCrEdcrEastQ86ZBZAbzbVRYsDLAAf8z1862oXzQ==
X-Received: by 2002:a05:6214:c67:b0:71b:f511:7228 with SMTP id 6a1803df08f44-71bf52ff870mr81595306d6.51.1756849759591;
        Tue, 02 Sep 2025 14:49:19 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b475d63asm18667696d6.48.2025.09.02.14.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:49:19 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:49:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aLdmXcdJnoeXEJaQ@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Sep 01, 2025 at 11:51:46AM +0800, Peng Fan wrote:
> Parse the Spread Spectrum Configuration(SSC) from device tree and configure
> them before using the clock.
> 
> Each SSC is three u32 elements which means '<modfreq spreaddepth
> modmethod>', so assigned-clock-sscs is an array of multiple three u32
> elements.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk-conf.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..dd6083597db3f8f27d86abf5640dfc3fb39a9b88 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -155,6 +155,71 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
>  	return 0;
>  }
>  
> +static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
> +{
> +	struct clk_spread_spectrum *sscs __free(kfree) = NULL;
> +	u32 elem_size = sizeof(struct clk_spread_spectrum);
> +	struct of_phandle_args clkspec;
> +	int rc, count, index;
> +	struct clk *clk;
> +
> +	/* modfreq, spreadPercent, modmethod */
> +	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
> +	if (count <= 0)
> +		return 0;
> +
> +	sscs = kcalloc(count, elem_size, GFP_KERNEL);
> +	if (!sscs)
> +		return -ENOMEM;
> +
> +	rc = of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)sscs,
> +					count * 3);
> +	if (rc)
> +		return rc;
> +
> +	for (index = 0; index < count; index++) {
> +		struct clk_spread_spectrum *conf = &sscs[index];
> +		struct clk_hw *hw;
> +
> +		if (!conf->modfreq_hz && !conf->spread_bp && !conf->method)
> +			continue;
> +
> +		rc = of_parse_phandle_with_args(node, "assigned-clocks", "#clock-cells",
> +						index, &clkspec);
> +		if (rc < 0) {
> +			/* skip empty (null) phandles */
> +			if (rc == -ENOENT)
> +				continue;
> +			else
> +				return rc;
> +		}
> +
> +		if (clkspec.np == node && !clk_supplier) {
> +			of_node_put(clkspec.np);
> +			return 0;
> +		}
> +
> +		clk = of_clk_get_from_provider(&clkspec);
> +		of_node_put(clkspec.np);
> +		if (IS_ERR(clk)) {
> +			if (PTR_ERR(clk) != -EPROBE_DEFER)
> +				pr_warn("clk: couldn't get clock %d for %pOF\n",
> +					index, node);
> +			return PTR_ERR(clk);

This chunk can be replaced with dev_warn_probe(). Sorry I missed that in
v1. Otherwise the rest looks good to me. With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

