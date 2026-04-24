Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D5E3AE706
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029686; cv=none; b=AVXUTbgA34ASBG97hcT7M84luBpJEdevhcCOuBXnl7cWV521VdWyhe/0fjAAcOfv++WvKePawHURjtlj5Jwt0AYJbTyFwAOA5CyjDyL//AGDfrfCDAAFoMLuO5x6KoK68056VulDQ9N0/cONxzn9b8Po6fxHUMcKN/Yi+1NAthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029686; c=relaxed/simple;
	bh=im+ChalGIaIVInsXlQT3TLTeUv86lRyOTZVE+XwuvnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1ooN3uppKkg4ygbal0mT/ZHJcfbYhGco4EynJTc/GdyApVONXUGDuy7PSKvud5WuGoHUDcoYRoRBuSBTyMOUQ/Dym2IV8w9/ujyTCpoSyB4swkSjvauQ4EehXjYVFuINGw3wkgmXVo3+FnCrYdRBin+RgzgnaK3NkxPXK6xIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUJPaVKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btUL+M4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUJPaVKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btUL+M4+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8v9jc2709964
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOyWIhZnTkiSHFsoDNOHhOGlTc1oeJnm+zi9QOeWcMU=; b=XUJPaVKtUKnR+iqX
	KFQiAHCD0hrZ/wlhcX5zRqEAGt/mbhARaMY/aETODhc1/DTLcm2auEJtgvYcps7X
	whrxG/qw0bCKugjhe5716Epupme2uMw8yV27sWPsiHkvHtLisBmAPV5BuXv+Eymn
	Jc5/yyCBdpOtfJZTmEYAjrvcwaS82mz80KhCKZ8ckeO1Eu7FR7uYQHqDlecm3p3g
	i0Anm8vo8+P0ILeh1Q3GtdpfbQ5If5iBZrswSfKTxOgSQ/DYS6GBUaXVAg+J/Ywh
	6tWRkNtO6iPY0aADjaI/qPyXTEBBx/6+/+e0DVgmHTzNht9ytjE7ld91OJ1tE+TO
	TY6+xw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9uumk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:21:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a016b99579so27406856d6.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777029683; x=1777634483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOyWIhZnTkiSHFsoDNOHhOGlTc1oeJnm+zi9QOeWcMU=;
        b=btUL+M4+6pEYO2qwQrDTDgCBqIw/mgu9pEfZUN2dyuv3n2xOnmNa/HUpyiMK6FGqLU
         0JTG84FwkJh3by4/IfbMMrzLrXqM7spVjszkLnyP5agOe2VzrOITboGkUBHYiv+fDspg
         7aVtWYwmOUW9+H+MP0C1B1bZGkZEozgY9Rj4Cw+IrRckIY3fwxK58u09iD/wZ94NXjRw
         0K9yHjhCKy4WzP1DQmi4DeFmPluXc3GnVcuuC28wHMIIt5NfhBj+iZ1v56QjcIH178/Y
         Q8PfjzW6q6kZT26nULqkhVdaBU9cK7zR7Nf1dUiD/g6LLt/O7G+ZKz0IViEwg8MxF3uJ
         hniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029683; x=1777634483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOyWIhZnTkiSHFsoDNOHhOGlTc1oeJnm+zi9QOeWcMU=;
        b=Cj5GAJbftP9N8gHqrpgJaViYAPWvF4lAdX7I9N+x0W7+EcAWwA2G/1R4aj9sahw/tf
         6CPHEEtepRbRups8CGXBI8PDmujHpTlqwCB5MwjNIxMLgXDilotAruH26f8TSixreX6t
         MEe9S+Qjk1EPmFoFDpPIuKIDKbUxLKM7tX44mtKXjhpuUeSJfmaxg5h3rUpVw69/Xrvk
         e1OEYR7g3H4ylN31rMF8GtXihvYH5NCDtT6yR9dG6WSzcAxq94/8GiRUKCybsyJbprI5
         gH5ubLu5nWLNynaSvchVAIb+2aAA1PIbY0/3wMEmmzVXQxdR2RWSqzqfVUupFm19SFjv
         ssow==
