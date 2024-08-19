Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7F4F5FB
	for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724085086; cv=none; b=NjKLC4CLd3jhsuqdpiDoa08LaTj1IIu6r5+Tr/8+9R50eQQEqrIQCVHpPBQ8a6oNxjT6mR4F6CfgZa9nu1VS6Xmq015pLhPgawicsrLKqaqPIIgS+WPoZA6F3IPoFPHEOaH/qD7hVzMghpkxCooPMflBdC/ICbvhPCj0/mjAU44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724085086; c=relaxed/simple;
	bh=GfAX+P6Y37VsUQ+ZmZZXbdPLECUQrpLacQI5cjvMcbA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=g43TuhgaFSxyJqgFXtperBgU8C0GGZslvSBsQ9ZRQLLzL2HB7CO5YQHrmP7nfFooZG4TMWr266L1ewBTIZGC1J2T6kXtiuZoS5hQlAHZU/tbEaUTt7BqIXtyUUaVH5dZJFqLCyI02r8cByjea+4Wprv+ZVfKppEO4H0K4dIGL8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBe76Htv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBe76Htv"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-367990aaef3so2815772f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724085083; x=1724689883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1vzoPvkrxUYmA4vkG1jLM7RsiBC+ves8hqeyXsMQo4=;
        b=rBe76HtvhQojGtVKlRf7sfgxqf0v3Jh9wEfI+HyG6Ho3tKGMdanLOvHBryBPBethCQ
         KnYLW0FWKxnpxLoUOqnEr87cthk/Xel1Y8Jfa5aaJ/XE+T76GMK21PukUGa7Jyg6oK0O
         mHxdlex3RcedgQ/BlHbme0jsmYv9mta4YbZ6Raos0ZZ3WgAJCu+vfrTESEMRDDapNLQA
         KqtaCLSNkMRkps1tbXj7mDl0s/c9qme55C5+uOkhfW2n3L0GU1TgupXxz4ZOsjS5BleI
         tNeyob4B0n1KY9kRmi1rp199u1ne+13947ZM5ryrQDcilzDvDXvLxl+b+kh8OR9hWjdb
         gz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085083; x=1724689883;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g1vzoPvkrxUYmA4vkG1jLM7RsiBC+ves8hqeyXsMQo4=;
        b=aH9EEMkj4ZBDNVD9bFvmcLD5OHbCicRl/CjAGYZesadqF0Zwc3iWXb9Sk0cHPbtucd
         maSnANouhLszgBE6C/evv+BL1rDQRCyZo1SjJOOuqa8rQLwHGphKJS3lT/R3dqVU5odj
         EP+HxoaTqxKcmTou8VpmVEZ/Oyi4mguwJnO6u/In5Io5ano4WuW3eFsLg1bI8xHRnHgb
         aDox1qw3UMTB6yeFv2GTmt+DY4OJUJEivZu7pZJCZDgK2oKhaTEzEIDLBDeFUx9jndXZ
         MU+0aPBMrSb1W/UduN9wVVd/ix7wWbkJThwih/J9xXfTL9ZXIYBmlwxmd1pfq+NEP+/U
         cxHw==
X-Forwarded-Encrypted: i=1; AJvYcCUZvCGpnnoIkKM1EJoh9dIw3imUEzwGoPncqKVNWUsNsBMlhPepRS92Y2WjiRhr2xBlWluDlfCKcLJ9VGBcDLOF92tOpjO6wHaQ
X-Gm-Message-State: AOJu0Yzl8qd7PvkhQBE/pX/f1uQAFDaRZ1jrpnXts4U+L2aZdnIiY+cy
	GiJjKWaV3LhBtVVelZx86EyNQsMlGAC8JuKrpKoTNkdeNMTprMKD4FcMOgdATL0=
X-Google-Smtp-Source: AGHT+IEF3YD7UktYIbb2X2tK1RtPMDnoN1l5z4W+kscLDEtPDSFERgrFEcwC+UYnpXBLNPRmVEowLg==
X-Received: by 2002:a05:6000:1112:b0:368:714e:5a5e with SMTP id ffacd0b85a97d-3719431764cmr7859133f8f.2.1724085083063;
        Mon, 19 Aug 2024 09:31:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898ab469sm10965515f8f.100.2024.08.19.09.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:31:22 -0700 (PDT)
