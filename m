Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65EB207A32
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524535; cv=none; b=qCRPw6wyESTYU3YYhbBJplHavgU/a700hkgKylP0H9pRgAckVUej62ZTJeXKY4iQDPK7OBL10lxH/QFQ15xWur9qxFHlK4SMiiDgrnLL3usWuKL0RfI3US0iziUIy4FYbhtU+yKdpvbHo1MVUpIiiSKNQHBYo7pfeB5mgNB4tBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524535; c=relaxed/simple;
	bh=MtyL2OiA7oE3lqtbOw34TPVm0XZF4mno7jj/+z+thf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXizrsR2PawY+OKeWlyA5d5DWo49jvnWigCBAjHWg4luLfwS2M+yrye6Qlqi6INyWJ0sytK9t+23DR5F0oSsSZMWt8meUNK3GgNE5BdT0WBXfoGJajSe8u+C33myg/Qe+Y36CDqVb7Ej2ej3HuNCCCtbhjJS23dQ64LwGng5ZtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXHks6oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXwooSDi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXHks6oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXwooSDi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YOZm2062073
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 08:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=; b=XXHks6oqYJ+EeKkV
	55jKxrTcb0fM2EL259VAfdpGRrUDsjptXtZNqWfmydVLmqDunffqnRIacl5Hcl/y
	D+ITz8LwbURWAu/JQ7hFV8mHTbL67AoypjHy+uLhTdtfYagHgNqMs3PawxdNtvLQ
	BHHhl12NQsEd0n6ckgsjQwWUZie+r7r6FTZQx2Dh/JweIsbpdGaK65LXqRaPnaC1
	y4XLEENHCCUdAUl2IlD3ienrmCTpPDykUu4/QqDufVmEUEx2AnE/SButJ8TthTyN
	U6QgVYTGQn/Prn5uccrtSuPl7UbFbrQL4ex/Q9pXcbOSMvuPGmgo0pSdKKIYOySF
	W4+LLQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw104b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 08:48:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-529ae8e96e8so5839661cf.3
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786524532; x=1787129332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=;
        b=aXwooSDiG5FE2KUMVrs9kCrSc72REql8icPsGFkbtYCE+wvkGRXH9np5TDockRCRmb
         uFf41amB4NEnX8kpytBLrQcvBmZIH0cQcnH1Rbf6DY3xL6vbJkSyb0e/N2Rleb+969gM
         i43/U1rcBELfsPx7LjqHMfcOeLaBljAuwaGMGPzc7lYVdceTupgDjTU/qL2V1sm/kA+N
         /R4ZJSgUlFXq2XbKp52zBDqafK80gPJ2AEzmCvqAWPKUZyvQFvuHG2mhCH+q7UESLZNg
         UBbHHfC5jUoDO3i8XDy3qXj/2bcuOmPq28Lyn+rYP8s2LcUPr4qVZ5qbkYQr8evrByHP
         8zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524532; x=1787129332;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=;
        b=fBS9tGjMwY51PeDUbbVmqgkT2SFwcQ7LFVcZC0pgX53qn9LOqDPgT4CFACvyfGh0ep
         F7cBzQAfMhZ5wmEzY/F5wj9NSgJDMPCOu1vzop0Ourbbwk9gjCbD39hINzd3lotqxYEI
         qhQo+Mb8TQ5Aoz9eXfSEb4mIpv20AxdFouKx32NeeKJl/73PeNDOi7lXLWoCf8hrN0mp
         jWSjA1uNzccX8jPGMwfP/B7Pf955tVrx/bNvzpdt4QBc+HF/rv/7s803IvL5p8yqwweD
         s+lu347/fvCEiUlkJQ3fK7gM9iL1uC9Q6P+op4On3CTp9vwzK6HfFLiS+za89b626Xhl
         Uukw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7Ap6P40NxXSE84hpgwadbJMTb1srhwCsi46iMlJgpd9vaxho82ro60axY2Xvc9YZ2Cb2uO8OJ1mw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXX9+mDeYIeyimRK+gxHTc1VIG8OfhNLsha9vJNNnNa00ibP6O
	V1u1Ey4pJctan0QcQ0Jl8WdwUQ9W7PRtgc3BTQ8MUM2Y2aP9pVd21tm6roAOgvvzi5uxDQddIYp
	GK9oUpXmTxnSB7N+pBXQ5aNd62QBtBjfmNsulOGf/LuM8+HtfiNsKje4LHji4brA=
