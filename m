Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C08199947
	for <linux-clk@vger.kernel.org>; Fri, 13 Dec 2024 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086076; cv=none; b=bu7os6R66QnXPsLc10RS23ZVbmCnQ6vgxM3HYMHW2kdgqtYQ2Ga0inqNRjq8hyPl26x/ZuwGBhE2eB/cvPlmdHDS7WCH+sL51bkMv+jCL/K34CgRe+2zQdfZwSQFTpG+UAkvVrxgMrXlYaFkvh6mRfSIHZW9fHGiZsbXdAVJp5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086076; c=relaxed/simple;
	bh=vA7NH8o/F4vK4PbMAOETXVFvHlJYHLaG8zCc6moiqr0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KpvLfqDQeKaDwTHGoXrge+Yiz7S59t06xHx/Q1MNTm0UysHG8dqONyBGSls2IOwdgm84p2tr5yM3AwEg+ab2s9swtuM+xmyFd3tYe8BOsgMaBTouzVwotR4ISK+GByxZAUSI17SyLNPlUyj0l/kR1jibtmLVJH8W6IVWMIMlzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HGUe8sxx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HGUe8sxx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so16744005e9.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Dec 2024 02:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734086073; x=1734690873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WA6drCMppYdVISfpkuD87PDa0h+Hfy91b3d0JmUIEnc=;
        b=HGUe8sxx4NFRCvxg8UEXk5FFaCQfGU59AHpOOVNAlHdzftn483xukzwL6N8pUTkQD0
         Jergi81k4oUzm7I3eiPiPFMsbNCOGxHK31viB2SpZbuWJpykAvxhiwWFswLCTfwyMltB
         70VbVk+e4nVsaeJ7r2e2z85oMHieo8tlZ4Ht8ob5HX1PG29k2Z6CMbTGut0shdLPctva
         4dJsGuhs/0WzP4da2FC9c1QkaniIZlgV7jlVUebKl9tMMrW2pVaA0louugI9aeI8KUfp
         eMjyQ/1fqfKgQTjX0cG5pg9yMyQW4+XVeXtE4Hq59GZXx5VYrrdW/3Hkz9D3opg7swL5
         PCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734086073; x=1734690873;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WA6drCMppYdVISfpkuD87PDa0h+Hfy91b3d0JmUIEnc=;
        b=SP+TPhJoju+eTmnTAZ6ZejIZBp4AV8MS0iasOQHQctKaXNYls7W+spLxFPcdyJtmEB
         gDhgDNJWivRSp7vXMUQsNQNiA8GBDLFddQr4LIb+V8lQi/AkKhKjYZkvwcgQBNa5l2IX
         UaEpDpvU9Gx0TS7r2iRsCK4F5VpLwLH2XwCDH89s8/7L+r1K0nn54J3nxsnD26G1Sx5w
         V1aX7dDda1KDAcFPw4nCcFo1iyFXaEJ1d9JaC/LfxbXwrOlG7umcfd9kNqS8jYYVfZND
         IkhlEhyNv3KuEegkbFu0bMRXhkpl3sH/eNymVVrWoL8NZkkhiKCXy89nwdzRvxLyAy7y
         rLdw==
X-Forwarded-Encrypted: i=1; AJvYcCUc6oesOK6sXqx24R4rsKvcAEIM6szSgyr3pNuA8xidrqTJi5dHmL9d0eOKorRUwnbPDeO+P7nJtow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPnDJcIKygO3zxtyXm6WvBx+U3Wuo3TkAfO9lIb0yRqX5+ZQ5h
	s3IAREFb97FoKzOBgvtDzS+1GIbFEPSjIoAbj4pN5NobGuFC/mnsOXjGftLdeqM=
X-Gm-Gg: ASbGncup6AgNqJm14hyq5S2i3aZENtLjRX+PAvE+5zXPkZ/Fc66TysSmuYw9WOhmewN
	lb1ATbNUD67MS7TIIEjljmJtsvHfseh4eBKqEcdPMBVtRFVZ08MDuxz93qFliYHEgJ/SdRGnZd6
	jtejEQXsme8Pp/ygQfCidLo82nXKn74+8R2c7V9gJXfhyeSNt3MsQa1GYTlw3BpVpnOLRfEPd/v
	Di2uq9IkuflIlDFo9y1pShF/CnGiaV1MDi5ATrjKqu3K1cHS6Do0PnNMFS96YoyRjoJt0cZBbva
	nwazlk/hxmxaRAyCXiYFVaGZd7sBFWYfNQ==
X-Google-Smtp-Source: AGHT+IE8QIvOjYdMGFe/6r6ILHvAeGLSVV3a3eXEBuyeoNQwwo9IPedJWyk14Nak5HhAqjkv4xRTYQ==
X-Received: by 2002:a05:600c:3503:b0:434:ff25:19a0 with SMTP id 5b1f17b1804b1-4362aa94379mr15608885e9.21.1734086073135;
        Fri, 13 Dec 2024 02:34:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70? ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm45453865e9.41.2024.12.13.02.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:34:32 -0800 (PST)
Message-ID: <cbf51c06-2183-4423-ab61-65a93f903a04@linaro.org>
Date: Fri, 13 Dec 2024 11:34:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: amlogic: g12a: fix mmc A peripheral clock
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
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
In-Reply-To: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 11:03, Jerome Brunet wrote:
> The bit index of the peripheral clock for mmc A is wrong
> This was probably not a problem for mmc A as the peripheral is likely left
> enabled by the bootloader.
> 
> No issues has been reported so far but it could be a problem, most likely
> some form of conflict between the ethernet and mmc A clock, breaking
> ethernet on init.
> 
> Use the value provided by the documentation for mmc A before this
> becomes an actual problem.
> 
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/g12a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d3539fe9f7af5538201a78ce560f662ddb3935f2..20be7b037c07535bd2115f6e70404a95a7832756 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4311,7 +4311,7 @@ static MESON_GATE(g12a_spicc_1,			HHI_GCLK_MPEG0,	14);
>   static MESON_GATE(g12a_hiu_reg,			HHI_GCLK_MPEG0,	19);
>   static MESON_GATE(g12a_mipi_dsi_phy,		HHI_GCLK_MPEG0,	20);
>   static MESON_GATE(g12a_assist_misc,		HHI_GCLK_MPEG0,	23);
> -static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	4);
> +static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	24);
>   static MESON_GATE(g12a_emmc_b,			HHI_GCLK_MPEG0,	25);
>   static MESON_GATE(g12a_emmc_c,			HHI_GCLK_MPEG0,	26);
>   static MESON_GATE(g12a_audio_codec,		HHI_GCLK_MPEG0,	28);
> 
> ---
> base-commit: 52fd1709e41d3a85b48bcfe2404a024ebaf30c3b
> change-id: 20241213-amlogic-clk-g12a-mmca-fix-c9ebacf34d9c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
