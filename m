Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB111CBA
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695058; cv=none; b=Ea5Xxeubz7dt8GcB1xF3P1Q51l+WSEh2otJH2i0BSZ8kVkhRrhNu64k5JPujOs1w+FocVRMQmxabUPyJ9lmrDyYw1ulJ+DgH5rNYPdQ4CbMeSoXFBB1FhEdeiy7KoWGixXxwn/kKR9eKpgblaTsdeIf5/W3bStm/pfL2f768D5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695058; c=relaxed/simple;
	bh=zSPwxXlU8zKoR89yCExd+rmcWFjM6s7206Ph0rFGYxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiL/0oCqWyGsmTTiMcIj0xmPLKjwCR9Kku+C8/EcjNyln9ugK8M+/m79xyC/4RX86LBUPNfwBrb0bPZ9lCnW7pTCQAkfu78Wx33lNW+9D8o2nQ2fYa36c/5lYFzUykK8o6BQoOS/cc+g5tMLRqhr+sTjRqJ8Z3n/Grc6ex/WkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P81ZsbtE; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P81ZsbtE"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac289147833so436223966b.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741695055; x=1742299855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpSRq2NhGx61IXcChX3O1OuFIQ+cWb4jvdaEjASRrWg=;
        b=P81ZsbtEk7no/75QuS3gtdwkbY1wNkAiNf6mXZCHVfVN3cefBJJBpKFSWT6HodgyX3
         Z0Vl9FyLYjTuml//dDN5jEGGGYlv2rik+eS2EMj+2OzKBBSa9sp/sD40JW9cNisWGNkf
         j+zNmKd/uRoHCgWfsSG+rJEEiceXRwcdxsaqJ/pJZ2MhDeFcFGOyGswaS5nr0Mwp6PVx
         vVbn2bMH18rGqcfG5zcUGbQnfOkFLKHyKG/j2hKX6lEj6eCkPiGtM4BystLmL5pZczH/
         15kUUPbh7D9OWnOeR0a+CnA3QrMLf+oqBI8LN/ySKmBqDhosn7GOgdKQkCA9nYNBtV8s
         td/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695055; x=1742299855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpSRq2NhGx61IXcChX3O1OuFIQ+cWb4jvdaEjASRrWg=;
        b=iqB0rtBRyw/ehtWwYnMGE47xamLx9gRKzprmpiW3SSUxVknzChzwtEmw15TLcxaVMq
         xtRSNXJJCm69FJywX7DDJTuQKU3wBnlIfdExH25/aoEmeMsqQcx7wckPo/nTsq1FCcqZ
         oozxIxCOvbybqoWUVgE1e+RoH/gCUJTwNhoM6EN2KGMj6QsjHbb0LNQvcALZMaQDdVd4
         uq8HiDArvB1o+rsTPGFR/t61JcRVCkwCTQiB3bmdUc+/R2GKH9ObOTRrNSDcPfSmiwLD
         odM92r2M7bSjhjIM8mkWfkTh++/5oppOtVd+Jb7q0nEU6XgD6rphn+u+3wWABNlRvrpw
         C/cg==
X-Forwarded-Encrypted: i=1; AJvYcCXwcpwSzl3cr6ZpFawbnqSENONxWkqCTDDkd88C+9g/cYL0Nh4mw0dLfsaOEYNuYYX3UPhbyTPGKfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQruGRwiGRZYhtd0x+vrgycApsDfpNz/7c8yrKsT/cwTTljGGh
	Cofz9RIa/DWWEdUT7B/8ACqmIvH/oYp8mwd9NwaLp1o9bwUYLVqUiIzj/b8YFfU=
X-Gm-Gg: ASbGnctqjKW6VJ0IGdenddsTXzDib6wLmrkqYCymcZvlmXbMwyaoYjLMhLWnL7QyRp/
	R2gMX51bdeFk+MfZPU63Th2hFBJ0vHX4jXVmMZ79IUh7rBiQeM/vu4WmPw4KHtm/y96SxeMjPMb
	ssiI5ChpH6MagZQB6L0BRysMXDTh7lz0hxhjf/BjWKmVV/gPYBKzQBL/5FYQbofaLoHzgyvpPot
	l1itLC85BCvav/5bQ2KFp0EoyOLH2wriq/Ky4WuQ8zDaF72BhMyld1lvGst2i+9N2+IaaiJfWG5
	sq7ZmyASpjc/mI4fPEC8K/Ya5bWk2cq4NPBo0wz35XpK3oFpU2SicS27pkuzhs+wfCa0Sa2rNZO
	LoAhmojWBKYquIg2skZcq
