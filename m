Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206615958C
	for <linux-clk@vger.kernel.org>; Wed, 24 Apr 2024 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713968012; cv=none; b=hg3N2h1KUBYO8T4QspXYCGYeL8QiknLCJYVaa4dlH8LGf10QxsNoh0YeBGP1Z49EcUjxqXG2yTvaBNI8lkfJnvY7kakKp2X6tiLLuHxxqRT7b9X+sRVH8+F8H0tofK7GztST5wVrgUjM7VLW6RD5HLY2UrzxB+gYEuYTU8XOOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713968012; c=relaxed/simple;
	bh=MHXJFG9R5z4UIBlsq3Q0t7pBbsb1GrwHCN4cLP+nv7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXpgc+rcVTcGF66sib8v5DVByzAu6kZSy1rqDU1pjYGOVq7vQk/jcPorSTtul/RuXHkQ01u6+u5hCIUYh7zkv3jAKyznquJW2vrs+SHsM6nj/8Zt206tDrIotW3jO3UQV6tPAEkF7Ri7jVVPmKJVrJjC8gfWhpoo7HnwyumbLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OGHyWzxC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGHyWzxC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41aa2f6ff2dso18664085e9.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Apr 2024 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713968009; x=1714572809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=upFSzmkQo8CgsapbEeLrrhLTa3hAx19iRLmed+yVuy0=;
        b=OGHyWzxCS4378pHSnpTDBvy5vHEqOnx8Dgip3otVfJx7fF8itfYVC6q3IeiayRCkVq
         ANnGgQwC5LSOJCAF3McyFQDNwin299FLfHvlFedkRBiIzmSQ7zUoMKcwqaoOyFIRgYh8
         g54nFmW7IXVxaRkyuW6C29naARonyibAychfeD+QjnUu7CI46D/2t8VSid+wgvS6egZj
         cJcNcX83wKi49KZda+xXmYROigOPyoqTeNQYu2+EVp4sH4ZhGaRpMBWf3XHBZsefJIUQ
         TJClg/IDVeO6PHlQBUNfaUEIhBKfTPAGMR2eO6Z+TGXl7r6SQpSQxPoAB9ybAdrdhi3B
         3bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713968009; x=1714572809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upFSzmkQo8CgsapbEeLrrhLTa3hAx19iRLmed+yVuy0=;
        b=VEfElVg0PRAmwF2LOqZHR1RHckU3v0Hrnu4b4Eg2aI4LT4yChmHfrpCH+dY1rxmUxM
         wdL4TrzV7ek9eQf8mX0eNevagqgw+DsmoIf73GELp6rLTw3lV97Y9mvACpTGrVFoFFi+
         EIrmgLCXFfN5GHgExHWgVBh3E3YPqWUAJu1rCWR8IUYPwJ9PqxvNok7jpkrJVNSGmH0s
         qBl2TVF35zfYr/dfN0EcTcFsl+qqaeLEoVEP033oaKBXSOd5wrzoP+eV65V6rii0qwTH
         yNYUjPVlThplFhYT4E3iExppVtzW2ASsErVUolTuwZZ/o3tVK4GW3hRtNW7ZsKrOJXh0
         IQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMkoFWddml35AcvRSJGrguBde+PqfEtF5CzJhDukzdstrnajDjp4Dsqq9JHv15pOAPPRI+y+MXHWyJXpo2U7Y/B1A090TNcxp1
X-Gm-Message-State: AOJu0Yx/uNktSJv2UrxQgTn25yyaCIpIfzhZWKq25o58uKkWZ6kDH8t1
	h9i9j1dGmNU/CMWwUaBin7zkv6tH3dV+Q/qU4gH6XeSpIyfS2OffXPKLRFJgqN4=
X-Google-Smtp-Source: AGHT+IHEiUahRPYhpIwJapnRuhEnrBG7idILvKUBZXtAjNt+HU6ad3qEBAoDyUdtHUs6Ct0FJspW1Q==
X-Received: by 2002:adf:e28f:0:b0:34a:ce8b:7b79 with SMTP id v15-20020adfe28f000000b0034ace8b7b79mr1857054wri.1.1713968008891;
        Wed, 24 Apr 2024 07:13:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k29-20020a05600c1c9d00b00418948a5eb0sm27885519wms.32.2024.04.24.07.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:13:28 -0700 (PDT)
Message-ID: <fd4072dc-7cd3-4d13-a15b-d63c675a5994@linaro.org>
Date: Wed, 24 Apr 2024 16:13:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: Add binding constants for
 BLZP1600
To: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: James Cowgill <james.cowgill@blaize.com>,
 Matt Redfearn <matthew.redfearn@blaize.com>,
 Neil Jones <neil.jones@blaize.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20240424133241.19210-1-nikolaos.pasaloukos@blaize.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240424133241.19210-1-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2024 15:32, Niko Pasaloukos wrote:
> Add SCMI clock numbers according to the Blaize BLZP1600
> SoC hardware specifications.
> 
> Reviewed-by: James Cowgill <james.cowgill@blaize.com>
> Reviewed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Reviewed-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

This goes to the patch introducing binding doc.

> ---
>  .../dt-bindings/clock/blaize,blzp1600-clk.h   | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 include/dt-bindings/clock/blaize,blzp1600-clk.h
> 
> diff --git a/include/dt-bindings/clock/blaize,blzp1600-clk.h b/include/dt-bindings/clock/blaize,blzp1600-clk.h
> new file mode 100644
> index 000000000000..f1d59849a6e5
> --- /dev/null
> +++ b/include/dt-bindings/clock/blaize,blzp1600-clk.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2023, Blaize, Inc.
> + */
> +
> +#ifndef DT_BINDING_CLK_BLZP1600_H
> +#define DT_BINDING_CLK_BLZP1600_H
> +
> +/* ARM SCMI clocks */
> +
> +/* BLZP1600 clock-gate numbers as defined in the hardware architecture */
> +
> +#define BLZP1600_CPU_CLK 0
> +/* clock-gates 1-6 invalid */

No, they cannot be invalid. IDs start from 0 and are incremented by one.
If you have holes, it is not a binding.

Drop the header or use it properly, so as virtual IDs.

Best regards,
Krzysztof

