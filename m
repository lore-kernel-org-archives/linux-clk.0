Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999923393E
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 03:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786417689; cv=none; b=rFWJtPHARIt91KD3M8g3Yf3Qp02DrMn6exte30fTqoT2udmQEojIAPASRp6RX8QKCe/ga2qk90cKVl3ooj4sLoZsnO7DQhqP0jkAllaG0REt67OnGFsxM2SW9F3tCsC4CAvi+/N24/OcjOAL+czzOOSG9eEet20q2JkMU84QD6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786417689; c=relaxed/simple;
	bh=DlW8q4oLq48rVY5GwKZjkDvXGvkyA6zitlwCeSxMGIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rshLuuB5562OW0a/2Mb2+IGN7EZZLuqfwTqV8vDai3AnSbfvCfLmHdUa73H0K/0yBdVCaZZXLiTQfdHFHIDete+ZA6sNKQpBgxPvfRo7+ICT3Wef6rv+fzmfnlYmZ8PtgBlAeQ57SNae3OATAioWFACICO5Ms84WX+GZaemI2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkGG3wgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lh65utaV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkGG3wgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lh65utaV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMq3rR3553127
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 03:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EtmCIS8KvZUiQkn67WxkI87wxCudwiP/IcdM2o9zbTc=; b=RkGG3wgxXsXTWtu7
	BD4DPEjTV1S+NISBzO6sy2j2XzZsOnY3zpN8TjB/lWel0y/hwRSq3sfCcpFYXFcw
	DDiporaxXVImLnysslm8+Rem/AHCuCmumyMbVy2aSN7Xa3dtpbouFBFSIf4pH8Qh
	rMxzB5WpMqOFB0z8O4px1KSa4Z0k7uUnjGwmL6bLlwTFOkGVRTqqo/tdoq7e/g1v
	t36H9J+Cd/gu6wMgCIWP2Kctb1dLa2QAf8Qf7sas7eP5krgM6vu9vxLlkc38R7BQ
	Vf2+lNZqXVhpJuD0Omy656iZQ71DNUTlGHs39wBae1DCVK+UlFbDTzwbryyGVBDe
	36TFXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk0r7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 03:08:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so3189920a12.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 20:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786417685; x=1787022485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtmCIS8KvZUiQkn67WxkI87wxCudwiP/IcdM2o9zbTc=;
        b=Lh65utaV31Cooq4lUslxXbbja7kxP4xwjtHUz1MdPcpQ8Co8hw1MH7H7HF8kyDXE05
         EpMwb0ToCut8Uzr/Gs15BxmXZ1ZFMZZ9iXPsdgYqBM+FmSPK60Z6LWkXVIZ4JmLfXSEV
         trhU5yjzofxt987O6bVw4YDqH+6dvLYlxLt/H8j9eeW1JV0ZlNBSpwYXezc0NRCSBtko
         cD5CqjDvTab/zkKjqeperHP8jkPeV33G0VJKeMLpbrNTpAtnuPO+3vSe4zwNolii4bxG
         sBpPOk3WUWtWBJXlZXtcf43Ko2oSBRKV+qMbEkjrUR2pPlpasWdH46d1EzIIfuUTZZ++
         tSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786417685; x=1787022485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtmCIS8KvZUiQkn67WxkI87wxCudwiP/IcdM2o9zbTc=;
        b=olAWrICDpEUOKRaQ2Rf7ReDUfSTIZNW7dZiaot2Q8tVXbSizAlzONHi1RRZPVXZaPS
         G+OtpPwxQihgAAjyCKwkgvJU4g1cVYyzXLsgxtU6lQF3MQ7JkYDXIStErjCC5fQbN3lZ
         dgJYyOZGwarIH14FV9YdTnmgIK/+zWG6bxxnej2RNFLDNtXjlynuLC3PX6PZ/Hw5TuZR
         QAB1t5LQbSQrJScd4T3qkFpqXLfRr+DZrmSHZDry4vc1uVsMS2iVbiUWfyGJchVRA/PE
         SvZiAu+jAPL4yAW+3T3S7vGX0vOy8VXixmfvbmfYGigOA3/Glye4okv1L8Eyp+xuPwxb
         gZyw==
X-Forwarded-Encrypted: i=1; AHgh+RqMmGOP0vPhskp7wg3/tFjgJsfL0qEb9T3mvkxXo96D2VZP81PiuPKzx19mpc186n1SyN5BmyrW5fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZbvkTP7FA7UE9mR5AWj2siTZUBbQnubViCOT4V15WDl75+Opp
	FKuzTTjkZSCDPG1ROHK/kesjodSImeKyj996EgSSNHsdWcJGFmLsC8fL6TTAPrk4gTQF2V5wUgZ
	t+e7wT2RhjK/5skSIbAQ9HTa0qdzDFlhRjGz4L/qgR/HCRKcEjG8+KrQll5dcYz4=
