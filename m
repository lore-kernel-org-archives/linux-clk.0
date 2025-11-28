Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1430F533
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 11:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764329935; cv=none; b=YcjBLkMZAo56a8QcEj3w9kvGQ7VKyDGYjuQ/hUdsPP8+JPn3mhaZHcP1BXuKsfGozQXVb5czef8mlgGrHAaWI3x2Vi9h9TTmhiCmiA8vhONuNzkZOJBS6p739le42NmI9+SgZU458XZZypw78bg5w2ZF2sQ58bsl4w5h7lIQtyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764329935; c=relaxed/simple;
	bh=P+1AfN5DqeR+EpIra8enoM3WHW4B26d8GcRcbWUuTZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNWA+0EQ3l3AL2U6Lmb3I1nEqCYllQU0HqXICMURxv9dJ7JeOXCq1NO3VDt2rE/1ai/b32Nxl/sezFa9SEPqY26G6/NR1ZJqCknn3BzI1+Mm4tYW/cdld823RYV1YR7LwEkeKsKA6+g8lvP6Yt1z91vlLxG2R6oZXCI/F4fvRzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDy5aqLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlmZtjuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDy5aqLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XlmZtjuM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PMcS4122414
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 11:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZvLEIquG+R91vUFM2QSbUtYc/Izhyl0C/lp2PfxZJr0=; b=fDy5aqLWbiprRbQr
	kyO2u3TnTw23TFckDUPvlCMDh17aEuSDAmYkVVq5UzfInqXvrnQZGmjTSPXc9Leo
	Dd7xyRDEw+8WCRXB/cFVe49mfhYogn+2ol+X9DT99XV1HpkgFnVzYSLYpQEXlWrt
	diDRcGhpnfi+ddADjMm4NpRiLy1XlriOAV2Yk6pYLH/MMeNFDp2HOspd3FB6Eaoi
	ffA3samvOzYkyuehEy9UjUtaz431wdaixXAGV7C7ZflTHkksGQm2VykAsv07H2b7
	WRJqyeNiHr+xfIj9IlUD7nGtlFEJmQ6A5H2SyQCqgY3TrCaRI7Dv9g4gx6URvb7Y
	gHApYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61u9yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 11:38:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea2b51cfso41465185a.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 03:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764329931; x=1764934731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvLEIquG+R91vUFM2QSbUtYc/Izhyl0C/lp2PfxZJr0=;
        b=XlmZtjuM1S+6Q+PNtKHE/r4b2SK9XNwc8rQGd+t85xQ17mzHGBNpJPtF5f9UsvhM1O
         CQBp/V2Ac4T/49oxm2l+skNiDwxYGN5jE2p9uXVSlfzAj7Bp+sluq+IuDevSHWcOiPMq
         BYi4jYsDEL2HO6NSsRodtoC6t42tNmugmTSY9659S3b4Oz7ItHvBUVTTkhjp7kqoOpmO
         jLMf8TNxC/crFjRyqmgcbbq2jbhs61MNrkrC7kEP6ZSG99kOefKyHwhSy2L4cwwwhETX
         u/fqi5N/dbwtZQ0LgDq1ZkmoUY1krncJIZpfrN6yanAEC3StyEEhrg4aEHUy1V11/GEK
         Ieww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764329931; x=1764934731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvLEIquG+R91vUFM2QSbUtYc/Izhyl0C/lp2PfxZJr0=;
        b=qG6NYfrnnv68xL197XGCiSED2CXpwdGldTFchhfTyczBhYoenEGwVZqHw4cboYBfeG
         3QdFd13aX71TP/6TGugKN1tfPwpLl9hBHAoQkzrBC/WUizczNHNtLnPwu6dakY0CDgbq
         qrfJiqBrHLrHG7fs6a7cVm6mirQeaBiSxm+t7NKZ3FVTO63hN5mXUTd/Xcr9/L3ouBK1
         M0zk2gQUgwuhT1x35t8aTzQbGGMO8zdjw9upg4ZDQvG+fkqYNopYgJqbxSpWM8hJM+jS
         RFLT9RVVH6BCZ62H5lZdK2Q93ZY/RrWD7wawjcnBFHzqoT6wlmG4gWX/Cr29gY46svtr
         ds8g==
