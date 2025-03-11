Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB76233D9C
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687950; cv=none; b=W5h67v2P8HjI0xulOLiaiprCUt8Dof3OPNQmQFuDsfzJRmiyGNm+R428baXgfoVNa8OLnWZ5bo3awn4giR65wacHvWO7NAD8qY35OXTMCJnU5aUgGnivm0pXmHKcrb2nedlv9uehZ6VG5+uqBrHYjTg+VrvHV2pwM7GxZC1gb4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687950; c=relaxed/simple;
	bh=+3yq1s96UJR2X/8rxc0GrcD75DfM7d3VNeS5ZzC5agU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XL/KWtIShVeQHTvZqf53W4uQwmL8ws/DmY206XaSLxRKN/2KvYhCQ7r/VDgRUkIwOZnR3HtEG2g8/miaWjWh2puKSMLNYVPOKwXFOBCbrdgAC4cwzkPbqIuX6+TaF8ZjO9PQz5dLxgpRBNxCgM7NXFmBPSLiX3uwt7Xubhx9XJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Be+vbEiM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Be+vbEiM"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499af0cecdso434451e87.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741687945; x=1742292745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0Ue4Q4qIT2SkgukgvQkQoV58AEl4Qx/JQQFOU8HKzc=;
        b=Be+vbEiMYeyOEhWZc2tx9xaa0o21RFpqTNwCkJ4EE2iyCqmv4GqtReV+D1ZlTAStoF
         9k2ZsMhaYQmPDGF2lgY143CTeQZl3IX9QDgfCjKsnITf/2cRBfLx/r+DByyZrIJ2rG1k
         DkpKw+Ckmv3kLxPBWfHlkNAvHUpEVaGmzgIgk2N13OXZ3gjSGeeTnbYoA1evjrVfLTYD
         FgZ1q5WVEIggr03LoEhULaaWa8bOOjeQHun3Zv1ib7faD+ZPH+rwqDFqoNp+QNzI93Ew
         wPW6u3gTAi1D3OOJhg5pk3dm40NfM4Rbd6N1UFRUofeB37el5iyS7v8EfQ8OsxTacK7H
         Q9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741687945; x=1742292745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0Ue4Q4qIT2SkgukgvQkQoV58AEl4Qx/JQQFOU8HKzc=;
        b=kGC72b0getoCtX3cS4G3FG89OKmO82Htuf60/Ct2IErNfMuj4v2u8Y2Ye23bQs7QiG
         7VrzfMf1cQurmAnO2R1w8/I/R4YVlWILYJFsqSsvZ/ljm00rUjKhUY1mHDpzXlrhsLK5
         tv3D/jzU5PrU0oJMSyyiqlk8RbbW8lIr4SZsdO37FYwtwuK5lMyRcxqTlyqcnbTj2yoH
         xAuk/ktV5jdSdw5rXQM4hAaBD0EWHjMYkuYYb1yNd0FQKI410fIBh5yBRnofBtL0DgFD
         cMXNjc6GcuXT0EF23dN97quxvfzKRXVYKB7wrwd+6iqKpIsJ4MbGAbASRkfMam7tQtP3
         RdAw==
X-Forwarded-Encrypted: i=1; AJvYcCUtIUBS+hpsiVG9NIhFw877x8X7LlLu5lxxEnjABBtMhxpxry+xwdZ2h/g+smTCwCdeelGYeZCoRUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGpsuQpJB5kWQLikUbMQBND5wkimneUQ8jlAPAvATUrXV/mrt
	p4Mr41x7FmnMUEslBCOJFakICahSmU4weuSTPp1KQzj9IKRovp1nLB+vNM3Hp/w=
