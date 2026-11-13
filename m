Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794569168;
	b=2rdjJEiJpi9kgML5tOEoaWZRA5Lgv3tWFA4cB/eMxbTC1UFgWNHG4bjkZJyaxC0S6jWm
	 W+VfoTPdrgYKjHtEwVLofLCMHUzLzvoMjMWVf6F4DBrguNyUtwdEvZoLwjnzdrxh66Wrj
	 r+FRRPBPy7eSDl1T6mA/9pwwtoDBB8GqgXzYkSLS+AA+e5FQRXepmzc7qcL8mfu/Pafgc
	 6ahXbPnwZb5l0Da/zBRaSudlx0l3yOPRXAgOwJKjo5TBduVpEw/tkCDRfJY8HjsAnY4f1
	 fIfMkFFGvGbN1YTNRQSGqwdr1m30m4TbrTwwEPtrepOR2EoBrEDkuqvRECjCaUYJUfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
	b=ajKtfD9nFImuUp2s84RXX9ZT3PtM4tsINK3achunjnwVI53IjAKJjqPLpD0fVARPYqNh
	 +IalMAJdjbL9wYi++AzsFIiZQ0Hn4ZvUE2EiO4pY4bP4mIoAY7Cl09R6k3U+VOBMFLL46
	 s/2YSKKsBuJny0grAlclfG/H5kY7j53GdNZ4H1HTna2NYwzDXEATZfqjB6Rx97we+M4nK
	 kMVb822fGwrfhx03BH8ogxzVn5XTgaJzcQDhriDmVVGavuHY1LA9WEnFRk9agCVSD9PD6
	 uypVAjoJeM0DlfoW6CA02f0SVEPZ+xsA7BQpnJXCdkqG9t63My7UIkmQEilT6laIyYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEek9Htp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45720606A321
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45720606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEek9Htp
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4322d310e7so215483266b.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569166; cv=none;
        d=google.com; s=arc-20260327;
        b=F+bPCiFgOscQzsQtuD1ed1Tk5TsozD/JdVH8zrLnELMgcAeRQ5cufg/V5MgiBZYdqt
         JfmgYmtZJA4A0izg5eROeUW5hx6d3jQ6ZrFWVZGGkk0sq/2+9l9DvhZY9Bd8mFigY9oK
         TnD7nZ3UCaJU7wNR1s/F0um6Tu4Zm3NhR7f2IFHKdfxQVSLx7W9tf2BZS/OnCUKvoNc6
         dHw4BsxAEBdNxncW0xH/UtX8+UhVEVapHYemxWllJb69v4HZJFLxLLSXXIFlKkQESt0w
         obqQ54pefHt07GK6pBCcQErvV04xT2YtSgy9TpbcwLK+oJDhR6Tl86AqgzHJeJQWWj9B
         PyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        fh=0hkfT4ikCFPJjDcCnizjJbW7abwrKw+o7pGaljqxee8=;
        b=p0R6HYYokrMfKgivFE3xhn064ZicJu+XH432yyNtYsGSGzvN5YGjq32aI9gjkmTeyy
         +aHfHZmimdVrcvkmpTPIvRpTeOeeOB5jeda7YSyCaFe1cB2SMtbHnEmhEF3uAfFSTBkR
         pkFlpZBCFwP4XSrz9Yh01n8z+d7OMcruAsUVx0UuT+11Mgp0Y6OEph7chYrwOPNDDXvS
         Q/SQs/EYosBFvZp5nPucF1jhQOaBUNz90lBGZNoIozztXwsAjLrpObZp31npR4GAPTMX
         ltN9cJbCOzFYrwqY+8/rihAepFqwgzKqrhP+wBe3ky4qSUL2/JnB46SKJ1ted/LAkUnD
         Fpjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794569166; x=1795173966; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=dEek9Htp2rFd6uu2Ph7g8AxNoYqFVLHVX2mYLl9kLY+HH06kTBXQOKi3r22Mzs9smM
         sagi7bl3+DQo9QkgTX7pFHO93lrrwfHA6SuB0Jwny1Vd/GzwHFiBiOLy6S9zwJfvMoMV
         BKXLBxVHAmkpbgA8o0UpnP/AfJIu1vZfb6RN6XB4+9f2VpfiBaFeZ3JlErhNyKX25LeG
         eXs4P2pgPEqHHlNwFOzF9ojZ32WC+7RCdT30YKCLdKmAlot8Hrf4HxUhjgtdo+bcdj5R
         UjplazmJUwmFyYVBT23xLFvylNJ7TA+SVSzh4P6gk312G6Dekfj7exzocUaakVK7/BPK
         ABFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569166; x=1795173966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=LVsKv/fAKdBZcKpNVJTaHQjDSBVDPO/VgdPyzYAtOHoN9+nze1Hynkr7/Hg/b+Fhge
         suj5UmJVq4AchasIEVBOuq+EjPFU0R/YJhs7Sw91vT/YJ+rYdReQ7RfbCkNZM30kYf3Z
         lSFMSb0x3fs/5UJoJRoA1V63W6YNUA2GCaslLl6UuoJja06/BeBs98eEKiZFMHihD/iF
         qKXBp1E4LVbVnGVRALAahmHv/5hBxhpoVpCeaXdGANGuIxslJpHItfgl5suT8aE8gYo0
         kB6EBrMIKnSKr7pNnx/JpvLNYfg2keKiN5G0lZP68zGSOGKebH2tdZYQUDY1VI4cTqb3
         NMrA==
