Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB63AD536
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924915; cv=none; b=svyGWCYiCC0SGFl5cLZBF/RrvagvkCir/muaWq3s+e4FSDFQnRGvdqd5R95Pewa7syn5tQLemZJIfqr2IWfHaIjjYVuM2gz03fLzaBekZzBDsggxoIU/NxCr6uBllkV4TcoZJD+7PqnTV+i7dSK/SwGSgcMfaibyWugGnyxkHpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924915; c=relaxed/simple;
	bh=RXlQm0efLSVgfVyWZEFRztm0W8BgSdJY0Xk+PC8y7RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9Qd8BLX5PsKTPgxUiXpQxTpT4xHwtinjjxJZ9xLZE3Whts2Bwjbq9aXQA0kj40dZlHxmCNbSnFhKOuB1oaOEiS12CgyHPDw/YU/6DUEMVG4v+F4PixlKv9Gv/YjSAeiuEFiRdCuhf+fg1ctVTo3+yuO5bO9yrPD2mRI9IvIeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeFGKZvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFork7kq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeFGKZvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFork7kq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74C4D2884423
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=; b=WeFGKZvJNHRH2mpg
	CW7azge42SSmeF3rypJ0G3AlZIGINudzu3IvoLqoha94UeAKkg8SDvkgcLxVZ8X+
	YSkd7dD+aAhaExmLBbdI6KInbsv/6KTgH/CPqQRb67VYRup4osrtm13QSC9UpZEG
	QoEXKjI+Cvoci+LnBdvw9IkEdCpaEGZWl3Fetw0VAqOm8skak2ofgFwsBDUeuGix
	a1fZW3yIjUhFaK4nOc8EKYg67QJMnukjIyf5JmWAeMyB2DS+7i1ggokPdoahWd0U
	PNr4V6dcR+ALM3UzlJpUW66nxxKEwgaEx3FW6+zDqPbJPGZU2BWcTNSAmGAfNtnc
	2s/83w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyvfng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:55:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2955cc1eso4415081cf.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773924912; x=1774529712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=;
        b=GFork7kqRpoUjOHM9JiuyFQM7hnLelgiORLGR8LLTWxcbfVvX3lXblGPmUL72uU7Da
         SVsm+MyqoWxQageal8vCIP9omY0sINTDacu1q9JP9xlBsk0bVgU5H3ApvHXxWEgiIjuH
         7iXcNu7yNUAaWPL5+efAx21vbE0UDp/XX+vXyQHtYAYzf1+k1WIjeFt2o5s1ffObhhL0
         nza/94pDs1OPzR9kMJo5XKjPmsUlfIl8TsjDpjzt1wkCP2oRcS53TauP1vSNJXMbFs/H
         W6swgz4WCAjli5nlA58OgC0YHZzdYxSS9SZjEK++XEP8b0vfqW/mG13wKVcwzRrledB2
         C8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924912; x=1774529712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=;
        b=KU36gf47Lwuw261ife3HLRJheFk1vWSlB4fo2hclqwUHkVCzpYJce5HOHM51Humm8t
         kPnpy4rvcnjS6vF/GwGdU++Na4yeBBKE5py8d3aP0ISGdBtX3GlY8HUrwcf6SQ5pV4uL
         TOn31GvaLyFgIqd6F5q1XO7WAx1NSW/AJRXQHPB21I5ty3IWoTwHC3w4z/uyfAsZHbYp
         +LQzlCgLeoKrtA6xuJJ6kCJJq7HKvf1H9fgmc/8f0amVgxtBpCEilrLCuFaupJQnmgE3
         1R/w0wXrbifZzFrcVleaMGsE2FmkInZUGN90WOnrQn/MxlcQ+oZzy0YoWULk80j1xydJ
         TohA==
X-Forwarded-Encrypted: i=1; AJvYcCVGgDCap6fP+qwlRJc5nPJFp5+5hh1/mOwMxFDU2YaywPxeXMjGYnlrXbygBCYujQTLOTMDOlQHemA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGezIbGXnm0mlKU67yDzAi6+9UsY0O8M7J9E6jX/ElyBrmWqTE
	jjhXJGWPpWUY2ENNx+Q71rklPJLya8gqI6WbGEt1Y8uZLFJzwMcaYE5iAUUHyopzKHtrfXEcKOm
	nJjRCfU5RU/mxeN6pVTP0vSvGAlSksWGBWPhf/8yU/whwhGyP0M7iV4D7ML4sotQ=
