Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00138304BD7
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758271219; cv=none; b=QhbzACni3MFsVCHs8mb+Ml4V8/9sC36aZpe0QjkOwTp44uaF/Oz0o8vJTCSjdNYxm56kbLKVRqZtG8BKsWVq5MjrrFsVR50y9TT26sluD8KgMV9ohZlug/OP/w6waomCEJFrC3SImKkoH6j3w0BV9/Nr/HtI76HGrSht523FOoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758271219; c=relaxed/simple;
	bh=KeoC0ZdOFm3rQhNvBADoTpnq/aAoCScn5rqawAVaul8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aJoFKe3Bla1Z+TJ0ZxCX3/bPXEHyS/qW6PUCUQ6y50u5kQ6xOWoIckmDvHJ4kr4JFu03usIMjL8TE33hjjo0oYLlgzXERRzS4lZlX9GD7Xz6ZitDCTF31mWGclV4J9FfP9f9qlLfil9bSFxPGNWvnBOv7iAl7XZFNOiyiwUOX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y2LsaknK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y2LsaknK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4694ac46ae0so1875565e9.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758271215; x=1758876015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SvyxtZWUKI1Rdo1Vjcf+SLlqK70xnu3k0FLQZ6kagM=;
        b=Y2LsaknK1lrndQhU7xcC4wLOgckmjQk4Qu9pQo9QjbypjYmSnETiNpaC0emjJN12N0
         HX6+Plt2DOjfmEftNSNNGbd9dnQUQXMWkYm2ozVUJOyU7r59JHWTZAAC1BGWrmcIn3i7
         m3Z/5dBa1pz+rwz7lo1+UH02iwunQdAuuYIehN+U8FCdINSkhDf+/0W7sUsOPOR7/tpn
         EP9B93gdTOtRiMgT0s2BX4KKRfV20NbMRXV8iqYtKj4GWypfJx4y2ZbZTqTAV3N5fe0B
         erNUz1E4fMVQtMsnBpHwD6JFJQD9E/A00YEpQlnDGO3Pdkzk0UR1qbQfj7e0ILxx949i
         EQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758271215; x=1758876015;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/SvyxtZWUKI1Rdo1Vjcf+SLlqK70xnu3k0FLQZ6kagM=;
        b=DwFerSjWy/WKV4DOcn449y+bRPTUF+ea0ssoJisdcS+odVk+87Gpq41M9juV/Xpb2g
         j6r+tgefYRviwQgbexwBqsS6cAAOwIvM6gDsoTytbHL6UPqBeRs6D4I9Y05PE/C3UM5o
         IwBtAFIWnltrLJ/1nnrzjsbwnrZf+P5tNiA8Ag1KxcHnn9ul0OyZn4tC8Y7OjiVNEKtg
         qlSK8gw3pYQG8WbN2Idt1yjMsE+P/NTIA19WnErn/gQMxYt7MV/89RbrKUxe828+pe6J
         M/azzTidHZ6TM1OtCFjvZiQisiGgZHqqdrw3phDBaIV2h+8ZP5Nx3ojW4aUX28gYSLmB
         hlSg==
X-Forwarded-Encrypted: i=1; AJvYcCXRJvfAQLsp0BneZ08g6xjCThWP+QWnmB6JObEECLr8cmfjRoa5bx8eqGv3+YVrHWJVj4IeEOdIuhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBIKy8TZUdyKPLm8tIOTyj5fp38u8b05+p1zKfDut+nFKZg6iE
	loQOspgcVAeBHkEp7k8WxSCiZrgyHiGq3G2VW/vwAhrrVHk8ZO2YPHSjQ0LeG8hQGhE=