X-Forwarded-Encrypted: i=1; AL+hErHCQmR/J9fabpmIbaYyx8ENEn+dnU2N+s8lW550WYyZDXy2P0a+B8rgOYvljygTginXLztgmc6he1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z97GNSnkxcXXj83/Xr3rJNUUcuESfon5EAqG0rrCBP0I2Zhp+RO
	x43ayRExQ6xHmsp3OxTPgNZ7cUEejb4AMxMA4DvgdmeC2p5F21qIM7axwNtCPNzqhnPIV4EGHOY
	f7PNzxW214rB0pvcAGTURE9Cvg8BIqhb/txIkbrNxEw==
X-Gm-Gg: AYBFou2DNFX4LFddyf0vGsSIarzJS7PXrMxFL5K2j9GLOc3CZVig4JQZechp4Y4MqsZ
	xstfjpvJnDcZKtVECpik096vhLE4RfCpEkccAy46uvpQJiBxoxPixpqKhlIJFqlYt4GP1SByiof
	leP8aXSvvVOLmwv8IcFgQW5X5Grjm9nGkktn8wfDq67mDtAbT5iXzbcstMl3Xc1pkC6dHpA4YYN
	rIydIqCV9afY0Ob12vxAvVUR3e+3YxXbzWNJJDw+8PhMjNQs+XoyDwMWfpEaGy+z9Y9YeB697dx
	AbkSpGiob4s4DB/6WpdyHcmHVdhYqqpAo/+5Rv2is+X/VBVL14C35swcaaWk58Turo8Au2dY1Ik
	vnXK5t3LzZCoYL1zuHMPM3yL6IQxrGAfguwVFfwssZniWEhKds6i/GUbcioqgow58rCM34Q==
X-Received: by 2002:a17:906:c154:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c50962edf20mr170802566b.12.1794569165639; Fri, 13 Nov 2026
 03:26:05 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:25:54 +0000
X-Gm-Features: AclHuK-RupDt9op7f4Ges1DbDNx958GvAIMpdcpygcG5RXJOoAuuhRLl1DXJwcA
Message-ID: <CADrjBPqfJTRpsgJza23dup5sB9OxhS+AJ_vzmNtmuuJXQaxOxw@mail.gmail.com>
Subject: Re: [PATCH v3 03/14 RESEND] dt-bindings: clock: exynos8855: add peris
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_PERIS
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
