Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD820D4F0
	for <linux-clk@vger.kernel.org>; Thu,  7 Nov 2024 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982417; cv=none; b=gdbXvUGp5VQL9BsVuG768CCgLAML3hZHGdTku/8oLl7TCnq+CpCyfXJmXdr0SAsfTbrhLr2r3V7m49QD00tTT1lgfz/aV6U8HOkRqs2CJ9Jaoxi7k3VanjxEt8Ce5Cipnuz/qmqyIWL+4UxWkhuSxm5xQgxvsPGxqJdGQjF9wEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982417; c=relaxed/simple;
	bh=WVMN927o4qkeYTXILdzvcIvO1X/LpqgECegr3MVyyb8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MCqwe6SRaaSOxW6nfM3Nr6YKBjRypoJSiZdhHTdbhyVfvaBM92gXkTtQJYJUYlcfLuyS73VVyXLBxIk9PY5rd6v7bzSax5rvscignfZlxk2q1/X/qYlSo+3tO9ScmJLbYhL82t0/wsmXgMInQ7l4t+48XIQUPJoylavO9ruEeeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0z7mIqD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0z7mIqD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-431481433bdso7805895e9.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Nov 2024 04:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730982413; x=1731587213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vkRS/H+ZdcXDiRwjEKgfNuTb5DcFuR2X48KVwuB62o=;
        b=B0z7mIqDmVX4/Gz7SvAHjihbaVC8eihQyE6WN7DBAObfMSM5LKwwBp480YdrgE4tM5
         sbcEMumaB9CQXu9sGBVf0+f11oNImuHxKZ3XkU8kqgbuUMpeh5HcbYuS0+DQhGV0CYuM
         2wxZFn3MV7R2HeTuleImMi10tBWM8Tf8H8byBHjtdjzR8eWmcMoheUknCQQPxQKiJnCl
         61ES3yKUZpu5FSe1utIsxtdCJb9wL5GKQLtdPR/GQMP+2du7AXq2xGJ7gXEF0zw9bGnI
         CEYIJPco+oD2fXB2dzUv+pvA2FgPlvCZ2eKQLkr/NoOXbEE7fjw3p1CWhxqGVUvY4Cj+
         CIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982413; x=1731587213;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7vkRS/H+ZdcXDiRwjEKgfNuTb5DcFuR2X48KVwuB62o=;
        b=bf3LkqUMmPOLuOXi1pw6YYeCfzRRuDRylt7cOj5h79ynMuFboqqw9cLb+drvdB/H4n
         xVRGZA4qYwfiG18gWx67C1lJyXLP5saFKj3ZZU2fJV/h7I9Bz9RvfFN2v+0CdLTfXk+B
         JN++3xHfPIVEiHwIaCBXLopE1pfJS9qKtCn/sk28R3yaE0YXkNoMNgO0pzn+xOYxhPdh
         0gsp8+uNSUDL5qy0+FQ1KbjN5qqNsZ1GiFcDf/K3bGzXANHgIPnT+Nie/0Cqtp9X07bO
         zHGcpaAtFaFE31t1rTKL3q1Rm5xipC7zQez+hRw46Wpm33hCJCI/JX+WJ8HcKyHLGJPk
         mvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMtYnAwiSx9fDaekOnmMGNUGhYsZod3FEy971Oe+YzLOEUngV00HBH/SUNMxMxwAmxGOxG5Foj5Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw44sjzuQ/HGb8W+zMH3OwvnXxMDzPT2H7AS4HeI0pRwX3KWd9S
	fCt3CiJnYu5+g6zRrx0eetzXAEvkGE9BE8OEbe5uBqXdqBWXkioNMCr85j8J/HU=
X-Google-Smtp-Source: AGHT+IFGWO5UdFCxajEysApkqvgppvf4I2d7N66E3WZTxWr029LJD2QTc2dczG2SHK/UBdlZ/06AjQ==
X-Received: by 2002:a05:600c:1f0f:b0:431:5043:87c3 with SMTP id 5b1f17b1804b1-432b307b3efmr10799445e9.22.1730982413518;
        Thu, 07 Nov 2024 04:26:53 -0800 (PST)
Received: from [172.16.23.252] ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99a34bsm1580393f8f.54.2024.11.07.04.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 04:26:53 -0800 (PST)
Message-ID: <b9ac677b-e237-45ea-a121-de5e1ca177cb@linaro.org>
Date: Thu, 7 Nov 2024 13:26:51 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm8550: Keep UFS PHY GDSCs ALWAYS_ON
To: manivannan.sadhasivam@linaro.org, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
 Nitin Rawat <quic_nitirawa@quicinc.com>, stable@vger.kernel.org
References: <20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org>
 <20241107-ufs-clk-fix-v1-1-6032ff22a052@linaro.org>
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
In-Reply-To: <20241107-ufs-clk-fix-v1-1-6032ff22a052@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2024 12:58, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Starting from SM8550, UFS PHY GDSCs doesn't support hardware retention. So
> using RETAIN_FF_ENABLE is wrong. Moreover, without ALWAYS_ON flag, GDSCs
> will get powered down during suspend, causing the UFS PHY to loose its
> state. And this will lead to below UFS error during resume as observed on
> SM8550-QRD:
> 
> ufshcd-qcom 1d84000.ufs: ufshcd_uic_hibern8_exit: hibern8 exit failed. ret = 5
> ufshcd-qcom 1d84000.ufs: __ufshcd_wl_resume: hibern8 exit failed 5
> ufs_device_wlun 0:0:0:49488: ufshcd_wl_resume failed: 5
> ufs_device_wlun 0:0:0:49488: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x84 returns 5
> ufs_device_wlun 0:0:0:49488: PM: failed to resume async: error 5
> 
> Cc: stable@vger.kernel.org # 6.8
> Fixes: 1fe8273c8d40 ("clk: qcom: gcc-sm8550: Add the missing RETAIN_FF_ENABLE GDSC flag")
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8550.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
> index 5abaeddd6afc..7dd08e175820 100644
> --- a/drivers/clk/qcom/gcc-sm8550.c
> +++ b/drivers/clk/qcom/gcc-sm8550.c
> @@ -3046,7 +3046,7 @@ static struct gdsc ufs_phy_gdsc = {
>   		.name = "ufs_phy_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | ALWAYS_ON,
>   };
>   
>   static struct gdsc ufs_mem_phy_gdsc = {
> @@ -3055,7 +3055,7 @@ static struct gdsc ufs_mem_phy_gdsc = {
>   		.name = "ufs_mem_phy_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | ALWAYS_ON,
>   };
>   
>   static struct gdsc usb30_prim_gdsc = {
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK

Thanks,
Neil
