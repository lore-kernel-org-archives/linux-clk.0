Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4EC19ABCE
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627788; cv=none; b=S0S3iWQ12V4p9BQEhFCUY96y44O9gckKuhn5iKQkRRqbkxqBaCqKTvZ1VGmFA34NV540XTjH6vt4wIjYr2kiYFIXAu3SBjzMWWnbUV2Mws494wG8cOZPYOeIU1V/OABrNqsHNffn5H5F3K+kn8OCsnfH9/Gs/q0ouLCqD5dtgtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627788; c=relaxed/simple;
	bh=LAxZT44OSTjAsLaWspC6Fa+n0CF0srQ90V6QfRw74mI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qlLF2qkWkHoM9phyuaYudCbN5S2lZ73RYTNLO8myxf6MCtvpAanp1Rr2DyMODS8lPo6LN5Kw41d0fgMW6ok38z7XHX0U8tCEYwvb2FjO4h5bG9XZ3CKI+tJHYyov20BiTg/BGNc89R0j/XGOMoGy00FYuMP2XnKAM9HRPlkbdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbcCX1kf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbcCX1kf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e06af753so614255f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 09:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734627785; x=1735232585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2joqSFSGiL3JbOVZxzsnOVUrQgxWQpfqL+Fpgj/AQoI=;
        b=sbcCX1kfk+s0skiB4YlBbLegNtfbSHqFLTcZHIfIvTeispbpRdOQMI2MB7euQ/FJxj
         DSR7m0cuzklkOztN2e+UQwLlR22V0KNcDN8gNJ2witWh2xGziAf0BncihOSkIZlqjKVP
         ZrRVr4C1NrLVQEmtaClKoOCx4Hey+isWYd4SK2p5EDKZA+NSeB7TPhaJ1McPNCswd2gk
         MUCU8ZCKWX6nZUtnNgTDzv0VVltxhOArI9B/G7sITelefhJg8s0iTnz4XiWwy6x8DOLE
         3cYRJUY2oFbTECZfMQPAj+TqxM8+x/jpnGShXNyGE7si5Qc8A0qDrD7rQ2mjU5sm2GSs
         mjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734627785; x=1735232585;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2joqSFSGiL3JbOVZxzsnOVUrQgxWQpfqL+Fpgj/AQoI=;
        b=rwuW7x4kalJmRSXLvZH0W6pCGLJCcuwa6KLK+2uHROD6zb0LHAn9vucqbsa3VbUcaQ
         9ubm6nKYvsnAvlk8v36H9in2sUB+ofq68u7anEALjhka+NmvRP3Ja2Rp8GuL5yrJO6ys
         Bu97qzMizqS9I1u7vAZEAd+zFCEI7Ly2OrI3Xya32QGDeb6TbqlWcalz2O8PWyBoapkC
         26nACCVPUnuCuukQpYu/FQGweqPEFpnLFuM8T1A/fuso01bE6vYRcrD3HNkVkcaGPmWb
         uHiNVAdlUrXGhqRZH41sCPy4JyFAC8jyixR5AvVPvdWNeJdKafhtXHLOdr1aE621l6RN
         RQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNn4bSgYS+0wKG7Aj9wjiBE//knJzQXpdHxv8h/ZxY0esjpMAjkhNOkklrJM0QTQlmP+cSyrjamMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUsrPgWzLAZ04JUP9IeJaDPa4Jw+NgXpP1veWoxiCW8hivd0Qq
	CxJVL1OBIqzOhiuCcfMw+HKl5lUvutnYowhcCYg+ajg+V/sD1LmaFMgubBQ7cxE=
X-Gm-Gg: ASbGncsKTH8D8Sx7rJWO1IPT634yJY1YinFf0l27bklJOp4/cK6pOQE8q8GR+j34aJ8
	93Of1yOx6CYJ7zpWKNf+HJWKtfNEHcdoUASe2gsLT0+9thbIanJnAIQ2tzb/YBzXbteAGkuvAkA
	Xmf4FAzPi4fF+HMMJ60sg9lWjnDMipbrOYek8FbqioX1omN/PkMdbH0FPSL0QCdVhi8LZeBbKur
	NhTZG8vfWMWmr6vXp3/kSLQqXbXaN7WK66w9DIDGGKCYfO0VXCxE6QUVxr0heinYobFM//8gIXV
	LakMbjKihDwMVn/K2OvetLXMm+FBm3ZQbA==
X-Google-Smtp-Source: AGHT+IFije2eCXuI/vVg76EXLkoGjAMy31PjAXmPaXh3pOApgtmWJU/d+3IdqdRhDCTYYenPVDXV6A==
X-Received: by 2002:a05:6000:4a06:b0:388:c7c2:5bdb with SMTP id ffacd0b85a97d-388e4d6bc86mr7858378f8f.2.1734627785243;
        Thu, 19 Dec 2024 09:03:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a0fd:4342:76af:7533? ([2a01:e0a:982:cbb0:a0fd:4342:76af:7533])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b41904sm56661795e9.37.2024.12.19.09.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 09:03:04 -0800 (PST)
Message-ID: <f6a11ee9-ea10-4b7a-a67d-759b2e410620@linaro.org>
Date: Thu, 19 Dec 2024 18:03:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs
 during gdsc_disable()
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241219170011.70140-1-manivannan.sadhasivam@linaro.org>
 <20241219170011.70140-2-manivannan.sadhasivam@linaro.org>
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
In-Reply-To: <20241219170011.70140-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 18:00, Manivannan Sadhasivam wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> Cc: stable@vger.kernel.org # 6.8
> Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8650.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
> index fd9d6544bdd5..9dd5c48f33be 100644
> --- a/drivers/clk/qcom/gcc-sm8650.c
> +++ b/drivers/clk/qcom/gcc-sm8650.c
> @@ -3437,7 +3437,7 @@ static struct gdsc pcie_0_gdsc = {
>   	.pd = {
>   		.name = "pcie_0_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>   };
>   
> @@ -3448,7 +3448,7 @@ static struct gdsc pcie_0_phy_gdsc = {
>   	.pd = {
>   		.name = "pcie_0_phy_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>   };
>   
> @@ -3459,7 +3459,7 @@ static struct gdsc pcie_1_gdsc = {
>   	.pd = {
>   		.name = "pcie_1_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>   };
>   
> @@ -3470,7 +3470,7 @@ static struct gdsc pcie_1_phy_gdsc = {
>   	.pd = {
>   		.name = "pcie_1_phy_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on QRD8650
