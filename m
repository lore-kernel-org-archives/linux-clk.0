Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79118346E5A
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833534; cv=none; b=mCMa2mbLJ41FcqvBBaFJ0NxRIhBNeycctDQcNZuOsl3gumUz3N4jS4Xm2WasdYUKdM9FtB2FwsZXs0Wyx1dQXXW3juJregwmbzjVoZMrKeYOyxrQCIJJ/oZTMCjNqyNZY0ZDjDtUfo8rk4740FolPYIcyqX4bB8r3MOhSzd3jZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833534; c=relaxed/simple;
	bh=an9ITnwrG9sn7ZcZp+JlDtwA+d8Em/2aPRzVbZaB2ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxv+x8oRgHo0HzJimsx7HwVzhLKzSs2cDoizkl6BoMms88/xcBIJir3yj2g3FecwjAMeIHHhDTxe3HwdweaOpEEBJ3fpB4mrX/zIjmgYY9uXcXkuNxaYoK9vu5S86zJ8q46QlnDFqVhPbX0vcnOJx3EmvmP8Lj/ySJtAOEqX8MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMOTsQTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/QwAdva; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMOTsQTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/QwAdva"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8WXWb1050235
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fuO/S36hrHNVPfroMptKib3Y+eWWyQsCXUkLO35Maw=; b=cMOTsQTzkzS3h20U
	M3AJaE5yQ5OT/qFrXiGhnOUGcg6c8bdqaf7J4bfXfjTzyuNIph75i8oVttv3q5yf
	MW55fVTvt6uhaTzrAioo+E4lvctHbCI2sQMGFgN5RZacQfT0GthQMGLes7PI9mzx
	DjbB4fBw/4uCWn5ltCHx/QRBZBd7uknWidsi4M6xu2sIpx9WYZFLi3Toi8PA4BT7
	PL+7xnbEQFE2wMlhfVuVh3c8t9N8FOylioeEU7lFYp76TOPmqDidS1JrS9LzT94n
	m8eE6JQ7xTU46COMq7T/DLXnks9/yKkINbHx5+v1zoP8x2ln+ZfkScEp9ZLcc87q
	bQWvMw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ej9mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:32:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffc46c792cso1777554137.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833531; x=1774438331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fuO/S36hrHNVPfroMptKib3Y+eWWyQsCXUkLO35Maw=;
        b=P/QwAdvat4t4mAw/oqhF/cro2ZkrU2HJiBQbvNXyqgUjg7jsVfWb+wviz0HHPhF5hx
         facnDUa2I5XNB7lUtKLKErlQOCqAbkYGmhMdq57R29HyyLcafcOm1ndn4gFVUoD0AXs3
         vvcjys7gPu3L8KkhsFP8NOwQPxJ2IJYV1JsrccnIBgjhsvoyIVcVRoVwO+aopd7PHu01
         lIat41N92yT3POP5jgXxSyx5p7bzCAUdzfeZ7xE85OWuyEt9Rte5XqE8cFsXfQRHdTMF
         G+268Uc3XSwB+P7SnP1DFBS2GlXRFfrS0FRFYPcCglQCUv9EV3d4rFWuhF62PLe4iVWE
         q72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833531; x=1774438331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fuO/S36hrHNVPfroMptKib3Y+eWWyQsCXUkLO35Maw=;
        b=awMARcEW9e4PAOeRVVPBWOdXGhpgfb0XQE2osIZ7FXXLz5alHUjDV+BLf40fiLHI99
         x1UrSuSwkPj9FcDiLNhVqu8aV+Cu0T/kVmVlYCmbxoHJFZ3vAY+DKOgVQGat6ZBxGaA5
         BR8yKtS259o604Zxui/5xNnmhGyK4YaoMnYLKWygIXZxtlf5bKXX4G3veR3jqnd7XwSR
         KsDh8muhdMdIQX0tu6Gy7bGy/s4GPtdN+CTzsZjPkTattQqSi7FRvC4Q79o+coiY1Y7V
         Ib6/MMQeZljbsSp+nxXLA+kKil8M84FFtSw7nYzl0+ZdebhiaLkkrjgrHGonkULgcVx5
         gbqA==
