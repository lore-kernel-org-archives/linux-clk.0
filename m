Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540904;
	b=jJczJB75Ik76sMD1Anr+MfhrCB4yRPFpCjWb9iOBxtgB4LzHMKlmcDcZrb7Bpu0SzO9J
	 rpyYfhKNQzQ/Rp2MBSCFEyy5UGPwSlV8dNRTKa6KHqvu83BlDJlnPpIogmNJ8IbmCfEBS
	 MyiUGVBImJUnISP4LxAXyEw7G8U/DeoYFaXK5YCFWP0I0Gs/CEP+mm6gTcpW3GLB41zoz
	 66ijpNcmhfrmIlvQZmlUea3htXtQ9nAMriUKGVdo3CbXvfqKb34wZgnv/41frxV4Lyx6W
	 naqIVzIU6WcXtM5fKmXtsO9iRS6CyMM7+dXMjgMLTOUXj78cVIDjOygib3PyoNaLRpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IPZ3HOktLUKO7C6+7rK8PWwT7CibQnKEc7TizM3393o=;
	b=ap8H90omI1iQvyPpZ4fbMPFZnPO6rTX1R/3rijHnVvC2fhPW1UyVOzhBKxuqYA0kwOdr
	 0f6HgfCc+vSJ66kGCOsFBxdYBKRuU9qQtwUFJBlNdzMXOq2JcIFwuXmt9/G48ODIozvkL
	 1hMrwSg9ijN2oaRqshHwR0TcY72sv2UtWDeevgaPJx/EUVeBk4tkvLbEbyaQ8FtIy4vR3
	 9RtqSFMgN8N7vC2tTKA0SsbSEFQbqU+oC7vGg4M7ALxcDlQvYtrbHZRFnf25DdFCEL/lg
	 cvGMovhdxQGHGFZqAF0G+dgoGC/fJzBUrqAbFty8iprf/LlkHxNAaYxHcXKdv1rg1yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRnXIVRB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTaLV2oO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE3606A31C
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRnXIVRB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTaLV2oO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K80h4120351
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPZ3HOktLUKO7C6+7rK8PWwT7CibQnKEc7TizM3393o=; b=gRnXIVRBJDeM8ySw
	aPNieEiH7Q31za35m7BrDXSXEwzVomjsjQmGkm4/SgoUxgWkcCtfB99OQ5Wlez8X
	p9Avu5YAaCgt5F/3mUxfJKrMz3MVgU3cglt6YLqxcYi4++JGPGeE1Y+eNB1RfbiF
	IldTPCGIsLsb0GZL+cK3UUv/y2gmhXNyhvVqhhvROtlbLIONAp/gGQOABiUI4+ly
	+eSxZJxnhnrFlgzT2lAyrrN7M8gC+r7K873liA/SHsrV+fN8oTsW70bHscT1jGgG
	Jav1fzcVOB5XlpJ6DVvZSPVnbZv+aDbbCyjNq3plOrf3KVAuTOtJFOQCjQQRstLe
	8ppyDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx338ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:35:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso4749475ad.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 19:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794540903; x=1795145703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPZ3HOktLUKO7C6+7rK8PWwT7CibQnKEc7TizM3393o=;
        b=PTaLV2oOe3UKjSpdSc2iI73FcRNBDEWGiPqwIg+uPoJjTj9JmjbHf5BccxN3dpSgDK
         YRQYmJ3P9kZDUMYkZG/JBG6UB9Mg8M/B2qJGCP3PvORsfJOcPknJEn7hYwiTDYz00RS8
         GcBCrI/eGVqXgJa41vBvnvnrVqUdHHl5tdKQgO62tbZ7zaGjCXG8jRLY2KXpEg9Cafyi
         F3rRyqiIzDyJ7lXZmhRFwkkTFH1ZNEB2Fx26g9t7Z56eLx1hthODRXG69Ro6i97bEMCk
         TtXb9CZ1Vi+AD1Mj88XbivvmOrKeaVTVudNJpl9Cn8tEA7Zu66pEIXMWu/1+8VUyuAtr
         NWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540903; x=1795145703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPZ3HOktLUKO7C6+7rK8PWwT7CibQnKEc7TizM3393o=;
        b=lnev18FTWwGOO5csI+oFzM0SMABJuwG7zW5n2beQcinxqI5CMCZXhu939TapzyXULb
         WTV0F7t/zkrKZvI15Rx94RIrEvODR7F1GFtgzqAk01BkwH9RobyZR6pgAvlTjp3yNUag
         Kj9Bk5NiJBgSLZ0C2QwLNjfpJSYFwzvCP7lHSvSzf38QP3NEY/yMjOFe8YJbslVHuzA0
         k1pTrLCtFNuBPCimxXxu4wEZZvb6tgKzeJtPyNw0P/3GuLGNvzdFE+H8E0lXDq3e7mjD
         kdFUXPuxoylZMAeS+PXbRBvNGK2jTbSwxud1kZsI3lDM7A4kb62LynNUDF/GgSvPkjFG
         exuA==
X-Forwarded-Encrypted: i=1; AL+hErE/fBJQZRzGFF029e7TrvE7amD2hgb5H5rnqIxxdITy70Ix4JKLHKELYvTqLsGiBJbz6ADBUZ7m5lE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QTaIlVO2/H7oW3VWdqxN+0yte8uRmc41X+1Io2l+Ke8/yBrWz
	ZI80WWvzLUaOrgPlo/44neQqDj6C7a8yojZXDI1NF6TwY2XcyJAP06fqHd3lFMzgkFssA1G9uB3
	8uGJExyIpiV2CqoOx54HwzUWWfRN/hV3rqfQ9Utdf3Hz6cF2Zrh3+9iTxfgotcGGBPepoeAg/MA
	==
X-Gm-Gg: AYBFou3RIQ54YSL1eXCbOROS8ttTGAluI5ismekqGnz41CzHI8DZet2oK1+X8GMMOaB
	c7RgVl3gA/Os7WFP7AlZaQiAcj1+OovzW/lfDXn1RnSvXyn0eCAmDGAOl7kxQotNqSiD2fqIFNu
	CWF768rArG7B6Tec2HbONliUJoH94WjaXe8ASo6rBEJBMKpAEUMunIJYhVypGMXH0y20wscw/At
	rGC2yFmcVQLXyXA1kP1US1L0CfMBKZsee5xdIZpBDB4yNQJvBh0Yge4+UXx7BP5+5cOmTdW+6JM
	BtyP78DVXlbRPvmIo+nqIPUSK6HTuZu5WPzWw7tE2WonZxsvfEssEjh5RQpsIOcZLvEm92eWRKi
	WY81Me+iHLERaK0rKQEfsRenVdpiOXlNDmjkg/uA4CJEq/VcL6dhiKp8w4jC9Zoz8B3LzNA==
X-Received: by 2002:a17:902:e882:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2ee0da31ea2mr13290255ad.7.1794540902735;
        Thu, 12 Nov 2026 19:35:02 -0800 (PST)
X-Received: by 2002:a17:902:e882:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2ee0da31ea2mr13290065ad.7.1794540902273;
        Thu, 12 Nov 2026 19:35:02 -0800 (PST)
Received: from [10.235.8.108] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e4e47sm3464175ad.38.2026.11.12.19.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 19:35:01 -0800 (PST)
Message-ID: <15996045-3f5e-4680-95f9-925c97301ab0@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:34:53 +0800
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
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add NSS clock controller
 for IPQ5210 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-1-7e2c1dda3ed2@oss.qualcomm.com>
 <20261112-wild-accurate-cockatrice-a80efa@quoll>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20261112-wild-accurate-cockatrice-a80efa@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af68567 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vjzNbMJ68Ufz2hOSJBcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMyBTYWx0ZWRfX1wf4iKanjDxc
 iUsrVHOURM0D95zpzD5NduoEM1H0JbCeX4Dv8gGDe0i90HuHWiou4DaW3a3F+eSqK7qWAHZrvBI
 rABlZhmGdemuHfCFWnCEGb34PWj2K8HFA8ckiO1av8jL7yLQV5wcxCAU6vSKGIYaGz8EqAlMTvf
 RzVp2EvLt/Y6M0qtyu/J4MfGLEsnhSOWxjfiXzzs0XZYE/DTqrZVAJGago2iC9IO/plCGYPzZY0
 1z74kmy291v87Ecdf3E5G8ymo8oMYeai9ppdDJcGy/pnjVXMarhCrA/ROlUXAifvSgKt83+hqDb
 wMT6Cq9KmUF/plk5ajdrYkaywEeMhisZbS+OGPbciSGiNUCqhEBAVN0xypPf+Ke/FZXJUJZo01n
 WhCWojXz6qFByBjASEvWfvzj3A4lDWoRuLYOhyzm7BdnjkvJeyc09vDSe3sD4jnwnQ2wFtymBJd
 trMtKsGWPVGpxAw6jiQ==
