Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B648E2E2852
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 05:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772517393; cv=none; b=praynJuUOu8E2xa6ywFJMoPwGZYiYbP+/K7xJUewrBoKqtPM4NrI8YuK8YKWHEEhYvLDIWQ/DYY6DqJZCuibRkjawBN+lW77P2fwnJKiSCHP4vaqI3nHQ+/T58Fdqyi6rxI4WMXk7ilEMr3+ZfuweDWTWQ8Sh+42/gyqmGvC3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772517393; c=relaxed/simple;
	bh=3bIXffY/9X2HVXQIA39mw4H/IcuURtGpwlkl8koIlMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP7DJxd9BhET4HIx5HiMfnQ96H5CDyObuXeXPFMoGeEoHq8BY8jZ9jhZVKNbeSodE6NdwqB5XDQ2z8WFxczgV66Xpo/bGyhIThc6q9AxQ+PQdIwkoRtKMiX5mZGIIvSlwAGPHx6PQOVFeQtxw9LpYL4LBnJHGWglvWXRKaFwIzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkZdqbu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzX9Joq3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkZdqbu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzX9Joq3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6233tUrP3561443
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 05:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=; b=CkZdqbu3cXsf309b
	1OkxUDCi1VpE2jB2U5FHi51pNiwjumq7GxVWzn7z//8zQ0D4kfl3te8hSE93N4T5
	LWhf+B7KcWF74PfyGuurDHDDD/y6Y6k5dJFZQ80QzLLN19Qa/oKR32m3kMBvrUeA
	VV3hixGm0uywBPQzSzQcRJpvVOvv2wLtHIioVOTXnN79emeW7kJ7tva3TXeP4Z0r
	UqjxXMj13pfBHLbcGwsibGFYdU1IcF4jJVKZwUGoTmZhQ4eCG7NtZnYkavJ+Gwf0
	cwwtpIOHqyXYDqZHrrxbM8SIsqr8usCBdGqxXMnJ9vvDhQrmzthXOJYxdSPR4qUy
	8SHkMw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bvbdtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:56:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3598ab49242so1251112a91.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 21:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772517391; x=1773122191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=;
        b=LzX9Joq3wwuk+XT3KCPFxtZmnRtoXnbSMOQDA5snSLJFljuLigv2UL7Z8ALm7YPaLI
         PWgC/rm6Jz88F0xt/9vpreiVDL8yhKtQ/7Zdg7Zgf5WK8G7iK82y8TOvW2oAvhXTL2P7
         cbvoUhqaPwOGKIfHhHWxg9ryTqW13X4h8ABJJzSEnzFbFXVp/AJBFAqQfqlxtTmoGFCC
         TvoEoZ2lASAjGGBE6qQJsEs29F8XkEZgNrOdYuePJJQXtdNoiUIwVokXX54+ceHSg13z
         RO3q9sP9drAgUHzHHNJNCx8LExgG/IndFDKmv2a+gnRHqbt9wG5/YbsqvlfYUsxNDUyI
         GquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772517391; x=1773122191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=;
        b=W/l7J6HCYQPSedxuZN4xMEYpOQClzUmh11ZL723oPEHpoNr6lUNwtvETYjM/IAD8/L
         u4ip8lCIiBhvA8GB0lZG/V2HKRDT29jO0dxZRRi6Pm4SudyYdLfhCVmwY8K2CNoTvtrt
         d94DC4/TqL0yyz84kXpJHSP5WSEw2yycj2Ol4V73p602AN+3iaYoa1pLx49gn85qdibX
         mCfS207+5rjfRy8PTDs+mlcoNrKrzj+OLfOBaCvViFiFWSHdl/S4SVsarW6UFdrg8mi2
         srPAmibHjHUdXKMWXso+E19i6BV/uT66LNbd3I8XsxKmLn7uVrN5LSX4S3c7pwbsYgQ5
         xWog==
