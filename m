Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC87428493
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515601; cv=none; b=buskkJZnCDFNVZmSN5jKAkj+ahUQ27kCmKZfZO+uwLtWlK6Q7aX8t0Z6y4ilZ/iZwgrhoL4c80y1/LO58MTaLdUjz6kvGG7qk5uB8Gs3WWiS6oZ6KcLoMP6BCBnb73Rka7Eg/ilWI16MrE0Xpm+l6ajaJ+ZvlgSFLl0MVciD4t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515601; c=relaxed/simple;
	bh=/s3BVmq1qoVRpmuWcEkWLGEB5FmFAUCGGs/r+Grgee8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOt1pJOAZNXVltpN1R2GZ4XC0k6Y5necNO235M/TZqbvLoTxG9P93HdNOAfSMOx0ouwwGSAcPftLsyktdKU6XG/sHzJOVb/9ZU+V/0e/eRULN/QYYEb8dvuE6vZXOqCkPyq9Fo1hc4bJDgLne8KJ4yoJ7hsloUX8H6aw0vDvle4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0+1//NO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DJEz5sT5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0+1//NO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJEz5sT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778515599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WwCAGmH0U4Nhy4j6grH3+nSMTDhiVfCng6CUAeJVa7Q=;
	b=F0+1//NOn5BqXDVeiWvW0k/oynQBeRtkhTEUu9ZRT5RtqqXSqHJUSQfThsYejU2w2mGT/3
	zl+qfQ8/DZpdu3z7FnM5gQFNWKG1XiwhXLX20Lzi6M/F13xbtnMZJR0SdHEFlChcAWqVnH
	TCxDeqYqu4wUTM9k3z1aRCtAWA8ke3I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-6dsHWOfdNEiXjYFcT173mA-1; Mon, 11 May 2026 12:06:37 -0400
X-MC-Unique: 6dsHWOfdNEiXjYFcT173mA-1
X-Mimecast-MFC-AGG-ID: 6dsHWOfdNEiXjYFcT173mA_1778515597
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b5f089a5c3so80924566d6.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778515597; x=1779120397; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwCAGmH0U4Nhy4j6grH3+nSMTDhiVfCng6CUAeJVa7Q=;
        b=DJEz5sT5cRTH6uwsSM8SiLkCeV84WUWPdXc3jQuqz/1Cu76IHuqdNERnWEG160TDO3
         S7/kpWeVH8RaTh6OUpZyL0C447Qlg9bmnLJpiX0nOS7/vIq4aNmKT5FiCx8DIeKcTJhw
         A9/wxeTeql2A8tLFyQyAGPMvGLwkWdcKydhe0Tqsr+tYMkHM12Qm9Vc1U6KQsz+Wb15m
         XLDQaVsX6Puu9+ZlqBiVLWwa2M0yw+A7t1enpGIVN60OOv+/XOSzGe5uR4lsIK+pNIjS
         +mgCz6S5uEbXw+ukVuyw+Gqyk6o3w+Auf7xBPxJ7pU0Tl07wMCBvluUrkyzoCwdeuAS9
         pCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515597; x=1779120397;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwCAGmH0U4Nhy4j6grH3+nSMTDhiVfCng6CUAeJVa7Q=;
        b=iuKuwkoX9PIUqhtHbFXpR9s4Xvj6DiXUHBta0yD2QABitdWfj94K8Nu5i21yuIcR/c
         Eljvbmq0UOMnvEk6ngfZ7ZfqNZ1s5RFt+I0f8gdmdD6jUnDMnyQkun3UpBaR0W5Vp2Mp
         OiPvJeG5L3gaaaDfyGBX/rE33/YoxYxwc86WXg8zmlrJfllqc5LaOYN2fmIE1+0/w5x+
         OmXpvfAQblfHsJp64mmvntkKP78alM26jzjpt1Em55o2cWk5bKko2Yaexu58mHX6aZH7
         mGfU6thJUgAXpmk/Ur1fXmSpltMqujdpAMi52haN2WSOrdcD+KqPftAyBpcSEwcgUEb0
         OWyw==
X-Gm-Message-State: AOJu0Yy/x8ZZkQcqBnOmx//XVWuU+SDRh0xanNaczkbwTuNpDXDw2bbV
	fnVARcmizq2eA7hxrga8dsVntAU02AIht0kphyIcG8bmFkSAsMCap1nXXxD2/QeB2Lf8hzD0mMt
	GfewcdMrm6K2LJqrHV+RVJv7rkiLweGANgKsL3dkMFmJRjXMvfR4rIrZ0wvFpfQ==
