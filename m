Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1781F2E62BF
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823520; cv=none; b=KjIS0Bn56ykGNNHpMXO0iWpft9+TSTBW6ep4QK4oayCPZDefisM5xZVpGFn+iiP485Vp+xzsAwoNWAj0a0gmzskR+Mw5N3R0JzO27uaR0dOEZYI2XVaJF5dvEzCbQqZCn7MGPTmkULqA6qH+FTs5BQKpDV1XDtWIwBOmazilovI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823520; c=relaxed/simple;
	bh=WiPNgNnihh2S+/7TTHFaJMjiKhGGv6OSW5UWdjeBRiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxPsCHzEU7nVx7Hxq5Bv0BCDaiFIimFr48LiJsa/l3NtrUlwk36AMvzspozbByfeav7zE+HrFeCIbUpgUwogDqxONheJR8+CP2OjgkQeNkQA9dm4mzTGyQzoCA+TeSP0mDQVc+f6H39rWHUHqq4Sj22NMK+3sFN9o13rtxxLnEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DihtPqmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DihtPqmI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D94Rr6027178
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 14:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=; b=DihtPqmIpiFvuGhA
	StkWJqw1wzFY7E9AxU9jY/rNqYKAa/Q710ybRmEMn0gOAE2A0DfLnM480/j6KwYs
	kR4prcYBOTBKM7Py2RvPZFszqlcxpnHUS55o4pvSsW3zJttlPB1OseSN/e8tGLCd
	7Q85dAKVtqzsWgDsW3dzjKTH6pK0ZijRB5/75VcKnu8tunbXXK+HDg3tY/NJbwcH
	lVuzpMUm+4zo6/vljkgAgWKlaPk0N1g/Og+AO3xsohl9DWNjg34loiE0jjl5VtI1
	623rG3pHXJXqsxYFkWUPhP6lQwT92Szg6SW1lY9iV6bSvwntZrbOuMSUdUbZ1mKG
	LQjtsg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvkmgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 14:05:18 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-87ece990f52so1550594241.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823515; x=1750428315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=;
        b=V5VUA2and88b1YR3sn3pkWgULLjq+L6K5PeJz/o88KtCH2gYzKdT5wySozyD4n0TMs
         9h6Lf7h9G0AWDUG9Tj72hRNMs160ksQbcb6VC/0FiWAYkiiKrBCZYemYiJWKkgBpAHBs
         25ia6Q++1YxoegsUT8rTdVo2rH1azn3zJhQeW7kC5IC/pgPcWrbr6sOYgntlGKHn+Wud
         3rI/WIelsmNUEbbq368d53yNeRwfv240nIrGfcx3JWTrcse6PqTcqF00XRu1IR2t2u4R
         RFKNbteqs5+OPPRG2zOrZlTyyG8NXzYYaGEpBsI2aKGoeX+VIacsynRlATI3td9gGEQm
         JDLg==
X-Forwarded-Encrypted: i=1; AJvYcCUSuQgQdBYQorVMJSdqtoLNissqwzvp76A7tos5FkvSfHEGSID7GGFzThm0xnfpBSTthO80D10IDiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUmAmC1NXh9b0SMkfgbuHohMaaZwsVLsv85nP2XZC0duRPFL2m
	3A5vBvt/60xvpoQZXMDYTlqg4F3vOPE9Ab/xAtZp32WcYp3yPafEDcTpNOGP2He/Z7DInAEspP/
	kvMfNHpCnrdKIuXqRsEwklSh1dGW4CiRyVAGc+igkONssieh9fml2tAP+bmJXCtoV7R6f2TE=
X-Gm-Gg: ASbGnctObrDQED97qprsg3vv91Bv144ebYv0w30HN89WJo7/GWMXvTAzgEXDZvCOXbY
	e1lNmsqU7rlDavqajcfXTcxkhYbgJnv0ksOUdxFHnZKnllhPoyHvPJUBFjZ/tDyAYIw9Z9gcv7o
	OQKmoIJ6rlRWH5fqZsLUAjmvMLms/48B/OJ6/HlSmUlopeZq9BtvqVwwG2V+G+EhBfxgNCXk0ME
	GPFrjipc1yNuWFt4UZeuzLebPXkV/8OwCstmHPhqfMopaqdxrlqqlc8MsakzB79DxjzjUg0EueY
	gJOB791+a6ZtilUChp5b2XvagUUJfcc4/PFWyrTICz6wSd20UBvsoGCK9qYHLuI+9ibQO1U=
X-Received: by 2002:a05:6102:c0d:b0:4e5:a93b:1d8e with SMTP id ada2fe7eead31-4e7e3a09f88mr2188308137.21.1749823502765;
        Fri, 13 Jun 2025 07:05:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAabxiuRoQe/YqtbK2biWXOJsRJMOrPMmyOlfhlU9BuJsNPdIIiFtgHaougk+e0AABz+4dYg==
X-Received: by 2002:a05:6102:3ed4:b0:4e7:b8ca:e3bc with SMTP id ada2fe7eead31-4e7e39d8cbamr2083763137.17.1749823491378;
        Fri, 13 Jun 2025 07:04:51 -0700 (PDT)
Received: from [10.161.140.61] (87-95-85-22.bb.dnainternet.fi. [87.95.85.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac120167sm456434e87.20.2025.06.13.07.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:04:50 -0700 (PDT)
Message-ID: <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 17:04:47 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bv4lHMO5jiAh9114-QCrRTKtd4Isb3m6
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684c301e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=E+pfOR1jn8a0x6QusqFK4Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=0NLLj492lcDJW-k-HvMA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: bv4lHMO5jiAh9114-QCrRTKtd4Isb3m6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX7QyNOXNfb6wG
 WUbj0AcNL/4zU3LqP/kPNda2rOHu2X2eVHsIqnWPXE9clG7KlPFcIooOu1CGkMjd5CUkqRZzy1a
 pPHxDXbTvrl4aZN6hY3DaDMweF3Mi621cADVb1rs8rbvQIsUDcaCWd8CwjGCs+ifqkwhIUZWILp
 GMXK6ibJeBme0DFTbt0N9Cy9125l35Kd2i2czgSWkkPSGYRoDj2IH+jsLkBJRI1NScqsTeKLG9R
 3gy9SsZBWPhshk2AVqAzRIwarxVMMNQr9Crj6O1EqIIYKDVOCYUZ68pxpUbDhQbFQaNseLuAbNL
 qHqlbIfRadxyOcQAJLOzQ2pfTyJR/HQTZs6akWJPXDv+F3nbsMqS+9UJU/k5KI8aV5sHCo/u/DY
 IMZjY5FIobKj40T47QouqYoR44WaOU6APa1Ql6+AG325yTrBzDk4JdfciScCl5tgsqAOjn8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=671 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103

On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>   
>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>> +	unsigned long flags;
>>>   	u32 data;
>>>   
>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>> +	--pll->pll_enable_cnt;
>>> +	if (pll->pll_enable_cnt < 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>> +					  "bug: imbalance in disabling PLL bias\n");
>>> +		return;
>>> +	} else if (pll->pll_enable_cnt > 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		return;
>>> +	} /* else: == 0 */
>>> +
>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>   	ndelay(250);
>>
>> What is this ndelay protecting? Is is to let the hardware to wind down
>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>> without any delay between them.
>>
> 
> Great question, but why do you ask me? The code was there already and
> MSM DRM drivers are not something I know and could provide context about.

Because it's you who are changing the code as you've faced the issue 
with recalc_rate.

> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
