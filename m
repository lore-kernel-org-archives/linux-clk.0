Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCBB20E318
	for <linux-clk@vger.kernel.org>; Thu, 23 Jan 2025 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631923; cv=none; b=mn3HQsHiw0rP0Xq4hjFxy2/B1aDz5hfBEQKlYS1V3nFgDbyq76MYfChjipmhk/cc7Z2nRLIGrt5F3cpQqB0VXJMp5qo9GAl6NBgWD61X7fWPbZKMtBRtwzKhB7TR2mnz56K8uLg+op6vuUk7OW8GNnBUhCCaHjMm1p6/BctH2HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631923; c=relaxed/simple;
	bh=c1x3wOL/Jg/CxqmpfvXlIfxTazE833rR3Za4g0QHXGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9SrzbDNiStcZCwWJ4VEVGmEnGfb6neIB68SeNlWF/FCYgf+kL/xUrtUZmXG8dpo+kZobeN2I7vwjMk38e0RvDn8aEVW8sGuFcGXprp88NyKWKXM6v/phGdxadOYd93HaGcRaxnz5DDG8pi/XnKhGdZDxMKkRwXl42ecrrKOUoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=feLEUCE4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="feLEUCE4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso5210875e9.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jan 2025 03:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1737631919; x=1738236719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkzdprg0mUGbGqhZY3kXquNpxLnOQ+rAcPKbs65QhXA=;
        b=feLEUCE4xOl4/S6REbbmzJ2I5cqXeV728tqB7yF/+31mBTmv5ciiRY5p0RNdMn5l2g
         3nP8uIaj0ZkuupG15iCJ9kJoxMykLJV/93eaZzQYiZRkXzpYrAMOwC4oAjj8s6zKL9R0
         Afc6aGzs2SNOwDx4sg3Zg5jsvXW6lGS8CCF6fEHOeTaNSG+8d6Ayux75OCXu9kNjjCBi
         AKf52yHJOfqA+QCJb01Xv9kE9b4xnxMc02X+39L6sg5fs+6P0J2blO5U8Qo/D+lHfB10
         h5PHRVeMljwThvGS8Qp3puX2JCxRNq++0JYTqL5jXNwpiP+7/X4Lg38WrBkqv2rwd6Wy
         huMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737631919; x=1738236719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkzdprg0mUGbGqhZY3kXquNpxLnOQ+rAcPKbs65QhXA=;
        b=YjSyVAEe6Z7h90cKY2V/NxaaixnQtisTf5zxTLBGpas80l6AubZ2wFLPlmdQbVkO4z
         LpoTQGKYaWeobzCrdrAqI7fpsbVfC5XTFF60EQT4vOF1oBabbtF+d7vCTM5W7CAfF6FW
         5bTJYFAmYuylU210UJT4bMw6DXPVZ7ZU77I4Mk5h8i7M5B6fqBRD8T5xSj6XL1Eb6ZyQ
         74wY5OGyhcDPnxgONy8+4xh9+oA4BjIB/oWyaV99eLp4U1uPjMCBr/jIsgKEVhHUS7YU
         OT0D1NHaCxNZCZtmz3H5ZIq90G55mRWQvoO1hcWwZWUQdK5vm+Yne7ApoJgx+BUZXciE
         i4ng==
X-Forwarded-Encrypted: i=1; AJvYcCXDGhNj/y05IARuNIlFB4K5AOxMpPu1cXerappo++n8g70MdeLNFC9/OmIL7rO801wTawGRjCAETXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRKcfHSRfTS3GMa05ZcVxV6FnVTudODUNhYP4Wr4dz0hZirgX
	wfRQHmUhW3Zj2SlChVi8KXPfVtlM5J9eJC7kyDldVNk5BfTrlds7n8FJ1UUttMY=
X-Gm-Gg: ASbGncvFub3vr3wVRKhHMPXRRKNCeJWK3iMqjOC+EgAB8pmVj5hfGBEqVQ+dS8aPMrG
	7BFaSx+4d4nUyDW5lhHseaHxCDbLSsF6FZva6D5AU6aWSNHLuafVs2A/KBwenBAVW7r7+Hj41/A
	bNXrDc8r76n1JyJafeWmDMpGfw3+1WHxII1aAJwdBcrP8QnwfInDS/f1OxnD+WIWVgukQMhS/Iz
	l9OHwxfyo4Ckbyc6C+t55uFYeVLLGDGPDWhQ9hsqDp3BosRUr4mVHLNbbafhtpQZ7yZwhS+gKaO
	2P1ETumvxar/VXVn2gK3
X-Google-Smtp-Source: AGHT+IFiwhNji8Lf/iwS/ygWq2vKMB+3GZnN8Ve/tOSfQIqp9x7RXP66a/ZU5FmQMIv4WX+dRn8Uuw==
X-Received: by 2002:a05:600c:1d14:b0:436:46f9:4fc6 with SMTP id 5b1f17b1804b1-438913d63cfmr233979795e9.8.1737631919110;
        Thu, 23 Jan 2025 03:31:59 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b3189ba8sm60603645e9.5.2025.01.23.03.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 03:31:58 -0800 (PST)
Message-ID: <d4aa6903-f350-4130-a915-7a8d2916f1e0@nexus-software.ie>
Date: Thu, 23 Jan 2025 11:31:57 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some
 RCGs
To: Jordan Crouse <jorcrous@amazon.com>, linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250122213427.28169-1-jorcrous@amazon.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20250122213427.28169-1-jorcrous@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/01/2025 21:34, Jordan Crouse wrote:
> Update some RCGs on the sm8250 camera clock controller to use
> clk_rcg2_shared_ops. The shared_ops ensure the RCGs get parked
> to the XO during clock disable to prevent the clocks from locking up
> when the GDSC is enabled. These mirror similar fixes for other controllers
> such as commit 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops
> instead of clk ones").
> 
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
>   drivers/clk/qcom/camcc-sm8250.c | 56 ++++++++++++++++-----------------
>   1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 34d2f17520dc..450ddbebd35f 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -411,7 +411,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -433,7 +433,7 @@ static struct clk_rcg2 cam_cc_camnoc_axi_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -454,7 +454,7 @@ static struct clk_rcg2 cam_cc_cci_0_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -469,7 +469,7 @@ static struct clk_rcg2 cam_cc_cci_1_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -490,7 +490,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -511,7 +511,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -526,7 +526,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -556,7 +556,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -571,7 +571,7 @@ static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -586,7 +586,7 @@ static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -611,7 +611,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -634,7 +634,7 @@ static struct clk_rcg2 cam_cc_fd_core_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -649,7 +649,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -673,7 +673,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
>   		.parent_data = cam_cc_parent_data_2,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -710,7 +710,7 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -734,7 +734,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
>   		.parent_data = cam_cc_parent_data_3,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -749,7 +749,7 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -771,7 +771,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -786,7 +786,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -810,7 +810,7 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
>   		.parent_data = cam_cc_parent_data_4,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -825,7 +825,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -847,7 +847,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
>   		.parent_data = cam_cc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -862,7 +862,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
>   		.parent_data = cam_cc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -877,7 +877,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
>   		.parent_data = cam_cc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -892,7 +892,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
>   		.parent_data = cam_cc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -907,7 +907,7 @@ static struct clk_rcg2 cam_cc_mclk4_clk_src = {
>   		.parent_data = cam_cc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -922,7 +922,7 @@ static struct clk_rcg2 cam_cc_mclk5_clk_src = {
>   		.parent_data = cam_cc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -993,7 +993,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
>   		.parent_data = cam_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
