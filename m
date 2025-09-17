Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207FA3064A2
	for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122691; cv=none; b=Slv6+bS99sMWUf91P1H63rOArechgQbEZZkj7SniccDyUIIzS7yq38N6JIC0mCHGHjHFOw0tgeZhiFoiQoeJPvSqYuV+MybT7M34c2LCpG9pCdG/tvWD5KQA48mhLbs/WOHMPJwiUsH/lIuvnu5kli6/VkLFVXihOAEndd+PhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122691; c=relaxed/simple;
	bh=3ARUkUpoBf83aJNRQ8BiAp+2Sc3izs7X4NYbaBnVQgo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TeSwh983oqowjKBN/awggIt8simAqF2AmzZ00OZ3Ix1MptOfPcVAoUxikFyrP3P4cRKfJDzPvzH8ercGYcsgKFe2pnxazAV97ncDAwf5JEi/sA+Afkw49sJifLwHSrNEUwmYvBBG4a6+1nYaBEJdQXLHMDViefkC7QlethVf7zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so5525845b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 08:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122689; x=1758727489;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bY/asBqVOnDWFE5LcHmnDOT5AoWMNTr7WSHO+9CO+k=;
        b=XLGla5j9rZcANRfMuTyk1xBbPgzvFto2g0zz006hQ5y0Z0FTC6cZTMTvYhcvCeQS3b
         Q4BM+boBJLsnVytZIHTDuWCZF+0RZjWHC+0zhp6PEVs9T7iHTgu5Nh/ay1tzH91BOFMn
         STkpBRBS/V66zcSlWeCarPTFeq1gSAVka3buFmKfDc92HxdnOzeX8jwyEoo+tASBd/+S
         R1EJWhGE3RbXdY0pR/FuIvf+GYI7Ku+5S1SPdfQ4cmsrw4RtQS+Fep8N0rEUREQgZMZp
         GMUcI9WxZh5OBtJDSkKoEiFmD6uckE8mIpzCxf5PDzITlADK9UzmlPcnxaI4zr992We5
         6RrA==
X-Forwarded-Encrypted: i=1; AJvYcCWd2f637DIsEe0C7CRnn4ucaoFRwEv9UEZOeuQ8GN7gADEqO4z53mYLvX5JguQqmhZ4wW7IrNDjVxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw46mucCAV5NhGEAGYd65oY33CgrsCVRptLRlKVWZ6Gwh5aG4ax
	G+QVUvwpGPzumMobblemrilbXy9Uxix3VDoc54bEtEq9xK2dO7hQqL2SgEkZYqH8frc=
X-Gm-Gg: ASbGncu0XzjQWYvXtK55pwFFO4nRYBCfSPz5o7uzB+v/ES0vYp3KHiJRCfZc5Nq00T+
	dI1oWOF8v04RkH9HNkV604onLK6jYpTmdeg2Kd83hlLXqM4HVf5JHz2yojpqKkeTAy/floN2F0d
	J4esCvUYJjrFKmcYnV4FsNSAf3xaeR8sUlK/gXvo1ZJ1sx/eD/DBMdl29LsxpaXYTBJs460Ngez
	GU3+1jKRZ71Gc52pfkk8eUnjkLZ2deWXfxtLDaDcNosc86iG7IfMmTxqKLLa0GdRMCIWukAv+Ha
	q8cbR7Ntk3b+d5xOhhweZDBYk4KW9aPA21m+s2azVTekAOlAb/H8obhGB2c/SYBlAW4LaHU+3Xz
	Xc2Ai45h5IZjWDjs5sWnq
X-Google-Smtp-Source: AGHT+IHJBEGVlWAkDnL7p8aPBmpzPuwLI6TVt47t7wf2wpFW3MFRt1QIyIXPCIevSu5aQ3ieTqwwuA==
X-Received: by 2002:a05:6a20:2449:b0:24b:1a6d:298b with SMTP id adf61e73a8af0-27aa3cf5b6fmr3447692637.34.1758122689322;
        Wed, 17 Sep 2025 08:24:49 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b65dsm18800938b3a.9.2025.09.17.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:24:48 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Michael Walle <mwalle@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Michael
 Walle <mwalle@kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
In-Reply-To: <20250915143440.2362812-3-mwalle@kernel.org>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org>
Date: Wed, 17 Sep 2025 08:24:47 -0700
Message-ID: <7hv7lhp0e8.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Michael Walle <mwalle@kernel.org> writes:

> The TISCI firmware will return 0 if the clock or consumer is not
> enabled although there is a stored value in the firmware. IOW a call to
> set rate will work but at get rate will always return 0 if the clock is
> disabled.
> The clk framework will try to cache the clock rate when it's requested
> by a consumer. If the clock or consumer is not enabled at that point,
> the cached value is 0, which is wrong.

Hmm, it also seems wrong to me that the clock framework would cache a
clock rate when it's disabled.  On platforms with clocks that may have
shared management (eg. TISCI or other platforms using SCMI) it's
entirely possible that when Linux has disabled a clock, some other
entity may have changed it.

Could another solution here be to have the clk framework only cache when
clocks are enabled?

> Thus, disable the cache altogether.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> I guess to make it work correctly with the caching of the linux
> subsystem a new flag to query the real clock rate is needed. That
> way, one could also query the default value without having to turn
> the clock and consumer on first. That can be retrofitted later and
> the driver could query the firmware capabilities.
>
> Regarding a Fixes: tag. I didn't include one because it might have a
> slight performance impact because the firmware has to be queried
> every time now and it doesn't have been a problem for now. OTOH I've
> enabled tracing during boot and there were just a handful
> clock_{get/set}_rate() calls.

The performance hit is not just about boot time, it's for *every*
[get|set]_rate call.  Since TISCI is relatively slow (involves RPC,
mailbox, etc. to remote core), this may have a performance impact
elsewhere too.  That being said, I'm hoping it's unlikely that
[get|set]_rate calls are in the fast path.

All of that being said, I think the impacts of this patch are pretty
minimal, so I don't have any real objections.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/clk/keystone/sci-clk.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index c5894fc9395e..d73858b5ca7a 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
>  
>  	init.ops = &sci_clk_ops;
>  	init.num_parents = sci_clk->num_parents;
> +
> +	/*
> +	 * A clock rate query to the SCI firmware will return 0 if either the
> +	 * clock itself is disabled or the attached device/consumer is disabled.
> +	 * This makes it inherently unsuitable for the caching of the clk
> +	 * framework.
> +	 */
> +	init.flags = CLK_GET_RATE_NOCACHE;
>  	sci_clk->hw.init = &init;
>  
>  	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);
> -- 
> 2.39.5
