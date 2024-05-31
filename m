Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7FC1CD35
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149324; cv=none; b=iXFDoraLivoeHgrveuSlq3s6Ad/7iH2aXiJW5Ljduao5Fw4RFpzaXnYMLet+hkavdudqEOP6v1OR+svjA0dpUA1MHpNM2wQf1bCQhNMrBNTR91CzyHnYDJ0SGKqC+PrhhnMznDyg0kTG2q3AKDeBhXLIgI0xun5AHpFQZaeZP4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149324; c=relaxed/simple;
	bh=HmBOAq8DyYpV8ruVb8dWgK4z+JEI5A6yGTu0NI31i6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnsNUf95E+KqaLGXr5T3Fp14xq+LmE00z7xwTi686SHFBbpqn1MkevDEBEgS7cGqBufDHo48jsi50YN8ETdlYPIqKkApZPDUFheae6MzR625cCvjvwsswTnaLIijNekl0MsBsi3Zvjwr7n15AuasQ1A4XGHhppiHc35iIVkQego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=TYLRRNlG; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="TYLRRNlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717149303; x=1717754103; i=wahrenst@gmx.net;
	bh=9d/HsGlaRLDBdBPakmfbaADULgWGTtFBoM3Fa6M59L0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TYLRRNlG0CvalwlDh72a7G5Ff9P9wWAbPaGAtRY3iKuYJtwMd+HPlTxV3ZN7Wnbd
	 gAgsqdqJQsFbWsAJLsmmpwjMRH1BWVFd7WAypqI5xneYSnzJlqVGAZnvTrLgn0+GB
	 6LMZ569uUtP0g8F5jpXJGxg38J/lYNxkjo/HHpeeHumBHQ763ZiN1uR/hajl1RH8Z
	 0TAx25ZizIkNNlIFJE82WlMTWf/ADgT/zB8asFJ31pHzzp8uDQJKx2wGSBjMdl5Cv
	 X7d3/1g9CtWPIntuFM6ppxMxFHkH4UYOoHYuceJy5qeQEFjnKVdH33KBY+4rik+RP
	 injQZs6nyWEiwmMXkA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnpns-1soncb3GEk-00oHwM; Fri, 31
 May 2024 11:55:03 +0200
Message-ID: <4c56e57c-7a4e-4976-a05e-0adf3df13b3f@gmx.net>
Date: Fri, 31 May 2024 11:55:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Add disp clock
To: "Ivan T. Ivanov" <iivanov@suse.de>, sboyd@kernel.org
Cc: florian.fainelli@broadcom.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Andrea della Porta <andrea.porta@suse.com>
References: <20240531092730.253484-1-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240531092730.253484-1-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eJXZyW8nquPN97oYqnXyhyNtCJ0Ozo6YLDgVL2Z4jO2tBdU5me4
 Km/qE41fYmbfPqWcSjv2ufWQHwPDVrB1fg4tUW1qD68AFGstfhYs6IVDGjYR8QVDy0tRAkC
 NRFrbpg4G9JprA/dKD4mbgpSLPh+MWTLbI2fUr99n5o5VsJ9JGUP9N0UoqM8QHg2URYwVqC
 lWvVSHVw9tG5L0aw2UyjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fr7cx4enoEc=;a/a+KuX+HDSL4PZsquzGgA0AYbl
 oeVWUR06ea6q40IpgqgDB4AFzYKIaf1egG/NQjpQnFMSYH+WcHXWO+j9/Fn9MkBH64FN/pLcV
 5A2DI+LYxbpnImCmJbrcW2XDBn0WIeLoVZIwkLLWwaWuh1ggQlvqUVf8/9LwBf6Vp4NzUqw3K
 tofospkX7HnzsPkeDxamt/QlyKoJ/vrcRBG9lwvG/B5zx4aoTJmJDvhtQKwnDCeirja8FmxRL
 GpirU/PG5NGKiU8PJpS1X/IUKrdM3QDqtyzD9bAn4+XnpvEMUGtPEKy+BIcgvvG5OkrMH3Dek
 TpdxwYKRh4pyqwSHBXpQ0cRFQPvmwUAHItnCH92ed4m+2tLtN25WbdI9UE6GVNKS9Elp6iGxe
 zjwhnITEALotbKNuNCSumv8LOt/EQCwzkI0lADEmp7P7dtrQOCuogWbVDPvqIGjP45VFQVoKC
 Er1B84q4Suc6hQO5+uh5vzSLlSXRbJgq/XLL6yha4x75IxTnZwoBDEB1msZmqlQDSHrWBXUz1
 zZKL1D08hExebeKiw2xtVh+8VlutNZafJlKvQ/yiZQ7aP68CLM89+50lAo/5/arajfxujUDtF
 ea5D144ou90yZk3c02gvm4ScfDv0vQUY5LqLNEiEqdZ9gJ22CEez3PEAca94KbubTcbeRPGPk
 UBr1eX5Qezzt9o1lMZAeNlWBjqE9uijRQErlxqXqTBm2ke4bP11sSAtW1Fawx6wGsZI2/EMOx
 hbMruoUBKyfqG9BzYa6X+j7s8cfbOH6paLNeNob0n5Vvb0YwN8Dfi/6/IgKf8giz3YMIuM/UX
 aurVkX1eeAPGVPl2Te42ADtVPQ5iURkCFUX7dlR7PpLi8=

Hi Ivan,

Am 31.05.24 um 11:27 schrieb Ivan T. Ivanov:
> From: Maxime Ripard <maxime@cerno.tech>
>
> BCM2712 has an extra clock exposed by the firmware called DISP, and used
> by (at least) the HVS. Let's add it to the list of clocks to register in
> Linux.
>
> Without this new definition driver fails at probe on BCM2712.
could you please explain the relation to Andrea's series [1]?

How can this occur, because there is no Raspberry Pi 5 support in Mainline=
?

[1] -
https://lore.kernel.org/linux-arm-kernel/cover.1717061147.git.andrea.porta=
@suse.com/
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c          | 5 +++++
>   include/soc/bcm2835/raspberrypi-firmware.h | 1 +
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 4d411408e4af..fabd5595e9cd 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -34,6 +34,7 @@ static char *rpi_firmware_clk_names[] =3D {
>   	[RPI_FIRMWARE_M2MC_CLK_ID]	=3D "m2mc",
>   	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID]	=3D "pixel-bvb",
>   	[RPI_FIRMWARE_VEC_CLK_ID]	=3D "vec",
> +	[RPI_FIRMWARE_DISP_CLK_ID]	=3D "disp",
>   };
>
>   #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
> @@ -124,6 +125,10 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	[RPI_FIRMWARE_VEC_CLK_ID] =3D {
>   		.export =3D true,
>   	},
> +	[RPI_FIRMWARE_DISP_CLK_ID] =3D {
> +		.export =3D true,
> +		.minimize =3D true,
> +	},
>   };
>
>   /*
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bc=
m2835/raspberrypi-firmware.h
> index 73cac8d0287e..e1f87fbfe554 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -152,6 +152,7 @@ enum rpi_firmware_clk_id {
>   	RPI_FIRMWARE_M2MC_CLK_ID,
>   	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
>   	RPI_FIRMWARE_VEC_CLK_ID,
> +	RPI_FIRMWARE_DISP_CLK_ID,
>   	RPI_FIRMWARE_NUM_CLK_ID,
>   };
>