X-Forwarded-Encrypted: i=1; AJvYcCX9fD/XPVntfiQxHukBroVJnrhPZ9r05waDohuSqKchU3vJwbj8Lqi5ScxOwpkqLLEl6DSiooh+jUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Oc/zrckLgjqkGKjsN5BcXN4bcqN35K7QqdCK75ehbw2X5cTm
	6vMjrsLyrJKhGzM9+idDbdc1WzBFjQq0+raYs6SDg319uUa4nVIcnCyLV3qcsIaymNvPR5Zp+1Q
	ul00F5bfY1M2vuoX0FJWWTlDAGncR3mNi58wHfwk76poTcSzcj0oTk0FPjaXu91E=
X-Gm-Gg: ATEYQzwEaBnt+c8e2DPFV4R7SMbEb712u5LNxAlIXtXoGRJVFiVo5P3f0uXf791nf5G
	QCuD+g3YTuqRSR4dc4qSw4xcFehgkZMRUaYlpWpdu4IB92JRagjtuPZFIoQ9MkssekyUVD6FP6U
	issXUyg9LKfP05qsMX1OJuykPS2WTaSfCr1zh7IXoaFWZHTrA0SWiKJRj6/oC0jalIv2BY7efED
	L8zWmbad1ncvZdThofuTf96SluzMNHjRyLaooIQDAyy6qqNVbrCAbXkWMwdTbH086q2n/0ZO/fZ
	S6mlPs4HSEjLuPUSEuKP5UvyfOwzx1mmvUxoZbJ3y4VMRmNyi4eKeaAKhMLlTqJuGXJo9mDeUcM
	rZcQkDcmh8jJ0nMNAhyvIZQhuL99RohnT6Nmq3/txThNPU4c+
X-Received: by 2002:a17:90b:1e50:b0:359:8812:7c01 with SMTP id 98e67ed59e1d1-35988127fd7mr5371870a91.28.1772517390666;
        Mon, 02 Mar 2026 21:56:30 -0800 (PST)
X-Received: by 2002:a17:90b:1e50:b0:359:8812:7c01 with SMTP id 98e67ed59e1d1-35988127fd7mr5371841a91.28.1772517390198;
        Mon, 02 Mar 2026 21:56:30 -0800 (PST)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c49eb72sm1199207a91.12.2026.03.02.21.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 21:56:29 -0800 (PST)
Message-ID: <9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:26:22 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
 <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yg3qpXGe0DEqNmgs4J0np0OxYf8vGxiV
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a6780f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c9pHKBabw8uT7j5izdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yg3qpXGe0DEqNmgs4J0np0OxYf8vGxiV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzOCBTYWx0ZWRfX7TFsQ2uBTBAO
 Ob8tJ5/J3V/5MvJyX1bOm7DmicBWwTrCEA8pQtC7Hnlvilj6djjTY3T1GZg3HnK8UlIdqcHX3fO
 r2Wu7IXJ5rOfVRo5uAhae5FHnIPaA+MbinjlWmInGtFOFai2J8ofemszed1q/cPqMer6gLWTd7E
 Bx5gfB6BxjCy79zu6Or2Cwyo68Iv4+LLilOAN+7bJnJjogk7+53Zyk8p2FZa7LEcJou239XVPvc
 lRzAuhbrar0MCA0c5GDrYTo3EauTF/5oQhXbmhiIVeloypc/dkgJeSCwseZy9fRaWviPcxzCiMc
 dkPhgT/8GaVKLIUk4YSaO6CCRetV5j/sI0yYhvSJJ9+Yf0KI2SqCXG2YeG1+4lBQPG/5/AYwLbJ
 kTtQBcQ1g5EKpyxdZ7Y8k8byZvdno3mNQ5U6deEDjjyMvYu8qZDRuXJW/hq0S5VLN/SMv5rz9KM
 qHw6plf3x5Gur4LS/nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030038


>>  
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,x1e80100-camcc";
>> +			reg = <0 0x0ade0000 0 0x20000>;
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&bi_tcxo_ao_div2>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			required-opps = <&rpmhpd_opp_low_svs>,
>> +					<&rpmhpd_opp_low_svs>;
> 
> Taniya, in light of the recent discoveries on other platforms, does x1
> need a performance vote on MXA here?

Konrad, MxA is always ON, and with the current clock configuration, a
performance vote isn’t required because the clock controller currently
votes only for the minimum level.

-- 
Thanks,
Taniya Das

