Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984434;
	b=i3GBUr9GQSWT8pWVSLitIUiN5Na5Mg244PbelthTpgLknD/7H1DS8ikg53oZrs8bYh/i
	 u6F0i/wQ4VFknYuqX8j4tGcu9InXw+IXmFRXlYcfVXAQziWDtjhRtZI8ri/Fhlp5sGupi
	 9XVLzqS9Wr2s6SzhdKQ4cxsM85yfOfm32PPan7x+r+XFouph+HkK8/UOmDwTnkHjrUxQD
	 vNCghZn05li4W5L7n/rfHCXyxTiBrl3WRM94LfuKOOwTLaOuPx5JsLDItiQSzyi9OmvJy
	 OspeWADdazyLL0Hr/22rk/eJZs/evRowYaotHpk6Iql8w8Szb3Nk8R1AHQgUoT1AHng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
	b=xo0/NkNBHTaciyrclkXz4SLQdFDPGyuwPrm4dv4iCmb7Vmnm2vQ88HDkS3u1Vk8eDfng
	 NVtJ5FsaCGclQur+NLR+goJK73o+BYonU96E0hjtl8X5n/Yb/U4ypujIJKZwOurZvqUJK
	 l07pzzvkvgBgg8KnxJErRpEUjWnoQxfGavYW3R+/KmtBprojV4kv0NGe4kFp1mAP3rvij
	 P1eS1ps0CLJ3aXSl4kSYLJVrqPvbei0dRN1rwhSXgm2LYZ+v35FpO8O8KpLLClHboqWri
	 YM04++W7TEJSTDGzzXpQr+Tf1izMs6Gpmxrb9j77h3CUG6NQIG3AfyUauaXHqdphWWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRPFEpLM;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0E606A331
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 17:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD0E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRPFEpLM
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e10a70540so598165f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 09:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984427; x=1794589227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
        b=MRPFEpLMHBiOhevWNNFBWNmChmSf9amwu9QOajBFX+0euSNnRYDCXlICEjk/SuLhs3
         NFK0ucD7IEzaiwwvD/bsceRIiiqnY2kquXNffVws1stKsQzqZ3CtCWQqiRg6VfazVwMH
         ZNe7sPwfjBakP8bL4YWXAoqj3lCYXv8+ZMeAXUkp9uLUyfCO8Akh8ZnLtaN0Ldj/lXkx
         AktNUSoS9425652OCNe6JlohitzRbL/4fjeLLtVREhFVQmMl4je7LqUdfd6QoMD/tkJt
         bHuQeK3c0DbcoU7MjsDywS6xGrfQzh2PVe/OlIWsbjmVaqUtOXi2v4/2NukMjJwKW6Ch
         EAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984427; x=1794589227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
        b=YpHQl82GnI0Ibncxk14QazT4TsxVMVtvoYk3UmgCxFq5dWBcPqnyfgJKc+TyulgwfO
         hrZfxU3on2dg9UaSC5PKR2puD3Kyw2PkH4nOBusY2vQEc5wUnLwKfKgRBzBI8lY5r4hr
         jCPUbLZGs0Tc6V35gKyXueSMHu3GRH4kpmsWdzlQVbFYR+WNG82nhITCC9cw8kndRnx5
         ivQFbWDWUA/o9ygk9kdOP92BWSo3OBViYxCquNrxGDCJ2siCBykaaeLMe8uS2jwtxoCV
         vZcXia8v+FrsPerl3JK1VcgQ8k6cV10lPcsLcFhUqKnHvqOzQVB0BUUPgcaDljs7whYx
         NaEA==
X-Forwarded-Encrypted: i=1; AL+hErGnDA0ehLcdNNm7Va2EQohGrusx+TBIPSx69I7w6FvPo76Mv+CTWeQqRusiVJn7MSCt252psFdVqCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4sS9XTo4fPVmfVWaU1k3oBbUnPBm1jc5TZ8DpF/WY7DontBti
	WgsT04+DjQbsWDXRVpt8OphQqc2lj3Rvr1WwLjNOlQejE3oENYNID/9HuTo3zz4Xx1o=