Message-ID: <ef485c77-e68b-48b9-9560-159d933bbbc0@linaro.org>
Date: Mon, 19 Aug 2024 18:31:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 7/9] reset: amlogic: move drivers to a dedicated
 directory
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-8-jbrunet@baylibre.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240808102742.4095904-8-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2024 12:27, Jerome Brunet wrote:
> The meson reset driver will be split in two part, one implemeting the ops,
> the other providing the platform driver support. This will be done to
> facilitate the addition of the auxiliary bus support.
> 
> To avoid making a mess in drivers/reset/ while doing so, move the amlogic
> reset drivers to a dedicated directory.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/Kconfig                             | 15 +--------------
>   drivers/reset/Makefile                            |  3 +--
>   drivers/reset/amlogic/Kconfig                     | 13 +++++++++++++
>   drivers/reset/amlogic/Makefile                    |  2 ++
>   .../reset/{ => amlogic}/reset-meson-audio-arb.c   |  0
>   drivers/reset/{ => amlogic}/reset-meson.c         |  0
>   6 files changed, 17 insertions(+), 16 deletions(-)
>   create mode 100644 drivers/reset/amlogic/Kconfig
>   create mode 100644 drivers/reset/amlogic/Makefile
>   rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
>   rename drivers/reset/{ => amlogic}/reset-meson.c (100%)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 67bce340a87e..0c092ae1b411 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -140,20 +140,6 @@ config RESET_MCHP_SPARX5
>   	help
>   	  This driver supports switch core reset for the Microchip Sparx5 SoC.
>   
> -config RESET_MESON
> -	tristate "Meson Reset Driver"
> -	depends on ARCH_MESON || COMPILE_TEST
> -	default ARCH_MESON
> -	help
> -	  This enables the reset driver for Amlogic Meson SoCs.
> -
> -config RESET_MESON_AUDIO_ARB
> -	tristate "Meson Audio Memory Arbiter Reset Driver"
> -	depends on ARCH_MESON || COMPILE_TEST
> -	help
> -	  This enables the reset driver for Audio Memory Arbiter of
> -	  Amlogic's A113 based SoCs
> -
>   config RESET_NPCM
>   	bool "NPCM BMC Reset Driver" if COMPILE_TEST
>   	default ARCH_NPCM
> @@ -343,6 +329,7 @@ config RESET_ZYNQMP
>   	help
>   	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
>   
> +source "drivers/reset/amlogic/Kconfig"
>   source "drivers/reset/starfive/Kconfig"
>   source "drivers/reset/sti/Kconfig"
>   source "drivers/reset/hisilicon/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 27b0bbdfcc04..bf089176c9f4 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-y += core.o
> +obj-y += amlogic/
>   obj-y += hisilicon/
>   obj-y += starfive/
>   obj-y += sti/
> @@ -20,8 +21,6 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
>   obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>   obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>   obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
> -obj-$(CONFIG_RESET_MESON) += reset-meson.o
> -obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>   obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
>   obj-$(CONFIG_RESET_NUVOTON_MA35D1) += reset-ma35d1.o
>   obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
> diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
> new file mode 100644
> index 000000000000..7ed9cf50f038
> --- /dev/null
> +++ b/drivers/reset/amlogic/Kconfig
> @@ -0,0 +1,13 @@
> +config RESET_MESON
> +	tristate "Meson Reset Driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	default ARCH_MESON
> +	help
> +	  This enables the reset driver for Amlogic Meson SoCs.
> +
> +config RESET_MESON_AUDIO_ARB
> +	tristate "Meson Audio Memory Arbiter Reset Driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	help
> +	  This enables the reset driver for Audio Memory Arbiter of
> +	  Amlogic's A113 based SoCs
> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
> new file mode 100644
> index 000000000000..55509fc78513
> --- /dev/null
> +++ b/drivers/reset/amlogic/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_RESET_MESON) += reset-meson.o
> +obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/amlogic/reset-meson-audio-arb.c
> similarity index 100%
> rename from drivers/reset/reset-meson-audio-arb.c
> rename to drivers/reset/amlogic/reset-meson-audio-arb.c
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
> similarity index 100%
> rename from drivers/reset/reset-meson.c
> rename to drivers/reset/amlogic/reset-meson.c

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
