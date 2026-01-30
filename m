Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827B33ADAE
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769766232; cv=none; b=osCOq5t1oQMpizOIgz6kd7h8cMfA9fp6hUPBV4+1h3qsapqbYOGcAnp2GXHvjRNhZ8LZHUfhve3YuESMPGS/QZFmIZ2A0ej5fj7wyhx/AsWUvfpZW0Lu4c0vd2hpWhB76Ej3e4Anawk1E6x1FSSMni7oBCK8WfQATfKt5P0SZ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769766232; c=relaxed/simple;
	bh=8nBohHh4B1JistrSLUe+ybhsXh3+QyKVS/BB/3QK+1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HF4lRe/YeeejIcAEg5wh8pn5Y5C8qitvRWAdvTaILDB24gbS03uhVY4B2hDOgFpJh7NpTEv6V0PXGxT+/+iI4yefueWL4CAs/yaaWRPxUUlu8yLLtrX4qbdP680YuXw8LQQtMe6ksDTL60Pkax7/phdi3HYZewh8yuCzUg5dNjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVkpAs+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7s7u6mc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVkpAs+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7s7u6mc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7GoSB2419200
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 09:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arNaou7UElK3kr0918LpPz/GUPVT1/KgI0TILUNW3OE=; b=oVkpAs+t0jSfRhlT
	n5AbivMEM7GFy3AQeh1owMxN7LAa13TkjHYD80Ruj72TVPHc5Q3WLzH0Ed6zTXOm
	Mr9xN51lkvtbnmRjgO3fvlJ6Lv06W7FQDKTC0G9wROOGEHPnHRHfk8IyfCB/zfxZ
	+gCAf5E4ly0r3ka+NWJYq3/BIQW/BrXhZ3OGm3yxPvzu9SJlEcYgaQinqLfI5Rpg
	RyvDEMn5bKrOlordtihxAIN2igQCe4FoKyHiaOON4p1f+Jn5V6BaHp5GF4XOAcLh
	iPds9OyBj21HarL2SIrmgX45NvnEwpAgepgmIwaruBFyoys5sW3adxdyOymJ6KKG
	0Kkwzw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41gek6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 09:43:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88fd7ddba3fso1729016d6.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 01:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769766228; x=1770371028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=arNaou7UElK3kr0918LpPz/GUPVT1/KgI0TILUNW3OE=;
        b=e7s7u6mckBzUXVWb69M/5Ecy5u0K6DEc7l/FsuSLDwTos4FVZggaE/4toW08qpeHa9
         F18ujmmLw0sU3WnivvrbYVhrl8/inrxohspzzMELXLTPdL7BXC6MS3qmz8Fq1vJ0Vb7S
         2OLpnfV/lEzCq6h54H983+G5w8C3eVOl4eJ7QBkYDBbHQv3WiQapyCHmzt55sMumeNnS
         nrHPR1f3dBGG+Se6q6M2fJO3YI27ephhHuK+2GMibcSCqJj0QCs1N62K8ptYYV3OfR5I
         NQV3qwv949K832ChjDtTIHnV/gz/iSxs+KIEOUXr5oB4wkGyZuWFQ9agfataiV5SMqFh
         sxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769766228; x=1770371028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arNaou7UElK3kr0918LpPz/GUPVT1/KgI0TILUNW3OE=;
        b=Aho6hl4r2eDuod6z7hC+L3Be53O9/WMXdJxRBsM7SOaRCoTd0ZKhhOeomafHKiBV+0
         L//GdIShdwmZ4p6Ey8f3prCO0Qmc9lPcZ9xVPi2aIEYLA1iKSzlvJCoQwyeU/7ieVbkt
         ol90I4WRge5rmjrT4Kb6XkJ0MLFEJxZMHMNRvimfwpKB5ZXqhd6aXNKyDi1thJhjgetB
         OsODQKT27BEvkX4vkAoXjnndVLJCVJu6hGL4Q8QkZdkXj2QzGIvP96nMjtyRVfpvkYw8
         OSChi/+7dEtwhqV0ttmlZpCNnws/yDQa0+iRVbXQVnvjWK9QGeX75jooMzKvzA1h0Kyi
         QOXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWszjrcSg8W/VdJqjTTjaHypLDxrDB7Fe/Djs+QifsTf4DTdxWC6+dC7P4NE6W4nTSoVvQsAMWSk2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCcsYLFmSDlht3EB4q7CyRLGmJ6V1YSUmCI0W66hrkdWkbVzvm
	fAAnDgXiz/KZJt3tq6aS7W5PckmRoe5MemDZMSRAaitv13Y5VtYViK/g/xFEGtfWdYwSu3r/7py
	ZcChmedQ/L9vNSBE7yqXgWTVxC3rwvArA3BbFpkbDTA1ScRbNGkoubLIUk95QLgk=