X-Gm-Gg: ATEYQzww0YlJ4RZu7ivaR4b2e4L1mLpmlFuuKVyBLakgk2WMMmyCf3jPy1uQRQ3Ngup
	t7EiSht6WOaArMyAggpXRZ0h5ljpWnqtgXADmo5CbpOdrZSph6mzG6YMfmrFFI8x2apwXMoEJpB
	VBXQJgmpEYbFzdMC5D8zsDTEeYDpyK+oPr3XY8F8jkcZWN6nQkYrCSaXhLycHi7QHCDH0XsstbB
	zOfZXjM252vVfFm3KA9NatY1B7Psj6SLS5jrJNygSiqFFSVBVk8VhaGeSFMsme5rTnCfYc16dGL
	2iYOo5pvjihLm1Y5VxOMxifKjZ3U0haGUASwBKt2T3v034LzTAgzJLRJJaWgk5r8E0zdyLXZIVf
	NX9cEv0UmPQgrWldSMXLwh3mfAa3OxUGyCSBY+VyRdhUA0kPy6YhnAM84v7nuMtTZbEqzWhdzzu
	ide7U=
X-Received: by 2002:ac8:5f4c:0:b0:509:882:9e7b with SMTP id d75a77b69052e-50b148f4455mr72476051cf.8.1773924911865;
        Thu, 19 Mar 2026 05:55:11 -0700 (PDT)
X-Received: by 2002:ac8:5f4c:0:b0:509:882:9e7b with SMTP id d75a77b69052e-50b148f4455mr72475741cf.8.1773924911450;
        Thu, 19 Mar 2026 05:55:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1452214sm428778166b.27.2026.03.19.05.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:55:10 -0700 (PDT)
Message-ID: <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:55:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver for
 Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Akhil P Oommen <akhilpo@qti.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ao7mqddOMH_uvQ92XrzvHbhH3DavH1OG
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbf230 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KlJgg6mcpdonUnbyTwYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMSBTYWx0ZWRfX7WfQNlzzUIyn
 ChS5FaZheLg0/91nYTowS9K4GjH+tLevZIBocb36B8T4macly8YKDRVAGq6n1/pG22CyTnc7oRp
 99qEEq3LvS0ooq7/qPrSwvIQjLgTldOVveAWb0pRzWNLCsM7rWwAagz/5jfVyaURdACcx2IluSZ
 Yo3iZH3tDOPlIiLoUywBIr75Hf27eNsTX4RuJvQDeYMV8PEFejxqmMmm4W53jpJm5SAS0a0C1/P
 /haHiBypIxsgZn2stplfeqt1jR3gUoMEU7iqn+A9/rObJZAYggKH1VIKIegxl23nny3DxQQnYcG
 Kjred+oR4Rx+bzZq4neoJ4vYqwxAwyrNeflHNbO+L3tEMsWgwm/Ug7mhyzhnXpILPknZAJQOa8J
 ssscG7sZQ3xcmCnSiF4d3sEKrjXc8txSutSSyWoe1tVnXMnXugoSmK/6AoGq1Q2ZJHAnwsp4gSC
 cG2ReUv5UsnWdUC63zA==
X-Proofpoint-ORIG-GUID: Ao7mqddOMH_uvQ92XrzvHbhH3DavH1OG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190101

On 3/17/26 6:14 PM, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map gpu_cc_eliza_resets[] = {
> +	[GPU_CC_ACD_BCR] = { 0x939c },
> +	[GPU_CC_CB_BCR] = { 0x93e4 },
> +	[GPU_CC_CX_BCR] = { 0x910c },
> +	[GPU_CC_FAST_HUB_BCR] = { 0x9428 },
> +	[GPU_CC_FF_BCR] = { 0x94b4 },
> +	[GPU_CC_GFX3D_AON_BCR] = { 0x91dc },
> +	[GPU_CC_GMU_BCR] = { 0x9358 },
> +	[GPU_CC_GX_BCR] = { 0x9058 },
> +	[GPU_CC_RBCPR_BCR] = { 0x9224 },
> +	[GPU_CC_XO_BCR] = { 0x9000 },
> +//	[GPU_CC_FREQUENCY_LIMITER_IRQ_CLEAR] = { 0x9538 },

dead code

+Akhil is that useful?

[...]

> +static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/* Enable frequency limiter irq */
> +	regmap_clear_bits(regmap, 0x9534, BIT(0));
> +}

..sounds like it

Konrad
