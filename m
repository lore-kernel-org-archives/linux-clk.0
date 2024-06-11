Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E0038DC8
	for <linux-clk@vger.kernel.org>; Tue, 11 Jun 2024 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113606; cv=none; b=WSNMWrRoSYc2u8h159FiC9LPGFdY9qWFu9XGaSKh1iBjYJKze3vxLz0vfRFsmWpGzQi1M8u/WqLW3hVVYP1JDG6mx5RG1sa3O+CjF554BCPx2ZTixcEDzvQrB/f3oFu1Fl8+lHorLYzrPhWdG1fXP5YBF6pinwAKCWzWohfG8To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113606; c=relaxed/simple;
	bh=9XuS4BT3rLPNV8n3nvEsATPvLrNr8bw+ABZxqHCMUQg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K66XObw58oy5FYpFRJ+kUx0NhC8OHgdXXmWj/SsA2xMQ4AHi89wdiMjsMZeCeXNpSq/J7QixFAqgOXf45rpxD2ZSfLlX88WZiXA5Ed0aD7sNVD8A+mT0iPTmHPTy5/KqFmsovilB8/Y8GEyErdLGUkUqJH4RisrpBJh0ncnk/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWE9KBuZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWE9KBuZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso3107158e87.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Jun 2024 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718113602; x=1718718402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7v2ngqRjLCLnSvq47G8mmQOiGT4N5EdjUgV3sg8v9E=;
        b=XWE9KBuZ1Ve/3UDiYAgPkYimz01bcGnsFf0n+Q8d61TZviC/EoA7BbDqsVy6uLWA2P
         M+kWrSXQ1LtqqC5+G6KT/ox4c4YUGSG37/3j3PoOsJRCSvMWQP81GJxRTHcrtWBH9LZA
         b6BjRMeWxGF8ERrsRGJuYdRl5CEsq61kj+ocXniUpTqBZcdZ2mMHc3f8b+E2j6WSf8/V
         8SfBKonm6KDp2fzC7D+u7Uy5ehfxtWb/gGMkeKZT7SKnEXOee7EWC2HE4iPmugyI92xl
         mwwDlUp4sXmmms6yJgmVKOOwWj4MTW5GFdbH42kPpxuBMLow0w5iOQ1tjipuBQhNnGU2
         cQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718113602; x=1718718402;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J7v2ngqRjLCLnSvq47G8mmQOiGT4N5EdjUgV3sg8v9E=;
        b=PnPJqNrpvB0mzGYuxcGHiJWFv081d9ZkIt072ocOyn3jyjyN18ZumMA5l85U1fZgcj
         tzPagg9TgMzHRjVgaaJP08S909BphnJKXkkGsDerFw9hyB9DvyZL2qiOtSaB3YiLbC1O
         rl//+TEgHyLbYB7sta/v0vyG+ji2df/ps+jf+AJkSI7Ei1Iaf43IbXyUAPJv4E110aur
         PmMDjEnmbBvVSD/HKC76WR67dnZbxOMfERAJRQen6ULWC/RYFilZDGIso8slZfn5/UlO
         GD4Mp7EFlMZCkplQ94aenPEJnuw/qepu2BpkgfaDumUcspbv6flFwqdXv224i9zDgWPm
         Paww==
X-Forwarded-Encrypted: i=1; AJvYcCXkd6FLFn4cC5AgjFT2FCpaKcu/sQBMBFR9FdZF33BcuO4lkk19pOd4aO9KoKiTUVIxbz7soQnGOYhTZPCqTEMa7mwgIZ5+Ah7E
X-Gm-Message-State: AOJu0YxPwueFCE0CiGlvi7S98uZ7ByD+oyMi80lAX3tsqKK0M0EWy304
	8jznoNGxqO7PbMWcsMpIDGykJ+98AVV05ZUosD2GZEZgZhH2KpoiJresAFYpo+8=
