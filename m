Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6E264635
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741857930; cv=none; b=l4ltjI0zKbYOSONLEAbOnjGw1zB/a58ZVNzHuRhM7yWCD4kjSN2Dzq3NxX329dWDCdTBr3HD/5RLjKJ/v0iM3L5v75V/Ikk1XlYoRUUQxIbrzk2qXPqEjoJ+7A/85W0do+5TjsvnDu7NXZhK5Bh7R+EvdIO006EGkO/NQsxYyc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741857930; c=relaxed/simple;
	bh=rcivCuuKb5DJC2dWp1UTKWOv6WJHpyf26Dq5c+yW+e8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fG2Xx8Q0xeGxJBzkmOd9sMWzlCBIC0M3gcrsk8ssK0FP7//gUJJyc0MjgfZl25tk4Hvo3z0hbNiLBHpzCOqfgxrKtG14IlCxIZOt/wrqAQcu1DfY+WXRme19noVsXo8cbT/kcta7xxPVTiDeX4mv3OTBNOIKYlbIdC9/SbC4UYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oJ4gVJSi; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oJ4gVJSi"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac29fd22163so124732766b.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741857926; x=1742462726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6BKWe13AnVlYTglbR/JxIsdaPBVgChyq3A6mVc/FBI=;
        b=oJ4gVJSimuN2kZWyzbfd1f9+Tchq0Wg7v+XxRjq5VUjBV+rMXWosJ1nsxKo8RrzZW6
         C1lr633Tp5DZHBvO56+67xXSOdm+w9BXrQ9cGPlYqWnW6+2Q4Qn/Mff94YwNjyQH8dS1
         M+LGQUDn9YZIvpq8JDUFlb5FWxd9JSXYgvR0lNeD3pgY+Hkm5yOYtyr/ZGREQYmp2T3C
         YQA0w1DoqU0/1GLnjnAlHOwUvayCBXX/lSMdq2IBCSdFt+Fk4plpv8xeS6msIoSsE/MW
         vRZuPfco8eZBw96Qw1aPHHpUqMNdyd94yfK3BPXhdB/9fGDZgCu5VcZygtfgwXnKHRB3
         ZBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857926; x=1742462726;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6BKWe13AnVlYTglbR/JxIsdaPBVgChyq3A6mVc/FBI=;
        b=HX2BV0qULGfklgztr596LHO1IkvahdyqOZoL55o5WVT8phAF+4jTrnNANPzqAnTcjG
         6XaOWiW+/eTjEvpIbzzEvs6wR0M5hYJ+c7+pBn8JUAVg/KSK8yVkADC3aeJye+7r0ZQ/
         HRbr2+ZhyzkpbF8cmFLZ3JjjZ+TckJ5M44BA9Hhf0D0SZfgccT/iRVts/HlkP9/QIZNO
         EWAzQvT/6ci5HRokhzuI3DZlOoRaU5WSWs74+coyD2XdD8tJZIJnOvYjIaY1tDG/ZysE
         ISgh2/j4EdkUxHiN+Mn3FaKbRfjoYR0xfy/tJQ0hqWsebjmj/qRXxVrFteLzkKkBoKKw
         wOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc+9g7UYEdDjgK5bVHeYJGM07PtS435unpzuIOlp2rL1dP29aZFJ6krH/e6b0oZzcOcUuYQcpFq8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWem8OfejOl0XIqhmSq6xEV59riO+KvCq2iFs6rVdE+VWr8nyo
	6V1x4yZaf7Yya117pzh097ITmVPO6rzm3gQvpEYf9pcooaBIrhm9V5kmyNHL0Q4=
X-Gm-Gg: ASbGncvh/Wdh2KClRsWvd3ACmBYUfdJ/hz+ofCIfZu0YBqhKzZl7V7E6+tpREa42xSq
	79DGtttHLOZAKbovuPBe0x8tSxDNUXSFGCTQfwdbIrASPlCiXh7w8gNVptCg0cj9Wn7OwPAsKQ1
	TJmPNAFW5QEyx82BL4Z+E716jU6FeZrRQoWPBvcN0m4+WSjfhJSyHi6YRQ+LPAfaW2SNGzymkTz
	wuVQ0xFOqdHALN0sWbhoRn9RLzWw/UhYNRPQ1FmA0JClxx6E251ozVcvTcWVIXlArdPNHMr3sQl
	6PBA9xzSusrKy/PJB4KJamr77CU/uRM0/hJ1HzvDivBfKr/etdRY0d9XmzSY2N/VRtyze06m5Md
	CPFDHeodE2ynDXW9pV9TF3Fc9D2OUz9+JrEQ4UG90eo1osOQiEGDgf6d4kVegQHK9U0alBav9+z
	MjbZTlLMl/DtR64wjgkS9U9R9g5esFWUc=
X-Google-Smtp-Source: AGHT+IH5zmAOIRX14h+u56weR60bWxrn363VpmkSSc4ZYAXcq/6Kyfk3T7hCGoj152xsnptr/NS2Ng==
X-Received: by 2002:a17:906:9587:b0:ac2:7ec8:c31d with SMTP id a640c23a62f3a-ac27ec8cc78mr1760185266b.17.1741857926012;
        Thu, 13 Mar 2025 02:25:26 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a4856csm57215666b.156.2025.03.13.02.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 02:25:25 -0700 (PDT)
Message-ID: <b1be6e61-c620-4df0-810f-036c3c28561d@linaro.org>
Date: Thu, 13 Mar 2025 09:25:24 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <59b2553f-adbe-4a92-b7a1-8b388c03ef6b@quicinc.com>
 <93458252-956b-4630-957b-784cac4ca7ad@linaro.org>
Content-Language: en-US
In-Reply-To: <93458252-956b-4630-957b-784cac4ca7ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/03/2025 09:10, Bryan O'Donoghue wrote:
> On 13/03/2025 04:39, Taniya Das wrote:
>> power-domains = <&rpmhpd SM8550_MMCX>,
>>         <&rpmhpd SM8550_MXC>;
>>
>> Once the above change is incorporated, please add
>>
>> Reviewed-by: Taniya Das<quic_tdas@quicinc.com>
> 
> Why does the ordering matter ?
> 
> It shouldn't, right ?

Being clear.

I just want to check that you aren't implying a dependency between the 
two domains, its just alphanumeric sorting you mean here, right ?

---
bod
