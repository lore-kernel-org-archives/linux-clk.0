Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7118D19E806
	for <linux-clk@vger.kernel.org>; Sat, 21 Jun 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750500592; cv=none; b=Mvr3SkpcyVaLDZymF5frnkDF2bpwMUhaQrKuttItUJ1ZgTLAIX2F5h3hWAMiazOqe0JOKMZ+XpoOggC5CY1RxMvKnIqXQt82RbCONd0IMVbQdFbsW+xQYkwbP9KpbKL5nlZepqnJQxwed354fHGxb1Pe1bzyIDb3OjW23+spvCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750500592; c=relaxed/simple;
	bh=fhmuuk4oxkPAjOucmLsQQYL6pZBtL6KZT3sq2lRWRrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uv7uaeLDdETRWFWOHoe+qFXFjo5cWzq40sF8wKb25TdWpHG3OfhyCyajpr7JYvipFrftTQvViRdSayq9YaJQPymjYdSO9xlfCfJKQzFxfOyphKULbU/bSZhz0fi8v6KeSaI5FF290pgjRQIboTofnh0w3vCZ1jXumyRsxiIqsZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekkBzQ1+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekkBzQ1+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L7pfUC024674
	for <linux-clk@vger.kernel.org>; Sat, 21 Jun 2025 10:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8nrgve/sfE4i/DQEMAHREmTS62webINUascpRsXO6s=; b=ekkBzQ1+VaNQiJnI
	d2q8G7lnu2RO6d2omQX8MaE85UXn/KEpTWVqL8lyqmYw2OJQqLXqdmfFOcStliNZ
	U/mhUotLw1HQa8ra9mb9z56u+qK1QtGvvEU78TKTeqcqmIz10oB9CSAgMUSXKX+T
	bKR+btMff0tUur8XaP31s+fztfe1MVzO7Na13E3JqRcVK0Vd0Od14DMV4MA/wEPP
	6T6FMVDzhkFS39rJ/GclUQwKr/OUomXst9p1cqZV0SdEsBjPu7/wgK3VkyqNUEU6
	qFDort8e6jMb1MFMSri6+JSLNWKmUDm7x3FMFfAKx7xHum7T691YVQbTKvCMod+y
	JtHNyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47drq8g54a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 21 Jun 2025 10:09:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so71480485a.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Jun 2025 03:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750500587; x=1751105387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8nrgve/sfE4i/DQEMAHREmTS62webINUascpRsXO6s=;
        b=ct2xJGNROdIAhsbDLB/c6x9T3wpaTFSFbunrGjcvzRDjfqXyNTzCJbFm57aEtgindt
         6Kk/5ZrMUOhCdbS0jW6QeyW1kBDaMaiszpQ070C0AivTqu2z9tPWAK6MIQZdTOWk/tHf
         KtGkSwf6wxJR8+h4yyMPG9FQWVmpeA9axF7vrlOd2sKGdFNQw/ZM1BW3pQd5NlGydkJV
         tGroi/eXxhtb0fatI1z3rm6xzyDlHvlw25qdkljK47oSMAfOfJf6wYfN5NOP1lBwRNPp
         jCgoBFnAiOQsL+wfuDlk8ep0Yc6LjELZ8nEZoCyP0Wlo3M9V+cNobK4b8AW0U7/+WrQ+
         NAZw==
X-Forwarded-Encrypted: i=1; AJvYcCWF9FsN2rpnFSgcwBQOKR2aCU5AVHW7nYUkcSLfCRNgzlqDongWSJ5Eimv7dI3mgYMTvp7vr0je2ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52H141gq0h8By8MqTlhUHXQKfMSQZ28D7eh4k2jbnEkfgHrCH
	nZvi1pSH8gsBaylWC1k2+8GA4or2m33P/WBncDvLtAqconGmfLsG/sK0rqb0DRR7SKYYQ0TRQfF
	yfhgKfVrmEkLkY5m59TPwYY7nf3SINl28vfdsByfSf/iAPoOmCJsw1aOBbOc7H08=
X-Gm-Gg: ASbGncteLV31CglF4Pxm3gSY1NyKxUqEoPxViTIJje3CKc1eVKNJUOr1JSinqzrrJWi
	CeVESsuZu8fp/7RoRbgai9UVZPQmf30x8UFI4i6YRA4pnQJ1css9MzzB3rwuuoyfe617yHY2lD2
	A1cpysypVwpsXSjTpYAVajRtQl64bFhlGouAwGrzzlKB2e54GisxFwSEDRnj0LL2/RjTr5eWkHU
	G0HxjhJ86HbbHZIovc1Uxlz2cCFf7/kJxpnhOcOrP7yqef72mqqEDw4OgtSX7pCbPv1wdq8yKae
	6rnHFRnVV0oR+PG7S4Xz94Y1W96yhNiujWfmAS++litsDlrDiqOKRjKHYXL+SQf2kdrDuJ9C0Lu
	dPeY=
X-Received: by 2002:a05:620a:2903:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3f98234f9mr305385885a.0.1750500587424;
        Sat, 21 Jun 2025 03:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEkHqdZ+avToFSA0VJxfQsaNZ+3I7zEzzowA07Hg+ReuS+AxPXnZPkGqYAlly0AM+Nl6q6wg==
X-Received: by 2002:a05:620a:2903:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3f98234f9mr305385085a.0.1750500586953;
        Sat, 21 Jun 2025 03:09:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0e9sm341317366b.54.2025.06.21.03.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:09:46 -0700 (PDT)
Message-ID: <78f0e4b5-19f6-45a0-b4dc-a1b519645567@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:09:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: clock: qcom: Add NSS clock controller
 for IPQ5424 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com
