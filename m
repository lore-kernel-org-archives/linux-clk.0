Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E64BEE3C
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170847; cv=none; b=PfscXvSikg/MA3JJlYaQzkURXjSL3u2m+1TQjHihTJ3CYngGodf2iGGni+GNY1Lczgp7E0eP4SCyUGLwOMJc3gnhhQWce/xtiDi8oWJjdgn6xwg4+JKTPdkqcq9oCZUI4Ebh4MlAGuHv7LhEK2iJza2sfLetnn9MOIdrY1U4Ffw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170847; c=relaxed/simple;
	bh=AhGRne8scMnXdCsxDSbn1g1zYM4uSCys9RuLljGwmns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APevUw2VUcG26sQy7pT/Jv5ooWuNRNhKN5LYhLAdBVMa1qMkch002OnaZEdG/kl7PBTMOz9zs6GDx2g4tsI8sG+Pz2O0dh4uvY/wdGqBipQBCD1C1qfQ4gf6TVyYaQ6T/o9S6UOFSSWIrSi0Zv9k5wpXYJlbcjM4SghMFWjQrKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZ5b8Uk9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=thmv0Lpj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZ5b8Uk9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="thmv0Lpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789170840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P01ICaDhB6Y/9B7lpP0PK4Bgc8sZGn3B2i3qpboQMSM=;
	b=fZ5b8Uk9pwtbuaCxOXiQ2Qe/AkY20wCy26fv6vWrGvIKQVPKb9PwQVyoCPRnXMdoWCr9eF
	/iUmXM5p46n7U8j+GLv6mpghniOpaMHY5kNoDLNHmGGI0UcA6Kiw9ZPhAcmYD2krIjYBRF
	O5LD7HSLwrYsLwi0abd1DRxJSTknnVU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-2BBCmWymN1uB6lhVZVAJQg-1; Fri, 11 Sep 2026 19:53:59 -0400
X-MC-Unique: 2BBCmWymN1uB6lhVZVAJQg-1
X-Mimecast-MFC-AGG-ID: 2BBCmWymN1uB6lhVZVAJQg_1789170839
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93771aa0379so279700285a.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 16:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789170839; x=1789775639; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P01ICaDhB6Y/9B7lpP0PK4Bgc8sZGn3B2i3qpboQMSM=;
        b=thmv0LpjZ4EPz3NKWTkjlsEUzf7NLGDs7qbH5MCgrgE4Eri+01i31VuVH/iFmtKSrO
         FvMEDcnpyQB6co7pVDGOaHxUWXwqmpv+LHaym9kr9hNRvNkGrSBg2PTpMmkZMpYXHRCj
         QaO5qsPTnhs3DddmBGTxJaIXOvWzPfbbf+eP3/QzcETIjfcBAzLnI78ZS257T6ITQUvO
         SN1epTsv3A1Yi/lHCvit+1D6Us2uUnS/SeqEvb33ojDL/f2wjL1hzladhnSLC97aUAEN
         hvP9WAvqNwsm9GZxToIsVWsL+Ks478TcYTfl4w10Kq9mAwaZHI2OcO4kt2LoF6cEOxv8
         2BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789170839; x=1789775639;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P01ICaDhB6Y/9B7lpP0PK4Bgc8sZGn3B2i3qpboQMSM=;
        b=GyH89pBZf4w+M+BcCp7uer9SO2drxHbN2XpjWk5YQJDNahH5PJ/PG8zge50GJvT72A
         FPnP55tM1ZSo68SJMLQ5Z+WBqQck+x6vT43WEzmmuYuuTg65IYDGRyjUTK5jI5Bypacx
         ndE5s/YO0PKeuUdLX0TtQU/8tb+F+j7ypORVhAYG8DgdMvI02dC2HrY8QJvIw3AjVm1y
         I4OAyeYNMR8v+S/1cIwfx3mTFzPU/Ua3T5sLVdfNiyjNz74FAnIuZ20bAmykXiUJfuCq
         RJ37Wk6AFQmhRdYebYL3tZYLQQgzZ88RdIGHHu7nN0qUhg3M/6B/ZKN4asgS+xFkXHYN
         pWgw==
