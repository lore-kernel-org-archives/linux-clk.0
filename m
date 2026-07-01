Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6135B481640
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912166; cv=none; b=SJUQ7Do63P8q5qdPvVnKFTDCX0eUeK+PurcRKhfcZsWokTjFi49J1egwaTgD1IAdvvlg3K+gerzqfbnQVo5OdbTlS6wEqGuYtwoXiL4/1KKa+XfKVM7gubSenpNaVKciiGDfaCkdXdyVpqnUr2BTO/P2jEkJqEBFA1ApaJ6TvG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912166; c=relaxed/simple;
	bh=DKQnqFgDvTrwaMpK+r+TY4JSM7zHMX+ITmDtTGd0feI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQgNxneYjgsySS7mP89DPGsaEa7QQHPLDdkFCX6lXS6GnWMr6Cy+MizacWqRjEGMEC+QI9nX+ocxGR+c0fB2puDnE0uLowZbTZRgUpJQY0LNynra60R/npCmsqg/IRT0Otk6k2bDyXbifHzzAciKC4N9v7r8CGb3R0Hb5QwEeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldr70smB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgM6bW39; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldr70smB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgM6bW39"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A999U763531
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 13:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=; b=ldr70smB7v8HWz+s
	6M2oD56++fE+l+JJJQ5PuQj3pV7sB8KcXw2JtelayEHPAx8AJL5ZILKUe4Jj1wIO
	i3Mg+1j53PHW+Tf2idkFoRnH/5gAAeEYfESZYe0krB0qVjsPL63A6OvCtaWNShTV
	dUC3YdicyPOBpkbedZeTIiQB+c11G3Pcn+t0mk/rPPALvIiX+YPZM9sQ9C+mQ2aD
	5HUXLJ5WLuTYUoU5IlREeqg1xfQaUEbenx77ED5A0ICEPdWJZNXx0bXubl0A0m0B
	svUa/v9BGL/FpkKYxxHYh1EnbKopjEbbnjLcTfkQ/E3HkywHaXsxdjZNj9K2pkth
	fAVTmA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktcbt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 13:22:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-734f7d8bb37so42628137.3
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912164; x=1783516964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=;
        b=bgM6bW39HX/8mxWNO9buiS//scRWzl4IYgj0goRLnyWNkbwMMPwhTq7jAfaYh4Ry8G
         7TDc1YdntmuEQPlnHTgLK8NMVhjBIRWNU4qIsujNkUdJ47wabgoF8ttcxpY6ao8KaBc2
         g763OPMwYZsGiCsir6ZNBXME2fxgyRUTWzxBP26NWfuxfD2eIv44d19lIzpDOqVE2/mr
         KxRa+RgmD/vhpUeweACYa7WcDGCD1Z1GTedk080Bl6ESXe1ui5YAcbBAySHESoKgnCPR
         J31/UyL3Ou3ttynqduE3nwRCXIPw9cWz27i6IzFo29RTYsml0huzjxecwBu7iY8yjo8k
         ejJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912164; x=1783516964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=;
        b=WBaReOWeMpaWicalwmd4e0NfjL35J/n2+oa4MyO2og0jrULyHQHOpw+7v0c7X7KP6i
         z8n08z2huJRWRuuWAjxGRtMH4ORQrF4j1J5bymJ1kxewLxqQnobvtsnwTN9O9ZCAVwaZ
         KfQ1wZ4G7D3c3LbEPerFPxRAro8O1T+69SKesQBeWC4fgKadB12IXZbpFJM57aw9uU8m
         9pR5agtyGOtXqd1UXkx9iVuLC9ywt/W5y0wXFjf5E5wWqn2tRGY8qMY5tdD6uZlCIyr8
         2cPxCF/4qxYzRt+/XflKh29xNlz8+MbZdZ1IRu8qcf5s97GP9skzM5dTGb2e5u+LZIFq
         YhPg==
