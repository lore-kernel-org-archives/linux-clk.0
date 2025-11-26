Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394BA2DE6FC
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150307; cv=none; b=qaK0KyQz1mtBd+6Ld5MEQ8lHSTeGvoul5bPLrTS1oFcdyMwTKoxk3UXQEaM4o+zDYQ4IDbpRygg0f1aiYRjqbXe89Vhl278mLHbC//0dhuoHIl7hXj1qF6wZMLdIcHwy4f6sAiHT2ivQsRZZObuMqnT+CRBMHiBKFUpv5fK+AR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150307; c=relaxed/simple;
	bh=7abUYFU2x1ym9PL2ZhDm/hAZFd6ZeTvVDN4t89ZYHB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkAl7YAUOPbLIg3K5vTHHkIozmJe12YvxveAJA2E0Yw0Efvk3PH4NcFbb18QaRKITXKfMOih5A/MjhF+jmQQeaGjw8DTSabQUMctxn9W5OG40NUW41p6vyC8i3U6dRCeWngQTHRieA2/cZxi3ZXOi5q4/r5bKsvIJQssQ7QDoXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YosCgJ4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxF+7s8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YosCgJ4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxF+7s8K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ92LsM4047385
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	13cX6ISX0IUFbarkIJQizFXgndQqjxKiW+kyYBUSSkw=; b=YosCgJ4hsyVg+UZl
	S7B6fuq0TULCnoK1e8BnoHE9Z8FtCHY1OWdG/Jw5tnIGejDEVEB7xxTkCArpk18E
	+capP2Blvy8xFXYLbL6y5P1IwDkzcGFIa6Fwmq9jRnIvyYOvvQRCzfpJRzAsf6b4
	kM5UqBdO58egxcFLq7FFxAnt98kA1i9AdZs+kKIWgZHGDyvV3gmFmDedTpkvX2rr
	x5VQdXOwchqw0+690yGjd8ADXcRUdQIxwqp18wJUXAmZ5pInWVGyEF2OR5PLferm
	NnkWHt/84F5EAo6/5L9sj1uq2OsjnrMvC+fuEXPrKASjOEfXJdlHL+l7qv0bbPES
	gyJGHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nhg3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:45:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29809acd049so127820485ad.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 01:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150305; x=1764755105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13cX6ISX0IUFbarkIJQizFXgndQqjxKiW+kyYBUSSkw=;
        b=HxF+7s8KLh7rYrw90h0q1tzxCwj1ibtxZPaoYw1u9K8Trc5kmFlbETWeD5pxHZ2m8S
         l3UFNeCst2rOpqQAs9YQK3Qg4xZD7AiR3/I8IFpzSCqLO1Bro9RhVndycMmW4L4NyAG+
         cJstFzGrEQnjYnypDPQmHGyOZZ60gy+rhx3oSEPfhbw1g8sFHskWoE0NEYfOW/L3WGhy
         vzDoDCd6+jOR+rlbxteFggo1/95FD3/QbAqo45ZgdG/oR7lpjWAL+Wr9xICvfR2pCXan
         K2a9FlFkJSbfviGn5LkMfPWywv8d6Q70Xs7bYrVCepBiAb6Gb87dgFDYLJVkcVNAw2rG
         oUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150305; x=1764755105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13cX6ISX0IUFbarkIJQizFXgndQqjxKiW+kyYBUSSkw=;
        b=Bs5KLLmWn7df+oPRarrHqoto5A0hNKNKXjxYM/XqaQ9dMrJ1t2NiPqD75ac6NcZ+fa
         AsamYdKuhNPsEFWlPPgdaKYAk4h8iTrPVs66eur/xydEa1390qGVbymZvQEko2Cf55TJ
         7UmVoegrbSexRrGuVv2t32BweU1VMeTHAlRRpdJFVvKtSkDlRcxaJoW6ulCi7HI2ls70
         WxTIFkVIxkoMhx+szlVRWSYd8Vh07kiXb1dW6fbug/ad+TiNO9/6DT8+LDm/2c0u8CVv
         jxPm9hmvNEzNTn9EfyKeteyuw1rcw5b2hcX73wV1evWe+wNF0YXHLk4Ip3UxKPqGwsen
         plcA==
