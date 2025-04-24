Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0E3220680
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489273; cv=none; b=qem73wmiLOXQ/dqTiCAq+s6amksRubua5xyE4Zh547uKsZjZqTu5NC9DYkfE9qH9nDmzyuUbbefakHjT8nB8p7M3J2t3bVeP9lDrnYJYsFJsJ5S/qW9aZCdLKK/5xwB6XeQuSWeUQ22pHls/VBCdVyFipSWNFJty+xcUbyMOCtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489273; c=relaxed/simple;
	bh=qceSy5hmLa/hFRUfKhQk/prU9fcYlktOzA420wPj8Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GC4cdY2osEqzCi3KqldD/AE2eA7eEXkFzWSmnnk7d7pPM/JWHUNUEKWF00eTepIiGfLjKorQ2iJkU6xOzKbzpJHYdVYDq5JNhh0kEKvXIyu56cj/FiMgFP4Z+HpOQ/BVAa0aLxk86akVEVRBWd+aNMBJLcp3dmz0LmlkcTY3sCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BcKhbaev; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BcKhbaev"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5b736b3fcso125062a12.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745489270; x=1746094070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zi5+9wwSGNxwIY+5Uc5lT+h4faQt9l/26HLQUV9AlUM=;
        b=BcKhbaev5FtRcf9ugsn9VnujpHRqLooBOHdhgrOor2yPfzjSYGuTtX62A8qa/3jaF+
         9Idc+HtYZXLDDposmv5kaXD39a0dRWIBItuj8YJo8spADB9Eqi3QFcsdg8KLcuAPqRnr
         Jfq1xxNf+SHf/QL4tgMcQDyV6yBovRuY8X5DP1z9rpkwauto4FX+OaicJtszYTmxM8ep
         x00tfsfDGu6HzUTyjUBpO7N1UYRE9/TLEzDcaAWxEW8UvlILc9Az0t18zrjBX8AYJMZp
         PYxTagHp8hVMk+bRa4p1hUP1Oh8yHnsKMThtxPYRvqfDS/DZw0oXXlklLx22Z8fbCV6T
         kevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489270; x=1746094070;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zi5+9wwSGNxwIY+5Uc5lT+h4faQt9l/26HLQUV9AlUM=;
        b=WFqVveSEiQ6aWpivvKf5NAs/p73vjndpVb5HpK06tL2H6qOYPW7sM+Mh45/CbiKt4G
         0TTBRglpL4vtT2iI8MPOqANAW0KvMfYn4tccX430X5w01N1brupv34Glz6uGNRe4bz1d
         H65RIow+UScjSfELcManQ9RT4GVX9K71nMKuKraFuFr/K8vIDEw0Oz6sUOHUTj7poTEZ
         SIGtzO2MwyltTpOfgw+2QoZC3af6mvwLRpdqaTTxhSzw0QD8hb5s31MWuGW67nh3aKxK
         kJ+SioND3eUHbo/OnuGEm7RMSGI1Hgx7BOUNLsItLMyoGorHZupwR8CR57ZQaxr/xvch
         o5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWhxKXSAPB1TK5k+a6JvJcBf85nfDv2QLHKvmhh7/dym9QbIFiCQ1kly2XcO8h6feyNFkHHSkGObA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KXot3hAIXoZ2ppRX4XZVULt7RlDgEr7waVVZSY2k8GKfb1q3
	PVJ94u683AbZ8zBA4Wpr2nKZkTnU9jPqqk2pOeh2e8OdOMhMcl16LhQEr/HGCoUMawFnUwqbgou
	T
X-Gm-Gg: ASbGncsozxShYhheCsPaR3zVQKm0Kyeh02Um3H3Obu5zyM+9q4zkMxdPZwBMbkmZpfT
	z6O/0Z0KoGOlVVdb0SJBRjKk7eftKUkozT++OG5f4JonZ3edePeZj1jgOLgayxtD1yYhM2vG/gf
	uA6H1kUPc2c6eOhxCR5/JD+OwD3S5NE0RD6Aq+LDZ9zE7AdFnj4rSTUtJUCkJbJEJuAf4hgQ7JW
	Llqmu+uXNnHk9ilYEWvfqeut5szyZSavdV5Pnnpsth72QrbtuRYVU1vvePoUZ6si0OFhfewRfi0
	x9UEJRrk42oI0p1GrDxdgJjPm8WsiNAbdcxu3YgdSSo73qQQSHsX669KnIIBZnPkXYq/xA==
X-Google-Smtp-Source: AGHT+IEP7t1FvQx4F+O6KQ/WXWxyD6s+fSt4oVkVTE6GiGr0seR86AplpqbJ3BP0je5FP4UsutB6bw==
X-Received: by 2002:a17:906:c110:b0:ac7:3911:250f with SMTP id a640c23a62f3a-ace57537e8dmr63626366b.14.1745489270099;
        Thu, 24 Apr 2025 03:07:50 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59bbe0efsm82887266b.115.2025.04.24.03.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:07:49 -0700 (PDT)
Message-ID: <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
Date: Thu, 24 Apr 2025 12:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2025 11:34, Bryan O'Donoghue wrote:
> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>> +  vdd-csiphy-0p8-supply:
>> Same comment as other series on the lists - this is wrong name. There
>> are no pins named like this and all existing bindings use different name.
> 
> The existing bindings are unfortunately not granular enough.
> 
> I'll post s series to capture pin-names per the SoC pinout shortly.
How are the pins/supplies actually called?

Best regards,
Krzysztof
