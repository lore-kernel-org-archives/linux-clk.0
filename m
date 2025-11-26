Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541EA31A7F0
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146978; cv=none; b=DiKSYAHLA7DkLHQy5yuC5VJ092y15Xvm4C0Zh5J4I+ZuXBscPqkNTeXafvMBdrmCV0UM/HWVGQyGksvOXb/yxE2UvGMLSHYVFc71eGLntKDkylAMJeFAIVj5XyANHt4z58O82b1Bqui2VJDUyDIaCmIuRGNLWC+1dI/3+du2BpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146978; c=relaxed/simple;
	bh=xJkqiA2mCUZbdNXFhujVDnBxmGwgg3orfD7vlQC5W5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpIPODteWpZDgDby1b5fSr/k30nexw1OAKKyucwGzL4BLmSfmTaOeU+nDnXq6iZesAqB5ey7FM/M82YfIBPvoLg7rGKGS8htRF8zxPJik8juRbgXk5lTUnLIGY2hUznf8Uq0c6vFZFCdSuqqy+7aoIrwXFtqWG+Ux+D1d6sOa0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCzCcEp7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZ42/SlF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCzCcEp7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZ42/SlF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6IIJW3890398
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKYzaThavMfN9xSkCeJZ9Om/p7isw7/8Buf4mXyG9fw=; b=QCzCcEp7KlzFmQtr
	+Pr9LWJPbRK157M13xvyNzQ0CFhmvZdaqfALYQ4WHuhePaJusymFi60pTZy8gHew
	+xtIme1kQn/SpZ8EhRTJvGs6cM2BwYdbwroZyQ06ztqNlQHj6fhBEqhFzuE6H4gp
	OfaGWVRwdgsQ/lUrGRsqoZCPdkPfMF8hOGXTXCaoLnWdZAsuhl7Sw/LBpkgabvH6
	SXDtzQ7VdERXcQS4fq7XweJ82UFDPj81CV6yndXR1qvlk5KFTdZWjGmZI25Gv7y+
	Og7x72TzLq6QITww9hEhn6ewA2c6FzPqtx4tsUUW56jowb8yw9DsS0/zRycIMouR
	ZwejUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmea4vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29b760316a8so55605155ad.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146974; x=1764751774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKYzaThavMfN9xSkCeJZ9Om/p7isw7/8Buf4mXyG9fw=;
        b=fZ42/SlF14fZOxU+M/r5SudwctbqXed0zpXwFwNEWZp9kWAKYue0k2KmGqkPoRjTDS
         Jm4eYcIeBVs8HXfX4WCCQ20Q1xvWDPLS1FzDgR37q8ACjxYH67CRpCFlyBgpvEk94DN3
         07hk5oK1yJQPwmP0+OlcvLqkqFh/raKx+kx30nFJSXo3+EVLdGaIZcya7u25taOuU0QP
         Z2qyrDLPYZp2xaCNhKg9uCU+B5zfw8yiryYAXb85g+XBWS9u8LTR1lW91fvMGk7RF/M6
         gWsgQcrDYSRM0S+hNXQOtYNR7HwlMS0JAWi92M5AKbgmSFIxlk8/I9uNZf+qcT3e9Z0Z
         w1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146974; x=1764751774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKYzaThavMfN9xSkCeJZ9Om/p7isw7/8Buf4mXyG9fw=;
        b=P/PukQU8SKrzGuidmzQtbFiIaLAp/B6khswbloFrBYF81r4XjsOTewl85OR/3KZ+mN
         FkQijWnn37WhS92x36rCKs6jkPCKrbUyVg9hFw7NQBgyIFbvfVjh0rSVtBtI85MHX49h
         rPsW414M1WFjQax0/UANH00SBXp1jhkPoaTBkTNP0TGqHcte1HHhs+WosiDpN4KHHDoz
         YGpEnKFMYZj+tyu4hTNm1VKeClhIsg4u5dU9Fza4RXypiABUgaf4GcQQgK96eFKXZ8xs
         Tcls9j9GaI51Oz0wbWOgJlS6+03bdg4/w11OV8Ypiwlm9h+gQDf/bsXCWdHm/O1Q2lvZ
         rKqA==
