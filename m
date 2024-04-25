Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C9114D6FE
	for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714065361; cv=none; b=twoz3pEoZRg68ZBFrEJIrMJKaztORUGNklF8E3Oyc0SQLtqJbue8wP0IVEIw2bVFSDazExpV0EztJmn44f4Ce2Bo/dx7ctRWnRSY+46ospijcBg1IcumMqowk+OxbudwkcWrH/+4yavM8AzWzDPYyha0Q8/4xA1NZtjKjgYJXhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714065361; c=relaxed/simple;
	bh=loutFTRPxrxYr3/PG7rK+RIYvqgawCw+3TUN0V/RE+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skr3xRzKRnr/J8oyYptMpE1zuh6CMrRs2UTs6Nv6V4R966pTjhQ5ZD7TX9a6a5aB75BWZq2b4Aei9S5SlRqmusOrL19oC63Gt+A398M8GwAu28rt2l4I076xRutiTkZwqewcewk5WGC+F/Mymj92CMGh8xuWOknx1cvlExiyq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P7T9iPVD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P7T9iPVD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e86d56b3bcso11491275ad.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 10:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714065359; x=1714670159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BVoFOxCV1JHDP2aoF03ZloAG5l88Zzw+9lsvPKG2m90=;
        b=P7T9iPVD+2R53GLkaWp8eM6uQt16bT30vpH5xZwO4eFQIB4+EGuoou/GYU2riiWyHE
         3evN8VcEsQfjSXGSIjwx1ULvndqb3fTmkexkTGGH62Dop1a4uYw2LA85BoZwKGoPL39B
         yd6LOJ/i9aGq1llTByppVYPO3/bmdf0JFC08Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714065359; x=1714670159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVoFOxCV1JHDP2aoF03ZloAG5l88Zzw+9lsvPKG2m90=;
        b=OtEXGTaX+Tn21JUADueS2uzE59x3JTfOO72o25QHPdr4lPWS11z0enufvJpARpcATv
         D+vmPByn/mDVxQt1zq8JMGUnLECbJ6M5qEuMPEACrsD5u4xm+trabASaobt5hc8u/ZZY
         xYwHIAN1dzJVkETOP3EL0KNy5XUeWNtLGW+xQVXal55T/6NOScTntv5ECPEI64+YNCp7
         Cv5xxsnhrix74JZFQPi/3xwxeuEc3lHAko9tcW88fUlCo7AIWg9KEXXI7YlJPbqt/x+y
         pQAepnZRH+Ysj3D9OAVMiPlD/eIX+MVKR8rVSMtMVqapSxtzAVfOoVcy+P+tUypbbmSt
         2m3g==
X-Forwarded-Encrypted: i=1; AJvYcCURF/jkzd6aInZ8olWGjZ4oc275hTwOTPfeiCga7RnavMnhYlDa0zPh/OPAMQjinpLOkmIxPlAkk8f0n84VSJyMmHs/cq6s6umY
X-Gm-Message-State: AOJu0YxIGE74ozo3BY9bCrLRBLEJWRqPuIjoPHn3sAl8uwBEAq/STRFm
	979ZZ7orN8MhwlYVpu4baiAASlMLnh8r6WawO8Vf1+A6+jG48egMBUD1v5HMTA==
X-Google-Smtp-Source: AGHT+IFTVJMb3BdwwAwsZ2j36LZ7tJkEJr9FFByumTo4ENFk4yglK2iF8e7h1wGaAyCSClq9Nhgm1A==
X-Received: by 2002:a17:903:25cf:b0:1e9:668d:a446 with SMTP id jc15-20020a17090325cf00b001e9668da446mr172628plb.20.1714065359234;
        Thu, 25 Apr 2024 10:15:59 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902ea1100b001e511acfd0esm13979187plg.140.2024.04.25.10.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 10:15:58 -0700 (PDT)
Date: Thu, 25 Apr 2024 10:15:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, patches@lists.linux.dev,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: bcm: rpi: Assign ->num before accessing ->hws
Message-ID: <202404251015.46D8BE1F1@keescook>
References: <20240425-cbl-bcm-assign-counted-by-val-before-access-v1-0-e2db3b82d5ef@kernel.org>
 <20240425-cbl-bcm-assign-counted-by-val-before-access-v1-2-e2db3b82d5ef@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425-cbl-bcm-assign-counted-by-val-before-access-v1-2-e2db3b82d5ef@kernel.org>

On Thu, Apr 25, 2024 at 09:55:52AM -0700, Nathan Chancellor wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer about the number
> of elements in hws, so that it can warn when hws is accessed out of
> bounds. As noted in that change, the __counted_by member must be
> initialized with the number of elements before the first array access
> happens, otherwise there will be a warning from each access prior to the
> initialization because the number of elements is zero. This occurs in
> raspberrypi_discover_clocks() due to ->num being assigned after ->hws
> has been accessed:
> 
>   UBSAN: array-index-out-of-bounds in drivers/clk/bcm/clk-raspberrypi.c:374:4
>   index 3 is out of range for type 'struct clk_hw *[] __counted_by(num)' (aka 'struct clk_hw *[]')
> 
> Move the ->num initialization to before the first access of ->hws, which
> clears up the warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __counted_by")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Looks good; thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