X-Forwarded-Encrypted: i=1; AHgh+RoNflhNykYH3jjxD5ZEgMdPHset8I20GT9TTB/oMNKYkQVIbPxh3I2saIZfQnA2/H2kOE9rVY6l7YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdo8mVdeh+B9EyquHX8I1nVvzbBwcLAg8Ng17A6EH6ZoYSJmGp
	vUSRl0vSDsGSkF6i5HQEzUZndiD5DM9pfmm4CJDv0E2Bo1Lddc+tnsrvXBizEcryszOmxFby1jN
	BuoYSrg3YKrWXr8FQuOHxLF5WpjJSk39Z3qn3ket8FThHJLj4MwXWphZfM0ANM1s=
X-Gm-Gg: AfdE7cl3ptlwJl+GTD4/kLKpIftRi+a4B7YXUbT2cRqFBi1OsnQwwCUGfMNhh6Lq/sQ
	gGSzZUNaqXr7TfQgu4IQQGmu+aoB/xzrMi+WVOsqe3vEHAuuqLKiTytXKRckueb1DFbYDxFcHIO
	txgIzmFi/T8owt/nMadbJ4m1+YGvxT3//deSUv8LPXhJkSBDAlOMbYU8oEqtSAiSjipQZFJXCmY
	WV13oJBpVOOBROIfdDhjBx596RUuY8R2pYQaRD2EaRhv0N6BHNIdsQlyZEQ0y2InVPIKMF8wk1g
	1uXgcOZpBEWm9iZAkdWm2mSLUfwCyfOcDPyCsCYHAionPas4yvy49/5fYJAyDRXE1GZMzdwkStZ
	jDHM1TzXmY+ymuxXA/bCx+fFzRAMIAlBHrZU=
X-Received: by 2002:a05:6102:5088:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73da7a92fbdmr184634137.1.1782912163714;
        Wed, 01 Jul 2026 06:22:43 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73da7a92fbdmr184616137.1.1782912163356;
        Wed, 01 Jul 2026 06:22:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12a1f0ebc3sm93612366b.18.2026.07.01.06.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:42 -0700 (PDT)
Message-ID: <504e7411-6cd5-4afc-80a8-e163894ca6b1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
 <20260617-evacc_glymur-v2-1-905108dacaaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-1-905108dacaaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfXz6A4g/AZePNW
 mZwxTu+/pIoYwd4/sHyeGOe4Sky39DR2XDniNhzIsb8Hd2hofJsITqx8n7l+RtaT4gMC5Rr60C+
 XJNpu4NqzBg6wBjUwHbsfkZ4Nutyd/0=
X-Proofpoint-GUID: QNkhN6Tq8NOjl_3i6c6Bq5ZDfACa3_sQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfXz6ZCY9Yw2luK
 z17BaPL4bZiLOgG6fMrm1ilnBcIxsjmx7CmNR28WCVkNaZ2pP4myEdvtKAz5p5XXCGUkuNQIVbD
 F98qlqtszvUhRZmhP0n2MJ97JaqcIgc7M9ANb3W0QdYahMVF/Reum7bnMikyk0G/TSSvaFGXgUY
 5Uj0bPrFwj4RT68C0o+eRNc/nuAkU7C4siGZsHT2OoXhvdPsz0sFWZXxHVEASpTq1mTgXQSLXGP
 42rdGwfs6+R5OpY4bvYhDaheBgU5I2dgpA3OzjUV6NpTKJea94+jwQEZ/V/fx8lFq+tinLpa3gi
 Bd3X9bJ0DO5iHlUaaLoQmEd07LKuICzTtyqRYLaCNGx0CsO7SDQeTrFHPqqsG25cyHC36OATd4q
 v5redRh0XPFDfP6cYC+LiI2kPRF/ECBPspvnV7baSSKT0Lr7fjG0/T2WFJQbXeYrndkPC7d+rUK
 4otvMe6l5UMC5IZeY3A==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a4514a4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hAgpJja4_gNiCobD048A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: QNkhN6Tq8NOjl_3i6c6Bq5ZDfACa3_sQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010138

On 6/17/26 1:07 PM, Taniya Das wrote:
> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
> registered as standalone GCC branch clocks. Drop these clocks from
> the GCC clock list and instead add their CBCR registers to the GCC
> critical clocks list to ensure they remain enabled during early boot.
> 
> If these clocks are registered as normal branch clocks, they may be
> gated, which breaks access to the EVA clock controller during clock
> controller probe, thus leave them as critical clocks similar to other
> subsystem AHB and XO clocks.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
