Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989A3FE647
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061772; cv=none; b=gYGix2oeTZGS5e/XZE0dkne0Ap9E9UPrsRxvkNZPWcAWBwA2s6lZ4LffQYFyrClgFRpE93YNHbDA/rH2GImWmKZhLMAH3I3vKwpQ2AbkFbU0jIzIrJjJNOOf5d9BrX5M+dwb4qddmJUlkvVFpzduKz0LdgxC1GZ6v/ycfaKUldU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061772; c=relaxed/simple;
	bh=c2EZobjo8wmE0XQjmjElHldBXd9QUbAxtk/1nFk/HJg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAP1+hn1BdwrCqQjk2eWd4Kfn2ImBRZ9Br5bgPUJaF8bfCHPv9VENyTd1JtS+5yzTAEz+BVTOt4hmviveHYjyi4scSWlw75rZFs+ocGECQ46T7XrbLXAHx8b6dKZYG4Jlzbu6OJ1weKLy9NO6RultVEK4gNTF7cE8G7GVLFf+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RZz9xo9f; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RZz9xo9f"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso74846185e9.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778061757; x=1778666557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1E4XZ/k7lr4L4Js/eHxhDyBKkB+HBd00gb9qm1NRac=;
        b=RZz9xo9fxSjDyudNwEP3l5URuCG8HlJiS71uZsO64S4u0opcW/RHYMQl1VGd6MF/bZ
         40KsQt6dJ0s3Kojk3tIttk0cJ1+RH0Eqg+FMMJdEbfaIsyg9ImKsGiWUgA8mIF+8dCvT
         rsGZRZqNpfLioQY0ddDWJnFSkYVox5rsiOdpxKHeoQvxo1n7YvT9Kuj5MMklT48qjWd4
         TIxyBt8LXZe7XKURptPrN5ja7yJVUNX4TkM2e6HNt8HI4Tu1M8C3jSX4SMxO7KkF2UYO
         zL92zNen7jh/7O6JFh9BlAbK4IhHXYQHaVmPSOvPmM/KNcUdki97JDsPtK58bCdJfE+v
         s6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778061757; x=1778666557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1E4XZ/k7lr4L4Js/eHxhDyBKkB+HBd00gb9qm1NRac=;
        b=f28DTisqeozSzC21ubqIxpHyvf05mhc6S+/J8vJymqZYwKjTgiqg84gKOik9vBZwFL
         2CWcIFYG3RgG+ikIY2PWbBX6jQlwRcSY0b7FF57x747Mug0KvgUbuLmbLL8KpWQgwJGQ
         GAM/o++eKRjxHC0vvHl4kpYY8BtIhpweHTErxMt4G+n3SQy0eP7wx6wctEBfO8wKkLty
         nTN6ftd2xiyn9GqM5ISjSNlYJOaevWybbgDKsy7+5Zb2wz0nQF+fzTBmcQiSUatam6KI
         uy/z1Smz7jkFlNAjP30BXoAncHmcyng48UBoaSRhQfjd5VSu9ONNnCmoNk7NSl8hl1tV
         3yeg==
X-Forwarded-Encrypted: i=1; AFNElJ9vd4J75eHVFwS6aYBaQP8UsKmkzuL4m6HN8g8pACpyxCkmT4o3bLYbrMvTdT+VedNCid0Td0kQZqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vf3KTd8WVdylrzKPUgd7rQu/CiiC7Tnn4QEtkdy+GSy9ip4i
	StVfFrdksBjgv4uIEftAPqPqRhe2QyxRu2rkLc5ARb/GEb7fW5qD9bYrU+C8nCUFFfw=
X-Gm-Gg: AeBDieukmc9PeTuj4dtr9NQcvpGQ2ga3kQEbmG3k+tV+dD6vsxd1uWyRosi2NRKTogw
	zOcWScU/HIXLNswwpzBBv7D+HD2tSgEoFvdnT8NsFKPZoW2oXve4nlAlYHFWSC/9crs1kBZsCU2
	Wx4+R6uRKs8u9sRo4wdfG6C6hCKbglWqpWSxIFuK9lGQDW+mQHEROMN5Tf3VxfRvkenn26D3/Hx
	YuHhOnC2PMUlvc8kGHlou97NZEi5ZRutnz7R1NjmA8j34nsegdp3zpVkVWFdEqQEq+Bo9vvb45Q
	a4VSEIzNXi0onn1S4baUEWfQfAdR0h172VzYHOr/9c78pBufFYHhh5wbdv6XxXdmh7CA1ZLYGl+
	NE+sJ8AD8a/mplmJZhJNjGv2+JXeFd65Tx6FIsg7AdkAFwgvreu+yQd+zdtiaf2IhzsWZZlRV5T
	/4P70NNPBns+8ZVf6/1B1E2RSYXUKir1g6
X-Received: by 2002:a05:600c:a110:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-48e51f2e8a3mr33796725e9.14.1778061757169;
        Wed, 06 May 2026 03:02:37 -0700 (PDT)
Received: from localhost ([82.145.119.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a5486sm38518035e9.6.2026.05.06.03.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 03:02:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 6 May 2026 12:05:53 +0200
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH v3 09/15] clk: rp1: use clk_determine_rate_noop()
Message-ID: <afsSgTOrvHfsOfvO@apocalypse>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-9-f3f829fbacdf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-clk-determine-rate-noop-v3-9-f3f829fbacdf@redhat.com>

Hi Brian,

On 20:49 Tue 05 May     , Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> To: Andrea della Porta <andrea.porta@suse.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/clk-rp1.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> index fd144755b879..0f7d9fd77481 100644
> --- a/drivers/clk/clk-rp1.c
> +++ b/drivers/clk/clk-rp1.c
> @@ -1174,12 +1174,6 @@ static unsigned long rp1_varsrc_recalc_rate(struct clk_hw *hw,
>  	return clock->cached_rate;
>  }
>  
> -static int rp1_varsrc_determine_rate(struct clk_hw *hw,
> -				     struct clk_rate_request *req)
> -{
> -	return 0;
> -}
> -
>  static const struct clk_ops rp1_pll_core_ops = {
>  	.is_prepared = rp1_pll_core_is_on,
>  	.prepare = rp1_pll_core_on,
> @@ -1227,7 +1221,7 @@ static const struct clk_ops rp1_clk_ops = {
>  static const struct clk_ops rp1_varsrc_ops = {
>  	.set_rate = rp1_varsrc_set_rate,
>  	.recalc_rate = rp1_varsrc_recalc_rate,
> -	.determine_rate = rp1_varsrc_determine_rate,
> +	.determine_rate = clk_determine_rate_noop,
>  };
>  
>  static struct clk_hw *rp1_register_pll(struct rp1_clockman *clockman,
> 
> -- 
> 2.54.0
>

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks! 
