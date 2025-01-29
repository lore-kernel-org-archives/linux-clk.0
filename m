Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5761B424E
	for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166133; cv=none; b=g0a4BD9pXFD5QKXBAKce5ATLd8byNyHY3Dwl9NrJNdjex6vyOZR7LJehZ23q0Bne1YWwmKWvALTZr/ADhfZFS2b9VXOoFTbNvb8WBKIaTSGP8TXI02JvTU2UFrcvtLQxDpETxoVCaCGkXElpgrgJFioQeVTfkwRGVB/N3i8RExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166133; c=relaxed/simple;
	bh=s+OWfgaSGm/+RPUDXXe0w2gMZBjSWPoKkfSbsD0c8f0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=AW1plR1UsViuJvzVkzbt6AZL2i8mSi5BR37YHioYig1BYuDSR+w8pQ7Z2jXt37d8Fwkv5V9P+lovmCsJylPZfSesRg7OaerqPYnf9OlUVwuWUXJ1BrBruU5NJmN5jQu3XREiIrAyCLy0HuHJbcUZSSPCEZHM/DfYeRPwaLqAcfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SB0+6mVL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SB0+6mVL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283dedso74060305e9.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 07:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738166130; x=1738770930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yZWN8mtPuEHoCdaoLKAs730omUBu/4wCEX0PGdNSj8=;
        b=SB0+6mVLrnvUntUi0iRYca4Gw6e8sGPZkzfl/Ukse9MUWO7ZmmF1iQYq/JdwGy/Fu/
         xGlMWwjyAmnXVoYHpkWb9x4/PPqwsdBWdAl4+uIGYRrj1Ps5EqXIzJ8yQ8kjDnyIMpK2
         7RJtmIPmhlzKyHZHtu1x6zo5KweE7ftOepkTx982/6sw8Ge1uhPdpVB4EpKozv++evrz
         ecze1q4l2242eHqUx6XVBEojU6QKku8SGYZYIYimpVHJZweRugk+9grFTrt6beNHvOQk
         cpoAvBXyRQf0SS/9Ae8gqbsh+oEWdK2d79NaaBCiONlBpaVuzaw2+QWhf5sikOinj02b
         wkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166130; x=1738770930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2yZWN8mtPuEHoCdaoLKAs730omUBu/4wCEX0PGdNSj8=;
        b=Mfg+KOzHTypXOan38UnPHD4aO8TfNKg9rHDBVTHxrHbzINX9UmNi0UDBIbqFFqnUkh
         08CJgUvYKx9sSSBj539LLzjg6zts+Ej/Nf6tSrOl3E0cKpSBoUo6vFcmQq5fIXQ+GFu1
         NP161OZWKSmZNOGdnHArDK2xMAEXOIRiqwDN6IXk2DkT065RmusM+UX4kNUyG208emTW
         WvZjztTkh8H/T6zg99msSFB1X26+95sj5G8xwWBeWhTmZkft4uhNbP2DQ3YKCc8raX3Y
         CJpefXESNX+G1MzcukSz/YdW7oDu0gIkZyg1WlE2xHfa1yZGsdmIpplj84NY0WItm+Ew
         ynkw==
X-Forwarded-Encrypted: i=1; AJvYcCXKI2eCxo9RMSVpkPzpWhDK6krG+PC7tRVHDcMaD+ucOdrS3/gYEXO4dwxQoyGGF+hXdtUxj0qSGMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2PtBT3qcA2LiDURXcT7bWTg+S3V+RjEY1B2CSqjM+Ul+aFFi2
	d1O52sVsSR80wJn75cm35RrkHgDM72OKoOwvmJRLd1ZduSzNzs3xVNgJ//nnqxU=
X-Gm-Gg: ASbGnct5shJZmvJABM7rIyPv4UemoHx/CpsW56i2zD4XZUwyGHXuNvl9nu9XccgIV2m
	BDPe0Uk2dxGzn05VDk37uuhHNza5rcW778ZVB0sjAjCqSai0XSToyywgVjvt5vBH1g0f+H6z5A/
	xsFUa1/kMTUQOwnzVKHSHouxclGRZtuqnCe2glgUoHbYPepkJX6MmZAKf6VjP/E8ZF9dZ4lhTJ/
	mCAyjHgJgv9sNe8oFheQCVM2XIfbH9qa0BcZsz5XMl3nsOfDVh8wGHtEZN+ZAb+wED5S0QlFTRl
	1WB2OKFgLpDvuBIRMCKjy0ClrsV8jVM07AA00F4TUxi944h/Q9X5KV9hHyFnPrv7fYjX
X-Google-Smtp-Source: AGHT+IGT0WVwTcIw3LywNfSFnLHYETFde0wR5SLZpkmojlTofw80UCCkaIbOmJwajRQ72JiyBUyPQQ==
X-Received: by 2002:a05:600c:4e87:b0:435:1b:65ee with SMTP id 5b1f17b1804b1-438dc40d6cemr29865355e9.24.1738166130108;
        Wed, 29 Jan 2025 07:55:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc23c7csm27102485e9.11.2025.01.29.07.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 07:55:29 -0800 (PST)
Message-ID: <802dff81-6fe3-41d4-a470-ad35a09ce191@linaro.org>
Date: Wed, 29 Jan 2025 16:55:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect
 CLK_SET_RATE_PARENT on byte intf parent
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/2025 16:45, Krzysztof Kozlowski wrote:
> The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
> the rates, because this messes up entire clock hierarchy when setting
> clock rates in MSM DSI driver.
> 
> The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
> via dev_pm_opp_set_rate() on byte clock and then sets individual clock
> rates, like pixel and byte_intf clocks, to proper frequencies.  Having
> CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
> clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
> and align with SM8550 and SM8650.
> 
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Fix for v6.14-rcX.
> ---
>   drivers/clk/qcom/dispcc-sm8750.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> index 0358dff91da5..e9bca179998b 100644
> --- a/drivers/clk/qcom/dispcc-sm8750.c
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -827,7 +827,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>   			&disp_cc_mdss_byte0_clk_src.clkr.hw,
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_regmap_div_ops,
>   	},
>   };
> @@ -842,7 +841,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
>   			&disp_cc_mdss_byte1_clk_src.clkr.hw,
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_regmap_div_ops,
>   	},
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
