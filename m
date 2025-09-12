Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F01114;
	Fri, 12 Sep 2025 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671782; cv=none; b=kPehYhc3Yjmm4Hg2oWva85KnlIUqZGeD5mBUyrpoa7etyuhyLrCqSGUGhaUH1NxCMRsQYuuhW0QhNNflfUbI/vRTTxflzUtgtCqhmDAHP5EX3TGI318Q3O9lVc6RYKvnrLhyMox/B3ETibCzvfzmpUebva5HQA+4pHNMvKiDs5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671782; c=relaxed/simple;
	bh=Zq/ktJUT1d7ncJGLfxlzASVrJDm0+qapuDAgz0660NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Anjy3DoILZWw7gINJ8gJcp35ardLloWvpDoQim9RRHrwgkyPchOTujaFTsofplINkUUqLrV16AAeBYZon1j+lVNKDqKNy6EUt4XYLOTg5TCViJr6zmzv7Gq/XanPAdto+160KlQBAaQfuMvol+0d2zFeawBR7hrFFotd1tMENUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C088BC4CEF1;
	Fri, 12 Sep 2025 10:09:38 +0000 (UTC)
Message-ID: <2e7a53d3-f9c3-4d95-9916-a277abaf0d64@nxsw.ie>
Date: Fri, 12 Sep 2025 11:09:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <5-6z9Pf2Rh4Tkz9vXM30fc0IzpO8osNjG9XYss1fu12bG2ouAuMl8SMN-a3Nzj4loqb1Q8di0P5FRGh-_5ocag==@protonmail.internalid>
 <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM6350 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
> index 8aac97d29ce3..6c272f7b0721 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -1693,6 +1693,8 @@ static struct clk_branch camcc_sys_tmr_clk = {
>   	},
>   };
> 
> +static struct gdsc titan_top_gdsc;
> +
>   static struct gdsc bps_gdsc = {
>   	.gdscr = 0x6004,
>   	.en_rest_wait_val = 0x2,
> @@ -1702,6 +1704,7 @@ static struct gdsc bps_gdsc = {
>   		.name = "bps_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &titan_top_gdsc.pd,
>   	.flags = VOTABLE,
>   };
> 
> @@ -1714,6 +1717,7 @@ static struct gdsc ipe_0_gdsc = {
>   		.name = "ipe_0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &titan_top_gdsc.pd,
>   	.flags = VOTABLE,
>   };
> 
> @@ -1726,6 +1730,7 @@ static struct gdsc ife_0_gdsc = {
>   		.name = "ife_0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &titan_top_gdsc.pd,
>   };
> 
>   static struct gdsc ife_1_gdsc = {
> @@ -1737,6 +1742,7 @@ static struct gdsc ife_1_gdsc = {
>   		.name = "ife_1_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &titan_top_gdsc.pd,
>   };
> 
>   static struct gdsc ife_2_gdsc = {
> @@ -1748,6 +1754,7 @@ static struct gdsc ife_2_gdsc = {
>   		.name = "ife_2_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &titan_top_gdsc.pd,
>   };
> 
>   static struct gdsc titan_top_gdsc = {
> --
> 2.49.0
> 
> 

Please fix up the commit log.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
