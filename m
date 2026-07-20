Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3297B407CDF
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552985; cv=none; b=o2Ddu/pJmyOTFIqz845jLcQW11X9YPu/tDGllcI1h6hOsz6vEVpXoBMSJDJ9mgOyi3ncgc7Kdu/Yo66+3a3GFWMpxUG55MfgdEqMY032lg5gb1bvvVU921y1W0hrn3QpIEiYDjonztPB5Dtn7jBcp/GWVnl2xfFQthBX9EAmUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552985; c=relaxed/simple;
	bh=y8U7PcjMhj0Xr6VHKfIEtPrEwt1bvhUDfHBrlhxvgwY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HBMT0OulhXlVB6kx6BlIXQ/z+l3WuDGqM3H7/OcP6P0TqHSodi70b41t0daP0LN91/Tkcs6XYHpCy+RFSSatMWk0Ng9D0o3VrWF5l0w8QGxoKK6J5PxsJTHR1YtjlR9oUKLsogfOGQu9/X/oUNuVu4lBZFDfW2lxFPF1wW0ZzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpoBILxA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpoBILxA"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a1fd0ab0so26346e87.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784552982; x=1785157782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VKfNjiRL8GQvLjdsOfTfwXC+qCtnnsPDYaibsMDCkR8=;
        b=dpoBILxAwzv8NMAPr/7ohM5BfFS1BIhzJsP111m78njleixbzzn5mddILaWWq0wMCN
         jlnaPFEXr8U9Wq2Cxd/YTfRn1PxE4yLfb1GKy4LwN3KG+ExtfOm25Uw0+J10zW9iGaqj
         wVi+WV+b++BFYL38ycP6kPensea4Y5w2qXbnWpEjNwg8i8U0eae0FLm7YvVPOJ2mQuS4
         yGG1v/cESrDAY6sUyb5b96eHgVrANcDE9jrGPAMIX8qwzHVGMUx313Fo9YmEKuu6J3rw
         VFjfZu4H97MqmXTLpklPPEQSkxxA18hu2L4XfKSLP2tUdgFBifoSih0VboLyercZG+OJ
         oPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552982; x=1785157782;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKfNjiRL8GQvLjdsOfTfwXC+qCtnnsPDYaibsMDCkR8=;
        b=Sux1qbTz+3EdkCJ/ws4bCi5gQi/PpeonmdCOFyI4vGJzDm1yoQdpGIuuGIooebWxTk
         fIOv0Kz13V85F78lGQZ7zQDHbHM5YjmJqm7ia2JE272lqPKw8wlgE0Bq703u+PorNhq7
         IhZLgGAS4QrJS5inFkBtISxakl4C51G4IaDzsDPFrKcGE9iNl9RmCBPi+82Q9uezu9CZ
         UTPdb75P3SR9i3sRBL9EN/AHt+k27KcnDSZOqk1WEEYWRwHx6TK+m98m8t5pzQL172xB
         AyVXBf6+8U0X5x8FrEALgaKhWTFY1ng8x0/GSjG7wYXb+KKF+O/VUzWUmD4qg8sYlBRY
         jIEw==
X-Forwarded-Encrypted: i=1; AHgh+RpiM6NjcHaIouW0E2nrOPkCXO8a+1o8d4DzuH6vkLhwNf6xNalYWN9Sfkg9y4nzyAeWWJkNh7gjjDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhrCS2MCnm7UBp3tU3ikdCKvkSwgJxBMtpDM5r+VqQ/xm0duvn
	lR/igYy11ofH6L4zjcVDPo6QrUKyMVNPu9jbvUpqw9GxVAJYlhe2EffI1FCn3La16awibL0gC8p
	q5tVm1vI=
X-Gm-Gg: AfdE7cnU75A+Hav4aK/V+pasngt1hYms9jOnyCeVIgDbk32R4fSiRALQl4IeqMTZloG
	NDWFI1G4G/Xo0HY0+/UCjp+pZw9/s1Y8w5fvwsCL89FwNy23watIFbQwTbY3jI2XXsgpDkAu05K
	/VLextJNUv3st+Tj2P3l7B3dFbOBOzHt+13KhGdYoPU3w5f8m5bbclOTKqxt9UqdDd3FkE3YDgv
	VyV+e9FEV7WEoNSkyz+4E+wnHyRCGsnl2EnLBSPBC3zjFj7KDQjFDASbfddRiHlc2YWVAruoqnD
	UmpAXoVJ1OVc+JF2Ph7pbAKtg89iJjMteDH1H1bZUSXn6LBeUkeKN2g3H68RFkSA2gbxfsatvyw
	IPMT1IQou3GOSVRd/aKKVImP/my/vq6CKNtDazNbonXla3jj/NEPEkL9jgWjcpYC3WLf7G1pzmz
	enrgxkCg2pjQqXYKv7eDeEVdaU36L0IbH4Tn8BxeYoD+tWprOFXe/89cH968klT1eqEkU=
X-Received: by 2002:a05:6512:39c7:b0:5ae:bad9:8a3c with SMTP id 2adb3069b0e04-5b2a24e5286mr124578e87.5.1784552982084;
        Mon, 20 Jul 2026 06:09:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d98301sm2291776e87.25.2026.07.20.06.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 06:09:41 -0700 (PDT)
Message-ID: <3ac214ad-cdfb-4f46-9f27-5d581997f61a@linaro.org>
Date: Mon, 20 Jul 2026 16:09:22 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Val Packett <val@packett.cool>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 03:11, Vladimir Zapolskiy wrote:
> This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
> 
> The commit causes quite severe problems in runtime due to the introduced
> cyclic clock dependency:
> 
> * dsi@ae9400 platform device and its probe depends on dispcc clocks,
> * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
> * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
>    the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
> 
> On RB5 board with no connected display panel on boot I get this error report:
> 
>    DSI PLL(0) lock failed, status=0x00000000
>    PLL(0) lock failed
>    dsi0_phy_pll_out_dsiclk already disabled
>    WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
>    ...
>    dsi0_phy_pll_out_dsiclk already unprepared
>    WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
>    ...
>    Tainted: [W]=WARN
> 
> The problem has been already reported and discussed before [1], the original
> commit was done for "preventing potential stability issues" reason, and this
> time fixing a potential issue introduced the actual one unfortunately.
> 
> [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

I kindly ask to review/comment this pretty trivial fix.

> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index e59cdadd5647..cdfdb2cfb02b 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -578,7 +578,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>   		.name = "disp_cc_mdss_pclk0_clk_src",
>   		.parent_data = disp_cc_parent_data_6,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_pixel_ops,
>   	},
>   };
> @@ -592,7 +592,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>   		.name = "disp_cc_mdss_pclk1_clk_src",
>   		.parent_data = disp_cc_parent_data_6,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_pixel_ops,
>   	},
>   };

-- 
Best wishes,
Vladimir