References: <20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com>
 <20250617-qcom_ipq5424_nsscc-v1-5-4dc2d6b3cdfc@quicinc.com>
 <b628b85b-75c4-4c85-b340-d26b1eb6d83e@kernel.org>
 <512e3355-a110-4e7c-ab43-04f714950971@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <512e3355-a110-4e7c-ab43-04f714950971@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Nq7jgrZUfTev9SM1uZzHq7lQhoBAENJY
X-Proofpoint-GUID: Nq7jgrZUfTev9SM1uZzHq7lQhoBAENJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1OSBTYWx0ZWRfX529H6uw4vuD0
 uv5eKoBCsFlv1NHmYuqkPTzcDMy6clcg66gfLdz8BlMD7+lz9MWKFNhv6vtVw0wopYBsYSp+zX5
 Iwg42xIMpTYSlSBcH2t8A1y2vKiHII9bXjCMtC4IkuDRlgY0kzcaEzi8VjXfpnAqKC+ORC7LI0B
 zSX0QKhrgG3xRAQxj/9f2vlMck7z+ZTSPCSZ0vUV0oJgFgc/w0DalSKRso3kBZL+1xIQfQdlZFl
 cwwYKSElSUwIWcMqPwrQvjGvTpwx5rlWudwPEH2NEJJre18Jk7rHCzKbYFBYWncHkHU4zZW+//U
 3kP22fhnYt3uJreqS3hYhHPGfSqQOA97SIY2o3CNAIjlEYMSDBKz/T3zzOvxTvhUGejH47LquAM
 70Q6Xq3v1TUWAWkWHkWnuN7AlHe20cdAgMRt4IzJ4Q3HwagNyTcCYPJuft5wkVHVWw1q2c3V
X-Authority-Analysis: v=2.4 cv=Kr5N2XWN c=1 sm=1 tr=0 ts=685684ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=LVulUOl5olkk-nN9es8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210059

On 6/18/25 5:58 PM, Luo Jie wrote:
> 
> 
> On 6/17/2025 10:49 PM, Krzysztof Kozlowski wrote:
>> On 17/06/2025 14:06, Luo Jie wrote:
>>> NSS clock controller provides the clocks and resets to the
>>> networking blocks such as PPE (Packet Process Engine) and
>>> UNIPHY (PCS) on IPQ5424 devices.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process (neither too early nor over the limit):
>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>
> 
> OK.
> 
>>>
>>> Add the compatible "qcom,ipq5424-nsscc" support based on the
>>> current IPQ9574 NSS clock controller DT binding file.
>>> ICC clocks are always provided by the NSS clock controller
>>> of IPQ9574 and IPQ5424, so add interconnect-cells as required
>>> DT property.
>>>
>>> Also add master/slave ids for IPQ5424 networking interfaces,
>>> which is used by nss-ipq5424 driver for providing interconnect
>>> services using icc-clk framework.
>>>
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>> ---
>>>   .../bindings/clock/qcom,ipq9574-nsscc.yaml         | 66 +++++++++++++++++++---
>>>   include/dt-bindings/clock/qcom,ipq5424-nsscc.h     | 65 +++++++++++++++++++++
>>>   include/dt-bindings/interconnect/qcom,ipq5424.h    | 13 +++++
>>>   include/dt-bindings/reset/qcom,ipq5424-nsscc.h     | 46 +++++++++++++++
>>>   4 files changed, 182 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>> index 17252b6ea3be..5bc2fe049b26 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>> @@ -4,7 +4,7 @@
>>>   $id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
>>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>   -title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574
>>> +title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IPQ5424
>>>     maintainers:
>>>     - Bjorn Andersson <andersson@kernel.org>
>>> @@ -12,21 +12,25 @@ maintainers:
>>>     description: |
>>>     Qualcomm networking sub system clock control module provides the clocks,
>>> -  resets on IPQ9574
>>> +  resets on IPQ9574 and IPQ5424
>>>   -  See also::
>>> +  See also:
>>> +    include/dt-bindings/clock/qcom,ipq5424-nsscc.h
>>>       include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>>> +    include/dt-bindings/reset/qcom,ipq5424-nsscc.h
>>>       include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>>     properties:
>>>     compatible:
>>> -    const: qcom,ipq9574-nsscc
>>> +    enum:
>>> +      - qcom,ipq5424-nsscc
>>> +      - qcom,ipq9574-nsscc
>>>       clocks:
>>>       items:
>>>         - description: Board XO source
>>> -      - description: CMN_PLL NSS 1200MHz (Bias PLL cc) clock source
>>> -      - description: CMN_PLL PPE 353MHz (Bias PLL ubi nc) clock source
>>> +      - description: CMN_PLL NSS 1200 MHz or 300 MHZ (Bias PLL cc) clock source
>>> +      - description: CMN_PLL PPE 353 MHz  or 375 MHZ (Bias PLL ubi nc) clock source
>>
>> This change means devices are different. Just ocme with your own schema.
> 
> The NSS clock controller hardware block on the IPQ5424 SoC is identical
> in design to that of the IPQ9574 SoC. The main difference is in the
> clock rates for its two parent clocks sourced from the CMN PLL block.
> 
> Given this, would it be acceptable to update the clock name and its
> description to use a more generic clock name, such as "nss" and "ppe"
> instead of the current "nss_1200" and "ppe_353"?

Because you used those clock_names in the existing ipq9574, you can't
change them now. You could introduce a separate set of clock_names
for the new ipq5424 though, but I think it could be useful to drop the
rate suffix for new additions

Konrad
