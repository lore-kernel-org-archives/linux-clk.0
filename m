Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177530DEA4
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146950; cv=none; b=rlSfYy+cv6P0UIHDKb5Vo5s/hkNgdNra7qyTlhlNjHduPAbWCIYR4rZ7y5UwYNB0Q203cupWC6FJcc6jnhj6SCZHkFIjEQbQoUBkkyqWT+gDEkNwH8b949bo0stk4691ElGxIqNoh5aZ8GkZONB4QkVKvK+8/XOpNO0fMti7bDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146950; c=relaxed/simple;
	bh=gk6FY/exCe3UX0ZIgiuhmVirrEMVQ6V0L91ME4nTxoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOGFembPASf7oO/B3CKPuKPiOkLV5dlRaiIPMJBE5DPcr74Yhw5OfZNOageXZUT7bHlzPwUFKaZkPo+cEeJbBfuyJvAoiSbv18RDrDiPQuQf+PV4UUl9ehNlQc7Qj7x3+6H55l3OXVkfcE/gFDSbYgG8oEoe77ydpxWkabAoBGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltvTt4h0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0tXzKfk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltvTt4h0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0tXzKfk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6IIJN3890398
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJbqLb4d9VUZGeN0fl4bqGBwMdTKQQYI6s37fm2IHsk=; b=ltvTt4h06Gn8bVcT
	jEa8QcX30xLmzee2QZ7E3U+tILfzDWLpjjZIOuzeNpr3/ypiizItS/r49pgQxk3/
	OOQsoTQl9sjs43vy6IpBhvQ2FKCLfBidqiBB+APGT2lVBIYHIlG7sEnl732jykmG
	aY3xpCXrD1AiXSsnpi+/xitcD1ULu3udUYghk/o9+k9hULd0QKf+d6Gb+srljhMT
	Uz9B2ieEmOo2vo3cla1RaQCDE3DrVIlsh48cibTHolfgktoD/vFBXxVc/LaibFfm
	W/JPi8OFHDtsbrdPy73hLeeg8Hu0ZaxzMSVyhLgF+U+PGw/GWnK+rdt7QiKT53fd
	yvgrHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmea4ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29809acd049so127052115ad.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146947; x=1764751747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJbqLb4d9VUZGeN0fl4bqGBwMdTKQQYI6s37fm2IHsk=;
        b=c0tXzKfkIUb0l0IxLQ52bYSwQ6bt6Bak3XGPk6Ovut/MEEgzy/WqyW+TCm/MA4Eepd
         3vppvXlZu3mlBLhTIFW40VNuuqRKIjJO97JIPaaiOkhCYC6iypxNLe07O1r9xZrss5XZ
         d3akT547pH8d1Ebk2NJr5eEDyha4CKqFqtJcPcM8R61ftD4Jk/M/Y3FiBOnsRGRqH/XF
         V8QUQZbRIjcWniNC2yg7jFQAPUl1XvWaaP3rYRS+nl0771+/1GUFnMM4SMDHh+4b7bUg
         eLuuQKALrZBrUZzS6/5+OSu2hS8VsqENNk38h8uBglAwCUH/ESNdg+Gea9XdcQrlbtQG
         XmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146947; x=1764751747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJbqLb4d9VUZGeN0fl4bqGBwMdTKQQYI6s37fm2IHsk=;
        b=PVt3O5fEgsNxAmTuXVvi4SEHTDIYR1TBS73zBS7AMP0q7YjNeclIt2S5g87yNbJR7/
         RtobeCYArjLbCIZ69H7Sx76rBq5tlytLeKNx8Um0rkVB1O+tcN4v5C+t/l6/jHg5xEdv
         AUB+66vW2a59jA2yXVndF63M8wYlLNpwmkNvJ0HcFDyRg/FUQRSM+2TMpvdUIpHfxEp3
         EET7txc2ABotobFYMCBA9l+wAQHRAdNLsDcM75ZQSHWUNcJSTR0Ca5luXfbPvuIPZ37v
         NYgM+UsmHqx6nAmnpSAksJj1X1uPDHy1EdZDLwV71pHAf6K+DrTlnYDChUOTi0DbsHef
         bSMA==
