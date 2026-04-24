Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2EB4F5E0
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777048354; cv=none; b=hmDWfUkPIZXL2eQLr1uWOUHso1H/S1re0wf4kw5RnYOYIhyEU3wspC6r4V8jqXZ/3b0ezemv60xMjQsnoaWby5fIiVNWvymCgkQpjgsD7DIPUEOHQKhDmgYh5u/zmv2bbDPUB3EqDwdxYuRJezL0fLVp7RebKsWrATAm5OqX5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777048354; c=relaxed/simple;
	bh=BDEjbVVl1ff5ED1Bk2gEgsnejGfs78MMe9T0/Hg5ck8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZQrIZ1bTHgQKJQqGkkeM5TFLjHlOZ0uxahbJEfW2obQYV2ZYZSydnmfJPagnnQQ+K831b5jBWsFx6SCQofAmevbSlC+30F9N5L1fRlh9m5CHuXDcH/aYKmrig/fgrGytFu7isikLplyfu57nh2Xa0IiI9IMG1qBBNZJf0A317W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Qtoux4nI; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Qtoux4nI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1777048350; x=1777653150; i=wahrenst@gmx.net;
	bh=BDEjbVVl1ff5ED1Bk2gEgsnejGfs78MMe9T0/Hg5ck8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Qtoux4nIvUIzuaZTbR7W4OPb5dUJwOHzNrtg9sB4zIkm8oowuirER9shZFxu09ol
	 cl0GrvMzkIIvfLZ9ISv2LawDWJ3Txn4cXp0754T4g9lgUt2hl5bftqWEqNEw+PimG
	 gNcOAJfSsiqP3nq/vOjG3KQWVfMUGX4T6rrKRbdXP4wSSPFvg3cAt1o2c+3TNsnz7
	 PC1DdXrIz0wBxTwJyKvewUUHQCF//U6ZMxqzvcE14lfgK+O77j6Y923oGoQ/YVo4Z
	 d9yVtrIVilYkb9lmb0jrsa+HsLn1QAJ3vdA8AoHWM6A3CYFEMctWBcXO1pIyDbcQi
	 m9pw2TZXv5WyVmkaMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJZO-1vlue33Igw-00lfQs; Fri, 24
 Apr 2026 18:32:29 +0200
Message-ID: <f62423b3-64ce-407e-b0de-c27713c84bd3@gmx.net>
Date: Fri, 24 Apr 2026 18:32:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260401111416.562279-2-mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <20260401111416.562279-2-mcanal@igalia.com>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bjls0Xgf8My+Rd62Rd8NYM40e7p9b+YL01PlLoAQRN+j4tImchA
 HKYQMMi3PT8E+/tRZHwmOHy2IdTyZZ8UKYNvzYVjrXRXdiVRicLj2AIDU47CWgnw2I1MnL7
 WpQIHJnpHzIgidTQaPFZTli5udXxO03id7LGlZNpFYcM4afT26r0HtWvcAfvxjfNrW5x/17
 Yw3hD4dSzYK/FMP71rGww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9PIQFVN4LCI=;a9u4yxNLOGVv7dd0IETZVnOuJSZ
 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

Am 01.04.26 um 13:13 schrieb Ma=C3=ADra Canal:
> On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
> display driver, which remains active until the vc4 driver loads and
> sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
> lockup happens and the firmware becomes unresponsive, causing a complete
> system lockup.
>
> Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
> clock disablement and remains available until the vc4 driver takes over
> display management.
>
> Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprep=
are callbacks")
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

FWIW:

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

