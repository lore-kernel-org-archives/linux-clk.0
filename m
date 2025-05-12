Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA00259C96
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038799; cv=none; b=TrfZhjc9UF21RmUzt/ysvS+BNC8vjCQya48h7uXqAKjtY5HLDSdfklJWDIbvTEz5cXCIrCeHIN0ns/zqtcwAXl6pMUiVZ4xVI0WgsoBAkSZ9Z2su0UCKp4Yi+WqzYbdf8ulC6P5nRfqfFkgWsI6FLxLzslqJ3d3bEfS1WSubnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038799; c=relaxed/simple;
	bh=Hik7OtedaFZAkiGMlum5kZXS39nxblKMLG+OT8C0c1U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=US37/YPXxSLyh1BO2xgZvYH9RtFMr/ieiZ69q15u+aM7Ij/zhxUeHU/L0cHFiREFQb+gyLcdAgaJPxfWX5vdj6K5nV3W9FC9A6yQ1ThylexXwjql/uqLEdloMU5/SaEh7Q0Y/xnPg2ANPhPndBU9a/++qVN9AfTc04d09zq5x3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFaFn33M; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFaFn33M"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe574976so29089205e9.1
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747038795; x=1747643595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTzHIKjFiKmyPbI4xGH6KvZ5G+KJhLs/y1YftexbnRA=;
        b=fFaFn33MwB3gI1IuKOXjYBCJzWaTVklB5nqN3D8AfEHBg5ofDxXrv73imhBfNGuKiX
         gTjZN/jgV/zSFyEJdKm08atmU3S5vgLU77HxP/aDqahGOrRH0Pq43Q3eDxL99egwpJoe
         XCodrigCgwSLtshb5QnhXqGYqAWU0dAZ+aB0GuLbPlS9mmBISqKFLlAMrJID2UTJ87pA
         7bgkzT3/NhgMiW2rmg1w0mmj6yeK1ZL1bsya3co/+f0SFY8BPZOFWnzfPqgb34AJv0Ni
         ZfBfEC8EOZwZ6pCiblarXF5dV3+K92prz8t+6ipc2UFAGonjBbaVKu+3lqx/xU/Fi0bO
         yWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038795; x=1747643595;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTzHIKjFiKmyPbI4xGH6KvZ5G+KJhLs/y1YftexbnRA=;
        b=bp75WzJbKZBGNe+F3ba3blL/j2BzPd9DJu9BOsMTw6aNEPg805fzNzU49n6/ikNbof
         qP3UVqgKszxyYPiBIjBfKtD7ovZWKgaRRFpHVe6A+9c74UvjVWYz6rkf9wLboZ86klGu
         oX8i8wCocx2K60XiQPBYavh87GvOafy6lwwkKVkFJdXFOIu1StC4YWDzTvwtfeZTMIFU
         7clU52yoYW/+OHyLtZsiJCpKjguZ18+AeOQiJHerSpBEz5CBpHcYcg0WscW5C1ZPCFPR
         Y6ErafDaNLGouy4abuCd6AHuL3OBdzG+otfZPuDggQkZRQIGuKCsiNmW6W196AZmFmyB
         kczg==
X-Forwarded-Encrypted: i=1; AJvYcCVFgbBJ4/KRYSTxJro6XzhnW40z40+mk6SWmxzQ7SM7LKK9xCyajXHeEYemdE8miXjslXxDsYx036U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUoZ7wWb4TMr12eVmSdrn0tZnXg9M9BLqcuX9/C55sNk69We+p
	tpuy7XHmJm1oiZcDu0pZssqDGt6Z2Yyny5xZb/Pgx2vd4g3+/hAlo1D7SA2qxIDAlQ4CwCAUvu4
	p
X-Gm-Gg: ASbGncu/3q/KCtWz8C1/IbI4hZrxSWGrjzUkIOUckuURj2oQgvLHfj8+wjdqHXb6x9x
	rT3rkzl8ZlHMcXsV+PY3MCGakdatCQTq6SwyjRQJEaZOozKiftEJcN/gCHEs0QWRG++MaTgf3Lb
	SQRR4QS2U8sdxjYX+r6ItgQoBwSUOCYuMVZpijxSoZJPn48I17RXhaHxeF/ckt7QUDsywMlALU0
	KBqQbclHLj4deoLAmtBrs1LFOak9Dt1LZ22ztAHs+OKEFbwqorNNEeMTQKapMHIbiJD+6XEjEw1
	PoImnnWF5iMBC2nzlIWU539eesiad6ciOzVZLUfaj7QRyWnd0IQolDdelzRR7WdHr9H92gn0wsp
	y9oer+BGCUPtBtjzdDizBnvnSuAJS
X-Google-Smtp-Source: AGHT+IFuQDvMvD9YeofWnuHOmfxKE1aBgD/3Qr8iHneAgHf//6SuN6jkgPv2gPV91PBlbLB7la43DA==
X-Received: by 2002:a05:600c:8012:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-442d6d3e6e8mr115012785e9.14.1747038795575;
        Mon, 12 May 2025 01:33:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a88a:91be:2fd8:4f9f? ([2a01:e0a:3d9:2080:a88a:91be:2fd8:4f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm156129235e9.33.2025.05.12.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:33:15 -0700 (PDT)
Message-ID: <9d72fe73-3b71-4f40-a34e-fc7bdb907cc6@linaro.org>
Date: Mon, 12 May 2025 10:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] clk: meson-g12a: fix missing spicc clks to clk_sel
To: Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: stable@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250511173926.1468374-1-da@libre.computer>
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
In-Reply-To: <20250511173926.1468374-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/05/2025 19:39, Da Xue wrote:
> HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.

This sentence can be removed, this patch doesn't change anything in this= regard.

> 
> It is missing fclk_div 2 and gp0_pll which causes the spicc module to
> output the incorrect clocks for spicc sclk at 2.5x the expected rate.

The sentence is not correct, the spicc sclk will be at the freq computed but CCF,
it simply can't achieve the requested rate without the missing parents.

But I'm against adding the GP0 PLL since this PLL is required to drive DSI panels.

And GP0 isn't needed since on G12, the SPICC has the "enhance_clk_div" which should be
able to to reach much more rates with the fclk_divX clocks.

Neil

> 
> Add the missing clocks resolves this.
> 
> Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
> Cc: <stable@vger.kernel.org> # 6.1
> Signed-off-by: Da Xue <da@libre.computer>
> ---
> Changelog:
> 
> v1 -> v2: add Fixes as an older version of the patch was incorrectly sent as v1
> ---
>   drivers/clk/meson/g12a.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4f92b83965d5a..892862bf39996 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
>   	{ .hw = &g12a_clk81.hw },
>   	{ .hw = &g12a_fclk_div4.hw },
>   	{ .hw = &g12a_fclk_div3.hw },
> +	{ .hw = &g12a_fclk_div2.hw },
>   	{ .hw = &g12a_fclk_div5.hw },
>   	{ .hw = &g12a_fclk_div7.hw },
> +	{ .hw = &g12a_gp0_pll.hw, },
>   };
>   
>   static struct clk_regmap g12a_spicc0_sclk_sel = {

