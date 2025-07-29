Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF06CA52
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785510; cv=none; b=SM3jCuXckhVb3eoMSKK9OXfCO+2MX+5CNJ08G+5CkPdkPtEs5zt3TjE8Lyy63LGAbebjsmz/RHCS6YcMicj+mDOW7AyO5bpMnG2EyCjkNuzigqo0ncrRtTgOcZYBTNc2jXyua2FTJg4RZVdHRxn40MKg+Ff9ltcuFRx1ofiiT0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785510; c=relaxed/simple;
	bh=nkIhTMT+UrC9eByz+KmOqpV7xTJv94wB9jjPbu62Xzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2ucBdSj5cLe+YUGKVpWo3KefuMTwi81xzqLICsF6XGseby5KTIHtuXpfc2HyTzPcpxACbnd6WPhw1auYC6BA3hfw1AYde3DC/il5Cuo3fq+wnNx9/0qXCgsGEuY8cwx1xZEwJyDNfN6QEvsUtc54xIb1C0C55+eaQNKOs96Lag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRWU3Ptb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRWU3Ptb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8cv8v027591
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtmyegjcI8dNEuRPjZ2a9kIvcQS2RvGr8n3kcK3eumk=; b=VRWU3PtbcxQuC9gu
	MaJEkZEnEJV3RAq8PBBAtjcoO6HeguUWKconsvL/wuR7hT3lk0YwjBJhpMGnBSlV
	vNGaE/C0E34GMYvLWBh1tKsll9L4U/b6z25SYPbFGgbAI+fwPGRGa6kl9HiP0ITc
	ApBJKykGr+nu2stifb4v5vxqLtdS1tLyMl73qfXw6pPPXk1uKFGEzx8UuVcJ7M5n
	jWY2Twl17s7KhaJRWR+/Tzqy13wUVjLwhUrCxVswcvxAzdJxzgVIAI2A/JZKbKfI
	MSldc266q1FzdLaeUh+dVvuwkYM1KvPXXah0dUOfgXla11gcBl0iFqLOmvsqZTIv
	O9w32A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860enw0ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:38:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so57702825ad.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 03:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785507; x=1754390307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtmyegjcI8dNEuRPjZ2a9kIvcQS2RvGr8n3kcK3eumk=;
        b=GYuCidKUqMxDW+dDgujSte48z7Q5SLDAj63bTCmuL0FTxL+G48Mak4SDGr2lf92/vn
         OuYx8/mFfRTe/Fr6KamfYgveFJqFT86YE+zeB00zSGw4lHjShAq/b+8xZLWnfigLQ6NO
         pO7xy7HHi/D2r8FnJEXwP3JhMIe50njij0PIupFKmtGo14C5g9EfLLY5I40rIZi0zcFA
         yr/2YdLbKW0qJaCKy1upiyTbE3PTdCCRabOsg+XEYIpAPK+hAmYtiNPIZ8ol54mHz8cX
         pa/bzwS037FmtF8CtDM06emHPI1JxByMu35rh2wC3x/dqAFNnCL+byTBPTJZULJmIAVt
         yiZw==
X-Forwarded-Encrypted: i=1; AJvYcCXkjccDLAhkbGtph6bp/Oh0HDlHh1tFN41G5vm1ikBz219wpzhuGASLA3tSLnozQh/dwCizxAk+bTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdvECUZhjxd67dt1T40ctExYszXS/dL6fDLuV6gNDCMKPFJJmu
	GprQbuvq4BQA62+8jZ/qLSiNptEjppZK6+a2ZguzZuVb60GZTMxIegWVkkKwYKKDPtRS3IkmkOY
	/7Nteoz3k/6v8R2VpsdeAMmzyq5qbVogq9m8TJUM1Qhp8iYzocaaZt7WsLG/qgG4=
X-Gm-Gg: ASbGncu8KNr6aenhEd9opXE2b0STUVcY02ysM7w9EhMPJsMPP20VwHPNd132iPZo/Ds
	I2WRnUXwkh1eSOu/37AABMMF56Do0Kmjz6JfyAOuI47oRJgY9b7Ba7dxiWiHLNKCOv73Vb+WmFj
	9Jvh0IHA+4ts9JHd2kS4Lpg9NI9TjKc7KrTUFxNScgVBfpQQySr8xYSznHz3U6z7t5yVld5GOBK
	FTJMsW6etzsR0MWslSU9sFJ0hdTGHEgIZZqC5cwN7QPjC+M7JFHRX2u/EHUnGY18+EZRHpA5sn1
	y0R4IrSeQemXuErQwkHHJ2lBacQnJHoZqs1Ip2bVNzwf6NvFZoXHAfQ1leC/KZ1zdx4=
