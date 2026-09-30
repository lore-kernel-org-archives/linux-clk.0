Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663D4457E66
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755105; cv=none; b=J+HXMO/310gK1x8pG6mb7BoGhnfAwTTUUz/rmCtk7ARrIRY17xpsba/Ut1HY9IUuginjPaY0FmqK6dGLXpCw4x8/lQ688PTcxPaDkZSurDEH9hA3+kfGRHGz6s8LyB+OBVe8f2ngRnwcFM9SPy67vQKwzd3xPn2NybTffuDDl2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755105; c=relaxed/simple;
	bh=lvXf3tpQM3sE0rI68tmiWzWdjaHzxfLtaXOKMtVK6QA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uMTSUzvYcVaCFvEXqKUGrZ/FRTYGsLD0EkaFCws2mVQdYhKTIFp0lSo0jdXNNOLg1Ehsgc7z3yaCsqZssr0JU33dhW22wxE9HbvoCAcVChzAqbOpwo+B24PManPEwQQ8lpl7yS2kUSSk8a2kGy4U8N8NSCQ/DH0XJnQrve2vGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Aw/cfMFU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Aw/cfMFU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so4008535f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 00:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790755099; x=1791359899; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWn2iPXvCs6SWNk89OK5OvlJgb4Z2dWAtqxQeryEwx0=;
        b=Aw/cfMFUz1EHQqySg/QqFUtjautV5Wijb88vTfz9nHiysjQpxB+H7cNKGyvjvx0j3A
         soXarMRbu9eql/0AQgSnGqmgu0riDm9vWHeyIy2qC4xtD1VR8lXb8Az1DxHFyCHo3N6z
         /b2qLXNW0Eexnsn8UUBktyqYl9AMAerMkLhVzuewo4dEvHQFaVbjhxj9YvVrOquBLZ0Y
         qnX3fLjeCrLEDt/8wWXrv3boC9uDH7bfAFg60AJFCuZiUrqAw7sQSrnTIpIh8rOHFCnp
         HnhAj5KkSSBTuyWxg146iK/W3WXjGEjr2xn703avD82/Jl+FKargSUDdOyoER7Oglk/i
         Nbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755099; x=1791359899;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jWn2iPXvCs6SWNk89OK5OvlJgb4Z2dWAtqxQeryEwx0=;
        b=OcTt1JlquWqF/tNPtGJgAGnYirMtg2foNeX618kHRikJ7+LHmtMFbv/o2pOyFRfpyA
         hAoMlqAKeT6JXO3rI059i9GynLQJGW7dheCR4RLFBUM5L0CsohfYMUoPZgaSwrnFj2Qp
         R8xrJDRTNCg0WBMtPW5+RemXEtiFi1rjAJiCcczFGfV/6M9cYRRjeOrYgekn6DoA9fT3
         nhu2/nkmBRJa0jQ5beKksKEvqOEcYtad2BMwxZAsMiFLdUcgZlBBR7WM6H2PjuSmje3p
         avJKKGeGCsNasWxM5k0woCWnV8n6CvxrGXw9DXjFjLqNjay3nmPWt+5JuXD3yXtMeo70
         JhqQ==
X-Forwarded-Encrypted: i=1; AKwUvByDPvqC4p0RxKOQCEIMmjdXu+96/QQhYkZG3KRIzL48nuFr/caphs0aLiooZM5yV6AKgC7o6+YhlJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMO7UxdcFNOUNo501/LhJTwnUQXuBg5G+CHeH9TvSc5kP6/LOc
	xHKt1i18RtonvClW76M8xj/QPTzUMyPzE6zYr/tCUckYmTPP99mY6EqPd11iiZ2q79M=
X-Gm-Gg: AYBFou04AOVqeVpXp0WTwk1gauS8nfZvkatD4FxEmywyAoV0N4J5QCtjVE0CoJpxThq
	uFmCxC14PHYFg82aL88YSMhMyj9y6mxzkVRT/T3SXzyzp6G6WTrlwdU0mQD4+m2f8masM20rbp8
	Q/J/orrrY0cZDwoWpgqjfEdVkup+lchC2Ns3G4A7N8LLUUBXIi7VfCMseSns3lQhtK4ttYXJqkx
	WU0JfF74W63tGdzpwX6MpAj0yhqNoySxTq1gNnuJw5yxn8mh8QUPTqtaT7HD3EC9h45otJJOqWs
	wCcVIx2xt2IG0yf7GES6X6Jjj+ESb0xfdY+V7dYUrjML9Jtm0cjWtUV6MeTogaV6wfnnFSwmGYm
	TL1f5zQSGH3n73ua0h48hj+B2OoxF1bGVjklHgYFRk97CT3vy+G6zKrqer5+mDeLNIJqKPAmDVo
	AteWXeS92juvFaegsQG+C0JS770bo725L4fVOBy6DnJkaNB8kE5LonV04ic9f51t68uhIOYWtSx
	tXL55/IdL+hjjP69w==
X-Received: by 2002:a05:6000:310d:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-48b0250afc2mr1187154f8f.34.1790755099585;
        Wed, 30 Sep 2026 00:58:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b028b237esm1738200f8f.0.2026.09.30.00.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:58:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "open list:TEGRA
 ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:KERNEL HARDENING (not covered
 by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b"
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH RESEND] clk: tegra: bmp: remove kcalloc
In-Reply-To: <20260929192437.27775-1-rosenp@gmail.com>
References: <20260929192437.27775-1-rosenp@gmail.com>
Date: Wed, 30 Sep 2026 09:58:18 +0200
Message-ID: <1jwls32msl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 29 sept. 2026 at 12:24, Rosen Penev <rosenp@gmail.com> wrote:

> Use a flexible array member to avoid allocating separately.
>
> Use __counted_by for extra runtime analysis.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index 067a8555c4e7..15b976162b59 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -32,7 +32,7 @@ struct tegra_bpmp_clk {
>  	unsigned int id;
>  
>  	unsigned int num_parents;
> -	unsigned int *parents;
> +	unsigned int parents[] __counted_by(num_parents);
>  };
>  
>  static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *hw)
> @@ -518,20 +518,14 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
>  	unsigned int i;
>  	int err;
>  
> -	clk = devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
> +	clk = devm_kzalloc(bpmp->dev, struct_size(clk, parents, info->num_parents), GFP_KERNEL);
>  	if (!clk)
>  		return ERR_PTR(-ENOMEM);
>  
> +	clk->num_parents = info->num_parents;
>  	clk->id = info->id;
>  	clk->bpmp = bpmp;
>  
> -	clk->parents = devm_kcalloc(bpmp->dev, info->num_parents,
> -				    sizeof(*clk->parents), GFP_KERNEL);
> -	if (!clk->parents)
> -		return ERR_PTR(-ENOMEM);
> -
> -	clk->num_parents = info->num_parents;
> -

What is the benefit of doing this ? It looks like you are just trading
one alloc for another here ?

>  	/* hardware clock initialization */
>  	memset(&init, 0, sizeof(init));
>  	init.name = info->name;
> -- 
> 2.55.0
>

-- 
Jerome