X-Gm-Gg: AZuq6aI/aCsmiIK9jPDY223q6028KZ+WKvhtnQ1vR0Spant1TC1M1Y94oAq9DqBsyhW
	s9e53BLv4JD+KNHRatwuGdSKssWJkse/GxH8V2ZnH02fWnza+kYWAb5rlgr1udd+6jvCap/nvgg
	KhhfSuGt/qppJBolccur1csirXDwGGkydgkNSyiq+/5xCM1Mhn7WeO2otH74rdWDPS8qf4xaROi
	R/LpUQ4OcgkjnE89Ih4nfSwwt8OPhbKKHgmsNtUddZheNHpuxoDqbtFlEHRiHKvuymPaDy/gyw1
	/U4MXmd4OXzz5bRHILV1e7lp76I98XUgWCeUs+3GylUdizEarc52IA3ZehtOhYuLyQkrDm+wvc/
	MWOf0bw1k4hgRcNiYq9O8GEHEEalHgUBnwDhx8WWBRbCmsgpo5zxKAWgyKISHeMiCXeQ=
X-Received: by 2002:a05:6214:8086:b0:894:de0a:4cf1 with SMTP id 6a1803df08f44-894ea18f0b8mr21353666d6.8.1769766227872;
        Fri, 30 Jan 2026 01:43:47 -0800 (PST)
X-Received: by 2002:a05:6214:8086:b0:894:de0a:4cf1 with SMTP id 6a1803df08f44-894ea18f0b8mr21353466d6.8.1769766227455;
        Fri, 30 Jan 2026 01:43:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b42563dbsm4094058a12.3.2026.01.30.01.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:43:46 -0800 (PST)
Message-ID: <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:43:44 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p47cSiF6YO05ccqSkAzREcuugGKBGTV5
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697c7d54 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AKt-FI4Am6_hGqfKY9QA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: p47cSiF6YO05ccqSkAzREcuugGKBGTV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NSBTYWx0ZWRfX6TEwGqJFGKFt
 Tzyb8PhT8gLVuRB9NNTbO/IKJ2OkfuT+WBxhorZYeXu618BwoHZG1Gx+zq/F1ai0OhDy/aWmyZl
 FTErO5DOfNo3AIcv2EuH5tvSaKUpHthCgvJLJPmZdHQLGSeTILgAVUGByd00h8Lyyj855xHPE6s
 +KmcDq1jyeX5PMsAY/0Ejgi4RBaZfVKlICoy0Qfc04vnuVHVwXYojGVWVX3gnzfuUOa+gfxkicp
 YVBroxS8ZiQJoUIV305nOBKxAwl9RA9T6N7ftJTIyDZO+liX98+ewoop/nr1o2Lx2WqjC+9yjHo
 fPR6q4s4HcIRonAaiWHV5H7YE5pfHaJlmkyonMAil6GQw/RaD2UXXncbVkk+YChWZQYz/UAH0g0
 Io/Tauvsmvc9E2JBhvqmEwQZhd/pYobr3J+Iu/my93k8tHVzc/WMuu+qH435r737dGclQ4/rA2t
 hscpphwEOxaPi7nzI4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300075

On 1/28/26 3:10 PM, Abel Vesa wrote:
> On 26-01-28 11:34:49, Konrad Dybcio wrote:
>> On 1/27/26 4:03 PM, Abel Vesa wrote:
>>> Add the TCSR clock controller that provides the refclks on Eliza
>>> platform for PCIe, USB and UFS subsystems.
>>>
>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
>>> @@ -0,0 +1,144 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
>>> +
>>> +#include "clk-branch.h"
>>> +#include "clk-regmap.h"
>>> +#include "common.h"
>>> +
>>> +enum {
>>> +	DT_BI_TCXO_PAD,
>>> +};
>>> +
>>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
>>> +	.halt_reg = 0x0,
>>
>> These regs certainly aren't at +0x0 to what we normally expect to
>> be the start of the TCSR node
> 
> They are if we add the TCSR node with reg range starting at 0x1fbf000.

"if we take the wrong base, the wrong offset is right" ;)

The docs for Eliza don't have the nice separation like on e.g. Hamoa,
but 0x01fc0000 is what we generally agreed upon to be "tcsr".

The registers that first appear in that region are the same as on Hamoa,
and so is the address, so let's continue that tradition

Konrad
