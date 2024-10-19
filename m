Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3CB1922E4
	for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 00:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729298337; cv=none; b=CoC/TuKrAg2Veel/KX/nxUSyDUcc7sufWoNToES2YVX8+bQ2hgb6uLCQSsqulSWZe+nq+rCKjv5TPiPIcKdM3WcBtMf8lBov5P8bSymkkT1wP9xQH+Jf9gSl3wQ+w4gFb9GiXakMiAUg3vzPsyax4MpEi3NRMduof6bF6Kmly3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729298337; c=relaxed/simple;
	bh=Mewcl59dRlGPPCpRuSRwPywr6ycIDIWaUH/SfdWIQ8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omID6e3kTkr+bblO+UgKsTNORUg0/vVl8Ssnl/CLC+lP+056xBHkNOc9fZ+eh3k37EEQIUKo6bAoXeMRwpMClIaOSKczho5AyatQ23BNVrSzSzTYsxDHMkWn408Icz1Y/iRXUqBNKUBF4wuVPISjB9Svyb/zGbfT962dpiZPG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2Se86gg; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2Se86gg"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so3095849e87.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 17:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729298333; x=1729903133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0M41lobMzDtVDXSER1bmN9AsQKoidShYGX+Z+FE6IRg=;
        b=u2Se86ggxXhSy3+mSEOGZxWNPamUQzT3i6si7Xi+iBE6XsK1OlkAoS8qvkiBybH5fg
         rB/wEn+Q1KalHsEHGQPAJX+LcR38Wqcp8jor1kRV4/8ZhzIa7n5Bdae6mKFeVblPD7zL
         6fs2jb98Rcjnyxmgwz4eMK0I4gPvILYgD9U0eW81HDkVzIB7P9PHAAWX7l6adRATkaOf
         c/cjJ2VCZlU2VYEAKiunx/Taf8g62Kgod9fME1P92PuyTiCmh2Ftk3Y0iKrV/6DKsn9U
         OCM4Q2Qgw/gVkIwwyqQXi0NEmpW9zSLgAMuL7qH39bWwCjHNjvrSjYxPKetTd2TLh7Iy
         VHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729298333; x=1729903133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0M41lobMzDtVDXSER1bmN9AsQKoidShYGX+Z+FE6IRg=;
        b=tzHdNtjUxRslnhU9dpyJ0trTrkr6WqcoVwzJxDz9cz7b5jW8hyshPLFtZdUuZ2hSbL
         jwvwkryGVvZ8eX7rHMuVFYxA99LcfXDRZ5ZS1mPYnJqU34PXtS4Z11kqB9rWUbej1jGX
         o9ybWnxCwmHMqZEhaq7kcZruSd+g/ZpAiOH7f1aqnc2BdHbKRpbH3rznrWbi1ViqSKP2
         6pqJxtpi3NYkEvaERJjTyZrrulsp/8At6aCi/WsUniuMWJxWPmMafR4bHV8WM5N14YQG
         4NJiBq9uMt5G0kdo+ewUuNYzDtP4Kjkkr6e1UE7d9EfiNEU3+6Ky4nuwicejFl5RX6yQ
         347w==
X-Forwarded-Encrypted: i=1; AJvYcCXCbNEM6S+4fzc1t63xKfQqkaoqEvRm/5lPyk6crd6jWv5xNhmsSjvCRb4E4tpChv5tO6Cjf1y+t3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYEKRxBNxGbh+XTYfLVi4vN4GjQHOiSdIA656v5FfZ3OdtHxp9
	VygOGF8M111Nzp8FJ/kG3Wc+m3RkXZ0kzvqHA2FXdcPkrqtFz3BsEd/cyrnTMVc=
X-Google-Smtp-Source: AGHT+IF7fBEeWmNkccNzd31LUcjDvOyf3yMzraYUGO6AugKRPwkcFosfUe4YdEuEFjihSL5BW7Y+2g==
X-Received: by 2002:a05:6512:4009:b0:52c:fd46:bf07 with SMTP id 2adb3069b0e04-53a154ce86amr3097967e87.49.1729298333228;
        Fri, 18 Oct 2024 17:38:53 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b076d0asm1272577a12.16.2024.10.18.17.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 17:38:52 -0700 (PDT)
Message-ID: <d3658f34-c24a-47c4-a8fc-989de009b4fb@linaro.org>
Date: Sat, 19 Oct 2024 01:38:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-4-4cfb96d779ae@quicinc.com>
 <f5exjvacw4gz7s7byxz6aux7jt3kczn5waio3f3dukpdvzmkvi@c65xjssv4aqy>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f5exjvacw4gz7s7byxz6aux7jt3kczn5waio3f3dukpdvzmkvi@c65xjssv4aqy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2024 21:22, Dmitry Baryshkov wrote:
>> +static struct gdsc ife_1_gdsc = {
>> +	.gdscr = 0xa004,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>> +	.pd = {
>> +		.name = "ife_1_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = POLL_CFG_GDSCR,
>> +};
> Shouldn't IFE GDSCs have titan_top as a parent?

Ack, usually, this looks wrong.

---
bod
