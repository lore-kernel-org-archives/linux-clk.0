Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A417286402
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455894; cv=none; b=swnfTWMJJEglnxuM77iluaEgBK6V4t1XEe8m/7A91EFWTP/VO4IapgjEYrEj362zqGf/89lE1T4ud1+kjfupzFG4esUjAgCU0EnG1ea73C3GoSme6B3CDVNgr5A/KQZFBlj5cPgS5NepGJMA/QuwyKjEXcbIyPfbp7tr97zQ6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455894; c=relaxed/simple;
	bh=zJSmfRVOkbtIQDtehxlC4Tzz6O3pXqvUInfxHeMwYz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DP7xNWYbDeU8M8quMhKrDzNo7tDTkSvAPBg8Dv97ijS3RdRUHQeBQcUYRv0XpgqnD7y9Gn+d3yMf3nH6AUxm8Mlswc8ZZOP9oSdYdJHW5vpx6Er/frIzO8Pp5x5bkNMU59B5pPCSv4snWBX2Nc/DQYgSIPztgMwkJqnrQ4EsNcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ32Ag5c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ32Ag5c"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85FiB003552
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmutOEL4BSdKwbUx9oh5gSZnIUCZlQ2dXVG3r2aUCeQ=; b=cZ32Ag5cV7lQib3P
	Apx9u1mcGxt6bBzqSbyaJU9Gzh8bJvapCUVJT4mxX/ipO2HXWjLmKOqclM3rLBgq
	JzL/KP1PnzaWlE/SXFHQ/hTouO3geinjc5YywXheztw+iIRoL1nX30vRuzu2pqq0
	FboL6whzLKrKO+GQXR4YW2Aai60yGBAuN5D4/VNOb0tcYOmYE0Si4UMIf0XaRAcL
	Of0mTM54xRhryjGxhpw1uf8PpcnPhY68Nvxdkl0Zniouey/Y+R0FC7B6eUv7FZ9n
	Z8L0PlMiZLkhwZY2crPTOxge05Skp8zfewyOga7zB3Gs3GUeSH8s4Mr5Zw7/DTE0
	NSE+aA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tp5k37c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:24:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2488490fe4eso25954325ad.0
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 01:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756455891; x=1757060691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmutOEL4BSdKwbUx9oh5gSZnIUCZlQ2dXVG3r2aUCeQ=;
        b=lMadVdPyHVmDEJDqxOFDoq61Z1gh0b+zBzwjfVd3G33zfZzmC49CrKS0SAcTeKkP9F
         DGvxzrGpt72hw3KSVADA5yERXTZT+iEl2TEfnkqMPpPv29bgBiKK5dMr+ceww5zuSfxD
         B6VO7kauUBMCpWJWm3uGEIhSuUdDJ5n+8ImwNKFhk4fDgqlJfMQqM72yTb3lE9BqUdDK
         QvwkX7RxcTL4BIZ52gdNVNK6xHIUhu32T5YlaTwS9Ei3RXP1BZ2CBHS4WWly5lZIWdr0
         4MIk54rSIi+f2W3IuETcFP/MANXDT8ZtHLvuu1h9X61X4vUmyOt3SO5vQZeahputHVY6
         eQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCV8rMvhcA0b4bNHfI7LC28T4bxQgWdSdpvVj8I65g59CEnFpKIiVb4sA5/6RS7g9KA8bIebiMJNImY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQq2eOwGo+RqrFUHpoyKwXhMnE4jhAkMmgH6lJar5xFcRnNFJ+
	JiWkEYh5FqId8CSxcsdBOsZA6ATeR8TPKNCwEGvmK+UozLHVuTFJy91boG5iKOLHZR1i9G9GCTN
	Le51uaXI+2wdsJxrQa1yqchiEXPBMhfpc7qWGXD2v0E1XBwkxHHmnNyobwOe3q2Q=
X-Gm-Gg: ASbGncuwSCOd8Lcn4Y+r0gBqY9rzt+vG4hXVlPHqwTu4PvQbDf7t8/FaImhxK1zTrpQ
	DyCV4Xt8dXYnsi2dzFHwA+uS/a9jSVC2Gmg+vfpJ3gRXNL7NJ5XU1n9eWggZSyITP/03RwcQMN3
	P5eZhZ71vme9FKcK23Y8U81MKXDmukoOiQJucZfzbBa2ZDoyCEJNL7M9InHXoj9YH2D2hhxpcun
	uk7eP7BLkVnMv2nNw6XUy/eDXk2ggqZTA+cPWcr9LegAWL5mSDJLcH4IfbOG5idTjq8vOn+sQJW
	f4hPBMoCbwOjlzmOkooYhMYTlRvSednTJsEZUs7g2DXH4TJQtLIWcpBD3Hr3Ky98vfBB