X-Forwarded-Encrypted: i=1; AJvYcCVXCOMBVs/ZMi3xFyhvZATeDeXPTBZYirpzg3xOQ9PHU/VYoczMGR+sz3AWS5BoNRWJHMcGP4E/+Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZDkcBYM2ws+k4d7PhD6lmwf2aatdGDg5TJFeJoELswqhXExtI
	foKIeWsooyLkbD33eS3JPL5VJlHqu74W1mOeguX9xvoQrQebKFKiD4/Ai1yRH0IsZkIpDthqCwP
	we8/jw4WLPLVhXwTHHam+El+6t18Cxt4+nS6rxzbpXR/x0wKj0uJNduWGeF9famQ=
X-Gm-Gg: ASbGnct8PUtnqWodlzbQH4VENHWkKpyCnG2pYnIli/dAmbe3H98DjG21JhTo5ZBmECA
	BvljKgCoPJUiKrcQ29HnzWc/k7r0NL77uuhegCtsvljFOS08ZaZHpOGrsR2Qa0mx/rE634qEUkH
	E480f75Ph6UJTfoKJW7LfmF2zBbJiYc3f1gBtGNR0XqTeOXfAu689E9uWocVZUYCf2Cl4tW0O4N
	+eZrhu58RTm2BD7HqMHS8hUkSQmlLgliSerc8jlP4d+j8cFP+XYk7ksxCfISrnjpFzSiioZFf6r
	qVnl5JCLy1pnl+Ovr5BJHdmNoSF1OpYzFX7cjB123v3z/xKlFgPU1Zm8hXeNV/QQ8kPz1yZxtHW
	WKXbHXsDgzA1Q1WJprS+yhyRKyAX+2u2QRDLGL7kTYyKyQWRfxIFdoYVYYOyuT+j38AY=
X-Received: by 2002:a05:620a:370f:b0:89f:63e7:b085 with SMTP id af79cd13be357-8b341d50dd1mr2641059485a.10.1764329931060;
        Fri, 28 Nov 2025 03:38:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrqdAmLRsM6lL4fCg98iG57U4IEsWhBTf0YdtW12v6s9emKaE0W/wAYg9OozB+Dhu5sP6GoQ==
X-Received: by 2002:a05:620a:370f:b0:89f:63e7:b085 with SMTP id af79cd13be357-8b341d50dd1mr2641055485a.10.1764329930530;
        Fri, 28 Nov 2025 03:38:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm441919266b.7.2025.11.28.03.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:38:49 -0800 (PST)
Message-ID: <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:38:47 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6Gr2lLcpkDqaIR9Q8yuf-MBY_Jak9Ouv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4NCBTYWx0ZWRfX052InWel9Z19
 BfEP7TKWu0VtmOVWt2mn/W86qHSpUMxCEJ+f5u01/7oLHQtS5Z+WnjTm713HP0Oo9YYz/32jtIJ
 vcIah8bFaEfSrfL7i9e6KQuayCOhZllkcuyP+4uapciKdXQq+s87niHPvmenJ6ryrla7b2B8idw
 Kmu58FvmJZDrDlbRfRa6vkb3xyj8f7odcmES0QAOEL36vHzppvhdAf27eMFzaXEfQ9VMIm7uCV8
 fT+j32+RC/t9yhYTWGMlIRhPvsEkmyOPgW9/WFBbfMvU2tU9QH8vyAJsRgeNrl2Q+gN3zuO70Gu
 pljNihmPGC/KrgTUV44NFBFH38oOCVjrYfscrtV6tlQdjDIjosgbUlJozg0NOOApExSFD/95lvp
 myAT2GHKx59NesoibyXTsbT7FulaJQ==
X-Proofpoint-ORIG-GUID: 6Gr2lLcpkDqaIR9Q8yuf-MBY_Jak9Ouv
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=692989cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3bdS15YPOoxvJoD-rdwA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280084

On 11/28/25 9:40 AM, Luo Jie wrote:
> The clk_cmn_pll_recalc_rate() function must account for the reference clock
> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
> with a reference divider other than 1 calculate incorrect CMN PLL rates.
> For example, on IPQ5332 where the reference divider is 2, the computed rate
> becomes twice the actual output.
> 
> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
> rate = (parent_rate / ref_div) * 2 * factor.
> 
> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
> IPQ5424, IPQ5018) that use ref_div = 1.

I'm not sure how to interpret this. Is the value fixed on these platforms
you mentioned, and always shows up as 0?

Konrad