X-Proofpoint-ORIG-GUID: 7nh096GbVjZ4to6WawFlbKi-Oxxl8U0r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMyBTYWx0ZWRfX8dckyf6rCYeP
 o36zp/rfH7ILbm0oQEvEu1Y4Uz50MbyNhroPh1w+R0+kgAi19pOQzJ1NWSAiryT5tvp20R+81G1
 6GY/lHdyVQoo6elYcpIyafBtqZPRq/4=
X-Proofpoint-GUID: 7nh096GbVjZ4to6WawFlbKi-Oxxl8U0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130013



On 11/12/2026 6:57 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 11, 2026 at 02:00:55AM -0800, Luo Jie wrote:
>> NSS clock controller provides the clocks and resets to the networking
>> blocks such as PPE (Packet Process Engine), UNIPHY (PCS) and EPHY on
>> IPQ5210 devices.
>>
>> Add support for the compatible string "qcom,ipq5210-nsscc" based on the
>> existing IPQ9574/IPQ5424 NSS clock controller Device Tree binding. IPQ5210
>> additionally exposes a pair of EPHY-RAW Rx/Tx clock sources used to derive
>> the clocks for its integrated 2.5G Ethernet PHY, so extend the clocks and
>> clock-names lists with "ephy_rx" and "ephy_tx".
>>
>> Also add master/slave ids for IPQ5210 networking interfaces, which are used
>> by the nsscc-ipq5210 driver for providing interconnect services using the
>> icc-clk framework.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,ipq9574-nsscc.yaml         |  47 ++++++++-
>>  include/dt-bindings/clock/qcom,ipq5210-nsscc.h     | 106 +++++++++++++++++++++
>>  include/dt-bindings/interconnect/qcom,ipq5210.h    |  18 ++++
>>  include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |  60 ++++++++++++
>>  4 files changed, 228 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> index a35bbc7b1924..dc7d90a99dc7 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> @@ -4,24 +4,28 @@
>>  $id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IPQ5424
>> +title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ SoCs
>>  
>>  maintainers:
>>    - Bjorn Andersson <andersson@kernel.org>
>> +  - Luo Jie <jie.luo@oss.qualcomm.com>
>>  
>>  description: |
>>    Qualcomm networking sub system clock control module provides the clocks,
>> -  resets on IPQ9574 and IPQ5424
>> +  resets on IPQ9574, IPQ5424 and IPQ5210
>>  
>>    See also:
>> +    include/dt-bindings/clock/qcom,ipq5210-nsscc.h
>>      include/dt-bindings/clock/qcom,ipq5424-nsscc.h
>>      include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>> +    include/dt-bindings/reset/qcom,ipq5210-nsscc.h
>>      include/dt-bindings/reset/qcom,ipq5424-nsscc.h
>>      include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>  
>>  properties:
>>    compatible:
>>      enum:
>> +      - qcom,ipq5210-nsscc
>>        - qcom,ipq5424-nsscc
>>        - qcom,ipq9574-nsscc
>>  
>> @@ -42,6 +46,9 @@ properties:
>>        - description: Uniphy2 NSS Rx clock source
>>        - description: Uniphy2 NSS Tx clock source
>>        - description: GCC NSSCC clock source
>> +      - description: CMN_PLL EPHY-RAW Rx clock source
>> +      - description: CMN_PLL EPHY-RAW Tx clock source
>> +    minItems: 11
> 
> Please place minItems at the beginning, before "items:".

Thanks, I will move minItems before "items:" in the next version.

> 
>>  
>>    '#interconnect-cells':
>>      const: 1
>> @@ -63,6 +70,9 @@ properties:
>>        - const: uniphy2_rx
>>        - const: uniphy2_tx
>>        - const: bus
>> +      - const: ephy_rx
>> +      - const: ephy_tx
>> +    minItems: 11
> 
> Same here

OK.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