X-Forwarded-Encrypted: i=1; AJvYcCXjLkZWbX7JmGYdUgOa41RCZ2vEsDX0+3cb9mGYg7G09BbtSmLUnIXBIKAVylm38NR7/v4Ra11zLdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YysIaghGqebnKFUAqL7a046K/QfSv+T0h2aSK2g6fJiA2LEFZXw
	TKdaXWFQaSAtLQpVmrw988PAx79kiTKgqpUxFZnwdXb8Gw2UT7eFWPxBOJh/NijFTR8rkPZfJs9
	ebEQvr968UlEVon5SVjBw6dwBQA8LinQCwoQy9wodfdOEeZyKR2UBm/JMBb1DSpw=
X-Gm-Gg: ATEYQzz7bODqsh01AVWe4e1XPYIWkdjaoHE1QGKHvvFTg3Ay7hm4/S9+z150xfzzKyk
	6FWWFrgmkgQyoKpUbyMGCwLO9k+1lbSoJLrCnWpOLmsDv1BTfeG2d7pkuyjPJ7wFlQZvnEQKR5b
	cRsr8jBPzPz/bE5pG2+hbv9e1A6RYZLnNR+N57+fWLcoaysgk1eCO95dkrzQ8wghk6LuLWiVsYd
	BwcJhzkCcU3Gu3hjDywAQmexrA6xF6KgtIKM93fF1qcE5UysVGdeyPPPp2lj4ImgE5bUqUng2G7
	xO+E4JW3F6GzMb2g6uy/h/VBDiS2xGrRoIG4Bp6JxHJ/Gc7mx0WN4EMK1Jt7lfCROCkcMsY2hV6
	VJ9qAgkgsyL1ijnSe3ky63ZpAe4C+RFtR2xM7TW2g/ylW0RmId4cZPfTVPAserXlDO2QptG9ryj
	Ce7E8=
X-Received: by 2002:a05:6102:b0f:b0:602:77d7:938c with SMTP id ada2fe7eead31-6027d4b977cmr674955137.7.1773833530822;
        Wed, 18 Mar 2026 04:32:10 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:602:77d7:938c with SMTP id ada2fe7eead31-6027d4b977cmr674944137.7.1773833530389;
        Wed, 18 Mar 2026 04:32:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f170659asm185160666b.54.2026.03.18.04.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:32:09 -0700 (PDT)
Message-ID: <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:32:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
 <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba8d3b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2QFKZ8CVrmOv300_2-IA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NyBTYWx0ZWRfX3fnRdY35XuyW
 baF/b1R7meSQqcLy3qQoTMl1seWW5oZ75huV/yUCa+j3xPo5IgeQuyA/zVMzCI60Ym/KSX+aJdV
 gV7blbYyYiMZS2Z2U/Xjz0TQuL9H2woWsBtqYTrRtCjlgqPlhOeIcnExKifYOaseHwUHb9KGDeM
 LwZ1gcawHGmesscqnUDeeMy9aOEIk+Y9P9eli6Khrd9tgWky9cCrTSXqfrxKE9CXo6rGSILhrc1
 iRdIhRu3XuEK9KdLjyy7kCULIw7SEEUKCro/mwjtbO1bPKQn6mudlptjn8x/6XnJEGAZvR/lGIr
 +2MPznnEj/CMDrl2ydxKGSusEjIkJ5SptmCri4tGl6ceDRsBd/M470y71d1eBGAHsh42Idi+Qz9
 NwvgtbALCnGjHgW+2SYNJ2AWIVFmF0xhCN5Q94LkXyg9lnx0cD5Lt7nW8/PI4fRuKeMKkszCmzk
 vg0hfIWgDSNCkXC5/yQ==
X-Proofpoint-GUID: 25E2B2hXbKHdLadIdg872k2Z992gAv8h
X-Proofpoint-ORIG-GUID: 25E2B2hXbKHdLadIdg872k2Z992gAv8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180097

On 3/18/26 12:13 PM, Krzysztof Kozlowski wrote:
> On 18/03/2026 11:48, Konrad Dybcio wrote:
>> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
>>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
>>> which is copied from SM8750 driver plus changes:
>>>
>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>>> 2. Eight new HDMI clocks,
>>> 3. Different PLLs (lucid and pongo).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2023-2024, Linaro Ltd.
>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>
>> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> That's the copyright I found in the downstream code I used in few places
> here (with modifications) and I am not touching them. I also don't care
> about these and I am surprised this keeps popping in community review...

You may not care, but our legal department does..

> This was in original v1 and you did not object there.

I didn't notice it then.

Konrad
