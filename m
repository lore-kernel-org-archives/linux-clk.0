Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193919CD0A
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785129289; cv=none; b=WOnXTvaXt3qsrzKPQ0s6s4rLnEt7aHCi9Q9yWEWrUXqP4y6h1Fpfs0CN/6aTLnjxaSMLXv8DXTP7nJOfgJsbMIZooPwaqwE56fbqQzAzAoR+S7VLpXHeXLwjF0v7DcEdzmLql+cyc/7FkFv0uvzPmugufyDKFzN5PGV1YrX3Ypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785129289; c=relaxed/simple;
	bh=dSD0qXEG2gGBrX7cwWmlv6l6sfGi1puBCZ3izJG5tkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlom9fQGRKkKIYwfS1N5j1eDFzc4AvlBI2fkGGSmkvhkJHOxBJEyQis8F3osKxKPrZvR0f6jM8CNT9CQthra0/DZ+aUEUjYRPiYgO+u/ovezygNgbCC58tH83HfwgA3ImUeD+01Xu8Hh7qdXxai1DjguUMn/8c1aMavW9WQWxZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhKSnmww; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhKSnmww"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1227209a12.3
        for <linux-clk@vger.kernel.org>; Sun, 26 Jul 2026 22:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785129288; x=1785734088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F9t5ZGciy6PdKcp2Nz8FupVtbWyEe99B8SvVp9g833U=;
        b=xhKSnmww6VM6309AUj9HZCFpW2Be6QIRH4l1/6ksgt7HpvgOQyxVzwsNXjndVmxw2N
         KhAjiATQCPHfRSEjUsWWMwUGDdrHtHUCTDNE7KOMUq2wKSVjad1UvWg5BkMRg4aAYXRE
         vpui76dhBrYLM22vaHnaMg/c+RkiumoztqPwlwThP+OFLTldbAnfy9gbeS9roAiFCmmG
         PvDYAPAfT186Ew7/KOEaFXViNcNkAjIve8IfseO78n20hb3CGKcV3miFXi0CArM9G3ZD
         GZJ7ZsX9+ozuhEc/Jv6CFPYkThi0Hwrwow5pihjkl9+L6hlJE+KSGdMxjtFZQEib8FsY
         l3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785129288; x=1785734088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9t5ZGciy6PdKcp2Nz8FupVtbWyEe99B8SvVp9g833U=;
        b=M5M3ltPG8+/llkDmjRUo85wvifgSZXca5OviRxE/sqNoDD9MJ2kTkrfUeAQbqybuRm
         e3svMycdzvBQt4UJ+J7Rztm9exs3yvBK9SA/6hrwQaS94mFeEd69tFtVn7P+p/mVdcCQ
         43A1oazvju1u7eV2FaNh95R+Qf8HTkJSPtnPlto+PYlLU23kUUOwJWGxaSigC3SjehPz
         D6J/2YO8P/v5wyQheBY8DTwCvP0NlTGkVMQHV/bNVJQd9Z+25riB8SVj/B2EC6ckbgXL
         YJ6/B7Ukpc70xkR5IF6aAwWZnGmaufyQ2L4T5zObP+ylO/bSvMbYYETVOhVXflKRkzYo
         dTwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl8RXp/HQwYdViAgLJ/cQNrggAfGOfWFXNWbB7n/5tsFS6vjED2dyzKY7eJZT2Cbvr8q8LvIMk6lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+najVDqVT2Cp6IKMxShUqANZw0nUJfmhK4pc+mU1A+xFiCkb
	JcQ1yEtjOnWhe9LZQUgUxA4nKoe5/L3RfJqwLAwoh9PXkfRi2MulcuAb9lnfKoE6rVA=
X-Gm-Gg: AR+sD13emwB2yWPUVv+OdCMCDxSn1Vdu3c7GJj117NHfafjyxSik2NW+goS4CbXe/XN
	QxKdcBeBWx9NJEmRjv/NxTPy3XcbQGDWaHaPcB7HYnINsRN/8Pe/nsoglVmSl1huos7+ATWNTt/
	9mbwHztaAndhNqFcDje4QFr62Q+0j+c/QXPeoGVmmAdW8JC3TAamSI1wO4y7gAmMMM7sb1UiOva
	9o6YttwIniEkoAe4DRH0+zZjxAJstTFIDtqxLpm1YEgWiNqbVKjii+BU649d90NPvcf9pkD1GTX
	GGH5YzCaBlmWAlnj0EvMeoDK2sfhenyQZUzYj5NAE9m+oZBktkBDmR2uk1Deq2teb9xUsmMUdyE
	rT58xXfLivTJB1dHgG7g/GGrTNyfTNPg5eNqQ3fg2i5BEUdjSwqZ07YVBknLJwKD6IOQRYpmbDx
	/apw==
