Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE564FDA7E;
	Fri, 18 Sep 2026 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738428; cv=none; b=PlpJpo60A3bQ4BKxiRwkDq+1E2fJDEfOTFtG09tBqE/y2Smy9N93bQeGHp6naTXcQ6qEgyEf+Gsq54M+DxAT+Ztzj64nZS1fndDar/RacJp06ATa1rkSEt9RKyV4JtmCYB7fvBJq01LsBOQ8aUYrQw+LbbH2LkpB31AAF6cBzt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738428; c=relaxed/simple;
	bh=OiziA1spnbZfsPjcg0gzjWF1FM6ulXnVMLXRyh+dODE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsuLgja5KBuAFQLo1wgoYIzc1KvyO6bMLpHCg1XTT1KGtO5qI1I1ixppzk64lQWj+ha6SEACY8C4hRhrCUvaRXKunuhKZYCAf4XvwqGLFKKDZ6/kq2gy2BxuIZB/kLU2uO0gkP9qmmHFgvHX7X/Xx3Mh8y03w81xKxsvITN/mGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Rnvar2zG; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Rnvar2zG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1789738417; x=1790343217; i=wahrenst@gmx.net;
	bh=tXRBHeLC/r+GgsNiitJnn+xsQrycBmOOiuCWh22yIQc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Rnvar2zGGTsqVRCx9rAEi2B8vdlItHuy2HwcvNvLHkLUzPATzGGL075nd76G25yn
	 x4CW3QjCPErMikkgC4PKHMv3gLN/DbiZ3kBDHJFxH06dbvwF2tUSIqWA60GeNND/c
	 fIY2ALqRnXM8Rngpxy57G1yUCfeSEh17uBUsUtFfpVFDkiLw4R1ZGJSzZiLCusSOa
	 cXRtbGmYon10K1RMRtItvg8P/rQRwrAfNycBwcIC8XP+gEv7V7p/Eb6Wrcwt2hQlG
	 r6qhZlWzaeDUcNHtFN0Z9Ukhw1GhJ4Z26bfW4x1IT6qO4gKgVg0P0sCt2ovLFQF9K
	 u8w6lMk8Yf7/0pq8WQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKm0-1xRx9P2tZK-00MYpZ; Fri, 18
 Sep 2026 15:33:37 +0200
Message-ID: <02d65334-8b7f-433e-ae2e-5b3e0a2f83ab@gmx.net>
Date: Fri, 18 Sep 2026 15:33:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: raspberrypi: Handle cpufreq device registration
 failure
To: Triet Hoang <triet.hoang.dev@gmail.com>, sboyd@kernel.org
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 mcanal@igalia.com, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
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
In-Reply-To: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fHbXZsHozukZnwd9kuLNoRO5pdkYa8tJsopEyPHgJFYI78oU6Rv
 /wfQJvT5FbHFUd1QzLjPPG5DOZDjvmwR6liFQf0vJEYz6wlwoU4zr4dj1ufCZNwf0+KuB9b
 7g7ueFHS5ZxyB8e8p0AUl8Tf9zD1VCTwieWwoJwFhJfJ+Zu5Sjy/dzv83DNRPCCg752DNo7
 /0lORtboXOFwq5MHsNYcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ylg9ud2GbDk=;NKSQH7MJ0gnyWjlJoyIQuYm+sT+
 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
 FRV+rXWjqwKHn

Hi Triet,

nice catch.

Am 18.09.26 um 06:41 schrieb Triet Hoang:
> Check the return value of platform_device_register_data() when
> registering the raspberrypi-cpufreq device and propagate the error
> if registration fails.
>
> This prevents the clock driver from reporting a successful probe
> when the cpufreq device could not be registered.
>
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Could you please add a Fixes tag?
Also it would be nice, if you can send a patch which also fixes=20
drivers/firmware/raspberrypi.c

Thanks
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index f1a99de6de4f..9882f243d681 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -553,6 +553,8 @@ static int raspberrypi_clk_probe(struct platform_dev=
ice *pdev)
>  =20
>   	rpi->cpufreq =3D platform_device_register_data(dev, "raspberrypi-cpuf=
req",
>   						     -1, NULL, 0);
> +	if (IS_ERR(rpi->cpufreq))
> +		return PTR_ERR(rpi->cpufreq);
>  =20
>   	return 0;
>   }

