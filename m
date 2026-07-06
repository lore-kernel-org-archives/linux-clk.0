Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB12EC54A
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357470; cv=none; b=bYz9ktfRbTMBd9Ay71+G3zRuh748p9E8FFaoO7BOSlhtvkKRRq46u4oeCQPx6JInzK2dywv8yKgCurjjAtK6zYGnt3hy9Sk5AWC+SLUj/+QOPA6ZVPAYeZFmHvGvcmDSmvsBTBAujVaMn4UYUH74D27DEOJxDFTr3D5At5BtRe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357470; c=relaxed/simple;
	bh=a4wb/xN7UurD/IYbLO9lZ5lPVRHhv/ioH0qI5oNYemU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olJUmf8vnkPFe2pzxX6AkpQblNS4pR1t8zLre8qEjiZAXw4olQXcWKAFArsoSwl/cSV4m02kD9DOm/wjsyUAO0+tYna1dlmSRhSrut4DdNxzguyFQa8IHhci+eUOJBNvp9a87HatbuiP6QbITNdzAGA3u1l0RmwILv3SCxaZKKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rq1OtlOz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AyZR/hVZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rq1OtlOz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AyZR/hVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783357467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fsOcXG94475Rq3KXKFOIrq2DIdUwBWFMm4w0uht6wYo=;
	b=Rq1OtlOz0C4txRJp24o6hCw/X4KqyfHcxPBwNqmRs3/7RevvK0vU9BS1WWBaVglw0U6pBL
	PdUk1lu5aUZzqQ9NEKidwZQU6LotuG0ZSi/kyfdoH7/W+HVVXiPxDbiabt5om07e4rlVZi
	9SVG5SLf5/D/iez3Ld5nfIEQ9/9ORvY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-Dl-dxHZTPFq_l0eMMG4EMQ-1; Mon, 06 Jul 2026 13:04:26 -0400
X-MC-Unique: Dl-dxHZTPFq_l0eMMG4EMQ-1
X-Mimecast-MFC-AGG-ID: Dl-dxHZTPFq_l0eMMG4EMQ_1783357466
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee40bceb55so44695806d6.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783357466; x=1783962266; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsOcXG94475Rq3KXKFOIrq2DIdUwBWFMm4w0uht6wYo=;
        b=AyZR/hVZyuXz3HlcHSfkQs8YnBlqKrH3+mDL1Vi3peTyB3YQrBP6twaQlKoStDn/wG
         AHgbRW+uRmmGksaQbIsJsgdtlTYHV+DO+Y3lcU+xHm4/p6guqF2cZsErGPZoZCTcp8Av
         br0A85/OD07rEIoFH4iUuHRerENKetP/QaBVvD/fYIgfYsYQP0Wgp8zj6WOm/TPCnXYJ
         49cCUH6EY2pU10wdyltObQ8oHEuJq47y+1U9YOi/6pB5rFsbR7sqEL+dNvXKR3NhGkGS
         aOysI/AWF1E4WdawGd7JZmVA16R3D1ICa2RHNcBKwwyZ29M/8tuYTLSa11qP27a1r8Qo
         6ODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357466; x=1783962266;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fsOcXG94475Rq3KXKFOIrq2DIdUwBWFMm4w0uht6wYo=;
        b=NQOhP/AAzGPkDVoJZA8i7T0m9d9FDStL5NiLf57wQykcDesbdYSI+UhR/0ZBggGaNu
         IWg5wKMte6c12s5wddrXCuAVrX2L2TGwRwbBLXy8sYxjeNnCjnE+kWz3/dnNUngj/EmP
         1si3leLYBJjbts1EVb9EHtFPHeSS1lrjJ2P8NWSQmzF+Ttm+4Jm9VtUiunFws18Le5Rq
         nE16+zSjwEoYjq6URxo4wA8rIb9dQTZKu7BF/ZktAE0OHkQTbcO8OVPSR4UrjyJ+AwqJ
         AhQcxCEhvXtV0z4Q8uEcuX9df0IBuBzByoz7TxGvYvzcvHDgB2H2H+6FqwdoSTdI/x+i
         CP2g==
