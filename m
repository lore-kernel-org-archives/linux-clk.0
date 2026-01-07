Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD983328B49
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785896; cv=none; b=ANJJgm8hLBj0ghMSvgpEzkTEMOC/qII+ItV8crxitvzVsZR817T22yUhk/6AyEkdbVH4xAZ+nR+Eh8JlD3S9gmRKeSKqEBK5iP2vR7BpRR6K6tuFDFLkwl4T0BD63zBYCDbpm8kbw7qkIoO6D76weJwAHc2oEb6uok+5xn6P1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785896; c=relaxed/simple;
	bh=cx+7EBQM1YTPVpHqKevtowrYOtDFBVJ1EtQHm1epcKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQLxu7gIEEPc0/Ey9hs/j2bQ9jF4HeSphqlJ7f7abd3jML8eFcdubX7OIKBPBjaLeAHhb0qVp9oVF84RJrQQ0k6hBnW+fjKcVkNb5/Onmp3aKD3334RXLdRySSk2nohLz6gj3yjtTrAO2J+r+ODNILgTxQDZrrYnfoDVhl92hwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cN0gxQdo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqxYbHVe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN0gxQdo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqxYbHVe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607AHURe3888916
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 11:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hHrWLmSLNK/AuxYZ0Fr323Tc
	qsIbmfwjvkMStothfTU=; b=cN0gxQdoBXNRBUGFuqRgxaRlBzprukYD5lYhDHbh
	pJCKSwz40xcwrwqkily6uh/EgL6nWBzkttz7gDMRrpeKgjtrl+kIctX4StnKM5Qr
	xE7dqdZXJKpjyP4HNVph54Kvu/feROYEF/2Gp8YsWe60Fx7NzqIOrJnAwe3iGOj/
	K6Q4znLDh1EU8UfdcpxuptPmjlECc5h7m1dhVk+lIbXNBpm3iJZggY+dBSocYQEY
	G5MRM6bFnP8DkR7MTRaidB986Sgmu3O2uHLlrX7hriaJIqu9v8U1HOeWAEMtpJfN
	EoDaq/XTcuPiHUOhd77u1VX3SsZoX99igl7TWD3kNc6pvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0k57s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 11:38:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09693109so41209661cf.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767785891; x=1768390691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=;
        b=fqxYbHVeRy75PAvfbrzso7pYOQEDk+PsGMH3aHXnG1ONTnLBFhe7AZyiuK24Qg9FXo
         4Hx9rzwwDn6nvnNCzuC/Ob7FwI8rE6bw54cuucoomkOcejZlnXjdE1VMMd4BRhG0+jcR
         nC9UGKVXHBDY6Fcn/ngBbjBKVatvuQ5jTR7oHX1AtpIqUkmRPX8jSj1VUUAbWRExQAqp
         2V98jG75CBtWlrCHK+SbPwpGTeVO2mIo5XGEgyC9W+lCWqMGyWhG8aIFfD3cYvJ7f/zl
         cKOjX7ACj0z/59lKcmrpWwiitZJ8E0zuta5vZJXzccnLVo5mx714MDoPmTKHbmPEVT6u
         5aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785891; x=1768390691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=;
        b=xVRq2J6ymIZbisE6D5eGEBWzb6avnboy+PjkW4sugszlAONkUNeFneSI4l0jCXw/YA
         Fu0600eh6ZsoqaMONTDr0+LvB/EYFHmx+zpyqwT8EPGbwn20h7VaEExPXNNPw0LLn0GK
         yELX0WkCHN8854g7vWQwG/Gz4gWWfCS6YWawfdrqpNGR6/qKg+nDRgn+WRxhbI44+r5L
         PGnOSqgoEpz3foCyi2Y+R+YQuTSMuiDA1b9BmzUgWoxNLkfiU4tyO5kcQwxNA3wreSbs
         nKFpF8x8PIG5haA3M2dOqnrQjxexxH8Qoo3LpETputpPzOTBUW2Wiv9FLh2yvvQFA4D4
         1UkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfm/V9fQ9IFemY5NzPCFU6yIH1e+QA4u7qLNdOqs454flisnYfMJPapimuRWi8WG3+aTw1NuJPeDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMSwytvoraLr6vmmUo1U5NGEYkzasPDvsbzg6g50P+LpU/s8Z
	uW0nkl54i90bGoww0IpcS0HyPJ3fRs1WPdnMtkzDzGJqAO2hts75rajdG5FIYA9uoKvLU/kNnL2
	JdyikpXhWT5TmIh1WPAP2c15oMPMLSkvLADhjlGG6H3gNeAs+5I6JQ3MZoKsY1jA=
