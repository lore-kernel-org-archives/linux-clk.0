Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753275;
	b=Ku4sUx+x5wydGY9N6lzAR3VGK0QA7ctT1mAskc1j49kri5XKTHopzYx71Ik7KUHBzZ+P
	 RqSdISc2+0QbtU9F3tzK1AXvsdGEIE5iR3pMNDpt2PjsCklDLtWQj2jMipLRDe26AByTN
	 0NbB6bptwqU2lYgAsPa9W7NVBvpKiPr3DfG4RoWdD0gvHwqnJjHNbHxs2i/5zc8zuY0y0
	 VetSxoAAeCSU4iqnR9G5cYpqjYjGf+KB2lWVGeiKgR9tOe29XUpIO2Vp6scH6TpMxjml0
	 +tpiJwQ56MrYFZwpbbHIVuzCJSWSRhaTZ2whKtx9ld6udi4rdxzGKhfnsqmB8MLgiRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753275;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tNzd3USh5F/V2q6XE6vwKSqMU60KollHCRdPjoA6L9w=;
	b=sCW87/G++qnzeGhWQZHv0MPbTkNtp4FnvhfZR9cWAQ2qiX2Gf9tCxGFV+J6a+WAgg0vx
	 QYcR+uxHAfWoPnWM9tk3O3AGRy60/tLzKoeV+8BsnXEmzqu4NmcKnjkzROEA+8HYxiP2a
	 b3klMVyZGhlUlnNcQ/3XzLzOLdTPF83vV1PunhNduUUR0g2151F0f/S3wGym1vczFIIrE
	 q5zq5MdZijJ6LfIFsdml5q48f0PTKIRbuUbVI0B1GZ9vvKuJ0agrdrQaAVHWM6dHE2spR
	 TaGcy+8E3Hin8N70cRGn2Abc3RalrfQMT1yJo7AokyBOBM1bMQvTCq94FxqicNL38+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWNepf+F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D240606A31D;
	Sun, 15 Nov 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWNepf+F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582A41F000C4;
	Sun, 15 Nov 2026 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753275;
	bh=tNzd3USh5F/V2q6XE6vwKSqMU60KollHCRdPjoA6L9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SWNepf+FKsXuW9Qaef8jRNXzfwf3z4eamYnpgqM5tOpa5RIK7LwRgpvjEN5Ody1Lm
	 9g8Zey9C2Rt2nRVHWz0px4JBnv2AATKNiABDAtdNmEvy6yq1/pc7N8Wvvo/R3q4tWG
	 Mdc95ArXylLKf/DZCJ58eS3xME4yTvldULsodz43tDFWoTnYDcjU5MH4WUgEm9/a+k
	 kYfhOwSYy0VeH1R/H9BpDUU5ibmxvjMKCTdeDArInnsuPMvfha8F/gKVHV45uwMAl+
	 7auBwQV2NK9yPH8gh9iqCuBwrUCWIKbuU4g6ex8xzhrigQtEyylaN8igFcUGTgeZXs
	 2qjRUwuFTt1ng==
Message-ID: <5273baa7-aae5-4364-bb09-dccee581200b@kernel.org>
Date: Sun, 15 Nov 2026 16:34:30 +0200
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
Subject: Re: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing main
 rc oscillator in DT
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-4-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-4-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 11/5/26 13:06, Alexander Dahl wrote:
> The main rc oscillator will be needed for the OTPC to work properly.
> 
> The new index introduced here was not used on the four affected SoC
> clock drivers before.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v4:
>      - change index for sama7g5 and sama7d65 after re-adding unused PLLs in patch 2
>      
>      v3:
>      - adapt to different base changes, added lines are the same
>      
>      v2:
>      - new patch, not present in v1
> 
>   include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
>   include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
>   include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
>   include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> index 050e5e774b274..830e247ba2532 100644
> --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> @@ -10,6 +10,7 @@
>   #define SAM9X60_PMC_MCK		1
>   #define SAM9X60_PMC_UPLLCK	2
>   #define SAM9X60_PMC_MAIN	3
> +#define SAM9X60_PMC_MAIN_RC	6
>   #define SAM9X60_PMC_PLLACK	7
>   
>   #endif
> diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> index 292c5873e101e..58d2a08116795 100644
> --- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> @@ -10,6 +10,7 @@
>   #define SAM9X7_PMC_MCK		1
>   #define SAM9X7_PMC_UPLLCK	2
>   #define SAM9X7_PMC_MAIN		3
> +#define SAM9X7_PMC_MAIN_RC	6
>   #define SAM9X7_PMC_PLLACK	7
>   #define SAM9X7_PMC_AUDIOPMCPLL	9
>   #define SAM9X7_PMC_AUDIOIOPLL	10
> diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> index 08581418b9115..17105a6bedb54 100644
> --- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> @@ -19,6 +19,7 @@
>   #define SAMA7D65_PMC_AUDIOIOPLL		10
>   #define SAMA7D65_PMC_ETHPLL		11
>   #define SAMA7D65_PMC_MCK1		13
> +#define SAMA7D65_PMC_MAIN_RC		14
>   #define SAMA7D65_PMC_LVDSPLL		15
>   #define SAMA7D65_PMC_MCK3		16
>   #define SAMA7D65_PMC_MCK5		17
> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> index 27668634b0a2b..4a1c4af8ecc9a 100644
> --- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> @@ -19,5 +19,6 @@
>   #define SAMA7G5_PMC_AUDIOIOPLL	10
>   #define SAMA7G5_PMC_ETHPLL	11
>   #define SAMA7G5_PMC_MCK1	13
> +#define SAMA7G5_PMC_MAIN_RC	14

I think we can use 12 instead. Correct me if I'm wrong. Otherwise, you should 
change also driver code to allocate space for this clock. See 
pmc_data_allocate() in drivers/clk/at91/sama7g5.c

Thank you,
Claudiu
