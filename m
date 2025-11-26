Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F731B806
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146963; cv=none; b=gWiIBZZDZ4DLhBYDuiY0Mh8jm98CXjkorFQ0VOo/YrumjLWr9ZuPdLfQHV2Hq3Rv2Ri+CLdjT/NxKU7etl7k72yV1Bir2RzySj8lStduj9GFaFc9gSKrJhZqDuU8/ps2k47FDhR0EPIq5/ShPYw4DTtVTmH0vObKS77dVkaJWgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146963; c=relaxed/simple;
	bh=4ljuW+R19L+hHRxjdhDHyaSQd37DjGCiyv0yhmRMh00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1osis4IIgxWWnA80iAZO3WOizJKDUaF4bC9zm5vn+laFFbUACGFhvyN/xqzOqMYC2qy0Y36nUx1n58/I7l15G+NBtkQdBKfdnU8TGQhHEMI4B7es7rJUCpEzTe9lNTt5HHXw8t1wrXF3ViXaTVLiNupT7GuT0W6SN/k3dKewt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXRH9kQP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBUDg6hn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXRH9kQP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBUDg6hn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6UP5g3738346
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmhqzHGGMdM7br9Gh436MSDM37y5Eh9szWZ3H1aManE=; b=pXRH9kQPCd8Fwj7W
	3Dfl3wPtLAyCZJ+JutZ3xUH2uzl9wD76Vx5jzaIVP/sx3OS+jZElaykXwNRWODZF
	f2GXJTXwDQXkUv4ON8e5pb+RqoAC3GG3wdeJxpuc85cX7xcGYSyiFCk6F+Rp1V6O
	yYiQVJpj3koROOIyYfEEc+x6h8iK3nbnfsTGW3VmbZ6o5PjLhBQ8CEOrICK5pS9j
	hh85I9yrHkAFMmYi0CQBPjNN3NmW35JzIZ+EALWZwVA+j4xszyX/a2ZjL1EKuOAb
	8SY5rFmJ+WCIpGosIV0YczRqDssCt9OWKjW/wK/g1PEKB3SIaWJAFUbElyDAuFeu
	Q0AxDA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyj5mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso7109888a91.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146960; x=1764751760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmhqzHGGMdM7br9Gh436MSDM37y5Eh9szWZ3H1aManE=;
        b=MBUDg6hncjD8yRG/XpvNFgzMmQf3ph50/TSFPyTwQ+p6RPYEYZveGXUy5F7TgVA03n
         +/FhPyiD4rTIkUCGFbbEYAp95k9aepqRLbLFHtJolzLs4X/OTyRc5SUOT65tctWc0E7a
         9w9GHxCOUdq0r1/vbJFafT3zs5G5b+W1i1PAHtaFZdgdiAomzYCMQLAvuA87rRI0Wgkv
         NRICJDEr9lG7CKLo+JfjBMhO/Ci/ecRls/VYS1srayLp6PrhZiAgK5hIBbii9VuzfT5w
         iNkc9LJGXPVsZn7/qe/6ahBRhEMnCjQhOuyxzFIW2z2W3gCf8+ybu2u8ongjD/Kt1yXD
         o8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146960; x=1764751760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmhqzHGGMdM7br9Gh436MSDM37y5Eh9szWZ3H1aManE=;
        b=Vb+6pvNnoYyor64JdUqAfVaiSXvalqi84eQY6agdbNu06U1F+cPckmYCwExnx/AIvK
         Qd4K6a5ZrSu+6lZON0Toqd1SmR4nyoDPUnPXYjBeuPR27xkQfsaaFUvA3+LLvsObcFWy
         309GSx2xFPlw2g1IgdSIb/YePhCESnxcT3IO29HCkwMo2SNUhxdeuLgNYETKQQr3MKrt
         0tpZ9rptgcWixRjZ4uHrFJiI+BwNWFXy0xMjjqPrE6NA5zz4AL4Abwmfwr8kUI/ovmpe
         b8Ir9ElbVbuYbEg9o6Zd6ttvWpS5XvRZYTaLfVfMQ3n6uCfTiljfNjf5vpMGJnFI/V7L
         7KKA==
