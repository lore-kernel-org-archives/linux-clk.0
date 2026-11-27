Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794935;
	b=5ezEjzPY7MJKhxthXBaXT1+woYbRzsJeFSLHdN0HfODt7BxOMHbBaQ7jOCpPUg2Uz93B
	 By2qZ+VLF+wrP6zUmUUWWV/SGvNDMfC+Fgc0vipNuz8q4G1r5Y/Nbr1PfDQACi3SI3mdf
	 Pn2emkF6OYzFpGnf6hVp1/xJvoXHouMCusrz5ILvzdu2CtC/1WQRAM7fdqzV2YFKCmpci
	 e9llntoBNq3QkK8W4s+Uaxi7SYTMJbx2sbHpXQv2FbwBKV8QL8rWc2ZWCI4wnIsqTCp9k
	 nhMnPhBTscV2aCRyQ7kMSp+Kg13Am6uiuGTnfEShE1N/l3pWD/QpyjmI1r4bXp8/ptw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wS75VZIU/CV7fzps5LoGI33tbGXtO4YqfRFUkbQMcR8=;
	b=Wd7P9TOQlO3PR3jh5MswAbcVcASkDA3mbyegCOcrzzMAx+FR1p/Hkp9vw2dwq7NfxXUE
	 tuwJpf0fzsCYawSBlMbrFeMnMNlS0baDMQ0OwJulSkqqlZaMY07cL5p4F7xj5UxF/MT8w
	 ZTuRbr0iqflfRD5dSDAmkPg4uDXECfG3y9F+kUrzj2woy773wS6d0x2vMusDuQlSv8OlI
	 PJq4A5qjT+koxOeurVhVcvb55fdqD7FSAbTsHLO1mo+jSN3ntb4bQnNp3H8J9Noj8Qemy
	 kibxV8Vp+jAv8miDXRPaWNoqUxo28d19h6tcl1S9D6pTBRouifMwn5XtLjkMspb82Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZG+9J2qo;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2331606A331
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 15:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2331606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZG+9J2qo
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c51bf011392so330735966b.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 07:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795794933; x=1796399733; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wS75VZIU/CV7fzps5LoGI33tbGXtO4YqfRFUkbQMcR8=;
        b=ZG+9J2qoisWPukjhR/qF3725pfQkRWe95jvQ/k/cEMNDjre2ibJtO2dYUd6USozKkn
         ozFY+W2RXyvEF1WMTmhInQidKuVQoO5uDyxOlI/08h+HJCdq60lrTcGORZwrINouNxvG
         DcV39xVz/f2Utty6FFvUDkiPkwgGiNfh2D/y1Lmmbn7JInDxIrvbOjpyBjkOowNoaQnP
         got63kHKqNuJnZUuE3ea7EQJPSWxhZPzMdEkvIkceJ6LzLCXvHPLY0lEtl0wZQtni+im
         w99oYZ10vKGO7khXt0rtQ914JSf35tdZEdpEGhYl7daQrfAJuXddRStflPTylnp9+L6y
         RKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794933; x=1796399733;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wS75VZIU/CV7fzps5LoGI33tbGXtO4YqfRFUkbQMcR8=;
        b=xR+7pbh3x03WylZJONhPo8cIj65OfsOt/nZbcuBs5c80L54idYnB4L7oBb2kCSplFq
         m6Xr9Mj2jj29BIUtfjN+nTT8Rakv4eXY497Q/MYUxj/BPgbxCh9gtNK8U6BLv/a3+/yy
         hDFgY0O9EmL64JlaEeyZJh6xWVTdg4YJXQQAONivD3ozvwNccVz3/uwsK+2bGqhJRaWH
         uZ8qbwUQxO/PjpGGxKURUmlbBKJPS0rEZWMa0geGUQhNGNk9k3e/Cv0fbGdWeSunE4BK
         akVZdjk6LAfjm7OUDK82IUV2C7/Ix79Zh8wvvlvW8BFvUjMuh3yXybE4iJc3KxH3ZdFV
         IzcQ==
