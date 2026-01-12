Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB5B29D28A
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213567; cv=none; b=RdzJ85DmbpQq+VdBlNU+uGDyuLRM7souQhrZlv8YAvxhsXXpVHbnj6NU/koGEMfgUz+yBBo/7pxBC1oPAH5UyPC9BVm7Si4N+PXDPiI8OHXtYcCdRLC0CWg0h+gm3jdbehDcR2GuzDqsTn41MRXnwaaKnIO26ifcvMNpjvED/BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213567; c=relaxed/simple;
	bh=6tTlIpuNhGLgbooa+bknYLuVMNCeGlqEPFLds62QI6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpVZNbOb6gYV1RWlK7LpDm2G0lRZ9QogL80c2Ud+SS2HcazXyGn/Chcng1xPMpEVdyRC0V9nLDIKri9SxkS1wcqUIWgpYjVnyNAslvlFMda+jFAS+0PxvjQxDSZawfVNCMXCCY8JOKSCtLRhxobjP4w7OH8MGt4cAL5Zbh8/EJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ydw2eDU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3gTT6aN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ydw2eDU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3gTT6aN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7sgC0792793
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 10:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DQ8iZXNy5ygcC8Y/BoXumPmTx4/RrJaeZCUjV1Dj3Y=; b=Ydw2eDU8vFxVII7O
	bWdLmKi5ESqUsoOMjWpXSpy2Tn3G1rbTat7zZUJY5CJ9Nu7hPMATkrTBm6KkOQE7
	Xhut+IFloHCSyAjXrflW7AG/cRWHIFBqZLU/W95q05dhg5bagZNtbgkv9PPBdXor
	Qvr5DXKu/10TRKFueHoMZ0p6Tz5UCD0UzzqzZv9oZYaF2Q/rzDqYZN5LMdTATvIG
	lq2axlcHZls7wM6Dq+CPWvG3adoDe6OmyQO/hrSRY3+ndGMfVzu8mG/U7r/v2P9U
	GZOmde49Uy3nPMdIE7CNwSBEaJMuEcaIlU4XHS8Jh7+8nCfgi3eVkoCqLjH9CFCg
	s6vYIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfvh65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 10:26:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so44048405ad.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 02:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768213564; x=1768818364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DQ8iZXNy5ygcC8Y/BoXumPmTx4/RrJaeZCUjV1Dj3Y=;
        b=H3gTT6aN02UpvIPQq44laXyTzCGki9c8/XZmtPMHMgCQEb4bww7n+IkcrIFP4kuyHK
         ZReRbGhlt5YxeOMYlq4EK18gIyc18lawFROA2c7kjkipasDOqnWGejGx+lOnrfIvoP3s
         JQWuSsXhePzgRSm0BYsvdCTHAAmtOjuTqOHOw7Iz/VnEgWwzPS7asROTRR5PSHwBeKL9
         C+80vJEL4r8uo3q7Sv02Zs80E62vx7d3qe0uxrAdPpgo2hI6GtNiZW9ABP+MWlGAhGfc
         uXLMbqDhoAgvPfQuDS/d/Hz3kngRXpEK/6XpRZvWBAcZBPm8Vhzevr4nwGHuB5UUAQt2
         2WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213564; x=1768818364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DQ8iZXNy5ygcC8Y/BoXumPmTx4/RrJaeZCUjV1Dj3Y=;
        b=QNm6o8yRtg31qBWCC5KUgvvl/h0piBzBZn7p0PhmrbloM0Odn5kAtqm5/yZArUwMR+
         LRSz5CF2swR5HERia5t+48JkOaUkgCGTuDZytSyYFRcyzcoPX4VQH5vJ/rDhvQKgPK5z
         n+R6kPW9cqlzQrA29S8E+llx6g5SbRfCo/97AcPXnOKV9giFmR+RqqsmCPYwVtMzTtrb
         0aPWL94VDce8t2P2iMoP01gKqX+wn3iQ/95RBYMHDn1ql3SxqSZ+CnXLwPxrJy6iQ+Gx
         HnVGiig9VcoFw0zIwnh4Z2sWq658zt0q9LtF3RMN7KX0X2uJnZ4Orq7bZag+7+kPyas8
         FDtA==
