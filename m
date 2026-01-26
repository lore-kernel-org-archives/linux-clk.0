Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA8289E17
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769458976; cv=none; b=MWhXkZAQvBLD/O7YsvB6aNoWleSfPa9Kx67XJJgjdqDO0dZMUNqMegrM0PeDmRfsiC3eeqMbkVY1RSCIFM8NRqC+9pDFR5WT7zSlvv/pz1wwO1on9oVVPfNiyjjj5QygydduuySsLdWy4xsPb95G6k4FVeP6JQL0+DEnqubIyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769458976; c=relaxed/simple;
	bh=1SCExlYCpCuYbT8hHZZKh1YI0SI1SMBLoiUvBqpFet4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uAW3NCxzsGVZXt+wFpCWtryflJtO3J9DW+iFT0Fmfjf3x6NVCgkaatNgpiib1M3xLJ3PDcYC6MJrfy+tSjLpHEaEOGV4OsP73ZN9EUS7hOzBB3SvHsMjRuH6TOcLLb0Y3TzUSs/ma9AooIQql4X8PMGUSJn0p+yfBSDOn6WA3HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=iKNSgal+; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="iKNSgal+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1769458958; x=1770063758; i=wahrenst@gmx.net;
	bh=uC0H5A1P6AsCcnej8oRvWExzkLHfN2RrJVWbBjKMwps=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iKNSgal+u9EBzsgeJVX6eVk7ozqGapxgMy4BM6jpb9Ty239gOyZJaH4hiknRbvSz
	 Nc39iNRQ1rW63H9njw8EYXiKMA2fSZP4nZDKY0sGTAVwlHTonrP/R5eeTK8omz4I5
	 dq0oJA3yUJQp4jy4jEicLzDvVtBUBwZpn4+Jn7FJwgRcc+HtBSHsxfWu07BQNoBtS
	 sDEuDOG+PWwxC7DgzEOfJkKzUWkreGcy/7y1SQFRc7m62+ZZB9Y8bKmsFOr1isjk/
	 jisDTNtrz2tUZbQYXSCjNhJQBvVzXnOZBsGhGaaaB1qs8pyXhL5mp0veshOiWYbDf
	 rspyf/+JNDlufUZz3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.209.202]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1vR9Im1MrW-00KT2j; Mon, 26
 Jan 2026 21:22:38 +0100
Message-ID: <d473d31e-7dae-46fe-8c5d-80490dba9206@gmx.net>
Date: Mon, 26 Jan 2026 21:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
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
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
 <20260126-v3d-power-management-v4-2-caf2df16d4e2@igalia.com>
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
In-Reply-To: <20260126-v3d-power-management-v4-2-caf2df16d4e2@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v3smQ8rBC9Z5KuIxwiUzYOQSVAQmHEcMDxCuQYeGI5tf80haVdF
 nbJ7/QKk334Bjm6lSyyOdcG+Bl30n0w/shY+5hAwzJuZZB8I6YcSvHbAYWNu8n5M8MDQcVy
 8ACsq+L/x0+vjMy1ZxYljfwHT+LPpFsKFOsF5x6pI5XFIIGCr7XEIud1nVXsTm3bNU48QX7
 /RmeHybR7BPr374Z0/HAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ki/O7D7uZSI=;nsA35ul0wMGwX6caUICW4brTjAO
 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
 kKsQ3tKG8WxH4hgcisvf

Am 26.01.26 um 18:26 schrieb Ma=C3=ADra Canal:
> On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. Document this behavior so that clock
> consumers understand they may need to set the rate to minimum before
> disabling for meaningful power savings.
>
> Suggested-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
Acked-by: Stefan Wahren <wahrenst@gmx.net>

Thanks
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 9783385d5859836898683209e320fcc928dfdc71..2e63121af0900ac9b4874b66=
6cf6d02baa8be11c 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -308,6 +308,12 @@ static void raspberrypi_fw_unprepare(struct clk_hw =
*hw)
>   	u32 state =3D 0;
>   	int ret;
>  =20
> +	/*
> +	 * On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> +	 * actually power off the clock. To achieve meaningful power consumpti=
on
> +	 * reduction, consumers need to set the clock rate to minimum before
> +	 * disabling it.
> +	 */
>   	ret =3D raspberrypi_clock_property(rpi->firmware, data,
>   					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>   	if (ret)
>

