Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D847A896
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158126; cv=none; b=mnKmxdB7PWKOdgbfEo/VARF/O6OJIHiQDkne6pfn6A84puQ26LwdJvC5hr4ZVTnXDukMp3Cl61MLMaY/qx/AKfiVGgF3yZ4fcv4BR/dS2QtniThiDn3ZVtckl+2PV1Y3U3v6hbEV5m26XUl4rmQdj6H0GSvoORfb5iJIcHVoUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158126; c=relaxed/simple;
	bh=+wl9ZfJu4Qv4Y5Od1Ohoq1FSlbsXhwbYbTC/IR/Lqgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2Gcy+zNyK+zaf4C5ikguzp+nAAFeguH9+Csmhv1DN+MannB7wOS1+KOJslcFeo7/t/UCLLp9taymwTw/ZkYGiEW0ZbkF11ZPXC/ak30/nIdL7ixwYEQqNBs5ACA35oJNWCVwTX4g9nnhCdkrg/ZUa2NRNRBky/g+ZNwewtGa+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dua8MOAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY45TXAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dua8MOAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY45TXAH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2f8u191535
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zwfSfejAIjhfU8K4aBY2QKiy32iG254nMeOwu5VErbI=; b=Dua8MOAY9avt6DTo
	iOcUWBcY2PX/aEEBi2LyAlT0KqTPyO8I+k5lx2xbsRLFPpfUTDg4fv8Hoo0hz7/z
	XpicQNPEasqrtBrC6mS5R2BF/XKpEkqc/5XWWsoka0m2cPvUzXZLNy3h6Mfvbiux
	/EZvxaMmvirfpGXONxob1z8ftJPAHc6SPw1zGU8kZyeLUr3E04seeCHc11WYRosx
	yOolmXFFV81wRM45cr4l79UbQHySxRNXlxkaOWmEjQcCdphjllOhVqVP7oElSK4l
	dD1X9qmgSL0Wrz3NIrC4HkSSc+GGKRgr/gxSYUc7Vy9rh1g3Lny1XGyHpSWto4N5
	NLQIcg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc0kdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso42992137.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158123; x=1787762923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwfSfejAIjhfU8K4aBY2QKiy32iG254nMeOwu5VErbI=;
        b=NY45TXAHedCbIMKCY0ZJDW+MiFgYXtRpbr7jj1DliYNocGiPkT/6ks/1t6OC7Oo9Gv
         AHroBYxO0N0fUQWBD0dezuoTlEDojwiYpjlS+qQYEUHrbGGWAr1oRle+3iG29XhZAtjx
         YaraE139dml6URnRCv8238KsqDjNAtgl0Bnx7SPKCJA+05q8CJOqOAoF++Eb6SrlXAZ3
         mjy9RFdueK8BXb1yz8OrIPUuDpbd1bJlZcEVKNS7GjZtNyVjF6vh7cql2/F/+VPETs7K
         dE2qCYx5aUCn9lVeVIbWIhgV/f9CRREI2rA3S10f7pYjyEPKovc6jldwEN7M5awTebRd
         XIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158123; x=1787762923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwfSfejAIjhfU8K4aBY2QKiy32iG254nMeOwu5VErbI=;
        b=k8pgaOMIwB1G6buN1FpbHZEAyJkTmCx/kAF/Gn9cb9ItA0bjG2RPvywraGFn67ZMDF
         wQrQhWBwAsVpwehRg87s3OytX+w3q4UO4Mg/RqarSJiek3HcCTybTbN1MUVU7U9MPH0Y
         j4LM6QOQJ2fon9oYbyET0QKepWSbEdcyUg4GqgW2u6IgUdEPpmHEGgTbAwBJtOADFhiP
         8gELbsXqU5jgOMconVedPRLRg8iB23pkkOpvpJFpiLAy1pCONqGvjkLpDymmElWQ2o1B
         OHkrpul8T1d6mOZt1PX0D1lpDplJkfXW9vJPAVSUGBvoVhsNQt8TliOkGCn1D69SAm6c
         OV7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rok+KyKr4FOpT2K2eYJRwYwMojEKJ5tcp9wQuIgNs9k6ScejLllcGTaa+ki91+l7B51UnL2yd0YSVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPmar25fGDU/ttWE7CbN/SUE7qTFhlyakjkb283YR5MdZ54wrZ
	rNipq1O6FHnKlbeZ0iJN6tucdPNg8+rbVHul4q4DDshZqD+/xbd97YwNof8LxYOaUwasx09rcwC
	q/EVLlvDiD5aAZgxV/MYoLoC9rx4UyMGUX7yV39ui5qatqzlLpS3Lga3/dQ+2lFw=
