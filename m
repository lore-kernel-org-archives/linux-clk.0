Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823C75D8E0
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003139; cv=none; b=DS1fUAhMjkOaXrQZNeeIqy5pEFthWT4LICW1QfprW2bkw3km44lKJe9qxCfoQ7bcYGYWkjqvu3uJTpB0i11TyprXvD/IP4CRTuJkkJZhOYmJsm2MrOqO5xf4kGC/Fg5muSGEI53OX9GYKph7Tc7HwfM/ciEs6oNqq0AlLqc2LME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003139; c=relaxed/simple;
	bh=aLi4ni515fDPLmheTfXWKONnXtTpxfLwvtIiaSEI/pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7G7N+52OXPxVzz4L1IopaY9ezuoDU1cB6Y8uw5yMnFhPO0G7LiEjjYqE9KplsMNVB7pTucwsZFFTEwZvBVY2v5HcZ6q/nMK0JlykFVUZt07iRgnyB1gjb8mNKG/ygMJuHNkhM37WVFwnGbSRbL8A+NHUcm6OPQYYAEf0NTmtok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SgqeWKKk; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SgqeWKKk"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4299f424e55so18761431cf.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706003136; x=1706607936; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GPuIu+Od8YPZ7JAGfosVr9r0tWmFr9cTu0oqbB+e0Zo=;
        b=SgqeWKKkVfxFi6U7w1Pb3K8TdafaRdah6HPMhYpQCSjsPbxITaoq/4gOfakq4uHny1
         iyaLBJIoOITozXmV3Nf8bZ+uVxL2n2qzAPyhagNapf5fXxmWWg74khT9OZ3jKdzVKj5M
         Vw20FKcGeQi3Soibai1EkTr//02S+07D7D0xp9zq/809AI/yyg+Z3Ty/AP/sV+a2Ibam
         RoiqsJMcCApxz6LVBRkyeMGYfLJ8or+rRMa9fDWXCvv6v40HOHQ2aWpRL0ICazeaV6i1
         vUsLTYN3FdfpbhpJxyhF5Mkpe04uKOcGnLVKUz0fvZJY+MWoKXAEeHrpt7NWTU4hPflv
         jrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003136; x=1706607936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPuIu+Od8YPZ7JAGfosVr9r0tWmFr9cTu0oqbB+e0Zo=;
        b=XtubIxEfv1+U8iEiS2EbzfuDv//1WtC5wh+OanMDlmRkocHyD0YEbFwb8lQR5A4Oni
         W2yzXWt6aeZbJlgRIAuLAScaG+6lfy5Vyb9BeXBNrHsS0fWBNv/Vn7U0N/fDvLmXLHQw
         Ql44ZovrMwTeqqogyY1bGLNje8q6ElTFJTAfclO1hWO5WINK1+lDJkxSTbb+VjAKc0zJ
         wpdFfmCrIZAmg2DFo0WQZBgkZUGTIoRwCo6aK/jUCyXblZYrUAKpMOFdM+273eYjY1B8
         8WvL7NhVXWSwM+bRZtI7D9zS7VcaG6CD8aA6Rrx2S/OLRIDKdWfVXSgLmSRCYVsX/n6S
         3jKg==
X-Gm-Message-State: AOJu0YzOvRcqMbwNTj3OTOP+e97sbrdzuTOUcIzDajetqg00uIA0JmCg
	zUicc64/WlNgb0bm/54l+LjZTepiPQDyRD/hoxt338Mqtrobs7bvkJniVIR3CA==
X-Google-Smtp-Source: AGHT+IGwmRddd4hbzIPzChpuRO0Dfx5I4nzCNEfptJ98zrnanML4MnrVA1G0oVNdUJTPC+nD4BLe2g==
X-Received: by 2002:ac8:4e93:0:b0:42a:3a03:7ea0 with SMTP id 19-20020ac84e93000000b0042a3a037ea0mr450084qtp.111.1706003136386;
        Tue, 23 Jan 2024 01:45:36 -0800 (PST)
Received: from thinkpad ([120.56.197.174])
        by smtp.gmail.com with ESMTPSA id fg6-20020a05622a580600b00429be14d3bbsm3323313qtb.13.2024.01.23.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:45:36 -0800 (PST)
Date: Tue, 23 Jan 2024 15:15:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sdm845: Add soft dependency on rpmhpd
Message-ID: <20240123094528.GA19029@thinkpad>
References: <20240123062814.2555649-1-amit.pundir@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123062814.2555649-1-amit.pundir@linaro.org>

On Tue, Jan 23, 2024 at 11:58:14AM +0530, Amit Pundir wrote:
> With the addition of RPMh power domain to the GCC node in
> device tree, we noticed a significant delay in getting the
> UFS driver probed on AOSP which futher led to mount failures
> because Android do not support rootwait. So adding a soft
> dependency on RPMh power domain which informs modprobe to
> load rpmhpd module before gcc-sdm845.
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: 4b6ea15c0a11 ("arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC")
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/clk/qcom/gcc-sdm845.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 725cd52d2398..ea4c3bf4fb9b 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -4037,3 +4037,4 @@ module_exit(gcc_sdm845_exit);
>  MODULE_DESCRIPTION("QTI GCC SDM845 Driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:gcc-sdm845");
> +MODULE_SOFTDEP("pre: rpmhpd");
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
