Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A475B3E3141
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352657; cv=none; b=XarqWKZbF+iCXMWehCckX+6sZhtXn2pU0oz3QmY6IJqnLFXaotT3X9sYTqRvUoz/TNlYA9+asAW21LPYZ/LxL3zFGAzwSpQ+FxweWUYrZNI2yq0t8Vq8PAzHBnT2WrzXpqI9srENN7PjG2cXGEssxsy3gQ0C5gGCVnakccHa1rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352657; c=relaxed/simple;
	bh=Y9LX7R9+xvJZFxNo9WMoAQ1JYWTg+bkpYQnvouL0PCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXCK6YgPcwG4c+qfpmcPVTem+KPDX77Uzk36RNa6aDIrvmkO1p4nUp7X/XJ/D9Bx1QfaW6Kd1wm5pqPJSdpzwyWxY7DPRpfhncU10PZsyQNQHzc/y37r3QIyKHTevDJK3X2/7BrGuHe4CiX+TKRF65PSz2ja0mKtjh2z2wGz4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwXJkIBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2hmzzmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwXJkIBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2hmzzmb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xovx4125437
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 15:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=; b=GwXJkIBnO8vEVG58
	EgVKlZQPL3fZjXcXGGeqWrdyqQHf2PSvtNTeBzBHcI6xJEpXstE6TNM1WZM3+xfp
	wL+98aKkeHZEmFrFtrdE37/VXOwdt2v6HHdGW4e21JkYYhGIOzPmjf//pNP7zihi
	11BuPlNvvaVOFRr8Vb6V63Xyzrur8/5Cl4OM32WChWxXxraoeg3w8+jmENmQach6
	zJy4IhqWBQWLYkrxPEXb4LKnsMZa4jhJb53upzSfB1QiUvLl1DfN6qY/GWsfIa+Q
	p0QOURpAj5f9mbKHB/gOhwuIkOroh6tfM+trwOj1tlONyZQjCJZY3RcIFvQ46yR8
	Uhi+lA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf99a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 15:17:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-611bf61a809so309998137.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352654; x=1776957454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=;
        b=I2hmzzmb0c5tUeklxalLFQJgkHKlP5H+NLomFBqSww0HYwHLUWtHnW7u8/Z/8OrFw0
         TBsNqRwAeBR/z8HXUhdnKJbD4HpNPNWO3chp+vhDGmOgf47ns4ceBbEiEuVaEg1DCsQk
         Cck4edpeHexXYWOvGuq9AAM86SyCW13ry7Xoz9X48VNFj0qefZhYCT0GIe97kZJx2QrA
         i+LOmIgVQ+NiUudnipJvqp24iNxPiD8yixO591tVChDf3i2dpJHOE4IbbYtRk6Pc4fSc
         lfBYI/kwyYxR8oXVU+DIqN3Mk9JFPhsh64fw4iJrjjji7TKOoRICbMmVi5EqTDQNKgW4
         VQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352654; x=1776957454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=;
        b=fIVruY2HNK+VvZQVqhHVmhCooV6bR3qGbyqOCuEdGtz0O8a0alHlHfz6qUaz7t+DYA
         18xX3WZNWSrdYotr+NPlGQ2wCSKI0BTQnQgvWkiE8HGlNMEXATaf2JOz5kHCpJowp76p
         +fiUtR6WJ0kVVRfQw7UQwyA/DBdRhOdZruJFG0ompMDvFLkr9geUWq1hE/7z8hj8VLK4
         VCtfuX9vRBaFTc0u6LTv47x7/MzSaot/3Hc0JicAwH6amv44Vc3p5nh08O5DH/QZpMro
         CXupJu+4oPXsebpa8IBjcW/qhceZqajAeJpQKo5tPYr6iFVqV2Td3nP5SS98eEQJ9jB6
         1Uyw==