X-Forwarded-Encrypted: i=1; AKwUvByNUNuKGhoUCGOeXi7cQUnqQb3NDtmjNHXpMos9MwgBKbXrEs1DiMMGJEwtjOjCDkckyi72Qdfjhes=@vger.kernel.org
X-Gm-Message-State: AFuF++n55O+jrmi1s2zIjjWxzxzpv6GqUncNkVSnkfwn7tWC+jPjcSpB
	ozn96CWVrJ67X5J7w/HWhgYXr+uVb3J/SvG8jOV9yN6AZqjJSv/tB0eFEKQwB4RHmJOaqNxkVaq
	d2omgjhs9LmoQwTPN+rWw7rDWAgUklvA+O11jgiGaSAgH/QuhDR57NP7kKjHX0A==
X-Gm-Gg: AYBFou0TfC1hqXPz1fUZS8YKs0kENLhfp0+gtEYpSeV+cbPWnV6+tOWKaPtMunQC+cr
	V3Hit1g5HLg16bGggNyrWKd/GY5ZAbArj8gc7u+2M5mMZOMJWp2/thUq4hOkfX7aM4hY/tR4xxe
	w4O3cI2pmxJB+9x30VjDsKVvV+FpHP3OhCUMT9QivvizFcLuwL6z+uw4yrYXVwqTXQHqeq3ugWg
	7t0xHRh399GeMFPWiQBpTfRPIkBrTS4aAARE5ROViGJDFy/gktoVcAJexs6p0Z/qBKMBK18fvRt
	/s2bDgkfGnD8x23J+URAQJT8jXrB5W63wfxnNZC5Ti23LJuSgR/3KF7XHMNaOWdU2tXVnB2btZF
	G2/C4jHy9TXVXGBzsbrufrbtVS+hN/nUbx/U=
X-Received: by 2002:a05:620a:6188:b0:939:5c62:fddd with SMTP id af79cd13be357-939ea134eb5mr1100339385a.19.1789170838692;
        Fri, 11 Sep 2026 16:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6188:b0:939:5c62:fddd with SMTP id af79cd13be357-939ea134eb5mr1100336485a.19.1789170838210;
        Fri, 11 Sep 2026 16:53:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80e0c74sm368993485a.41.2026.09.11.16.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:53:56 -0700 (PDT)
Date: Fri, 11 Sep 2026 19:53:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: eyeq: Use devm_platform_ioremap_resource()
Message-ID: <aqSUk0DcPB0WlorJ@redhat.com>
References: <20260911-clk-eyeq-res-v1-1-39b04542db38@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-clk-eyeq-res-v1-1-39b04542db38@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Benoît,

On Fri, Sep 11, 2026 at 01:48:47PM +0200, Benoît Monin wrote:
> Convert eqc_probe() from the open-coded platform_get_resource() +
> ioremap() sequence to devm_platform_ioremap_resource(). Besides less
> code, this requests the memory region so the OLB registers are properly
> reserved in the iomem_resource tree.
> 
> Move devm_platform_ioremap_resource() before checking for device match
> data, so OLBs bound without match data also get their memory region
> mapped and reserved.
> 
> Add an entry for mobileye,eyeq6h-central-olb without match data: its
> clocks are all registered by the early init and it has no auxiliary
> devices, so probe() now reserves its region and stops there.
> 
> Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-eyeq.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index cf37feccc734..bb680283b6f2 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c
> @@ -513,21 +513,16 @@ static int eqc_probe(struct platform_device *pdev)
>  	const struct eqc_match_data *data;
>  	struct clk_hw_onecell_data *cells;
>  	unsigned int i, clk_count;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
>  
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
>  	data = device_get_match_data(dev);
>  	if (!data)
> -		return 0; /* No clocks nor auxdevs, we are done. */
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENODEV;
> -
> -	base = ioremap(res->start, resource_size(res));
> -	if (!base)
> -		return -ENOMEM;
> +		return 0; /* Early only clocks, stop here but keep resource reserved */
>  
>  	/* Init optional auxiliary devices. */
>  	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);

Can you make this one patch.

> @@ -1175,6 +1170,7 @@ static const struct of_device_id eqc_match_table[] = {
>  	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
>  	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
>  	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqc_eyeq6lplus_match_data },
> +	{ .compatible = "mobileye,eyeq6h-central-olb" /* no data, early only */ },
>  	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqc_eyeq6h_west_match_data },
>  	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqc_eyeq6h_east_match_data },
>  	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &eqc_eyeq6h_south_match_data },
> 

And this a second patch?

Otherwise this looks good to me.

Brian

