Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D623932FE
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662467; cv=none; b=M71jZWs93eatXk0PwSk8Lhxu1g01YRfqas+Paq+XdOS8tRUdUybD43bNt6KfkyN7S1N4zhb8Mj0huiFyucdQUV1p5Wd9g26G9J8+n5f4By81WXcbSe5Deekf3JXFrYyfqGdc1XkV0EbKX7CW88QZdL0nky+LO+a5MaiqcYRvptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662467; c=relaxed/simple;
	bh=ov15GdvYy951odfmmRTBgQ4znCL6jfkGH42MKPY2g/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EK+H0gtjmPWfz5p2+Paa88A43fIRxt/wYl99L3OHb8LWESKNTzbkwTrPOP1tZvpxK5fUU78+odioGRTqvTbtuNVsWpQUPu/cTJQogAcAfL9hXqbYeHuC0gW+i2QQvE0kS6ZMAaxMxOYT8UoAj3nSqIXaFLoIBMMEuilEbqXQBsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJOK22kS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJOK22kS"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6652452d94aso1907527a12.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773662464; x=1774267264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LxnU6r03Dj0WN1v8lkXQvcdKFfXZuVCRVsfNOysEAw=;
        b=wJOK22kSGqsj9dy8LlRokkx6W/AR5Ca7iNbOcQYupIpiOIia0vlz90K+oCBE0Sa+mB
         j8RyqbbTZnStQeOvToTSekOvPMKE+rN4fvwMxMLazV9D/IQ/TF8YXV4Q/AMp+0myKSrP
         v1wbf0pJI9xWPAOwQOMl3GMDAJNJOLZK9LZcHFmvrheTd7tMhZZTIejt0lmfPzQDjNfT
         RkrU3iXICpxI9YwqIQxCzkLVFREADtjIqjiiYHjPttfq87m9zVf2NlK4SpWFuAhDUzwc
         gJi8Waml6UwcU2rPYO+mS4M/2TeL85MJWby5W1jRBRnEl1mWToECPOnPdWVJtf0KdjTW
         mC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662464; x=1774267264;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LxnU6r03Dj0WN1v8lkXQvcdKFfXZuVCRVsfNOysEAw=;
        b=pNMNtGspj8c4gtc+zXGEoUY0bioOOGwAdjHwnCSfheFdsYtVz/d9705umqLj6NCSLt
         WGZll3i52UumlTzjCypzVLHrN10U7mwB+Ny/wchQEJujfiNPYmIoEbnWIYM0mX4z3sss
         XcqrEI3CPeC0NJ2Pa62qZ8yWkFu5zq8SZFheaKPk9AzGwdTf6DWzlxzZz3IkM/dZ6uWZ
         Qg516Z49RQHfIfszeEEnQGyLOgyVS/0d07lI2w3opg5xD0pctl/fzqgpUkSaToGyu/XL
         I9drCj8enuhCyXR+P8EFsDTf+uLq14XWjQK5V1+nIkDybqzxC/T9brHiyPu2abQzfajk
         ufEA==
X-Forwarded-Encrypted: i=1; AJvYcCUJDZKsZnxdNcuffSDxUPyEsP1nhSgIslUh39TVS3l2LhaTfvSjc3NSEDwZ9mudM8AThGR0mGya1Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzixbMcPeeIDlVYX52bU5ScF2IvVTKyFZL4sn17QofV/K+WMOFi
	rU4T/P2wmuYO35+uJH9yboXfOEhq3Vm3+ctKp9WkQ+OyhQ+jiuRbiSCe2cpWx0ElsDQ=
X-Gm-Gg: ATEYQzwIoFtqyVk92HJHMVNE5zIqhIAQFmjpbZ0pCsgolCBwAMFQ2qJUOX+OqhoIn2L
	LLHE/NQ55hi0MrVqoxfKhUBIs/7NzVr5FdrS12z/eeBGlHxltuHumXONjEhc/kGjokca3q0eNrg
	b/XrU+N7g7P7EZ+44mRAwI2UDQGlBn1v4gmQCEpyRz/dW7gDGJiJKgZvMmp1ikYW8fzn3bIbEKA
	PFOV+sO4jO4B7yQsjn4fCnUidHTBTgXjQnJARmwJUw54/fHIf07UJGh1vY0zIQIti20kYxrOIxG
	ITiH0LbAEupI9UN0BLxMlZ7dg+uzJPTJKiPkx0Zx5IopKHSk6cltbIR16Z6RwsChZXpAyTTTRWe
	2XljgvnorQG3xmmeg4i6FsGN3H4iBOpIxzvFr49Xr6Urk31GARoiVhA4akyR3Ku0SDvq1WXbyFJ
	9cyCCxCL8x3m4E+TIH2yEYDWWtWwzOfpcj1acBsaIpV2wjJa4=
X-Received: by 2002:a17:907:84e:b0:b96:e11e:97c4 with SMTP id a640c23a62f3a-b97650e63cfmr727417066b.20.1773662463825;
        Mon, 16 Mar 2026 05:01:03 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978b8625d3sm457168766b.52.2026.03.16.05.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:01:03 -0700 (PDT)
Message-ID: <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
Date: Mon, 16 Mar 2026 12:01:00 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/03/2026 07:29, Krzysztof Kozlowski wrote:
> On Mon, Mar 16, 2026 at 01:02:01AM +0000, Bryan O'Donoghue wrote:
>> Add "simple-mfd" as a second compatible string to allow child nodes
>> within the CAMSS block to probe as individual platform devices.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> index 2d1662ef522b7..b5654ef71bd89 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -14,7 +14,11 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,x1e80100-camss
>> +    oneOf:
>> +      - const: qcom,x1e80100-camss
>> +      - items:
>> +          - const: qcom,x1e80100-camss
>> +          - const: simple-mfd
>>   
>>     reg:
>>       maxItems: 17
>> @@ -191,7 +195,7 @@ examples:
>>           #size-cells = <2>;
>>   
>>           camss: isp@acb7000 {
>> -            compatible = "qcom,x1e80100-camss";
>> +            compatible = "qcom,x1e80100-camss", "simple-mfd";
> 
> You do not have any children here. And if you checked the DTS, you
> would see this does not work.
> 
> Please post complete example and bindings.
> 
> I suspect that after posting complete picture we will see this is not a
> simple-mfd device (child depends on parent).
> 
> Best regards,
> Krzysztof
> 

This is it:

https://lore.kernel.org/r/20260316-x1e-camss-csi2-phy-dtsi-v2-3-859f3fa55790@linaro.org

Just broke up the series so that drivers/bindings could go through 
linux-media and the dtsi stuff through Bjorn.

I actually got the idea from:

commit fe6a952b567f6a771d087d2e969914f31574d6ab
Author: Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri Jan 27 20:40:50 2023 +0100

     dt-bindings: soc: samsung: exynos-pmu: allow phys as child

     The MIPI and DisplayPort phys are actually part of the Power Management
     Unit system controller, thus allow them as its children, instead of
     specifying as separate device nodes with syscon phandle.

Seems like a similar thing to me - its not a discoverable bus so not 
"simple-bus" but we do have a bunch of devices which exist inside of the 
CAMSS block.

I'm not very emotionally invested in sub-nodes - what do you think 
yourself ?

---
bod
