Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242DE1E32D3
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 03:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764302117; cv=none; b=NTPHTvWSZJfcSpEI63e2XE1+Lz/M3LNZcCmrb+bOhKpxiB7Y+l/ZMH2nclxvva9Wjo8l7/eXpvnc9VsT2RCQl0adQZNp3QGC43vgrh7i7oIPNEJA+xJaWoLBRuHbknMjB6yDiVTgNIpXljxVc4GM2zENYB2BjkMvp3SP9pmw01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764302117; c=relaxed/simple;
	bh=DiUR9qdZhz5P68RLrOr+H/4Mcc0hRFbsSruujO6fyZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKFVsBPdN5VbmCOLMo9WzAnK0Lk7ckLEMMI+LN9t/jPv00NAWbgV3LMKwdhpcSWLR5r7uAxBacUF1L+Qv0xYgY1C21zVRTAnXUKcCWb0CdU+QZuUWOIsfmciOUNkPuh/AFVeWTmagcXMbo/Et4CHDpQmEhIghKaK7Q/V1qClI2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+a07tB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFqlsKZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+a07tB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFqlsKZL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARMYBeK1772503
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 03:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kV2X/7mo0rIsekA6wdOuUG/keiIviAurJKPsAJsGO28=; b=J+a07tB6RA+KltC/
	LWLfacukWQN1qm0aAIpoXIKbMgYu3ZlmwXYGt5vun0QnaWaTm8YLdKk6ix9QuhNx
	Lodb2NMBp9uztFQBl4fJErKRc0nWTgKjLm25pDvIlBMeddGNuMH7XwF4H2bNfjpM
	8memraML1g8YjvzmMs9E9KtS9WWUfF/QZcR1Cm+6WkTdZTqjDeO8NnK3F6/D+LVp
	XV32Oc8kOrCK+ZSshjPc53OcFsUB/AN+QHP3Dt8TNgPFXObuAeS+msG5n4H/+m8i
	61v/6l2ozqvvyqlwhsI8ypjpM9r6mQCNWT9bvmDeGXKd91ArOuWtIQkZM3LD/Ctq
	kLngkA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxhyf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 03:55:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so1037112b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 19:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764302115; x=1764906915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV2X/7mo0rIsekA6wdOuUG/keiIviAurJKPsAJsGO28=;
        b=bFqlsKZLsVbwlfvxyMmLMw9m6Zifgem4VWdyITEhqw48oml82FcgLMGM08Z+r4h+zC
         SjFXk606FLMgVVCjI84w9MXvLgDCyqBSZDo460Ke9RRcL7ZJ/43EKOE8KUn3JEr4QMIj
         70iZ9F9S1RHWhZ9fwIRXkTpwq76fvJGvgXBrYn3xpREQlLWdBveTXhIf4FmmM/M3BnHy
         Mb7InnnsSbq/6ajeQlQrDahmAoNy0XWLBaS9Ld+NiG9JiC+bjjq8RsKh/3T+7tZ1gdqm
         Ei8cclDz1qVl953IwTpf+RcPaqlGIIJEbftwW/5yZYScqPfVOa8KhRqB8XepAyy01Hat
         KLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764302115; x=1764906915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV2X/7mo0rIsekA6wdOuUG/keiIviAurJKPsAJsGO28=;
        b=PLw56hVQd9Jnby5yLQVsysanYWUWTxhIEkTudoqWmMyu/0OIHtG3VgPtXhwhODxdyl
         qlQS+RtAB/IgECULwg+u4BlIclcmIsThOnQ8aD1YVQZQLt0wA5zYjSdtjJ7EJIImlhyM
         BINGD1myaNVAdVK6ZM1wl5n9G2buIX2r2yZZasE6HSsaZh+wMaKf8w0dvZX1JUQHdZKs
         1MxCZ6K9yYJVIfIZdgNV1JiowJh9VbFQYZE0kI7LmfmWrX4vha1jQ1e3BuSTH4zu5OwZ
         SqkjV8TLrkALWLp4NvK0vpZYBKIpBj7j1EUp4rg0VyLl0iytznVLvyvPYmW941U2sOwp
         +GOw==
X-Forwarded-Encrypted: i=1; AJvYcCXq7UlsPPyFUBu944B7+a9DIwgClgZleFrOhzYNwdx6svHM6XjglJRoG68FJacRuYWE2Li2y94CFRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF5P/KP+OODW2bFbTiynLa+TVWDc/bEc2f1TNth31xpHFMhRPN
	SdrVRE9FpN1a/gXoYTcJF6ekAdJORKHI9ZNDIigkZtqjILBlYkjFU3ZKd8gcQF50lQYYwsMdc0a
	1EVOivxsjiDnT9jooU0Rlgx5PYJVP//3g3dbivAe54Jssy++ENzbjinNZFwhOmg8=
