Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E726221B18B
	for <linux-clk@vger.kernel.org>; Fri,  2 May 2025 22:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225739; cv=none; b=KZx0LLBeIHImKa+i5vFnpXGChTV118gw2/CpXKcPHBDfjJIf49zAnITCxIUXGulAK0YMZF610uN404gd4EzQdngR2YP30I0iJvZR6aP2tiQqniPm6L/tijarMMAXXf97B2FzphmJK/IN4/DoHRKIAj0+jqBLVZLH3/dkrHBcKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225739; c=relaxed/simple;
	bh=m9NYJKIZt8NO6Wjo6GBayzciQLJLCP9eJPM0uU4PPEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3XKwwQMfQ7BMZayftvoDhJukz50a2cp0MGfJ0OSHz+pm5sGXa7VbD/Glzv7OCOyfoYsQAWGbaNOXFXe4Kf5Ld3t+cVKe1gxcyZ0XfvbMsSe/LqXlUnOSuHl8ng5draDIstjY/85QWO/4SjEG+aulXpJ8C3NhHi9bjmoZb5367c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0rDGCIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0rDGCIt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542LatCl022694
	for <linux-clk@vger.kernel.org>; Fri, 2 May 2025 22:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=crpVW1GAkulPAn2rCtcCM15V
	7zLdAQEB19gyDBO//vQ=; b=o0rDGCItaBuJ7oSVDCFdg+Hg9eJDavqd86Et3mUL
	NEbIfFpmrYI+3mFz55vQZNEkz7/WvKKKTPjB/GYN2YWAODLJSc5g2BZlTn7I21k3
	kEygjn7PvAlEGDhNWhMxAeFHfJypIFCeU+HbybGR5g7PiJZHgSwPo8Ak5nD/xaMw
	jJP5NZ0bnekRZuJxbroXlY8Ws5qloKKGkFPYZh3MQmi8V0bIZ8OY7ZG7mhw/FlEy
	Ba1u3Vss6MPQGrfnNYf6BKghMpLjkSLQFRp8D4JGX/dt7vYxa7tiI84mh7TZ5o9r
	5rUS/7I7e1O60upU0vXG1jxD9cLySD65dntDraPqB0PlnQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua1eft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 22:42:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4769a1db721so65695241cf.3
        for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 15:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225735; x=1746830535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crpVW1GAkulPAn2rCtcCM15V7zLdAQEB19gyDBO//vQ=;
        b=iegxCsytpH698FaunCUz43p86QERd0q9M+IYFJ09Ntc8aLzcfaSVm7Ld/kuIrUsjil
         M4XrqjMMsdWbOjAmB/axo5nwZqmbVwTLQkoc4/ByNfnhyPq/KiIDJkJNTBu1Odjz7f9H
         zD4dYgs7Gc1RgiB5vi7X7gi/T/qiMBkQ8qwNGA5S33Y+CFILcOyuBrFApawsPnefqjdF
         otCpN9pVRN6xEH7b8itu2uPA035xwT5XZ7jLZFP7VHAhoHbVa2MsNkZTaCUFSFYv9naz
         7eFOQORbeDLyHwZNkyrYIbChEyOD9nqBEooDAmVSyLOFGmz5oB1AlbNj5liXPVM5CZMq
         miDg==
X-Forwarded-Encrypted: i=1; AJvYcCWwon/xJA9smpKl9pQuZ3wxbLLoGbW2BTct0l4vKJdH5KaFrAwkTuIDPJ4frlo2+UxBfsn92CaRgDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPr4vTjtBzbV3l6ldun/wb+Fk0A00RWalgzszUbdh39pxId+34
	dJJ+o/NlA5uQUxzTjjXZJlmXzwGz6KGBqGF5/oBiUTYW4VFo4Zqfmh/GwgNkcM3i42VO4yiupi3
	1U+FhaEEZ0G23Bv9ra7adu1a+avyz+CUqUnrlmDMwA0TPp+qDvxHb5wQRasE=
