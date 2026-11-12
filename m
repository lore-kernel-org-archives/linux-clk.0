Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474087;
	b=Seo4hNMHNBzqFXcBuw75D8xN1aSHuZvh38/cxJgRdRrnpnKzUhyHoqrPxcQ0KLC9S2R9
	 t9u7s9qauGkZQiLpPM340cDMiYDMWWA4MAyNKtDeMu1xJ6VbBgHiGBUXbtyK69LnKqOCd
	 twqrkgwfsKsqEUEq0sd1Pn05Cb1UeDV4bLpyDiI/ikpu0HWX4Ixgu3JsIwN4VV7UCUEdE
	 /o5ka7h9OLEXpZXeitVRPwVlzSpTr/xqFNr/buEmhRRQl3bn/+5N68SNyHLg0ZcID95aC
	 3Ljqa+s1J/x/Fw+4uuXAvpSls2asfFdOsBGFQRZnzmYh7yxMtzja3feCTojxiaL4n3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474087;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=i3FgasHjyeNw1wR+BYY/om5o5tw8bjHKXSi15Wq1abU=;
	b=fwGAHqkOCVS0phYCnMw5nCalZeEp201G4LyeHrbsFDzrQhmrGYOyJNj8wQgO3kL1ER94
	 e5VlLPbyxx1oZSOcG1kGJDehSc2SX0BI+cb7i9DW5Oq//gU+LrcK/o0uVLYng28KiNGOF
	 DXwWBZYEYXtmpZWdISpY+TYqnMU3MbSgrtl3bBN0VIzXwjerxC4j1qZlTmzsBckgc9iCb
	 x3+DiM5o1wUGpQGfzvZh1pW4U8GeTapsSD/VXomN0INLVKZAMtd1vwLcNfrxXqrGjOCI8
	 v16DbHtQaITDSkb+tU8/jkibxsZ3C40chArNY/jPFWBri7g43/0r7TBWq1RBt5uVuFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K6QH/V3i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1C9606A8B4;
	Thu, 12 Nov 2026 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K6QH/V3i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171F71F00A06;
	Thu, 12 Nov 2026 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474087;
	bh=i3FgasHjyeNw1wR+BYY/om5o5tw8bjHKXSi15Wq1abU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K6QH/V3i6m8OlPuQcrnR4DJXczGkWXP+0tfQ3d8I0DXmzsaPDMqkqe6lUjW1HnPiN
	 7w6FTybfw9K8V16x4sA5Zcyb0spzDJUq7v8wcPp5BBIKFT57YSoR6ev7AYMtOjKHpG
	 YxfR6qWpiM1Ympxr/y0+V0QYkSrzHSSlqvUStZm74jPsEqlNbAHgKJeLADpO0fyRIQ
	 hZtJ3C29Zjqbt04y+rswZ8fZkAvUhFK9E10pTBrCDDqWTgINMQSFKIH+jTfG+xsE2h
	 NOKNeZdI38vs5nRwSnVz30n4ze6BaX6du53db/lqPin7rKrki+nwWDc3dA6jCP7v9H
	 HbTO0b/TAlfLw==
Message-ID: <83e3e025-f877-4dfd-bc84-2cc90b601884@kernel.org>
Date: Thu, 12 Nov 2026 10:01:16 +0100
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
Subject: Re: [PATCH 2/4] soc: toshiba: tc9564: add a new syscon driver
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-3-elder@riscstar.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261104004332.2141282-3-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 01:43, Alex Elder wrote:
> Introduce a new system controller driver for devices found within the
> Toshiba TC9564 SoC.  The system controller manages access to an 8 KB
> region, and implements controllers for a set of clocks as well as a
> set of resets.  The region also includes registers that indicate when
> initialization is done for the chip's two Ethernet interfaces.
> 
> The SoC has a single 25 MHz input clock, and from that derives clocks
> of various rates used by functional blocks within the chip.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  MAINTAINERS                         |  1 +
>  drivers/soc/Kconfig                 |  1 +
>  drivers/soc/Makefile                |  1 +
>  drivers/soc/toshiba/Kconfig         | 12 +++++++++
>  drivers/soc/toshiba/Makefile        |  3 +++
>  drivers/soc/toshiba/tc9564-syscon.c | 42 +++++++++++++++++++++++++++++
>  6 files changed, 60 insertions(+)
>  create mode 100644 drivers/soc/toshiba/Kconfig
>  create mode 100644 drivers/soc/toshiba/Makefile
>  create mode 100644 drivers/soc/toshiba/tc9564-syscon.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b1b29169e0e9..c25ee6e0f1c68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28345,6 +28345,7 @@ M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
> +F:	drivers/soc/toshiba/tc9564-syscon.c

No, this has to stop. There IS NO TOSHIBA SOC here, how we understand SoC.

drivers/soc/ are ONLY for SoCs running Linux, not for regular devices,
which you are describing here. You have standard PCI device, not
drivers/soc/

And if this was Toshiba SoC, you did not even Cc Toshiba maintainer.

Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Best regards,
Krzysztof
