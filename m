Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2Wa81mM"
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FD5D7
	for <linux-clk@vger.kernel.org>; Mon,  4 Dec 2023 23:57:59 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40bd5ea84d6so16841565e9.1
        for <linux-clk@vger.kernel.org>; Mon, 04 Dec 2023 23:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701763077; x=1702367877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yZ/VcoVbuPE7IS/Acx3sYefHrc8lhnBqcqEkq1L8A0=;
        b=G2Wa81mMkzf/yP9Qgq0eD20rpAgwL5hGf2uyTt5E+VhhXFusagi8+6JI3xa+u8ZtK9
         2BQOPhVNsct27I45W78sSd9AyPegOxQeyNATJpS58IfGSs1rGMw9K3NSaXPRXZFHqKE9
         BVqkp0GTTgc6ynlteiq52oseEjTmTZoqbE8W09Uj4ofwbw9uIdi+BBv9Zmd98nEtOf+J
         xBMy6XWWRJ0bJwLawztOlTKpxq9vDcD/z8CxN3kDZsGwUJhHVqovV0CsORuXIrkUvCuJ
         zuqWpls5sNhjQQJhHT58pZEYo429OFUODkh3vNg6CugeJKV7u5j/IcfUI9zNL3rn7Ugd
         Iz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701763077; x=1702367877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6yZ/VcoVbuPE7IS/Acx3sYefHrc8lhnBqcqEkq1L8A0=;
        b=sJPbAsRk3Ts6hXZfya457Ve5DnO7o7f/oVjlM3jWqPZmYp65mggI3tF/3i3b4cXP4f
         Dp5W53A/c5//deEwE2ZuEQBd0KcUdIHURqnlTn5njAU53ZGJP06PMkw6GZ9KbPQ5aq0r
         W9Dzah66CdK8G9dyu56kZXiUS546b0vGre0Q+JzE1BsRhn+smhagJFYwRV03VsFDrVoJ
         CRa333xeTJ7Af5x0RX95l69RRDUZh7dpWJAXOxEQAU2rAMctph9Htn7m0SVbtc7F9TqL
         p7E057LqCkwrJL/P9HCCMV0uNCD2AGYKCjgYQmUGLj3SSSXJBHx9Vqevjd4659KVUF+V
         rMKA==
X-Gm-Message-State: AOJu0Yxal5TUkmg/aLjY5ZeD7eeJodYa3lrKA/UQCCH0wNC3vBUQPP+V
	eVnZCUYN+laGOXhs+oHtXLXa1g==
X-Google-Smtp-Source: AGHT+IGMUPO9d6IrvhXxXUIgi62nJFBXjjWYh5z/w4DQ0n2j8KHJb9zPfh20zYGiTu/FmyDUv0/+Xw==
X-Received: by 2002:a05:600c:2e51:b0:40b:5e4a:2351 with SMTP id q17-20020a05600c2e5100b0040b5e4a2351mr264525wmf.83.1701763077338;
        Mon, 04 Dec 2023 23:57:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb? ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
        by smtp.gmail.com with ESMTPSA id fm19-20020a05600c0c1300b004060f0a0fd5sm17803498wmb.13.2023.12.04.23.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 23:57:56 -0800 (PST)
Message-ID: <8f0f5965-2c41-414e-84ba-95da76082234@linaro.org>
Date: Tue, 5 Dec 2023 08:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 02/10] drm/panel: himax-hx8394: Drop shutdown logic
Content-Language: en-US, fr
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, javierm@redhat.com, heiko@sntech.de,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
 <20231204185719.569021-3-macroalpha82@gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20231204185719.569021-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2023 19:57, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The driver shutdown is duplicate as it calls drm_unprepare and
> drm_disable which are called anyway when associated drivers are
> shutdown/removed.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8394.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index 3823ff388b96..d8e590d5e1da 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -390,27 +390,11 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
>   	return 0;
>   }
>   
> -static void hx8394_shutdown(struct mipi_dsi_device *dsi)
> -{
> -	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
> -	int ret;
> -
> -	ret = drm_panel_disable(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
> -
> -	ret = drm_panel_unprepare(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
> -}
> -
>   static void hx8394_remove(struct mipi_dsi_device *dsi)
>   {
>   	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
>   	int ret;
>   
> -	hx8394_shutdown(dsi);
> -
>   	ret = mipi_dsi_detach(dsi);
>   	if (ret < 0)
>   		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> @@ -427,7 +411,6 @@ MODULE_DEVICE_TABLE(of, hx8394_of_match);
>   static struct mipi_dsi_driver hx8394_driver = {
>   	.probe	= hx8394_probe,
>   	.remove = hx8394_remove,
> -	.shutdown = hx8394_shutdown,
>   	.driver = {
>   		.name = DRV_NAME,
>   		.of_match_table = hx8394_of_match,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