X-Received: by 2002:a05:6300:97:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3c67d954f3emr6735015637.3.1785129287363;
        Sun, 26 Jul 2026 22:14:47 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm26621720eec.9.2026.07.26.22.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:14:46 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:44:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chandana.chiluveru@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3] opp: Use clk_get_optional() to avoid leaving
 opp_table->clk as an error pointer
Message-ID: <sl7wx7n2bocrfcsqj72vp3snchbgvtkuahq4pjzpor54bg46ek@ar62czwob4j5>
References: <20260727-fix_ptr_check_on_clk-v3-1-94629ac7aaae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-fix_ptr_check_on_clk-v3-1-94629ac7aaae@oss.qualcomm.com>

On 27-07-26, 09:46, Praveen Talari wrote:
> _update_opp_table_clk() uses clk_get(dev, NULL) to acquire the
> device's clock. On platforms where the perf domain device has no
> Linux clock and is instead managed entirely by firmware via
> devm_pm_opp_of_add_table() (through
> of_genpd_add_provider_simple()/onecell()), clk_get() returns
> -ENOENT. That case is treated as valid (the OPP table can still
> have entries sourced from firmware), but opp_table->clk is left
> holding ERR_PTR(-ENOENT) rather than being reset to NULL:
> 
> 	opp_table->clk = clk_get(dev, NULL);
> 	ret = PTR_ERR_OR_ZERO(opp_table->clk);
> 	...
> 	if (ret == -ENOENT) {
> 		opp_table->clk_count = 1;
> 		return opp_table;   /* opp_table->clk is still ERR_PTR(-ENOENT) */
> 	}
> 
> Consumers that only check IS_ERR(opp_table->clk) treat this as a
> valid clk and pass it straight into the clk consumer API. In
> particular, dev_pm_opp_set_rate() calls
> clk_round_rate(opp_table->clk, target_freq), and clk_round_rate()
> only guards against a NULL clk, so it dereferences the error pointer
> to read clk->exclusive_count and crashes:
> 
>   Unable to handle kernel NULL pointer dereference at virtual
>   address 000000000000002e
>   ...
>   pc : clk_round_rate+0x3c/0x188
>   ...
>   Call trace:
>    clk_round_rate+0x3c/0x188 (P)
>    dev_pm_opp_set_rate+0x114/0x33c
> 
> Rather than teaching every clk consumer API to special-case
> ERR_PTR(-ENOENT), fix it at the source: use clk_get_optional()
> instead of clk_get() in _update_opp_table_clk(), which already
> translates -ENOENT into a NULL clk. This documents that the clock is
> genuinely optional for such devices, and keeps opp_table->clk holding
> either a valid clk or NULL, never a lingering -ENOENT error pointer.
> _opp_config_clk_single() is only wired up via opp_table->config_clks
> when a clk was actually found, and every other opp_table->clk
> consumer already tolerates NULL through the standard clk API (which
> treats a NULL clk as a no-op), so no other call site needs to change.
> 
> Suggested-by: Sebastian Reichel <sre@kernel.org>
> Reviewed-by: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

I am getting this with git am -3, please rebase over [1].

Applying: opp: Use clk_get_optional() to avoid leaving opp_table->clk as an error pointer
error: unrecognized input
error: could not build fake ancestor

> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> +	opp_table->clk = clk_get_optional(dev, NULL);
>  
>  	ret = PTR_ERR_OR_ZERO(opp_table->clk);
> -	if (!ret) {
> -		opp_table->config_clks = _opp_config_clk_single;
> -		opp_table->clk_count = 1;
> -		return opp_table;
> +	if (ret) {

Since `ret` isn't used later anymore, you can instead do this and drop
`ret` ?
        if (IS_ERR(opp_table->clk))

> +		dev_pm_opp_put_opp_table(opp_table);
> +		dev_err_probe(dev, ret, "Couldn't find clock\n");
> +		return ERR_PTR(ret);
>  	}

-- 
viresh

[1] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/log/?h=cpufreq/arm/linux-next
