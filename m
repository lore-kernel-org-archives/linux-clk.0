Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8621373C1E
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651032; cv=none; b=WY7nVMbeh8CP+KysOf87qDe+aVvGJq+bwzd9L5Wu7u6u3imsmAn6W4qmlN/pqWPyGOmH9y7WotZdMcKZk5txpiF4gegAqGp1krCCWzEJ+CcALmvErsEVyvIHdyJ7xAZzwklf+g9IsekjMEM3vrV2xyNPCFJZVUFz1cd7tUPwJ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651032; c=relaxed/simple;
	bh=Mz94M9j3CiZjbegbr4S9pqf4HEm+HXNGIzWBfuew2IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=db5ojDx5thnv2k36xR+xL04DLsBq3rhhR3D/r2QL0a63Rzx57xRe1tizPMvGSkRoIn9GnW15+YhuZv3LJPmmJGrZWXKXNEXkJg8PENQaWn8p4Vdk8Tgg9bsKhm2A4hpeqzRwrXkyntChoMo/gRnBSVtRyIVP2HNIDw5lVasfAbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URoLuYmE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URoLuYmE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso2632096f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774651029; x=1775255829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmGmc6Vgd8VKGv3mHVXKZQWf2GOsa5gLJXBEugfIWyU=;
        b=URoLuYmEYJ20BrHmlwS2nQwpHOoYYMXHu7iPdwYNRxd7ypkWMukbTsIAPy8Ug0tdJN
         K8TmRboDyuZDd/9PIjPPx1d+HBKAhsa9foCwT+XJfra8HTV/uHb6bD9wJQXOvH3Nm9NV
         NOc6FC7ZOba5hp0/WqIpFHK0YGp++s86Hlnkus1H7NnDMnGPF6jPykv+f+hCsURLiy1v
         UB3rgtORpTXDk2ZKJh3hduy2iioLiwwFgoAcWQqFSBR0uwBfJBIbXjgBVnUsxzZnq8By
         xrA9o+eRZNOxoatng4dLXEiRSUa5h7t4lJuN+T1l151l+k996nb2hJvM8mb/5uM/KAZc
         /ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774651029; x=1775255829;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmGmc6Vgd8VKGv3mHVXKZQWf2GOsa5gLJXBEugfIWyU=;
        b=UP3MyFaKif/FrcpuHEjdn9JE+WBB1UYfCHMC5exbil8vpjBeGZd77vEkXhO6hnCbDc
         +duvxKZ3BSwJJdt6SD9vGVpXccqijjzIEAB41lzn/lWU06zf8S3WTP/G/oThR7FWEFHo
         HEv2tZXGlrZi3cu2PyURxhPWu3ve4uiZ1NUmmunHwOJ25SI7mzJYpagZDWQ4IBq1VEHu
         c3t0i6szLhi7qYExWdycj9wdB8IQ7CutseKQKWxKI8Z4TA5WFJvDAMbP3jH4Y5w31eDL
         7IoHRzo5GM57w0+CeTL5awdmel60gF2JOwzdlw4UFatDbcDFG8aO5xxl/4SLRuFieQlk
         cX+A==
X-Forwarded-Encrypted: i=1; AJvYcCWU0xDZ02+aespru2aUw/5RFjGrt/s1PUlZOPbSk3UctAxvOa0shAUz6QPGffIcA7WEN9JPInU2A/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsi3kJYqJftbE8hepVnuqQZjK9Yn0OtST8Utr5l9f4EggXdw4v
	x1FBxtP3JhlbGNzM+mE4ZAY5Xgoo9big/Km3lV6VlRSIy7f4nJFQusGnp3SXmykHWvo=
X-Gm-Gg: ATEYQzwFfAtFtCADRRPoz90BYBnixEZDHGvYj/FRTPAY3TA+wH1SxWDkuKYVV9d8UDn
	wwRaB0jhIrolzBNHDeSjzv/eM+XYDpFrMsSR/wRacCWZJAWZUOm0GfaZzRy+g04P2nvfQSy4wmZ
	qaR+yUxNOMDHE9SsOCh+eorrHSN9gCZTv/IYfzUwMdMV/Avzd/ER6zRiVCErr69fcdz200gp3Yh
	Q/1cx4FPc2z33AXW9KUBLrXC0sITRTwUARI/rjv4OedZLfs/8kFa1bTyg8yWMmPXs47c9F4duVJ
	3WDpczxr7bHUlskUabtacvJ9Eha+9ckSg15cTWkzyKdreUDItA+8OEKTplNGq4a6tNlpo7eqD3n
	1rKiM9KjDTkNBKlLaJ8MuOk7reQUFJrbqItCyWG3zrj5znZADK7+oRwjbjgMa8ExUrhg6yECTI7
	1z5q+j2C2S9Ymy8GU05Rr8SQCdjBrhig5GKPZdM7CKz6zD8rg=
X-Received: by 2002:a05:6000:2dc9:b0:43b:490a:db51 with SMTP id ffacd0b85a97d-43b9e9fb32cmr7544314f8f.24.1774651028947;
        Fri, 27 Mar 2026 15:37:08 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm1094260f8f.14.2026.03.27.15.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 15:37:08 -0700 (PDT)
Message-ID: <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
Date: Fri, 27 Mar 2026 22:37:06 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
 <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2026 21:33, Dmitry Baryshkov wrote:
>> Other drivers typically call the populate function at the end of the
>> probe function. In this case, however, it is invoked before the main
>> resources are enabled. I assume this is because the CSIPHY device
>> needs to be available early. Aside from that, it looks good to me.
> This becomes fragile. The CSI PHY might be built as a module, which
> might be loaded later.

Is it any more or less fragile than "simple-mfd" in a DT though ? 
Krzysztof isn't very much in favour of simple-mfd so this method of 
population is the alternative to hand.

The CSIPHY driver uses devm_of_phy_get which handles deferred probe. If 
the PHY module isn't loaded yet when CAMSS tries to get it, CAMSS gets 
-EPROBE_DEFER and retries.

> 
>> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
>>
>>> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
>>>          if (!camss)
>>>                  return -ENOMEM;
>>>
>>> +       devm_of_platform_populate(dev);
>>> +
>>>          camss->res = of_device_get_match_data(dev);
>>>
>>>          atomic_set(&camss->ref_count, 0);
> And this looks suspicious. What if drivers for submodules are already
> there and start probing once populated? Do they have a chance to access
> this ref_count?

Nope, we don't share the camss pointer or any of the data-structures in 
the existing upstream driver with sub-modules.

---
bod
