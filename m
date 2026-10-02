Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA524AB1DD
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955635; cv=none; b=DOpH32wCiGICmVACFi+TERpxOGwcR/hED52Hi/HHaaP3QvNy0BIb2kl0VUYpFh7jCWSlFFmjMkn7dbHx3Vk+aLHZkaqK2AEz8C6cc8BfJ17dWdhUlYPpJJD9lx+FE/w6VZhedyvhV2qW4n0GJoF3MlW9PbKhmV+amfSatu4nRZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955635; c=relaxed/simple;
	bh=WQsDDSMUZRhlskhbuefNaU/oDZmoaAVqCqR5bHZT1Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxiZgU7qf8pc2todTdZVQYuPnCHL4Q4RjYU2t/nWlPcnTW8j3mIAYXLQa/o+vYtBTgJJjtcldXi7pGooCpUGFcRevfcqpBAlugyk1Zru7z3VsauIh/HE/1ddFHBAo/Wj7fQLGGl1sxKRXqxFb74ZJz+7r8Refhz2M1p6KKe3lJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YVJPahsY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ozPpu/jX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YVJPahsY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ozPpu/jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790955621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oiiS057kpBWsJD1BtMWJm5EOfNc4H/UurY52kp0eYCc=;
	b=YVJPahsYHnfQVThthxn/anW0V12AhR3Vkn/uCVIUE9Vm43l54udsqtQ7CTaWgEMJQRk+f8
	TqmNnK9G53oL0UbdhzX/JTeIgkL3mvMkT13dz9Y1LwMDI0mdeV6oufnxtK5k1fQdU2HtS1
	oAvPk4yl1Icp8HQIK+J2aRo/fnMD6L0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-2GDER1MYMSSmSK2UEuotKw-1; Fri, 02 Oct 2026 11:40:18 -0400
X-MC-Unique: 2GDER1MYMSSmSK2UEuotKw-1
X-Mimecast-MFC-AGG-ID: 2GDER1MYMSSmSK2UEuotKw_1790955617
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338ff2cf14so32557231cf.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790955617; x=1791560417; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oiiS057kpBWsJD1BtMWJm5EOfNc4H/UurY52kp0eYCc=;
        b=ozPpu/jXAzZIo0zu/9LK+ICU9zXJodlaZQRzNX5FgATAdHaZ+qAvKmTF6t9jvZfiJ9
         AHmLMmZ6SmPxUhguGshnF08hBOW7KGWy1OVge8CKnRpdkHpUs3J9Zw5U0EhYXfIXZQc9
         iRCvbwKgvrEZts/PrfR5k8R9TjKm5lvrdXwtn5rddK9pQ85cjiTOKzHchZn7MZTlSvCQ
         UpVf6Fbk+JFqhc9u7WML8faX1PukOsM8jJvIEF7M8zQVho6PbRJNrgkS41rljzFHo/ZF
         0MGK5budA4AJFsXKlr1Lpbh+mamOjcfaEWVjU8e6SCBuHWYWyw0vC8dEOp/SiCPJEbgh
         m6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955617; x=1791560417;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiiS057kpBWsJD1BtMWJm5EOfNc4H/UurY52kp0eYCc=;
        b=K7xQkesKRzpajON97uqqOR8oM8/3kGuhKQKuvnMYAmigcndrCeAQfEU16xv7ff0tE2
         XGu6NnWHOYOdds2tPsIzvpsJ/9u9WKQHHvHvxqqCooUyvSfXcybKvtEdHUfBwr94LTjb
         Y1s96u12GEgZOTBRFwm5mhogLYL1igX+6WFaSao60RaoISCKauDZzblSLi7qjm4lzPim
         B+YkO4N2zY7X5CzV4v0HU1HpsrNYVlVuECc2J1tV8y2m6Nyby9K88d6xV9Hepkxing8y
         3t/FNIyPcWACZH91Dg9jlK7DFVuRgfFWz1c9y0fVhmRlgDpQZHXnrSKXAZ9ilpqii6HB
         wN4w==
