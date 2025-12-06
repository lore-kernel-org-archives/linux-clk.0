Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B0E258CD0
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765019964; cv=none; b=fjNP3aNM/6cqPYxPK9xBJcW0kp/TZMq64mZLqLuHuSSEyo13YMQqpG/3SxYyG2i3c/SFCJlEDcaSryQLLU0b47rvPS1OpRMFgB+h/JUnzk6UvaQaQCGR7lAdFQE/QliWE0TQtpLnhiLtrElngddTYiaYNB1tyTzatLboF1XSZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765019964; c=relaxed/simple;
	bh=PbeuJZyFzzh09MahW+fNbQ6dbZBeTk2W/c8sGOLB4Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrE+LiDZLy83zRDWtoHg0zNSvs5grBsZqN4zEwEKIFSJWlU5+Sy3ggggp3CltPgtRUSMPw3V79hp7Gj6vLRctwOTZiXrsAHh80TmzYc1dtK9lRq2vHKH+54nRbZeXuJIyLgkhuxacmAyR2tetMFy5qRQB3vxW+vFTmtlhun5CQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OJDgA6oj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OJDgA6oj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso27420535e9.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 03:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765019961; x=1765624761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+tHfftO48W6nfjgJOb4B4hvebCxVDzsjtXa/TDx3TU=;
        b=OJDgA6oj64sk4WwAVoYHHxwQoWPJeh7Eb0S37umP6d4GVM3rq/AMUPARJ1NISxWo5w
         g/FJFn2SQ4YFO0HJKizWp8mpQeOfq02W3XrkXnehPJ/27WjA4Yutorz3jtgGu5G0oirS
         cZTo/a4o7ohNgp9j8Getub8THRv7ILokVxyXDbfnib5Qm58rmp7SIWKGMI+XGaYcXadS
         CLQZjSx6ZDv3V3Gd8eQ3ze0bebMW50y8L+7Gf1EdKtqnVi6UbBXvS6zApGJ0E2DjWKhJ
         Ir6lYg1p/fUG8bZxhAzi6bCiUMvPpUFclRTv8Vj+w4tqNpntJE851XgaV6bL2KkWKLbm
         ld7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765019961; x=1765624761;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+tHfftO48W6nfjgJOb4B4hvebCxVDzsjtXa/TDx3TU=;
        b=RYAdrQA0OaMBBKmRHXR6yAe3U15wHRQJ8WvrGed+vNBr7KwjPyXLYpNmCepYQWRHxi
         CEM2j+dQisoUSOevTMoJCPmn/KcDUnDvnwjkKOQDII4DE9fDrVgyfV4pFIt1QL69ZIKr
         kJvlFq+5Qwsq/m9KjhPyKMZ7aWnXDphXrqVKDyAnQpwbLcKnP0thJYX8QfSzVSwTyk07
         SqfLHtDpNr8sSpaIopGvWlfLTwiCyBAuOPABXp1R2Lr0+PM4HcXdujUUqIGQBzCVTw8O
         jUnZP1tsgygZc/jzFooo63xafWCda2W7pGEMVKCQCGp4/pYdpPJuJ6SsUfun/CH/QeBk
         g3DA==
X-Forwarded-Encrypted: i=1; AJvYcCV5u9sCsCWUWWex2Da4IhkFQZqbYklnm/xW005DP7V0mc1xLociumR3Nkf2PM4Dhldw6JsKILylDWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YykeNWJvJauSBIzxihYrROG3QZm+IymyCl2XEm0BQ1r8lPwIjKw
	4zpczuqjjur7t8s0QN3T6ngk1hbpfZYrQmgawT0aCYUeqBxFWsonycwE4wuzCUySIOM=
X-Gm-Gg: ASbGncumSxWvcjHhAkv04y2Pl10IuwsQjIPbAZCYhZlaqRNZStkzlRQ+IMeVlDShTFi
	Mpua+tMfBLQg84sPunOC9mNMbNn3IkFX4wqNIbVVYVPJcpP78TxGic0aGUcbof6jJ7ecbd1qfMz
	S9AafcxSwTZksI1JNNV4NVSMjjcH8fdFRPelwagm65okCAlXw57SzZ0XS88oZB7L76ZVqvFOgpY
	82pvky6/uOQ2kGUr05aNP3/u6jNJoQOKES5jiNVE2BlY+oYZivq1DkJEW8AfL84e7gfZFl8wVfS
	4Xt+WR5LtW76rxg1lT73ZasTNwdZNv5Q1FFt49i17WROmk3zuXty3NkhoVnYZ9R8WYuTokCu2O/
	bjlaXthbSK4qPfoB+KzZCvOsLzBR1/AjJZf6E+78M3bEIOILh0sidRv1jssv2Vyl5ggx7yhE7yM
	Fxmaz8oMo6VhVBFlY35NA=
X-Google-Smtp-Source: AGHT+IFQhZEwtnesdZtzEMw60QGuto1Jk8aN5Q0uD1nL300gD8ap+hhiRTO0P76q1MY51cduyxt10w==
X-Received: by 2002:a05:600c:a11b:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-4792eb5e5b9mr87841915e9.11.1765019961379;
        Sat, 06 Dec 2025 03:19:21 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930c747b8sm133725725e9.9.2025.12.06.03.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:19:20 -0800 (PST)
Message-ID: <5afbf96a-c87f-43cb-8cd1-d7c9970bfd07@tuxon.dev>
Date: Sat, 6 Dec 2025 13:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx
 compatibility
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-trade-slacked-5fc7c1139cb2@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251121-trade-slacked-5fc7c1139cb2@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/25 15:44, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx SoC Clock Conditioning Circuitry is compatibles
> with the Polarfire SoC
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> index f1770360798f..9a6b50527c42 100644
> --- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> @@ -17,7 +17,11 @@ description: |
>  
>  properties:
>    compatible:
> -    const: microchip,mpfs-ccc
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-ccc
> +          - const: microchip,mpfs-ccc
> +      - const: microchip,mpfs-ccc
>  
>    reg:
>      items:

