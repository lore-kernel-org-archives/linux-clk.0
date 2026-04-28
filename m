Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF30322C6D
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 17:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396899; cv=none; b=fYKiEkIMpDTTcSudv5xILx2QwIOL5n4fi8cWbTht0sblgx/96UtfxuDKsDEtGYocBLMQgP2CDml58rU5iW4FjIJ4p2XkSjjN2KCNMtFM23CtPpRQ48YmVKp+STK7b4d7Wvz7O5VZF+cwPVJ6RDQzT5/yMQiZcrT356NWznbi670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396899; c=relaxed/simple;
	bh=mIEJYPrP9BAaq5bbd0ByDxLbcdSgNJ/pySrTIxlF65c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bz7YCUJasNKrEwTpodrRvsyZy3aHMJJVNIjYj+WVmed5VXelJFJ6HTNdtkt6+5EaXJwSWrneaOV66ybgiNqrlopS/ybLM7ZOL6BB6Y9zynEMS7/uc8HBnnZGjQLmgA4oqbPpCpOUBkuwyr75BJN/1z/uSboqBd7bp7GPPSz+sgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GswPjRkI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sn46VDh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GswPjRkI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sn46VDh7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsSg11531392
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 17:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=; b=GswPjRkIwjKvVCJP
	rJazszKlY5U4navRZKH8a6Htm/QZGz/H59RcccgiXtN1ZPa8Vs+4UnVhr/uCxdnQ
	2CKaswymZ3u+ZoMsoL1DLN1g2P8P43UkINwa/SRs5Idnenb9/hhwxtIGKI8jBjNI
	YSmcaULRuS2wdgxHvrSA6J8W0s3zbBXYLpBu3N9YfB3z3wvVZv7UZt279XCmTlhe
	e/ssUGmciqXJBxn3fCh2rRRqfIB/hlnn8hqzo6Rr+CnzejP9yh84I0rdx45HIon9
	ighDN5Uk40XJ5LmoG7EQG7M564ftlD7CSPDlwa5AGmZ9MLQmVUBJgydorRVWjOT8
	PwxTSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud21kg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 17:21:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso44529a91.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 10:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777396896; x=1778001696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=;
        b=Sn46VDh7+X7xuT39zdc+MznO6A0pRFAo3iFgKqc8pTVDqduG3v4uQWrwfFrE8VGn/c
         IlP+XIXOUteU3IivDu+bIY1nv77Co+SEvp88EWTgW08sqvP7cIk7QWciiZIl1SuWxzLV
         vmWGJREdQI9mG4b0yxiKmS5oeh4B4r3XNntnkYiWez0GW0FdTH4MCikQCBjAWVAdrVAu
         QakUW1wCA1Wo8hY43JZ7Qg66acWRCAbTMK+ta31NYxADjzYVmKcx6nAlqU8wBXao/exi
         S6CgsSrLXbBrYwBFq9zmoiX3dCb6pDoyRvtqru+hpdr1s/qDfq3Oat3TMLzTCqMfujiy
         hDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396896; x=1778001696;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=;
        b=QvhClCQ7yQktWyp+C2qlSEEuWijBN+WuRY+YM3XD9C5caHGA1xglcVtQ1mhSt0DlQv
         6rrMKDW+g1SP+dcWJsj9uuQfHS2TDkiGLPpzfRRnhx/S0Z4VpdjbOcEo7HTzLOROabSg
         ZJWFAYaX+2noVQZTN1pI1oe++TwjK5GR5RRdZvjAsBiN8XZtffposIbYfebbtnZPeCPK
         VGc6naHPuDCeYBXhoB6BWho98nCXWHKUajlUoY4uzBJN5a/Vycs194rVn5RmWTE1UHc3
         pgcXctYIKNDUjNgHl7k63v2cjLZ5oO2sYhwC13KP8yMkkkUZklnB0eVpY9VXLcWbp/qx
         qSFA==
X-Forwarded-Encrypted: i=1; AFNElJ+l7srNgon27tOLsFNI1J+UK6ktgku0V9nl7/H8IN98GnsZspUhXpBgDlP74o/V1Okf80f7iK5D/YY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05s6AIfeWdD4iZwLiWfuU699L7wiMUTxR3z81xrMGFQ2dd96c
	GbpQAknt3nU9ywrAsyB2dXd9zdlWfo69+uGqr/G+lUqsMGy1mHoJyhZNnbaeSGr1fqXlwv9ykOO
	Ji/amtIFQZ8CZo0+PsHPCJnUaapzXccn1q8rI84TDEnomdji/TVFQrJxxLbMLIIA=
