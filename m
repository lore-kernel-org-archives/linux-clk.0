Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637030ACEC
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400868; cv=none; b=EkJkGTo5xbGyTMifDDZDNs762hR2SNNON9SVsEhS6gLzdqr1QGtQU3Cef5qkSp1jlD3nT0DY/WPjKqUt0o5LNR/u1jglUmVdgBHjFm2anR1k8DNmEro05xveNICDtUGo/WCpo07EOnzOKwykL/hXNNC/qNaaT6irq4G6tgO6IiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400868; c=relaxed/simple;
	bh=gVUY0Xv5dUtiyWTE8tWxGtpdbyrjF4RoiY4TGiauS94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwzW5RUPrAuOP7eHzzZKgElBkLiqm1qvnST9ksb6wI+r2VnBoIPQCvnSyaXY7V79e+B16NOIVliZc9EzKbhIsxHCCvNoVraarJ1lcZSuita/evmPMt7sDTJ4SrpYDLiXkcTQRE1YWYfeyL9VlUJgsdz4mzRVRuev7xWWciRLF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7Z75D88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9R89chR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7Z75D88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9R89chR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2odC3671224
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqq0dUy1JpIIId8WEAccK+hBBemZQgH7944I/ceozwY=; b=J7Z75D88vwh/HyRS
	KWUZucf4RTTE5dLMZx/EOtLcA33NngwYnWdc7DOBNx82g2hrBYgnDUFuc1g4AIDs
	JYsNP50yUkxNugiibEn6UZ0ropVLNv7TZztocRTI/FRJgYNsBZjP/wC81lUYuB6z
	qkkH7S7p0Tm8EO+XANL0XKGgaCsNlmwcw8A9pepdWO7P1lOg3aoQqQVhwztzLLFs
	XtBZshgogkylIt5+xQY4hIgk6s2FeUrQxijDRH7nKxgFSqbjzgVUJIfQmK0n0eAO
	yl8mt1VXlkH/gVlDnzX84WK/pRKpihk9A9Z0lTxi8VbRSc0eZz08qb/rVuqaZ5Nb
	Ifq2lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g594uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:34:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede679393aso147988021cf.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 09:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763400864; x=1764005664; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sqq0dUy1JpIIId8WEAccK+hBBemZQgH7944I/ceozwY=;
        b=G9R89chRycPekry/lOFIRaOARg91mXbVzi6tMwHSpz9e4BEC7KLhayHGZEKdtT7aH5
         hQ9ovcbnsiB4EyTjsBbfZUxTssxudG4rmUCsv70UACP8fG9RB8v+OgdgFpvzHnb8fjPz
         FUPpyS8O8hK3dWsckWrGwBiFLvfuutnN0lV/cpTM+jICLfgufqZXukR3/0uQkAil2vNj
         MC2ppaAYpaSyu41hy95MMN4ciYDlgWTlwyoew9v/VQSSira72hRSpxIKlyOlQO1jqjC3
         U9qLnF4HPQxCKFlS3fWeKv9o/Okha+37tSOy2aQihHjIcaLS7idAMeW2oiHHHItHl+F7
         Fdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400864; x=1764005664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqq0dUy1JpIIId8WEAccK+hBBemZQgH7944I/ceozwY=;
        b=OQ0yoCQgwBMlqwP5yKab6FL4DPTfFGEV2pAgvs1Fi8AbMKGyQnBYKv0VEioWquqWnA
         sbHHjleXfX/VOTx6ukLHi31CB7wJFpc+yxT9MtjeqEq0oFX3tHB/zItmdG7BWVmCV81g
         YRwoKuToGYCpRpGDNobDLpkHJCKFKHVVP0zXY4/9wjYb2aQnTgVXzv+7n/OEZ6Mae+r6
         eo7+dSIaZT0L3Y36/yy1jZxEoC7kBsdX23UQJNxSXTx5I9pRs5A44MWHHZ7fC1PRs7Wk
         PnEuGwWR2F5HipUSSjO58CBOwKBp4J2BmsJrsBOMFUqFbGzuCLoUVT5vB8zg5L6D+cb2
         NwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXgn7qu0oXm5Oe+agUjwqXwDUrNi0CUjFYxTIDwLmDKeybbxKsPT/txEMn+BTQrhSnrbHj8orz2WU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgK2ATYncrPjQC/rNOsEgIhCVmKjy0I0AwnJYN+uDkOpqbBvW
	EX6wvzuIyF4S4tinCP3U3gDFmU8+hr2WeMB4MTLYbhGapXDPZwoCdvYSs/SWIUkLa28ChP99xDX
	VNerM/Uabl5O6lk04mmLC3Mij9JXY9r4LucFns4yvMAbzRt/ypszl/g7Bhn8kp4I=