X-Forwarded-Encrypted: i=1; AHgh+RrtuQJlOfLhsY8/vXW/ZiDd5+MPl1dwftx3lp5RU/+z9UC+JoNtAWNdPwxuM6YNzBsx7xN3sn/TQ2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxrxZVHBPM+Sg3MAAJi95fiDSp0SyCAuIf39ZRIrATyr6ykQT3
	WHqese16EHntgvVM5I4tyP+uC7IfPdBLqKVcix8ZPIRFwyvJvT8AOZL2ke4RKouHM3jUir8gnHC
	Nim3ET3ycfnHPJ3tRGKoh1a0l8LNdwcTitWV/GtSjVqVFEivhhg6haVF1yR+e4w==
X-Gm-Gg: AfdE7cmr/z94EYpJ7vJQSshGAhrMK4pGWZW69W/mM1cchfyXHp4g4QHyVgnX9sid2h9
	Bweh5dOP6bCkQFrrkgAflAQK7I0uYmtGnUrmSE45yWisaJRCuXrVhnqSChQG0F0LI/8FD0pm2Q5
	VI9lwkOGlfQPNFIUedMBTfPDwted7cYZVWcKgdD81uTsFcqouCJ0tGzdMNPIXEQ08lHstop1rp0
	SYJFy7e/LOp9xsctdO1wBtuug8b29cKq4J+sL1avUXzzGZrC9sfRYxY9CnDLzHBVTN4eYfKskQ0
	V1HYkN2nO9xnGiW8g1JCkOTk7HllGsgBsv3j+novTdCbx05apf+i0rSDVljP0bpwkWJLNdOK3xV
	sbUnzeeK4dlFEFf6qj9Pv2eAFVipFJ9noKJgFJ9VyuEOqbQ==
X-Received: by 2002:ad4:5c45:0:b0:8cc:f72d:6a5 with SMTP id 6a1803df08f44-8fcb4a053d1mr17683766d6.36.1783357465860;
        Mon, 06 Jul 2026 10:04:25 -0700 (PDT)
X-Received: by 2002:ad4:5c45:0:b0:8cc:f72d:6a5 with SMTP id 6a1803df08f44-8fcb4a053d1mr17683166d6.36.1783357465319;
        Mon, 06 Jul 2026 10:04:25 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4718143aasm140045016d6.32.2026.07.06.10.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:04:24 -0700 (PDT)
Date: Mon, 6 Jul 2026 13:04:22 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH] clk: si521xx: Align si52147 OF data with the I2C id
 table
Message-ID: <akvgFuy0xFbM8PE4@redhat.com>
References: <20260624055810.49310-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624055810.49310-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)

+ Marek

On Wed, Jun 24, 2026 at 01:58:10PM +0800, Pengpeng Hou wrote:
> The si52147 match data is used to derive the number and mapping of
> registered DIFF clock providers.  The I2C id table uses
> SI521XX_OE_MAP(0x17, 0xf8), while the OF compatible for the same chip
> currently uses SI521XX_OE_MAP(0x15, 0xf8).
> 
> Use the same provider topology for the OF match as for the I2C id match
> so the same chip identity does not expose a different clock provider set
> depending on the match path.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Fixes: edc12763a3a29 ("clk: si521xx: Clock driver for Skyworks Si521xx I2C PCIe clock generators")

> ---
>  drivers/clk/clk-si521xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
> index 4ed4e1a5f4f2..f167fd63c504 100644
> --- a/drivers/clk/clk-si521xx.c
> +++ b/drivers/clk/clk-si521xx.c
> @@ -375,7 +375,7 @@ MODULE_DEVICE_TABLE(i2c, si521xx_id);
>  static const struct of_device_id clk_si521xx_of_match[] = {
>  	{ .compatible = "skyworks,si52144", .data = (void *)SI521XX_OE_MAP(0x5, 0xc0) },
>  	{ .compatible = "skyworks,si52146", .data = (void *)SI521XX_OE_MAP(0x15, 0xe0) },
> -	{ .compatible = "skyworks,si52147", .data = (void *)SI521XX_OE_MAP(0x15, 0xf8) },
> +	{ .compatible = "skyworks,si52147", .data = (void *)SI521XX_OE_MAP(0x17, 0xf8) },

I see the mismatch between the two tables. Do you know which one of the
two is correct?

Brian