X-Received: by 2002:a17:903:384f:b0:246:2b29:71c7 with SMTP id d9443c01a7336-2462ee92ef2mr364175315ad.25.1756455891390;
        Fri, 29 Aug 2025 01:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBH0NFwkkluNtoyFp/sOGVeW9GAErFZVXGcvAduDHifrpu0UX3YiAiOgtNINcHVTBJqK21Bw==
X-Received: by 2002:a17:903:384f:b0:246:2b29:71c7 with SMTP id d9443c01a7336-2462ee92ef2mr364175035ad.25.1756455890943;
        Fri, 29 Aug 2025 01:24:50 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da4d44sm17598275ad.83.2025.08.29.01.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 01:24:50 -0700 (PDT)
Message-ID: <558ca51d-e1ca-4267-9166-2b929216c43a@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 13:54:45 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add DISPCC and reset controller
 for GLYMUR SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
 <20250829-glymur-disp-clock-controllers-v1-1-0ce6fabd837c@oss.qualcomm.com>
 <hpfeihpixuauter7ik6om5sv7ocmots5gq3fw7cvn5wkuieipt@jitqslr4pkw4>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <hpfeihpixuauter7ik6om5sv7ocmots5gq3fw7cvn5wkuieipt@jitqslr4pkw4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9F90fni c=1 sm=1 tr=0 ts=68b163d4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ubyLEIH+BItvSySilgXupg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=1ut_qpqdL47trf14q9UA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NSBTYWx0ZWRfX+Y6B9YnVCQX2
 IkO98qbtJqcu+xtamt2MvCMNQ9ItQgboj0KQ/k0A3GR5Q7IKl2Q0Oq8vB6siyFNzp+u9KnIsaDr
 BhCDivXWVAH0zfil1C2k48C0LGWibbJEegl+uWXcZG+h+Z4ppGEmQ2GBE1k1JQDRcDiTaKgUH49
 63inFkZ2Vkd7aFPWXuUwPd5KdiP0zBvOl+hLnVz3KOkVZxIXOBqeCpLQZmEIxRqqs4deyhFt55p
 zXGF9xWT52o+jEHURpJefoaKKIIgfYSX4/HFFOJuowPUiIYXb1weHDxaYOzsSk+zrR24vnlzlHG
 aXNRoPNrK8NeUfyJyVybGD6XScd9wUKemu5ayACgMQp2l9z/QzNvJv3lj2zOYS0WFi/IHpqymaC
 cPlCSnzc
X-Proofpoint-ORIG-GUID: F3uLjyOk-2H0r3wpjXaUsTZFtu-EVA7v
X-Proofpoint-GUID: F3uLjyOk-2H0r3wpjXaUsTZFtu-EVA7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280095



On 8/29/2025 1:42 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 29, 2025 at 01:28:03PM +0530, Taniya Das wrote:
>> Add the device tree bindings for the display clock controller which are
>> required on Qualcomm Glymur SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,glymur-dispcc.yaml         |  99 ++++++++++++++++++
>>  include/dt-bindings/clock/qcom,glymur-dispcc.h     | 114 +++++++++++++++++++++
>>  2 files changed, 213 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..063da2416dbaed764b8579a090bc5fc0531ab60d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
>> @@ -0,0 +1,99 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,glymur-dispcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display Clock & Reset Controller on GLYMUR
>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm display clock control module which supports the clocks, resets and
>> +  power domains for the MDSS instances on GLYMUR SoC.
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,dispcc-glymur.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-dispcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board CXO clock
>> +      - description: Board sleep clock
>> +      - description: DisplayPort 0 link clock
>> +      - description: DisplayPort 0 VCO div clock
>> +      - description: DisplayPort 1 link clock
>> +      - description: DisplayPort 1 VCO div clock
>> +      - description: DisplayPort 2 link clock
>> +      - description: DisplayPort 2 VCO div clock
>> +      - description: DisplayPort 3 link clock
>> +      - description: DisplayPort 3 VCO div clock
>> +      - description: DSI 0 PLL byte clock
>> +      - description: DSI 0 PLL DSI clock
>> +      - description: DSI 1 PLL byte clock
>> +      - description: DSI 1 PLL DSI clock
>> +      - description: Standalone PHY 0 PLL link clock
>> +      - description: Standalone PHY 0 VCO div clock
>> +      - description: Standalone PHY 1 PLL link clock
>> +      - description: Standalone PHY 1 VCO div clock
>> +
>> +  power-domains:
>> +    description:
>> +      A phandle and PM domain specifier for the MMCX power domain.
>> +    maxItems: 1
>> +
>> +  required-opps:
>> +    description:
>> +      A phandle to an OPP node describing required MMCX performance point.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - power-domains
>> +  - '#power-domain-cells'
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,glymur-dispcc.h>
> Should not be needed

Sure Dmitry, will remove this in the next patchset.

-- 
Thanks,
Taniya Das

