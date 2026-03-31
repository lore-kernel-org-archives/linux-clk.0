Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E1A3A7F70
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953038; cv=none; b=eb9UPQzylaOs8A8OPMRwHRY7Ri6oL9kWtH8zYOW7e8sV5PNV9yKycv0jiWhesUMYa6wg2YC/UO1Rg46XbI7tzyV20oe6xLvhf301Rk+nkknDBdBWg+O4JNOLVqipTIhOPRBpNeMAjzaXVZTepvlDnow1xE2t2v+xJ8lVad2fgpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953038; c=relaxed/simple;
	bh=D/jPy94guZgpCidPZgT3orWG7hpwn21maqShzO1e2gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f7JoNs1ubreCSomyRG9ltWcMNhOiakhZC1B2d3uVU7qfbtlnlBcDCN/ce5XFHjFR62jhbA9Gdpy7Q52zfoT3GFXvYNcmlNq73Lw+0ZHd+seq2r+bDoxJHxbBG88nbYE6DZKpsunEcvBLWtp2Gdu4+c6P11gSfHBuniYrVYD4NfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdVnZsdR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VE3VHeTY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdVnZsdR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VE3VHeTY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V634EW1090666
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=; b=KdVnZsdRtnR2gq7T
	lcelVAhTrgIH/shudawtLTooth+u06vUOSKHPaVWN7joo65ZrsQGXBO3xviSME5e
	OiGaJZwZ4BF8NJAS33zImqWlP6Blr5Z/CIEyF6vatsJsQ9wCAyQRb1eH3X6WRXO9
	bfQO7pGC0T7RhPCTgkjv9HTFg3D4FXPvw8tI4Qsb1+QJtTaoKD5y9AejZ8r2Uuzr
	Gdbseg2PE5aUXJ1wpfBSLR33U7dvFADz8kpkvlTGAeHq5U6feJQjCYB0GNvWX5O8
	rQLJ0Asv5QbDCjiysclgTbZk4PNe5ymtq+cZGzQbHqHq3gO0anNOvyhvvikjux6t
	UKOqHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd497d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:30:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso19116176d6.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 03:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953035; x=1775557835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=;
        b=VE3VHeTYqfhf7HCpwNq7efIFtxsrm3KQBkpTgruccaomPOb3djiD4XXiFcYHP0E+cf
         75Lr6849472DrjIQMXnr1vxW+vY6KRxJufiKEpkUB7m+rxZjPX/sYEdDuFkygq8hLrmn
         EsQbOO1ntCkeu1SKGCb7lmziXpGoeh4MkIimw22DpNN6qyEmMF5/V+SJE9uonRLp4Ttk
         WPJJN3UIMbck1Kl1BnWbflerUCIdXH6A+YsbWWcRqUWJh7RdQ/GOGb1vhOkAr6RthcB+
         CbeMQy9JxFiXT9HjdvnJjPtpK36Mt3fLjgluMFhQ3h6LEbYIVb8QvRD9R2R24H51r2cr
         37MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953035; x=1775557835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=;
        b=TSJEQwraR6vKqxeqzR15oqxWQPs8kCebPK1Mt8xT07hB8IWRwB5j6josvhJxs/B9/l
         YWfJU16JKiNFq32SgdxW5/BuMFQeeAT9TWbNH0pkJMyNaKNi1CTUDglfIZD+NNBxAs4c
         SV+GgBTcoRGlLV2s41+0Htvrv75SF2O9EZtCPyWplrhDXqzi4vm0quPuCS3pEeCVhVc+
         K/mqypxzxeTYam8Ys1Ip682TmI66wGk0srKOoxGJy1IY0GLrM+kzLr5882HBW9OWkEx2
         bztRMb0MwtYFHQbIr2C+vHpU8Cro3dpOZj4s0tRXxw1gMSvUZAjjruartjE9epVQuaRx
         BVoA==