X-Gm-Gg: ASbGncs16KvGd4VcX+y0Sm61Ao4lJL+EIzFRQTBBxF0T78Q8SceRSAtejsgElaRPJU3
	OcertV6Zys19l0kI6UGp0D3BddL9pZcGLYQjTmyJCwDmc1PLqyuIk6uOZ6c148gGHoEwHfuk61i
	7yuJrkcHsCgrJ6Lro3lRf0YJD4/lLasUyaQ9+K8DQGCvq6JWdS0hECTuRx5agui77D9ddc+6wCN
	mK7gSGzQ3He6yLSq2ksak6psANafY4X2d3/knxzgiIi0o5rr5CBWE3zErERJTefri1dJH8ZILEJ
	HpRkr8+LzakyPkXa4f0823BH/34MD+kzaYN6OPwyqIcvldli8rAgqGfaURRgz9cnOYSlPVTFUzF
	4Fm2k20hXl987omK3auzWjz5c+M9bBOOdS1XMgBj1BPE4J6kbGyfb0BRok1HtIw73sWiMpTwy
X-Google-Smtp-Source: AGHT+IELGqVFFcBCfJAgURUToEPyQ4ceFB5Cg74ffCU9dil9DlOeFPSPFEncoJEp1KJFhTnqnsa52Q==
X-Received: by 2002:a05:600c:1d27:b0:45b:47e1:ef6a with SMTP id 5b1f17b1804b1-467f15d40b7mr18712765e9.37.1758271215177;
        Fri, 19 Sep 2025 01:40:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f? ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e754140sm113990945e9.21.2025.09.19.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 01:40:14 -0700 (PDT)
Message-ID: <a1423d92-657e-45da-84de-7a7b77cc4eac@linaro.org>
Date: Fri, 19 Sep 2025 10:40:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: amlogic: fix recent code refactoring
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
References: <CGME20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6@eucas1p1.samsung.com>
 <20250918160601.3286872-1-m.szyprowski@samsung.com>
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
In-Reply-To: <20250918160601.3286872-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2025 18:06, Marek Szyprowski wrote:
> Commit 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
> refactored some internals in the g12a meson clock driver. Unfortunately
> it introduced a bug in the clock init data, which results in the
> following kernel panic:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Mem abort info:
> ...
> Data abort info:
> ...
> [0000000000000000] user address but active_mm is swapper
> Internal error: Oops: 0000000096000004 [#1]  SMP
> Modules linked in:
> CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1+ #11158 PREEMPT
> Hardware name: Hardkernel ODROID-N2 (DT)
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __clk_register+0x60/0x92c
> lr : __clk_register+0x48/0x92c
> ...
> Call trace:
>   __clk_register+0x60/0x92c (P)
>   devm_clk_hw_register+0x5c/0xd8
>   meson_eeclkc_probe+0x74/0x110
>   g12a_clkc_probe+0x2c/0x58
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xdc/0x164
>   __driver_attach+0x9c/0x1ac
>   bus_for_each_dev+0x74/0xd0
>   driver_attach+0x24/0x30
>   bus_add_driver+0xe4/0x208
>   driver_register+0x60/0x128
>   __platform_driver_register+0x24/0x30
>   g12a_clkc_driver_init+0x1c/0x28
>   do_one_initcall+0x64/0x308
>   kernel_init_freeable+0x27c/0x4f8
>   kernel_init+0x20/0x1d8
>   ret_from_fork+0x10/0x20
> Code: 52800038 aa0003fc b9010018 52819801 (f9400260)
> ---[ end trace 0000000000000000 ]---
> 
> Fix this by correcting the clock init data.
> 
> Fixes: 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/clk/meson/g12a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 7e2c0ce91964..1413eadd8dc6 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4919,7 +4919,7 @@ static struct clk_hw *g12b_hw_clks[] = {
>   	[CLKID_CPUB_CLK_DYN0_SEL]	= &g12b_cpub_clk_dyn0_sel.hw,
>   	[CLKID_CPUB_CLK_DYN0_DIV]	= &g12b_cpub_clk_dyn0_div.hw,
>   	[CLKID_CPUB_CLK_DYN0]		= &g12b_cpub_clk_dyn0.hw,
> -	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1.hw,
> +	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1_sel.hw,
>   	[CLKID_CPUB_CLK_DYN1_DIV]	= &g12b_cpub_clk_dyn1_div.hw,
>   	[CLKID_CPUB_CLK_DYN1]		= &g12b_cpub_clk_dyn1.hw,
>   	[CLKID_CPUB_CLK_DYN]		= &g12b_cpub_clk_dyn.hw,

Thanks for the fix!

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on BananPi M2S
