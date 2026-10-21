Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597950;
	b=QI/ON56mCIUyvSBrONThPi29LJ0M9vI0Ya8aVdv/3I2eAV60JOZbxfHM3nfN1vYJBIWY
	 Ll8WxEQG1FdyW8zB5iiKr6s5Erc/cgBOxS0xT7nf/rNoPefucVu8w3Y0XclA2ymCmNxOo
	 8aXsl4P/x32D57CaDcHuJgF3nEwDdXhrN/sP51N96xFHi11SaCgamJkwRyQgouBFVfLJf
	 JBaGoCcek2wOI3xowX6H82IEwl9F43v2f09/T8a1hsq+KolUvb6rgPwA7DhN5bP9r/dG8
	 X1/EiIemQGor17otY2JvNrWCRqpp6L41X3GAFMTaDduNln1w4q5wDZjXi7MvRUnSEzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
	b=H1PnKqELlk7o0UIy5g0Dkfp7SP5suBalx9ZEvKusoWlvJp/icy+NBHDHnHrIG1JByN9B
	 N8aolVVRcxCb+GVUvEzjYzwFo6gaji0ggmG/NMKYCEl7whK4D3m4l9Lbs6rDMYM98QppM
	 ZPk8K29rm13gu8U2QirdRPgjM94g+S09L9I5lmzDrgAhyNcjFuf2smNfyXvip7c9fN0xC
	 UZpMJKrKwsAm0t6gbY+VFAt1cL5VJ1Ijo6puh/1dXNLi5a5OPmmDlyl/qrDtzLQEV9wup
	 U/ojkgvNpSl7nb7Pby2Jns2wU/XjeFsk3Q8KiD/qK+JIwIflgSDEbrJKcJZMWN+D1VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1JkZaaM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbdbjfEk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523BB606A31D
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 15:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1JkZaaM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbdbjfEk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFpF5B1037769
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 15:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=; b=X1JkZaaMrgTHS06M
	o7AuxubVAHNYAzDNoSeEZL7PJ8n7fdXBQFkiLgF7WtJ2/ov+PYwQneQBBkjh0NLC
	WfSNd8poJWwVZ56WkR2BJ45KPIORIWZS0/vfNsltIzvoPJNs/VfiNqPuH/zX6da4
	/48UV4Zar3SZ/QSaH6ySYnJdw50tmQf4tcpzsntlvEkD/tSp/RzyEi73Qyl8ZKbv
	Ic1Z7Ko783ll+iL6fmOlCCOtBIkmv4MvR0p3uY9ypvyBonzJxsZw7yuH2Sy3B1xy
	9oqq7kFjeAfSK0kndMy674r74DOW8SS5WZh2+3lgEEDFqDotzAsPcZTnldI6S7bH
	o7B8MA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3v83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 15:52:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36696c9f55bso921249eec.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597947; x=1793202747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
        b=NbdbjfEkAUJfnEOgZvzihS3FCsTQ/Eq5luqXC2kqzy8XSIUgB569FdxvJQSc4ZsqlE
         q7YhhPtgkLq5Q0x3tWf1iFCO5/pb7hZJqv+UpyH1EeNJ7PrZ1O6+Ah/6PeEDtAjGromG
         iJrVKqTQo7z8UfQ7A14Sih7KFs0twkd6oyiP5RjsKGnpTPye77eKNEVm8/qBvrJSd3LG
         5bLMnICoDn3WRFtnga56XiWB0lfVJ3BSm0fw41YAQfHDUu61T5kpwFBBln3jFBAn6uDu
         8ichDtqGCgcYloL3/2QLB0DRzdLqm1mz4Xj/6feijC8WD/8TFK5eVtk2dcV5jH05Fyhp
         kg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597947; x=1793202747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
        b=eZlRelfuXAPu7i6AZfUABjb3iDf80cbHapeMTONeDs0bRd480IxG7zJnYIS9BjqaeI
         8l8SxZM5eudtV5lEIkDFxujJBI8Xmi2MS3LMUC1yTay+tOz3VeJUkip49TrrG6lV78om
         TnFtcV74Bi/L4YM8QbCCg1pheEzCW2+No7lxh6qFhGi0oGGFJd1cPElAXDiWH+COg8/N
         15R4/He8Z5tyMoqppdftRIm6jhVLUge7FzQUDq23Au/KIBAwi45wf8ODK2jypnMHGnXX
         h/F+d7/+qr3/TCS6Z5Gy/UYq45FRTHe59v+DhNgZtku1eGaZX6jyUZIeVs3irViDW0F+
         gdxQ==
X-Forwarded-Encrypted: i=1; AKwUvByC9gFxFw475/fDL3mVZnGWuYciekjvA68whn3+zP7srHbaiaQTYAsonlBHfytgiCn7ZS30cUtmgeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkXdYdhB8nPM0EYfylGWMNGVb956xJ2Zw0E2GZA8sS9rEvKJmH
	JJcNWKtnwh4yTa80lhvKgH5MNkGt330y+8eJH9Fa/VCMgaDN951Ek4MBrv7BbvaxTtpjY2qpnFC
	QJUXomCEAxu9mVkOZ2Q2ZChAvgeqOuQoe1/Pxxvf4fC+Yr+sjnFhha2h/PyJbS8I=