X-Forwarded-Encrypted: i=1; AFNElJ/JcGIxQ8KQB/fw13lQUgZR+Bj5jkMRID1gF9KSxpk5dFgn0Pl9dKSjQ8tsriwJ+i/79SD9r4IvwFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8WYwP+TUjb5Vx3RnYDbMDNPcw0AtZYFLgBgjN3aDqqFr5xk+W
	1Xxk08sQjTdZnD+2MLSAFa0bqfCPc91LuWVBZkP4/jE7YznK2JPyDJKM6ewYEx43cV3u5ljhX0w
	LHqhO68QsRhDpce9g715QUSFOMQl3X6JlAYV0IIho8O5ojcgB4jequYb9xl+IgzI=
X-Gm-Gg: AeBDiesLblFJNDzhsWz7pfGTLDVceYnXDHpOMccVrMjPlF0JmvisNvZ77Zk2AXiaxvC
	rWAd2WX2KAgbq1ktgKVEQa9AAqDZ9frWbsKvpxyjfUl3lSpEaCb+nUP7ilaHgbHrgSVFGOsEeiu
	fEVOu/7whcR1u68ynYW+fLcgrgpK8JhJ7qtwgVsfDydTdlM9YaTSKEmrnhUCq0feSQkYAH5o3JM
	5unmz4Cxd14ppcXX+4+DlK/g4P+COh2FPEBBFUH5n+zJym0KzN0glGt4we9AEsuyakrYK6H+iBq
	lJrrd++SpYokWE7rAERDqUfu74Lelv3ivvg9O7Sxj4+CxTj6c5eS66sZSgwOvTY1XABdWdzDC5U
	bauxpQ4Er91T+sZ/b8p2wK3QsQKlLj8wlbChTkcAymCoGugo9Wr3PhCSRD0LbRA40dHEWHYWJeM
	/3q6KiEuWt//4lAw==
X-Received: by 2002:a05:6102:5c3:b0:604:e96f:af36 with SMTP id ada2fe7eead31-612b24cc542mr1280259137.0.1776352653986;
        Thu, 16 Apr 2026 08:17:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5c3:b0:604:e96f:af36 with SMTP id ada2fe7eead31-612b24cc542mr1280216137.0.1776352653539;
        Thu, 16 Apr 2026 08:17:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1778c3ecasm181609466b.44.2026.04.16.08.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:17:32 -0700 (PDT)
Message-ID: <379806e6-f855-4960-922f-26e3380b4afa@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:17:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DACdsDUaR0b2eFfElosdutL-TJZBvYqo
X-Proofpoint-ORIG-GUID: DACdsDUaR0b2eFfElosdutL-TJZBvYqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX7j1czU8BsGBg
 Nmt10pm0HGaWy1X5i3FN0Ez+1MAPzErXHKQfRduf7veItQ2j8YHHDVXneS8NLWSij6HZGKfNC4e
 H7pM/ZqYihr40qkYjH5p7rs8MNX6lNUQrz5K1zEDW3THZJlF91S/4DFVUwwiEHCZ/cxrCiI7a4s
 aCbnVqU8ESoH2WsrKWBtjEAnijjzp39KEYndWCyKHTyMvZC3YPjWbjjnjPs3bRva6ipNI4WC779
 /trT1er60u4L6JRGIxHBV7Lpd8LB0FSysJsGmplQc7scj7STpGJYUUKv5la3XKxZyMk/ahOkWeX
 H/We6d2aT3LktV/o/NcVv61J36BUkCU06ms6oja8Ofcetwe+RSCktcRZY631/2CiUpUUdOmMq3z
 H283QrKX+3f2S3pItz11xAjSDTqbYFpyoTgqcB4tJl1DtjnAwTQmPF4EUNrLgcdXhFbPLHLd9UK
 pLpgAxrIbdBcjJBzf9Q==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0fd8e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=HDjIzE35AAAA:8 a=PzOwlJsuetSFvmXlP_AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> index 13422a19c26a..48514c3df718 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> @@ -314,6 +314,14 @@ &usb_hs_phy {
>  	extcon = <&usb_id>;
>  };
>  
> +&venus {
> +	status = "okay";

Likewise

Konrad
