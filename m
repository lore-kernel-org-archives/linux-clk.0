Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC803D4109
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876851; cv=none; b=rUQEYkVTrsniYsPF1/nOTzDIWXWoIsaZxda5xWg+RRk4fl0OCr+M3ApYb+Z6XCURaMw/xOeWOJYX9BQBwVtsskssXIqBwewAiyaSIYV2qd29jfAf7LJIRQrdimas7GqkUlousUNFXlj7LgD6OjdgBOabZLAhsMB7T1q1xxTJZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876851; c=relaxed/simple;
	bh=y9AzTBUZwgjprCkXTMMqWB5+utivFfgRqimTb7R3Vnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgbEwejIHt3T5CNwYvV4GRXYspwG6g47IiV8K/VxHntrdYnbpmkxTe9pISKCwRTq8bBdrHVrUQ3ioDHrzlXymVFTM5Pm3nbfQ3jI+zX67ZVcZXl8wpZGKn9zfN76/4nuDLeU1wVkEUVhK8C+PdnllW/uMOrL8sTpuRpynUkLdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EroPo4LT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qu4XA0BW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EroPo4LT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qu4XA0BW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774876848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=849+WpxI3rMKshrkZw1UeQiaXTXiAn2trIqqEZShEeM=;
	b=EroPo4LT2FcHluO04Rf4OnR11blUHclLsu79ZPO4NRltvMd5UFrmintsZlypEifOjjrau0
	vTKx/Cr0TfxLyFR7YYd/lW9GundniqPxD3jNAa5l3iF8Uk3mL6TpgHFD0EwPDy7fU0RqN3
	EguoJbbJjfMmxzU5SeSae1bRqwfqhbk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-ix4TFQvBPVila6szgEGhHA-1; Mon, 30 Mar 2026 09:20:47 -0400
X-MC-Unique: ix4TFQvBPVila6szgEGhHA-1
X-Mimecast-MFC-AGG-ID: ix4TFQvBPVila6szgEGhHA_1774876846
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89fe39655f7so51319526d6.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774876846; x=1775481646; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=849+WpxI3rMKshrkZw1UeQiaXTXiAn2trIqqEZShEeM=;
        b=Qu4XA0BWkOrCPMawHQngtJ4OrElRvR46NpfPMjZhBx5mFfVTHH8Hg1E7Q56aIG+NxC
         6E1SMLCayOgkLJgZdhxhTXoaa2Mu8sp5wZfGsLlMJhpeRuNu4qXd8Ybm5jZFWGNtg32o
         Pxbb1kNVM4qeG19v3YEWytrFGhOZinNqTzsR1+oTF8eLYnB2pzjHvhm3HNnmMwXrxj9U
         0L3hjqcm2OFrK9qx5teHXAriC0hldyId/xqSUpfTGK4LYx8HhN22yjrypyiufvIY+xnN
         JFAaYVMS4f0lF+wjH8gM5TE0Bn9roFgriJI6wzVFx/DHT/GtUaoBUQU5iTgp8Jz1gX7s
         Xc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876846; x=1775481646;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=849+WpxI3rMKshrkZw1UeQiaXTXiAn2trIqqEZShEeM=;
        b=QkapofDexgLZ69/wNH3o/JXTIj6zpr0FO6Df5Nj+Hrd4wlUMuHwu336qJL5CjeSnuu
         M9umAJjv5zD2Jwy1V0cfDhXEfv6ARS4WIngLoUlzIeVBBdgkoyBFTS6usNLOkck9R4Ap
         MH4UYrSPOHyLbK0f/0P37mB76k1y1pI7LomgZnGDCwlHjVMa7XBjfc5H+AjuvZqPeaYf
         DwPrEF6CW0P4FB6kEYjNlr01/v0kXlXApiPzaTzxJ+PwI1nR236jzUWjv7wOBxGWQvOc
         svIKpIE2bei8z0OSv66wlgPSzBPMjhU7abUKOOCZ0TBR5ZaNG+vZlIqlZx1tvficR23Q
         0uFg==
X-Gm-Message-State: AOJu0YwBz/VG61xxd5Jpiebwtbo6dZ+afGIiobs3R+1xPVVA4YY4nm8f
	rFXx0ew9DDzbeY+q23xFP6JDF9LnEAnKFKEivot4GErG87eFHrsXZaOOey4OFQRr7ucHkwjjcBN
	R7bg0waD+XBSal/OaoKuDzKTYhocE8C1mQSZascdvZD5Zk0hqoqZ9EgeqmxbaNA==