X-Gm-Gg: ASbGncsUHGKFXmqIhXSht02lXhRMklcCWXx5WDsW9yAnummaHhydXY+dk7imEBRgZYW
	13FAnZhfn5LOSIUAZN1qC3+e6CZr5OYyBz+gu8dvKOzkt3Paxxw2bmS8zNf1ZOv++gS8MqSTXh8
	cmuX/zJV7NAr0AgJha+/CuufXP19Xx+Dpu0b2Fq/a7GlxdBvRg4eMKdotNqgVzeP5R3ZBR/Hz9n
	yRpxdJLRHuXuhm1/r7eN+a0USCutSJU5N06tqEBOSIgsRi1OLZrVkaAWScwT4JmvYeV+iiaEPxh
	JQMmtrXF8DF/yk9+m2xoXOhWGgbs36DKt1+4eijyFLMh9gDSMFpIediHVU4bEweQJOuCo7GPQrQ
	=
X-Received: by 2002:a05:622a:4a18:b0:47a:e70c:e1ac with SMTP id d75a77b69052e-48c30f6e31dmr57477251cf.9.1746225735438;
        Fri, 02 May 2025 15:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlIBZLX+XF9YXHrK8MhefSo38cVjTTSSX+WjsmilD5TLhYOiseMueK4E3PQfWe7nPXtR89dg==
X-Received: by 2002:a05:622a:4a18:b0:47a:e70c:e1ac with SMTP id d75a77b69052e-48c30f6e31dmr57476991cf.9.1746225735064;
        Fri, 02 May 2025 15:42:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f219dsm516000e87.206.2025.05.02.15.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:42:14 -0700 (PDT)
Date: Sat, 3 May 2025 01:42:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 06/24] clk: qcom: dispcc-sm8750: Fix setting rate byte
 and pixel clocks
Message-ID: <l6hwojjbk4e7eahoqcjprzululibhgrlpsv5zi7odicwx2wuvr@6difydf2mbz4>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
X-Proofpoint-GUID: c_OGphEAoLvIEtrbKXQzcEP6yy27DjWu
X-Proofpoint-ORIG-GUID: c_OGphEAoLvIEtrbKXQzcEP6yy27DjWu
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=68154a48 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=Fh2Cff8sOiI_5vdZZhwA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX50JDmzdUF8Cx VAFLY9O9xY0CXosVbYW5S6NVYzc/EXFYgK1VU9MrR5QBc+qw3JKnzW0KIGD7dGN9ZRIiNkDKjHY Zs3/se+dAMfmKTJ/4AdwhRbte46V0RLf8gMIdTY9ZXEKD6VPGoUhV+KqP8WwSreBCVD4vDw1GjQ
 QyanRgrulUv987GvVNKCRI54aOQo4+JT8O27CBP+FZvj/pj1773oN4lb0nTOpfr9R+o7hDNFsa0 LkLZy1qE8/Fwc1Oc4RkUX9d3q8oc1YqsEMb8uv/CdewDn6FcuaGGxf1QScLTboVm/fbI5CYdFU/ sFEuRygmd1SHFZsRsz1USppHcoioMeHh3HzRwTfays2JpBYTeiY4YGDCnVzMkJ4YrZLZmpqGmU6
 cA7JdQanVY7/Qf+59yA0hDZVeHowCqPneZSz+1JCozrtSdfvNMBlvQiKjxhWYEDHATb4fHRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=657 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186

On Wed, Apr 30, 2025 at 03:00:36PM +0200, Krzysztof Kozlowski wrote:
> On SM8750 the setting rate of pixel and byte clocks, while the parent
> DSI PHY PLL, fails with:
> 
>   disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
> 
> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
> CMN_CTRL_0 asserted.
> 
> Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
> enabled during rate changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch is independent and can go via separate tree. Including here for
> complete picture of clock debugging issues.
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/clk/qcom/dispcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> index 877b40d50e6ff5501df16edcffb6cf3322c65977..d86f3def6dd06b6f6f7a25018a856dcc86fc48eb 100644
> --- a/drivers/clk/qcom/dispcc-sm8750.c
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -393,7 +393,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>  		.name = "disp_cc_mdss_byte0_clk_src",
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_byte2_ops,
>  	},
>  };
> @@ -712,7 +712,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>  		.name = "disp_cc_mdss_pclk0_clk_src",
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,

I assume that these flags should be set for DSI1 clocks too.

>  		.ops = &clk_pixel_ops,
>  	},
>  };
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
