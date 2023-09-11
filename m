Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B49CA0EDB
	for <linux-clk@archiver.kernel.org>; Mon, 11 Sep 2023 22:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355458AbjIKV7n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236073AbjIKJuY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Sep 2023 05:50:24 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D93E4F
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 02:50:19 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40061928e5aso48132115e9.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425818; x=1695030618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWlkPQI1Yw2OHhpnK3b6UUH+RFe3hIOhoTtTQ2y5gKM=;
        b=bxdWuFsCv+gPBYLhDq7IeyMJI3mBwnJE2cot9q471e37BkuoZtHa6NtaxvB5DXvgi6
         IrCKVebgeg8q2sl11CIpWGKNvJYtWNwhRmXqt+3NGY2CAH4hPlgBkLNgSH5UlyDtFnS1
         KOTPvoR3RStGy7+RKKt5Xu/129sM+nBwuWArZhLGcZ9/cviZjTnHIeIq6+BQZ7wkqK3w
         x+uroxGEi2oinrxIVmuIJV3uNBpLcmBM/YkGHAVD+Uci4IgtkUODLU0wPonf7kicbKfX
         +sgQ6DyAJ0w5HWEYLGZvvWrm1moto8I6ZtGtmOCtDtGtzRKx6ukmhVRZEBKgdI05PJwg
         gkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425818; x=1695030618;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cWlkPQI1Yw2OHhpnK3b6UUH+RFe3hIOhoTtTQ2y5gKM=;
        b=YA7x1C2ed4CMoh6adNcDvbRrYvzfAy/euDy10NXcHPDToKlqG5jpjrLa5kMJ7G8uqU
         yAVW5gtLZsU2gQPS0zNCXXkQ9EA40f/wtKjiSyP1xFPu6CXqxYiIZcKRpCSUkLuzfuNU
         pyjLO8qrosCChZpiOtmfl4ccEH1tR5noaivVY8pfccLGu73HOeEk+3p8L1m3UgIQOw2Q
         7lv47wT7zVK9nFJBeiiKb1GUqo3cEr04rw7Fzd9p9Xe/DuymMf2+igqedARsSguFNr1U
         R1JlmcITDu3o55fipKtbzTCPoOdQ2596B2g9jWdDX3riGuRhRUN3Rt3HgWCHgjhhv+2f
         3xgw==
X-Gm-Message-State: AOJu0YyDx4nG4uj7a005JUspxvvSSRiiTaNjhfFwFifhn/16jhzhivmj
        ddgAqW+ZZpAmhgraBhWBWl+miA==
X-Google-Smtp-Source: AGHT+IHI4A4EOkbJF57yZhPXziUj9HK5tk+YTi+LsfYa3ihobo23dDVK8lc8xP8GO52BwhM5r5OH4Q==
X-Received: by 2002:a05:600c:2207:b0:401:b6f6:d90c with SMTP id z7-20020a05600c220700b00401b6f6d90cmr8256405wml.35.1694425817657;
        Mon, 11 Sep 2023 02:50:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8? ([2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c260d00b003fe4ca8decdsm12797392wma.31.2023.09.11.02.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 02:50:17 -0700 (PDT)
Message-ID: <fc85d3e4-1266-4173-a21e-b97cc51622ce@linaro.org>
Date:   Mon, 11 Sep 2023 11:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 00/15] arm64: dts: meson: a1: introduce several
 peripheral IPs
Content-Language: en-US, fr
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, conor+dt@kernel.org
Cc:     kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
        rockosov@gmail.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
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
In-Reply-To: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/08/2023 23:36, Dmitry Rokosov wrote:
> This patch series introduces device tree declarations for various
> peripheral IPs of the A1 SoC family, including clock controllers, EFUSE,
> USB, SPI Flash Controller, SDIO, and UART_AO:
>      - CLK: A1 SoC has four types on the board, namely PLL, Peripherals,
>        CPU, and Audio, but only Amlogic A1 PLL and Peripherals clock
>        controllers are currently supported.
>      - EFUSE: consists of a 4k bit One Time Programmable (OTP) memory
>        divided into 32 128-bit blocks, and data is accessed using the APB
>        bus through software or the Key-ladder integrated with the EFUSE
>        block.
>      - USB: only one USB 2.0 high-speed port is available in the A1 SoC,
>        supporting both HOST and DEVICE modes for OTG.
>      - SPI Flash Controller: 4-bit QPI/SPI NOR Flash or NAND FLASH
>        controller.
>      - SDIO: for WiFi/IEEE802.11 connection.
>      - UART_AO: for Bluetooth connection.
>      - HWRNG: hardware random generator integrated into SoC.
>      - AO SECURE: board info registers.
> 
> The above peripherals are integrated to new AD402 board device tree.
> 
> Changes v2 since v1 at [1]:
>      - reorder meson-a1 dtsi includes to keep them sorted
>      - remove extra empty lines
>      - purge the unnecessary 'okay' status
>      - reorder all device tree nodes (existing and new) sorted by 'reg'
>        values
>      - introduce new saradc definition
>      - add hwrng dts node
>      - provide ao secure dts node with board info registers
>      - include all changes to new AD402 board device tree
>      - add AD402 board to bindings
> 
> Links:
>      [1] https://lore.kernel.org/all/20230607201641.20982-1-ddrokosov@sberdevices.ru/
> 
> Alexey Romanov (3):
>    arm64: dts: meson: a1: enable efuse controller and setup its clk
>    arm64: dts: meson: a1: add hw rng node
>    arm64: dts: meson: a1: add ao secure node
> 
> Dmitry Rokosov (8):
>    arm64: dts: meson: a1: reorder includes to keep them sorted
>    arm64: dts: meson: a1: remove extra empty line before reset node
>    arm64: dts: meson: a1: remove the unnecessary 'okay' status pwrc value
>    arm64: dts: meson: a1: reorder gpio_intc node definition
>    arm64: dts: meson: a1: introduce PLL and Peripherals clk controllers
>    arm64: dts: meson: a1: support USB controller in OTG mode
>    arm64: dts: introduce Amlogic AD402 reference board based on A113L SoC
>    dt-bindings: arm: amlogic: add Amlogic AD402 bindings
> 
> George Stark (1):
>    arm64: dts: meson: a1: add saradc definition
> 
> Jan Dakinevich (1):
>    arm64: dts: meson: a1: add eMMC controller and its pins
> 
> Martin Kurbanov (1):
>    arm64: dts: meson: a1: introduce SPI Flash Controller
> 
> Oleg Lyovin (1):
>    arm64: dts: meson: a1: introduce UART_AO mux definitions
> 
>   .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 145 ++++++++++++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 213 +++++++++++++++++-
>   4 files changed, 348 insertions(+), 12 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
> 

B4 missed it but I applied this patchset into v6.7/arm64-dt.

Thanks,
Neil