X-Gm-Gg: Acq92OGs+5PPpA85eFLc7OeZXDbB6wc+lzRsFI1VYO8vb2uGKmNwyAYWkTzBpRTQ+im
	nsfiTZrZn1Vu4kbBJxEIfayBMb4HXp/rgXRybUdWSemAu4g6/sgdZxzrl6elUAym1AOdbqk3Cmy
	QesPyYWmCDhC0GzV884h5EINEej1QwyLIpqUZnSzAuEpmm1+lXx5AZRmszuVKDnxO6JZ/FBYwbH
	fQqd01gtSeGfNRGaulHLWzXmCXvOLh0HQpnm8r3O7e9UO0eW8cCyGWSGLZhXvkKxIMitGTOudEj
	Bwtn50ecCuaF5Zd3ZuZe5BQUNWlMApKhR1RGJFnwEj6+hZLN1/nHfMgLKq3nbHLI5gFxMqU4eE6
	hmL+0kGkhSWFiUSERugy7YhIb7OdiKqO7zGJdo50TcqrbzORHVgrGwGms
X-Received: by 2002:a05:6214:468f:b0:8ae:6d63:3066 with SMTP id 6a1803df08f44-8c1af2eec23mr162718466d6.38.1778515597149;
        Mon, 11 May 2026 09:06:37 -0700 (PDT)
X-Received: by 2002:a05:6214:468f:b0:8ae:6d63:3066 with SMTP id 6a1803df08f44-8c1af2eec23mr162717886d6.38.1778515596574;
        Mon, 11 May 2026 09:06:36 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf88247a3csm93252456d6.11.2026.05.11.09.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:06:35 -0700 (PDT)
Date: Mon, 11 May 2026 12:06:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
Message-ID: <agH-ivEdw12_3OJz@redhat.com>
References: <20260511032252.361906-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511032252.361906-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Rosen,

On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> Store the clock lookup table in the Rockchip clock provider
> allocation instead of allocating it separately.
> 
> This ties the table lifetime directly to the provider and removes a
> separate allocation failure path while preserving the clk_onecell_data
> lookup interface.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/rockchip/clk.c | 17 ++++-------------
>  drivers/clk/rockchip/clk.h |  2 ++
>  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index ee8c79b938d3..dbb4b6f33abb 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
>  		unsigned long nr_clks, bool has_late_clocks)
>  {
>  	struct rockchip_clk_provider *ctx;
> -	struct clk **clk_table;
>  	struct clk *default_clk_val;
>  	int i;
>  
>  	default_clk_val = ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -ENOENT);
>  
> -	ctx = kzalloc_obj(struct rockchip_clk_provider);
> +	ctx = kzalloc_flex(*ctx, clk_table, nr_clks);
>  	if (!ctx)
>  		return ERR_PTR(-ENOMEM);
>  
> -	clk_table = kzalloc_objs(struct clk *, nr_clks);
> -	if (!clk_table)
> -		goto err_free;
> -
>  	for (i = 0; i < nr_clks; ++i)
> -		clk_table[i] = default_clk_val;
> +		ctx->clk_table[i] = default_clk_val;
>  
> -	ctx->reg_base = base;
> -	ctx->clk_data.clks = clk_table;
>  	ctx->clk_data.clk_num = nr_clks;
> +	ctx->clk_data.clks = ctx->clk_table;

Where's the __counted_by? Also struct clk_onecell_data is embedded
inside struct rockchip_clk_provider, and I'm not sure offhand how
that'll work.

Brian


> +	ctx->reg_base = base;
>  	ctx->cru_node = np;
>  	spin_lock_init(&ctx->lock);
>  
> @@ -388,10 +383,6 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
>  						   "rockchip,grf");
>  
>  	return ctx;
> -
> -err_free:
> -	kfree(ctx);
> -	return ERR_PTR(-ENOMEM);
>  }
>  
>  struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
> diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> index 9e3503e2ffc2..d4033bf750f5 100644
> --- a/drivers/clk/rockchip/clk.h
> +++ b/drivers/clk/rockchip/clk.h
> @@ -604,6 +604,7 @@ struct rockchip_aux_grf {
>   * @grf: regmap of the general-register-files syscon
>   * @aux_grf_table: hashtable of auxiliary GRF regmaps, indexed by grf_type
>   * @lock: maintains exclusion between callbacks for a given clock-provider.
> + * @clk_table: clock lookup table.
>   */
>  struct rockchip_clk_provider {
>  	void __iomem *reg_base;
> @@ -612,6 +613,7 @@ struct rockchip_clk_provider {
>  	struct regmap *grf;
>  	DECLARE_HASHTABLE(aux_grf_table, GRF_HASH_ORDER);
>  	spinlock_t lock;
> +	struct clk *clk_table[];
>  };
>  
>  struct rockchip_pll_rate_table {
> -- 
> 2.54.0
> 