X-Forwarded-Encrypted: i=1; AJvYcCVtfVnliwLgnLmytvYkLOWlEcf7kp3CaoBIT9M3KB4gpJGK4P9CfiFG4Dhfq3SV1kJultmLb2Fnpc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSEFEaC5wWseRjkR4alQD2IN47rBQwLuD5gt05Vs1hxAL3rjOS
	YmbdIfUSpxQHG8PDB0VdjSUjR3fjUcYzKx0wq7krBToeos50lbs+i/8uMSI6/sVdKOtfdVo0iCj
	0h7YVmRCjTXlMU1gAbzHNxPK3277Rq3HVznjeJ16oi/2ty4TYkKyGx7YKpZkJPIs=
X-Gm-Gg: ASbGncsOJ9W0uv6M9mZZIvW7zm0UnyAxnI7H2BLnhburxtNwNgKR5g/d8uhUmy0kQLs
	AiN3AwYVTL/rRq8VQ2vK90j8U79CjzdD3qZWeCc8HnYAEVRSxriM7xEJOveewX/oKlUXsKHqTQ6
	k3pkNqnPa6XdAyAiwyrYu3LUNWrCswQBme9wdPhEzY8YJCbBqtOJw+2hfzPtGVHbRBFicohSBis
	g/PSu7sqJ7hz0V4XEj6qXL9PTM2eIJO9klQWcvyCbbn82poWSw4AEeLBfKIWkKLRxux/RcWCsSi
	G/w/1VyYHpf7IKons/uJeFALIL91m7iE8buytgWGuhh5gOZ7It7aBO3PBmrX6LlxB2lBXuTPQc2
	5CaUunHpYrylSJrI29HgQcyM8B9XKrrhpRHf8
X-Received: by 2002:a17:902:d484:b0:295:586d:677d with SMTP id d9443c01a7336-29b6c6925b6mr204304965ad.41.1764146974216;
        Wed, 26 Nov 2025 00:49:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSyNEPYTAcZX9Fl/ELmiSxuZq3jP9ASW96xANuBE/lQpDBL7kMlmh8D/R+amAATw4sROEmzA==
X-Received: by 2002:a17:902:d484:b0:295:586d:677d with SMTP id d9443c01a7336-29b6c6925b6mr204304695ad.41.1764146973764;
        Wed, 26 Nov 2025 00:49:33 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138628sm191492625ad.31.2025.11.26.00.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:49:33 -0800 (PST)
Message-ID: <5ddaa17f-931e-4883-a91d-89f60b392c44@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:19:27 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use
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
 <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6926bf1f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfXzts+lu99wWhb
 zFQ0jmOCpizaTUGPNfk4Y9P2//DkZw2ByKTyFv7r6IPELEMA3sj/AhJcjFHtqV6o5raWuAuPdWI
 1lFZR/i1IPa9VDYjKv/CnISlqj+pUslgivdCwuQtiqi/j2gxflwLqS7uaThHQyaMvlXTWcZmaUn
 JH5gwrV1R2owbvgDL+9F3mB+chXmvf1UNhTkY0YXdF58xZewkZf4IAotU44oI7h31A8ldasQI/a
 GPEZsZ0khx3J0f5usYKs8YdNclomHevVtjuEYIN/lMbbnICjkKi8vu9XNBg9omLhHsU7Lk2ToV4
 widyVbuRDR+yB1v4KPGgxvFQOL/Eg801SxB0MuPzCW3jIoaxeGTLTT5nFjfJbwxjFlRb26ig1W/
 YquEuTnA24BFvK7de32YnN17d+BzsQ==
X-Proofpoint-GUID: aCB9xVQhJNTVXb6GYDzZe_2mnPDJG7vh
X-Proofpoint-ORIG-GUID: aCB9xVQhJNTVXb6GYDzZe_2mnPDJG7vh
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
> Fixes: c32c4ef98bac ("clk: qcom: Add GCC driver support for SM4450")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
