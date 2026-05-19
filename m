Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD731E846
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202441; cv=none; b=dSX7cfRU/ps55JGxT5Ywde0FqElukQZMVq8K6zhFFaQ9lH52Q3mOfozuOhp7Xt4v6MKo+7Fy67EKrWiBRYnO3vUxF6Ra/mON2UVk+IWXmTsLbuE0UAVlhW29OP0+bgx6HlPCxVG+DKLHf7JrbqB0cwugvwM1EfO9qNR7OBAXg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202441; c=relaxed/simple;
	bh=OXBIkjSU758c6rNMkYEXqLZB8lqyHUA/jgPib0CXRAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhUvVnmIeRnYEP7OwICfkEp0fVrZdada9deR7uCkhBHjgENSYImZgO9SOKn7s2XNzjgxp0Izd3XtlP2PCYRtYSAdZqFwnzIRU0smCvpXeei+al6yiCHd01XsyRLr5FdykH7qm6aFsMhBy1Di76MafozH3PG8S0gD1wKpxk8AnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g9uHXDXs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U3+o5zhN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g9uHXDXs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U3+o5zhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kgOjCtbQGBrweVM88K0nxcsUl5DkIty1+EqPf4mT7VY=;
	b=g9uHXDXsCAiz1Iq6J+zKPtjQA3rbPxcFndO8AhPwZQ7lachODOIkUHbjB52Wjf9WvffO66
	KoTGJi8eqkqClLcvLCIdoypdrvqCJOUhjQC0IO4l3Te9RgxWsr/2hQHyqDFK/DKBDWjke6
	kUXlWOxjCfpWA3pyPDd5vd0z/9jH87w=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-sC3AS-4YMTCN7hG8HBVbyw-1; Tue, 19 May 2026 10:53:56 -0400
X-MC-Unique: sC3AS-4YMTCN7hG8HBVbyw-1
X-Mimecast-MFC-AGG-ID: sC3AS-4YMTCN7hG8HBVbyw_1779202436
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5156c85538cso107621541cf.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779202436; x=1779807236; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgOjCtbQGBrweVM88K0nxcsUl5DkIty1+EqPf4mT7VY=;
        b=U3+o5zhN8OEkQhcdaqte/R+bnZm5uYuLdlCi+4tUxzmqIbjFkqj0MHHjMA/e+WVHwa
         MuQRsfcxtvk+Ty797ZKE3CXWO13qqVL62RH4C5FiIi2IyZ4/nSILhiinjmCcYuQDx30A
         fC2zJhK/zKdxpIEpitRdfoCW3aTHQWCHflizcjaLjKGoYQmzePj+OCq5By4Cn4CoJSL0
         vvjNHh+p/7BRruC+dlfrs/n/BLX5KYjbk3d98zlIBZvpvBiHVmGMbs2KBpNSFcUsdpti
         vi6ztY4rBXOd7tkvnFg8wXQKb/+ive/v0mkHX+1zLW3DuLGuGG6gQa2RBXll1s1A1xi6
         gvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202436; x=1779807236;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgOjCtbQGBrweVM88K0nxcsUl5DkIty1+EqPf4mT7VY=;
        b=tU+BJjn5dQMSrBHCD6voWk07NKAk1uji9Rh3eknEpGMo6U4USNUOIE/q6opRKEYX3N
         NzkIzFaO9crks41IXumv2rmD8HJugLJ5V212HPkYbxAEua6GfDr3d6DLyn+gVe7bgIB0
         Y8zQBbfauRJgn+sThDImAQJIS7EDLvXsV09eGufeuWrfIUwAhGlQFxQYvwmIDpzjpr93
         mbZw20+K7U8gcJzR8r3KfL/X9IeLcBWXtnketg+YZDY8uCBZpQteefYTqytze2hrDbsx
         zxDyVHXhRLUmwGjrIqhvo63cK8mUQ4hBRr/6rYF6971Wka+tYrFt+IEElod1nmcqJsN1
         WbYg==
