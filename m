Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B42388E69
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435120; cv=none; b=eN85gmZLqEcCZdYqALjz+315LzcFZ+3B1UJJNVCg5KfoWiHTh/Um+5/94GKpRWw2p0TjW42CQkKCaQpvTtGA70S9qDN5a7yUygHuSAAz9W0oBe2JWJLHvyM/y++hDMWM8TeQ/hK1t2RE3wdW7VyZ9a60s7q7DDNcrHx4R9xtckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435120; c=relaxed/simple;
	bh=ZCOByCBmJgU5tRotLIWofq3KXzb8k8G+0DVRt5ppUlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PX1sWGs1W8tNWQw+wBLSXNGoXCkCZGvFbuXGjQkryJfLcPWeTA3VLB8DFUcTEb/fEizdGLZjfiM5RTJaZRC157f0ixLvF1/sUwoiyYDxJRu7b0ihi16G8mdh0/WfeGzTMTqbLzmmJGGP5RDPBzwDF+D8JiaCj+/eafyO5e16Ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqvbxoc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdGdIrKI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqvbxoc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdGdIrKI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T0ohVR2008847
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=; b=eqvbxoc5JxzEGYK3
	Z3LPORgme9LVEUOdCg6GUesvAfbnL11p6vaWo4T0AWiul/sH4A1pp7YTBWbkYN4F
	kz0f21vgUmH7KSy0BG+uhx+0fBv92POLKFyuZnRCWIwfrdNafuMuLOutu76Bk+uL
	DoC9WkR4nSHrYJZvzp8l7pwtrR4kSh6oti/CV/KNZmS6zUN4M+yhV/S210FIT7Rx
	Dh7FyxH6kBbYZs5nB72FiMMQi6ystl75Um7QJEpaxDDYIlwHJFO80EQbnrpu1Eua
	NpKn9/14FqIW1I0ASIA8quFAyBuMztuYcTxtIFCIuX7g0+Bi/bzerxOQuwMt5oVX
	wdF/6w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx8h1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:58:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso8122193b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 20:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777435117; x=1778039917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=;
        b=AdGdIrKIa0MHJz+3HFVPxlVxBtINk9KbY19rWq2+H6KB4dNbhEmQ63WVgf7pbvYlvE
         S+czzQOCwEN90HbPorCyw9/huA6DGg6zGeJ8uGQO5avMDSqoCVF3KznjHVWHEEysFLQ7
         MKwqkjmWbyB/49e7D44N8l329vb8qSNYy7wgbyHJWpMOCisyt1dcPw0kVqIHvfDETGei
         G31Cb9kUgnhYutVZFOT9Yp3pgAtDLSegFqs4ReJYeT7JYHmZ6Uqs1jX+NvLUjkZB6WXg
         g8gE20frDp+IY6QwBT/RtKSeeOHwuboUcxmaCEq0SbV+nhihRuwukJ9HEi0d7T9mf+RJ
         yLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777435117; x=1778039917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=;
        b=HqCID7VbNLhBws03EcM79djO/IG/EUL3O+dWBtflmiP5RTnioZB+HhRaXZ0CQN4uym
         LWjHtmjoTDBL4uy1Agt0KrAUULMgGeHnfxUaSSRZvhLS/1m3OyiJx1BjxdNFab8CH/g+
         Y+V0YYHPN+I20lM6SfVUJWEc2NrrPnoqG0mHaQrkSITkETxbfakal341js3khnzw0nX4
         kD9HXoEsRjUnMfY7TkeTIxzlwg1NIXMZVVz1VkTX2hwZtow+c20zRyWJL8Fblft1AqSH
         a3nnaz3RWeOlkIrrp5fZZeWqdm4eDECxAeFvytI+9Dy4eBdkGkd3R+5YahXL3U/IDbkw
         vamA==
X-Forwarded-Encrypted: i=1; AFNElJ/gTjuA/CL6NEbARzapX3uC9Ds4F0VEiouYs8Vjt53MUu3/WSsxChm9tyyY3MzUuOi4jIspNzx8Qes=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCfFRcPKEa9I/m/A350l7hhTpr5u1/IwnlV0+TaZ6XYOQAY9d
	tKyUj5oP4R64QPj1Wa6edDT/AuE6sdHUkw62odwfLnSksgcBkZUgWk4GEcULGE/HgS8HjlB9gfZ
	YKxyWYdzN4r0onIt0vJ1AY/zuF0ATwjiArczAx2Xe29T9aqNYyY8HF7fBup5RSac=
