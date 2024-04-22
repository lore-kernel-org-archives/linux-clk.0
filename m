Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6791514CC
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713796170; cv=none; b=V5+wIGHsEPMwfGrd26l8JmWUYLcQtR31h3gdEVnOUdLYfnjKuerwFDaJBUG19mKI/1sGfPRnolJnNkh5wB/A3t4MFNQB8C7Jly8vMoIDc+yMQjenHn/EGHetDEiz3lImhIHNCUVw3ioEpOvDr36hjg8od1C0nvFhkOpAoFXFTRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713796170; c=relaxed/simple;
	bh=2nUa3Ja53feSTxJmwBVeEpCaY43Yvj2yiQKQ8D1rksw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRKRKyZGp1w1+ec9A2VJPd5bJtC5EGs7nVI7N+X/2dbMfAj1o51k1ajO4orquQqQB4wF+aXdkf+H8pYjkvCberFS5GOs9JM0sjKgtTjtvg9wGbK/nxGbrbj8qvtFmQP8Py5XbMQVPBpMJIjQpuX4FuAgl42BIjz5EZ1U4qQD41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=li+Aj8Fo; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="li+Aj8Fo"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51acc258075so3406667e87.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 07:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713796167; x=1714400967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXHHnDak7lgem7M5GBJJasjq0fymlxs7eNC3HgwuabY=;
        b=li+Aj8FoCrxBqonIPixTgHs8dlwXYBzAo0TF4c7Pwamq+PzyWXhc1PmVj2b2Hfrh1H
         QVn39p4sEr2EyfBmXEP1ozPItdD4AbL/XcVs3qzzwAq0zN0ywaLyLxPLQEQmw7l9cYUY
         rde9WIQE9MHn8tKNQqQv5H6RYbh5EWJsU1Kpdszyjf5au7ilyQ8ceg7NKhBbZ5qBYcf1
         TJQEczoYmKSC1i48QwbJPS08To0/+t4ZMj8NhzAH+oPjNueZeZG7370GQD3PAKB7MsEK
         gO2NP5xhO5vVz1sdA/m22/OA0T/CFgBhDH98BviltABa9Zz+M9i9cSqeiyh3hXCpz2mh
         Yp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713796167; x=1714400967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXHHnDak7lgem7M5GBJJasjq0fymlxs7eNC3HgwuabY=;
        b=aRFhA2svp8G+kT7jHRkzBxHEj4EHAaegzK+P9qaHUqrJJOLLjYyulki7CHPROsnIpx
         HXyzQ2mo4XNnz58pM6+ycPULbBG1DJeutLE4vw1UYAoCwFUevKv7eHSuDSY2OCEma/PH
         vuUHOz6Rt3uZyPcCDxJ7Cv32ZTYGgXTRXgDbWr20072rjif73G/R5w87oXwwq9sjwseo
         qSzuImvfWnbDZ+JJ64U2aOqyvpdEdmGsOnyN6MfG0LPeZ4uM0PTBXFhjJnne65pE9da2
         7czhzOlO+72DDkpA+7oByGXoVrQBNS0RtfmS72meR0att73UHlq3MixY0KM3585KnMw5
         v8vg==
X-Forwarded-Encrypted: i=1; AJvYcCVo2zg1u1R/QMyPIAHb+nBR+bd1fvrKo20yukPr92n09P2HotNxWpb6asMShRloKkvLrPdgPM0fg26cmYX+rCDsVWN/qiWeJgxr
X-Gm-Message-State: AOJu0YydidR8chhjC5qNFmhBmVvkGtz7qkhX0iM8AYU2mbz48SY+CsA4
	bmzUg/elQoQd75pTAuisjchSJsKUJsRy3A1RHJxqyOj8t8+KfYLa6cZsTN/YdIqkqQpuNeljBb+
	W
X-Google-Smtp-Source: AGHT+IFURma49nlaoif2Ttdrovjgb+IMnG5pgohKMHIuVNPmGWqDe7YcAEozJ3QOwed9btGw+bfpRw==
X-Received: by 2002:a05:6512:3e0d:b0:51a:c8bb:fcf7 with SMTP id i13-20020a0565123e0d00b0051ac8bbfcf7mr6809395lfv.3.1713796166491;
        Mon, 22 Apr 2024 07:29:26 -0700 (PDT)
Received: from [172.30.205.46] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a22-20020a195f56000000b00518e16f8297sm1780897lfj.55.2024.04.22.07.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 07:29:25 -0700 (PDT)
Message-ID: <130c31dc-5224-4442-bae3-88ed0ec23fe2@linaro.org>
Date: Mon, 22 Apr 2024 16:29:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: ipq9574: add PCIe2 nodes
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mr.nuke.me@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240415182052.374494-1-mr.nuke.me@gmail.com>
 <20240415182052.374494-8-mr.nuke.me@gmail.com>
 <20240417073412.GD3894@thinkpad>
 <e8957b07-692f-7d38-e276-b0e3791d31f4@gmail.com>
 <20240422071054.GA9522@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240422071054.GA9522@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



[...]


>>>> +
>>>> +			#interrupt-cells = <1>;
>>>> +			interrupt-map-mask = <0 0 0 0x7>;
>>>> +			interrupt-map = <0 0 0 1 &intc 0 0 164
>>>> +					 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
>>>> +					<0 0 0 2 &intc 0 0 165
>>>> +					 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
>>>> +					<0 0 0 3 &intc 0 0 186
>>>> +					 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
>>>> +					<0 0 0 4 &intc 0 0 187
>>>> +					 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>>>
>>> Use a single line for each INTX entry even if it exceeds 80 column width.
>>
>> Yes. Will do.

And drop the /* int_x */ comments

Konrad
