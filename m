Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C78747ACC0
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 11:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436517; cv=none; b=elgqD9bNbqukS2Km0fvGzC7Pd2R94Cz6NByWu1+SIFeWxyiMLjB/KMj20sfqXqBYRuX+cctQN+DEbxCggn8DAaic3cDpfSI7Q0v1fRZl0jVZ8yZknyPTKuCcPKLX/truuoWKJrDOxogaa1NzjVR/kzp7dv3zmxr7fml427utzDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436517; c=relaxed/simple;
	bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHiF1CCwjP1aTeC9unYhoqDrfEG7x+2gDFiq1hPZEsbNps9wSim3evUQI+y+u5bv0Iaiy8RMWb8sV3tvzk2ngnZMtsbZuOUUvi2wkgEV6jm2L5EuOFINwKaXP1YxgwwjhAjx0stbcPXf/4rSVsS11Yu0X1/z/zJxs4Wv0ympGcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+9TsFqG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdiHivbj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+9TsFqG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdiHivbj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHASY440122
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 11:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=; b=O+9TsFqGE6k363JD
	9dCl5iUaVqdw+Uclh1Y9mEV2kw5QjIsYEQHsfBNouNDUqBNanKxnvoO4qvURVb6Y
	tweP7l2SckV3qIF14Dg0GXiNhkLRxRXd3yr/3jdr1ZrFuFb8Y5UX1OloNRpOU37K
	H3GP4s1mYIa6oARjHZZFEf/wrUYXYggLVmkZYCRVfJQ7EyHzUmzby4kHAksf9HQC
	qUhjWwtipBC9lBFl8PV3lOtDCmrTLMwgsW18Y8QeZ7MWpQr1cUKTx65o3cD95G+b
	T5yMZ1QreIlqU1Aock/D31wolgVAx35NBhkL/P51lC5faZTW26HmOnIVcyoEqHUN
	EsnO+w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70eqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 11:55:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso54409085a.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436511; x=1789041311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
        b=NdiHivbj4d7vqy8EIhZVv5+1etzmuImHPH2wiTt9O+95O5QBt63FErV+9MQJHvvKuW
         z9++AwvCppxW2W1XTgdj0iMCAgm0lRA14OLVVjNBnm5KvXmMstOs/l1YgnqeOof70x7W
         15i+8OeHKjmEzbk3myxoQmNJ+FjI5SM2I/gs95+190q9FeRpx19h6L7RgoTk9kVWI7wm
         UIOycGXKHMZRVlltetM5fiDuaZ+2tOWoMTCxSDTQnWmSKOxHNP5dt6oSnnr9euWPt6bn
         0P2HUaTDNCjZjO3APxBwrmwgNId4MKx8RQI27m5AkfuLrd0pYgwZuy8ogm6sDLeQHA/J
         MWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436511; x=1789041311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
        b=MqyiC+yEauZi3PiWQutKkOpaIQ1fj2GkoP+AHt4SfFcuWhoVUe57YJCRgTSW+JVOgU
         eOURHQUNLh9UNzw4kcjwJvotFzRQl2awn6fA3U/gXoNOU+UGIGF2EkhBtUOAICc6Mpzz
         CA/37EtwCuhcPDTZy7XYnYqcLnZabyXUrvBTUiicbA3enmY1eyx7YgIW+6DvA791TWyV
         B5q3K9w3urnzFJn2QzwsXlI4qF7oPhjd1Fp2MtcEjRNqdvs6GXGMkOEAC3oa2P8pXyM9
         LmA66BOInPZ510tOQxLvsyJwXBXj6reI4dMJDK2umV0jVo2cWBr+NW04j+wtAjOlJBkj
         AI4A==
