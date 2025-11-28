Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3621B149C6F
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 03:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764302142; cv=none; b=JmdkVcA6769kt77Hog7n+B4N/G2eUawncvxaV+JTZR63dfT4eA85IuvzIWB6CBUokfwQ1HNDiQ1pNGw9oAf5x53juWMAQ3hZN1Sf1beyzsSx6wSbnm7JJIAz8208hAKsTRxMAMC8GLpYW344d1yGWeVJ+o2WFGebozz6dBPFYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764302142; c=relaxed/simple;
	bh=IeTUGQBihXldKwxVZRfC3Ibaus9jWGPghfgg6wC9iwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrYLfNk0vos/1TEJIqAzSj2aJCQ/34nbQdjX2GqR+EtX3Rq7eN0L01m93KdOzp1q+aUMiQI/4Jfg8GESvw2UYHA8dX7+igeRdyCUqd0ghzdja29gzYfmkWBpdFQLm67a7mLQIy9Qc+i7zU5scrVwA66jag+WMhz4VHrPbS9aY6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obqZA9V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3Zegj4q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obqZA9V1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3Zegj4q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARMb7dO606782
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 03:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6WPJq973eX+KP/yKOjzdDcbbmr+wFA5V2WCdo5WMyI=; b=obqZA9V1TCHI6pPH
	jzCmZKRVUgL2G8nwVIwZQ5pXdQzFWGDrMZ3utrYGTOKkSqdoEhq+Rj7PBStEErcU
	M6BKysL++t8W5WAbq6vUZdsp70JW5t/u2p0/5rfSQtkjV4fi/rtf0lDV5++lO2kr
	ZpoSWRzo0l2RnfdPxB9y9h1lh01z8T78jTPeYE+zdTyOfgmiRjLKaoS1sEydVGFA
	3dc1Nu27Folptl8uw9zt4oVTXy/z0iD5+deX5lPLZeck67giXQJglKxJ6Ung44GB
	NfF9Ift3ATheLudB3sdZ9qV1zVzs/lNfjMr/YtPSpdGXnxzASKVCuWCGPRgkZID7
	2ECR/g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5j6gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 03:55:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343bf6ded5cso2111188a91.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 19:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764302139; x=1764906939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6WPJq973eX+KP/yKOjzdDcbbmr+wFA5V2WCdo5WMyI=;
        b=a3Zegj4qVCshqMbzypnCKCZ0IddY280n3+f4kDVnKmnN8YqN96KYcHNfIn5RTgucLr
         jwyEo/FAR50MXjD4kjQS24pAOG9FuQpXmsXI0u1tBK7BR9CVGzd2zMEuwKkuGTzhTt0L
         GDE+tHYrxAswZVW5rN+mFq+HoQQZF7OYqiIBC08hhQzqAzoOxnvi5pgEK+Pjw+S8HPym
         BGInwb0yLaqjDGxP06UbpRruvtivt1aW7Jq4azwo7YP+PyStHWViQB5GGgR+gkCsJNhK
         usOQJEZszcS0dFD8C464d2vs71CmkrPq8PcImMRzga/v7Ae6Gh2b8twvyJaIzGLFnCAi
         2SHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764302139; x=1764906939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6WPJq973eX+KP/yKOjzdDcbbmr+wFA5V2WCdo5WMyI=;
        b=L5ge6jNF8o8Ki1hiq8aLwsY7Xdx7rKaD5ZWPF6WQg25QjvYeWcF1i70djjNfR4NDCa
         sE/sKidrQkpDVHd5tLVbFfk+K6FCCsEDosGxAznT0s8pET7kfaCEQz3u9yiNablOdbIm
         ap6KFSMfv/gB2goByOmG6sb4F6InPUgeEQ+mmacWIpRov8oUsznCXNo9j3Kzrm2EoL9j
         CmW0Uhb0oNjhT2QqXQ3XZjnN1Cgfj0zhZl53AmbwILM6o8akfuQWYZIigDy20EYbWnww
         nTQIsLDBYlkFusRtvyQBf7oVpeJXHjGalB7w6Lc4Ev3woF/IHdUXviLHs4n0gLpR+LVE
         B7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb555OByAfunSQg3UUv4nBbPCvSBjgGMG7hGvAh2M1W/zCesFp4c+l2c+D3Upx35zgRyWSQnx/ySA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6l6qJY2vBR5+iPdC7CIa++cXEiEYVmr0WllNRPsWeo2mgeub
	TTQwjT5aOe0dYgiCF4WAKKLgFu13Jf5uEVqdLCxDfe5SNJoVQNMDbKmuDyL6D6fsGztASHui7vr
	3Dif5u96T5FWEdCsmZvmxr/xM/KH4T3NUH6Iu/itN1LZA4ynYv1zlHXFyXGZjTYE=
