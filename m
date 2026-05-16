Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF5230BD5;
	Sat, 16 May 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778947637; cv=none; b=bBWW46RFO9nGEwFTioLinU4mzhusDInaCvP1YDIwsNY2pijKcuo6pMlIJRvD9yD4t0opZDyQC6FUvJ0h/OqtBfyAmku5jQXJpDFC6UqgGRYjgEljb1RzPFDw+ogYDa0MtVmPGVq0mt+h0+4ekc6jZw/Wk7LWbCfZhXY+N2aiUeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778947637; c=relaxed/simple;
	bh=yVjua7PK4tV1BdjmuRNiLSZ4P/bUHZWO6Q4IYZpZ1dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fvaJ8cHnyJC2ajnFCur7d+uK1txQSbOTCb5R3/LiPtMQ+gHoS6cABo0jAdnYLuz+Y9KzCw+38EY4RRd2DooNNPRamPFbJeozXpMW2S5SVS5/NrfN+HcH1fpzzkMKomWp8KYvUz1Y0kYSk3L3IUF6qIts6rtve4taebniFWLy2dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690B9C19425;
	Sat, 16 May 2026 16:07:12 +0000 (UTC)
Message-ID: <da83523d-f3ac-42e3-83a2-fb7e7d64ebf9@tuxon.dev>
Date: Sat, 16 May 2026 19:07:10 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] ARM: dts: microchip: add I3C controller
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 tytso@mit.edu, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, durai.manickamkr@microchip.com,
 cristian.birsan@microchip.com, adrian.hunter@intel.com,
 jarkko.nikula@linux.intel.com, npitre@baylibre.com,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-5-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260507084805.481737-5-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Manikandan,

On 5/7/26 11:48, Manikandan Muralidharan wrote:
> From: Durai Manickam KR <durai.manickamkr@microchip.com>
> 
> Add I3C controller for sama7d65 SoC.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> Changes in v3:
> - Remove clock-names property as driver enables the clk in bulk
> 
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 67253bbc08df..ec200848c153 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -1055,5 +1055,13 @@ gic: interrupt-controller@e8c11000 {
>   			#address-cells = <0>;
>   			interrupt-controller;
>   		};
> +
> +		i3c: i3c@e9000000 {
> +			compatible = "microchip,sama7d65-i3c-hci";
> +			reg = <0xe9000000 0x300>;

 From manual at [1] I see the size of I3CC region is 0x1000. Unless that is 
wrong I think we should use 0x1000 to properly describe de HW. Please let me 
know and I can do it while applying.

Thank you,
Claudiu

[1] 
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7D6-Series-Data-Sheet-DS60001851.pdf

> +			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc PMC_TYPE_GCK 105>;
> +			status = "disabled";
> +		};
>   	};
>   };

