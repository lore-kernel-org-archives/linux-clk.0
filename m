Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E4F17276A
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712764577; cv=none; b=Jf94GDOLTZWgX7AxTj8pp0wwssl8dSkD0wQfH92kA9PmmNWuokB+xOgfmSLzfpzidbfj+fLqUKIc2NdiISpdQ846AVKq/thM6EdwGzbELLAW3NE2CfScB5AtHEREWS+eK3BSaPA5wTY+rb6aUMqR7v+nsfds/VlPbb9rMKX9HG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712764577; c=relaxed/simple;
	bh=POh8IzPVqd5g9ddH6pfdaCVtLO682z9BexNHdz5ZleU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=hG1lplBr6ztOCzdOPjMfxYeBLddHdA2Qfw8vKiV9OWWCvQ2/njmmfVGJLmeZkEeayaHasGGf8BbteMoLg4GZ2OWvmneqTiKwwYd2QsAXHFPXzE5jHTiHle2mJPnQ7CGLm0ppykJJuhG/BhRLxLnecUXykm+pVDpHG8G8nVUopp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tLLPGzNs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tLLPGzNs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-416422e2acbso22844755e9.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712764573; x=1713369373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMdmKuUIz4lixjCtcUgme1poJSOdnyEZp5xiFsRRNeM=;
        b=tLLPGzNsVhSvdOXwRhU7ge6mXA5h6UGJi+xU3TPkC9x+6H/OvSBc9HYcXaccuR0NWx
         LSz2tYNZmZNmIZAE52UKwzm+SCOB7w6MsMeedlmwNW/0q6wl0ooKIUHZ7ZovTP3XbUq7
         V1R8VibjB9nWYJcViV5CgJUzmedqrIW9RMCMurIImH/r/u6E9/rKxEtTEw4F7sL3Qbpv
         +FkPEvGBqs3b245L7Ul4rKP+QFyTsKFpVODrB3g/LqR7/6j4W94hBe+pAzWwxYSO2uZF
         LNqRjamzEBlKAjJJDZGATYz8NsvkuJA81++Ryh6ajVf6Bp/D7y/lx+dMofkcJkDoGbu3
         3Rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764573; x=1713369373;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HMdmKuUIz4lixjCtcUgme1poJSOdnyEZp5xiFsRRNeM=;
        b=NRlDzcM3v0J+rV3hkQcN1jIoBetSd3bKZnNyQkWxJWRQhuTwX33qm3tug1l//TPUO9
         +5POdMK/nfJ/GVUA4xAvFmWY0siiz3ZhywrWKhvqngkvJuNA8z+J9R7Sxc3r/HazDl3l
         qFjrzAzaqTLZC8QqyQIAol0x1fdxBYr55+AynEKamZlP3AKpwqHD6m5UqfBlIEnQkldu
         NE17WoatkZK+D/oriYJXKTdVODIh/TQAiFizQ9upifV8hTEayjgotJ1KMXrUlAJug1eS
         ITIRIhR0lCGB1A9lR5uICAj5PDp8Vjg8CcYDUY9o5rYH7v6VdtIKoBeMlTK7+pYJNHXw
         lu1A==
X-Forwarded-Encrypted: i=1; AJvYcCXHXNt8LUZVTzLzKmI9x6kaXQ+xGQvc3rsROtV/fmqSOiDWCOECkzKevnHjarv0Wlox3XdAAH+pV6DUyTVlcfLe/mHy4mEOLFvV
X-Gm-Message-State: AOJu0YyESjUBsHahc1Wq9GOuRB60nGGNbagjM7Kt8kuWu5Z8wu/AJehp
	T8dKmlzwHt1qos1KlDhJsql6DT3nhUiv3D3KmgnWRPLfhh0gXawNp5y0MsdOKhk=
X-Google-Smtp-Source: AGHT+IH0DicSj7EZdYVwanK8DChE5Kq6JyrG4DLOmsDfa/paE/heJ15/axU+4Ae8PBBUkNTAuGB01w==
X-Received: by 2002:a05:6000:402c:b0:345:811b:466e with SMTP id cp44-20020a056000402c00b00345811b466emr46608wrb.26.1712764573431;
        Wed, 10 Apr 2024 08:56:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3? ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
        by smtp.gmail.com with ESMTPSA id i6-20020adffc06000000b003455e5d2569sm10468562wrr.0.2024.04.10.08.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:56:13 -0700 (PDT)
Message-ID: <7c1aa6a9-b964-45e7-bd8c-d9ef5096a04a@linaro.org>
Date: Wed, 10 Apr 2024 17:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: meson: s4: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240410155406.224128-1-krzk@kernel.org>
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
In-Reply-To: <20240410155406.224128-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2024 17:54, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/clk/meson/s4-peripherals.c | 1 +
>   drivers/clk/meson/s4-pll.c         | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 6c35de3d536f..22ff030bd6a8 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3799,6 +3799,7 @@ static const struct of_device_id clkc_match_table[] = {
>   	},
>   	{}
>   };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>   
>   static struct platform_driver s4_driver = {
>   	.probe		= meson_s4_periphs_probe,
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index 8dfaeccaadc2..8a917b9703bf 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -853,6 +853,7 @@ static const struct of_device_id clkc_match_table[] = {
>   	},
>   	{}
>   };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>   
>   static struct platform_driver s4_driver = {
>   	.probe		= meson_s4_pll_probe,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