X-Gm-Gg: AR+sD10UDGkjoX+v27dps2jmogcEyf1pkdsktUIAeESbd/GUqYTrN/M5YauVL6d3sX3
	hJbpVBa81hRUJbZXt13SmyIJjEbLgdvKatbG+XTBWcO12KXEegzn6VmiRbS3Bz+0qZczKygfv16
	iIfP8NUCttKM7Jdki175yG4UiwT7Wkun39I6hF7s6cjrQ2ghRFK12qBZjiP4xly3pf4+WMCycq6
	1A+iNGZjBtoulXkXQTgOgIuTF1+j0O/8dvUbyKTEMjPDSIw1QQ2U2McYNjzJ9Iw+CyJP1QzdFRr
	F/Ndp+FAaL449eMSI2EzkgCurX2EA6yTltEyFQ5NIywXgvS3ZFUYEyRQII7M8ra1we5fegzHyHK
	CIrRMBLof3QbqN61vSNtA+Jo5R9kU2Q==
X-Received: by 2002:a05:622a:590f:b0:51c:1a4c:3c9f with SMTP id d75a77b69052e-52d646a2a09mr26880431cf.4.1786524531938;
        Wed, 12 Aug 2026 01:48:51 -0700 (PDT)
X-Received: by 2002:a05:622a:590f:b0:51c:1a4c:3c9f with SMTP id d75a77b69052e-52d646a2a09mr26880151cf.4.1786524531408;
        Wed, 12 Aug 2026 01:48:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150c057f0sm5437384f8f.9.2026.08.12.01.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:48:50 -0700 (PDT)
Message-ID: <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:48:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com,
        sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com,
        afaerber@suse.com, jyanchou@realtek.com, bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
        cy.huang@realtek.com, stanley_chang@realtek.com
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260812020009.3480538-2-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2OSBTYWx0ZWRfX2AwRkcAj9PCj
 RBjjqSwZsH+LRQUP8ojycOQd15QNpJbjYQ5Nu6Vv5b2gXTCoZm2X/Q8J8ieR/9zKo4y4FHbDxYT
 mInXczcd74Nc/wDOVx331zlzuMC6P6w=
X-Proofpoint-GUID: AaQm3f267JDQIpfNVihVgjOryi2upa5t
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c3374 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=n9Sqmae0AAAA:8 a=EUspDBNiAAAA:8 a=iM2GKElL5x5HzuFTWzkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: AaQm3f267JDQIpfNVihVgjOryi2upa5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2OSBTYWx0ZWRfX8nuTwzPhxwPS
 rGt9nIpdMiEK+YrpAYABn2vyV9rnXEgghinQgu7CUBa7BO4WkmY+Jn5zSIyYHa/9pUU85JcTyRO
 IUZqsv/OSx6mCr33mySe6rj0lEyd3QeEPtvKysMRttSLWk0JumCj9ilgJ1mVkAmlGkdbc14BQWT
 syqlcDAnIpQvJWtwr4oPTN6m3E6+oGhd7fuMHfxLbYX05JqQnWJJa8rrOF7XZnJRisvzE47mupP
 g+QGrEdMdgjY/fJctgFf61rDJANHp9ex5hLp/xutyzk9atdHUOCF8mJ+sVl+tZE7KDsy0pScIo3
 06mGD4ZhidRk8UeCPCfxlDmmfJnsIgOV4QWdeEfK5pkv+QcN2pnJwh9xTDBM1Pns0+s77HnJ0ov
 RDqNOHd7BEFHFaO8vOHIGVCJ2U667LKMNbwceDQw/7ckQle+3+zSww2EXgOQ49IPfpNs93JVveE
 JcB4O5j2qhK3ZalHv4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120069

On 12/08/2026 03:59, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek RTD1625 clock and reset controller
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

How my tag could appear here?

Look:
https://lore.kernel.org/lkml/20260324025332.3416977-2-eleanor.lin@realtek.com/

> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Who added my tag? What is the actual flow of this patch?

Best regards,
Krzysztof
