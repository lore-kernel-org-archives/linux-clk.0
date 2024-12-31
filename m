Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C3A1885B8
	for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735639980; cv=none; b=WW55RiA2uIQhHn9QdmqiJweHybuJUcoWfU7TNwur2HsvEaGCroWKnscLrirZFig8TFCM9c/L9rzRy6z5cLapzFi5QlEhUnMRGwPzQqqBOvjPU7juFlrR30F6X0E9mCKy9tALMzuxOlA50KO3NC0yJQiu0cYTcSIWWQr8ja2/h8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735639980; c=relaxed/simple;
	bh=tkkvnWwj+GFCDgATmJYEeoTTKdO7pJMOmgkJKYX64aE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cdaf6L+3wMImjErbpRyDPpmd2Y61FymOs88Wk2kgcbHBB+/a3W3AiEM5xFNwviJ47m62rkAhYg3LWQFx+ATjRYqkZ90mLJtxm09oQa6My30QLVxGmcArBTi1SILa48iYtpANaIWq+HW9v0MGEAjjUXyTZ8uvX5enO3KoC1YJuVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nf6lA7e9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nf6lA7e9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4362f61757fso98912455e9.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735639975; x=1736244775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1kqCd+U8O7FZobcyVAsZc911odO1oOazzFt9bw8n9M=;
        b=Nf6lA7e91f1IU6yjZJCWg2fFbKaNhOgsX7LXnJ9KrqfU6tIHiHGgKdvWbNGrbvaBCy
         a6pBxuozbYInSwO3TSHo+XUSmaiEOA/n9DpmHKaeqfGqRHAw5L2XBimINVU7FZezc5to
         Y9tK6XTaIJUbQubyKQjYHixVKQre6ZYKgMJPmdNdM7mZBVr5ihrkePjvgjpUSIQ6htiU
         OaQ8CKVX7fB+8MI49MJpg3QZySY/0Q0v7sCoyOq7rhymQnHKUxJz+zdEUEuFNmgCgTDv
         gS77Np767QGLcC8HyfqeWN5lnxVoWCC4KZWKBijXtpe+wmFphwv+8C7BzBQz4AAZOPao
         JrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735639975; x=1736244775;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F1kqCd+U8O7FZobcyVAsZc911odO1oOazzFt9bw8n9M=;
        b=dLHQdVU8HFEgtUSuuiIEYN8np6WxcMIGaXZ9h1040M5ANnKE313TRqqrGOM5H2MZ4E
         rArgVyIjQyCTdcbCcyomh5P+wCu3TjwFCW2JYOiT3KQSQTYP8yPGQBrQIT79WF0tSVYq
         WsiE4X+hTdq9oz/rXPAS9gLkaLTc+DlkPHHT1NfzoNEHUCjCxhYhqkErrQBtQdfDDSFo
         pK2GsNIWcWG55No0wPsKsgQ0WC14xS6DfjPZgpRvB0t8suWCxIfwX51LrmP0RiRF6w10
         bkWJFOQKFLpgwDsCEsVXGta54nzqEQ/hkEqUCJmVPj41oz3TycIQE5ynqWr2z2bqSxiU
         RE3A==
X-Gm-Message-State: AOJu0YzJmkM9DClHHvbznlYSF8FywgC/ANABvdl767a06aX3TRNHHzpv
	8PXQUbCrT+Y12bXB96CbzSvAfgJR4P/h2S93ca51lCTetUVo3JCR4OFkOUkakoI=
X-Gm-Gg: ASbGnct816eTqjTYHzHwowwj+7Bf7TU8685wGGmU7OJSo9fXtcJLcvLRgp+k7nLKOfg
	xzCsAwssEsMjtlkyUDBXMnpF0VKgGlMV8SR79/dlRNDPXeXXQp7aGDsej4KGli/mMqWT/1rKFCk
	jAWJM/m7gQN1tma6lIpTZF9tZq1kJu9BpFLQIg0aanuBd0bq5Hc+fv4qkrKqcitANYXpZz81hlL
	mr/36SNJ8+0pxzQHSRxfZfpFy7UlrfV5LYdWst60e+dngCjGF3slzO0wXx85p8B/L4WlAzRPlLL
	W3xlox+lYLT8kVm+8GNtQjFB7QSwHcXCZg==
X-Google-Smtp-Source: AGHT+IGd53Zxzjp2bgS+D1r+/sNWR+RFe9S0YpTXfDkIIyIAO1+91kp3N020/L79EMyd524dX+kKlw==
X-Received: by 2002:a05:600c:1c1a:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-4366854725cmr322428325e9.5.1735639974867;
        Tue, 31 Dec 2024 02:12:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:add3:e25d:7204:9ee5? ([2a01:e0a:982:cbb0:add3:e25d:7204:9ee5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364a376846sm398175215e9.0.2024.12.31.02.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 02:12:54 -0800 (PST)
Message-ID: <20799581-dab2-4cab-acb5-f0b9022e3089@linaro.org>
Date: Tue, 31 Dec 2024 11:12:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: amlogic: a1: fix a typo
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20241231062552.2982266-1-jian.hu@amlogic.com>
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
In-Reply-To: <20241231062552.2982266-1-jian.hu@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/12/2024 07:25, Jian Hu wrote:
> Fix a typo in MODULE_DESCRIPTION for a1 PLL driver, S4 should be A1.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   drivers/clk/meson/a1-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 8e5a42d1afbb..d71109b9bbca 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -356,7 +356,7 @@ static struct platform_driver a1_pll_clkc_driver = {
>   };
>   module_platform_driver(a1_pll_clkc_driver);
>   
> -MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
> +MODULE_DESCRIPTION("Amlogic A1 PLL Clock Controller driver");
>   MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
>   MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
>   MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