X-Gm-Gg: AYBFou3f1OEbMDDE8iMz4ppcvobOhs040k76Y23fZF7u7oP3n4fAHeGxYrVB52NBjzE
	1GD5Gg4AdgW79XUi0jXhXBK/R9HuBOywy9KSrfgrtBTVGz6IdfOWiDn8UHTpFW7gZT5v9/lFxsR
	U1k12rX+IUD1sPOdaE+S9VfZ2BPEXxzISv1LxuPpinvbETOtFNwsK4NwuLNryX3d6J0btRuYjU6
	sR2Rz1Izw/Num4iaP90nUPaqSMuHuweP2465tVcVHdfynXDbySTO3F92zo4oHZDVR/XJb20eijR
	FDJU2HFbJUL2rgwnTKWrAB5tnjn6OqjtSCnQZGyzxdXo9n7mPs+/X5r9QweRqMR0sR3HW/wKrG3
	eLSEY8PL/+lPZhiELVnc12mObLuoYIrkG6aq2GXMmz57j
X-Received: by 2002:a05:693c:2a13:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3674d54bc37mr3320999eec.10.1792597947098;
        Wed, 21 Oct 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:693c:2a13:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3674d54bc37mr3320967eec.10.1792597946485;
        Wed, 21 Oct 2026 08:52:26 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm9445801eec.25.2026.10.21.08.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:52:25 -0700 (PDT)
Message-ID: <d163db9d-5b0e-4bee-aef1-3fe8b7f1fc08@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:22:18 +0530
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
Subject: Re: [PATCH 3/4] dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650
 apss clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-3-fd4c2b3cbdea@oss.qualcomm.com>
 <20261013-quantum-keen-mongrel-c3736c@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261013-quantum-keen-mongrel-c3736c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8dfbd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=mdBYyscGZtZr9QMU3J0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 85avcbjMJklNc56-bEpLN5-0ot-h7hUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX4kYTMObU1V0D
 eEp8aKVoIfavljP+FIkVguCA5zHLfr+2L+InX96ctjXS1SUMcAjCGJrU98g/vpj8gt3/wVIMKW4
 X/8axYHTvsbaie8DgsnDDo6sn1bpWHdQeRFV92qNXFcn1i0sM6Z4QsbwGkIHVHvWKCoym4MbCmx
 +Y5jAiIa5vGwvxnNdx8zip0BsLXtZ4p9ceMD/NVFlztyrU79Lv7hyE4ItfH1yKn80rYc+21J+bn
 Qm4oBeBzqQETe9eWn/PcckOTQV9s5ma81TWnKLEIpRItjotI8suteT9QXtyjKQijFAF9td6qI1U
 Mc8L6hJlSai/HFm5UGkMYaN/Aoqc1ofq3lr3M5s5qHk0JScDLfkwUpeDkUB5dwWcrF+bJA1a6qU
 aQMBDr61BrJRsY/tHsEoqh2DUjIP+x6bdeJII8V7r3Xco6FUJ0D//PjTNlCD2gPD8/HtPNWz5Nj
 oJRqwW6WvK4fIwqLJ1Q==
X-Proofpoint-GUID: 85avcbjMJklNc56-bEpLN5-0ot-h7hUK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX7EIp+GTdoglr
 2CAonY262MFvHn8SIb12C1TtzlqmKGq+pQ0+qW67JNW2EJ6AxI4T/YNETqasQ0Gps+EGDzxjsSk
 KZKOWpvFy/bIDTNPfUJMFGb2g4loEWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063


On 10/13/2026 12:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 07, 2026 at 12:20:46PM +0530, Kathiravan Thirumoorthy wrote:
>> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks and
>> has a register space separate from the GCC. The four Cortex-A55 cores,
>> the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL,
>> selected through a glitch-free mux whose parents are XO, GPLL0 and the
>> corresponding PLL. The L3 needs to be scaled along with the CPUs, so the
>> controller is also an interconnect provider.
>>
>> Add the binding, the clock indices for the Cortex-A78 (gold) cluster to
>> the shared APSS header, and the interconnect IDs for the CPU and L3
>> nodes.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,ipq9650-apss-clk.yaml      | 58 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,apss-ipq.h          |  5 ++
>>   include/dt-bindings/interconnect/qcom,ipq9650.h    |  4 ++
>>   3 files changed, 67 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
>> new file mode 100644
>> index 000000000000..6b47183edd56
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq9650-apss-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm APSS IPQ9650 Clock Controller
>> +
>> +maintainers:
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description:
>> +  The APSS clock controller provides the CPU and L3 clocks on IPQ9650 and
>> +  has a register space separate from the GCC. The four Cortex-A55 cores,
>> +  the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL.
>> +  Each clock is selected through a glitch-free mux (GFM) whose parents are
>> +  XO, GPLL0 and the corresponding PLL.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq9650-apss-clk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Reference to the XO clock.
>> +      - description: Reference to the GPLL0 clock.
> Why do you need a new file? Looks exactly the same as existing
> ipq5424-apss-clk.

I kept it separate because the IPQ9650 block uses a GFM instead of an 
RCG, but that's internal to the controller and the compatible covers it. 
The binding interface is the same, so I'll add qcom,ipq9650-apss-clk to 
qcom,ipq5424-apss-clk.yaml in v2.

>
>
> Best regards,
> Krzysztof
>
