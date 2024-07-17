Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6817FAA2
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721217032; cv=none; b=RcCWlrjtwZQCW7nJFl19w1BYYl0jMCUi0FCjda7s7agsK7qBIspuqHhqjOSk197MHAuzNdmxxkiweYbgDJuLoSgZC4acbwD2AMhh2JgZSv9Dz15zWG1coGTl6xMY2EXQagdQxYpgIPVRde8KXrgsHhpkN3Knun/17i6U8QEv0+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721217032; c=relaxed/simple;
	bh=RFu0T/1jmcvCsg/wG8+rmd3uMJwlShTJoRpiR1Vdabk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KGJlBJ8qonvwZUpDTiIX/Rhcq+Tb8SDX+ne52D46Yq7140tFpK3i2gYKbR2He06B3BzPsHBSEvfTZyDm8XGHE585nZig3VFIVudyENmi60zcNpPLg17Ztt8ePowQeNNlMRlukg7WyEu9J/4jsMG8A5fbPXx/8/ebrxx6w21R1eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIdvQTMa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIdvQTMa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42797bcfc77so47642805e9.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721217029; x=1721821829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDbBPFH/dtRoPuFeFj0m34IeGVohBjVrd77pecdpn+o=;
        b=LIdvQTMap+XBCOPvXx+HRkSZALair1iYbPpuhPWov8bo1UUVhtqWP2IvamfKPcIU/I
         Ch/2g1SK17oaFJbXzP9CcmFh/OU3ayx7m4H6N1Z3RM3wI2I6jDb2/Iv2c7kxklTIu9eE
         3fREQBp6NwUpqLQhNXNIviltWy48bvY5mWFkLHsYeWm2Dt2YCHiqe2VVBS/qiuq+c6lf
         0zAk8QZpTLaHZDDykBLjtj++TmXkyvhrhjKJl3RNdNaS7pL3CBRVfijqSrG9cOoWohA7
         ND7g7PifTW0kqVmbbVZw5GrvlI0rKORXOLKv9TxqIS0Mzv/Vx417NcxlT96tgt7E2c9o
         8p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721217029; x=1721821829;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fDbBPFH/dtRoPuFeFj0m34IeGVohBjVrd77pecdpn+o=;
        b=GCOmHLpEfyPeoXs5DlVutahk4TeQb5kzBIhiHNhUwrRohUnFcaytj52kvQxVojCZDS
         Xz2p2R5ioaU0j/xBV7i6VAklk6uXZgXN5e/158evfvuPuxurnbpN+6rmLFfREbSfxPnH
         HH60HYlcktNt5IkMFmLS01QrXKINbVJLgu0XZGxMICARRdFNiFL7886WLIe2+KEeGpYU
         gcagsSiEWnGyAR0gfcR1/C+u75GtXcFTKkHQbOWGBmzoosX68qJxPGmip9Nlc0hdiHd5
         OKg6JYIPh7f+gzXmqOZOL9FQkUmUDseD2wATR/Fllj7Od0/i4b2Qf5wR0CyuvOVuUrA+
         jeww==
X-Forwarded-Encrypted: i=1; AJvYcCVHgBsp3a9nI5wwr70q2nsqXb2I4XR7B4S2hlJjVNkq7OANOgmecCQcTrqazcXijUfGIcUu+GaaNJCiWZ7py+YvnNqVNwE8lHuy
X-Gm-Message-State: AOJu0Yw7/kXB4ja5pco+8olJQcOgTVMg14taJ8/NKCkblEQ9z9A0RkHu
	04kA1dAVaq7leyJZE7Jel3bCNdSVwOf6JvhL/8MChTdzx6RBr0w71oH6z607g3U=
X-Google-Smtp-Source: AGHT+IFf1IJK/6nGs3BLxQXM8yjPb9z7nCViT8uVLXEJ7o+I6Zlmwc+L9LQYG3xebdvYufm4P10eCQ==
X-Received: by 2002:a5d:4089:0:b0:362:d382:2569 with SMTP id ffacd0b85a97d-3683174761dmr998562f8f.44.1721217028638;
        Wed, 17 Jul 2024 04:50:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf539sm11449886f8f.47.2024.07.17.04.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 04:50:27 -0700 (PDT)
Message-ID: <a68e38f5-b705-4bea-858d-bd63ed7102c3@linaro.org>
Date: Wed, 17 Jul 2024 13:50:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/7] clk: qcom: dispcc-sm8550: use rcg2_shared_ops for
 ESC RCGs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
 <20240717-dispcc-sm8550-fixes-v2-5-5c4a3128c40b@linaro.org>
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
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-5-5c4a3128c40b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2024 12:04, Dmitry Baryshkov wrote:
> Follow the recommendations and park disp_cc_mdss_esc[01]_clk_src to the
> XO instead of disabling the clocks by using the clk_rcg2_shared_ops.
> 
> Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index eebc4c2258d0..1d884e30d461 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -562,7 +562,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>   		.parent_data = disp_cc_parent_data_5,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -577,7 +577,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
>   		.parent_data = disp_cc_parent_data_5,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> 
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
