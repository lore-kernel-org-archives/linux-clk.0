Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481429;
	b=vIm4kEBipkb2Wzh1fwPdXWUpmSdU5GP4LR6SQUZOJ6SkS6OWm+zy0uDP6cVNqjcBEo53
	 0AhVXUPoFLz8JHQ/vuEivPwPk/NT2qykMSaNVHNJUNlK0wnw4IBjJ8FREg/gChWNzLpPX
	 Ur0x+2MZ9mLQaoosF6XBqKmxfqjDkDzngG+lD9eM7+VuBytLaI7w0/+vFOLTJSow8UrvD
	 +hI9FWDuH9O4AL/7iUrn4yq5gu0Lrn0AlCe+LCjdxh4ac9D9dIWa/RFEeNPXGxBragiY2
	 NkiwiQZU/sUO8Y2AcaIIKs8gAi/rRJqV67AMaNTJ7yBg8Bq/LxPj3WXtyEE73w3HUVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
	b=VMHJADa5WJk8L5C8YSKd0LeU9MMZvU+9GRKsH2Oswe4PcCF7qdZcSdPScuLq7nR12eS7
	 SuJSz7QS5T8Yu046dSTYC1NoAVjMWQMhxYJRCHXj0sYNZIIrWhroCTya3LiWdBDyDEM18
	 IU+Qr4iu6PkJlkl1pcxfbH44wAeiovqQ0o3TAk2XGWuEu4ILsW/Qh78j274OAqabWLXlJ
	 qAexrV4jut+CzDzkM5Rg6xGO2RGap74+m1TuUKKbD2F9cCmew25M4XMAzpf9pKZKHTYrM
	 wLsRWdEqIfAWinTP0fRDDjUqSetWn3mU3k4Rb/aJX0ajgva3PbHtpdS4W6sHZ4vXFfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWnIhHFy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kTc9OZVP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC66606A322
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC66606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWnIhHFy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kTc9OZVP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tUFP620613
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=; b=XWnIhHFyxb7aEpiq
	xeGv4niNxM+L/QgL27aVfxAgYAY/CEE1QzmhjLa6+jGoiaW84KWmSZe0lDskvWhd
	0x/3T1vXqVk+/JqHvYTP6r/Hmq24EYMTOcQmOdSJpb8c8+QtaFQMIoSOw3N27nid
	aVBWUsTpBvNGoSS4UcjicM/Pn4uNxq8p0RIVWUzFWVdw8t3Eyzs4isbEtLa/SF/i
	d+PTTBTAbf0fzupF6P5cqKu22u1SyS/h8UY947kRTzsuHqg0OBrpEyJ26w/C2P7c
	AAiz0mxqPta+zbVcilSFtVz0yw8GzFgSXARsNTAuwMEG4PWMz7yZMGQOxVGCkowS
	cTXqRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsay1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:30:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536540909e5so4792631cf.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481427; x=1793086227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
        b=kTc9OZVPsOz94BhSsVNIGqO9tCGce/zX5sarupQmA1NnhEYX8I4TRn5ghDt7iR30YX
         by9EsS4ve7ZrCK8gBNO8cXqQl+lzuxvZotnZ/oFE611LG0sxXnrtPEnM8NBAhM6ciAkF
         snNZ3/7aJmE4IQ0ifpCs++oZOcDs7fJsYCPR8mrjp8yedpr6sM/tTHGEa/hDdIph0262
         WMpIQospwpv2zezLuWuppFu2udrGpcfIQYBueDzW0Su123WTz5WHTe0mJsYxYoQS3BZv
         QzwURjCNrhOeukt+xyK2EYmMmFcRuONWrAalEJXgcbAe+GngIwhay/MCuZcSf9DqidHB
         krFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481427; x=1793086227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
        b=pNXh8MqcInwlPfv6n1hgjlbYnBh8IumP59a0u7vOLJWPLzYLb+I/UfP7zF1EIDLll2
         +AsWg+cz6ksLwb6tcXIrFN8Pwrnc5JAcuIO2ivocqvo1jQK6rmnjmtK4YkVHvgHIK81g
         5mER4X+zrO11GWhYNOCnri7Qi12ru/FNtkz26tKNLMuM4X602SiNjfA77BaI2gyVsBih
         XUm+e3pjvtsUIWQ3TYZ9rtuPv7Mbme3163rnr/emASifGC+DIns/dIScB3pVFTlGDxDt
         PjR+c464Wi1aNQEoQsO2GLYfXu8bncf9v39dC6DsmHEnbv7Uh+Paw+T5f6AYplX2ei+B
         APaA==
X-Forwarded-Encrypted: i=1; AKwUvBx8q0oezwPDSzXZbJki62bFtoK4bHttn9/QBIa+D3BIMfYXbeK4QB+uIw7CMteWk7lf7HSjxouKdYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9L9yTccUcdw8l9RtD7yUnTls4VM+gD0S7ZU9gDSDunHfUV1Fw
	npLEY3jwHf4pd04aXPNJDd0w33mrzZFmFjf0lXNCdn6e6NKDiBTQx/8BA45XrqAnrUGyjv1sgSt
	1NhQUMcncxckr+8yzc5uZzXnNwg6b+ka/fKNq8Vau0r6t87el/RNfN0Q9H4XGQVs=
