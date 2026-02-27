Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC239A808
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182740; cv=none; b=TGaaTOkTiXcB5ol4fjJ+hK1dEraotA0iRhcYXiodoiIli+z6P3un83T0oHteFPR1I6J8nmZALcpHM4dPd0bGHXJwl04EfTxpTBEO+tbB7S7PZKMdcDEiPjvU0tmOq82LGbNQoQLT6HlS0aPSbGrB4tM2B7NjkOmRTBuutny+Dw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182740; c=relaxed/simple;
	bh=Rab/Jz8s2Uc744fMnlW79JYdb4B3JVTjRt9ymGtF/MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9vkq3+3Pbjoa5tLMRM/UhYMy+j0PkHbQt+rjEWV+PMeXalgLlwDaP/8c7y15Y8ifv9uD859mdTHVVVVSAciHP8C0iEe/D+ZOb0DO9zeofNpQa+J5L004tmfp63IEtgHRgcvdmqNotCMdHLntlNdyUGYrpcAfTHg4zXQlUlFkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bkt2ARzV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bkt2ARzV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so14583425e9.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182737; x=1772787537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZj4vcPqGU2PZNqfUYcmBKBz7k0/XrtLyYeVPXSafZ8=;
        b=Bkt2ARzVpwPQAh9XvhHSQP4SLu0YI3X8jswizkDhlpLhmqT9obhxg4tp7zf92Doi5M
         1uEX3eYeg0eChfjSfC1+O8FxxBjY04lTO4g7ajtfdXjtPcFaoB3xwPFVax00Mq7p4Fa6
         QM6P01q7+iiSKNrUMJ6s4/Rk8Em70E2JSI8hdOlJQVN6Sa1yQ/KA193IJrfmkZQpTZC3
         R6rwYv6RBKlLhUnZHRBapIiYhC08SxR+P8LHxTFyLEvPJSbPjiah28ig4PlNhy4shhBg
         czkD4W2d/zun7limMH5+l2GiO4cIfFn4bW78fZFauRAW2Ig2JWbEfmF6BWRcEF0105ah
         bMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182737; x=1772787537;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZj4vcPqGU2PZNqfUYcmBKBz7k0/XrtLyYeVPXSafZ8=;
        b=K0PtMPnOBJBwGzewJVQghAtzU0Dxjrw6AGCuyEb32tF3H45UAOylEdUcNvOQlCj71o
         pvkU7aED1ZtmosNb82B0TCQPEPC8R5ZY0XkQFj4IKn+PaHSGby+CQZiOdYwBdEXX5qdJ
         9cjdy86U40R31WpILNn6TPXtymUf/b1kzRQ9GVX6HSC+bcSo0eh44QfNrav1utlWGTAS
         qoDAORfN261Z3UsgXD0tCe5ISHeTcrR4tW4YE3PndzgHixT2Pyffjk5ymH5BnSqQgiDs
         Qs8/NiSZzDAZ6LMJUYn0+T7I2BAPTyiCPRi4vDXncB8GpVOHJbaBfJit5bDDXXNA1kSH
         Jamw==
X-Forwarded-Encrypted: i=1; AJvYcCWcZqp3u0r3YNj52FT4/q5nRWTzA234zyZ5RJ/s0YriCVR6tLUw1zzGwZqVZfH7MQdi7odM9fjcNs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuP/1FsGe2+1Dt2Da0yD8NyLIpN/d3+IAzj14NCDkD/5NmQVIf
	rdULSo501wXyzugb5uo6hndODS/xCtLRI8wyFqjFNNcN4KJnbCN4CJnsBlfCJOVTHLE=
X-Gm-Gg: ATEYQzx/RUKBM6JPXeO3YcAEwI9xaVeOAtC0bh9z9v0RWIytatT/yMk0i4lq7johBlJ
	x6DfWmCEl3Fsh5X2dFquuWJMNNoprOSiqeAn3GcjjmmIntKjUIepJsMCN05XayOyrDF4IsUhyIJ
	aTTke+Y1+t8n/RDVM0u46attG0yQs/muDLWD1apkfgqvxSnWrgsV2lWd2J9OgnMR8h0Qtzpj2oA
	nKouDKyXioHSyDicQUFxZszSOAGoEXekOoFD1nKhrYqzQTYpSZPlQS+urFmaA4BIyM78hYZjTwH
	gWCHajEqlJQXVilp1CX2lNtht64GqG80wr4Yl0RGiNbCdg6V65Hj/TCRK+UuOuIj0X3Nsr2+xdc
	j/fn3DEC2gfPxL8aU6rHSJbSZC3IKw1jL8/IuOphSG69y0QWzEvaCVIbgf4FemCXvJdV74lDFj1
	qCSBgXO+zeT+exqhy9rfc0U/hwsJsE1rPFgu8VwQOQ77P3JVbcFgc8/HQFKGCJcwip
X-Received: by 2002:a05:600c:3e16:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483c9ba38damr29772325e9.7.1772182737123;
        Fri, 27 Feb 2026 00:58:57 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750607sm201855375e9.10.2026.02.27.00.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:58:56 -0800 (PST)
Message-ID: <5d880b56-a3fe-4677-9751-feeeea8dc2b1@linaro.org>
Date: Fri, 27 Feb 2026 08:58:54 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-1-a59c3f037d0b@linaro.org>
 <lxkbmpzqgkxdnanetardqhqpyop64ri5sawu3wta7hzjibbgzm@zyrdsfac4wvq>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <lxkbmpzqgkxdnanetardqhqpyop64ri5sawu3wta7hzjibbgzm@zyrdsfac4wvq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2026 00:02, Dmitry Baryshkov wrote:
> - Add CSI PHY as an optional device node under the camss node.
> - If it is not present there, create it manually (by applying the
>    platform-specific overlay, by using OF_DYNAMIC or just by creating the
>    platform device manually)
> - Migrate existing platforms into using the CSI PHY driver (ideally, one
>    by one), while still retaining the backwards compatibility with the
>    current camss ABI.

Even though this is more work, I actually quite like this suggestion.

Provided the DT compiler doesn't complain, I think I'll take this feedback.

One reason for that is indeed as you say, we can reach back to older 
devices and give them some love.

> - For platforms starting with N+1 (the next platform to be submitted or
>    merged(?) into the kernel) make CSI PHY node mandatory, keeping
>    backwards compatibility code limited to the currently defined affected
>    platforms, which unfortunately means the following list (I'd leave the
>    question on how to handle the patches currently in flight to the
>    maintainer's discretion):

---
bod