X-Gm-Gg: ASbGncuNub5pysoCCx9K1WmAtJV9damNA/CCZwYS8/+TG8MarPnXjjPzLDycymuR+dY
	AKV/7VcAErEbYvfGwsQu926Bhh14N3QJyBX7d1hRnb9/CNi7628eJHhck7ZPirWlwpfPAE+BDYc
	NJ60UkqvmwkfDmv60f1K4KWBO5NTt4zvp0fduYEnL8Hs/jlueiFq2B/9OppfGU3/4Dl+MmogvIo
	qGT6hihbMZBOBgarg0zVP9E5aSd3WwwReqK18lSr+v+L1ib4OQQmV6E1hyY70GOL8qBmDaaKH0I
	OiSdHfgwPgvaBxUQ8kHi4uXBE5EWumookwc49Fj+ize/PsL7yz/c6Qr6UTDWFMFcC0ziehMZf1C
	itwcaAlzZpDaSsT5OLadMKgU=
X-Google-Smtp-Source: AGHT+IGIs8Uu4dRag/V9E+dTalU6U6PS8Xj1gzq2Dg/DyTe7dnw6wtEZjbZZzgP2hxww523Rqg5BKg==
X-Received: by 2002:a05:6512:3b0c:b0:549:732d:e2d1 with SMTP id 2adb3069b0e04-549abaf1056mr371507e87.11.1741687944758;
        Tue, 11 Mar 2025 03:12:24 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd0b6sm1735773e87.109.2025.03.11.03.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:12:23 -0700 (PDT)
Message-ID: <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
Date: Tue, 11 Mar 2025 12:12:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <CMTYKKilQJYeHUYYKvlqnwv4Q2P-58Ic1v1ndS9HQ8Yhq2xpHuNThibFDjXDEQ1PyNbx__f9BVBr0peoTUdvPg==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/25 11:52, Bryan O'Donoghue wrote:
> On 06/03/2025 08:55, Jagadeesh Kona wrote:
>> In some of the recent chipsets, PLLs require more than one power domain
>> to be kept ON to configure the PLL. But the current code doesn't enable
>> all the required power domains while configuring the PLLs, this leads
>> to functional issues due to suboptimal settings of PLLs.
>>
>> To address this, add support for handling runtime power management,
>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>> The clock controller can specify PLLs, critical clocks, and runtime PM
>> requirements in the descriptor data. The code in qcom_cc_really_probe()
>> ensures all necessary power domains are enabled before configuring PLLs
>> or critical clocks.
>>
>> This series updates SM8450 & SM8550 videocc drivers to handle rpm,
>> configure PLLs and enable critical clocks from within qcom_cc_really_probe()
>> using above support, so video PLLs are configured properly.
>>
>> This series fixes the below warning reported in SM8550 venus testing due
>> to video_cc_pll0 not properly getting configured during videocc probe
>>
>> [   46.535132] Lucid PLL latch failed. Output may be unstable!
>>
>> The patch adding support to configure the PLLs from common code is
>> picked from below series and updated it.
>> https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>> Changes in v2:
>>    - Added support to handle rpm, PLL configuration and enable critical
>>      clocks from qcom_cc_really_probe() in common code as per v1 commments
>>      from Bryan, Konrad and Dmitry
>>    - Added patches to configure PLLs from common code
>>    - Updated the SM8450, SM8550 videocc patches to use the newly
>>      added support to handle rpm, configure PLLs from common code
>>    - Split the DT change for each target separately as per
>>      Dmitry comments
>>    - Added R-By and A-By tags received on v1
>> - Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com
>>
>> ---
>> Jagadeesh Kona (7):
>>         dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>>         clk: qcom: common: Manage rpm, configure PLLs & AON clks in really probe
>>         clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>>         clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8650
>>
> This list looks sparse.
> 
> - camcc is missing
> - x1e is missing
> - sm8650 and sm8750 and both also missing
> 

Since there are concerns about DT bindings ABI change of CAMCC given by
Krzysztof, likely CAMCC changes shall not be inserted into this series.

--
Best wishes,
Vladimir
