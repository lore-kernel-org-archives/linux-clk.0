Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513AD21CC51
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236188; cv=none; b=nRhz5FyviLA8PrylelrZFRB6pYv23+JSf+3tOvtNia9XVjE6xFjARVc7YCL1U51slwkEauw23kBgOB6egq9z2YlPehNCzRR1e2f8J190wmXpQxuIKNZ95M6h7t8dXBazskJgFiWeJqWb8dTrlVo6hvTYLApD/PDTipnnUWLowPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236188; c=relaxed/simple;
	bh=jzx49LWasGFGGlxR7Ivay1UaWJmdLn3HEDsV3AUB9C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXZ1fy0IXzWFxQ9hEBlDk9DIG4CZZA1JRY0vYOvDoxgo8Y8E2ericl+lzX4t5w2I4D1MA+IkJ8rqYDG/VsC9xUpL5PvuGItQ7uLryEQAiyE31JUTo5n+Au5mUXt49XoFuDzrbJSvaZGrX9tjvqTnAmtLvLih3Jl6whJZQNBOiSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3GWZoan; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3GWZoan"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAJxX2003966
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ptpi4wEY0VGWKqhP6TpsQQpNA7vOEtkh/zteGyElO4=; b=S3GWZoan6d/rpmox
	q4U0H4l9UhJz6raT1pEsDusqo+f417src7m+DQAdVZB7kQtM0gQ6fbZibMCLMqIq
	1QqgAhdm84nWqNbsz8yJj0/L45TNBFWPxv+CyUbL6Kva+qVU+6lxMl0dPitizGEs
	MCYmTVlYh7+LmkmuW4iyW1sfVK609ikHEnfRn0BgQ48Oifo2Bd5Bxo+uEwyDSHBa
	FuEKVYdf/pHAvU0XpV2a4POtgq4z2KkQNUypj7blCgJaHzEb2HhLcDvmBwXtXyru
	+PG09gTglWi0/wrXXO0K1QrGwIIE1xJJ3knryTZRJ5VYKOlPVNJw51ZLO0ht5JY8
	a+4ocQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp0k3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:16:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dfd0470485so15657185a.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236185; x=1752840985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ptpi4wEY0VGWKqhP6TpsQQpNA7vOEtkh/zteGyElO4=;
        b=Qt3vYzpmF4Cg5bItTLdSErdMkNXL7kFmpzONZUdGSVDbkqp68pb5FjHZQyB44pzRi9
         DAzrw5WlWKgocuGaHSL58PWtrEjl/ePdRV0n7EEfAy4uL3G3J8LJLfKg2aVp0zdoMTPM
         bceHi1L79it8Oss9NdsUjdkc5ytk4MZ9W1cC84JsXwSDLqbev9b+PiCjQgfTfCjdMPU2
         P2qNA1wwkIWFun7eFtYXPVJxs2e97RHOhfCNyHQrXfKD1Juufzt5RRxCi9Nt2avXS+2Q
         d/Sk5cIgAkvHiyqAmpLquqkoxbzB0YqNk9dgPoFAriVNp78FwcOsgN6sNbKOYumNXh4o
         bOdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtmlwmWvMf5zgy30Ke3vasLO2wKIbMcvVxf27O40ivk5J/HrWr91RzJxZ44hku2DeIE4858YD4RnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNB093CePytlf7X0Ptwa+cJbvl9A63HjjDg9mlyiolPOirMC3H
	t5c3opBwWmqWbirDoUJ2vn/4sV8VHSS29zmbOYwtQAdJIdFnD/sOrtNrfj03Wq3Us+nbsZUilaP
	VXgdInTo3lau8aABn++Hp81IRRal5PBEPomQsYUp8MTYgoKp+AmuajH4NSvZ5BA8=
