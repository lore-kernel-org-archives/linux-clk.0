Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C911607AC
	for <linux-clk@vger.kernel.org>; Wed, 20 Nov 2024 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732122553; cv=none; b=OPrmQA3n4xg3iAv3ep1OHXbj0kKL3zqjNDqFdydzO5QQuWkQefvZwr3joAnTK2MPAdltGxpIAt8UZfOHMY19SXZbLzbJe0/uLGMdlXiEZCkpyCVRns9p9j8fJbAQhw4YicOf7SCYeRXZpCQUpe8NKfJYx/Xgm5+/OILqJOObNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732122553; c=relaxed/simple;
	bh=GxGYBTBzNgOeIfq/QdI2OaIkEKakJlVruSDheSbNFFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZG49AaIMX/K8kuMlBrP1+NkiG0j36nnrWqGLVJCK6L4cwbgoHJ/kgM/3SR4SvEi+rjwtQiQ9JaTwZ1i/lqVWnSrjqTSnhwzKqld3CWu6bzKcfET1V6d4z/kkHQ6mGRNzNA+Y7ki1N7BEOIornuw6gen2gmQ3w/EdxdYMRGKIaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQ890Sme; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQ890Sme"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4316cce103dso61788875e9.3
        for <linux-clk@vger.kernel.org>; Wed, 20 Nov 2024 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732122550; x=1732727350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lBaWVIKUDm8mK0qFWu7ZMD66HrRVg+A8qSokIpCLr0=;
        b=BQ890SmeFYdur6wFjXEHO7s5gpo3VUjwH1KfoUuCzRrDxF6USOgLfi1KvtlMX48NSJ
         m8r+yEcEAUGMWSASciaAe+LZZRLIb7Wj5FZQ9ajG0PYlopMG4nO7cxTXtCrQ6Y6ULaSV
         MjlDNHR+iABTSPetyJVowR7FLYBufsdLYSEldM/p69njeUw+VzsJbuSIek6lgT7I26B7
         AAjxWOnSU4BC2rW8l/MMHjzoNB9Rb8h/YwF5DS9rpkW/NyCccIZMpiNkMOcboppJchGX
         BJyUVVMwfOAxz59qHeK9ZlbFUR6yrOOAT/90sYSk/030U5l0J82BWG/Lkq1Xfzk4eMY5
         Apgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732122550; x=1732727350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lBaWVIKUDm8mK0qFWu7ZMD66HrRVg+A8qSokIpCLr0=;
        b=OLd8vbUfPk6TIYcBWtV8Ux6JrF43gHexUOJyoMtUo7s2+kL6omBIiHlF0R811RN4aP
         Z5hGW1B56j0cJ+NCMTqPfZGteMbB+5u1OeMYjPmryDgClFsVftPpywBwotw8tKXOeEVh
         3oG0zoShHy6hROdWN8cWT7jZ5LeKZrB8gfdEOpqzp0Wa3yYWi+nDOSgrTLLfWn3SWpNh
         FVvtfwBeTRbQfokr2YLCdcL1mgEksmL4TKaqsmosAFRpNiQMZld34YypPmlXIjJBrPW/
         CMmlW9lW00f0nAuF7/iDYJ2SHR/f6TEfMgMsXgeNodjlj38QgKHK94CBz4MtxX8uwcH8
         7E6A==
X-Forwarded-Encrypted: i=1; AJvYcCXKOKwD08aHOqqGawKlF137pNRicenJZdKjm2KlqN0uieTvrEAtX6cwxtFoX+B+VQxXqXa2y7S7t7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8V9Jd6wnAk37TY/bEh7UO2CJrnmcGebTdj/nCFs5iIHeZJmR2
	wQ4AP0Cu/xkLpU8nZoji0XWXb2/yAf7pwUV6Fb0nB3YotlBrbgJS4DArIzQYbwo=
X-Google-Smtp-Source: AGHT+IGiaYIxKh7fbsrmK6tgUUwDYtTaqJ5Wpge3WBivCuMq4wZZiH8eGrvzsvlRCSKNGG+wDtIT/w==
X-Received: by 2002:a05:600c:3b12:b0:431:4b88:d407 with SMTP id 5b1f17b1804b1-433489819c0mr37456805e9.5.1732122550515;
        Wed, 20 Nov 2024 09:09:10 -0800 (PST)
Received: from [192.168.0.200] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b46359b9sm25029685e9.36.2024.11.20.09.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 09:09:09 -0800 (PST)
Message-ID: <7a52ca1f-303e-44ae-b750-6aaa521516c3@linaro.org>
Date: Wed, 20 Nov 2024 17:09:08 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <zhhna2wni4yqhnc2tqfc2ugril3h4kzbyr3ix6vpwrgghwytfa@kjfpff5zdl4z>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <zhhna2wni4yqhnc2tqfc2ugril3h4kzbyr3ix6vpwrgghwytfa@kjfpff5zdl4z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2024 15:34, Bjorn Andersson wrote:
> What I think you want is two things:
> 1) When you're accessing the registers, you want the clock controller's
> power-domain to be on.
> 2) When the client vote for a GDSC, you want to have the PM framework
> also ensure that parent power-domains are kept on.
> For the single case, this is handled by the pm_genpd_add_subdomain()
> call below. This, or something along those lines, seems like the
> appropriate solution.

Yes.

I'm finding with this patch reverted but, keeping the first patch that 
it pretty much works as you'd want with the caveat that gdsc_register -> 
gdsc_en -> gdsc_toggle fails the first time.

After that I see the GDSCs on/off as excpected

cat /sys/kernel/debug/pm_genpd/cam_cc_titan_top_gdsc/current_state
off-0

cat /sys/kernel/debug/pm_genpd/cam_cc_ife_0_gdsc/current_state
off-0

cam -c 1 --capture=10 --file

cat /sys/kernel/debug/pm_genpd/cam_cc_titan_top_gdsc/current_state
off-0

cat /sys/kernel/debug/pm_genpd/cam_cc_ife_0_gdsc/current_state
off-0

Perhaps we just need to fix the probe path @ gdsc_register()

---
bod
