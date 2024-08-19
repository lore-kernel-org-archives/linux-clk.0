Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7061741F8
	for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724084967; cv=none; b=EPnv/zQXUEdzr7lZ4iJIu5+3CKV5j3TQuhcavbvnhsJOK8e800H2RoL1nsm3bqd0mDAfv1zLh/Qb7TcwqyNHS/kVl7NgYJhKyclQbS3K9zqWrRpGamdh8h4fU2VQwrCz071T/iJ5d24DnH7XTJ7xmV7Eq/MInNJNKq5T2mGMytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724084967; c=relaxed/simple;
	bh=s52OHKtDl3AmAbau02STsx5Dnlsg+8r1eQiVrSVZJ04=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sW5iKcVGddh42nHvFG8i25Fsss2XtWEJkKsn+Erpjhn/80wd9bAo4WSIJA/l89xE1u0lel/5aAzKQYZy3zlY6V6INXAaSaVFntZ0EpXo+DMecIiPORXZzzyaWpUsOXt40X1smmcg1pwAyUHgqQqOIQ9QpKDrPXIMsxrB9s+y8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NGLBvgO5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NGLBvgO5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371aa511609so1415629f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 09:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724084964; x=1724689764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5US2fLlCk1Qa8yNz6skTiBfI5hTwUtCqnfiUSm9ZmH8=;
        b=NGLBvgO5zNenjRHC3tdNLZutCuuywP4GaqtRIxWrnAge5tcui/sJxwiNjHkbwHF0L7
         JjNFc2uftphYpEQ/OaDY73dovMNmyUoKhGBtWrHGgt7Xy8wO1W9r4Qw//mxZMn9l25NB
         /0ljP/sAcTqzuDER0JI/aVbaEzDpt6/iZBJfTeI5KXWuP2eQHPy3atgg0PqVll+MVHzI
         bf32mBLBJa3w2Kq2h4NdzqBIuTVf/tCMQzlEbyuTm0ZaGJAlrMsYMljz+TrM8zwANjI0
         0Ly9EcWgbBu76XRYyqj7cwqO+GBD6/9XpsSj9xvPpWNZmkWBFH55GxM6kWAG2vvPsf+q
         fUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084964; x=1724689764;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5US2fLlCk1Qa8yNz6skTiBfI5hTwUtCqnfiUSm9ZmH8=;
        b=Pl0UPCDhzGcQzNdvZ8vlyj0aZlr9j9s/zPw8Fj0gARXATc5isBpBD9uCU5ph78LAsw
         Xbtr+o874+fr9Go3ryrz3LzTj6NKOr+uci+FoVXxI+hocRAjjFaZHDK+UnItoc+jsFSo
         ENwiWiWmftiVmI/owE6tKDIIUzAUSFA+fnZxbru24PWo/2DyGWKsFbKtFI4g7G6O/lmY
         6ABmB2OxsYYf4QYk+xOM1wWZWZsUoGYJI3c7E1ccUWJ+zBIOMEZYJdZbLBKZWiLR2G0t
         6yDKU9ta3NC+0jPi9n/1aQ/lun+l+seo4ZtJyw9sui2dELm1G9zkYw4q0EyztN96ciNK
         VVgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuWt82iVU6zA2QR53ZnyojMVV4nfUfxA6L+hbJ7XeRjM7ihwleNIpHdz6eedPUs2pUqZMTGtF/UQbMeoL4ASsxTRJ6e/KTzPIm
X-Gm-Message-State: AOJu0YywaNnpK2QmK1Btbgxym3hG5RsATRQ3h1OV6F0lqeObSAJkRhe3
	kJ1w5rbrs9C0Ek/UaQq4FUbbpyL0yp1hXA9/QYFU603isIE/x7mBuKGb6HhaqW0=
X-Google-Smtp-Source: AGHT+IHxfQlj6hZ6qabi9dNFuwSGuRU8pknTTNNcDBW8nTSoVe9O85P9qnLwExtrqcC3QNJEn9lkLA==
X-Received: by 2002:a5d:4cc8:0:b0:371:82e7:6ec0 with SMTP id ffacd0b85a97d-371946d29b5mr7731949f8f.59.1724084963165;
        Mon, 19 Aug 2024 09:29:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898bb588sm10912541f8f.115.2024.08.19.09.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:29:22 -0700 (PDT)
Message-ID: <8cae4536-52ff-4e54-ba15-6376dd9129ca@linaro.org>
Date: Mon, 19 Aug 2024 18:29:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/9] reset: amlogic: use generic data matching function
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-3-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-3-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2024 12:27, Jerome Brunet wrote:
> There is no need to use the DT specific function to get
> matching data, use the generic one instead
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index b47431a21b86..820905779acd 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -128,7 +128,7 @@ static int meson_reset_probe(struct platform_device *pdev)
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	data->param = of_device_get_match_data(dev);
> +	data->param = device_get_match_data(dev);
>   	if (!data->param)
>   		return -ENODEV;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