X-Forwarded-Encrypted: i=1; AJvYcCV0qBqjcC7iY023NhXi1VMxe1fltodZD0Zw2VcbSimP37T4fmHYg/Y8U55PdyyXddriNi9T1VJufDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI6P+gZPNYUyLfgXJCLgmPu7wOgMfas747FBbvc6p1BnmvMDlO
	jtpvzZW8yzw8J6gFi/BzfwZ/BPwcYvY6G65MoAkYXxci7plyvjvc23wEbm3ZpvyWKqPLz8fJO+Z
	seIhI0xf1ZGquju6zX7H5RfAFWXgXa42xZANADQKtjslZquW0E4GiVauGBmyvjOg=
X-Gm-Gg: ASbGncvm+NiZee2pH1td4IDlUrPeIp+1v6Hro997RWBRo+nhcwmgKcRg+S38VidDhyL
	y1W4DNR4YBEE0PPYkIp80myPiaI4BbCK3/0cn5oMhsley4rFY0sxNR+uZXNn7Gc07lc0xBb7oyv
	x2rIkaeIk4AwJMUaE8IIi9nxuXbZtDquzprYCgHvPl/qCKAyhRW8B80CQ8rxoTgaATms0qgDRub
	NbiQC9kHgatIjGjcGhQrpIxGEC5FWVVoKzZ2pyluYmQQKO4CPLwhptQa6/YIQNX9WZ+0JqxyhR4
	XOGII5UoMaaDp6OJA1fL/RjnKa57QNysiLmzh9j9ufmS5q+PimhM9ijAlmtJ0tqhxLFpp3jGHCP
	w0K0dzzXP1MAror4FW0Na+lGqSeeU0wbdktF0JQ==
X-Received: by 2002:a17:902:d548:b0:297:dad8:f25b with SMTP id d9443c01a7336-29b6bd571b2mr219758755ad.0.1764150304898;
        Wed, 26 Nov 2025 01:45:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoLbK2maKLMcz84rNu2gUnutRB/aUU1tQn+wSJzASrqsUq98Tp0ErDwtDaGSKIgyssFh4jgA==
X-Received: by 2002:a17:902:d548:b0:297:dad8:f25b with SMTP id d9443c01a7336-29b6bd571b2mr219758445ad.0.1764150304372;
        Wed, 26 Nov 2025 01:45:04 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e6c6ad3sm18918239a12.13.2025.11.26.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:45:03 -0800 (PST)
Message-ID: <be18905d-b2b2-4aab-ba03-ccb8ffa25418@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:14:57 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: gcc-sdx75: Update the SDCC RCGs to use
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
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926cc21 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BxFOA6ydGOS16N4CFHUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7efUCTYboeOeA_mIPVR5WDGHAMB0ea7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX/aY5qgTdN4s1
 Sfr0WY4djbw1YKhbNO2fKNM8eBW9QDworXHAyyh7EMj1TP5FcDZDMv7QoByxikj/hIqwRrWmZj4
 1VDmoUFR16Mo3xyA66TN5huB7tAG9XNaIQxoMx9e5e4lWYm5p+KZj0HNFE4TJrK68fa5slvInPV
 0sN8IfJlq3afewcBldn2Z39rPCZnBtHaRyLXTvvyOgiKQijK6UxNEKXfh6W3cfr0OX06s0SJsHE
 bT/NZYdBE2xwnL/sCouWtwlXEHWhwni1fc7LgT3j6tuhFho3HTvP0njud5CdJXCHkJpcdFM76Vd
 FLz3EdMLY/o/GieUW6FexJY3MrAVW2WH644/xtg/vJyboLsJOoh+n6Oeudp5lhOdHaLm6us9Jns
 o2WbItU6KUdvzw+D0x9eek/HjR8F4Q==
X-Proofpoint-ORIG-GUID: 7efUCTYboeOeA_mIPVR5WDGHAMB0ea7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 108cdc09b2de ("clk: qcom: Add GCC driver support for SDX75")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sdx75.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
> index 453a6bf8e8786308ef785799f71b6cff8a5a9727..1f3cd58483a2d6ef18b43fc2c4ea38a6f8750c5b 100644
> --- a/drivers/clk/qcom/gcc-sdx75.c
> +++ b/drivers/clk/qcom/gcc-sdx75.c
> @@ -1033,7 +1033,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>  		.name = "gcc_sdcc1_apps_clk_src",
>  		.parent_data = gcc_parent_data_17,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_17),
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -1057,7 +1057,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.name = "gcc_sdcc2_apps_clk_src",
>  		.parent_data = gcc_parent_data_18,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_18),
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