X-Forwarded-Encrypted: i=1; AL+hErGQ1VwGp25b0hARV+ZkK7qZV8kEoXZJHiZ3PQlc8sl2Ym31K6+aHWChxpL69QWHZTJeQIs9tTcUhg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WfNg6fMSqCLvKGzkgzKmWSfQsongcu3riQJvYHAPWLwxGM/pa
	s8+zDU0D86e0dNuKSboTqncTT3KN6+1noAT5RW5VR9isSQuUglATdmGmspFBtF5ZPDE=
X-Gm-Gg: AZFdTZddplzFKUKopruR7cYWmuGuijj5zbjgmu3v/loMBRXFMfdd/8FIkPtwQv62ICM
	SJHF/7o3le9KYcHC5RXnekd7DcNWqcQsqPI2DTqudw+w1AoeicXqZQLQWcYb8meALhn/cBK4URr
	z1gjavP0QYPp8AXP5N5dxmM5ZpLG+atU2MSXyLtV5SJ0IfrE/21fo00ICfOW0fS+Us8s71XGvEX
	dGl+LgWh8jKeiK7gxToXcDfN6EaQxAVxGKyDuQ4D1Z45ytEY8Amm/VBS37o1ji6z5nIvJXzoL7u
	s6/yj7alP808Le0mN1jjVamqu///ghuGrQ3cWmPv6x0SwFO6KTGN4ytkJni5fOqnsxQ/C1K18+N
	muMC+1bMcboK9D6ivfoLCe9vC6nhgr6hAwjfKQv08HowydhbqwUtLNXwvc+pLkRA6T92ZYeB7pa
	60dP/q1Tqvee0kO8+kpALO8u58AzLiuSZJh+VQqjCM4+AZQcGDrXmgu41UW9G+8HgpNWeheZrTc
	UyKG1MGsjCNUr1uLeQV77gUpRqeFBvpFIJo/eGsAFScsHQve2wpG/3QYWFw+XzLEjjFZenB4Hom
	6G6RljgnvFQ/yWAQPqOBW9hZfxoUZURJ1L8weatSLExNI+FPKA==
X-Received: by 2002:a17:906:d7a5:b0:c51:249f:7250 with SMTP id a640c23a62f3a-c513ac66e13mr1543392266b.39.1795794933110;
        Fri, 27 Nov 2026 07:55:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm874646666b.35.2026.11.27.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:32 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 2/2] clk: gpio: Add driver for GPIO-signalled
 clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261121-feature-clock-guard-v11-2-00c633a667a2@bruker.com>
References: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
 <20261121-feature-clock-guard-v11-2-00c633a667a2@bruker.com>
Date: Fri, 27 Nov 2026 16:55:28 +0100
Message-Id: <179579492872.2809466.10829283277864895608.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4470; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=S9HRg5M9YhN+qcVMQ4DigH6i7w8pyJamopzDDHtWhu0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcyz/J5rU/43j5+82EQC1R2znPbzvmvflc/iev0TdG0
 J5HwO1jRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACby8R3Df4czQkV+DdnSgf75
 566Yfp0loNz6lz/n8/tm5YIfCllpvIwMx5xkJ/I4zziQct+4ZRcrS6XR3U08+h0t4lfO39ufe4K
 NBQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Some clocks are not under CPU control: they are generated and enabled