X-Forwarded-Encrypted: i=1; AFNElJ/8+kNOENmVR98ktUh0wFnN0d2fz8uYz58l6v4cU9DUyam+jQF3/uU6OvxNm9XHkaxKlfCvpCK+aZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqS73b93AX2toV3JiW5kvw5hJ6GojS0qHdqzXLmufrN5O5I1Hk
	aeDmxgw8VSBZ2aJrdUEgKjI+K/FKq6iRVRd/+F0SmkD4u4WxG0kbOMtGmJY7MZ07xBeMHxP0SIA
	RASBWf5G8SNy/kfuf4BXkhsujFWlVEcD0JvZPdkkh3KajU3ZXIrPP8kmiuF6DJg==
X-Gm-Gg: Acq92OHoYrK+0e490Qwl1f+QhAdOhALBtB9uj41Emrcgy7g6m/7ae/VEgbzo5m1UGxU
	JCkJs8bgUG2uxUVPwccDqj9BLOJQPQ9gRz5wKUYKZ9t6mfQJszRCfunE5yR6UTwLf/Xv2CNPPbL
	P2Mbpg+9K3CcQeqgCgI75yREsZH6oCVh2HyZ9Oe7/Q9TqivRJNBGmhz+ilZu2EnTvzUnOG5PW8d
	LTpNjHqX/WCVd/JPGdMUCXpKvayEDdlu93E/NCkKJwL7lP0/bdSXuskAUvqfZzL1fRXgrrECBAC
	dIuiJeZ5xCP+lYqUhbF+AVJBnJz+xguC/dwoVMfLwx5X7/X7+H23cAq8coD4wcz/lYw4gMD76Ur
	oJr+rH95tf2dbnALzsE0jtA5A0y7XjFCxJ6XpZQMxpKEFNvXJbkq/GOJS
X-Received: by 2002:a05:622a:5908:b0:50d:736a:6259 with SMTP id d75a77b69052e-51659fbe97cmr273640401cf.3.1779202435789;
        Tue, 19 May 2026 07:53:55 -0700 (PDT)
X-Received: by 2002:a05:622a:5908:b0:50d:736a:6259 with SMTP id d75a77b69052e-51659fbe97cmr273639801cf.3.1779202435169;
        Tue, 19 May 2026 07:53:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164568a275sm165644671cf.5.2026.05.19.07.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:53:54 -0700 (PDT)
Date: Tue, 19 May 2026 10:53:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field
 width and fractional calc
Message-ID: <agx5gTfaByMNjkX4@redhat.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
 <20260513055626.1070533-3-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513055626.1070533-3-a0987203069@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Joey,

On Wed, May 13, 2026 at 01:56:25PM +0800, Joey Lu wrote:
> PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
> The hardware fractional field occupies bits [31:8] (24 bits), so the
> mask must be GENMASK(31, 8).
> 
> The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
> as the denominator to obtain 2 decimal places.  With the corrected 24-bit
> mask the old divisor is wrong; replace the arithmetic with a proper
> 24-bit fixed-point rounding to 3 decimal places:
> 
>   n_frac = n * 1000 + (x * 1000 + 500) >> 24
> 
> The +500 term provides round-to-nearest before the right shift.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> index bfedd45bd04b..7e6b30d20c01 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> @@ -48,7 +48,7 @@
>  #define PLL_CTL1_PD		BIT(0)
>  #define PLL_CTL1_BP		BIT(1)
>  #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
> -#define PLL_CTL1_FRAC		GENMASK(31, 24)
> +#define PLL_CTL1_FRAC		GENMASK(31, 8)
>  #define PLL_CTL2_SLOPE		GENMASK(23, 0)
>  
>  #define INDIV_MIN		1
> @@ -113,9 +113,9 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
>  		pll_freq = div_u64(pll_freq, m * p);
>  	} else {
>  		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
> -		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
> -		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
> -		pll_freq = div_u64(parent_rate * n, 100 * m * p);
> +		/* x is 24-bit fractional part, convert to 3 decimal digits */
> +		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
                                           ^^^^^^^^^^^^^^^^^^^^^
You should be able to use DIV_ROUND_CLOSEST_ULL() here.

Brian


> +		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
>  	}
>  	return pll_freq;
>  }
> -- 
> 2.43.0
> 

