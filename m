Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238F4A3C
	for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725111166; cv=none; b=crlX6X1ZEGVB3JTQlqbFGarKNnzPeERsdeCAKZicRxCJCaQSJXaWpCIriAcI1/cWaprH7d+1POa24s8l+/xD8ERNDnhq/Fotrh/pdTCfGa0fivKtELXFPqRY8Jm5bf0zOKOVN5VrGGM1JHGQZkOM/pjqOEGYP+Xa+9Atzw08EIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725111166; c=relaxed/simple;
	bh=5ZV+3l8c2Ov9JRuodqJ9l0PCuEMCWZ/CJ8ukjbSL0Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVR+PqbF0jjzpW2pKPAvhx+Mp7bcbsG4Armg0u7AWLmGfv2Zz/1/GFyBpcjuVRqlgmhhg5lxQ83Xqp4FDlXn/AkuSoQ5P0RNAwphz3Wv8U4EYU8LdzowQ+E3c73pfoVQDZf8jCPVXriU9Mtxf1LHvYGJlcZ9oBw1nYti5c/1oPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oloo6lRa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oloo6lRa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso22732785e9.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725111161; x=1725715961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFA5cHVrCYbuMnxG2Yr+lCNh1E7e+JscJmhgi8KeHwQ=;
        b=oloo6lRac96aozdwEE8ZMcu33tpcdW8jHUHFWD5JoNtDi2l4Ra7gwt76vq9B8YOtkL
         Gilb1HTsYQYTcWF1clFRqRqSiBoECYj4RXTjZZLZ0LjsGEYzq+Km5RbGFb0MeivIGlUq
         sFJtNSquQgZsJBry1nmWq/VZv/7Or9DTUq+llRtmxm4IUGDPj4RYgw2mqQhygFZ04T4a
         vKjMFnsc+nXHZEjFQsjHEtTwMRiy4kM2149OmayI78XoAXuReHlw73NiARtNd7waD6a0
         eB0OEN/P9OkeSs3f8HR8wwv2YCY3s/2szWNUGFmy8s7eNlNr8Vy6nITF2Bj1bZMWDzhL
         oiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725111161; x=1725715961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFA5cHVrCYbuMnxG2Yr+lCNh1E7e+JscJmhgi8KeHwQ=;
        b=LGNhszXAa0/YbqCv/5pAx8MmFJDLFLecvaL9cg6eVERbykCKtL2im/j3yTUdnNi4V3
         Kb7n05aBLufKI6lrIvd+dz+vgpADHwpBxLap76IAs1gOazOH7ToV7feSNA7MAoge2sCT
         0pw8GC9ox50d0LVVD1rrUhs/PP/Vuy4RBEk2Ygd/j4VQe/CsbnsiOMCSkJFYuYRIanu4
         +anCoN+mQxT1SL7SQv3Zzvox16jtm+pP4fPwcqsEmqdMrcbJT3ZXT5zdFGvpLZ8O51pM
         9BK83ufnGq0qV1VcnqM4XwO/azu5E2DF7ONtXbF2LdJPIaaHGNmTpKs0217hTJ6Y/QHm
         gb1A==
X-Gm-Message-State: AOJu0YyeGvwz6ey+SsgwNc1QQbufqJc9StwgAj2GFvtHx5Cm6QiNgK1Z
	FBEt3WSWZdxD6bwcU4Ot6DjPbMCUK7TNrJCmKfZLzWmjTqZTei7RVxfX3vp7sdE=
X-Google-Smtp-Source: AGHT+IHknTcekKLxNYFyFH1SpJ0QujPtjHA1CNaSNCcSSUh5NNLKhm6npBadJ3CC2mIwHzZ8oF7MWA==
X-Received: by 2002:adf:8b52:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-374baeb0b84mr1764071f8f.19.1725111161146;
        Sat, 31 Aug 2024 06:32:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee71650sm6540647f8f.40.2024.08.31.06.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 06:32:40 -0700 (PDT)
Message-ID: <5b803d4a-ffba-485d-b1c0-0691a8fa9542@tuxon.dev>
Date: Sat, 31 Aug 2024 16:32:39 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: Add SAMA7D65 PMC compatible string
Content-Language: en-US
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240829-sama7d65-next-v1-1-53d4e50b550d@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240829-sama7d65-next-v1-1-53d4e50b550d@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29.08.2024 12:38, Dharma Balasubiramani wrote:
> Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
> since the SAMA7D65 PMC shares the same properties and clock requirements
> as the SAMA7G5.

Looks a bit odd to me to publish bindings and driver chances by 2 different
people, at exactly the same time. Maybe coordinate and publish it together
(at least for the future).

Other than this:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> index c9eb60776b4d..885d47dd5724 100644
> --- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> +++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> @@ -43,6 +43,7 @@ properties:
>                - atmel,sama5d4-pmc
>                - microchip,sam9x60-pmc
>                - microchip,sam9x7-pmc
> +              - microchip,sama7d65-pmc
>                - microchip,sama7g5-pmc
>            - const: syscon
>  
> @@ -90,6 +91,7 @@ allOf:
>              enum:
>                - microchip,sam9x60-pmc
>                - microchip,sam9x7-pmc
> +              - microchip,sama7d65-pmc
>                - microchip,sama7g5-pmc
>      then:
>        properties:
> 
> ---
> base-commit: b18bbfc14a38b5234e09c2adcf713e38063a7e6e
> change-id: 20240829-sama7d65-next-a91d089b56a3
> 
> Best regards,
