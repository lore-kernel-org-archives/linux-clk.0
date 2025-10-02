Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CA44A01
	for <linux-clk@vger.kernel.org>; Thu,  2 Oct 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416754; cv=none; b=NxNNEfizGzHyDRB+bVT9uQI67lPqy5f40qZPq6odiBk/Jz3q0YVnCgoTuXpqelCJ7HD3lWGBj0IMGIi43jLlBdkE8UGjBKrxg7ZQkPlTWiWNDvNBaGeNJw2AIUmnX2ZiZpSupGtQqaiCoDCU9eg5M0i4T1Nxglxu+Er9tslIKNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416754; c=relaxed/simple;
	bh=pMvKyWMAfvVJZXrB9tMwBbl2Q4B77sukmT1yQNyOOls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpRu1k85mw0Scn07hqAzuILs42Qgf3b2SgMbMXd4BvsACFJEy3zKP45egl5BuarSC+hluM80+nZqBDZSg+swKU2y0cYtH2SRoJ+zIHpJDfaC0tFhg9ABD0cFkLFPqe+gAOWkCBCBDHw7qxD40dn8Zno66jwLrQCe0RevSQbyH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=r9+c8Frq; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="r9+c8Frq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1759416749; x=1760021549; i=wahrenst@gmx.net;
	bh=pMvKyWMAfvVJZXrB9tMwBbl2Q4B77sukmT1yQNyOOls=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=r9+c8FrqUMbdy2KCVT55yiuHQeCY7IsWrGMQ/Shj+z/N7kQnvGSu0/94W3Fq/p8B
	 i10zw2ZTRbI1Mjgs8+pEFwESjW23ygSIFAcF80IBAhoCeWO12sVTp4X/08w7dApNP
	 MIpVmF36DZec+bhOgpFFNrkDyQ1Y83FHnWd9zPhuEU4MHDh/XMUpDi3ce4Rn1Yyzs
	 PZ0Ej+wJrsWHyvHzjaZCPynF0q51up/x40dpdDwftEZquQ73/e3o9lUIlOpovpgSP
	 5+Nh1o8L0nItfO9CVyuwKMeulQMs5ZizMifBt+Pco8WBf3F+vInJYqgUhyjWKUjwD
	 jzSF0s061tQbttICRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([79.235.128.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1ustgF1Bog-00Y1HL; Thu, 02
 Oct 2025 16:52:29 +0200
Message-ID: <2f9b3cf4-15f1-4a2a-b0d0-90418f5af8b3@gmx.net>
Date: Thu, 2 Oct 2025 16:52:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Melissa Wen <mwen@igalia.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Phil Elwell <phil@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
 <CGME20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3@eucas1p2.samsung.com>
 <727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
 <2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
 <1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
 <c40880aa-ce14-41bc-a32f-7f46506a8909@gmx.net>
 <ca9605fc-79da-43c1-9146-3638cd5791c4@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <ca9605fc-79da-43c1-9146-3638cd5791c4@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:75VaADtUIMD2c9qFLtO0fs1H9Gd4KKwZI/hUFEPyNCm7+tfTNlu
 pHiW/puNslzGi+N/nQhMPu/7bwbAM4vx+MuAmWIRMy3SpSKJznz6gjus/CwQoa6mbnbQBTF
 hXIuxIeqE3tUACNvpmyUy+Xy6sK6kGdnEdCXbqUXt4UveH5vrqYZhTJQxHRvdAORvG50kQI
 +OU4BJqf34bvZe93hbbBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ialXRbQlC5k=;4tGgWYnLKS+2usPspIksJ9dzTyR
 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

Hi,

Am 01.10.25 um 22:50 schrieb Melissa Wen:
>
>
> On 26/09/2025 07:36, Stefan Wahren wrote:
>> Hi Marek,
>>
>> ....
>> AFAIK the offending clock change isn't in the downstream kernel, so I=
=20
>> like to see the opinion of Mar=C3=ADa and the Raspberry Pi people first=
.
>
> Hi,
>
> I see in the downstream kernel the CLOCK_V3D was removed in favor of=20
> firmware clock:
> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/clk/bcm/clk=
-bcm2835.c#L2076=20
>
>
> Also, v3d in RPi4 is set to use the firmware clock:
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/broadcom=
/bcm2711-rpi.dtsi#L97=20
>
>
> I think v3d clock is missed on boot, but I also think the issue should=
=20
> be solved by setting the v3d firmware clock for Pi3.
> WDYT? Can you check it on your side? Something like:
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi=20
> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> index 8b3c21d9f333..3289cb5dfa8e 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> @@ -14,6 +14,7 @@ &hdmi {
> =C2=A0};
>
> =C2=A0&v3d {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&firmware_clocks 5>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains =3D <&power RPI=
_POWER_DOMAIN_V3D>;
> =C2=A0};
thanks for pointing out. Handling the same clock by clk-raspberrypi and=20
clk-bcm2835 is a very bad idea. But it looks like that's not the only=20
affected clock. I see at least ISP and VEC, which might be affected.

Does anyone know, if the clk-raspberrypi always use a matching clock=20
name in comparison to the clk-bcm2835?
clk-bcm2835 - clk-raspberrypi
BCM2835_CLOCK_V3D equals to RPI_FIRMWARE_V3D_CLK_ID
BCM2835_CLOCK_ISP equals to RPI_FIRMWARE_ISP_CLK_ID
...
Or are there any clocks, which have different names in both drivers but=20
describe the same hardware clock?

Best regards
>
> Best regards,
>
> Melissa
>
>>
>> Currently I know that in the error case the following clocks are=20
>> disabled during boot of Raspberry Pi 3B+:
>> fw-clk-vec
>> fw-clk-isp
>> fw-clk-v3d
>>
>> So it's very likely that the vc4 drivers tries to access the register=
=20
>> after the these clocks has been disabled and then the system freeze.=20
>> The workaround above was just a wild guess, so currently I don't know=
=20
>> why this change avoid the freeze.
>>
>> Best regards
>

