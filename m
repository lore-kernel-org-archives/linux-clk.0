Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D209204F86
	for <linux-clk@vger.kernel.org>; Tue, 29 Oct 2024 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200238; cv=none; b=nuyuEOJn8l11MYj39nVB3Cp+etohc/sv3shiOQd2qdS9iQZ3UYNCl/NLdO7MA5we2VhKN2LkHhjGrGgtqg+Aeqde2z7upN3JAmreInzCFtAaP3ysLc67uyycrMpPpPaRDGpgZb8BO5HGjkfdkMAv/xRvDHvkcDvcezhywchVr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200238; c=relaxed/simple;
	bh=tFMKTNPmYqJnBHp7LbWdTDUq9SozK9sVsXxDQzNVaBA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJlmeSyfDNd3HVng+S4TIxZ8bI9aZCeh0Bwb3jiWOtz3zOLAiSDeFmGOpHyFN4B1D62sAUvEwIRK2SRKr3pSfony327Gof/Y+0W5phvz8PDUxkNubSYvYAIeMd5smfiqHXu0R+vQOTMBQoQjvbwsxonE5eBJuBrAt7Rye963Em8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=q4ew1JJr; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="q4ew1JJr"
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9D7A33F129
	for <linux-clk@vger.kernel.org>; Tue, 29 Oct 2024 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1730200227;
	bh=OCvTHmHIsSTPPIZoUzRjyZ2bC+ZqfM/bLPYsIiMxcJE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=q4ew1JJrAO0uRuq340Dxk2HTOnMS0zsf42msOpvWiJp0TxqPW+GTZSnO0HJukV43C
	 mpUnb6Xx5jEYWAozj2JU3OPKAZN+e/QSLXBM55fnObPdeNXfMNIX7cvGuxloeahuBB
	 MiDSHBLlnMdNd6YKLq6qoQEBuAJGv3jUEcKwTHmDuSqdg8niIpp3kIVsIHNLw4IR2x
	 42tAkyOVcMRDYQAq3Xee1v/rL6AswFoIfPH53lqkzHWyZCgIBjBihgMq/g0uQwIBtM
	 TA+kRKGhX+xzJGAtI+B1AIGcixAeKFmd6I9TvGf8gR5kDb35hW0llxwVmpUc2ucdaH
	 6NbZaQaa2Q2hQ==
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3e5f2dab4f0so6200105b6e.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Oct 2024 04:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730200226; x=1730805026;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCvTHmHIsSTPPIZoUzRjyZ2bC+ZqfM/bLPYsIiMxcJE=;
        b=krlb9gRhTSn8hcHlnS/84b6aO5ZyFePnUkl9WNbvj9dncBSjerm03zNijgZOYaY1HP
         kYUWa8HXscJ3iM63bhigvlImLJ0nfs+7yMxZc5QMuyscmAdY+ggK4NQ9HvbRjitsq1VW
         117CPYv5yn9s3Dw/wRm7GjRwUMhCQ7xU26loBeNqdkawpvmOnRxB+lZo3Y1XH9wf1In5
         KeboPz4clLoUyoT/soia0ODaHiZ4PkNzdEHiY7TiwdwuZROKSAMsnzHWwlizNSYH2RAJ
         5nLF+namk/2p91PsPf4Jp84xpmjjO9euXksDle81zppQsGiHf3qNG3hg0qDEbyCxQ09o
         DmkQ==
X-Gm-Message-State: AOJu0YwPGyjmPVXkJzNoEKwa/oav4pChJ04fy9VPeR+BDSjfiT7To3NK
	TWAa3SsVvr6I4LGE9chy69xk6U5XEULQltZ0tV8N/8CDaAf9U3mm6OM1TrPeJEHtZvdsHEb7wsZ
	gwfgRTbDOw1Q28CfSyKMzt/oSI1ukCS/vZwweWYYpgeE76HlzhyDtzpTTAfSGnmc3VMQybQzaVs
	DBCRdAhXN3023B/Rg/lp/yeWtV8tzKkp8MX/hD29TImUhJSTYP
X-Received: by 2002:a05:6870:180b:b0:288:8bdc:1ec5 with SMTP id 586e51a60fabf-29051ba4840mr10052134fac.19.1730200226508;
        Tue, 29 Oct 2024 04:10:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3/FOqZQ6Obh7FQh8oUZ/M2AMCPjS/Rwuilx2dDjehZ6+vagRyskdpKOXihVmzkbLu0/SzaBchfmjWxpYmNl8=
X-Received: by 2002:a05:6870:180b:b0:288:8bdc:1ec5 with SMTP id
 586e51a60fabf-29051ba4840mr10052124fac.19.1730200226197; Tue, 29 Oct 2024
 04:10:26 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Oct 2024 07:10:25 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241029032828.238706-1-changhuang.liang@starfivetech.com>
References: <20241029032828.238706-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Tue, 29 Oct 2024 07:10:25 -0400
Message-ID: <CAJM55Z9-xrKuH3eS3hUjDMv8JEabBZRR48oQmhv7yghtiG0cFg@mail.gmail.com>
Subject: Re: [PATCH] clk: starfive: jh7110-pll: Mark the probe function as __init
To: Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Changhuang Liang wrote:
> Mark the jh7110_pll_probe function as __init.
>
> There's no need to support hotplugging in the jh7110-pll driver. We use
> builtin_platform_driver_probe, the probe function will only be called at
> startup.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Makse sense to me, thanks.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/clk/starfive/clk-starfive-jh7110-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-pll.c b/drivers/clk/starfive/clk-starfive-jh7110-pll.c
> index 3598390e8fd0..56dc58a04f8a 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-pll.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-pll.c
> @@ -453,7 +453,7 @@ static struct clk_hw *jh7110_pll_get(struct of_phandle_args *clkspec, void *data
>  	return ERR_PTR(-EINVAL);
>  }
>
> -static int jh7110_pll_probe(struct platform_device *pdev)
> +static int __init jh7110_pll_probe(struct platform_device *pdev)
>  {
>  	struct jh7110_pll_priv *priv;
>  	unsigned int idx;
> --
> 2.25.1
>