X-Gm-Gg: AR+sD12+olbsHf/akglgf99HsA5O9Ascv9H3EOoPYKD4iViUDFANfghL8CSe/fOHQBX
	k97WBDzh5LgziVQT1aHOMzXwh4/fbYIexj9zd42NFajHY92OUBwtSKjE4Pe9mg7RZXmzJZYkDus
	m575RBHE9sTy6WF0kPlmKIS4MqN5FE2Jb9jnJ1pPr5H2fI+62w52KwCOVj8296E/KmspWkx4fr6
	6hSSKuKh7JdNRDsUjAlLo74+55FwlKKRnokgsxnZo3l19b9+1IlloEzubNWTW65sa9hmfwPc8sE
	0bl7gJYPwPxg6zFljH2lF8rbeKwCMotBqdEYd5+CfL/w0GdAYZlh4ZIVfnH6U6vL/M5uoMEAD97
	cRnklHmEVDXbN+Og/yBXxut7FUmb+dADjkDRqlR7jv9ePrNuSXbxo6Dwfj3XxR6VIWAvQIKe4Ww
	2VghHJXyVOW7e/1ICUjYQ=
X-Received: by 2002:a17:902:ea0f:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d31788ea5emr3693555ad.14.1786417685139;
        Mon, 10 Aug 2026 20:08:05 -0700 (PDT)
X-Received: by 2002:a17:902:ea0f:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d31788ea5emr3693185ad.14.1786417684728;
        Mon, 10 Aug 2026 20:08:04 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a754dsm45103397eec.11.2026.08.10.20.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 20:08:04 -0700 (PDT)
Message-ID: <c47b3af2-d265-4e9b-b843-05b5e63fe5f9@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 08:37:54 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
 <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAyMyBTYWx0ZWRfX1WP2V0t0ct2o
 2VXoLF4/pha8JDhptgJnBk4+Bo/nkXJkjzgp//reHHgujBLbHEY5K1iWWD2Seh8CqMvBVTh+qQX
 gF+pyEslPtwONBIi+e8SmOnFYfNPJtIJ00gOX3SU5kKD+HBK4PjIaKyoZZA0X4nLtNjgBi/W6LC
 KE00QPKofOHLasrKpZLSAj8aKK7K+q6fSKBdSZORyPjMyJEYXXcpH+gDtnqjF/aUTNzX2ovLPRH
 mjHrTAFt7XWqRL+qF2W7o1IafWZFoY7veOnpzYIdAK9klNwNwA4s/gh7xzvoHOP2bQAhL4f81V9
 jZeKpLpXPAAwIHT8BHQLTSIkAZWPbU7xGA2lx1mfAnpUG8iBy3GfX2tD+F3Zl6FEbiywRbd6h9T
 T+EFDyAab+nQinCcZGjEelaeP/s4IAq9540KIBWLB9tj4ZS7AoC8lmU2LcksPL+4zE6pUD81Dtn
 15I54QRk9Cz91pL3x2Q==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7a9215 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FqS0QMqP9mElqJ8EA1EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAyMyBTYWx0ZWRfX9YAsJ8hyorXd
 H9NA4x7cnPR/DbwGrYOcVO4upB7wXgHVrbzF1ZXDn244HztwpdesDgeqYl72WFEzBCBIYALnZlL
 IF5fr0U9+evl9dAHAOTETF+kVw2a6xk=
X-Proofpoint-GUID: r0FZp5q9E7sLfjHIs1IRxidx2806630A
X-Proofpoint-ORIG-GUID: r0FZp5q9E7sLfjHIs1IRxidx2806630A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110023


On 8/11/2026 6:45 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
>> On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
>>> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
>>> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
>>> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
>>> hardware.
>>>
>>> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
>>> wrapper for its debug UART, so this assumption no longer holds.
>>>
>>> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>> ---
>>>   drivers/soc/qcom/Kconfig | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>> index fd4d4ecd2df0..5b3c9d31fd7f 100644
>>> --- a/drivers/soc/qcom/Kconfig
>>> +++ b/drivers/soc/qcom/Kconfig
>>> @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
>>>   
>>>   config QCOM_GENI_SE
>>>   	tristate "Qualcomm GENI Serial Engine Driver"
>>> -	depends on ARM64 || COMPILE_TEST
>> depends on ARM || ARM64 || COMPILE_TEST
> Or depends on ARCH_QCOM || COMPILE_TEST
>
>>>   	default ARCH_QCOM
>>>   	help
>>>   	  This driver is used to manage Generic Interface (GENI) firmware based
>>>
>>> -- 
>>> 2.43.0
>>>
>> -- 
>> With best wishes
>> Dmitry
> Hi Dmitry

Thanks for the review .

QCOM_GENI_SE is a child of "if QCOM_SOC" which is the menuconfig entry 
that guard (almost) the whole Kconfig, and that is already "depends on 
ARCH_QCOM || COMPILE_TEST".

Regards

