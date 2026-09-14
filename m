Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7F1488200
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405048; cv=none; b=Z4st5T6ls+i7EjjZw7pfUXIDcGajCFZOBHIklgibINcspiBMegJ3gbYV1bm2rC/AaD/l2U/2AVUkJOxmj/Y1DmJaKN4iT0LuIZSyuGMCBwoPNNWbwrtzDmWFpieu8a/qqyqJrLH55hf9FizzDYmb8+DjwTajd9DWW+8S4Zaa1m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405048; c=relaxed/simple;
	bh=uVw9vIxjDeVFEUcpIkDbKMJ3BRJ2DCL3fmL5T+0sdyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Du2Nvuf+8Jtzi1hZwF6OwbX4kYRLUQboALnhYzwK+zaeAbwiBRnEpzIkwQ4Uttu7GB7CD1iOc95jWWDU2bI1U//704F6lEAJ8/DlYTo5hlR40WH1C9nXgIQja+0t8fSRDRbr2hHxORezF/uzC/g7+gZZxaumMgMyJLemn27WpV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g3fbzzQI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HZLXABK6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g3fbzzQI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HZLXABK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789405046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
	b=g3fbzzQI3wTNzpse4MRk2iGH7SPRM/kGsgxKKG4L2PDvod2+c/A9lv28RlQxsL/2wsCikc
	ft5z2CKGRba9vKFasQCdYz/jylCCEWwQHhwObM4cxb29CJ7lpm4zVBE5M0E4YPNOuMIh4L
	bM3yVxSvSDLyY5GDcq8aWr9+GFy3yLI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-BQdmKuUwMkKU1ja92KkMsg-1; Mon, 14 Sep 2026 12:57:25 -0400
X-MC-Unique: BQdmKuUwMkKU1ja92KkMsg-1
X-Mimecast-MFC-AGG-ID: BQdmKuUwMkKU1ja92KkMsg_1789405044
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso810305685a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 09:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789405044; x=1790009844; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
        b=HZLXABK6PR4eUcA6po7sGnb4Mnsc6SOmgRWuUEuKCuFVUw2EZwTiX3detk5uIYxc5X
         I/+CHY4QwkbGtEb4P4FbSmB67Ps7cw40u8/kW7cUpJJ+SlckyoDYdO4FoaGuQjBZIXBT
         bICTiyg70EfnpW5O4OfJdggegle7QlHTy1F4zF5H9PZSt2psw2F1+DCHBvA6VXtmZTRT
         E3C44TQdp33qykMZh8olkks1xg315DX4tV1EMpeUJ5Nn5oO9DvfpEkDQYR5b/3p0V+gy
         U+fgdAML2KP2ZW5vQ8pt2wAkWx2BsPmHhItDZ7i50JpkpYbTd60+GMttvkDfV6srortw
         9+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789405044; x=1790009844;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
        b=yRZWWwcugcGgJbYNjX7nUeXroDUTVj9MBYm2UMD2jlT6mItitx7EMcmOqGuMvc/0ey
         VYYbA+ikCGcCTyfz9BXWn2GZyOSTn9kf1WGuim0+86+cICe9PESDzngiwd7qTzUuBl9j
         QoJWNvX/0K+efohdIueZ3SEJowfC+NRwJf/lqFIjE9t4odb5xl6IWKWJpOBa2sTeviBf
         2kxIN7fIQYVDI2Cj8dvQzpLgSKXNS/tFhWqmT5zSWzuRmATuG41dv/0XV+GuuiV/aTZo
         wtPlr8Ls8pVcvjKKdEteCf1OnaEtMS5EXL0hfeihhWVKqV4TyuoDbTm9b89eJosSIbDG
         v62g==
X-Forwarded-Encrypted: i=1; AKwUvBwxDAGGu/eEFrzQSWV2SZHxNe2rN68Sw8TCvNfWC2EAEkW+pIxcoK+tWoyR8VOgKvemMvsnFu4e9VQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kTuDjctah8vcTfps/EbIz2bSDX85jz3WKb315JDCJyDfSXuab1
	L/dWCeF8tUej+oBQkzMgjslZzzxDXbEr/5wEdco47dQJy78ZdMp19oxy4xaVYO/y+YTcekKoc9K
	GKgtotZQcSOFhpap9781odRvgfNkqealfQcUpopE0eU0XdPXTDu9cKOgS/Q9jJQ==
X-Gm-Gg: AYBFou0y7/MqGS0RBLW56clhKw/7YTMPpWQU3CBvJCFC0K0ZGW4AHoCLNWAQxL2w6U1
	+HF27jafSDNUCozgEWiBvukrfuMj6OF8ed6zYmXGIHTYGKvPjL/i0QLcIF4I1+YXHt9BMJMwYxw
	VeAlbeX7zQ2ovOlGYH6Cc1x2oyNPGyRF83QifNx+E0OD68IiMqqGNPuwTTSTZe+DyapE/KO8Uns
	iqh/ZFkj/eHMYUuk1BWutzU+xhtMjvsIGoS/PcBvildUJtwgF91r84Zf/UIYkbcrdABn0aDwg4F
	P/HNEXt5Uhl5n1rgf/pWgSe1A0UTvTI03u6jZrY/bkvJEw9WwMAo5Ku+EDlxEtljryEbS0pPOVQ
	XBvWdCbqokkCWsuemX+H7KS16tOdit7THPyo=
X-Received: by 2002:a05:620a:4802:b0:937:7836:1501 with SMTP id af79cd13be357-93a2973a2c7mr527254485a.10.1789405044432;
        Mon, 14 Sep 2026 09:57:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:937:7836:1501 with SMTP id af79cd13be357-93a2973a2c7mr527194085a.10.1789405039208;
        Mon, 14 Sep 2026 09:57:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f19291sm1072082885a.10.2026.09.14.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:57:18 -0700 (PDT)
Date: Mon, 14 Sep 2026 12:57:16 -0400
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
Subject: Re: [PATCH v2 1/2] clk: eyeq: Use devm_platform_ioremap_resource()
Message-ID: <aqgnbA_yMRXczyao@redhat.com>
References: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
 <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Benoît,

On Mon, Sep 14, 2026 at 02:16:44PM +0200, Benoît Monin wrote:
> Convert eqc_probe() from the open-coded platform_get_resource() +
> ioremap() sequence to devm_platform_ioremap_resource(). Besides less
> code, this requests the memory region so the OLB registers are properly
> reserved in the iomem_resource tree.
> 
> Move devm_platform_ioremap_resource() before checking for device match
> data, so OLBs bound without match data also get their memory region
> mapped and reserved.
> 
> Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-eyeq.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index cf37feccc734..3662e6990bf7 100644
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

As Sashiko pointed out, it would probably make sense to just convert the
rest of the driver over to use the devm_ variants where available (like
of_clk_add_hw_provider).

Brian

