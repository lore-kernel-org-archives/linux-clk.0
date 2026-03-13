Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9937F743
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406124; cv=none; b=S3wAPZ856PhRA/Wr6C7RPvmpowM/WH4JzYHQrc87DUUCH9kq0H0ngGKb9eldxaMuuM86JMUIt+CupB34xzJyTQmHIecDxefw2jI8enhOqkd7dhRkH6CMyWcZOWw9yXd4XEuM78n7uuBVXeq3FzYDKSKt7GGK9yXuHIfZ9t+v5rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406124; c=relaxed/simple;
	bh=oA1HUDu7J0EzUYqIPlWjTJlNN1Lq2jBhBDyRPjpi30E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fng3VjGqhJ4tVXtXyKsSdTCuGBLUEKKxWL9XVKhtI4WdTVJ2yqFLgsGEAQILbGSFJg9kqWTz86SmX3eVBu2lEwpxDC1KeglRzfM0wnaD9M/ZDo5ukCwuaEAur/XOE2vGj/68JxZkHNa81L3GdYZ8zyWiwfnuzROn/wXNxW+OqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jF/YTrUP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvON8raO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jF/YTrUP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dvON8raO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAn7di2393503
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4twYBG4FHMotPQHHXZ/srRQ1AVZ46K1zBaAlMYZgtHA=; b=jF/YTrUP03S30P6E
	WMkFd5KiR0wsCCuTuXzyM2xeJGBlBf4rSs5W3L5VWLZtHkh14Oc37tc8jSHQpI1d
	1pa/HmOY1rRsuxKnMiGXEtpU4sOYMTL9uvUJ/MQmIdB/XGx2TBhpr4QO9F5wFFD1
	1hTLFhK80eVCsBNp5d7+TzzAYIbRh209kO5jcsQZnBxpfzyiYbW+WAgfO8i8jy8b
	m7umfWKwjT5K/y+V5OzKdo8nymejCm6rANk/dZ2sPUYtMaloliSkV68ovywhWtuz
	oIX0FX/+IdFPisbzY9idHEmQ8jS5Yf3u1y/Md8ZoXvg/7LdKqRgaoKpFdL/3pgSQ
	aiwVcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m8b9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:48:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd93c91075so117294585a.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406121; x=1774010921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4twYBG4FHMotPQHHXZ/srRQ1AVZ46K1zBaAlMYZgtHA=;
        b=dvON8raOUPiKITA4a/yGDuGVkts7XVMJlxJpVrpCmEIERVJuVxj0+WIf9e/HjTWler
         38YdBhVhLQMdqq3IWQD3XBl9PwrSafdnKM6+eEJZ03AcMgwZBCGZR+tA/FDXSeRiihLU
         vrTFrwqeyOXJO+9kX2aPhRYmDsTViBiDGOih6YMXA1PVv8dYGUAk7pRWasH1k3SdwPGX
         vWwx0/xgPyHCtczXowxmLe+zfjsoWojCgbE+DSuOWhZWQlUPcWSh9uLjr2IiD6falt8J
         gg2yR/vKcSd1gTKlDXCcmLcrCEeR1oSSNEGamenf97TUEQE6G/Sif93Lum5DNOGanS2Z
         yc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406121; x=1774010921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4twYBG4FHMotPQHHXZ/srRQ1AVZ46K1zBaAlMYZgtHA=;
        b=IqQFp/LpVXglnPkZmOrhsyPb1Z2iLlccgsqV0gOkxrl+wFLD6i4VCcRQEiOLlRdOi9
         PC1wXK9Dd4Uy0xsdoVZbpAEAfxTTzyBddQwDkTXoxPhCIGDSHJSLThHarK3XV0pPCTWO
         8Q4JRBJ54Gu3NFutTz+FzdWwAWB1a42ki+nv+C9Zuazp0ZEv0jSSrYjdWFP8eqQXgobr
         x9szXfXULlTXwWHzTTwMKJi0p8Po5pLB7s486JVjX6VtOFg0c7NwoGYnIGZC8IR9Zfni
         pg9XkCJLYUVt6C1/9gsJCBTKMnHgzzD5aPT5n1EEzIUv0EPNi4tg+HHi7JheNFzArB2F
         PKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlB7fQmjwU4vTwktbGScIL1LUV9S2NutRon0HJ0pxAN7gYBU1mI4XSJVm16v8+DDxAUW3hWvwaOf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW4y8Df+lJx+JQCSl66fsQ5NW66UiUBidykwLD8lz4lHOcxEFe
	wrnCWKfg1jq4Z7CqkAt3DEX1500zDZPCNlgugvgDp5qVfgWdkqqGgcWMF8BFXyuKWl6zjxAs3bM
	sTgMxHbYZO1UKsA30zkiG8usWPJmUPCEtMXJXfqFtD+fNZDItR/y4gmnJvqkKEmA=