X-Forwarded-Encrypted: i=1; AJvYcCVVtSYLgvba7FBVjs4dZbnuBcguBJuUD8OwR1ABN3nj2w45F2c1KpGj6VzuKj8bL9fEEQC5Bwof/yI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6EbIByAtwC1wWD2YIGtkhHef+Wur7dv4LBYyH95zaxtWDv5K4
	pxaQp1m+m0IUzjJz1qhIrr8MJ5dIyv6Jiha+PyeoG0ZyWZZYVzXKmu4nIMnmoRHGDer6ZNU2wFV
	aKjMROIWM9jJThvXO6AAQ0I4hUmsoIjx+GDFYWbv610V8KHTDhLNe4ARBkwBp5Xg=
X-Gm-Gg: ATEYQzyFRItswDKHTuRqHVM4/DrSzujqX0VntwC8GbLMZLO/Oo71j4SX29BaA7+f4aR
	4qm91ff968/XirNdwvNbtDoKs1jdbQj6GcyFz4bLyNWTgPAQhJZY7vH4xbugXiIX2XN8VXxwOZH
	EsWninWRQSvJqfji1CO2KMRhyokeDoffNIT3/mcjvMf0N5WrSUVVU+8g1GJ2PDP7e/iG4k4UX4t
	ZDucUSwndhYw15a9PceNkuxfujpbo/z0+Mj/RbbqKBTKA0v2QrEPHR4roenwOl+GLy6BvFT3Lq0
	5mt2tVo1D3fDdBt029l953O9gwPGo+sYW2iKbeJVKkGS6iwA90adfcUJc6TLwNC7G4629AcxBui
	E0ORdeycotOLH+hxgVCH3KT0GyuXoUfu5BOQ8ryqj1XdcrXvSPlkMOBMMZYTH30/I2InQQig/Em
	VN81w=
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr178613766d6.5.1774953035272;
        Tue, 31 Mar 2026 03:30:35 -0700 (PDT)
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr178613206d6.5.1774953034772;
        Tue, 31 Mar 2026 03:30:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1dda44sm385697166b.43.2026.03.31.03.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:30:33 -0700 (PDT)
Message-ID: <2a444667-b3f5-4992-aabc-6e7bb1b1cff8@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Constify list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VhkQYRaP6L6yxKqaNaYHyXn-WvF9cCEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMSBTYWx0ZWRfX3BkUefQLY84p
 SZAAmUIQ8J9u7ZPOQh8RQQ/TvMAZ2dYCC0hV6ueRUgoxsoACAGKhtJ3fcc9NHHFIIv8Kr+Yl/nM
 GKB2wIgVNmar8KGX2pnjTS0XmthphIw5MilS78oaA3ytrwYvnlm7UvYvCJfR406/ciGvw/wzNPQ
 SPhh4BdEmyj3+QKx+2ZvSKAWvQ4dQstlEmzrs3XpjTFNdhXz0G7FRntGkvc28SZXEBnYTEdSVaQ
 qMfrNhIpnqHl1UE3EksG8gsjgTLMR69kG9BM9320xm9vau2OKeqWxFETw4oNAQuatu44T9itGqY
 xnb/BwY2b2Ic5yw4gM8oEqWxX1aHWx3tga7XEnE/S14uCtadbmreGPhI6oyxilR8mJ0PfXnzoPp
 H8SZALIDW7WbC19Q0VJ6a/ZmEQGRe/X76pHOw+16vjbtcplZSt4aUoSV6GCDtR51uiKWL4QcUu7
 CxpAKi33DnI/3nqjYqA==
X-Proofpoint-ORIG-GUID: VhkQYRaP6L6yxKqaNaYHyXn-WvF9cCEd
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cba24c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Opsg_zMjOw_MMP9tyQsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310101

On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
> The static array 'xxx_critical_cbcrs' contains probe match-like data and
> is not modified: neither by the driver defining it nor by common.c code
> using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