X-Gm-Gg: AR+sD11ZJbji7Y0rgs3QIobbYSaZELQs/V9ac0hBJvNtikhF6e2E9CBX3lMtVr1ArLn
	ZI9p8kkJu2rW8etl4xnNGaDD/sDsvcyrwp6w5XDaAyKXeH7iSBVFb0UHKsZL8Pj/hnO4fJ2Xrcj
	5jcwuuoiUOlu+QRSXEaXGm36e5Wj4E8nAdXdkLUNM/XHbkM7Z8gjWdMiqTmNaLGLMYSny47vHj6
	MN7jqplbo68ZcAp8UWvlx1GIeT5Ct5Nzh7Delw5Xck5R7d8DuC1973puR1eN06hLgbH6fWjrJG8
	OHXddkzkNWdJb9TSH3gMASsuKIE17/UhT9MFDoo5nQ7j/Dt5KTZOwy3s1EEtbychjGU6EGQguKe
	YZ005yAj506JEhY9x2Xwb0oYP
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591419137.0.1787158123457;
        Wed, 19 Aug 2026 09:48:43 -0700 (PDT)
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591403137.0.1787158123083;
        Wed, 19 Aug 2026 09:48:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:42 -0700 (PDT)
Message-ID: <266ea420-0c08-4642-ba74-44b0886e9112@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] arm64: dts: qcom: talos: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-16-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-16-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l1SQb-gBOdv_zu2heiwqGBoQwUzRMOYr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX0lBEQswZPhGL
 gOJgLalbZKcMlNXPy+E5hWVPQx7Nlwyyw2liJce42+wEhXemGzinTLOh1i8uZk5M4kM6W94AK5O
 xjPGX90i7Xg50uqYaRsbNyiEmvtmIBA=
X-Proofpoint-ORIG-GUID: l1SQb-gBOdv_zu2heiwqGBoQwUzRMOYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX9aXwRKcWZBzc
 +0KGJwhK3RAYqHHwRgK2ESNAUnzaHctW/YBCiXH4ij7crHkDA0Sll57sbarWD7Og+jnnotI+K81
 6fwGj8BuAsF2lWz61QorXhnWDyD82r4qAgT7SZuKFYP79rtE4XmA0DWJWZYBtBD2QrYgtIazHLk
 TqK/LL0+Nq81Jo25Z4bhOyrzDmKqWlEIqWlp9znoQf/imR4b7iQglLvxE5s6j/AwxYhYhH/rpB0
 K9Fe31HONzR76ds46TyjEXoL2VvVR4QvIChViu69xVh9F9hNT11FaPdNWvRCbVftaOpzVIZA+ts
 kSiYhoCu9aNwT+gl9jIuMr5bwuxkcrUANj4nZQgsPYI/xc0SzPG25wqfOXgBBHuaTJ3MaYvbo2r
 uV8PxrO9cmeA/Vt//I7o+FZ5aaxiC4Gwg/zqtQS8uAfBVOB7QokNkMuX+dQ4mDwRxcT8oy5qE5M
 Sb5rJco2SNSS2sgbYVw==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a85de6c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 8/19/26 2:52 PM, Abel Vesa wrote:
> The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