X-Gm-Gg: AeBDievLu2AHWRSMUXsk0ZqOlVXfGXCj6hI890qEnCFIkier40xscJSQd2dwNjo+S8+
	3r3GXGlYjLi6skX9p+OqF1MZY0l8gyApw85yQupjMcacsVXHaN3ykvQcfeE2oe/SvPzZSp/4qSl
	fu2kg0tuNKp76D0Ps97n/P9zWebfuVuzxINJAVC3K+b3B9+SbOtRrxhI+Hg0XgmidEhI7axkcfE
	2Q0r1ZbdtQFPcy7MPjtO7QYxAIlULFhGwYrTRQmVV3/wmytFyjGezPVkHxY4ssBIrhb88hJ/FNX
	ttlUA5Tt2TUTDFea3vpYtO4Cz0VRDQc6t4U2Xt4M3+6VeIwjYDjkiO/3upmfL2T/YlhcTeH6/d7
	kT4qlQebGsoz6pVYjS8ddIySnRdW3Sug4NUewW3oQQV9tFuFmlGVADjkzCj9ObKVb
X-Received: by 2002:a17:903:1a86:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b97bfc3323mr31903835ad.2.1777396895625;
        Tue, 28 Apr 2026 10:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:1a86:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b97bfc3323mr31903665ad.2.1777396895084;
        Tue, 28 Apr 2026 10:21:35 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.243.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac7858csm34088535ad.49.2026.04.28.10.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:21:34 -0700 (PDT)
Message-ID: <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:51:25 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
 <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
Content-Language: en-US
In-Reply-To: <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0eca0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EwI1ikYXukqkrg4G3Narhw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uCKRraC37LqDOxPyBRsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: cE7qpoI-onnbfo3wv1wGP4AEH54ad1Bu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2NyBTYWx0ZWRfX5omZeSjcRlvB
 SDd2rpd7tO0jTgtekuBpseskZQGhySDAD4jVipzUr2tnAjmXGpTnoT3FZv3/N4Y+kld70tOuNIz
 m7dXkcT3VwJII6PhBOt0Ts3puhXVTTDf5+ySnJrvlP52cHwyVGiWBJmmPGbTENJG9zvE4b8eBQQ
 ryyHIiLwFLju4dGrf/rxOTHkU6k29m3G3u8tbmy1jhucvmncosHOZp/27FtvyW6aOp/F4Zv7pCa
 SXnvfX391zvM5STCnqiY/8dViJK11qW+BX3itU97fE5P7FgsCxJz/L94A90eww+wcygXXN0OEff
 WzEQ4iPrypb0BEXPtagdddx62BYeYM0T9dnbxFURVTNx+9trfthXxXxTYcn82+wvVfAmoxbOxK0
 oJGjj8olfgRevuDsaDXlIzDQuM+o1ZgF7V2V2wjKucB7H7tsxW+YhAuGOzhRqQ5XkXCK4glS8jV
 YecZsCOARRlwPWYYMjA==
X-Proofpoint-GUID: cE7qpoI-onnbfo3wv1wGP4AEH54ad1Bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280167



On 4/20/2026 11:15 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
>> On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
>> (Client State Aggregator) hardware. These clocks can be scaled to the
>> desired frequency by sending votes to the display CRM(CESTA Resource
>> manager) instead of programming DISPCC registers directly.
>>
>> Add bindings to allow the DISPCC node to reference the display CRM node
>> for sending votes to CESTA hardware and the CRMC syscon regmap node
>> which is used to read the frequency look up tables provided by CRM and
>> populate this data in RCG's frequency tables for CESTA controlled clocks.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> @@ -60,6 +60,18 @@ properties:
>>        A phandle to an OPP node describing required MMCX performance point.
>>      maxItems: 1
>>  
>> +  qcom,crm:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
>> +      with the display CESTA (Client State Aggregator) hardware.
> 
> Is it going to be shared by several entities? If not, can be make a part
> of the dispcc and get rid of the extra CC <-> CRM API?
> 

Thanks Dmitry for your review.

Yes, clock is one of the consumer of CRM, but CRM can be used by interconnect drivers also
for BW voting via CESTA.

>> +
>> +  qcom,crmc-regmap:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the syscon providing the CRMC (CRM clock) regmap used
>> +      to read frequency LUTs (lookup tables) populated by the CRM.
> 
> Why is this coming as a syscon? Why isn't it just a register region of
> the dispcc?
> 

The CRMC block is not part of the DISPCC register region; it is a separate sub‑block within the
CRM(CESTA) address space. It contains clocks frequency lookup tables that the clock driver reads
to populate RCG frequency tables. Since CRMC block is outside of DISPCC region and DISPCC driver
doesn't own or manage the CRMC block and uses it just to read CRM controlled RCG's frequency
tables, marked it as a syscon device.

Thanks,
Jagadeesh
