Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F6347FB10
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549259; cv=none; b=jkeBLmJ7JynSlmIrvMd2EnGkdEF99IOcReXlcHKeIwP4/4PoYF66DedNQBpaVmLCz81Fk+fz8UdZ1Tqm+mneC0zTVI8IS8CDcdk5DnD75ZPKdevws+Jcyc01Zb6/CkFPfarr6EjPZFcBYsSFrYcbK95tSgn2ADCbMIOE/qWAaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549259; c=relaxed/simple;
	bh=qAinQBcS6NBAQ1Hv5hrmTKEuW3KpxxYsPgPOIKnm7tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ja1RAFS7FwYNS2kTHVY9TGhsNcpUaHT81qcUCXkisok/1Plk+An1IWTLJZzTXR3WFqbJG6lpjYbJqkfphTU2TM2rxezM2/xbIjDLeq4cgv/J9lnP6a4+ha1Wc6KRI89SVdfZeM7L9OL1Ox9pMziXbtXnHHFQjEnTwadViHdPbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQ8x2u+a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+xOWqx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ8x2u+a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+xOWqx+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68o042085145
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=; b=iQ8x2u+az3cDfEtv
	/HOIuKZVlwWFVRhnnmwyWZFKdlKJC0QcATyLln/38+iUAfbiEdPHne+LjLYPDi3R
	5kC1SFAvDic9LvVxs8LH9bIgRvFcHzdx6H8kyVDkghGbBHvAcTm1Cvg5LN9TEKIu
	uSJZBsJSnj42cM+n6Z+9Qr64vTi10BbWm1eKxtj10R5jUL4Tlq7ZDqCuEXsIOthj
	o1ig2cEDNd863fZsmWtoNxoGazrISVzLllgNxMQ0X60qBcK1Gl6uILFf594PwhRk
	axlzvl1y4FkKPwAt6Z7Yg5hNea0RTfHoI/u9FrZ+3nxdWAf6qi3nyQu/9UVgex5V
	zrQ3Vg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksfqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:00:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so4295419a12.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 02:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549241; x=1790154041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=;
        b=J+xOWqx+5nqKp6FF62LpYAptiatzyzgjHm/6Mdf2OlAhyeT5A5h7zueymsMHvWm2lG
         lH0thN2RutVHtJ0VBF2nc59+kdBtW6FjqxlC/aOwQhjm1a/LOSe8La9tSYY1KAwO+/5U
         ALZuF4dGk2+We+CMGOwY56NmII3SNXwOMCdEcDlrYuZmIivS3KYwXVtNru8EMx/5Rtlq
         1/7zNLijHztqkTPfAhq/ERI2DV4UtCD9C3+Rl0u1abyP11CYDLX4EAAW12s6a9xAmD5w
         /vTYdbrdCOkSHRWAOy2OjILppu/J6hDowRjad65glUxiNUrZe+QXuMpGudmUZuE2nDQE
         PZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549241; x=1790154041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=;
        b=Dg35tPQ3ISElwo5kinL3RD7cjisvCILLSKY2FSniDDepzbLAQ84o5dJEDD/ASKbm/9
         aJNVQEmpVWRb9f+BTSl1pyLaA6lbezvGOzRKwkJYgTrIZ0O34IZInvl1wnT5f7sr/1/g
         J756m4WBtjgyoCuChTQFi/jQmsjjiw91DjM0Meg8I0bloizVpWchsSRVTdQE9YYbVsxZ
         xtG4C9HMuk7yzoEGo5umM3psStuiGNvl9nusbIZZVmSdgAeVAXdnNYcPMLuO/719eZZS
         d2i3Zkx5Vgy+mD4pfK0+BgywrcBvBRa65qGJiI5NOhKDlTm4XH/vIYbBcu1QDnEqQ6mK
         7e3g==
X-Forwarded-Encrypted: i=1; AKwUvBxYeO8cQGc5yR+5DIJfztvyocSyTvQQURGd44iUG2WKybt9IM5rDsG45bB7mz5meaIO/50XegoRQTM=@vger.kernel.org
X-Gm-Message-State: AFuF++kbb8GnWFBnYxwqFdXNgTtsgMV/s5tVoF3MkQtPmaWKuz9f033P
	CICYjlz1Dyadcn2jdxcaLq9svzkpV7MKR2Ap7unkE1+LUhEOMHTiaAG61al/InrfaLHCazlhbhA
	xub0vZmMYHUCLT6T+G1n5iejC3La4PVRLbZfg7+Dmhqf53BxGsJvJwPQLl8W1PO0=
