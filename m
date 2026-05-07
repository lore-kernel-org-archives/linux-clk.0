Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E52431618B
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 23:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196891; cv=none; b=Dokkrd3gSnz8ygoE0r7uu9dd9IY/0LUtljw/T2j3k8MAcCi1IqS7k93jKwpVw8tOjWdIUeN2fuPjIgUZ5sg96EEMzo6Vv93+LI6dSXD84lLzw6vxTiYAXTeyLASoCX5ZYOhFVnoA07O7RGnmez6hJtrw3ayMRCNUQUXAzPekomA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196891; c=relaxed/simple;
	bh=U0seoVi4n3qqjK+J09RdgSIJmaaFquCQiKFxG++i0kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6TxFOQT7Cg4lhPQN5M/hdg7YahEy6lekqbOv8xXeCn0Y2+OzfNhpz4cl1JvIxQJFZusrO/k5IIBh7hZhDhvBok1WvljrL6hI8z3wnBLWIdYgedDlnHleiZZ1cLuNfe6TTHHWFi8bXw0pXenClOXJnMQkXbtW4Ctk8Lw18m7xhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T73XOx0N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTWkKz2I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T73XOx0N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTWkKz2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778196889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSM6UscZWrZrRnJYPP1LWeuyeD/23NQG6vtPlp735gM=;
	b=T73XOx0NTCxgZ8TtTwLgr/gzoFiNC2ENkB0Y6mxUBgJbUWOCxUstG450dxSNEO0I1BMjM0
	YFNx5EUueS4BP/NCiPujtNagpqik5uSrbjOlIe3SaG5unpwebXLJXOW99wpaJpplGJ/tyN
	4bdVzs9CuNryPrNEO910ziJ0ltZrGBw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-pAgKtwafN22ZdhRDHjU3cg-1; Thu, 07 May 2026 19:34:47 -0400
X-MC-Unique: pAgKtwafN22ZdhRDHjU3cg-1
X-Mimecast-MFC-AGG-ID: pAgKtwafN22ZdhRDHjU3cg_1778196887
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da31af14cso31894641cf.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778196887; x=1778801687; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSM6UscZWrZrRnJYPP1LWeuyeD/23NQG6vtPlp735gM=;
        b=GTWkKz2I+WHWPQrRB/BNFRvlUfK2ZLfquaTXRdbCRIhmMHDdHE5yyHOV89iT8EbJmD
         cgqFIlfRJFaI17AUrf6Rd5T/VClEMPfR0JwFvemtDTNvVxuaeVGQvNo3emolZJgTpUJH
         Y1l84faJ41DkGiypIQTNSC5C9VQ9BjNDtCYFzYrxlAqijH/lY7wPy9Q8Gu2v41Co7jjG
         jpF1n+PcifxRhJ10mP7HdSvxMIMOrcVe3DxiTy6oNOWqAcB9IDiZPC2bEa9z1gOW+A1A
         o/nEvCd9hH9KyIv1A0bAGVT8DKHzLpnQgWn4H/6IUUsDgmNbPcFzTnS4nq4ULX9v7w0+
         k2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196887; x=1778801687;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSM6UscZWrZrRnJYPP1LWeuyeD/23NQG6vtPlp735gM=;
        b=CmgjJ/FQ6YnR1BHII3D5Y4YgtsMeIsgJBWxU8HYxCiMC2kAayyU3+t92fzY8Exffjt
         0J1LZGkqRPV6KJCo/BbUSMWsZhKHzbe0C/NzMg0phDddbPKFeaHcnPIvCdrgVD7hbnpM
         YQjVXSdyMeLKYxlUYOvRws5kMt1yTryGim4M4a6HHP8Mqpnp4rX40sjVmBtF+vdp9bPP
         StZ6KGTH9lilN5ae77BBidjFQP5hFPePk6DzEv6uJJDk1QOg2//+U4PDb8aF9THfamOd
         Ny0dI5j+FwcCApyJFUFUmX1f5SxFVVqTAhQ6DtCBxFC/TRMiKDO2+MONXi8j+jOU9H1o
         90Dg==
X-Gm-Message-State: AOJu0YwH7vYSv/X64Gh2LdPG3sUHbh2MhLx3N4O+hceK0Xz1uAY3891v
	dsRk06Hje++mu9TL4cJNzoqRuZfsDtAcW8+m8nFUMYw2NogyMRCxANAX1k0clmR8zLOwICaJ3GS
	SMXsKhKxbqVVYzTxUTOCtBErxvB9q009kQmd5WSTi6XqPVkwX24vtNNaT3I7aiA==
