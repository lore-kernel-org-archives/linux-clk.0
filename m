Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753354;
	b=QedRZRIc9yNhKe4z2Fz3Yq8xQboApNR5giM//++q3YyRJKOdyUHRm+YqGHZwB/tnZB/c
	 3sSv7SsK3ksPobyQu64QPSHqOceiBulv9sXWuBS737oA9prvU7g563T9mglD7uzhw7+gH
	 MlQif8/eWY0TiwZz2/+9dS/usbcdxAPr1EZwhMkG6uIZl+ADZ2ESwtuhKO87QiB8QSbOu
	 Z1hprKOBM7UXLucTRMhLJQBdeuxSZ02TCB/zXVRw6ZWTsamjwvpdkmUPaxLUHGtdPo5lr
	 gexHrbz3433JXpY0mn0nLgr8+P7Y5B/N3XQiEp2QuuP+O2Vj/hMU3tpX+i3urCFDzXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
	b=fAHdZbtFA6yqdAvl929msbqr6J+quTeljvMjtijiluFOwkcHZcnF9qiLYfm+W/lDF/FV
	 T3Gv9GggJyXNAJl5EWl1zMqA9iD+dfKGv/4nw4M9xcCuQ2MBkhYjq1Eq7cZq6IzU4N42n
	 z1bk+iziA33YblxFJd5V8S2d62N8FoXLiekBIehvxcu65vybo385F614uKkbKV/L42pNK
	 evDhn9Tu32CnBfuiN1pI7meUORODTBsJJFKyjIc8DK66tVgULyFoBXVcF2s5YJ6JEzkBa
	 OBuzxfd5IgxP0fcp8qAK8RQ5Uox1hOE78xv503R/0VJ892FdNF854ldSrzfwVR1z9rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=NJvpdGf0;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E885606A31E
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E885606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=NJvpdGf0
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49134c8509fso2652593f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1794753351; x=1795358151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
        b=NJvpdGf0UljWwfUO9d+YyB8mADHGzofjIzmwLCya/rTM8Bc9ALk2m6nDoj0t6EhwSG
         0PeRu0vK4OLX+5DuPPZRGfktsuzvxCKLMLjsXw+kPYsPHWBZ9pGI2Udfs+97w+qVfS9F
         WBWgEHFIItS5MLUuIej3LZxdmUaXUETIx8T6Fsx6NpBPCj8hTqqsZhGtoQooz9vqIiSd
         cb7F/57SoXjzWtu7Vo+aT2HordLafTWl/rDTIG162mILcWEy9qps9Xoe9HgrfpO+qB+F
         t+P7BFo5JzbQWrJiFRZeCw3yA3NNSrFnuX+q7r5eO7VV43kjy2NV3XKODJLSHfQP5lK1
         t+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753351; x=1795358151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
        b=h70KiUXTnRakMXtIka1XGRCPB6DYLS5Za9ngoSqEG8fy06Y3CCcK672Kbqn66joCfV
         VvTPVP6qGxQAkMBLWvYtvivkBiAeQe8y7qpncZ1s66GqBjIyTM7j9K5Ag81X0JebYrSN
         QMx7ppH33qyrgzSE909ieANqbItJ/NPYwknlWIdFc0NYpHNY9n6yo5xBmW6fMaEp4Bjd
         sXdeyj/g/eAznheh9cSPSn+CVI7z7Af7Z8qTjbCfIKP0eubqpIAmAD6aUgIGwCmJQNO6
         VfVstLJhqzZJIGgOPNEaeJvGmYqT/Ak34M5Q3M7okueAO3XXtMeTwhX4vzWqOhTsOeWq
         fejA==
X-Forwarded-Encrypted: i=1; AL+hErE3hom3w9Ap/pbotuleU8Nm1ff5WYwmmer3bo1VN6xpXbCyUxtXAdlPt2t4vLBjzwr8drclDAHznZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q0+UdO5zXws+3SGUW1D63AmgsEj+aga5zHV0Xc74srnK75igY
	TuLlzux4I3h3QEMwd9AhA9doMoeTlFpJqYIkPS/SstFzGtuTYEv0KTy1+2e0QLosGU8=
X-Gm-Gg: AYBFou3WtPHzPlqQLnLn5JCScVDjnMw4pvAEqi2gTwlWmu5ZtRWgnVPJaRZH7c4gq9p
	c3ryQYmb5N3oacoqWuUFemWdK5eQSr9lS8joRdKS7f6GzQ0q9mZDGfTxXIyXMDcmxXQpM4A1szP
	eZzjSHPeRqTivoZPP2w8d+O6DAgV2E7sWbaeCLj/nBygpQlzAX1iER1byq3OtWvk+tmRYAgMS/i
	KJ4/camC3BQAXwQCKCl8SgzYbnmC/SX3SYqdFecUbFdjgUSS4hCCj4FGEykwppzoi3mDVjN9+MA
	n+diiubB3AIKsSi90LlaU3R8ywd67k46T7mAFLtxlzaNecP63icKgoJ7ex5B2uVV2QkUs4rmJEa
	qbHbnO/HjlhrH/WaiyvYVHClokifwnG1H940zIgJaLKVYsmKk/kE5bdMKuE7NUgNjG37L+c2gU8
	xbhdE5jAA92zCs389WdhQYiK9bll64lL3of5CZSjng1x4oR9Mjo4nvzhs69Np7wKrfS8Loj3FEw
	4k1v7/xf6Mjtm0RY4rrP/fxE2NXRetd7nrr/O5HTPjq4ylg8jWglASPetE0hTOt6Llu/kN01Y6o
	6hPfzcde09ihyzrfFMPzXtR3mU0wyTUErmtKQw==
X-Received: by 2002:a05:6000:1614:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-49c72e85eadmr12207691f8f.46.1794753350909;
        Sun, 15 Nov 2026 06:35:50 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18730077f8f.1.2026.11.15.06.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 06:35:49 -0800 (PST)
Message-ID: <0ab96156-9c28-48bf-9c91-d1c9ecf90d5d@tuxon.dev>
Date: Sun, 15 Nov 2026 16:35:47 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/16] ARM: dts: microchip: sam9x60: Add OTPC node
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-15-ada@thorsis.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261105110715.2486432-15-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 11/5/26 13:06, Alexander Dahl wrote:
> The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
> interface between the system and the OTP memory.  It also features the
> Unique Product ID (UID) registers containing a unique serial number.
> 
> See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
> Controller (OTPC)" for reference.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v4:
>      - Dropped new microchip,sam9x60-otpc compatible,
>        use microchip,sama7g5-otpc instead
>      
>      v3:
>      - Removed needless header include
>      - Removed clock-names, not part of bindings anymore, and not used by driver
>      
>      v2:
>      - squashed with patch adding the clock properties
> 
>   arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index 4b777c61c1e09..996b13300ca06 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -155,6 +155,14 @@ sdmmc1: sdio-host@90000000 {
>   			status = "disabled";
>   		};
>   
> +		otpc: efuse@eff00000 {
> +			compatible = "microchip,sama7g5-otpc", "syscon";
> +			reg = <0xeff00000 0xec>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;

#address-cells, #size-cells are not needed as of now.

Thank you,
Claudiu
