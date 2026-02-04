Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25AD389459
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208623; cv=none; b=YBaNpa9NxEyw6TOUkYXS3EVC+L62i5o3c7eiZtDQtLTYFvKGBMtcMMYo9/yuqqvVdD0evxoosQzqRHJmrfgmp9Xxb7kHxM9sFAlj6Uv7xy7k/Z+CqnZuYrXoefsh4Q3O/13rlBDF8VrCZ6ljnXI6H7hlVNm6r1Plu14u/Sw5xro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208623; c=relaxed/simple;
	bh=LdXn/ryfUxJn/hgBuHb2D5P5T9VDAAJqgeMs+x9jEvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMHdc4ytbmAboUlZXEThyJZuJTzTYHOJignGSRmf3lOtnikkb/tD0uRU6SjHkBSCre4IJfSeFVDBsmpGKbSRqhVV2BBIUg/R3Co2FSq8TiuwLG40jJzbcpS4emepppQEPJwomoG8lMvXsAzfbm0nQSkEfL2e8AGePsa4ThlkZ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyAfHi4l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GteXBl1t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyAfHi4l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GteXBl1t"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIaIO675154
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmH2kIaFd/5FB5Li3TKThg1PLznVXCqpdEh7SV1yDN4=; b=fyAfHi4lXEQht5nb
	OWsmdXBmmM9+cOI8bHvPQvkt92XmLclC4Qo+ao1iBv/9wapPp/YRoDM29upLsmmz
	cz3UcIpEDf6pRrfaXgnX9BYl8oPF5tLIaOyNbqH3kXlfnFOLuRrPuqd5bXvCW8f0
	NHE/ZPdauz4jEHrtJNk4OGaU/sj/isFTnPT8TPTs4+l0FF9FOWhVEE2fnMc5Vmae
	HyLrD45BAxuywv6Xulj6+YM4ZhOHmSpfFI/JMOx4qh1RWPHeSiSZUd/7VzzCuyE2
	mDvfgzTeTH75gRu8ilu5ZXlJxRiye+gxVHxS26GykPFtVVsJ1TWXmhMJRl/ctJYB
	uynu1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07mavt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 12:37:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6d6b0f193so126663885a.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770208621; x=1770813421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmH2kIaFd/5FB5Li3TKThg1PLznVXCqpdEh7SV1yDN4=;
        b=GteXBl1t9ljMZMFiQTIoGtEed21J/eF/2nCIB6ZuSt8aBa+pYIpp5k5ns7qUNBvkcS
         MkdlTXcW2+3Q5lXTIfUi1UTKeQDM4HZzBldsy0DVXiCu4UjwV1ooACbvZoMS0kJQef7I
         vbV2p39ydeujXBikuMxIDLPfDUfzRgT6oMSEvvwCcy5hZMVgbRWjEqLJZNAjIOh7NzAa
         L8IACPuysPMI4oZpcI74B51BDeSDfmUZfapiz2yQOjgsncIFBQ6YBIjBIIBXOhrBxaPP
         pq2O1ph6RRXmi43cksQgnbCkrPg133bLW6cO/Qz94tVkG7r3PC3ZEEcoIM4kCBdX8sl5
         5GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208621; x=1770813421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmH2kIaFd/5FB5Li3TKThg1PLznVXCqpdEh7SV1yDN4=;
        b=dnlJJCjsLUDx9XFgkp+W7J+JgB4kz06N2pt5Uu9ORJwh1QUbNFMz2S6BuD/PzDwbaD
         2D0a+QXysjS50REUmvDud3NTzJaSZDJep/8X4BwGS9ouc8I51KcUxWk6Z6Axh+BUTZtv
         d/KOU2qEq8ZduB7qhyx1GD46d5n2QGcgNchc3/zS9h7F6RRyGsbpsWrfd3H5aqcpG3pH
         cCV+FtZUkznOjJlxHZ33Dbuzsg8cjQ9TfXNBMeL1fuYw6A41neS+zGxQCNK48Ubujgou
         2m/RlDqFADZQH14QsBAOsEPOwE1R/CrpJYICa2wld1+uUzJzVMw2qyvQL543E4q6iBRK
         vlGw==
X-Forwarded-Encrypted: i=1; AJvYcCXnu61BZr/J+uPRVoKZWg9t7jO8BSaP3MPRn+42Lg2a/5xTk5lM7A5/XXuDvYa4MiXMevOcl0Za/lU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSn3nr3pYFoXIDqjN3QdhqOr2NsSUP1dgEtT0wNSjeW5enA+1/
	iSCcHmpnytJG/Ojwc5BKYrZnO0aQ2W61rvkMt0fW4t4Ty+1RrloiifX81FcmYZnYZGVPGVlklgX
	BVWgVOMrikvnzU+T4vbhvIHdnjFRsLRTajRopIb7puFqBrPGbPr3TNRu30ZH1QHw=
