Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E315198D
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739530221; cv=none; b=MiiK9OzPW29uVwFp4VM4E2RFJGjZVdPP5WY39Z+ypOD4qnJryIC27PLjSBSc0EUG5CCk+JEw6InNRb56OE/QMRtazGMNX7nECRhNmTX1eYDsCJWhn1xw0yPLAGUX4p65k9+oLXdy61Wu1yLQX394Af7GaH7L5GhnZ1pRsXlvotI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739530221; c=relaxed/simple;
	bh=/75PY1aI7qFuYlb565XinKju4lg565aNTGJV7xKI7DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eM5vquD/FqirBs6XYfB6ZjsJU5dcKJwjtgCmXJmxpn9Js2kBKxAaBnkccVbJrFYrksXYXiihPwaHLtLLeerukWLfp0AQYajJTf7TUenKcAAcvlKRnyu/i3glGNnAq1j/5VaZ1CxlZyBT3aewPctM46PRNuSrEai+JdFwK7EdEZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5yfLQPE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5yfLQPE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4396744e334so239905e9.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 02:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739530217; x=1740135017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sYxYNeRuSFgtKr3MlQuuwdiHzGcDfeGaI3wbL87Ybo=;
        b=k5yfLQPEd4bOGTjZkkrXDx+6JXDsTsDfYL0oKFYIskSAmKbhlvGmgGODh/ytgucHtq
         ZHWDT3VpE3YGGF2U8HURpN4cdoHsZFxbIKL7DDPwT6fO73X9wezxkxLh3MV9MnlnUlO3
         QbMCZLYp14L5Pp0t8S+GL5NkwR9+LKGaFEHM6PzZiYJioQo8ILKmef7PExckbXVISpVc
         KwLfNCT7n4ybaadL+e4gE8y8hSWa+0pEgok4V48frPOG3VlU/6O1FPJ0mA/UoDK0Q63Y
         jN1FiBWMxyAvAf0jbReqLfJMCT71mEPCbqcLclR7RCDRa1ckJJLiWvRHvgvO66R12UsH
         Xzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530217; x=1740135017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sYxYNeRuSFgtKr3MlQuuwdiHzGcDfeGaI3wbL87Ybo=;
        b=AIDC6A4T2JoEIcTres+Zx12vt0mOXvDsmyzO3ul7RezEMtutf15ly/YvI5nOB9OIfy
         7GCsRu+BPLCUY1basKr16J5LMN7x9Ec5cOGfTuIPuPphwu07m4JdFdcaDOSQa8kcxIlJ
         47LGDGsIBxi526LyE0/GnvBmGLDES1OHqQrBuFuyMvXMXTQbwGLVb1kdLC6T3W60az4B
         w2hzIPnqTmdvLyPCC/kpZnbzlmW06F434fFy2MPmM0WH0NW6z5rqo7KCmgqfc371T3ym
         4GCVrnT48KG04dYTWcCaHkU6EtujB21pR1kYaKdf5RUP2aMyYjrTv5rs76288ehnfA2g
         AOQw==
X-Forwarded-Encrypted: i=1; AJvYcCX8ZfAPWUrenqu1WBWbEfYLonsid8MwW9b9YpXV001BME1t31qPcUZG+VaAo1BXqc599JrNRQ4t35o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1mkwpJYhMupca1eOpWqzkPPrHm+anYg/GBH7j49B8NVbiF+Fv
	7mQfUqnk8SBKqejMpEt5nzAaGuDoR7+kljTiM6gSsxROntoBEOq5HOMYQAhuibE=
X-Gm-Gg: ASbGncty6XTv/3kbWQfARJFe4eX0CEVYk2i5NvCNwHBA3HVpQo1dxWWBRnw9++Dm6Rt
	h7DdD6MJWE7uX3Q/MSFFOSdY0N5AyUqkCtIDqEvEyAtZl6ggKlzP3UUK4nYQZHXJRFYK/vkow4t
	LXZYD61H/2hQZFdB7SpLOWgdp61K0nCw8UJFiMMzfgOvqezn5aVbkHDp6IguigV6FpyUtYPqwok
	iM2S52WgCDegl4lgsUZS4OJoyrliYJ2YLwh+4q+jMz1u/2WOXKiiw9ZmJDRvwemXFjb9scq5gOI
	tUMMOb9i51zHpCCiZAN+vXqkWSh0zezegT8=
X-Google-Smtp-Source: AGHT+IEJqKSq5MLrsi8jITgtcen2XEnQ0VB0ofHnyXwtJ5/QaahdvMLVSI05YHIVjGabQtamovKmQw==
X-Received: by 2002:a5d:648d:0:b0:38d:cab2:91dd with SMTP id ffacd0b85a97d-38f2c77299fmr1182952f8f.6.1739530217416;
        Fri, 14 Feb 2025 02:50:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f85c2sm4413493f8f.91.2025.02.14.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 02:50:16 -0800 (PST)
Message-ID: <b4d07c0a-5b09-4a89-84b0-e8508ae12ba5@linaro.org>
Date: Fri, 14 Feb 2025 11:50:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/2025 14:21, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch for Display tree, although with Ack from clock.


Any more comments from DRM side? Can it be merged?

Best regards,
Krzysztof