X-Forwarded-Encrypted: i=1; AFNElJ9/N8EwsXn+jMkIVEOxpwiDISMA7/NuI1mEtM3DDojFtZ5nwvI8c2b0IhqIaWk0KsZis7YmzwSaoTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0avWmtyIfNd5dfe/WCfHlZi7SVck7Kl96Zk5PEeqcJhjerMN
	UhhSePJbM5mA08IVJVoPooA8RSg0zuoYupTqk7/p55/Ts25ywS9ZH809jEc6daMDMdyjRDBYUs+
	6ZoDD9+bspSOfVdVggub0SjmTq0RNWRSY5pxQwFdFrhi1yNOnDOEs1Q+qFQ32dHk=
X-Gm-Gg: AeBDietYFFbix/3lGBjnRLp/fPUKCLBMNSywAK8v7s/KLVhjTltxUEaA17lpu6KrBdb
	iUMTg/71SNZ+nN1AU8BLmJe7J9dwCq4VqTyxRJNJaN9W8+fB/iiu3TTLJzNzcuxCb7XlQ6Y8EPF
	TlmvcQE6MMXQIiX+dTrzpkRpp2YvGTUhznT+qoJMGfvq/G+B4tbSJfszrQHbWb4w4n2EYU3CdU8
	rjiZSk3nuCtnQzpEXRcdJrYAMn9o/HpLv5GJY4S1JWEvDz5uH+GEWhjvmXTz6/5JL2psvxuQjWg
	WPWhGu/g30f9z/et2Z/nWqjxqFprB+searaKnwN8Ox7+AVbpgLCdXROprD9pn9/oPe9NXZrsqLF
	55iW0BgehI61/aEEoampqZTWgcHB5Rw/vV5zJRIJV8vO6T5sSpN0ZTrTuSCaTyLUmlRbaNaG5EF
	ie+Ek6Bg0g224JQA==
X-Received: by 2002:a05:6214:501d:b0:8ae:65b7:1b0a with SMTP id 6a1803df08f44-8b02806738dmr324767576d6.2.1777029682736;
        Fri, 24 Apr 2026 04:21:22 -0700 (PDT)
X-Received: by 2002:a05:6214:501d:b0:8ae:65b7:1b0a with SMTP id 6a1803df08f44-8b02806738dmr324767396d6.2.1777029682325;
        Fri, 24 Apr 2026 04:21:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba538429115sm720116366b.15.2026.04.24.04.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:21:21 -0700 (PDT)
Message-ID: <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:21:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yjSHapzTjO--V9T31dTOvGDAl3UUfV7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwOCBTYWx0ZWRfXzpeViH0alOO9
 WKbGdmzxHoK4XFdeQ4+twMwKxBd3X/XYFEdCU/qymz6KC/MOhY6wXkx7L3QeFUcagBKtMACcQdk
 54U5GIY6xKTpOSC4MCYuzwEaPkhJxd/ADws9MDfQjk5hdbuY78J2dpucoWfepsrMvSS7vUkyeQK
 Em/e5g+T+DxBPRcMOvNRoRWyKL8BooyQ5LOOGM+cpUQerrN0Pix+ygGxCmlgQJhlgu11SBnxfxq
 vLUjVgTvSq7SrIfrI+ZVyTVO8ZTQETjGJDd9MbmTUoQYZsbi8Y6eeAaiYnhtThC9E+Ez2s9X1dh
 UHxvXqKg4fcRNUFmY0AlDqQ+NhEx39iRqHb13ODCc70d3P0Tdilm69bI9RsbY/AfHHn27SnyW5n
 9F9OaSDJBogzFCnKVEjEk4ROaeFsYFuKMM4soFDDjh50xzrG77Vjd0DfIvNwDy3IlYHD5IeKDfN
 ZjWshTFo9S2Iea1qRlQ==
X-Proofpoint-ORIG-GUID: yjSHapzTjO--V9T31dTOvGDAl3UUfV7h
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb5233 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_KEJFKjczNoHN30lDmMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240108

On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
> Add initial device tree support for the Qualcomm IPQ9650 SoC and
> rdp488 board.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Overall looks good, just a couple comments

[...]

> +		CPU0: cpu@0 {

Labels should be lowercase

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;

You likely want to add #cooling-cells = <2> 

[...]

> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;

You'll need to do something like:

9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

[...]

> +			uart1: serial@1a98000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x01a98000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";

nit: please keep a \n above status

Konrad
