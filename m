Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF81D37DAAA
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492884; cv=none; b=eZkpXMrc2GC3mjUwPQFfz3HU6nQow1mO2U/eaR9Xp42movd/mKfMSgDloUR85yqGvMXyIR32W+DTJAfiYtztRaAMUiP60tVDVO9kywmd1ZkwJ4SC6rbu9OgbLVi/KIU8hdQ1wOuqkY7BEuy1rHEaBTAeDiFH0AvGl5YYa2jk/TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492884; c=relaxed/simple;
	bh=fKTJ1JAhY3w0fwcvqwtPlg3OQRNBZIK+CixEEFGGcXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krp62cl8coMLJaQVN3RpWIql95Ks0TbavVZX8pdQ8nPXeWgRQF6eIs5kf6ZDJLAEYD7CWMa/BlnMWIeW5lNBwKTGrmgo3Zf4ReiQYy0irMAAVoYjIDTaDt0Jjk1oLC9vTTk++VM0yB30QYlzoAUcVo/KrBijdKOAxMSv1UvLrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T6z3ulcM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T6z3ulcM"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aea94b7b71so43243e87.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782492881; x=1783097681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Miwfu54VewAT4zmyOF6r2Ug5ds6NVzgQEiIbDd7lUBI=;
        b=T6z3ulcMqFI04QuEnxY1BebugkSHRlEDU5RuLPMRtXEfg5u6GAXm8rJs0ghaxDJ3RQ
         L+RSV9El1+o770lbpKNBYqECsndq85xhPgyMJDjCnU8TLh/m4CMvCu9NG6ubfCD9QKkR
         cIJTGt9OX8XX4QVbQU7zmZDIyCAcfvigsfA5MipOzs5UI6PyZUsKh8L0Vh4TZcsPCEcY
         vDZIiD9oY0S5Odfju7pwwxF5CTpIQbdGyZgnBVVLAub20PsmmyMVS175DMlqJVKGIZjc
         cSqIq/g+RAfBCMnHpf+4EJtQ8RxKZMG7DxLqkwEPo7jEAx3f4FsXr/jsK4TZusHR6EBS
         GQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492881; x=1783097681;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Miwfu54VewAT4zmyOF6r2Ug5ds6NVzgQEiIbDd7lUBI=;
        b=pZYS40LEh72DkeDoK75Te46GDlCpKaud+lvBSpUF+x4fuNIwoemysQdjfG511pjhkB
         MqmZYD1hKh32iWI/oThGmrRkxz+kXmQ3RTfXcSSQ5ZycztTceWfZ4UWRhOtX+VXi0A8c
         i5KIuqPRURoGim1uP/O+vOqKf57A8IDomfS23AHpoK+fv+yNMDI1qyHzTRXvSbWLPTav
         TfM8w9ByXMNZntZaQ2t/4dvZ1aPya634iqH/HZ3ANHkN5ZRFCDChlz58FwbIvFXu0Ei5
         gyJbj9GM87Xb+xOBVr/hpuSH1T8EBEJsD9YdLHDuLowQlHpm1X/K/eYUzqZ/UaBElTji
         O9SQ==
X-Forwarded-Encrypted: i=1; AHgh+RrU+aoR5L+j2ek4UbwWd0gBwVDwRq7OuWpeWKmG37vyfZPWwmPfcfLPvpD8AzxV96jBnRgPB8QDj+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0oLbfSW/IQC+M0k06zmA2gOFER8OMBcbBYBorn5ozwgWW5292
	xZJDItEHDSV76Ms/e6/6HK94mcWjeFwL54+7RcSKTd7ARkkOXrvzKkgCwxxeueQv60s=
X-Gm-Gg: AfdE7cl5Dd3gMpBphLDWjLx6Rf8wO7qmkQYrDwXYtjy8FI+YmnYW2qXlsxMGaXVou2A
	3VVRqkrAj+JQAwR1iNG+SWADpUUn7Wwm7YhW/tTOyWdlEgzZQx2M53wipmZCCsJS2cU1D4hzv5M
	myVyVB5Ztdls36r2ui7q1B76gbn+6ZiwmNMx+UlkGfP/Yo822CtN5qG/VWcBmKVTDtGV5NGdcLW
	+vlFKAJxfsKWZtEoMtqebVIhKM6bE2myFxzoXUm0i/5OIZeFvItRC02cKvziwtdTprfFP5Q9Liv
	TS6LZU/tcjRfYbv0AinDlrnSXCGWtv7Z4tZ8vynyKY4PJboCYHVceOMmZYWz1M8sv5EeJ1R9FP5
	84QZhiRSXsPiIgfuHE7MOEupIsdcgpEgBg3a0pvdkFlzb4KQdk3zcsyUNhOWw3eqFbabch8QVNw
	LVSypodgGfEgeEjMNUviptC+uea4+rXZYTIkgq14CJn610ZmuH8SNj7Q8vJd0RMQD596Y=
X-Received: by 2002:a2e:bd83:0:b0:393:bb14:9b1 with SMTP id 38308e7fff4ca-39acb54fcafmr8570941fa.2.1782492880838;
        Fri, 26 Jun 2026 09:54:40 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad31a81adsm11932621fa.28.2026.06.26.09.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 09:54:40 -0700 (PDT)
Message-ID: <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
Date: Fri, 26 Jun 2026 19:54:39 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 19:32, Konrad Dybcio wrote:
> On 6/26/26 6:26 PM, Brian Masney wrote:
>> With the introduction of sync_state support in the clk and pmdomain
>> subsystems, the following warning happens when the unused clocks are
>> shutdown in camcc-sc8280xp:
> 
> Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
> the sync state from the clock part only resolve this? There may
> be a clock dependency for the TITAN_TOP_GDSC that we're failing to
> describe
> 

Let me remind that there is a series, which solves this problem in a proper
and elegant way, it would be nice to get the review tags though:

[1] https://lore.kernel.org/linux-clk/20260331140142.892579-1-vladimir.zapolskiy@linaro.org/

-- 
Best wishes,
Vladimir