X-Gm-Gg: AYBFou3ca4sGHWqST/lvytBD+6/LBRv//rTmX4M3Hv4SWqdIeULVWIeU5Uo54hAi7DU
	QVEfw/gRVV7ouWkRkiS6vux84h/GzS+4JGANVUxe8+N6INw96HCKnG67AXcHcXleLzpYGgtO6gM
	N/1fV0kErUfi8fqQcNaED4obMybGKPzJybHzI8fOlhbqwzjKPK9ucZ1+8wlbfab9gZMCMNIlMIn
	0tgdUugjFnOUQ+GdKK4eRoYx7+cBb0ozsxZLyuPBNwUFgmO5/fbwvCBein1aeQChxSX5G/1pSJa
	C0tv5wDCHrDW/IBwb3B3Bbx6xnV4pefTCmvY+dPjquxBzlfU/JwfSZrSO3jpp1QFDUycPpJWdxm
	fbSIzww0=
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr176740651cf.5.1792481427228;
        Tue, 20 Oct 2026 00:30:27 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr176738631cf.5.1792481425434;
        Tue, 20 Oct 2026 00:30:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf72asm463264466b.18.2026.10.20.00.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:30:24 -0700 (PDT)
Message-ID: <c59ce48e-05ea-4632-aef5-78b9c6a4b21a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:30:19 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
 <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfXwCNSLvTMx5gU
 8I/VLKowUAIlis1rT7SO0KaJg813mw8QcR2whYOznLRdTzXf7i95WbIYEdB3w2hgy6Olv2yl0MW
 xlC47J7kQg7LzjFO3YDvRYP6ICuDPwo=
X-Proofpoint-GUID: 0MZQjok_pxNt-PLTRkxWIk517j6lPTHz
X-Proofpoint-ORIG-GUID: 0MZQjok_pxNt-PLTRkxWIk517j6lPTHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX/eZiK2VEnkbR
 0l16yvNQLOVdEBKwU2FW/X3b7TuUf8yuIZG6YCxfhQnZnU+v82+D55DoWbsIQ2ZAYHnJJnnqQYW
 NQIigTuRYRNu6NjmXAm9Gy4Jlnk+HCR2hJ/AXeTt024j+P/H68Ltnr3jYv6ujVJrJgky8J45Tt4
 M2t6vPZJkSlaoayknMwxD3So/oYighs1lVixo/NQmfMB5BDjkskb090aVWYuRgYNZw/+hMPLyQ4
 YeVRKiIuixMXDhXfecTdkGXZYr+rY+xDIyBFf+PX+SLXnwM4phhVECqUEFbq1ipzK9/ZCFR23kI
 s6DZtDCcKH37gWEqVKZ8B4EXAu9s5gGLXdga/k4GrvAMbfnqSqW9vinxSDIboKAOU9grmf+R5qR
 Gp39CC0D0/nAEU8DydWD3aGKaOZ8CFpACd0cGQVos4q+LMZbsq9dVCPV86KOfkNN3hAG38dVEOz
 xx3LJSMqKg2IuQwE7Hw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad71894 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SJAiqMQSjMSsh2023uEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200029

On 10/15/26 9:15 AM, Taniya Das wrote:
> 
> 
> On 6/9/2026 6:54 PM, Konrad Dybcio wrote:
>> On 6/2/26 5:21 PM, Taniya Das wrote:
>>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>>> clock divider. The hardware generates a fractional output frequency
>>> from a fixed input clock (typically TCXO4) using the relation
>>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>>> register. The clock output is routed over a gpio controlled pin.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>>> +    gp_mn: clock-controller@88d3000 {
>>> +        compatible = "qcom,clk-gp-mnd";
>>
>> The compatible must be SoC-specific, looking at the table, we could
>> use these example socs for the versions of this block:
>>
>> 8960 (v1.0.0)
>> 8974 (v1.1.1)
>> 8994 (v2.1.0)
>> 8996 (v2.2.0)
>>
> 
> Apologies for the late response.
> The GP_MND block does not have any functional differences across the
> supported SoCs. To reflect this, the DT binding will use a SoC-specific
> compatible followed by a generic fallback compatible that represents the
> common GP_MND implementation.
> 
> compatible = "qcom,sc7280-gp-mnd",
>              "qcom,gp-mnd";

I think the dt maintainers may be a little grumpy about the non-SoC-bound
fallback

> 
>>> +        reg = <0x88d3000 0xc>;
>>
>> Let's map the entire 0x4000 that this block spans
>>
> 
> This region support 2 or 3 different blocks of HW and they have
> different functionalities and for which I am going to add the driver
> support. What I can do is map 0x88d3000 size - 0x1000. Please let me
> know your comments.

Sounds good

Konrad
