Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FCA7351C;
	Thu,  4 Apr 2024 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220466; cv=none; b=Iq4zZ+hptKmP+2k2zh+LX/k1PIHk6GCIdTsK2L35kV3/E8fYaifoaUO0sDXABnkkLE9PfvCcu5osmVQj7d7YdWV7VrYqbZasKigTJ9klc7EGwhWiYjlKGqokzEA0oSsMkGkQYVjmzIbpuTEqM0wpbnPUVd0wIPoneVF1IQwNkv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220466; c=relaxed/simple;
	bh=Y182C7DHHlXRpsI/4So2LrDCDd3eIgoVdb4rF2XmLkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noWp9FtN0sN8bkPOEniAoTAlAyTWeKZ744BOl0fTKZTnLvccfAe4Rn3bZ2GEeQXlcFWvsafOMZmivn/TF7eBS11301yEYngk9Hpc7/fgZMh0uBBH4aQTkYH957Th12IP95j5rsr38rMhJhiLyzmyjFmYiwaomrZQQHMs9LclfWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jr6YwK7o; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jr6YwK7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712220462;
	bh=Y182C7DHHlXRpsI/4So2LrDCDd3eIgoVdb4rF2XmLkE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jr6YwK7ouSyScTHG0TtbMMSIncvB2zzRBZElT2Q4Lztxu9RFhnMEcXGsaij7uxYqW
	 Dc0ia0MTv7YgQnh+IOwSPGMHTs4KyGHeOzu2Nn2UtuoqRZMigHFRzfJYS1SrxE5iJV
	 bwddtl1LBKBed39jiX92MO4gczFYL9TKDZYzvdGK5COrQitjmrgEuwOSFgpFuGRvZN
	 q92XGbKA2wKFxg2gj0B7H8xyJC8t6G7LjbcVskf6mCp7t1g9AhxNS8HS3mFecKyGic
	 YyhWJf7ZCXSIJXjYbOVMHPpR6N1UPuv9xzJr6CPgQUPqwcSxj3PTqDYaPYZ4+6DrVY
	 CrPxKl5M66+uQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D3C393780029;
	Thu,  4 Apr 2024 08:47:41 +0000 (UTC)
Message-ID: <abff4844-b444-48cc-8dad-18eefa6c386c@collabora.com>
Date: Thu, 4 Apr 2024 10:47:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: airoha: Add EN7581 clock node
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name,
 john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com,
 lorenzo.bianconi83@gmail.com
References: <cover.1712160869.git.lorenzo@kernel.org>
 <8465b7562bcf53a0adfdd4ae01b3ed94d6d5bc54.1712160869.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8465b7562bcf53a0adfdd4ae01b3ed94d6d5bc54.1712160869.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/04/24 18:20, Lorenzo Bianconi ha scritto:
> Introduce the Airoha EN7581 clock node in Airoha EN7581 dtsi
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   arch/arm64/boot/dts/airoha/en7581.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
> index 55eb1762fb11..a1daaaef0de0 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -2,6 +2,7 @@
>   
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/en7523-clk.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -150,5 +151,13 @@ uart1: serial@1fbf0000 {
>   			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>   			clock-frequency = <1843200>;
>   		};
> +
> +		scu: system-controller@1fa20000 {

Uhm, why is this not a clock-controller but a system-controller?

Cheers,
Angelo

> +			compatible = "airoha,en7581-scu";
> +			reg = <0x0 0x1fa20000 0x0 0x400>,
> +			      <0x0 0x1fb00000 0x0 0x1000>,
> +			      <0x0 0x1fbe3400 0x0 0xfc>;
> +			#clock-cells = <1>;
> +		};
>   	};
>   };



