Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB17364
	for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 00:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714091084; cv=none; b=SiQ4HTeExK9iC5b4KopCeLjwe2AeMEwZM1EUzkbqkK/0n9Mf03qW9cYqxJLuIGu9FCXs1caXT5Sk9el8Mq/Oi4tL4rdmieBsZAejjULdQKprm7VPEBkpqMrSeJsVqHYShN24WnTKHeTuwNEyV08vGoqb4W/fczybBJGE1sFeRiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714091084; c=relaxed/simple;
	bh=lY/b2HHcwmwaOByC2cmw51VLYSiM/ObhqTjVQMb2IlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BT88/2206pH0cMxJimzejAuSn4yYGLblHkncSnivqxn5fLL4lx3eTzybUGu5SkPnlMP3Ep6wxyW4rONze9l5zExE37zg0PepmI5LFiLvAMIvRMEvYVoPtEJ4J3SRLwMScXtDKOVFpD9SZQRva9l5YdcKPIW70RTuU0aEH1GGKHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AWERlEj8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AWERlEj8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e44f82ff9cso31975ad.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 17:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714091082; x=1714695882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQr+lHvvnzrTNNx8KXFJ/y9NdZERop2kacnW6a/rm3E=;
        b=AWERlEj84iFPt8w4UIvwsBGRs27wWZrNqTdgC7oRJi/gmsZEECi+eqFGgLtjA+U7Vx
         jFuZXTqOV6+WB2gOqoh1LmiSa+3Qyprv7ihCTCO9czrUNOUD06FRDgthxFNAOIrhTJSN
         a8mIGSVRQnk5MBqC4e/H/mlE+rmuC1xStGpmJurnB/GnNjpL52My8i7A9uqqaqB1u50R
         TsqOd1AKekxDVSAifioQ5X/uUm9Bzw9ego4tDHU1hZuf7TtiPrL9aPt/caaVi4SJNwTO
         yng7vQrF2tMhQ8O4GpKeCvDDJbwYC+Nw3cWq48RJ8YdJSLA8nRF9fxUsPo+Z6c1kr4TE
         0R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714091082; x=1714695882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQr+lHvvnzrTNNx8KXFJ/y9NdZERop2kacnW6a/rm3E=;
        b=PVYnBefroGN3N0/9HKeUnSVDDNWAkDn70ew/AtnjN5Mi+F4oZCuS71fuUOzONXfoCR
         ZM1KbrZq59F3q6DIQj0/leFJazajj5JvMupOdJcDdlRqhTTbi+y0n4tlo8Y4JN0io2ld
         EG42pizDAF3lTZCk8HtY3uqgVOa+mJ4jOuCs0YO5M7Jc13vBRPpsUhywNZ0vhHkfaqBY
         JZH/ED7dxcZ6gFEaaAKY1Pe3K/eYjd9jvXa1iMLMorsnVxM/GYCELoVTAAlI2pJenYMS
         QMg4sDtH3f3lbmPajnVWVfocTyKn/ipoBTaeuLCB7/KeXq7jLimsh6tFhU2ULAPWQlaU
         QbLw==
X-Forwarded-Encrypted: i=1; AJvYcCVAGrCTAAc7rNJvTEI5LOVpyd8Q6TzWsfHpB3dFzLaWWVbEQq7bsq5vVJ6snUE75AzGgOcg7ctnu0ZvLI3McJfuUUnpkizbzrSj
X-Gm-Message-State: AOJu0YydQb3SWTljS3VO0z8NQS2uSzKCFWuoTj4dlKOd7UKUzzMVn3FE
	qNDEzVcetfeNEja3sAPCmz1oFwsG8CndGGUWequlDg+QLsWGGlKOosLyGJAsMA==
X-Google-Smtp-Source: AGHT+IFrtSVQuUHEqbyIxrPMQm0ST0dLdNyyUfw9rs5kWDOGM5kIhSyCJMIfcB23BZ3XZc3LJcBGTA==
X-Received: by 2002:a17:903:2450:b0:1e4:4b5f:7bfa with SMTP id l16-20020a170903245000b001e44b5f7bfamr111268pls.22.1714091082070;
        Thu, 25 Apr 2024 17:24:42 -0700 (PDT)
Received: from google.com (100.22.168.34.bc.googleusercontent.com. [34.168.22.100])
        by smtp.gmail.com with ESMTPSA id gs9-20020a056a004d8900b006e694719fa0sm14227010pfb.147.2024.04.25.17.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 17:24:41 -0700 (PDT)
Date: Thu, 25 Apr 2024 17:24:38 -0700
From: William McVicker <willmcvicker@google.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	David Lechner <david@lechnology.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
Message-ID: <Zir0Rhm7jZoF8r04@google.com>
References: <CGME20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7@eucas1p1.samsung.com>
 <20240425091429.948467-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425091429.948467-1-m.szyprowski@samsung.com>

On 04/25/2024, Marek Szyprowski wrote:
> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
> module driver") this driver is instantiated as MFD-cell (matched by
> platform device name) not as a real platform device created by OF code.
> Remove then of_match_table and related MODULE_DEVICE_TABLE to avoid
> further confusion.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 503c6f5b20d5..0c7f4e2aa366 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -75,7 +75,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
>  		.data = &exynos_clkout_exynos5,
>  	}, { }
>  };
> -MODULE_DEVICE_TABLE(of, exynos_clkout_ids);

I understand these are duplicates of the exynos-pmu driver, but was wondering
if this will impact the exynos-clkout module from getting auto-loaded? Without
the MODULE_DEVICE_TABLE() defined, the aliases won't be created that trigger
udev to load this module and the mfd driver is obviously not going to load it.

Thanks,
Will
