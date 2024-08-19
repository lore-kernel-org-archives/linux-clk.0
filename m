Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD9173357
	for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724084976; cv=none; b=g4ZBlDFp43m3Z39g8XPp+0rugK+RfHSUQoMR8aCZrwsMladSRkhsVdxRZQ14ZSfTQWC1JHuzf1SjkM+IZOCdeS2NTnqjOeIaMa2nhdqhz1EXJup7JCvfI3Q+fL5POunxcTcJWkCawreMuIkeeeAa7XVu4Fc3/e4IFgs0AD0PfDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724084976; c=relaxed/simple;
	bh=I1ygwhScveC8GlVdj4Oic9IJ8ABJRIoD88MRwbkSanE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ka+36ojtdIVZipjWNW0E1j9HFECSQKaF1yBM6wAFthTX4GSz+JApKQPX4dpBFlslFfN/ZD9XAiXbSJ16eDTJEebE4pzbhRLgyt67bKE4afNBhZB0ELAv735i1FL1vM/UVUwa1DOJbmgPy3IQVbOhE+uJKxcAbkTsyZUS+9umt+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNDC0I9c; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNDC0I9c"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42819654737so35250625e9.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724084972; x=1724689772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyTK/Nqg+TcWV88Hzbb8pamwVc3/Bic39dkGuh1HO74=;
        b=eNDC0I9cQRe8YR6TzOi255RkkYYCvJrQF/2WIqvusC3KvqOTOhmWq5rRe2+PA/ynCb
         gvVzjkQIRzi2fl+e+Q07D75TL0O7rM6WxN3aRKKyt21PjnJ2u7gNUHtQ0IUqHwxZv3hc
         6TRfyE+9XiZHoCDKXhAQvZBvVwxbpzGkr8N0vbpAjJe+Agy0+4CcWjbAKrPVhZB8GlyR
         cX4kRr7uavI/vhkhH+ekM96XOFPeOfEx1ELDg1UXCelsBELnOM4he8k167RpNn/yf/m3
         tCIbAKybivcJoXgcPdfZYYJsG3zmOKTE1us22nO1tgdI3ZigmCo7e3APMzZ0jgpEtQKu
         IA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084972; x=1724689772;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vyTK/Nqg+TcWV88Hzbb8pamwVc3/Bic39dkGuh1HO74=;
        b=rlnlkSLG0rtM4LJZ8C+mctYKDUoQwpQdEGhnyDcuQGoPq2FgP5cjUHZldK966TLSat
         f4yO1CBdEYxY4v8lX1vLhPdkYowFy2P2cQwW/usyfjHk/dvEs9L5V4hjB/+8Zqp4sLm6
         EdDlEIwOwuqlP1XMo5g8DgAKuuZfcKM84FesF7REmfVfRQmEDuu5UIbbb8cEyNWIsEhk
         Gu8UXmn79eW10jHqzPMs3B+erkoX14lRB67F3qhHrLm5+Km72KoUS8bS+LqIjTvXD8ij
         O/d+EkaNLdAkyShbTpOw9KedA84Vh0rqLe1hEXt49KMTpYRi0SwqsxMXlDgcbfyeLT+P
         J14w==
X-Forwarded-Encrypted: i=1; AJvYcCXHdwjPXOo1SggUBSlEhwT9PhKb1QC5DveB/o0QW2wLPdOVKzYHfuP0FvfEhaCquihdBLi6S9GoRBVPPkPMmWSUyEeA3Fw+1lad
X-Gm-Message-State: AOJu0YwInZSxYdGdgvNYlADKUktrd+eIHLqA5hZJLQZbXGn3dDa7/f9u
	3I23NI/huniCzZ98wlx5v1O0gEAJ5EHK4bIrOyc63fFeaTcp6ylE419RZxUkGZg=
X-Google-Smtp-Source: AGHT+IFmUt462S1VhERmlQIQq8oIZQDZkUEeKWv+5iLxGFcru4qpZHKVXvR9dRFVXR4lSve7N0W4QA==
X-Received: by 2002:a05:600c:3587:b0:426:51dc:f6cd with SMTP id 5b1f17b1804b1-429ed7b8883mr89103815e9.18.1724084971510;
        Mon, 19 Aug 2024 09:29:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429d781047asm172550245e9.0.2024.08.19.09.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:29:31 -0700 (PDT)
Message-ID: <b828b63d-e1a8-4c9b-9001-da686dffeb64@linaro.org>
Date: Mon, 19 Aug 2024 18:29:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 3/9] reset: amlogic: make parameters unsigned
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-4-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-4-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2024 12:27, Jerome Brunet wrote:
> register count and offset cannot be negative. Use unsigned integer
> for this.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 820905779acd..460ad2f8360f 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -17,8 +17,8 @@
>   #include <linux/types.h>
>   
>   struct meson_reset_param {
> -	int reg_count;
> -	int level_offset;
> +	unsigned int reg_count;
> +	unsigned int level_offset;
>   };
>   
>   struct meson_reset {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
