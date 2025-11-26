Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120E2DC796
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150344; cv=none; b=jAhamAfGgbYe5HsjbuHP1jKjnsj/6q2bUzmgHSwykHF1bHcH58sHGUOabrNXBmW7rK+C8L2d+fk0kvKxvqqHvK7e9Yq26ArECGex17WtdYh/VmFFktr1vGk5pYvKqzbz7Gf3IxRoONXHl71mQ8Ayd3lBi9VoHwnQdRNfoI0WTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150344; c=relaxed/simple;
	bh=C1JAw+/Rad0we0JjSb1dzS4cbxcuHHQbPPxiXlvm6cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePyGAm1wi2aqroDwF4qFcmVWRa3fZiEcWhZ2P089xJeTagqXD77IAqKAv0bwmIR8gL5SXbaSmQGmnLX1in+ZnZYQCDauB3uKM2WtsX/bPbwFUEhQaTZ1kxg1rggqd9Z+rEF/JPXI0MQvgdqxm7lO0acGyaZpY28lT38islspYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB3gmshh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TK8SfqR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB3gmshh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TK8SfqR3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8trtL1522368
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UIFMEq/463uAJMRiWFPyBpdwU+ckHZ64BM+Pb4fxVhU=; b=VB3gmshhsq5HhJTK
	PI4CRByjf8y52DmMhNtSyePraqh3iKN9ptB/Vq+5FP2SHoOrIaD6gis3lol/9Y3p
	dhue+ta3AzoaxbbjZ8phg09/bPEnltXzuCr6x/B93ujbSe2Z777a00fAwGrEHBP3
	SIFOVmmS6xL9vteerihQ6W/BRxffahFnaIL83NOjjJ94kyHN7xDhOleJI8hYp+oX
	jFeHuiY7GyK1/xmN70WLhpoza+iGkkAKrgFkSmV4Xk6RRWDLvGfrqzzI/kMxGbz2
	Z0FmKkpiYKFTojrEsvEpIQeCtmcg0C1ozhgMCHsOljiJiDUGyIMggtb/fB5nP1Ad
	0smQQg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anxfk0633-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:45:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c240728e2aso14323310b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 01:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150341; x=1764755141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UIFMEq/463uAJMRiWFPyBpdwU+ckHZ64BM+Pb4fxVhU=;
        b=TK8SfqR3iF//WJZODighzzb3OdvUzwh7zezqQblt6u4sSKfyDtmSBGn3oQMV+yMmrc
         ANB76XXLXppU6jPS2qvKzAEWEPxyl3q5ej7+KRpY5YVUkhg8ndxdCe3tUISWvWJ2+G0v
         GzXOk4iaj2xRxedoWEGlDAxtlOl9u3f7HOpQPmJWgKTm/VNzYhERd7I7Us3dnfE8tiXd
         jGrS8AC0e+f1lKed1kJi11v073CBIfnnTdiX9Dx6RcZNajqip2xN4P9DJ2BZfRrO0fEN
         ZWZ14YBbuGTz8kmhhRJ5RUlBuGZef0k6yTZL2teTbXoe3E0MmlPcyyDCP54ySGEfHVsi
         l5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150341; x=1764755141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIFMEq/463uAJMRiWFPyBpdwU+ckHZ64BM+Pb4fxVhU=;
        b=drGFPbwrQ19/aLFd4TSpduCjm1tYIZ4GKdUMGaYmu5SAZ6rNz6+nrrdTpAulx6USAg
         ae57uy7kwLU/H5DDuzxMe85CyDsmIcCeWfgJcdWCU8bTlf/1zzncU0x5lCy+/kXavwIG
         E6ZhXOAQ5AbNCIFaiSxUUx9VPbLDLDDjw3CgBo+dETOclp++uUNyilY5BlLaBL5tvkB7
         7grFDxw/8FnoGvVx/PQ6lc+lzFVx50L4Usp8BeZpf3EHa3SJ2uUgQinANCOchrnA0Inb
         eLZImpU5P6DYm3Oo9e29ycsFv0t5T911brNW8VJz8PdKLfaKn26PpzuVI8NcBlASyz4T
         3sug==
X-Forwarded-Encrypted: i=1; AJvYcCWRpdOlJ+6OTqY2cgynD6i9ylrwBmpGzH7BOCgeqhkoCTH6Ji33TF+SduND7rBkPkGisY1sNJK7wII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3diEztrZLmTQU48a0TWV1t+9C0oRwp/X/cV9UK5I1wFdTIsRp
	sepl5BkeSlFQx9J3wvmosuD8KpG5H67P/PyVyg7wphzD2JVRrN12eurbnvZjpnptzU1D6disHmH
	mc0WlNmWXaTwquH7shE8Mq8Bq/KZ8NhFsoR9UwACCgMIHNknpgm/pU86aPu0Ipe3pFXJ7K9M=
