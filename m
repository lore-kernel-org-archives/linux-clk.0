Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E438B131;
	Tue,  6 Oct 2026 22:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324018; cv=none; b=TcTuHreRu0uG0zwWm5dM7uH2CiRGiyhKvyb+nOvqdBUkjv61FFp5/sJoX+HCtLAnxq9X897hYhasvfSTcBfOgZC91hYHI4qhZju8x8n+pwBkOsn/Uslag11l1F99bC2Bel11aEb1QQIS5RMCgkNiWw/I4Hl0edy8fYCIRoYcgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324018; c=relaxed/simple;
	bh=o45QKyA7wp46WIeYrWSgR+1Uye74TRLCFeWZcUyDtKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVXjH/TjnxiiXc+KxJY5enlQszdg/0hxfYWD92g2iFeIAV68hd8EXzHu7HMLtM59NQApcAty3Z6ECOHw1uMJfUMTbAalA1KluuDeLArEZYLLkj25lOQaOOpS29f+XqGSXaVculINOA1momlAJlJs7s22uM7KpfDwmGaytv6LRWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=CU06wOUZ; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="CU06wOUZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iVaFj6YS6P/7eWvHwtc8XiBJqROatZlHWcZMW/PW5fs=; b=CU06wOUZk0w6YB58F06Pt6dgl3
	EQ1EJfOY3ff/IzyYLU/LQj4Qnvh+fCsYjWmqmR0wfBhjxaWC4PZNIq+LyxA+cthVvXlQKSJky/+AH
	eFMUwVc3IEeac6XpIW9L4zg1mZyUwSjm2DbcTHhwKpqgSo57dY8Tqc/KbGjyynj34P20=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xECug-0000000Gnjh-3E4S;
	Wed, 07 Oct 2026 00:41:31 +0300
Message-ID: <0a3ad36c-c82a-4324-b4ea-905ec3b52c41@minlexx.ru>
Date: Wed, 7 Oct 2026 00:41:30 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: mmcc-sdm660: enable the parents of the
 pixel clock sources
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.10.2026 19:46, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src and pclk1_clk_src are fed by the DSI PHY PLLs, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>    pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE on both so the core prepares the PLL around
> the rate change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Changes in v2:
> - Set the flag on pclk1_clk_src as well, as Dmitry asked. v1 left it
>    out because this board has nothing on DSI1 to test it with.
> - Link to v1: https://patch.msgid.link/20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com
> ---
>   drivers/clk/qcom/mmcc-sdm660.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
> index 9f8b8e29fa0f..827741229dd7 100644
> --- a/drivers/clk/qcom/mmcc-sdm660.c
> +++ b/drivers/clk/qcom/mmcc-sdm660.c
> @@ -984,7 +984,8 @@ static struct clk_rcg2 pclk0_clk_src = {
>   		.parent_data = mmcc_xo_dsi0pll_dsi1pll,
>   		.num_parents = ARRAY_SIZE(mmcc_xo_dsi0pll_dsi1pll),
>   		.ops = &clk_pixel_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE |
> +			 CLK_OPS_PARENT_ENABLE,
>   	},
>   };
>   
> @@ -998,7 +999,8 @@ static struct clk_rcg2 pclk1_clk_src = {
>   		.parent_data = mmcc_xo_dsi0pll_dsi1pll,
>   		.num_parents = ARRAY_SIZE(mmcc_xo_dsi0pll_dsi1pll),
>   		.ops = &clk_pixel_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE |
> +			 CLK_OPS_PARENT_ENABLE,
>   	},
>   };
>   
> 
> ---
> 
> Best regards,
> 
> Fabricio Akio <fabricioakio@gmail.com>

I've verified that it at least doesn't break booting on 3 different
devices based on 3 different related SoCs:

  * sdm630-sony-pioneer (Xperia XA2)
  * sdm636-xiaomi-whyred (Redmi Note 5/Pro)
  * sdm660-xiaomi-lavender (Redmi Note 7)

I've also never seen before the warning about pclk0_clk_src not
updating its configuration. MMCC seemed to always work fine, but
given some recent fixes to clock drivers I'd be not surprised if
something was missed in initial porting..

Tested-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

--
Regards,
Alexey Minnekhanov
