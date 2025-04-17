Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F623645F
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888287; cv=none; b=FZGI4cjUM1fzUNIQc+uaYL1qeaRc39zg6l2LxHEKKJpuHBgjZHO3uWLQ0qHcgSTejdcFXpWdHWG6U0luVqaFs4gQ+/3P+MSOzdPKAwz2a+unFo1C9SkEwqySICMLDtUHJ3eHQ/Z9eHP6tPGdQpJW1HnPhSBRMNy5gizH5/HaYT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888287; c=relaxed/simple;
	bh=cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN2DNWdD+obuxvZgraKZBLdPWfthQB/WU+8k6H1pMtgDK9MUXqheA+et6TUEHdeoeez8gvvGBr8x80vrlUhApGpTFA6FmcXJSC+y+sgVs6DAjzAEhNP5xyQz6dTZrnp+R2BQBtFFiRpP2vTEtxKJybRGcRGNhElnZYxHVKhdaT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAvYzxEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAvYzxEN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lAd9009498
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 11:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=; b=JAvYzxEN2qi+MMUi
	ZC1VD7t5J625JEd9CrPq3AAkROFDv7AVAMbvQkO3obP0OSyN5T9Ucmzz5OGPg+4Z
	UXHDA1S+yX2j6xA/0Eu0PNDPmynTwngd0hpDdNMU/y1vuUHOhtdt6w+VoySpxsnl
	XAsxSHSuhnDGRC3s4lXR1skfZ6T0fHlx1QX3K0k6M7Ruw9tyAdVd9OfmpLs103UM
	IzgwJVxmKDOcVGSEZ14f2DbJljZbVF8vgrrHDkResKonzukGlYlzK55OyhK0eH91
	kfd2h57cfjtPI/KieNACUEQGSw/cy+f9j6VrolxIznyDvBMiBqTVs+H0RwTfEbrv
	/UKxcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6pr1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 11:11:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso1017636d6.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 04:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888282; x=1745493082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=;
        b=cYEslkugvPK8PedUwpd9Tvus3xDvOUXTl8DcA9kl4ZF5cVsvv/wIGQ/7gg3VZLWQu3
         IOB7qCwi1XOLTEzYmISw04ChbNia6ea3yG33/eEmVHemAoC5wdmY++xt1+Y1y0r2F+5H
         7nCGmZja8wQV4OEXt0O/bKDH1JgC/WplkzA6k0dGfk7aTuOMqz6rlI/LLjnlR9Hu4qIA
         5HejoOSgMKykutgaE8tpYinCfgoZOz8liEQ5sIQWi4rDb18a52bXC+yGYV4xqnf+26tv
         wFBqZ9uNm9A00CtCV/4E03slZzE56t1IglwRGxxFBOhBzAwL7z0EeLgeO832Qq3VySy3
         WFjA==
X-Forwarded-Encrypted: i=1; AJvYcCVpaH8iRxiUAC44ADxn9AK80ENuhOWPlaYbc+3RpWAvK9r+ZQWd5UmM5mOOz4Cc+gVFulo9rMAPFEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47OJ9CDpq1c0QGZm1aKHHEl6SK2+56QwbLjRG8ZElG/kmYQmB
	5qQie+KN5KcV8hZWb5tF/Dj2g6lpVF+gugy6KZM/8YsjtJEozIY4KaGl/YemqHg4u2zVyrsVtdp
	rhZ1D3dT9Lo0zeujnjJ02aElfteTwjwT2NC2P8FZZGg18VplukAYjcIeq6n0=
X-Gm-Gg: ASbGncs8kIthTGdBzHcMHcpxeqn/+MbxpnNg4RS4MbbYE71Ds3Rbl+ltnXhC2Z6b7ck
	dzhcBMjB9GsIpMkQK4XeeSm9Al58GF9S2DSBjOYECXv3kHszyqbCaz+phon+PZWcYfyS13YX/6L
	oBYiPsWGXULRljDeaCB5n8VOiyqi2bRyoC7qUcu+RdsH0uSd3UfBkNAqIpnmi6QB9w17iMdweg7
	BhqxkoqFwcChMzdqbFCZ23fq5Oo62Vn7jG6vke3WjjdWCT9zNLN+JzZaa8QBq+qxem8MEMU2wGh
	J6waRgZVI5vlMQMqWmAuoZlhmI4FYlMF28uAEdHu0pOfjdf7ZCnJrRNOI6SOt6TxCA==
X-Received: by 2002:a05:6214:b11:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f2c10be8bcmr1283206d6.1.1744888282057;
        Thu, 17 Apr 2025 04:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5kju+O/dWoPIE9Ybn1kg3pBvJPXA+KWO908qYET4dQsJeQp8XiEZRcojtLSXCqXemg9A1+Q==
X-Received: by 2002:a05:6214:b11:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f2c10be8bcmr1282886d6.1.1744888281656;
        Thu, 17 Apr 2025 04:11:21 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd6257bsm278243066b.13.2025.04.17.04.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:11:21 -0700 (PDT)
Message-ID: <bfc3247e-16e7-4897-bdbd-dc7d82d45fa3@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 13:11:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
 <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
 <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4vJd_F7HXf3NvQRV_G9shLgog4-l2qhp
X-Proofpoint-GUID: 4vJd_F7HXf3NvQRV_G9shLgog4-l2qhp
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=6800e1db cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=L7gxQ87vPTAOeZ-rjWYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=716 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170084

On 4/17/25 8:20 AM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-14 22:55, Konrad Dybcio wrote:
>> On 3/15/25 3:57 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>> 0xff is overly broad, please document the existing known speed bins
> There are no speedbins for 8937 gpu. 8940 have but 8940 is not scope of this series.

So it would make sense to either drop them, or fill in the actual
values here

Konrad