X-Google-Smtp-Source: AGHT+IHlOQv1KyvvMTWmxfewIEq2QaPMgej9qFQuYFwZjJclbqB6ZEjUnfyC5RvP4R/RGoGZgkwn9w==
X-Received: by 2002:a05:6512:15a1:b0:52c:84a2:6e0f with SMTP id 2adb3069b0e04-52c84a26f1dmr6357682e87.15.1718113602243;
        Tue, 11 Jun 2024 06:46:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c? ([2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f254fb3c2sm5217241f8f.49.2024.06.11.06.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 06:46:41 -0700 (PDT)
Message-ID: <4262a31b-0457-43b2-9773-b724e741b3e8@linaro.org>
Date: Tue, 11 Jun 2024 15:46:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: meson: add missing MODULE_DESCRIPTION() macros
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20240611133512.341817-1-jbrunet@baylibre.com>
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
In-Reply-To: <20240611133512.341817-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2024 15:35, Jerome Brunet wrote:
> Add the missing MODULE_DESCRIPTION() in the Amlogic clock modules missing
> it.
> 
> Reported-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Closes: https://lore.kernel.org/linux-clk/964210f1-671f-4ecc-bdb7-3cf53089c327@quicinc.com
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/a1-peripherals.c   | 3 ++-
>   drivers/clk/meson/a1-pll.c           | 3 ++-
>   drivers/clk/meson/axg-aoclk.c        | 3 ++-
>   drivers/clk/meson/axg.c              | 3 ++-
>   drivers/clk/meson/c3-peripherals.c   | 3 ++-
>   drivers/clk/meson/c3-pll.c           | 3 ++-
>   drivers/clk/meson/g12a-aoclk.c       | 3 ++-
>   drivers/clk/meson/g12a.c             | 3 ++-
>   drivers/clk/meson/gxbb-aoclk.c       | 2 ++
>   drivers/clk/meson/gxbb.c             | 3 ++-
>   drivers/clk/meson/meson-aoclk.c      | 2 ++
>   drivers/clk/meson/meson-clkc-utils.c | 1 +
>   drivers/clk/meson/meson-eeclk.c      | 2 ++
>   drivers/clk/meson/s4-peripherals.c   | 3 ++-
>   drivers/clk/meson/s4-pll.c           | 3 ++-
>   15 files changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 621af1e6e4b2..99b5bc450446 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -2240,8 +2240,9 @@ static struct platform_driver a1_periphs_clkc_driver = {
>   		.of_match_table = a1_periphs_clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(a1_periphs_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A1 Peripherals Clock Controller driver");
>   MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
>   MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 90b0aeeb049c..a16e537d139a 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -354,8 +354,9 @@ static struct platform_driver a1_pll_clkc_driver = {
>   		.of_match_table = a1_pll_clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(a1_pll_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
>   MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
>   MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
> index e4d0f46f47f5..fa1dcb7f91e4 100644
> --- a/drivers/clk/meson/axg-aoclk.c
> +++ b/drivers/clk/meson/axg-aoclk.c
> @@ -338,6 +338,7 @@ static struct platform_driver axg_aoclkc_driver = {
>   		.of_match_table = axg_aoclkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(axg_aoclkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic AXG Always-ON Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 52d610110e44..065b5f198297 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -2183,6 +2183,7 @@ static struct platform_driver axg_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(axg_driver);
> +
> +MODULE_DESCRIPTION("Amlogic AXG Main Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index ff17abe6a999..56b33d23c317 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -2359,7 +2359,8 @@ static struct platform_driver c3_peripherals_driver = {
>   		.of_match_table = c3_peripherals_clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(c3_peripherals_driver);
> +
> +MODULE_DESCRIPTION("Amlogic C3 Peripherals Clock Controller driver");
>   MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index 44b20bf4deac..6d5271c61d14 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -740,7 +740,8 @@ static struct platform_driver c3_pll_driver = {
>   		.of_match_table = c3_pll_clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(c3_pll_driver);
> +
> +MODULE_DESCRIPTION("Amlogic C3 PLL Clock Controller driver");
>   MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
> index 58976ed8b92a..a5f4d15d8396 100644
> --- a/drivers/clk/meson/g12a-aoclk.c
> +++ b/drivers/clk/meson/g12a-aoclk.c
> @@ -473,6 +473,7 @@ static struct platform_driver g12a_aoclkc_driver = {
>   		.of_match_table = g12a_aoclkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(g12a_aoclkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic G12A Always-ON Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 56e66ecc306e..4647e84d2502 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -5612,6 +5612,7 @@ static struct platform_driver g12a_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(g12a_driver);
> +
> +MODULE_DESCRIPTION("Amlogic G12/SM1 Main Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
> index dbda563729db..33fafbdf65c4 100644
> --- a/drivers/clk/meson/gxbb-aoclk.c
> +++ b/drivers/clk/meson/gxbb-aoclk.c
> @@ -300,4 +300,6 @@ static struct platform_driver gxbb_aoclkc_driver = {
>   	},
>   };
>   module_platform_driver(gxbb_aoclkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic GXBB Always-ON Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 29507b8c4304..d3175e4335bb 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -3567,6 +3567,7 @@ static struct platform_driver gxbb_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(gxbb_driver);
> +
> +MODULE_DESCRIPTION("Amlogic GXBB Main Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index b8a9d59e6726..2dd064201fae 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -89,4 +89,6 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>   	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
>   }
>   EXPORT_SYMBOL_GPL(meson_aoclkc_probe);
> +
> +MODULE_DESCRIPTION("Amlogic Always-ON Clock Controller helpers");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
> index 7370644e8092..4dd5948b7ae4 100644
> --- a/drivers/clk/meson/meson-clkc-utils.c
> +++ b/drivers/clk/meson/meson-clkc-utils.c
> @@ -22,4 +22,5 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
>   }
>   EXPORT_SYMBOL_GPL(meson_clk_hw_get);
>   
> +MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index 3cbc7f233bba..570992eece86 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -58,4 +58,6 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>   	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
>   }
>   EXPORT_SYMBOL_GPL(meson_eeclkc_probe);
> +
> +MODULE_DESCRIPTION("Amlogic Main Clock Controller Helpers");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 73340c7e815e..130c50554290 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3809,7 +3809,8 @@ static struct platform_driver s4_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(s4_driver);
> +
> +MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
>   MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index 707c107a5291..c2afade24f9f 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -868,7 +868,8 @@ static struct platform_driver s4_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(s4_driver);
> +
> +MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
>   MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>   MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