X-Gm-Gg: ASbGncuWLuIvRLp8jHiOJ1y1+N7tXd6qfeApy45pwsnsdnaszygGW94MovJoEVl0ZL+
	Ax4uZuW1eJKPyaioMxTzqWfjVsQp5wg9rQAwVFg+5hv2PLNi63ipIiGSFsfApw89dFQAnOBdVVG
	6FotXHJITWKVgYU07YFSkmwJ6u1ktq0CR07ctO7nM0NkgCABx530m9LaXAnbZQnUgjv6baFrx3S
	ajaNsjr0aDGahBYadxx4uCA7Zt5TbMpWhh/agVku8cDG1cpCG5PP0lbaOl3w5fDJB4b9wIATnOL
	IJHLft7OkLwAdSunCnBdB42DNRZbT3lklEQ7QUzL+KS+B5hKW0Hasu8blHzbZ/5sYaLo9MettYh
	wgaoY8Hhwomj3pBxh3tWKAqD1Q32bksG02HEszg==
X-Received: by 2002:a05:6a00:94fa:b0:7aa:bc48:abbb with SMTP id d2e1a72fcca58-7c58beb7722mr28176519b3a.3.1764302114622;
        Thu, 27 Nov 2025 19:55:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLCRSTiu9QVZFMHJEy78ABFgNWYMdWtPWhleCnIoj7ryH8Yls3iT+gwaLw9zDwXADkfoigSA==
X-Received: by 2002:a05:6a00:94fa:b0:7aa:bc48:abbb with SMTP id d2e1a72fcca58-7c58beb7722mr28176488b3a.3.1764302114116;
        Thu, 27 Nov 2025 19:55:14 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3e41sm3339085b3a.33.2025.11.27.19.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 19:55:13 -0800 (PST)
Message-ID: <feb55ec8-9c90-4660-b729-e81b4fe2bd9b@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 09:25:05 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] clk: qcom: gcc-qdu1000: Update the SDCC RCGs to
 use shared_floor_ops
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
 <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69291d23 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BxFOA6ydGOS16N4CFHUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: fGpkD0FGtA_0qOy42wgwfwl625rA3IZl
X-Proofpoint-ORIG-GUID: fGpkD0FGtA_0qOy42wgwfwl625rA3IZl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAyNSBTYWx0ZWRfXwC432rJ722dz
 sXnxE7RQf1pmw0CRUc+ea1P2e/W5Zz256K93cwohTfzYYDyya4eQrDz3o0u93LgwLMmm20jXTkm
 UtgaHLgvXolVyb8cpj/ivCw8Qa2wXLHEPRs8RkhAU5YmgbFXZEf2HZ7iuaa3rYWwFchNiL+XVZQ
 EXnZbee50HAQRy7lPmEnYt40cfWQBAOueBYcEWNSN9xjsgAIsO9DZP4rADTuZ7byLztD7n20USi
 hqSLcz/wiO4L4GfKetOpokGyVcd9G3lUNVEpEk2XYn9VxTKQTnYnv4Vth2/0WRYYpFLrp9ltpK4
 RE2JKWfPCeYjrFiBY5haj7/KCq8kdJb+5yTuuKnB7DDzUn1U8ma5++LESapnHCFk8TIeJ/7KFRd
 AjHBSDRZ9PNVUNp5KTa60P10mhncPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280025



On 11/27/2025 11:27 PM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: baa316580013 ("clk: qcom: gcc-qdu1000: Update the SDCC clock RCG ops")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qdu1000.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
> index dbe9e9437939afbcd50759dfc21a599864278816..915bb9b4ff8130e086ad6b5bb8872c79617afee8 100644
> --- a/drivers/clk/qcom/gcc-qdu1000.c
> +++ b/drivers/clk/qcom/gcc-qdu1000.c
> @@ -904,7 +904,7 @@ static struct clk_rcg2 gcc_sdcc5_apps_clk_src = {
>  		.name = "gcc_sdcc5_apps_clk_src",
>  		.parent_data = gcc_parent_data_8,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -923,7 +923,7 @@ static struct clk_rcg2 gcc_sdcc5_ice_core_clk_src = {
>  		.name = "gcc_sdcc5_ice_core_clk_src",
>  		.parent_data = gcc_parent_data_2,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
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

