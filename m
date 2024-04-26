Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5334147C7D
	for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714128620; cv=none; b=UhGzNtmFcGhHgXzsBiKGAFG1BhxhhEt1IYp2/SfKyn5P5flNn1i8Z3pJ0VBlnSuKTBJU/V4vEXhdEjUJiNe7jkYpITL5ZpuTGurERwCYiGyXbtohGo5gOwfzxTuQYG7vQMK6VXLUml+k3cqjbGmY3JeOMpCHwiBZ5P54HikgPbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714128620; c=relaxed/simple;
	bh=FuzOVXheiVv7xE1rNAxDrlXsKwwbB9QAEj4QR2FTsPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTW3qX/ZfKfJWF2vVgq0VtuYgxFwpJG3rmeL2SMZZUwAu2lDzY+tbe3eOoJbyjNeztC0iAEw2KbwB+2jcxTsOA4cLP5m40K5sCBs/G/6552P6KQLvAg209aakqjqOeTUkHgtfzuCY6+A5siStLYqPwZWQWxPPMvH9x4UjgeYPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AYsKy8SH; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AYsKy8SH"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2dd6c14d000so22892141fa.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714128617; x=1714733417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYVEhcdcodZToII5Jgm0JuBVl2Djk/tDBTwMQ5vfKAc=;
        b=AYsKy8SHyUO1HmRqz6uQmqEUo60chnpifDYFJT4xn5gckTWOGwWyo9a06z+M8rvE+T
         qI4q+5kLvBd8xEOG9yuScGpxH0xXe8epzFQey0D0VMI/00XBQwkqZ8fQJZ4mhg8GOzMx
         QUtvqnSKstIhvn82SJkOEOMi4W7fPlU0GJqYexzhZLiiT9/IN0lFOmxFZweuL5CWOawy
         SaRfAlBny4M99Nn2hL0bV5ZiKwXFDKTlLqsCy2FBlrjc9XgOebddWcL9+AlCSDXhoZog
         PpTqDYXX6aWhofQ5/ob3Vs25gaeSeZD6v4NTChICNC8IsT08Vmu2+EJ+eEMujRg+qyNB
         d0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714128617; x=1714733417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HYVEhcdcodZToII5Jgm0JuBVl2Djk/tDBTwMQ5vfKAc=;
        b=eK/CAeqdQ330szRGYdbJjkEjAbEEgq44naa4vNfxigQ584z0VJ2riEm8Q3pqdI/iIZ
         7xQUwwJs+aP/szQIwztXxF72v7aBybCwwVOG9HSG9Hfq4ov6EEGwLYfvcKmmWlV6MTgk
         VkgR/o1IIG6NoVaNB+Ftgrbor+6wPRC+BwuVexsFsO0sbwfYsAM2XQjZQxJ/5O1/2ppN
         /pzk236+8mFc16MWAt+R8HUvDlarCumJDnIBY8tvqLbBEFIRXTBEqks7fFpMLGObmBRX
         +ekTOOheoMu3caYvcmxpPZbZPRNKenaY7kp6E38zrKV0ISVnr7ZtRupbktSfs8B5nhVQ
         twvw==
X-Forwarded-Encrypted: i=1; AJvYcCV3Oa/zAetXrAOGqhokmD6cZclN/BXT0RQbViozVeMMynLUJM9DzqNKwnB6LLQ93KIwM7GLloE23Shqo0BXs9Y42764IrW2jp6H
X-Gm-Message-State: AOJu0YzpoaJbn/wseYtbU2oxaxSHCJmvUaej3pJ7EhZUrjaIoX39fzT8
	3Ogh2MYpUYq0yOAOfu5Ht+VwdhlMKTF/L3muSVdygL0Y/2oxMljpoRk+9SsJUWI=
X-Google-Smtp-Source: AGHT+IE4JW1izzJ5u7fX0sAs2CaHdt0F4q9Sx8DVfzdc22pNB1/b5brFPMK4wZu1LsSKe3QahTXkaw==
X-Received: by 2002:a2e:bc1e:0:b0:2db:6bf5:2991 with SMTP id b30-20020a2ebc1e000000b002db6bf52991mr1846002ljf.20.1714128616906;
        Fri, 26 Apr 2024 03:50:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id r30-20020adfb1de000000b00343e392829dsm22272972wra.97.2024.04.26.03.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 03:50:16 -0700 (PDT)
Message-ID: <1db611ee-b02c-4b40-8e35-70bbbcba7165@linaro.org>
Date: Fri, 26 Apr 2024 11:50:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: add HSI2
 clock management unit
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
 <20240426-hsi0-gs101-v2-1-2157da8b63e3@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240426-hsi0-gs101-v2-1-2157da8b63e3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/26/24 11:03, André Draszik wrote:
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: pcie
> +            - const: ufs_embd
> +            - const: mmc_card

I wonder whether we can get rid of the _embd and _card.