X-Gm-Gg: ATEYQzyz/zmhGCASTG5BmuEiMiF3Gqi8I0JPFyLDyi/7fos6w4GB3qXRDhZC/xi8n6M
	5dHX34FHButaK7IhgSTE6nspApDQ1nPN9NlTiChqFZz8nUYFJUfDD07WQVyuZ+56OP1qAfwxE0L
	mQLS8T8kFoGCP2DMFwozRsHQL36J+NsH65o6k9Up1b8qeK2g7IAkHqVgjTSluFX/g+O719uaIjt
	Wf1whVKvbRpQy7IZJN3Ucs7WU4Q39yz5A/xmd9Z+A2tOnN2TkAbUeCKBCBL7JKxfPpG3Rn/sn60
	1tIPnJ3G+3fvwLSht8BmLon+lzd7vtZJpfLy542Lw1nvWJssHNYchnaDQXQxfBDiSaXjmZVrIEm
	iIEe8phE5m/HdOvwqO2vKj/9ZiQbtmoj06E8RJ5SbBeMVFhH5OpXEyuvw
X-Received: by 2002:a05:6214:c4c:b0:899:a586:2923 with SMTP id 6a1803df08f44-89ce93b3225mr162395746d6.28.1774876846147;
        Mon, 30 Mar 2026 06:20:46 -0700 (PDT)
X-Received: by 2002:a05:6214:c4c:b0:899:a586:2923 with SMTP id 6a1803df08f44-89ce93b3225mr162395226d6.28.1774876845428;
        Mon, 30 Mar 2026 06:20:45 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf867c24sm63268126d6.36.2026.03.30.06.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:20:44 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:20:43 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
Message-ID: <acp4q7L-mLecLxi_@redhat.com>
References: <20260327024032.6537-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327024032.6537-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Rosen,

On Thu, Mar 26, 2026 at 07:40:32PM -0700, Rosen Penev wrote:
> Combine allocations using kzalloc_flex and a flexible array member.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/hisilicon/clkdivider-hi6220.c | 24 ++++++++---------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hisilicon/clkdivider-hi6220.c
> index 1787ecefe601..14d72fd716c2 100644
> --- a/drivers/clk/hisilicon/clkdivider-hi6220.c
> +++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
> @@ -35,8 +35,8 @@ struct hi6220_clk_divider {
>  	u8		shift;
>  	u8		width;
>  	u32		mask;
> -	const struct clk_div_table *table;
>  	spinlock_t	*lock;
> +	struct clk_div_table table[];
>  };
>  
>  #define to_hi6220_clk_divider(_hw)	\
> @@ -108,24 +108,19 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
>  	u32 max_div, min_div;
>  	int i;
>  
> -	/* allocate the divider */
> -	div = kzalloc_obj(*div);
> -	if (!div)
> -		return ERR_PTR(-ENOMEM);
> -
>  	/* Init the divider table */
>  	max_div = div_mask(width) + 1;
>  	min_div = 1;
>  
> -	table = kzalloc_objs(*table, max_div + 1);
> -	if (!table) {
> -		kfree(div);
> +	/* allocate the divider */
> +	div = kzalloc_flex(*div, table, max_div + 1);
> +	if (!div)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	for (i = 0; i < max_div; i++) {
> -		table[i].div = min_div + i;
> -		table[i].val = table[i].div - 1;
> +		table = &div->table[i];
> +		table->div = min_div + i;
> +		table->val = table[i].div - 1;
                             ^^^^^^^^^^^^^^^^^
Sashiko has a question:
https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gmail.com

    Does this code read out-of-bounds and write incorrect values to the table?
    
    Because table is reassigned to point to &div->table[i], accessing table[i].div
    in the following line effectively evaluates to div->table[2 * i].div.
    
    For any i > 0, this reads uninitialized memory from further down the array,
    and when 2 * i >= max_div + 1, it reads beyond the newly allocated flex array.
    Could we use table->val = table->div - 1 instead?

Brian

>  	}
>  
>  	init.name = name;
> @@ -141,14 +136,11 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
>  	div->mask = mask_bit ? BIT(mask_bit) : 0;
>  	div->lock = lock;
>  	div->hw.init = &init;
> -	div->table = table;
>  
>  	/* register the clock */
>  	clk = clk_register(dev, &div->hw);
> -	if (IS_ERR(clk)) {
> -		kfree(table);
> +	if (IS_ERR(clk))
>  		kfree(div);
> -	}
>  
>  	return clk;
>  }
> -- 
> 2.53.0
> 

