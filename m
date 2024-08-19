Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695D177982
	for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724085071; cv=none; b=GAJx/lc11VJhRu1X2Lif8RHQ19G2/lwu7ynTaYTw2sgfGa+MJVSPT6qmB/gS0XLzTIH6++FUmqbfvIMeVkpRiE6YkE4cs8JBk5JbJj3vxBJQCqNTt45TaVABfAbioCsHfcefu7eW9RKpHTmpOzy+1gqqMBJ0KnVCRxcIBwixhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724085071; c=relaxed/simple;
	bh=pAmWnGQtETQQM2Ld0UueepQIA8pVvp9HMSzZ1wpEfdE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uyJAh/sEZP378VabjwGhkxcq69D2OEn6CtAYWc8LQKN9xmhBc66kJSW5ElbNUT/v13+Sv3EVXSURT4OtpQsJqod5XK1fTghC/8FnyJbFDeuiHACD4P6mqvBZUz8SbU3hykpc7hUtLI0/xw/SEZr+UoLmH4uyw/FdlDD2oDkWga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGIWsXID; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGIWsXID"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42809d6e719so38061265e9.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724085067; x=1724689867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8pX4yn6CKbjQ8Lpth791/scSYxiykMIBRADHew9tCc=;
        b=yGIWsXIDgMGtKSwaaVn4CH1eeEifhhwtyzqh8VwurhlptxiaE3CiyppgWvvwtJQJqx
         fLK9TDgMD8i7ZZWE6A/0CagvDMZyLQfvsfRAzBNQhpwU0yPkfpQBQ+k/IIrwNQHjYcgI
         a0b0s6Vep+csVQ3E/xW8npLYr4mv0I+nF0IvH99AcZh5JKAdjOejfrMWnN0Ln5V4N3so
         y5nPxMtUQCSyItXnE22hT7CNOKV9R9L/vaWA48eBru8cWH/R5TF9LLDP8yq+RVrwMEE5
         ezT4c7vYLjf95OHcy9UBg5tgW68s+Yg40bwpvnJxp3Y40VP+fA6cJBwc8r2COCvZ0Xlh
         kWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085067; x=1724689867;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x8pX4yn6CKbjQ8Lpth791/scSYxiykMIBRADHew9tCc=;
        b=S5qr024G38NuoroU/bPwFRQwN/BAF69kfklJmosiUZmzdybv907yRcNklGNgo+iLRl
         S4ACgR8ikA/hcqfxC2Q5VKuq3eSNSDxu80+7UC4hcyOOyHMPfZWxN7lI1GpNGXtINdwW
         2QxWVXr0afsxgEz1UyBKBa+08Q/wRiO6VyIGfBV5/LoAXGIC89qZGeMqsl985MOE+NeO
         qKZkecSZmeg4R18TFNQwgJvAL0BywU/nAyHMexuK9euqc75l/2gECS2+3iU1VOuMcx8S
         A1c2vvj3EdiMMIf510DSl7SFbB2hmX0Rx1lbVvI99zQhbaViOu+xtrWeDb4ECeKH+8cT
         4jhA==
X-Forwarded-Encrypted: i=1; AJvYcCV1iyf+IvDcfdnWBC/zKtGKievPTTs/nuPSZZjimo3sL3Hk0+WnUqgQjpnnN8RoFn76P+4ZRqEs8g735SwNR9U4HGiEY4uGlXEq
X-Gm-Message-State: AOJu0YxwKEyV80/sMSIbfZ1z5JqIrKhpdu0W+UrGdO7KgwqUB6ucQxtc
	tV+etz9BbNN+3R6g/dKaTYeonip5OZk3V5Kkzn2xTDn6HEQ29F1DGGdM7hq/aUw=
X-Google-Smtp-Source: AGHT+IFV319GEVIPH1Hqpy9Bs8aSzc+KkvX3+H7JeA5+3QCFBV8LccuOw6oaMarldM0pUiXFW70NMw==
X-Received: by 2002:a05:600c:45d3:b0:428:2e9:65a9 with SMTP id 5b1f17b1804b1-42aa82651f1mr48240035e9.28.1724085067184;
        Mon, 19 Aug 2024 09:31:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed65079fsm114611955e9.16.2024.08.19.09.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:31:06 -0700 (PDT)
Message-ID: <0bbbf439-9722-4140-8044-78b71b2f23af@linaro.org>
Date: Mon, 19 Aug 2024 18:31:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 6/9] reset: amlogic: add reset status support
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-7-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-7-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2024 12:27, Jerome Brunet wrote:
> Add a callback to check the status of the level reset, as done in
> the reset driver of the audio clock controller.
> 
> This is done keep the functionality when the audio reset controller
> get migrated to meson-reset.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 5b6f934c0265..b16d9c32adb1 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -56,8 +56,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
>   static int meson_reset_level(struct reset_controller_dev *rcdev,
>   			    unsigned long id, bool assert)
>   {
> -	struct meson_reset *data =
> -		container_of(rcdev, struct meson_reset, rcdev);
> +	struct meson_reset *data = container_of(rcdev, struct meson_reset, rcdev);

Unrelated change

>   	unsigned int offset, bit;
>   
>   	meson_reset_offset_and_bit(data, id, &offset, &bit);
> @@ -68,6 +67,22 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>   				  BIT(bit), assert ? BIT(bit) : 0);
>   }
>   
> +static int meson_reset_status(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct meson_reset *data =
> +		container_of(rcdev, struct meson_reset, rcdev);
> +	unsigned int val, offset, bit;
> +
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->level_offset;
> +
> +	regmap_read(data->map, offset, &val);
> +	val = !!(BIT(bit) & val);
> +
> +	return val ^ data->param->level_low_reset;
> +}
> +
>   static int meson_reset_assert(struct reset_controller_dev *rcdev,
>   			      unsigned long id)
>   {
> @@ -84,6 +99,7 @@ static const struct reset_control_ops meson_reset_ops = {
>   	.reset		= meson_reset_reset,
>   	.assert		= meson_reset_assert,
>   	.deassert	= meson_reset_deassert,
> +	.status		= meson_reset_status,
>   };
>   
>   static const struct meson_reset_param meson8b_param = {


with the first change removed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