X-Google-Smtp-Source: AGHT+IH6Ya7/iCUCKClbjsY4uNuhgYuKstLNpNY8OIGUfaJ0U+i2tVi/bJHr3Ky/JoXqb2hyREP3nA==
X-Received: by 2002:a17:907:3f2a:b0:ac1:d91e:5596 with SMTP id a640c23a62f3a-ac25265915cmr1973198766b.23.1741695053409;
        Tue, 11 Mar 2025 05:10:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a843884sm823958566b.102.2025.03.11.05.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 05:10:52 -0700 (PDT)
Message-ID: <9e6fdcfe-3c6d-44c7-95a3-7652c0650bf4@linaro.org>
Date: Tue, 11 Mar 2025 12:10:51 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
 <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/03/2025 10:12, Vladimir Zapolskiy wrote:
> On 3/11/25 11:52, Bryan O'Donoghue wrote:
>> On 06/03/2025 08:55, Jagadeesh Kona wrote:
>>> In some of the recent chipsets, PLLs require more than one power domain
>>> to be kept ON to configure the PLL. But the current code doesn't enable
>>> all the required power domains while configuring the PLLs, this leads
>>> to functional issues due to suboptimal settings of PLLs.
>>>
>>> To address this, add support for handling runtime power management,
>>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>>> The clock controller can specify PLLs, critical clocks, and runtime PM
>>> requirements in the descriptor data. The code in qcom_cc_really_probe()
>>> ensures all necessary power domains are enabled before configuring PLLs
>>> or critical clocks.
>>>
>>> This series updates SM8450 & SM8550 videocc drivers to handle rpm,
>>> configure PLLs and enable critical clocks from within 
>>> qcom_cc_really_probe()
>>> using above support, so video PLLs are configured properly.
>>>
>>> This series fixes the below warning reported in SM8550 venus testing due
>>> to video_cc_pll0 not properly getting configured during videocc probe
>>>
>>> [   46.535132] Lucid PLL latch failed. Output may be unstable!
>>>
>>> The patch adding support to configure the PLLs from common code is
>>> picked from below series and updated it.
>>> https://lore.kernel.org/all/20250113-support-pll-reconfigure- 
>>> v1-0-1fae6bc1062d@quicinc.com/
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> ---
>>> Changes in v2:
>>>    - Added support to handle rpm, PLL configuration and enable critical
>>>      clocks from qcom_cc_really_probe() in common code as per v1 
>>> commments
>>>      from Bryan, Konrad and Dmitry
>>>    - Added patches to configure PLLs from common code
>>>    - Updated the SM8450, SM8550 videocc patches to use the newly
>>>      added support to handle rpm, configure PLLs from common code
>>>    - Split the DT change for each target separately as per
>>>      Dmitry comments
>>>    - Added R-By and A-By tags received on v1
>>> - Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi- 
>>> pd-voting-v1-0-cfe6289ea29b@quicinc.com
>>>
>>> ---
>>> Jagadeesh Kona (7):
>>>         dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>>>         clk: qcom: common: Manage rpm, configure PLLs & AON clks in 
>>> really probe
>>>         clk: qcom: videocc-sm8450: Move PLL & clk configuration to 
>>> really probe
>>>         clk: qcom: videocc-sm8550: Move PLL & clk configuration to 
>>> really probe
>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8650
>>>
>> This list looks sparse.
>>
>> - camcc is missing
>> - x1e is missing
>> - sm8650 and sm8750 and both also missing
>>
> 
> Since there are concerns about DT bindings ABI change of CAMCC given by
> Krzysztof, likely CAMCC changes shall not be inserted into this series.
> 
> -- 
> Best wishes,
> Vladimir

drivers/clk/qcom/camcc-sm8650.c
drivers/clk/qcom/camcc-x1e80100.c

In fact we appear to be amending the dts but not the driver for the 8650 
here.

@Jagadeesh please follow up.

---
bod