X-Forwarded-Encrypted: i=1; AJvYcCXefEfuQVPvNL/63KtPIYo7EN48xFB3Cij/pBFBH97s/gBAGfwHpelhj6Rmk2+Um52zhuSSnmbSDDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzymMmtCRfbBfmqkTnApPnXyj0vTYndnUjkPHW2II2qOazlfC4t
	EoxaEIDnpLl5waYRkRETTH8rIElyhUjOBTWAqdPKyDm5C3w7oXUiVG3g9H5M9dELIeXQC5WQkn3
	cDOo0iXLtjqinQLbpXmCawv/XZDpTVu4rS83KLExjoyK+9NCrK174cyiN85VK3PU=
X-Gm-Gg: AY/fxX4hfYwt4kzjZIrmS9YSbIlrMmbUdSqpV83vCqVGEqNOMZ0xQGHDaOXiHidoq9H
	tzvy5RKmRC7Y/BG6/8lU12iST1TFyMRDgesn/kwNwRGKPLLiLrwKu6APohEXK1QcPX7SFtGbJyD
	i7zwinYEXwaAmi1Sf3E7en/5Fuct8nznDVeKFpA9DUysP3S8YkwXCaSmaToYIUNGKHiLF0Eh1/3
	c3OtUTtX3BSYf9PH0uDJkjI3Pkj/NTncqVHdz3yiieVojTBsDyeG+vLrl9nLFI/6R59uFR4RfqM
	i7+TL3CrL1VG17th3gftWr0DogI4r5wi6mh+JlH4HaleA/+ziGRCs1zwpYalhDuqf9IdijNMmCh
	wxUfv+PlV/d9NoUX+bk1lt5y43Hx5PcuFJpF/cw==
X-Received: by 2002:a17:902:f684:b0:2a0:de67:9704 with SMTP id d9443c01a7336-2a3edb739dbmr159953145ad.19.1768213564219;
        Mon, 12 Jan 2026 02:26:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+ANrmd2jJbJqGD/KN4Ur1v32NLxLtT8THnNV3HiNqENG8f9th3rPAV/+1T/5XthSjPUXwPA==
X-Received: by 2002:a17:902:f684:b0:2a0:de67:9704 with SMTP id d9443c01a7336-2a3edb739dbmr159952875ad.19.1768213563708;
        Mon, 12 Jan 2026 02:26:03 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7912sm173476745ad.67.2026.01.12.02.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:26:03 -0800 (PST)
Message-ID: <eba70496-d020-4919-873f-db0801d6ed6a@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:55:59 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX
 clock source
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iCS4icUb1q9Mlz6o0D45e6_sCfhyfRm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MiBTYWx0ZWRfX3Hw5ZdJC2jrj
 60wTSq77B0JfcriLmmKE/zrhlaFwtkFwZy4vqE8EkZhD9z/Wvuuk/Ef3z4UhlhTFUCyrIr3gCRN
 3rUW2vVmPXqQrA57PqZByOgNImwZkG8+/kj02R+TJwVL/3BHBurMaaYgy6jG+Zbt1oHXZO46XIL
 +cAFiKBrAndxksIiCV2abrArduxu5XsAPyR54ZXjEZjtppf5dZcMO5Xb8nby1VKucKwXyQxmiSi
 dK1iJi9T4TgcoaGYoADpl/o3r5VuooP47cPf2uPVXvJC9pjkfzYLcRD/8hQ3oDs0EYwpeAcA6g1
 uK1iEm0B/6z5VYEk7r/E1xnWTDUeD5GYtAcyJKJH+q0RkRDRskbONq1gp09aE0+3A4Zpwa5JxZ5
 P2Z3j7MV9Axgy5AUsSnI7sy7rTbut7PI9jUghV37XdTxDUs191HK8xtooOe07OF0mP17Xd1JvKK
 l+TYKRcKl14xIjfie4g==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964cc3c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FCWHNvtYXcGM2Pe_cTUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iCS4icUb1q9Mlz6o0D45e6_sCfhyfRm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120082



On 1/12/2026 7:42 AM, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use shared RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-glymur.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
> index 5203fa6383f6..f352165bf56f 100644
> --- a/drivers/clk/qcom/dispcc-glymur.c
> +++ b/drivers/clk/qcom/dispcc-glymur.c
> @@ -417,7 +417,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_dp_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> 

 Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