X-Forwarded-Encrypted: i=1; AJvYcCUgZ22KhYmdl+T+BF6Yd/9bNvQFOUfgQEeLN6FWC2OGavJ2BxcO0GluSMh4MgRKcznMCYrcPijqwFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE61M95inL0pjzSXPvZZw/Hx8ZmzyGlPn7xw7/cO7ff6uyrtkk
	eFULp9c0IV1bDqv0yCUlg9RzLZCNPNqaA27cmOcmoNDInRLTx9dqd4DH4peWV2jDuFA2I9gAdQt
	Z66U/55PThfY2BPUMrfkBBBmybj6+jSRTkr295oTd31lTvU51RH7+ffD034T9DQY=
X-Gm-Gg: ASbGncvvwiG4CYRLQKygB6T7d3rve810DFj0dtVlVVsa+RD4U8wdiF8JgzET37tSB2n
	wVCPjJq3XnZh0O3lLfSXSukxBCPbUNywzpieat9eIzNcpLcFGUOA8Zzu86d74OGFqUPmfcmtDDb
	E7fBlRgGuIu9sg/zcW1yifV0GXaWcuwoRm9J08tytxrqHUBeEygJDthlBOs3LZcKqFqnvV43NBA
	k4ib+Y46AOsC7nhxuTkAdedkT8H10kxEU7VG5xpY2m5ORVdVIWiLJaW178oxrdikbpM2XJS32F/
	lJYOv2vqHi2xfZpVtO48wovAtrvbdqymVowuxI1/5IdORdQvupbV+3b60CM24wrh2KEjpFmYmRw
	HNraecnWJqb2AfZNv9sjg7WyEgO3mlVPepoQx
X-Received: by 2002:a17:90b:5404:b0:341:124f:474f with SMTP id 98e67ed59e1d1-3475ed6bcffmr5324829a91.32.1764146959942;
        Wed, 26 Nov 2025 00:49:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKm6mO4vdyB2IT6DYpJsjuU1VmrF0wCEUFMhelWVC14utNHPWISQp7OEu9TksPHL9xRerx2A==
X-Received: by 2002:a17:90b:5404:b0:341:124f:474f with SMTP id 98e67ed59e1d1-3475ed6bcffmr5324805a91.32.1764146959465;
        Wed, 26 Nov 2025 00:49:19 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f1262364sm20692519b3a.58.2025.11.26.00.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:49:19 -0800 (PST)
Message-ID: <ffb5664e-432e-4c05-8e98-3827d111a8fa@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:19:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
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
 <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HlX3P_9S1Or8JWVrKOj-s756PrGeK111
X-Proofpoint-ORIG-GUID: HlX3P_9S1Or8JWVrKOj-s756PrGeK111
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6926bf11 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfX2Z+wqTGO/Rbo
 ikMeGcrFFUVlTIT5A49bSw2SHBUI0ivvVJfBFIf21BCS+1mdoB3K7zTlIoY3LeSGTBlFJlzSDqG
 RyO802dbOLJO8PTO4JAyaaDX9k6nwdF1j8jtQPgIgrOAxxNgKfhls2BFQW5a2/rX9j2kfSBdl+q
 sTpqW6JIq9dyYHLgpg5rTu+fJJ7VsllvycwZ/sD71F/ECGTfNbJwFH2/aCHR4E0gfup9+EZ8uRF
 Y7esbtLY1Epnr2rc5mywPxTFOcpLncb2T15GEJaRsAZjYDh5W5IVXjmmHhbHPpdCKUmiade9T+8
 2H7jzqPM26gfOcPm+T+yzEYfqKPYsqP8tiTwpUSO1UO/DMvn1p+oaj8qiOk4S6JaSZ534yGv+cE
 d0wH7Op/s3jmX67/Q0sx8U4V+4qacA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
