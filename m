Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051C3B530B
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182226; cv=none; b=fXbjuW8QfXzf/lf4iLAN8wCPGL7vukfkf+Udo7LDPYOpmuqLAmMAdLL629JK2zc/YqeBWU9sRh9coX+Wvy9QSAxBoANCq2LCbc6gizgL0e0jmMQwTbNrdqBmFD7dGgw6BZvtNJNQoh9ERWRdScPG5sQY1jC3TBVAB8nBoJGB8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182226; c=relaxed/simple;
	bh=m75GTlzzItsnmceJyWSlLMXL2IXTZE/pklfGMLQT/9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiGB8TxyWDaH/HL8hVgJZ58sd23sI4FW1tr1HtQPm4CMmG3P7vfIK9iRe3kvlkvPApjVwkgqq7MXZVFYTGLwro3dlqcAiogLHDZdPhqpt65QeBaM3WZWNPAYq3MIopoA73bBIeoiujYMyY+9z1qfpFMDAk7s92psdycOADccjwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rjzexa22; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rjzexa22"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371bb515eso24108435e9.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182219; x=1772787019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fAwVs7Otjkhg3KIx6sVOnt9Pa3bh3y7PAXDFn0IhyQ=;
        b=Rjzexa22BpoYN8hYaFyOJDuDUijiHbQ8Jv8TZy97nK0cAhh3RClJ0hwSfjwxkLmvYG
         7610A8Jv4jukimD7iE6YZoUiFt92Le2UX9pKtCXmMDEC5LwhH4xjtQh1V7aXVwQY1urR
         usA8MWsB4ToGrDfHjV+nBTSGOAjYVjbFvtwL4CrViCWAvNhXJVDbN8hrjlyyDKnjUB4E
         NULkSaRRUEaK4pWPGaHuEcaWQW3HftrdDTxYMw/bJEu9bZaMp92zvuANk7l03MwXAKVc
         3ILJLY4YaieHo7GrOmowjxjFC1tyrwNgo/w+4gXvSasnzRhgDsXDvP8+Or7u9YnAQmm0
         egjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182219; x=1772787019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fAwVs7Otjkhg3KIx6sVOnt9Pa3bh3y7PAXDFn0IhyQ=;
        b=b3c45yUgaBsy+rIkNpiFwKGyUI9LhQRX6yHl1Wehx3OUkL+rFZW+rA3Sv9HtKEurzc
         L9uURyNExV+NTUdDNg74r3GWoVQlS/k7idoutVjSlIfEylMQnZKMUOOPfQNTzG3UzGSL
         X78F7r/ioUwIKpc1r4ueTP1mcAR96zfchoef4icIYxQOtpL36Siw23V5HWh17S0wingK
         T8O1fhPVaSFqEk/fDIkJSEWXT0kJcZGBSWgHvCkEytGebtaEAVBR6TN6AT9TRMfXYrms
         7swLSN9KQliRuXu8r1ISbRTjq7SeGEMoQ9ZngmwHyNgDX06uaSYGZksibUomjMc3hWPW
         7ESw==
X-Forwarded-Encrypted: i=1; AJvYcCVU03rYcu3SAumSiSK4V/5+mtKhGNpcx/8ztV62yjgHsj2lchtPm5FTcit38FfqJYTznQqM6hBMipU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhoWwbZ5zJFz+eCBIE8sYjNCohtxXeVsXi1U9ScTEjSPhVC4Jc
	/Ym1zFhot2l34VeLP8wmcojiSqZWxP6H5nTEUbnCHD2BnXJ6uin2X5USa5JNEovzbRM=
X-Gm-Gg: ATEYQzwB4D3vZD0EOUXvgOSfpWUaE3w3yH1Hiu1Q4tcepm6sI9L/kVZI2QjzDKm09eY
	Pe/GJoss6RD0MCU+HDKbwFI5zx1PjTe6tV8JadAb1VTpnYYRRzG1IN1Zd0FZ5u3JyctEa+LGtSD
	q/xQw2XiTyi73fafeUdv7mdY6Hzgf82p/7q10iu89Xn3KzL9gKBsRz4rIE+qtohOO4vty+xXhQq
	16KEgpYGvHfZ2HbPbSYw1uvU6jchga6C3qarIx0MzgJMjnkgukmMKM5xd/MgCv2mMrj+sj+Pbjb
	rVMGDgmI/jbt7KN37oUNk6+fIObTfN6kLkVCE9Iup7O5fqRcdnx0HctKa8Fk1Ak77jdQQNBNgTv
	HEV2tvMYaZq2uUoC1XXdxj622EZqEp0HHxKO0o08xJBTbqKbzKhhgM/MHyM2HZlSTeavm6Ymauj
	jq6Ddq9QTchK61eMWd3nExDSPLAyK8ULxiN5s0STc7U7BMC2qwyvI4CTFg3DF9/fKA
X-Received: by 2002:a05:600c:8b26:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-483c9bc1e0fmr28491395e9.14.1772182218741;
        Fri, 27 Feb 2026 00:50:18 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm54151445e9.18.2026.02.27.00.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:50:18 -0800 (PST)
Message-ID: <e844eda1-2de1-4bf0-8531-088cbd59b06d@linaro.org>
Date: Fri, 27 Feb 2026 08:50:16 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] dt-bindings: media: qcom,x1e80100-camss: Add
 iommus minItems: 5
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
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-3-a59c3f037d0b@linaro.org>
 <20260227-electric-singing-tanuki-fd290f@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260227-electric-singing-tanuki-fd290f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2026 07:27, Krzysztof Kozlowski wrote:
> On Thu, Feb 26, 2026 at 02:28:44PM +0000, Bryan O'Donoghue wrote:
>> Specify a minimum number of iommus entries. Currently the schema
> 
> Why? Your commit msg must explain that.
> 
>> requires exactly eight. Add minItems to allow fewer entries while
>> retaining the existing maximum.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> index 8dbaab16b11d4..f406cf6f8f9c1 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -104,6 +104,7 @@ properties:
>>         - const: sf_icp_mnoc
>>   
>>     iommus:
>> +    minItems: 5
>>       maxItems: 8
> 
> Same review given to two other such tries from Qualcomm - you need to
> list the items. You know differentiate them, so the items in the list
> have strict order and meaning.

Ah I knew there was something I couldn't quite remember - an 
differentiated list.

Yes np.

---
bod