X-Forwarded-Encrypted: i=1; AKwUvBz9HTcb6UP3TgFTJJFOrgDeALxnbhnOZ3PW/trOzsM9rI8P/gMS89xZhywV2q4DYa6v9Pvyb0EvyKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m7CbsyPpCvSWQwaDUJWrLM5mqBtCCAP74uI6sGpBIQJrZkhSse
	RrBsgOTjL8Ar1BAY6obTn0n0bydTzbI47/laMLBG1gCveEDJDelx4E7K6GDHSeZXlbP/8Cyl4X0
	y6WZ11sZHxhOa1q/Xt0opPAgXSVu1wGxno0D0CvmUzj2tMexj5yKl+WCd2HLCGA==
X-Gm-Gg: AYBFou0khnGDzxyLrsHp3Z3fxHJnVTkASmqwcemKMAG+Wx3GncEvW32VFZOa7yFFqlN
	4r5MBjYie2sr6k83UZMAHKzIbJCXriPiMhXNX0vwCXCKBuZ0FZ3tGOyN2VRJg/Z4JZqnq8AzKN8
	GoUAovp3SwBJ+gfhYZJoI4sDd5XX0jPVEF6y6ngSGtssUeiWm411jiWFwzlimFUsU8HfTPN6XHN
	aRGFxcKuWOiLEaBcPBzN0k7O+tcM9gaB7vHwI1A2w/zcLlbFfKnff5pReiWZVoZttXUWyzTL+XZ
	+8e/kcHCObO7aWbxKE6bGplFIN1srsBKTjxRO0O/oZ6g5hFDalwjYaT6bZJIEMnVzZF9qRBvdyz
	KH7Gs/Bk2VT4o7V/HbQJrVCH0wNReckvtlBY=
X-Received: by 2002:a05:622a:250e:b0:532:ab93:1400 with SMTP id d75a77b69052e-533bc662ddamr53425531cf.5.1790955617313;
        Fri, 02 Oct 2026 08:40:17 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:532:ab93:1400 with SMTP id d75a77b69052e-533bc662ddamr53425041cf.5.1790955616765;
        Fri, 02 Oct 2026 08:40:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d438ccsm28817651cf.30.2026.10.02.08.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:40:15 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:40:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: Fix Tegra114 MIPI calibration clock parent
Message-ID: <ar_QXessqHKkVAHi@redhat.com>
References: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Mikko,

On Wed, Sep 30, 2026 at 02:18:34PM +0900, Mikko Perttunen wrote:
> CLK_MIPI_CAL on Tegra114 is a plain clock gate with no source mux; the
> fixed parent is PLL_P_OUT3, which is specified to run at 72 MHz. The
> clock driver currently registers the gate with clk_m as its parent, so
> the clock framework never enables PLL_P_OUT3 when MIPI_CAL is enabled,
> and reports the wrong rate for it.
> 
> Register the gate with pll_p_out3 as its parent. Also drop
> CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
> 72 MHz so we shouldn't change the rate.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

Should there be a Fixes tag? I see that Thierry made a change to this
same clock 11 years ago:

commit 07314fc108e195044c074f4b443974b5aaa2d5d7
Author: Thierry Reding <treding@nvidia.com>
Date:   Wed Apr 8 16:48:26 2015 +0200

    clk: tegra: Special-case mipi-cal parent on Tegra114
    
    Starting with Tegra124, the mipi-cal clock uses the 72 MHz clock as its
    source. On Tegra114 this clock's parent was clk_m, so it is the one-off
    chip.

Brian


> ---
>  drivers/clk/tegra/clk-tegra114.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> index f1bca81b7776..97f5500b13b5 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -1050,8 +1050,8 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
>  				    &emc_lock);
>  	clks[TEGRA114_CLK_MC] = clk;
>  
> -	clk = tegra_clk_register_periph_gate("mipi-cal", "clk_m", 0, clk_base,
> -					     CLK_SET_RATE_PARENT, 56,
> +	clk = tegra_clk_register_periph_gate("mipi-cal", "pll_p_out3", 0,
> +					     clk_base, 0, 56,
>  					     periph_clk_enb_refcnt);
>  	clks[TEGRA114_CLK_MIPI_CAL] = clk;
>  
> 
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20260930-b4-dalmore-fixes-mipical-clk-eb375008dd66
> 