X-Gm-Gg: AY/fxX45AYlPXdoG7+p+JRWNpaPdaedGKbe3+0iK31KGyZ05wgqVp7cJKii+skgSFOM
	4JqY0aSs7fQXq5VW3t7nJp7fRkaZOGy3z2tRhQG+I5+h4qLyUXbFpAGeotv8kHvdcSHGOUss3oI
	3v+orkbXylDaKhwTKeGnI6qL3CDgD2KnuuOA5aTZZUdkQA7Nxdtak0nJFUPqUnrvUU98m55T0L9
	+4oGs8PORu85adp4aMnoJWGsh40UKRItVO9xEMPreIbjg8oVRRn9ez+zBJAaREkM08JZ+bRg6Ii
	BgaDE2DlkbHwCkY6Zr5Rx3T620SYIGWLN07oaWlfg7ZL3/s3zC5s09u0+BbbeDDfbq4JYMzHzBD
	r4ygMZ/rpkQuj1f/iagCrPoR8U5GxAPbuELbax/JXRBid855t4r2VKc8yhKLloKUY+dbmcrA2TO
	twnJo+mgbtI4SN9jXA4i4cCqs=
X-Received: by 2002:ac8:6f07:0:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4ffb48a85c7mr24563721cf.24.1767785891004;
        Wed, 07 Jan 2026 03:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHssrBbLsPN63EAqbkxOs6z7YlYy0fo56gNVYCJ+4TuA8iD6IDnXJH7V/amJMkJBpE+nIYMmw==
X-Received: by 2002:ac8:6f07:0:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4ffb48a85c7mr24563251cf.24.1767785890529;
        Wed, 07 Jan 2026 03:38:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b715ebf53sm343531e87.76.2026.01.07.03.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:38:09 -0800 (PST)
Date: Wed, 7 Jan 2026 13:38:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Rivian PLL
Message-ID: <jffkujjicjljsyqfzu4hotjetlfcextw4vmmagjxya22tshol7@buvtkrkmttos>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YzBoX_8USihEAtE0wrm2pyyHgEh-Dpuj
X-Proofpoint-GUID: YzBoX_8USihEAtE0wrm2pyyHgEh-Dpuj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX3ivok5WJN9Ei
 1Au8VOdv+KdIkpfzSHZkiNFlUvV5pF3jxpzkSiZHmpZH4xPLOsIbsgT/fq71xRrx7xCFqopKYt9
 Hlq+eoOl0P+xVDo4xMkcaqkBVZVKCXjFI2h+gOTtIoI/JPCip2e1/4+Oi6G1sab5ouRZhpIaXgc
 l/jyMDFQ2LHBgSdk2yEMOlI9X8Qh4LqWBIVjG2VowH8zwP7Xilose9l07axhOLPbMPW769mgTj2
 pv8nx6raWYBwcMkre3sugJ2l7WFwZuXaiv8aEALNlgZ7tnADvpTQMHS3N6F0T7mrMYbxxkSG8DL
 zSC9Y2dYDIHDFX3hYXYLSMx1ycIkjXFriArx2FmHFOTQgaUeJPfsA1tzuhd/3XNgCrSsGqiubmm
 cYvF0oQaAM+kGZK7xsAtdBImn7F9A9LApLA5Dbn5JNGL/SC6wsVV0nfqy8fyy6x5ZCTxufDnmEG
 R+cPZw7rv7KHJ5qvbgw==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695e45a3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rar_LHnIVK7gKg-YXgkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070092

On Wed, Jan 07, 2026 at 03:13:06PM +0530, Taniya Das wrote:
> Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
> for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
> PLL ops, reuse the Rivian EKO_T enum.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
>  2 files changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