X-Gm-Gg: AYBFou3eV1j3K/+IfPCoFfLqslnWOlnGAeMsDnDQk4fNwPZinr/u4j+y5pjYpmNIGvW
	FKX+Z2fa5FF3U9DxLJqqauuD5knbu/kdcxdfub/FdnB0iRkM/w6vGI94NJvoRl1OiSSFR4kjhlB
	SGMVc6YQcp60zHh1UFk6NO6Tn896wgP45WW+gmSkLmGWQxEBG14oRcu9sT2lB8RdKBWAoxE9mgO
	Wu9f8/dhP99fxKwfvYXcwaDkqiCZrC9G3smbmvUqUhJ+I1ZXbwa8oGA9LIbmZrSSVoY7EaaRdYF
	3ft3Gtr9p71ANtsgjTPdq3IMcUicW8HUxCO4A7G0kXw40H2iX8WcjrrIawXmqGtgHpHA/Y3uVHc
	szCxTGG93GXTXkOkOfcE6Ufz8RlxlqaLKK+owreM+itpNjT3GajeTGjZS2fOz5rTElEJHPIOuSd
	XvL+SFdiQMJYrT+gpXXSMsYYkgnyrlo6wtIKMqJfez5912OV8EbCAmKRgT1L2mBSBZ9yR6MBTq8
	opQ+9sIO86aneqxRHaFZkGyRqV8I93g6KeI+CvnhN/9v1mjieWE07zTCwCK64xzXJnKe1rjGhTz
	YoqapGbb/MUoxMpY/tVK3EkryX9dMTTegQ==
X-Received: by 2002:a05:6000:41c2:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-492c53e3120mr4511725f8f.49.1793984426953;
        Fri, 06 Nov 2026 09:00:26 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-492d8472969sm4866752f8f.58.2026.11.06.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:00:26 -0800 (PST)
Date: Fri, 6 Nov 2026 18:00:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
Message-ID: <au4Hc7LAXH-ujDPj@monoceros>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4rhlzyxszxfhcxv"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>


--t4rhlzyxszxfhcxv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:21:01AM -0500, Joseph Telaak wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

> +static const struct of_device_id sf19a2890_periphcrm_dt_ids[] = {
> +	{ .compatible = "siflower,sf19a2890-gmac-crm", .data = &sf19a2890_gmac_crm },
> +	{ .compatible = "siflower,sf19a2890-gpio-crm", .data = &sf19a2890_gpio_crm },
> +	{ .compatible = "siflower,sf19a2890-i2c-crm", .data = &sf19a2890_i2c0_crm },
> +	{ .compatible = "siflower,sf19a2890-pwm-crm", .data = &sf19a2890_pwm_crm },
> +	{ .compatible = "siflower,sf19a2890-rf-crm", .data = &sf19a2890_rf_crm },
> +	{ .compatible = "siflower,sf19a2890-spi-crm", .data = &sf19a2890_spi_crm },
> +	{ .compatible = "siflower,sf19a2890-timer-crm", .data = &sf19a2890_timer_crm },
> +	{ .compatible = "siflower,sf19a2890-uart-crm", .data = &sf19a2890_uart_crm },
> +	{ .compatible = "siflower,sf19a2890-usb-crm", .data = &sf19a2890_usb_crm },
> +	{ .compatible = "siflower,sf19a2890-wdt-crm", .data = &sf19a2890_wdt_crm },
> +	{ .compatible = "siflower,sf19a2890-wlan24-crm", .data = &sf19a2890_wlan24_crm },
> +	{ .compatible = "siflower,sf19a2890-wlan5-crm", .data = &sf19a2890_wlan5_crm },
> +	{ /* sentinel */ },

Please drop the trailing , after the list terminator.

> +};
> +
> +static struct platform_driver sf19a2890_periphcrm_driver = {
> +	.probe	= sf19a2890_periphcrm_probe,
> +	.driver = {
> +		.name		= "sf19a2890-periph-crm",
> +		.of_match_table	= sf19a2890_periphcrm_dt_ids,
> +	},
> +};
> +builtin_platform_driver(sf19a2890_periphcrm_driver);

--t4rhlzyxszxfhcxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB6YACgkQj4D7WH0S
/k7+kQf7Bfwba+pB8VQAImJsoI9nkvjYio2wmtjnDf+tDu84xWgQjB1NbQpNvz5V
3y7UDyK2deoH4CY8KBCBTRT7cDaxITXkF1a0HhwFJjQzDdqTdHEY4A8Y2+kwtaFE
XtG+i/38jjNC4FlZcl5XsIWsdXDJdmBVAQKyUIcufiTuxj7l++dfH+kC6Ex1M06H
ScbOsMnUQvQkOWUgbwbEI3sNWya0aIIYp10+UtnzXQTaMbZhUSviiwshdzpvF+We
ph8X0cK0eb1Xzob0dAIaL/GXyoeOmriWS7iJsLMed0+8cgUxySH9/PS2BUvFBWRt
gsqT7bKiL8d2E9MAbWotEFMpAA8JNw==
=PDSn
-----END PGP SIGNATURE-----

--t4rhlzyxszxfhcxv--