> by external hardware, which only reports through a GPIO whether the
> clock is running. There is currently no way to describe such a clock,
> so consumers either initialize too early or rely on ad-hoc delays.
> 
> Add a "gpio-enabled-clock" provider for this case. Its prepare
> callback polls the GPIO until it is asserted or a timeout expires, so
> a consumer's clk_prepare_enable() succeeds only once the clock is
> actually running, and fails otherwise. is_prepared reports the
> current state of the GPIO.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
> Our use case: peripheral clocks generated by FPGA PLLs, with the
> PLL-lock signals routed to GPIOs of the SoC.
> ---
>  drivers/clk/clk-gpio.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 918b2c6444ee..ae6ae8993d76 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
> @@ -15,6 +15,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/err.h>
>  #include <linux/device.h>
> +#include <linux/iopoll.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> @@ -241,6 +242,112 @@ static struct platform_driver gpio_clk_driver = {
>  };
>  builtin_platform_driver(gpio_clk_driver);
>  
> +/**
> + * struct clk_gpio_enabled - gpio enabled clock
> + *
> + * @hw:		handle between common and hardware-specific interfaces
> + * @gpiod:	gpio descriptor
> + * @timeout_us:	timeout that is used to get a GPIO value
> + *
> + * Clock whose status is determined by a GPIO signal.
> + *
> + * Implements .prepare and .is_prepared
> + */
> +struct clk_gpio_enabled {
> +	struct clk_hw hw;
> +	struct gpio_desc *gpiod;
> +	u32 timeout_us;
> +};
> +
> +#define to_clk_gpio_enabled(_hw) container_of(_hw, struct clk_gpio_enabled, hw)
> +#define GPIO_ENABLED_TIMEOUT_MIN 10
> +#define GPIO_ENABLED_TIMEOUT_MAX 1000
> +#define GPIO_ENABLED_TIMEOUT_DEFAULT 10

Those are definitely made up limits carried over from the bindings

I don't think the driver should copy this over. That's one thing that will
eventually get mis-aligned. The driver should just be concerned about what
it can or cannot do.

> +
> +static int clk_gpio_enabled_is_prepared(struct clk_hw *hw)
> +{
> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
> +
> +	return gpiod_get_value_cansleep(clk->gpiod) > 0;
> +}
> +
> +/* The clock cannot be turned on, only waited for. */
> +static int clk_gpio_enabled_prepare(struct clk_hw *hw)
> +{
> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
> +	int value, ret;
> +
> +	ret = readx_poll_timeout(gpiod_get_value_cansleep, clk->gpiod, value,
> +				 value != 0, 10, clk->timeout_us);
> +	if (ret)
> +		return ret;
> +
> +	return value < 0 ? value : 0;
> +}
> +
> +static const struct clk_ops clk_gpio_enabled_ops = {
> +	.prepare =	clk_gpio_enabled_prepare,
> +	.is_prepared =	clk_gpio_enabled_is_prepared,
> +};
> +
> +static int gpio_enabled_clk_driver_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk_gpio_enabled *clk;
> +	const char *clk_name;
> +	const struct clk_parent_data gpio_parent_data[] = {
> +		{ .index = 0 },
> +	};
> +	u32 timeout_us = GPIO_ENABLED_TIMEOUT_DEFAULT;
> +	int ret;
> +
> +	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);

in v7.4-rc2, there was a rework to devm_kzalloc_obj()
please rebase on it when you repost
(but let's wait get a review from the DT guys on the bindings first)

> +	if (!clk)
> +		return -ENOMEM;
> +
> +	clk->gpiod = devm_gpiod_get(dev, "enabled", GPIOD_IN);
> +	if (IS_ERR(clk->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(clk->gpiod),
> +				     "Can't get enabled GPIO property\n");
> +
> +	ret = device_property_read_string(dev, "clock-output-names", &clk_name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing clock-output-names\n");
> +
> +	device_property_read_u32(dev, "poll-timeout-us", &timeout_us);
> +	if (timeout_us < GPIO_ENABLED_TIMEOUT_MIN ||
> +	    timeout_us > GPIO_ENABLED_TIMEOUT_MAX)
> +		return dev_err_probe(dev, -EINVAL,

The range check duplicates the schema bounds;
DT schema validation is the place for it, not the driver

-- 
Jerome