X-Received: by 2002:a17:902:e94c:b0:240:3913:7c84 with SMTP id d9443c01a7336-24039137fc2mr90885185ad.4.1753785506688;
        Tue, 29 Jul 2025 03:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKmIZt9Z2VjUyNjAm78HIoNSL4gDkCwJzYsVcvwijgXYhzs2L+GPUc8Ve0bspPFS+fb7csuQ==
X-Received: by 2002:a17:902:e94c:b0:240:3913:7c84 with SMTP id d9443c01a7336-24039137fc2mr90884905ad.4.1753785506263;
        Tue, 29 Jul 2025 03:38:26 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24009b8661fsm51264915ad.126.2025.07.29.03.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 03:38:26 -0700 (PDT)
Message-ID: <81a1bd2c-ad4b-4042-9116-c1604e4f0d98@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 16:08:21 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix gcc_sdcc2_apps_clk_src
To: Richa Bharti <Richa.Bharti@siemens.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, srikanth.krishnakar@siemens.com,
        cedric.hombourger@siemens.com
References: <20250729094943.863392-1-Richa.Bharti@siemens.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250729094943.863392-1-Richa.Bharti@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3V7GfZM6SV6hHvA5m36c6E0FQU58qpxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4MiBTYWx0ZWRfXyIUQNhusfiuY
 oo5a/V6iL4Qr5t7URFV4dwIvoX6X7PqEw5Qo1iSxjV5qQxKhDvDj0GizbNzYQJR8axCVsML6ERU
 Z8xefnk2IPlV11ZMvtUT4Fqj0ZeP8uwJNZoeThB4Sa0uF6I/0oMRWBE3PuBocqjedzkTZDoT9YW
 1qdcntMKyUa58N0QVfb4y9rbajxixsLaIE4KcYY9sMdf7NkfXvZQfslRMXDu/b+1SrlBnMGFsmv
 nEnrUvDjqFi5mercoxmlbrjaGKtoT6N0HV1a43rmGIKEhvBHp4meh/YIvzcJGECTwhwgc/d0nC+
 OyptoM9qM9x5S3xTk8yx7ZwSqaWAZzfHpJyHZ8ArgRdVR5O4I0nVFucmiL2XfjufC8HxvulQdxJ
 O8TFPxlnYA83K3kp+Av8Bxo5xxfcrC/ZRR0odoO5SKZHNNZP3aqdCn1pEKDaWI2fxHB5IBwh
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=6888a4a3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=a_U1oVfrAAAA:8 a=FtIUmZvm79rvchHu-DsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3V7GfZM6SV6hHvA5m36c6E0FQU58qpxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290082



On 7/29/2025 3:19 PM, Richa Bharti wrote:
> On QCS615, we see the same issue as reported on SM8250 and SM6350:
> "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during boot.
> This is due to GPLL7 not being enabled by default as a parent clock.
> 
> Setting `.flags = CLK_OPS_PARENT_ENABLE` ensures that the parent (GPLL7)
> gets prepared and enabled when switching to it, fixing the warning.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Richa Bharti <Richa.Bharti@siemens.com>
> ---
> This change is similar to upstream commits:
> - SM8250: 783cb693828c ("clk: qcom: gcc-sm8250: Fix
>   gcc_sdcc2_apps_clk_src")
> - SM6350: df04d166d1f3 ("clk: qcom: gcc-sm6350: Fix
>   gcc_sdcc2_apps_clk_src")
> ---
>  drivers/clk/qcom/gcc-qcs615.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index 9695446bc2a3..b281f0dfe165 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -830,6 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.name = "gcc_sdcc2_apps_clk_src",
>  		.parent_data = gcc_parent_data_8,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
> +		.flags = CLK_OPS_PARENT_ENABLE,

This is not the correct way to fix it just because SM8250 and SM6350
uses this ops.

We are testing the right fix internally and will be posting.

>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };

-- 
Thanks,
Taniya Das

