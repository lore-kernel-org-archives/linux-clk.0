Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812EB2F3618
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 06:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768546415; cv=none; b=UZKqzWWTO4Nq6qM3rAOaLN9yzqRsDRU7uKmVLngT7kWMx+2U10Jg4WkW5mKUHQ/xjxZeV/bzzEPrStgnmFC4d/eRFYW9CJywsxXi688nwaoau2VfqSYq4Vvdc/5c4s3URVwvzheSSXtZyVPErTLGj3ab72Leg8xSIsPocBDiaeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768546415; c=relaxed/simple;
	bh=hAgJHcyKbjYCz79+sL72bdt5QiZ9LxAE0CgKB6p6C+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCcGcNSgoRMQSvPfP1j3jJaXWJhRcnIlYDI7qIzscz1BgEfFqE7ubY87oL6Kp6r/u+eKhinsVK7YqapIdxZ9/KZejZVP4D/1EvsZkRb9xIySrD9CmA79RhI1j17+y9HM3HDV/PCTAulewZ+e4sAhGLAbaGSDd0pxPfqyaoPVrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Om7Ocbu/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Om7Ocbu/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so5301835e9.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 22:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768546411; x=1769151211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZBgjJWFOo/Oc5syADkh6oxfyzw6Z60jrJfIeTvBdx0=;
        b=Om7Ocbu/8znsfC3pCpoKhsW2aohj6zpczWcCJnqXLUl7A3N9w34iYvZhXfxCfKExEC
         UdwJSrcTao6mSzpxbSTkWqDo+GFC5H1ZDYIUihutajxovz+BqFBiUx/bjAYxnuGVKaaH
         1/VNOiez9hkwiHK20IbRSQzLB+gK5AvL1LYiiM3PEI798CaZ4o9BS5vblqiVrPw6r9vk
         EtZfKKw5qzn9yXDlIdbuki0VvQ4WT3J4RMmR43GhEt759OsE6OifxhZZtoMasUxDodQ8
         msXZb1NEYiomaGrTIcmW51q8lA8+wxLZ9z7FKuHkROZbWZ2YH66qa+Rwy29NUa+67QBX
         6VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768546411; x=1769151211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZBgjJWFOo/Oc5syADkh6oxfyzw6Z60jrJfIeTvBdx0=;
        b=Tfe36d+FmXTS9zUwLLE09yDl41P6nWjHDUyzdg8PFmz6OdxnkRE3LpJStj8XoAsyPf
         w+iDrGtLk3nfKGGuG1sbnUdRJ7iJegUIlmgAp0J5EMb+Xz2TcXcayP5EElszhlVY6uok
         s1UEEXYfKhPQL6fpxOBVA4Mdfwei+lyVgyoaHgwJ+rtB7T6xv0ijQe6i9PjcQ8Gg48cv
         NE6z0xfPdkx767HpHYht8yAEkkyEAKBuAb2HS4hnKf+3YdlPClDAOksrjZCEyCoxAS7R
         ZNTqddjgwSMAxQ09SXAv8R+/mOwdZxAK7iAIU0NGJVQJdsaYgpbiR2UGNI2vj9mF+W/N
         CV+A==
X-Forwarded-Encrypted: i=1; AJvYcCXo2rDy0uO6Z2fO7XjJVRxgxL9X5rC1dcLVeYjvh/Sw/kqmGjSbmIKezm0Y7B70dlgP/nIqmHEKDLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgcYVe/jCzYrbDo8UJ+3sLnJLBWfn3jiUcPQQNBUFiphLKwIy
	dw4SG2JA1HCIS1qnCUBr9pEqfgnuClFDAEguai3QjtWThRHvdzH4EeRSvKQ8k5rhz9g=
X-Gm-Gg: AY/fxX5lquReLZB8XNuFWvGHXramK+L6B7lz9ZMO3A1d2l+u2tC8VlMqTuuXNoSpWAe
	k5XShRwYfKwREwNy1MXMDaPS0BGvltAwNGpA5YkhyYb11ORMisxnzvrOgaWE2c0CoVeRfl3MmOU
	AHUlMV5pLacBdPkyMIfWKOHzKq9if8Qmc96amKefJjmXxNADgpGwZ5k4l6vbkHj/iL0IoJdpxKb
	eKckleFM/WSje5S0uL/2M5dqg+N6IWoXbhmzXinoGvbF/JvkPsUsOY0yWZaIivCc97LwGz8rYPc
	WwnRIPHjomltSYD5LmBAqC2Xx22NoHGNtAIGVWzN+JkXS1Li1Am7qylZUEKOIkHtZQnmRMosFwJ
	OaIvYzipZBahLpELG2aBTPOvrXArFWlDIMC7QbXMXHZZA+0V0/3Y3/E03L5we2SzPNk6hy8BfVj
	oZ8VovyC8e374W4bnDM36r/lclNV2t
X-Received: by 2002:a05:600c:35c3:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-4801eac0617mr16897055e9.9.1768546410639;
        Thu, 15 Jan 2026 22:53:30 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0475sm33584445e9.10.2026.01.15.22.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:53:30 -0800 (PST)
Message-ID: <6113b444-329e-455c-aeb9-71025746d44c@tuxon.dev>
Date: Fri, 16 Jan 2026 08:53:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260113-snagged-blemish-52af3d00d88e@spud>
 <20260113-glue-justifier-566ffab2ffd3@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260113-glue-justifier-566ffab2ffd3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Conor,

On 1/14/26 00:11, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> the deprecated configuration that was never supported for this SoC.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>

 From Checkpatch:

WARNING: Co-developed-by: must be immediately followed by Signed-off-by:

I moved the Co-developed-by: tag before you SoB.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Here.

Now, the full chain of trust is as follows:

     Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
     Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
     Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
     Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
     Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Let me know you have anything against.

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thank you,
Claudiu