X-Gm-Gg: AeBDievZm33UAuCMNlth5CQhIvZvUjmfAGvIisg23vC8e5pgsJAhl+J6R5+gJKxuGEm
	YKwNCztD0BBSuEenNA5uzJx/IO0JVDM7KZW/4sEmeGOxXuX58f8z2lyIrTh/8cABira563SA+s0
	lJXwQHMwsDjuah5/MCkYxuVX5s84TYJ0cFtVgH7BSJ0TTrkMxKCrKlEKawKY9MV/K8yWFn62jj9
	VOkpJ0TBCFCP3GZCvSMUQ31FfdDrw9tm/2BwTERTPEgqe94AJqEc90v9bqQBZGpXxiX9C50TEaf
	L6ZVoIWyOCqGnwBiuG+NTptSs8nMxPXVNMYuG0tNIgFfmuej6tuV5OezEDxV4TjXLaycVSr25Il
	5MY6LOe2qJG16vNM3XCo82o1waMLJU5i8HfHGcVSRJVEVZSrZIH9HjnYu
X-Received: by 2002:a05:622a:a14:b0:50d:aae1:7070 with SMTP id d75a77b69052e-51461fb1ad5mr157914921cf.48.1778196887231;
        Thu, 07 May 2026 16:34:47 -0700 (PDT)
X-Received: by 2002:a05:622a:a14:b0:50d:aae1:7070 with SMTP id d75a77b69052e-51461fb1ad5mr157914391cf.48.1778196886751;
        Thu, 07 May 2026 16:34:46 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83dd35sm1697181cf.29.2026.05.07.16.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:34:45 -0700 (PDT)
Date: Thu, 7 May 2026 19:34:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2 1/3] clk: samsung: use kzalloc_flex
Message-ID: <af0hkVm0TQPTAiPd@redhat.com>
References: <20260506233833.178357-1-rosenp@gmail.com>
 <20260506233833.178357-2-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506233833.178357-2-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Rosen,

On Wed, May 06, 2026 at 04:38:31PM -0700, Rosen Penev wrote:
> Simplify allocation by using kzalloc_flex with a flexible array member
> to combine allocations. samsung_clk_alloc_reg_dump is no longer needed
> for this struct but is needed elsewhere.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment after kzalloc_flex which does the same with GCC 15 and above.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/samsung/clk.c | 11 ++++++-----
>  drivers/clk/samsung/clk.h |  2 +-
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 91e5cdbc79d7..2895c77534ae 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -430,21 +430,22 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
>  			unsigned long nr_rsuspend)
>  {
>  	struct samsung_clock_reg_cache *reg_cache;
> +	int i;
>  
> -	reg_cache = kzalloc_obj(struct samsung_clock_reg_cache);
> +	reg_cache = kzalloc_flex(*reg_cache, rdump, nr_rdump);
>  	if (!reg_cache)
>  		panic("could not allocate register reg_cache.\n");
> -	reg_cache->rdump = samsung_clk_alloc_reg_dump(rdump, nr_rdump);

samsung_clk_alloc_reg_dump() is used in three other places. Is it
possible to convert those 3 places in a similar fashion so that this
function can be dropped?

>  
> -	if (!reg_cache->rdump)
> -		panic("could not allocate register dump storage.\n");
> +	reg_cache->rd_num = nr_rdump;
> +
> +	for (i = 0; i < nr_rdump; ++i)
> +		reg_cache->rdump[i].offset = rdump[i];
>  
>  	if (list_empty(&clock_reg_cache_list))
>  		register_syscore(&samsung_clk_syscore);
>  
>  	reg_cache->reg_base = reg_base;
>  	reg_cache->sysreg = sysreg;
> -	reg_cache->rd_num = nr_rdump;
>  	reg_cache->rsuspend = rsuspend;
>  	reg_cache->rsuspend_num = nr_rsuspend;
>  	list_add_tail(&reg_cache->node, &clock_reg_cache_list);
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index b1192ca03db5..098f27a6290d 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -324,10 +324,10 @@ struct samsung_clock_reg_cache {
>  	struct list_head node;
>  	void __iomem *reg_base;
>  	struct regmap *sysreg;
> -	struct samsung_clk_reg_dump *rdump;
>  	unsigned int rd_num;
>  	const struct samsung_clk_reg_dump *rsuspend;
>  	unsigned int rsuspend_num;
> +	struct samsung_clk_reg_dump rdump[] __counted_by(rd_num);

Personally I think the rd_num should be above rdump so that they are
together.

Brian

