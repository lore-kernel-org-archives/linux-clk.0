Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5133C001DF
	for <linux-clk@archiver.kernel.org>; Fri, 20 Oct 2023 13:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377212AbjJTN2b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Oct 2023 09:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377210AbjJTN2b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Oct 2023 09:28:31 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587C01A4
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2023 06:28:29 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso6851655e9.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2023 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697808508; x=1698413308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vdxhh///vZzvQ7oX8XKOSjxlMEfs7Z/9qxCOsLOqTwQ=;
        b=GVf9Bbh342tErr3Y3JNVu0vI+ydZOhCzr9xSAB+/qmfYYMdkgtQXt0NnOFD3w0bGF1
         nWJN0+EYBBjrGBfnb9lXH4550kp8pgCrMql3GvcuJUdkAYv5d9yfBDOFMAJiIAE2Jsfc
         uO6PaUMLFBiPjAQdX12JojRdTbLt1kV6te3znqfnvv4mtRV0IQ4akkNp/fVr985CxnjF
         fTxOFupiQSinW7qaOmvFDmZP4aSZAVKUkZX3na7Ck4Ea0D/rllnInbWLv3P6qQyJPnmW
         7quWmwSu+p0RznA8SqawDFGvNmu670dMN2iLHdew/oTLK9AtQePqeYuIq3VNiRsKUhfT
         UT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697808508; x=1698413308;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vdxhh///vZzvQ7oX8XKOSjxlMEfs7Z/9qxCOsLOqTwQ=;
        b=OAmQKbWtawKWxUrRxqa2rh/CL0mKhBSO+/LDlOt3elKlT2HV2/kYh8xt/RR3kXs+LI
         kbD72hwJaz0VlxSAW+gtannPzQaHkQfh68Nu3TO+GYN+iTIp8r0dgmicHR9kQL6CefNh
         zpV9GZlQ6DFuQiLjepsnA49i3/Sl7sIYJO4tmJMu6VnRjq2QUX2QHEBllX2UzCW+q9c1
         5nvcorjNgPkeevQPfSKEUI/UxxoF+EGaPCYvSb+XOoDKHeS5AvYMD6QyWikIgOnqpHYB
         IJ1R2jqCBkemE90LC2fdR4f3GqxZpIgeO0ohFrR4Qymjh+PpjKkIHr/J9hKx5sAz3nya
         G+AQ==
X-Gm-Message-State: AOJu0YyKxRDY60zPEPwHO1YOnPshuwn0ugf30Oe/fLAwAJHkau2fce4T
        8hZM9yJ/ixwHJmWjtbKR8aa3iw==
X-Google-Smtp-Source: AGHT+IG2lmzg3p5eY5UA9sd2Vm4+ihEmK8b1XLm9hykg8suODFazMVrcxgq/0m+UdGZAZqLuoC+ZpA==
X-Received: by 2002:a05:600c:1d08:b0:407:8317:ad81 with SMTP id l8-20020a05600c1d0800b004078317ad81mr1514191wms.1.1697808507673;
        Fri, 20 Oct 2023 06:28:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e74c:7be5:76b9:cb31? ([2a01:e0a:982:cbb0:e74c:7be5:76b9:cb31])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c11cd00b0040770ec2c19sm6963057wmi.10.2023.10.20.06.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 06:28:27 -0700 (PDT)
Message-ID: <938e1b53-8b5a-441e-ab8b-a40cebee926b@linaro.org>
Date:   Fri, 20 Oct 2023 15:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: meson: S4: select CONFIG_COMMON_CLK_MESON_CLKC_UTILS
Content-Language: en-US, fr
To:     Arnd Bergmann <arnd@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, Yu Tu <yu.tu@amlogic.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Jian Hu <jian.hu@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231020132036.1181762-1-arnd@kernel.org>
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
In-Reply-To: <20231020132036.1181762-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/10/2023 15:19, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without this, the newly added driver fails to link:
> 
> aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
> s4-pll.c:(.text+0x13c): undefined reference to `meson_clk_hw_get'
> 
> Fixes: e787c9c55edad ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/clk/meson/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index c5303e4c16043..3c28560b0faba 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -149,6 +149,7 @@ config COMMON_CLK_S4_PLL
>   	tristate "S4 SoC PLL clock controllers support"
>   	depends on ARM64
>   	default y
> +	select COMMON_CLK_MESON_CLKC_UTILS
>   	select COMMON_CLK_MESON_MPLL
>   	select COMMON_CLK_MESON_PLL
>   	select COMMON_CLK_MESON_REGMAP

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
