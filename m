Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAE215E1FD
	for <linux-clk@vger.kernel.org>; Wed, 24 Apr 2024 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967940; cv=none; b=PbcP9xH3k1laDKp49HP0k41+xb2IUVB0LP+MGFwUwBJdrqWKuKXEqa0IdeIHk0h01Yo5WqQh6eKFnt/ZxuhTJkEehf0F68r02+9nBHAkCY22c/lu1lgt0TiC+3KUXD/f1oeA/ngr4DrpCtLR+SCIJgYGAefID/kuSXPzYE6X8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967940; c=relaxed/simple;
	bh=JHWDAlXDMHen4ye8Cgf64D+XKALvK+nD/KnFaJSygmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2jc/B463xmXXcXZIAYPptQWn2WeCYxks6WAu4s8H7pZu27wUPFl0Ryqu4OJjhUbP2H2BNfFrrZJkUPTgHckYObZE+S7xZ9JMavzwoyB/nLssTPx1tStyMfoL1if/hc9zeN1Hw6GBaNz7ApImNhgUk8YjW4n3PxYC7qT1HPDKuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKpwsVJE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKpwsVJE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-343c891bca5so5491593f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Apr 2024 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713967935; x=1714572735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3zh00KAZtdWL9fqL/Gs2PzvIUPj0Oj4tDIo1Vf5qeC8=;
        b=VKpwsVJEHx/Q+Iy5tQ+gtNa6LIPT0ekOQEJmocM9IiZuwdQeJZKNylq8cBhGZRAVIL
         kYVvAG/I2OAY+dPeWxN2WDfGefls8mQhH0+gmUr7WJRBXLx2IhVGuFLDs55KfNRAvKbS
         iKSEdYDqv9efQd0lpyPbYrcsVJvP2vS+nAbI1xOmFMsTr2oMXGnrmtDNaV2ZB0c34hxx
         XQ3BclPEyBo+iC4oYZGovAOo+JuBPYn6SKWNR+D/q3HnpKC+FFP9X4bhWSfvSB2g08Em
         KYTgHXnLWcebWr42xnlH632k4xGTaiEgZMZFpX03scE9eNlBrpDNsn2QGMM/T31dXh0x
         DNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713967935; x=1714572735;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zh00KAZtdWL9fqL/Gs2PzvIUPj0Oj4tDIo1Vf5qeC8=;
        b=K96NTVrbbpeUo1pQnXo6GKNcd/P2fkO7Xg3eE6Q+gfjPK6bBPN5oNrw6/Ghs4Yg9BP
         hwSUcWIT3TgPn/3auvo3mnYPNPDdmUa4mEslPamvbcRLmY7/GZ0PHBJ01GULK4vEgpSb
         Agxjx9kgin1bB8TglK4P5FdBsafLuYKbQ1SeSI3IxNE72B8wQ6HNXYvM2EFYTsx0RsAC
         HFjU9M8ZIjPpyWznV1nmy/BoyMV1QwtMSM2ZHwXzhNxDvKD7gx6xcHMvmkaw45869Xqf
         YDkySFVkw6+32ii5JFL0DC7mVpgX4H5u4SpDIsPRXXm0ByrNMizFIv0/B2lvFVL4VxXk
         DIww==
X-Gm-Message-State: AOJu0Yx8/ZpGpqApoH4mpeKCCiZWzr0uJNom3VGUd8P1UaggaYNhQFM+
	LeU7qQqAbZlTk4SOhYn4WrbGEho3BYC4eCx1WjOha9RbMvGJuo3LLSNJstj2Q58=
X-Google-Smtp-Source: AGHT+IG8yQJyvrtnTwlNbmHTTR7gHwykrYPCeKBeei6+S5iwv3E/DPqubFaiH8iH3FPtja9CKq4pWQ==
X-Received: by 2002:a5d:5702:0:b0:343:44b9:af97 with SMTP id a2-20020a5d5702000000b0034344b9af97mr2205042wrv.64.1713967935251;
        Wed, 24 Apr 2024 07:12:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id w20-20020adfe054000000b0034a366f26b0sm15620894wrh.87.2024.04.24.07.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:12:14 -0700 (PDT)
Message-ID: <a2af498e-5db7-4362-b3b8-486c2c38b8b2@linaro.org>
Date: Wed, 24 Apr 2024 16:12:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add support for Blaize BLZP1600 SoC
To: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "sboyd@kernel.org" <sboyd@kernel.org>
References: <20240424133032.19056-1-nikolaos.pasaloukos@blaize.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240424133032.19056-1-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2024 15:31, Niko Pasaloukos wrote:
> Adds basic support for the Blaize BLZP1600 SoC.
> This SoC contains two cores of Cortex-A53 CPUs, one Blaize
> Graph Streaming Processor (GSP) and several other IPs.
> 
> V2 changes:
>  * Update SoBs.
>  * `make dtbs_check` has no warnings.
>  * Fix dts names and removed dead code.
>  * DTS is separated from anything else.

Your threading is totally broken.

I recommend using b4, if sending patches is tricky. b4 nicely solves
such (and many more) issues.

Best regards,
Krzysztof