X-Gm-Gg: ASbGncuTGAJFRcZvqyT/bQu0sZwXTGLZ6mg/iEn4+lZYXztaaOrmy8xIYZvs3/78aJX
	iBzBVB8/IsHICA770w4xmlX6s7TodIilkC5yTjStRsRk1CqwS/GR2oISkobFZXn1heyoXq/+ysd
	0md/YN1lcPwGu55/7MRFw+KQoFn6Gwnn6BKv0uEEqjGNjvBMln/QecLtTSbOccOCXZMTgVYcvnL
	BFOQ6saKdqNX7txSzXeNENzOqksCx3C7kjRYNl/xdAM4DU7rg9TPqOUOpTzbF+h5XQ0PL9uRymE
	zWcOIrQ0V/W5wCfE3FTl8cPQBMtdDt/H1l/3XGybuhFcMulk15ot0b1zPY/l7hYvhIRXGf6NAZd
	f3qzQsTs2KHWKv4m747I9w5EDKlWbeGVLO5EOpMYuEXwnGGqk8eSwVktXAlvAgrGy4BbPPMK7qY
	qe7uQb23MRua/e
X-Received: by 2002:a05:622a:20d:b0:4ed:b1fe:f885 with SMTP id d75a77b69052e-4edf2054e17mr193401041cf.19.1763400864433;
        Mon, 17 Nov 2025 09:34:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDsGNXgDrM+YQjWMr3KW+uuwO7XHJLec9fyQW08isuv8jIzJNYLVDJ0mX7QQZbf6ZlUCdYaw==
X-Received: by 2002:a05:622a:20d:b0:4ed:b1fe:f885 with SMTP id d75a77b69052e-4edf2054e17mr193400371cf.19.1763400863952;
        Mon, 17 Nov 2025 09:34:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b7a67sm3257940e87.43.2025.11.17.09.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:34:23 -0800 (PST)
Date: Mon, 17 Nov 2025 19:34:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8937: add reset for display
 subsystem
Message-ID: <whgt46es3c7ceceoknpqlqmxvkplzlcxyksqf4do7lpcco2fbr@3o6apg4czkpm>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
 <20251117-mdss-resets-msm8917-msm8937-v2-4-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-4-a7e9bbdaac96@mainlining.org>
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b5ca1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=4nVcwanjD9Et_E7zVfYA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: cWhc_-M_Q7IW_MNfmspa2iINdv1Xj6lU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0OSBTYWx0ZWRfXxF/DSvv9IsUp
 RjvF2cWwaQKDZa8uhkSEXeXZz3WbW9NC6TQwLy4OJmjaqHSY0j32EruvypKuJZybLBqD6BL6K+T
 kcZmE5ZXGLLM/09isRCfFoJrrET7ucJxAeGHot589HFVYltOEVMmx4oaY8I1+o2eWhjDQFQ+12I
 irNAeB8BhXMVzN7FkxbpCEabpS2SWpNE4E6ARCvgEk7ntfprMZuUso6p+ei+jyjaGi/go5G2NE8
 O6PGwmoFTf+b8WVqxcp3x3zgJ8zu0gYXVOL9SeCYL4/CM2qtBUroQuP+eQp8Nvp5fUxkLnimvoT
 jXOAE+wmy5qaj5t7nM6mXI/Es8zIIY0asj9GZEHso318HhOGdepZdCTa6BQQEdXQB89J6tO/SVu
 /bbGRivZ/+LT5CrV+SS3fnHSjtfUSQ==
X-Proofpoint-ORIG-GUID: cWhc_-M_Q7IW_MNfmspa2iINdv1Xj6lU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170149

On Mon, Nov 17, 2025 at 06:17:55PM +0100, Barnabás Czémán wrote:
> Add reset for display subsystem.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