X-Forwarded-Encrypted: i=1; AJvYcCV8c18s/EgkRXV6hmKmunfTCsYKYWOlSUyV4SkPnvYbxEOHO+IV5kJRXZG62kDCM511TMviZsceNY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85hrv9DqA92808RWWcmbNDXwWyIWkQ0acMGtX08ta+LJff7VQ
	T9tFOaurD9Kll2TMh0dcnR1SYElDG1RdT4Mp2bd2HNKDdf4N7TIFbDWOWBgcCiyAgMKpRwq6ACb
	xU97/PELEHlIx36Gp1Lgv40OKdfFl6gvRyvsucCj1iTLQEY4WIqrPjRdwdt6VfQ4=
X-Gm-Gg: ASbGncuUV07ddZ2d14DvMxD93yTOzJcVCi68To+pHsxwnHyIQxd2Nu/XrtxteFORHlt
	kfeIlVIBincLIU62cI+zrSNYXtKBJQn8TPUfGUUGda9GhV+wrOoFz9eNVxzA5hESy7P2//J0WzL
	O16OgeN3gVNeEMDyIiEDzZCGonmtoaLiYSi1VfYSIBvUgBBydXpcO18JxuwDw8Cx2q30H+um+8x
	aavLWF2v1fjX8pY/EJ06TCNrc2Byu2DiaJCx7t35x2FolgrWliOBl3YipfyK0pCsg3EXZj/xFH6
	/3re8LYjDKReTCT1BXHFXvT7vuPNAvOie8yp78h2CACYh1hs7dwmb8Yn89dgdHefuecDuv7VIFX
	wWun7/AElGOiNWaU0M9dMMpxJS79GLM9V9wOt
X-Received: by 2002:a17:903:1ae5:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-29b6bf3bd68mr206687475ad.34.1764146946763;
        Wed, 26 Nov 2025 00:49:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErt1qd2Un8WGSuB/03VkAMAmnBY9QCa6Co6dCEREHFFW5Lh0pUl11JX5DQT8aZKSgxmlXUpw==
X-Received: by 2002:a17:903:1ae5:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-29b6bf3bd68mr206687245ad.34.1764146946307;
        Wed, 26 Nov 2025 00:49:06 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a80csm191356455ad.35.2025.11.26.00.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:49:05 -0800 (PST)
Message-ID: <f6df63fa-9904-45d9-9e5a-7b30065801fb@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:18:59 +0530
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6926bf03 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfXwr5FMKXixyFQ
 9X0UOQAobCB7G2ttqbKWAld+T5pzUGk1LVF9B+bK5F3DS61d6L+YcPejPUe+BvEr5k2dTVLkPq7
 p7FJuenSdmB2JK083EORAhJm7ZOlMI0mXg009r0XzVYEQzg3Jx4BhgPuS8BSDAZ2ztdoPFcsfj/
 GRaRZoynB1gU8MTZsVkA/X/WYWvVKyQ49UpQ0X4o44BCL0/cX3HIVdsYiJkq2JHbcmlCZOR4TgI
 MrITfgGZ1q/w5gJwr7K753bfKkxqGXaYjOSaDZLc1c9tbENlqmIxLcJ09KXNPNZ8DSvfiH8H9b8
 grcRb8LzbDIKd+oopGpDVLFYmtmD6/bKyv2TX41jQRo3pZ7LzeCsUeow9RvD7bYtj2iMvJw6wX6
 wRQYEa/R6SjXPO+L8XyIafKaVcI0ZA==
X-Proofpoint-GUID: rQ-VCw-8h_K8gOd7AD4aoWxwhxWQG7mX
X-Proofpoint-ORIG-GUID: rQ-VCw-8h_K8gOd7AD4aoWxwhxWQG7mX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071



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
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