X-Gm-Gg: ASbGncv4jvGBu9vOyX19vus1O5Xce71jLhcucRF7alsPk9o9nevv49r4zDYxoPT1pQc
	EX46zg7WPu3AQrdZGyMLKT06nOa7QZmAXIyhLdqrxsDIlgoCalJhGXjOVVaYTi7rn+8EGFP6flD
	JKrvw5QcHVk0sauprJYtjLyoCVZ1z70sobQb4NHNH1JMcTcJjQSnwENA43B7sNfBf55RLnNnMVe
	3HEnh15YDxXEX/pcnqz4FXuMo1dasFka18Xb09N6DgzUNZcIEzPFb14Mxlhu6QVvq3pvYNDwnvp
	OHgRvv6bpc0PHtRvb2+V3cPP4bqaDjmF9OO4sJ/Yy37f8zYj3IpsLH3w3lTi6deMfz7Fa8DGu97
	PTj+ebUkjFAKOoiVO7a8l
X-Received: by 2002:a05:620a:4004:b0:7e0:1c52:685 with SMTP id af79cd13be357-7e01c522468mr49298485a.5.1752236185084;
        Fri, 11 Jul 2025 05:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwKjT0BW3S+d8V+GzTuZSU/tPNQqmTbJ/pUFGmyL6fSlH8EpT5RkkPdl3aoxFddiWPJQIw9g==
X-Received: by 2002:a05:620a:4004:b0:7e0:1c52:685 with SMTP id af79cd13be357-7e01c522468mr49295685a.5.1752236184618;
        Fri, 11 Jul 2025 05:16:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8265bbesm286528966b.80.2025.07.11.05.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:16:23 -0700 (PDT)
Message-ID: <0ef83a1e-38c3-41bb-8fd2-c28565f2a0ba@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:16:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] dt-bindings: clock: qcom: Add NSS clock
 controller for IPQ5424 SoC
To: Rob Herring <robh@kernel.org>, Luo Jie <quic_luoj@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-7-f149dc461212@quicinc.com>
 <20250710225539.GA29510-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710225539.GA29510-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NyBTYWx0ZWRfX/XeVZXbm75Hd
 +3Z7YF+EPkrjr0qgmY/lDW3c53bOrxayTDjsaZRhZbvZhnSTvH/IkYVj1TEaxO+oOq5SGkKRN4f
 M074WR/FSNKew8mkQrn6IrasUZ169GQ601pwq2tnVURKlPP/emX9lI9D/IOlzHts7IfZ9Ds7/lp
 DiCjr49R65aOtRAJxZaWI4ltrsYJOHCJ4U2G+0TJLeUUNT9SZnfFL2aykan+BzTxT1/hr2HUnK3
 qpaY4N/zSCJeQW046PwrDF6bwkoQhvezwc1hHPdO5A0d/ap6iQv79sIH3GKmS8jBhO5dCBpt4Zx
 5VETNOTdcXCT5TSif1OqGr2KH9BqzUP3meOsCs4uJ2O4SPzWaBQUWMIQ4g+yTo3F3LtvKZOYG0v
 4ykF5DKDz5vbibFKyZcIZrkNajtrt3EVE8nkZOGM5uMvmYJfbjN/OjiGZ8cJCMVXyX4jmsc3
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6871009a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=AWTENMeICeJJ9JQOPWgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: E_L6TaX_4tVKI7HKexlJ6UOzGdEc5JIl
X-Proofpoint-GUID: E_L6TaX_4tVKI7HKexlJ6UOzGdEc5JIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110087

On 7/11/25 12:55 AM, Rob Herring wrote:
> On Thu, Jul 10, 2025 at 08:28:15PM +0800, Luo Jie wrote:
>> NSS clock controller provides the clocks and resets to the networking
>> blocks such as PPE (Packet Process Engine) and UNIPHY (PCS) on IPQ5424
>> devices.
>>
>> Add the compatible "qcom,ipq5424-nsscc" support based on the current
>> IPQ9574 NSS clock controller DT binding file. ICC clocks are always
>> provided by the NSS clock controller of IPQ9574 and IPQ5424, so add
>> interconnect-cells as required DT property.
>>
>> Also add master/slave ids for IPQ5424 networking interfaces, which is
>> used by nss-ipq5424 driver for providing interconnect services using
>> icc-clk framework.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---

[...]

>>    clocks:
>>      items:
>> @@ -57,6 +61,7 @@ required:
>>    - compatible
>>    - clocks
>>    - clock-names
>> +  - '#interconnect-cells'
> 
> You just made this required for everyone. Again, that's an ABI change.

In this case it's actually valid, but should be a separate fixup change

Konrad