X-Gm-Gg: AYBFou39bcYb88tmMPIRkIUOgYNinzSHuy8Sothh32Z2kTJ4nkscQE1QdTEY+8aOVkd
	1DAG5QwkvCkV+GYS5FJ5Uyojf5KBAQ+4A5K/WXFx0FDrELEGBu1ZFTSHyfggTh5e6qc61E69RWM
	cdhpykEA65m+iTXIPbUZkMjHNRCwmdaCPM/VOAvpovnqRYnTo8VdqRJCsYbcON6KgK6fuB304/I
	bCOJxndqVEziZkNJRUyJrW4SjVCLtSkqVV8RqTctY3HxS/eqfx+Bggw2HosfW8+cXUfHM5RLSCE
	UGh9YlzU4mT5T62C+S3a7tLRfUvFGMOzeBV14UqDXRXfMdq8aD2XIbmu6TEntUOI9KPB3/ISIdN
	v6a2+sziPptBnFDFtuCRa09O57oEok2IZmR4yCpLQTax/3WfGuBpkMmFdn1sBxEoEeCRf3EW+sY
	Zuko0eZXO+M1T5SmC3pw==
X-Received: by 2002:a05:6a00:1bcc:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-87238e87fffmr3531502b3a.15.1789549240001;
        Wed, 16 Sep 2026 02:00:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bcc:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-87238e87fffmr3530914b3a.15.1789549235970;
        Wed, 16 Sep 2026 02:00:35 -0700 (PDT)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872024e4369sm903692b3a.58.2026.09.16.02.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:00:35 -0700 (PDT)
Message-ID: <2ab936e7-6c73-4d55-9b92-e01baa80a82c@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:30:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX4aO1FYLqdGv2
 A4vKCcXejoz/eluFxcNYn7o1Sa2Zfjco3k32koG9P203dNM7YWxlp2Pp8nAZKgY7HGxeDAsrWdD
 qQDK8Qu1+gQbIAh02LIDPDZSndh1xf4=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa5ab9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=V4wNLzlG9kf4F8Mex7kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 5sPlk4kxmosGuyKXz8iONbUOmwR1-qhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX0aIrm+y1sz30
 13za/3bbxPjgEIvC64klLjfvS/0HAhw6YyM3tndP4a7Oy7tq4sLLaI4R2PQX8Gh2Jd+s5VF/eN8
 VFf5dFF/XJLwoQaZro+sdwpJX9IFh5tvrNKx7p/PN3GjIBymHvUnsJHllJiExC9xrA4SEWxRrGM
 Boo36Hv2pBX9s7HFIKsun1Q4j43c7K9kuZR7BaUHheYdab62esMVAdw/GtTGfA9V5SfPmJUEcua
 usRWeZn0iicj0Gof2jqKdm2oKdhILE7KCCotI7ihyNwDXitDg14XgHHFdo3rvKwq1j/ab2Sk+A1
 9KIvR0Yse3u9YJKV91LZZbZ/cGp4hs9GVfrkJP4QovGdOPEzeFVXQjPyY+REcx34BTfHjWnYoxu
 zHfLjCUMo1mVMDlnAydxdwqRAPc05yDil+7vsp6XDnW1enbkkPbK51kHi7P0zuyNnsOMPb8qPMQ
 azOKW0LCRAQgjiGJXxA==
X-Proofpoint-GUID: 5sPlk4kxmosGuyKXz8iONbUOmwR1-qhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160116

On 9/15/2026 12:28 PM, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

> Fix Kconfig ordering/consistency issues for the Qualcomm Glymur clock
> controllers: the EVA clock controller (CLK_GLYMUR_EVACC) carried a
> duplicate 'default m if ARCH_QCOM' line, one of them misplaced before the
> 'select' statement, and the graphics clock controller (CLK_GLYMUR_GPUCC)
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> With this change both entries follow the same
> depends on / select / default / help ordering used by the other Glymur
> clock controller Kconfig entries.

[...]