X-Gm-Gg: AeBDiesRE9Q+/OaKGKgUPB7NTR2zrA/aIUTEBVMgpKsvZ5L1WsESWVOx/dyB6H7+MDY
	0NVFP/4CBhjNCeKi0u9EA10G10pVtm7BiSKTlZKrw60gpY5597vDSYQ6PxRWSm+JqMiZ2Bdlghu
	mqzgx9GZIZHKaFDWXNFlwIUes7kwunv8JoTku88MON+Jw1dnwREACwKk6MXACE/b6bl9gtztP52
	r0IqKjHuarHT7CyaU7ratrtDrnmmWaDq5CPeuY/L2lqY/fZgQy0I54ljCc0Ad6JLF5rmWi69zst
	UJmXKmiydJKZId6zgjRE5F1KgDnHM/XvZ1sBjIidCo0/dMpA5Yte6cUrPpUTp1xrUzkPspP7Jts
	Lp5+hrpqs954GECD6Cy6oOkCCuJ6W0U8ql4iltbkyLALcgLW4hF5jMMI/e5fKFroVczJ6fElHkw
	==
X-Received: by 2002:a05:6a00:408d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-834ea5688acmr2079196b3a.9.1777435116659;
        Tue, 28 Apr 2026 20:58:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:408d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-834ea5688acmr2079158b3a.9.1777435116101;
        Tue, 28 Apr 2026 20:58:36 -0700 (PDT)
Received: from [10.48.22.70] ([27.60.165.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed85c411sm657051b3a.41.2026.04.28.20.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:58:35 -0700 (PDT)
Message-ID: <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:28:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WJwpPpp3Ja2qkHAeM_GJ05o-mG5_F2WQ
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f181ed cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=XvYZRKXU5Z7yJT35SDuk6Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vUSe85TNU2mlbxuYXrwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzMyBTYWx0ZWRfX7QKrAYaz8lfN
 30iLDWrljbikyNn9t3FEVTKza7whgJzBCDgYNcRqicY4Qkiw18CKRPQLOUUOjNwIe/DUF7krMNG
 oOb/kUJvE24uef3NfGgHV9lPCKPraPa1m+VJiyJ3G7vR0nrbcquqcgQGn17gFjFMq0Xpb0E11TC
 2hxU6AWMdo95N12sX0PZvqh4msxTDVPA2lC1U+z1aanwQREAjlTpa/BiYMdi/lcTCuXfh+mre74
 aO8IE4NSywUf/cPEe8Tj/vlOJsryFBM4UTOt0Od66uRvAugMWYM284dB0nxc0N/SPUFMQYkytoe
 pcZEpFoUjqA3iJ3MaAMijbLk5sGNnxf4FGPNnITD2yLiOSpzgy+NgReUhJsOQu78HaiBw7ltpBj
 uNJtQ4wAxwU7syrzTCSzegXUyq+IX/1k/kH0a51E7o2DmbglkI9FQFsXrhhC7Tvmlw1SbEr/fmo
 0/ITQGAziBe36BKu+Eg==
X-Proofpoint-ORIG-GUID: WJwpPpp3Ja2qkHAeM_GJ05o-mG5_F2WQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290033


On 4/24/2026 4:51 PM, Konrad Dybcio wrote:
> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>> Add initial device tree support for the Qualcomm IPQ9650 SoC and
>> rdp488 board.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> Overall looks good, just a couple comments
>
> [...]
>
>> +		CPU0: cpu@0 {
> Labels should be lowercase

Ack.

>
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&l2_0>;
> You likely want to add #cooling-cells = <2>

I left it because to add it along with the TSENS support. Do you prefer 
to add it now? do let me know.

>   
>
> [...]
>
>> +	pmu-a55 {
>> +		compatible = "arm,cortex-a55-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> You'll need to do something like:
>
> 9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
> 2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

Thanks for the pointers. Let me check and update.

>
> [...]
>
>> +			uart1: serial@1a98000 {
>> +				compatible = "qcom,geni-debug-uart";
>> +				reg = <0x0 0x01a98000 0x0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "disabled";
> nit: please keep a \n above status

Ack.

>
> Konrad