X-Gm-Gg: ASbGnctVByf7W9Feg1DgnwU28X1CEIOwt9aIVhkI0U6JYCKsFN5tlv4xJm+sm3UINax
	L51E3piCPT8omJkkchL/QIPrIHY++txLSq0cxkL+h3zruPxvQiBfi3YLAd0Lgty90fLVq0fNvzU
	gAjpWYyUglIX2kaHspGCOOVqo718mfQzWil9IWg7UqDUbf4oSui/C3LcRyJxLbUjFOPyF//UrUF
	QqdIl5iHFtl/F0sWRzzEBEnQ/nmdHtiM0w0z6kcaWaTFNBDSn41rGQM5Lcb9r9PYRSifzKmTtjz
	nvvTLrDO3uzqeYY5QnH9niKZiwwkSPe38w0ymiJJJpWszOCnzC5N3mBQcdnX4pgLrMmEu4Ff+I+
	8R69wG1XJjmCuPnO1CsRGu3KntbDrZSRkfxz0PQ==
X-Received: by 2002:a17:90b:2d4c:b0:340:b06f:712e with SMTP id 98e67ed59e1d1-34733f22104mr23805112a91.19.1764302138932;
        Thu, 27 Nov 2025 19:55:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzaTpzvVEcgi4SvBYVDFQZwxQ3RaZ++NVOh3Hp4KAq7hTbG7ZICn/N06Wl4DveGKglzbKmFA==
X-Received: by 2002:a17:90b:2d4c:b0:340:b06f:712e with SMTP id 98e67ed59e1d1-34733f22104mr23805074a91.19.1764302138406;
        Thu, 27 Nov 2025 19:55:38 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7c2ce5sm6884455a91.14.2025.11.27.19.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 19:55:37 -0800 (PST)
Message-ID: <547b0b85-d353-4bd1-9f25-6876bed281e6@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 09:25:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] clk: qcom: gcc-glymur: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AS1Jyasu8XLM3ISSqt_3bAiYQLTIS4Ef
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=69291d3c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BxFOA6ydGOS16N4CFHUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAyNiBTYWx0ZWRfX34xnEARUcSu2
 KJn1nQFXhnkXhbIAnmNv05DUuqHcI7QVFuT3LjpPQIgrAuO10CUyodtuxW40uNLFJx9FNf+5uEk
 5KYo+A6wvLxstqYr2ttRob1gApjM2Rn7P5SpCa+mMt93Lcrf3btJ3Er/4TePJ5AXYAnGt6ygwXw
 fg0nxTJRGXbHEO6C0beS2vsOtc0ASbO7I6GWlpsgWX3La0p9v1qgQ7ZNS6HttXHofocWQ5lZ2YK
 hhN7YfXfie26A6eaqo4OGGteEQbgEPsEYzis8f4BpN9+fJ1UHTkopPObdN0K36bcCgfPV67Fz5j
 UmKfAnzSGmUfJhVzShcyDGDTN8ysGEMQzQQTmHH0nhLJ/QFI+3ns3mwo8OPtnLNAbkAm0cZN3mp
 niQooAGqR9aE/iTxkZD5FiNhxt46OA==
X-Proofpoint-GUID: AS1Jyasu8XLM3ISSqt_3bAiYQLTIS4Ef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280026



On 11/27/2025 11:27 PM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index deab819576d0e18afb0b699b7ec6fa4c155eb5c2..238e205735ed594618b8526651968a4f73b1104e 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c
> @@ -2317,7 +2317,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_17,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_17),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -2339,7 +2339,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  		.parent_data = gcc_parent_data_3,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

