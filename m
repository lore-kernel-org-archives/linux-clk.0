Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C51A3174
	for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941455; cv=none; b=RMzjv6KfoAaednlG1CqTmNc7gtAlzz6SlSSRLplLkONwz3jHrwZGTPWB1sEX02BatnqbS4qXUds1BVzQ+cjLByYafaIcq6hG0sulOKx6EHzQCly8gMwQJ6olGdK5IyvDvdBWNYxads448uXBhB+Ll3jVpZPKHPKw41Qo2a6Rxvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941455; c=relaxed/simple;
	bh=dk+ejBCS3NH9te+aXnCnqbhIl0UgK8PkFWM4qXXJ5TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQAaJz2CZEG+F13/dsI0Wef6dTG4WtvtwX4hfbC84n9AeKEYUyXLFZi18SScrK0ourtcx6F+/k7eB14JBEYwBy+YX9HYeMtMDK3TU8s51IKf2OVqmYry7qITYXOPmUm6pXgD7MZ6z8YzsFKqUROc45v3TW+zo0VUi/wdOF8ZLrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UpEVmwjc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UpEVmwjc"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso359702666b.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741941451; x=1742546251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdW92HTTZmGzjR6ChSxqLyGpU5fNUkYFaVmkq1y4xX4=;
        b=UpEVmwjchAI6nFe3+Vz4Cydv+26qouM/cxZsaP3CA171bf+Di/cVfMWDk4e4QbU6Ed
         umOIE/IBkq6glc2lBrDbEqBlwGEblFZqYTBNsEfphtDFIZFMMRH9UsesKeEgdY6fgNQN
         uCfxvoOIoOghh0T8gUtGR5gt98T+ej+y/AHKNxn3SVvFv/l+UjnzuC72BNyZM7PUPdVc
         lvtRzRHu/zplQ0Cpt1fCKAyV9emZOXBcAJ8xxgiDfHyojo8pqeLk0ewMDYT+qWj0AGmO
         1BKyqtIBLlruMzaqr3STVFgcVIVBblGSFJoEUPng8C8VWp6KM2YCqlc/EhlkPDtB0klx
         56og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941451; x=1742546251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdW92HTTZmGzjR6ChSxqLyGpU5fNUkYFaVmkq1y4xX4=;
        b=uqH+mD1C5eZrSa8E79l9jPQzCJKl6TgWXbB2XI374B9ZbzkzwjGOgMSBVhbTLUqcZC
         1Nu49dbayJrVqerugNd61p8rKO+6O8oWzoACrpblz6ssmQCzyaMYVjatyqmq76c5XYdm
         XA+bpXivwRmiJ7AIe0ulMLzcJOjIBfPfGvcR8rz/ZgkZVG66zl7EVr1/2YyX1PdOTaeq
         q3hBWbHWlIILpW7Pol8ETqlMJwLNw9l6nRvQtdPd9fWYXjqjnN3dJMXFVZ+ho4o0k+D3
         zgwRc4tQwWG7xmtSzNbjer9zG8rfvRh8i238ILLSMZSofjvEx78WdoDWDrG8OZMOOYJT
         /e/w==
X-Forwarded-Encrypted: i=1; AJvYcCXLDWvsGkaqCy/LU9+bEdqH4GB9J7LjiR0Z3/J3DqRp5I8hLmiOLd+dpgeEIlUQdDKblqsVyM4sx9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRtQX4LSw2JgsJSdRjbbmzKpFL7NehFQjpBhtCqAYTNzcxIQBb
	0FjSXHb1/25P2PKYMUOSLpHvN/UvY5IcwHXDLB94Y61JUS59LK7Dq4EJqIpsynA=
X-Gm-Gg: ASbGnctedZxUuS1zLIZSONhfeqR7uohnWFN/OZclWxIHWQziD/hdl6h9JntWAl1G0Hi
	v7wPG0aFOOHtngS/xXm39GQOT21NDwNh6KGkuTphlUn6gar1X0FBDwUOd2vjNIUWeK18VkZiQbT
	tAjTKwjTXMatZTDvTii2qPsRlPeQswQxY74dFQpMoaVN891psoUIp8mho2ICeB4nEdqR1AioiF5
	3TdlEAK654P3Cin9Lk1aqVAdv8KxcM/GwFp1CW0jINWnHzotuoaaX4umw+8vXuese0rz9HJHTwM
	nV0uu8XoLzWDBZducnQFK9J9RsiCurZHtRn2+V3uy9ADvzdyIhkbCAChPs7DQ97ZOs6IIyEwbn3
	tnMokgryQWS4U+Xx36V/Q8MxMhuX2F9vflr8Zw4viM1aT7BFYOCXgbKlekCAMOFhjsHkVr9BWK0
	wRNv8gPCMM2ASjWiV0N0BJnqY0xk2uHNc=
X-Google-Smtp-Source: AGHT+IFUOlHrTuzko/qUKZDoHX5T+vqpZFWSBwlhEPozEDwkhttO5RnwU44O1wIX8uDl5bdWFAV2Vg==
X-Received: by 2002:a17:907:6ea9:b0:ac2:64eb:d4e8 with SMTP id a640c23a62f3a-ac32fa44234mr197432866b.0.1741941451312;
        Fri, 14 Mar 2025 01:37:31 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfbb3sm194289566b.101.2025.03.14.01.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 01:37:30 -0700 (PDT)
Message-ID: <9089c8e7-d38e-4c36-9b97-0f4a3039a29b@linaro.org>
Date: Fri, 14 Mar 2025 08:37:28 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
 <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-1-846c9a6493a8@linaro.org>
 <20250314-nimble-exuberant-ermine-8ceb43@krzk-bin>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250314-nimble-exuberant-ermine-8ceb43@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 07:51, Krzysztof Kozlowski wrote:
> On Thu, Mar 13, 2025 at 09:43:13PM +0000, Bryan O'Donoghue wrote:
>> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> The switch to multiple power domains implies that the required-opps
>> property shall be updated accordingly, a record in one property
>> corresponds to a record in another one.
>>
>> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> I do not see improvements:
> 
> https://lore.kernel.org/all/20250305-little-frigatebird-of-calibration-244f79@krzk-bin/
> 
> I expect both comments to be addressed in the file.
> 
> Best regards,
> Krzysztof
> 

Pardon me,

I missed you had left additional comments.

I will fix this up.

---
bod
