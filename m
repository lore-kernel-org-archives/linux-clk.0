Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3C73EBF31
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769261076; cv=none; b=sp+msjbD7irAUYjVl0OwtIxJvPpPppoQ6OpP5Hgy1p3oSI1xOTKnMJhY42oa9N9ndP4Yb1+m70x40IYjoKeihhrDnPPgOgW5+2ZHzATWR3ErQWmzkHBlXQhYoSUPAEyZ703GxWD73Vr/srxDHrJmkl+VHdNumaTpHA45MmCNoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769261076; c=relaxed/simple;
	bh=DuMl8mcuvngT0omwKO/EuwKbJkNQl6fUAY/OOSkbyR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+wnF6QaRjFUdsTQgTWHFTsCWatzzkROEirP4GLCygRxVELA24iy06KI8++vh1/e75Gm2MSu76xGc60jYgtX4RIof+euDDvnG+txK/RjZH4PaOXfyRpsqClhXu8fprA+hW3SRUjsb6zPvDNuY76KlCrAb5eVDoQjCHtHQZONJXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=kD5LdK3Y; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kD5LdK3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1769261069; x=1769865869; i=wahrenst@gmx.net;
	bh=LyRTE7okq9QLOOTSDvR0cMP+/RA6BDupI57gtIpwVRA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kD5LdK3YouCW0+1zcwddNUg8buOS9BgpXzH+geWjlT8WK4E7L8mB5PZVttncmmXr
	 lQcPjT9QWfvJhRqmPpzhZJDQcHTMNxcd7Zon1RrrCYTg0mZ9/ls1lXdKd3shVBlY9
	 ffAs7BPE7A7/hzlKQaEeKZZ2N/8r8zmGjwoa08sHY3xlzJWaD6ou9QF2l1/G8+UM5
	 GzkEHcXWqcIrNlopTe2YdxTTtKB5DlrOwvB+2AGKAxFileXQucSg0Z/WzyBh8pvuz
	 B531yiw+11PPLcRRLVLVGDaLGgNFUiLy3+vHC+AwTMrEdMC6+bhS3Mdr7gYBGjVhU
	 GutQ1DgWfjykhhRrdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.209.202]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsnF-1vTLI81g2n-00IuJ9; Sat, 24
 Jan 2026 14:24:29 +0100
Message-ID: <a3e4972d-c9d0-4121-9a11-6c6b30b8f798@gmx.net>
Date: Sat, 24 Jan 2026 14:24:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: bcm: rpi: Let V3D consumers manage clock rate
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-1-4e1874e81dd6@igalia.com>
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
In-Reply-To: <20260116-v3d-power-management-v3-1-4e1874e81dd6@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2CoNgnS1QXyNkjmUn48A98WCovsAz9HkyW5Ac9DY3lqHrbJrBKY
 1rp+WzDgDZcjmUpSraU8g09EExwXTIp4bCnDzkfRfn4xyXy6oswf9cEWQcVuIZGaZ8RXPPS
 PH/FnHbxI4guSe9DGWdrilpWu2jSU5s/g50gM1MxZnc+4Q/j0nQ4wQZo16VUbNgkBD2mXyn
 tBjGUa7hTx9i4Bnt9/UTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YeGbiL4MQ+U=;sxvzDXKCJwiRlqCogqkLN0LjMRc
 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

Hi Ma=C3=ADra,

Am 16.01.26 um 21:19 schrieb Ma=C3=ADra Canal:
> Remove the `maximize` infrastructure and don't set `minimize` for the
> V3D clock, giving consumers full control over its rate.
>
> On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power consumption
> reduction, consumers need to set the clock rate to minimum before
> disabling it. Forcing the clock to maximum rate in the clock framework
> prevents this, as consumers don't have any flexibility over the clock
> rate.
not sure, if it's worth to document this important paragraph as a=20
comment in the driver?

Best regards
> This change enables the v3d driver to control the clock rate directly
> in its suspend/resume callbacks.
>
> Fixes: 6526402b9bac ("clk: bcm: rpi: Maximize V3D clock")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 1a9162f0ae31e330c46f6eafdd00350599b0eede..9783385d5859836898683209=
e320fcc928dfdc71 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -68,7 +68,6 @@ struct raspberrypi_clk_variant {
>   	char		*clkdev;
>   	unsigned long	min_rate;
>   	bool		minimize;
> -	bool		maximize;
>   	u32		flags;
>   };
>  =20
> @@ -136,7 +135,6 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	},
>   	[RPI_FIRMWARE_V3D_CLK_ID] =3D {
>   		.export =3D true,
> -		.maximize =3D true,
>   	},
>   	[RPI_FIRMWARE_PIXEL_CLK_ID] =3D {
>   		.export =3D true,
> @@ -387,9 +385,6 @@ static struct clk_hw *raspberrypi_clk_register(struc=
t raspberrypi_clk *rpi,
>   		}
>   	}
>  =20
> -	if (variant->maximize)
> -		variant->min_rate =3D max_rate;
> -
>   	if (variant->min_rate) {
>   		unsigned long rate;
>  =20
>

