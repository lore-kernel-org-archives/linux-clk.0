Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344A51A8402
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690508; cv=none; b=B5U4BF8Xu/0INwfXFqic8hRNTDH556LlC8wd1Bx8Zq1HKQqpArHhPzFUfVHmK+a+vamJKIdnEwLL6pbnoRSC9Aln2On7aN4nzVO1/vywyOv743r5iwGnJCEAjbi+8RJQeNQo69cXjPpRRizrV/m9WxY4qym1/frrcZqblFNKNmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690508; c=relaxed/simple;
	bh=WXWHQ1it3fu+a5/OI8vOfG0zA8RO95s5eyYL3lqaDzs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sK8Yy2hK808Xvx/rrkN63nO4n/kTSFZYu1Uv9MNnI8k2Dv0NV+ROkfXSVrcLdu46wvVljJpDy76KLJsR6rjnlzQLBo8IEVbhmABZn53vp/HyDwn9SUhpOutzHXeLvVBusW3f4z6sCAdefGjdpLxgI+VH6qtzhIGRf0HadETbcGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=usSjCXuK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="usSjCXuK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43622354a3eso11937315e9.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 02:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734690504; x=1735295304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdJ/eOxCZGHcu9pA14lAD6dnUt0v18sp+NWLvry5BiA=;
        b=usSjCXuKLuUPik5owrxST7+ABp5DBcv0CrahtvWdEUdHDRZbu/A/eUHr7/lYx5s+la
         OSc2cYfzGqx/jPeRXcpVbUjsVuafo8j1zRPeKBcHvmR7w5eSyWJreRDJmdWFVyEmzRWe
         aFx4LD/iVQeT5aE4OlBqFUrCZWGjQCtxqGVa49t+mc+4R0ZSSbyePuopiWuecBBxNcoa
         8ZsCwq20B67NVfWMfOqXx/hfpYjFxpeniLtQ6iPLd0bu/r3AmfZeieZDECMO7JQc6QUu
         Anw4JiQush3ocWuF0263u0ogjiMpep71wJBISdLoAxIcKy9Df8QOTBklUD/a2HIborpr
         jWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690504; x=1735295304;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HdJ/eOxCZGHcu9pA14lAD6dnUt0v18sp+NWLvry5BiA=;
        b=HysVrrYhOaelal9nKrA6fJEhyOjFy+fX9txKjwLaPsx0XXDMY64gdLc9CneouMGSyn
         SvTFo7pD8asERiRE+0Rwxu2+1Nw02FbLy1kHRc/3+fOKeRXdANIoi5c8uZqniPcM8yTk
         xD5t555d/mkCEmwQAkDl8baaPpQs7PJEdBzKJL8i9KOwBaSGJCpWAXBb3h0o1edG676A
         5w/JyEF5dA0ODNCbHrEw2fk24cpdTYZeFtwFy+lpS7x7oSkOCo5kdPRI/TbyB3t4UGtZ
         MgBsdmUyH1+IGgQNilnrprkbylJyPyqLKZtvFpkNUAGs058x9A1haYLJtlielNEvqaqT
         AVOw==
X-Forwarded-Encrypted: i=1; AJvYcCVQYW/3sqiA9awwxR3YwYiDq+00ldwJPfYhrw90Dm72XtQj6Hi8kqBPCrbDeK+RG5FzfLp19rtPzNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YydPSxoop4e6OJ0cP97n1tCxcyr2zucOnZbUs1pz5giZFSXwhy/
	DY/hUJW7/LU7iLDp9Sr/uGaN61LP8Ut4WeIjacAJGfsSAs4A1oZ6OA0jsd269+0=
X-Gm-Gg: ASbGncsbELWTaWIJgi6hNqhTAQb3sSLbjPbmYwubY8rHRc/jLcAu9KyDxb6RZKIRuaU
	NN22w11jv6xkz6rK4zf7cDns1WMolLKJc8bElwzrjGJPai0TMep85CTq4UToG+QaCZ48S9Owrgf
	7Kxv1DwMNs5m8qcnwljefd1S9dW+HSo5bapcbflIo0PIWK/I4vo/DVFnt5Kp/JfRdIvKIQUL7FX
	epyj0TYzbKcyKBtHrKo4Ybm2sm/wXiw3FAtNe/qlMkDnZYOBhn5TR9p+4J81DIBq+Tf
X-Google-Smtp-Source: AGHT+IEYzK+j+dey8xf+KzqWLoGsi0Q/WX4eyBcHDbdTKpfLYjVtZFyqCoMyxH7cKJs47i+/dXz29A==
X-Received: by 2002:a05:600c:470b:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-436685482f4mr17044165e9.7.1734690504486;
        Fri, 20 Dec 2024 02:28:24 -0800 (PST)
Received: from [192.168.7.191] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm76509465e9.38.2024.12.20.02.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:28:23 -0800 (PST)
Message-ID: <e74da1e8-d1fe-4937-9f41-63347beb40a2@linaro.org>
Date: Fri, 20 Dec 2024 11:28:22 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] clk: amlogic: gxbb: drop incorrect flag on 32k clock
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
 <20241220-amlogic-clk-gxbb-32k-fixes-v1-1-baca56ecf2db@baylibre.com>
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
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-1-baca56ecf2db@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 11:25, Jerome Brunet wrote:
> gxbb_32k_clk_div sets CLK_DIVIDER_ROUND_CLOSEST in the init_data flag which
> is incorrect. This is field is not where the divider flags belong.
> 
> Thankfully, CLK_DIVIDER_ROUND_CLOSEST maps to bit 4 which is an unused
> clock flag, so there is no unintended consequence to this error.
> 
> Effectively, the clock has been used without CLK_DIVIDER_ROUND_CLOSEST
> so far, so just drop it.
> 
> Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/gxbb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 262c318edbd512239b79e5ad26643ae6c7b0173b..62494cf06e7d775bdb18b2242c3d45bf246bdd0e 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1306,7 +1306,7 @@ static struct clk_regmap gxbb_32k_clk_div = {
>   			&gxbb_32k_clk_sel.hw
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_DIVIDER_ROUND_CLOSEST,
> +		.flags = CLK_SET_RATE_PARENT,
>   	},
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