X-Gm-Gg: ASbGncvIT+8L9DDxzQZPStm7UzQZ3RqUOmijfSjtTz7YLNEyVnWyyRklzPGa6Cw3DkE
	9zyqtiip5CRvJbrKORsVBblcnYaVUxqL7B+4fZqoQiy6Yr3eyd0ynYoCno/XAi8/h6S0RyIgiPQ
	FD4oVKSjojhSJG/paQDF5mr+32eAHSCZf7Ov5lq2EPLh6x2hog5bFvqRstYAOYGzZio8kBwdtOk
	nQ2eQN+01gWu/fAmNNlB3p97Gx5ZPW0b36G+sh1NsLckMhdeYe0M8F0+OHT5FhxETrLblsS7eZh
	Q2HT1RyCyY660iVR8fhqC65/7nC45CgBSyclKrXTd9ur/N8PlCtYPmjNINDuINHdsU6JBs1Xr9e
	xrV3xhilqpSaITQIhcRdEJb1fdekeDE8RMiHtiw==
X-Received: by 2002:a05:6a00:22ce:b0:7ab:4106:8508 with SMTP id d2e1a72fcca58-7c58ec0c216mr20834488b3a.28.1764150341223;
        Wed, 26 Nov 2025 01:45:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF50m2/RpC9lWEbFEitqZ6Zp8JBszTTXVe0mtTmt+kOCxo6AdCrAOHxoHKnPzE+KaM2OnL1rg==
X-Received: by 2002:a05:6a00:22ce:b0:7ab:4106:8508 with SMTP id d2e1a72fcca58-7c58ec0c216mr20834463b3a.28.1764150340709;
        Wed, 26 Nov 2025 01:45:40 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf80f4csm20739070b3a.8.2025.11.26.01.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:45:40 -0800 (PST)
Message-ID: <e20deaa1-e8b7-4dbb-b4cd-75620ba9aabd@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:15:34 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: qcom: gcc-milos: Update the SDCC RCGs to use
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
 <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CTMNq1b66ZVtNy6OTGw3p8etWqQ-oeLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX0Ebd0vuKLXV2
 kG7XHPLlNZnlZ0ZEi+u+buKDluk20SEehAv1VTKMnwVMmZv2kGezFcyDevZxU9/yo2NQhDXsc4k
 kAAVALCb5LrcORsX9uZgbpRHcN7RJomXKply7HYoJrbdeYDCEaebZpRtCbsJVwWUKo4HT50vs5q
 EbAjPwx6Td6iuwtMs9jsuo+gqEAdHrNcU0ybIFeN+cK3RybcKbjzBKfdvhebDTPgB6GjMIw4UXC
 9DGCffLs8VqwPRAviAe27leJXLU93SaseF1F01eUZOJuEf8zCk4vgqZwtUCJhIMJKPjdNmlcjsb
 hz2VnUpk6N0HzRdR/EFrmuCFso8fA6fAUeXs8biuv45shHrWr7N2GZyjF3xS+DYaJKK7Jjkj/Zx
 K8Gz+peMvCLemTUcmAZsUCl2j+Ct7Q==
X-Authority-Analysis: v=2.4 cv=H4LWAuYi c=1 sm=1 tr=0 ts=6926cc46 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BHIW56bp-DeTEuh3DTUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: CTMNq1b66ZVtNy6OTGw3p8etWqQ-oeLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
> issues in SDCC usecases.
> 
> Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-milos.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
> index c9d61b05bafa1618274cd87c83df6fd14131efcf..81fa09ec55d7f6d6cb761affd3b93301a102f61f 100644
> --- a/drivers/clk/qcom/gcc-milos.c
> +++ b/drivers/clk/qcom/gcc-milos.c
> @@ -917,7 +917,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>  		.name = "gcc_sdcc1_apps_clk_src",
>  		.parent_data = gcc_parent_data_9,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -938,7 +938,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
>  		.name = "gcc_sdcc1_ice_core_clk_src",
>  		.parent_data = gcc_parent_data_10,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -962,7 +962,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.name = "gcc_sdcc2_apps_clk_src",
>  		.parent_data = gcc_parent_data_11,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

