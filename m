Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47E7D3F8
	for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710259946; cv=none; b=QPJZnkX2W9SdOoa+W2c4dPMKEBH7/akena7W31+VPvXOKr0mVVmTRliZ9Cw1SCmyMLrdERZySX6BzCqFrJEHbAYaabboj/279IGeIBp51x5bGH7C0HORuu/b5IHUKP5uO/rIgfbYKp6dQF8G1rDs2w2zYbX8qPeaNGtwxeseef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710259946; c=relaxed/simple;
	bh=rXaL0LJcdegT3oLCAhYYQ90a8sQqF6H95AJnSTlrKSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bY3h2Wv76w/kYtzCj9NvLEGjznckxiGBs3AWa2y990Coz2/3NdEjxF6f8ckER5OG3iq9pO2WPbIuixNxKOTlAnkFPADzmdPDjF27MbKBriAkFaSc7wQq963nCC8nYUeVt9RE6z/YhVsI7EjTfROMbb7O0qlWCSNupMBUNNcjMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkaKbl3O; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkaKbl3O"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5131bec457eso118477e87.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 09:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710259942; x=1710864742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLG0VkRk9T+MqlwYSwMr85lswH7UeBe9EKEDGZIjNWM=;
        b=VkaKbl3OsvXrFmg4E80Ozyosy3q8c7v0SYE5ZgaVP8kkVtVxnhBaXrSltAxKs7fieN
         4iFYDNM/aKYLsliKygdYE5llmP5alF0YBHRVzAsn5ZbgF8yXkW33szIXxRN9aUt2I85W
         FQty0IIldS6e+jyPuZ60jzeplo6g55x+Du6oD4BLrUSLC9+gha++YwMRPdChAdB88dLd
         tq8F47vH1P+TDYQ7pkVKdLd633GU9BlVjfbuoUfZGpMJlqJFwW36Ty7s/nbqsankpES6
         9XNqGezrepJHGBPwfAhbY1+eks1ZQ8vWvKT9pZUyGDIgENzEQ8p9TXV0Lo6q5edCDu4a
         k51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710259942; x=1710864742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLG0VkRk9T+MqlwYSwMr85lswH7UeBe9EKEDGZIjNWM=;
        b=EybYK86JkIMl3NjbVXoT5zQELzpzcuJkWpYnlovIWU9ajLjnbjfUery23MUQKrK3Xf
         /8xjv4VlfZBlKReM94ikAXJ/jGsNCM+JBUYIICcLURrISNd2yQ+0WoTq6dLM7DtvB4WZ
         r3+okVxjZtYkhgfd5v3q9wJdTpF2Nt93voG27qZYlzcPN6KwM5+6Nl2PuvSutLqwXFDs
         mx6YqmFMg4MFTASEk91ZaHv9JNbPi5EkU4RVzCDpWsRIk4w2qRfwR+4+KPe46COruCYb
         6HJF43pG6fyuVAulfogT5EFmNI4YV/ZqrNx6wH80Z7ydnJJeLFfWcNY2zDhLVvMOxQAn
         P/bw==
X-Forwarded-Encrypted: i=1; AJvYcCWEJKI1+2A/TLFaf28oUnNsh6VTJAKgt7wviiY0+9XZsRO697ilaIivTyNjcpcAmxYK4aBlHPOSBckwu/eZBZluMszjXuwt2kyT
X-Gm-Message-State: AOJu0YzKX9wZOtNX5voq3e9LXUEfEJGmxnYAHzIsiAKPRs/so4K8d/4Y
	GWCl5KVX8Q3pDKOr4kA63iYBmx/DZWeRFjgSpoSU91wIJFP2tDRt6JimSycWiqk=
X-Google-Smtp-Source: AGHT+IHFOEHl33gs0on8qTVXiyJ+aHRxksDiQ505Q8fof/YGiXciDjx8sbsbVrPzSuDgBdzksPF1+g==
X-Received: by 2002:ac2:4d0f:0:b0:513:488a:95af with SMTP id r15-20020ac24d0f000000b00513488a95afmr1774lfi.15.1710259942295;
        Tue, 12 Mar 2024 09:12:22 -0700 (PDT)
Received: from [87.246.221.205] (netpanel-87-246-221-205.pol.akademiki.lublin.pl. [87.246.221.205])
        by smtp.gmail.com with ESMTPSA id o5-20020ac24945000000b0051321db6a0dsm1634984lfi.139.2024.03.12.09.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 09:12:21 -0700 (PDT)
Message-ID: <83734790-85c5-446f-b353-f3765cb10d41@linaro.org>
Date: Tue, 12 Mar 2024 17:12:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
Content-Language: en-US
To: Trilok Soni <quic_tsoni@quicinc.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
 <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
 <605d9e50-d61b-b0ce-1664-00554ba70b41@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <605d9e50-d61b-b0ce-1664-00554ba70b41@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/23/24 23:48, Trilok Soni wrote:
> On 2/23/2024 1:21 PM, Konrad Dybcio wrote:
>> +	/* Wait 50us for PLL_LOCK_DET bit to go high */
>> +	usleep_range(50, 55);
>> +
>> +	/* Enable PLL output */
>> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
>> +}
>> +EXPORT_SYMBOL(clk_huayra_2290_pll_configure);
> 
> Please use EXPORT_SYMBOL_GPL.

Sure, I glanced over this!

I've also noticed that it's a very common oversight.. would you be
interested in extending scripts/checkpatch.pl to suggest the _GPL
variant?

Konrad