X-Forwarded-Encrypted: i=1; AKwUvBy8pTfjbdhsZ/GsWeMvwNbm5SNkDjZboXPWcJqUavmGCvD57koGxPfk4JIGah4lzWjGZPQqR+mB3pA=@vger.kernel.org
X-Gm-Message-State: AFuF++mvNTCz0z7/B8alQsk1mgJDXV/xxq5AwsxLQCDJsZ+u+xRicArq
	hljYX/a3k1UOEafzyGgR761WYI0RRjtEGLpGX55P4VIRzV0xhnFRTR+iG3CQwSZcqC/0Gp5yRCP
	WdkUI5dj3X/7Z2XKidtg/u6qd3Uo6bUZcGFH47oH6i6j9qzYjPHt3roAJMWtehv4=
X-Gm-Gg: AYBFou3MpB4youA9n9M6IrKJSYMewTQDRLVd8CDa4UlEvcvAf/5lydo3BoptOp9cMQb
	pW32qiGl6wnPrbT4873lZek49UujtJkMJhhcGxC/NRT7YXt+TtsIzBp/qBrwabtFaGgBxmTS++j
	RIVkzlh/dcze7/8+3uGVkEGruu2dS0+veIrVJnz3dRyvf0zukliz0MPZVGTMcxxwgzSOE0jVg5o
	D+3Hw8sb2kVdkNfkvWRAJHqGox2X2mlTCv9Gf0Z8CBIU9E0ogewKyA7PHZ1dvTUmPuvQayZcvKF
	upnCrJ4dIOahVOG0mGmNsGF8XlZk32zqpJk3Kj28O2su7VUoVIplqpnRFnxyWpTyKlz1NjU9Dxu
	mUJ5A2BrUdgMksHHcCeXgyw==
X-Received: by 2002:a05:620a:458a:b0:939:4b2b:b831 with SMTP id af79cd13be357-93960f5b7dbmr848199585a.3.1788436510847;
        Thu, 03 Sep 2026 04:55:10 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:939:4b2b:b831 with SMTP id af79cd13be357-93960f5b7dbmr848193585a.3.1788436510224;
        Thu, 03 Sep 2026 04:55:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f424528esm88150666b.59.2026.09.03.04.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:55:09 -0700 (PDT)
Message-ID: <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oDyow_RXr9Il7RcgdhEKYPHOiWudm7VM
X-Proofpoint-ORIG-GUID: oDyow_RXr9Il7RcgdhEKYPHOiWudm7VM
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99601f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=zIksogJa38HEA0Sl8gkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfXx3l+n30GwX2x
 oD6yX71fRF045EYuHFYwm6D41YfJFO6wrb1NInZOJquBJryguPvPPpd22Z+zZZcp2MLfvhI5USY
 f2UDP+edUZyfsyHsZQyPNxmQMuanFkA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfX8e3V++ARtm0K
 vVD1fX4qoS37vuMynEkXDRkCtNBgQEx4rBVvZNuFjBnjpPXDw+FyceoUjfwISj18DI35h45B0f6
 PbZqHTi/0XRU6uRe4gcTX2dnByT+Fcsc1aL6aaFC5lkp20OLRfVJTnprV5Q/r2459PjEErmbHsK
 ljCWamcKgE++j0XimT4drYQ/BrhX7VsNln+wLN1rV9GOEhpMHSfq1z9pQCqFGhPR2KKrIWZYyJ9
 cJjqDCUncogqHD/uo7Ty0D32eKve2A24kzVmUU8TflJVXut2ePdulQWkJJALPteXrvNIFsoqd9Q
 yydYy6fkQEl7dAqBXQL0JcpnMVAOyj2/isAJtAjm09xw0Cggzt6wiwd5C8HOJ7p0TOuDcp+Iq3X
 Qt9EVj5cQvHF3oY65lL6jUBDH7+oY6w8pMx8Vg3mNlJ5MtQ/hyFOmVDpVRdO0c4DED/zJVCfFdI
 46VQubkxzMp3v/7jp3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030103

On 8/14/26 2:48 PM, Luo Jie wrote:
> Most CMN PLL output clocks are derived from the 12 GHz PLL output
> through a shared, physical /2 stage, ahead of any further per-clock
> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
> This /2 stage is present in the CMN PLL block on every SoC supported
> by this driver, not just IPQ5210.

I'm not sure how the mention of IPQ5210 here is significant

Konrad