X-Gm-Gg: AZuq6aJcfdyRKm8lkGmbHbyzJ5Sn/wikOzvMJxo5hWNedpYXa77v8qmDrg81fKG6Y5r
	kssOTue9Gv9IPwG7G5/w2rNXtuPndTihx/dGVG6IXN6JLAQF2zidt16kymJkIjs9gktmQIs0XXt
	dpEsYrKfmqyT4387Swer0vGpgdAdABw1RBZtxnYZ0AcUv+rgY8HW2c+NBjbxb6hfMZqqz9cd2Af
	DrOSGcgK1jO4oc8zg/IErzJRoGp4uBR+d1ObgHlfLuoTC3fZfTnaANYufomjCa5bhlyr1vZcOUR
	RcWmxHIRLB5he/D2DCJfEZoOPVSMjB1ZqkFUZIK5LUnLj52ddLNYvkBOkjcYB1BZ7z40aGadx80
	mdBPWACFfrI/yzZwFLmwJ4yIbxu6Gsl8hPDBaduD8DyA2z0nprbJjk0yxHUfcQVk6FE4=
X-Received: by 2002:a05:620a:3943:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8ca2f822612mr286642485a.2.1770208621032;
        Wed, 04 Feb 2026 04:37:01 -0800 (PST)
X-Received: by 2002:a05:620a:3943:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8ca2f822612mr286639385a.2.1770208620588;
        Wed, 04 Feb 2026 04:37:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea004380fsm116359866b.55.2026.02.04.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:36:59 -0800 (PST)
Message-ID: <2abe345c-ba9c-492c-8684-0d7f4e6b8c0e@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 13:36:57 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das
 <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
 <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
 <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5NSBTYWx0ZWRfX82pyyP+JOhg6
 GVXtMIn7mCZjLIReC0b2l64L/MozH1k4qHJT2ICRwh3j9nu4DsXyjyN6f2Ea17OKsRBCYGBpRU/
 y2HEAGAbBhmDjuNsZAPv9uocFgZOEFWn/rjSlYLasMoCDGjJbj23yOfPH2TueJ5a5s5P5yHn3WU
 FShOa2UZzVFUOrL9x0u4TS1SqA4OTbE/6aV6V/w0dHqBvB8HEYoGVOwUGOMwKra+lcMna9ZR/7E
 aZRUmR4ZaUrjhEdURpkMSWVcNjLbSr56KThfTmXF5S7KbXC8X4Ib/GxZZ6BbluEmnbj5lSvlTuP
 dQo8dzQDZxhH0mwftwitLjgTB0VQRnV5gNKdpChpJvkeRPjiIgxPsCuRk3qVi8k9ATITlRZRiHa
 GPa0YjWuFw9BwcV+4e+DG9D9T75P9GuzFLAmJ1AgQgq7wuXrobSdGibjYBymAEMA79DdvzMKU+F
 omkZonq2BfCpRs9f9Sg==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=69833d6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Bqp_KdbJKO3R4PKeuYUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: C9lLk9HFSFJ3qAMadaIt8oq5PdEWup3u
X-Proofpoint-GUID: C9lLk9HFSFJ3qAMadaIt8oq5PdEWup3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040095

On 2/2/26 9:53 PM, Abel Vesa wrote:
> On 26-01-30 22:40:32, Abel Vesa wrote:
>> On 26-01-30 10:43:44, Konrad Dybcio wrote:
>>> On 1/28/26 3:10 PM, Abel Vesa wrote:
>>>> On 26-01-28 11:34:49, Konrad Dybcio wrote:
>>>>> On 1/27/26 4:03 PM, Abel Vesa wrote:
>>>>>> Add the TCSR clock controller that provides the refclks on Eliza
>>>>>> platform for PCIe, USB and UFS subsystems.
>>>>>>
>>>>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
>>>>>> @@ -0,0 +1,144 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/clk-provider.h>
>>>>>> +#include <linux/mod_devicetable.h>
>>>>>> +#include <linux/module.h>
>>>>>> +#include <linux/of.h>
>>>>>> +#include <linux/platform_device.h>
>>>>>> +#include <linux/regmap.h>
>>>>>> +
>>>>>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
>>>>>> +
>>>>>> +#include "clk-branch.h"
>>>>>> +#include "clk-regmap.h"
>>>>>> +#include "common.h"
>>>>>> +
>>>>>> +enum {
>>>>>> +	DT_BI_TCXO_PAD,
>>>>>> +};
>>>>>> +
>>>>>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
>>>>>> +	.halt_reg = 0x0,
>>>>>
>>>>> These regs certainly aren't at +0x0 to what we normally expect to
>>>>> be the start of the TCSR node
>>>>
>>>> They are if we add the TCSR node with reg range starting at 0x1fbf000.
>>>
>>> "if we take the wrong base, the wrong offset is right" ;)
>>>
>>> The docs for Eliza don't have the nice separation like on e.g. Hamoa,
>>> but 0x01fc0000 is what we generally agreed upon to be "tcsr".
>>>
>>> The registers that first appear in that region are the same as on Hamoa,
>>> and so is the address, so let's continue that tradition
> 
> Actually, the 0x1fbf000 is the right base address.

Actually, I think it's 0x1fb_2000 ;)

> TCSR mutex starts at 0x1f40000, and everything between 0x1fb2000 and 0xfbf000
> doesn't really look like they belong in a clock controller.

Correct, and that's because TCSR is not a clock controller.

Konrad
