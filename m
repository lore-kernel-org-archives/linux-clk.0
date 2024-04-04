Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03E574C00;
	Thu,  4 Apr 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712221947; cv=none; b=H1QeSwyRmwlchX1f/euys2L91LB353qi7eJf+H5Q0ZfiZMoDQEeK4/GEK9b1iTMKrLgAyIy46FzIxSvAV+7lffXqvWWHnZ4TTdABi6qFIxQsfEEgcx3V/TXadyXmBFUrVFzjouzCGqwqUf5jO1RKF+QaNHhvL7rRvKmwVAJxSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712221947; c=relaxed/simple;
	bh=exVdovH29+iUVKstBi8NnPFuIy61AH2Vqta8XcMCVyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebiDiWhFE7foWGyF3wtr0pUNyOVyIY+taVeofMNvYCTJ9l3EuvCxdg8I7S8AEzfgMPvhQxv4YPB+mdsFjMAtJK3KQNX4ZG+XpKKNPzVL9F23coMv0kaxq/mzDQd4U2tc4Uq7cqXTKqSiPhfNNW/atFhpFaYySyrEsH6hyre2G+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kw2J6XbU; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kw2J6XbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712221942;
	bh=exVdovH29+iUVKstBi8NnPFuIy61AH2Vqta8XcMCVyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kw2J6XbU2CsUC0J3jShqRFHxhqZbUHWWuUGLyjU/+p5uLx+Up/tqcodfaPMRb7MWe
	 xTmq7E8LFjwrK+wBZt859ugC89J1lTgT1XlrJRNIigskYlWPIJE5Zz6AFFZfmOw33Z
	 Hu7YK1v4Lk2dMRySFuPVdU+8Q/cwIeYaf+VqUQqDIAcg0XWSukyb0XuJoAegWE0RGH
	 OXt9E7JtRsMFzQLsXjbpCMSK+aFCFht99CTdTbi5PvAtKs/I5mc6/hCJ94nUjaDoTj
	 Oq/FXLUB260Ah5I/76EiKB55DNG6rR+fJ+ScsMeG+7EmUA8x+vb+r2Z/zOoybgUDfG
	 ytkWSki79xU3Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D31FC3780029;
	Thu,  4 Apr 2024 09:12:21 +0000 (UTC)
Message-ID: <d8794345-6014-4949-8e6b-e09bc0a1458f@collabora.com>
Date: Thu, 4 Apr 2024 11:12:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: airoha: Add EN7581 clock node
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name,
 john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com,
 lorenzo.bianconi83@gmail.com
References: <cover.1712160869.git.lorenzo@kernel.org>
 <8465b7562bcf53a0adfdd4ae01b3ed94d6d5bc54.1712160869.git.lorenzo@kernel.org>
 <abff4844-b444-48cc-8dad-18eefa6c386c@collabora.com>
 <Zg5rc2GIwpN7f9Z2@lore-desk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <Zg5rc2GIwpN7f9Z2@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/04/24 10:57, Lorenzo Bianconi ha scritto:
>> Il 03/04/24 18:20, Lorenzo Bianconi ha scritto:
>>> Introduce the Airoha EN7581 clock node in Airoha EN7581 dtsi
>>>
>>> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>> ---
>>>    arch/arm64/boot/dts/airoha/en7581.dtsi | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
>>> index 55eb1762fb11..a1daaaef0de0 100644
>>> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
>>> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
>>> @@ -2,6 +2,7 @@
>>>    #include <dt-bindings/interrupt-controller/irq.h>
>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <dt-bindings/clock/en7523-clk.h>
>>>    / {
>>>    	interrupt-parent = <&gic>;
>>> @@ -150,5 +151,13 @@ uart1: serial@1fbf0000 {
>>>    			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>>>    			clock-frequency = <1843200>;
>>>    		};
>>> +
>>> +		scu: system-controller@1fa20000 {
>>
>> Uhm, why is this not a clock-controller but a system-controller?
> 
> I used the same approach used for en7523.dtsi. I guess it is done
> that way because the registers come from scu (system control unit)
> regmap, but I guess we can use clock-controller instead.
> 

Yeah, comes from there but you're actually defining a node for a clock-controller,
not a system-controller... makes sense to define this as

	scuclk: clock-controller@1fa20000

...or something along that line (for the phandle) so that, if another scu related
node appears for whatever reason, we distinguish between scuxyz and scuclk.

Cheers

> Regards,
> Lorenzo
> 
>>
>> Cheers,
>> Angelo
>>
>>> +			compatible = "airoha,en7581-scu";
>>> +			reg = <0x0 0x1fa20000 0x0 0x400>,
>>> +			      <0x0 0x1fb00000 0x0 0x1000>,
>>> +			      <0x0 0x1fbe3400 0x0 0xfc>;
>>> +			#clock-cells = <1>;
>>> +		};
>>>    	};
>>>    };
>>
>>
>>


