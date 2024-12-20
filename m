Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D3199E84
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676837; cv=none; b=OTrXkZPwQiObyhV7Jzt5vd7He0MvgvsTL4jqgxc6iBl+zcayCUjzqIOmlhatHy7T9WvwhWmvV4kPobirqd/sBExAFAmHY+X+7mWgLa1m03ngQV+Vl4N1lLEp5/6PQ7NSfCvS+j6/SzSgPJLGlmUN/iRovRFR35xj1W7RwpC3g78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676837; c=relaxed/simple;
	bh=y9JHwmsgJykn5Vuz5DPHZlgGFgCSKQIm9DCJUV+dnAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzSbFm0pLkXfxatOxs2SRvmdZ0ZRnyhEwEOb8O4999GcBWCnQswiXFdm7bDo2NuFXDRy22TDYSJPPxaFETBX83Tfd5LoYznhOJJqlQ6a5UwcbogkUjGz5dtPmHAa4ZBLy6L61Or5wMp9Gg+8Mx5rnIdnd9xJCLUKnQtuoDaNDSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c/sSn5/e; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/sSn5/e"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-728e81257bfso1413674b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 22:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734676834; x=1735281634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAR6EL4b1dcR37cH4D1lnXYbRYlW9ts5uPuKUPE4Krk=;
        b=c/sSn5/ecqqiQAgWvjLfwuDZd1R5AVnM498/3A8HYJKLgjo02JJSTAjI0T3v9IHNHO
         VrxgNhwinAfoTZoOmwluJaL4YC3tyif61gljPqqU2eZVC4G8KR2MPRlYSPZVtdJKv6mZ
         T7n6Ofl59ONEijcvD5ATw6bbHitylNLpHWoMd0v4Hjaehys04OIcVUGtzDQPDO+ju7tF
         3f1KiGtYG3LZG4tyqBK3ERRRBS4MDhl64bNgjNRcE8SfIcnkF0LHkLrEPdWjidCMKxCF
         wZOQKqS2oba7UeUg8adUO8qmKZVFcPko0oWm1EA+axgYr1lYX2rDNA52q+hewu7y9y8U
         T4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734676834; x=1735281634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAR6EL4b1dcR37cH4D1lnXYbRYlW9ts5uPuKUPE4Krk=;
        b=hB9MPDiUXC39e1oEFCZOah8HYUR25ttNpOhABH0TSCSmGfyGaT6wEooMTi0/Jupwro
         hR5FPmdmHkCfswM5eNHewiqepOGhkjjP1ap0uiZhJk19niZ2kVYLwIfXn2xVW4Z+AHej
         ObJvAj2XkAxyY8k2F3TnUhNGVZIzJh5YEyrN/KOqOgHmPt9Ueq3UjjfUiujVseaJn7aX
         PoQ5YNYW52/2VkUkbCL7SeRwRMWebMpS3YQWCoNp9HYr74ZkkdfNqrIPujGlTR36xqae
         z7p9t2ZctBPt4vHThD6vfQ2SC2NGPS/lGWnTFVMBTDyhs9q1Ldrofq4/f44dUIMP1+rJ
         NvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTo+E/65ktOPpyHeJAlXTwQdpFv+hI0bTYRz4oXKl1JRHGVc6ujI3b3fNSu7Im48uS0h7l8Sw7BfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRvRW6iqjl2O59UytXag6Op+yCg1kKgU8trzMoClzY4TIYBKqD
	YQDS7vQ1fUyMrZ3D5702MXCSBw5LA5IGm9/n4b8tohpbg8qFcR7Wb4eXXg9gpaU=
X-Gm-Gg: ASbGnctQcJ2lg0bLn1kHhy9VLJC28+J9AJgd7SZab+korXRIXIuqiz0pyYiqRrHdt6l
	xfYmPObgj04w3j5OF/0Itfdgf9PmgQnemilDt1whoH7oyV2VutL195Uox2o6ihGzZq5ep2n/0yd
	tDGILe/67NtGNeyEGszNOxp3vnrt9fv9eLBtGaGr7wey9Pbe8GxpA8ADWsLeUEEKPcxxBC604sy
	6rQVDzW7hEg721q666pv6AhEyNkmpoFnfAZY9wWOs1y6FGovkG7NCKGLUk=
X-Google-Smtp-Source: AGHT+IG+SV0wvhd/C/3SUzB6URLeBHUlw0VzafbKosxxw6sZbA2+f4EkHrtw3uo6TK73xskXOue4og==
X-Received: by 2002:a05:6a21:7108:b0:1d9:fbc:457c with SMTP id adf61e73a8af0-1e5e08028ebmr3084396637.36.1734676834228;
        Thu, 19 Dec 2024 22:40:34 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7325csm2198123a12.7.2024.12.19.22.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:40:33 -0800 (PST)
Date: Fri, 20 Dec 2024 12:10:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: manivannan.sadhasivam@linaro.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] cpufreq: qcom: Clock provider fixes
Message-ID: <20241220064031.qgbfndt5ijlksnf6@vireshk-i7>
References: <20241205-qcom-cpufreq-clk-fix-v1-0-de46c82e0fe5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-qcom-cpufreq-clk-fix-v1-0-de46c82e0fe5@linaro.org>

On 05-12-24, 22:20, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series has a couple of fixes for the Qcom CPUFreq clock provider.
> Patch 1 fixes an issue where incorrect rate might be reported if LMh IRQ is not
> available for a platform (issue identified based on code inspection). Patch 2
> fixes a regression reported for v6.13-rc1 [1]. The regression was triggered by
> commit 25f1c96a0e84 ("clk: Fix invalid execution of clk_set_rate"), which fixed
> the behavior of the clk_set_rate() API. Even though the commit got reverted now,
> patch 2 fixes the issue in the clock provider code.
> 
> This series is tested on Qcom RB5 development board.
> 
> [1] https://lore.kernel.org/all/20241202100621.29209-1-johan+linaro@kernel.org
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> Manivannan Sadhasivam (2):
>       cpufreq: qcom: Fix qcom_cpufreq_hw_recalc_rate() to query LUT if LMh IRQ is not available
>       cpufreq: qcom: Implement clk_ops::determine_rate() for qcom_cpufreq* clocks
> 
>  drivers/cpufreq/qcom-cpufreq-hw.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)

Applied. Thanks.

-- 
viresh