X-Gm-Gg: ATEYQzxp3+k4TqYzrdIcgcw2hxyiHbPS+PsL/BEkWGBEein13Pwxp4cN8jAAI62yslg
	63J9IUpXf0CcibvmpteyTlEXHetxqgsXky/3m/LH3g2+Cpnpp09jgDvFm2sndw3UZAr7WFVigtV
	7kqjsTVsoICoTQ3KwXgjTCIYdDk3p0WXR2win25NXJRTALSIvJC5Glvf/mCccHe/COblotVVdUL
	aNovkgWJKr/3BHwuMQp07mvAd+BQ4IByVrp++CiDGPw3wkZC1wiUYYUaJ5Yl6ooI2Ub6b6sXz1u
	k4HmukX+hvPGOPzdmwUPwr/SldbgXrkL+Yahey2ZH2slwi/6vbSTcMsKjs8na3y2IetdHSMgsTI
	EbjRJtp7OsShK+tqt4NCPgbDJJfxXWcbHqHcZv36ZzE5Fe1uea/TFvqvc3SsIRt1ReVfRvkiig4
	DHXco=
X-Received: by 2002:a05:620a:45a7:b0:8cd:933f:d8f6 with SMTP id af79cd13be357-8cdb5a55831mr325142385a.2.1773406120937;
        Fri, 13 Mar 2026 05:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:8cd:933f:d8f6 with SMTP id af79cd13be357-8cdb5a55831mr325138985a.2.1773406120424;
        Fri, 13 Mar 2026 05:48:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cbf4879sm43253766b.17.2026.03.13.05.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:48:39 -0700 (PDT)
Message-ID: <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:48:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SZqfbLVvct46eGubhmRwCEIvTEAx13wR
X-Proofpoint-GUID: SZqfbLVvct46eGubhmRwCEIvTEAx13wR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfXytJU3Y7E9Com
 TB9QsLzr7nQCyigCgUlSeJCh43EpN5M8FaSKfXs7Zroth8K3z3kUdXmd1gkxL+ng/jYHEy5lsNN
 Air2+F2p0FIe91m1F+Yu5L9nbjpP0wS6rz3FUAdP0j/NBUDmbFYEBsETa/x16sVMs8hKRl9AxCp
 tPR/2fGrSUOZMlvErtyjpzrDPaTnUjPh3AUg8RNVWpBhCs2Zbr80+lbePJsKWOaZLE5z1BWOMmY
 /pGWLqNeOPL3rid9+6qYROBA3m1IWSsyo6SH/mPPbJCdfIRXIqQmv8AYXEUBJ3Mfe9s5lZjDDal
 Exnn7Kn0eEYlwfC+oBjaPHBX1D28uEBbUGkhDz998KjqwwMZtgLQUVbEFFqqn99ITysfhiTol6k
 ZrA70fR/FQ8TkNdaaOtY4GMI8MmNuMuZ83eqA9yzfvofO15KuBgHm6SdSDjN+kZLfiSg+yBbww2
 3KWxu7ihN9aXmMxUkLQ==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b407a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tSUffcc-zHVOQOONd6kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102

On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> rdp504 board.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  93 +++++++++
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 304 ++++++++++++++++++++++++++++
>  3 files changed, 398 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 02921a495b2cbabcbacc74fbbb99eafe1f6478ac..e7748af640cccffa5c83ec82c37aa441444c2b13 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -22,6 +22,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..3d95939785bc5bd4f510e2f992f0a1e80848c8de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq5210.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
> +	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
> +
> +	aliases {
> +		serial0 = &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	soc@0 {
> +		qupv3: geniqup@1ac0000 {
> +			status = "okay";
> +
> +			uart1: serial@1a84000 {

Please define this in the SoC DTSI and enable it via a &uart1 {} reference
from the board DT

[...]

> +		xo: xo {

"xo_board" is the convention in other DTs

[...]

> +		L2_0: l2-cache {

labels must apparently be lowercase nowadays

> +			compatible = "cache";
> +			cache-level = <0x2>;

= <2>


> +			cache-unified;
> +		};
> +	};
> +
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +
> +		scm {
> +			compatible = "qcom,scm-ipq5210", "qcom,scm";
> +		};

OP-TEE *and* SCM? What does the former do?

[...]

> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;

should dma-ranges also be 36-bit?

[...]

> +		qupv3: geniqup@1ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x01ac0000 0x0 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
> +				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
> +			status = "disabled";

I see there's only a single QUP wrapper - therefore I'm going to assume
there will never be a SoC where this needs to be disabled

[...]

> +
> +			uart1: serial@1a84000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x01a84000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";

Please uniformly keep a \n before status, file-wide

Konrad
