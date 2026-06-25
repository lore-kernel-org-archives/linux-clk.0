Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC2381B07
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377061; cv=none; b=baJNXtw1ArR+jxwOhxApCWYQXsRavIVukd1s1n2iV9zbfL57qaAtdYoBN751scSPFO7abPqpSEZh98I/MGVMG22jma7nJbaSk+RPUZGUm1HnbgF9LhejAAswbfoitVZy7dQAbDjykSCcmxVlF8lc+d3P+twTTamVUDr37KCqP1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377061; c=relaxed/simple;
	bh=7eg0kdEPuCmjJDnFXk124Q9nn/0D+ctFDpFo7bCDmrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAwHuiCstgu6pAcdy8t/hNlXom1igB5KXyCK6gu3XrJ+oIdC3kFAiuf2qd9O+IR969DGzAJdsHj1T6JlDfkwRjbRC2wEH8pYlBgCxPSm3QVyI54VzYtDc0WIhF4bXEoLo5v8G7YXxuuy7C5G55bqAoA372PclfPdrtykD28lvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2uRnliV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isduX9wZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2uRnliV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isduX9wZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3e6tG655620
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 08:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QODe9BtwCwyVTZaeScSNIr/mu9BsGdO2HvYWlim1hPs=; b=L2uRnliV82mooo7h
	2k6+ekR3mQL3OAZuan726AC7yRiLCQfn24Spz/22SIHsoUqy1zV4tlm9QTtbi0sc
	lpSiP3LgyxGf0FgpAcrtpdGdP6vhjvYpRWqNQX1QRpX9tH7k3ZXvC+9ts5RhKs7m
	eu7RGRseIRvxrB6t8Aoxzb/kYm4nSJ+z3JrgHIHxcJrF/7DAZZx/EpXFEa03n0N9
	syEM6fmTHHVCN9knwDqp+JEZj/OlqoSi4jaevmufAZ6KK4mM0xwoWH6UoDNaopWV
	ERi/MP605MJpWinslDW0JKAZeNMT0l4UN5/6IwbtyTPBkgZOJpPz309tn7EwQvw+
	3Czl7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7jfbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 08:44:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157b3e5182so8828885a.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782377058; x=1782981858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QODe9BtwCwyVTZaeScSNIr/mu9BsGdO2HvYWlim1hPs=;
        b=isduX9wZYBwxxTdJ0d9dmOSTYnRCC9msjUX2cie8b1YaY9jlNCrUz7cIErgA4T4x7j
         BMBpEe3uN5QjFWex9LfbtlpUHNgsC61rVGWOU8NBqKgcz4Z3oVoCt8XkR7/HeKtBfhrE
         KyrY5iUm0qRJNH/4MdD2P47pFyDAOzmBcee1VSDYZhyzt9boYbEBFlQZCcOHrmImUIPi
         sP8Df0yrSHrFJt2LJlyvB/dRtG7poLiprQ1aB4oIbSTqC1VJ9j4seL5Pton7rPo5COSd
         DgJ1ikYydaX4kcLunlsyEaKWECz3pPRnRgeCFHoqT5KzMZJbr8WmEy1EXPpS3sCdiFDu
         yD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377058; x=1782981858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QODe9BtwCwyVTZaeScSNIr/mu9BsGdO2HvYWlim1hPs=;
        b=PBm48RDZFZroSzWtySpGtMoWemomD7zNeVX7PdtZGOv1lNzBCSBpZNtFeh62vJixUy
         MjwIfdhSxplL0BauKfFtF7J3HmC47GBfiXhsF8uMS9RwBKxTQVui6s0zsmd3TTb6RJQs
         6hFvhPrEeXWNa/RF2SlziA0tl1l2mm/AFTpIWKkUCZ9S/CueabtBPOf0dJf+SupFNxW+
         5GswYb6gEQ1FFtvQp3f7RMVxAVowaBvm0IrgUEg0byozE2rUM1yAEyxUc0kUTvfp3+L7
         Zei7QJnh7RsBMRUPV+rQetw3guayQcElaqd79VktGawtHAV86s3dmS9WtBLPgKJYHUev
         Srpg==
X-Forwarded-Encrypted: i=1; AFNElJ/2HSoh88oftRfU2ElX96svrNZtoHXslp6TuQJLp8QsAdMVTuMr7jQncks8t5JqIUD11uUsPJntTMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyutmCmMPaGVB4NglB2oIaZJN3qCNoWfRweGn1cX7d4HcqFvboj
	KJWHdY5xPD+jxmFVvRdrkgjQGLd13/cuMMgV271PFD9u4rEmoRMwBeXz4rweoxOzBJxflNljEZZ
	rmE6nN4npPOmSVXzlk8Xa7dJWA6WLnbY8mEIZo02gDODMgYzIRTw8epibj8+qKZ0=
X-Gm-Gg: AfdE7ck9+wD9vfb5fwMvH/Btdhoo8YrgEx716wfo1obGGNMR2gD+/xj5SC/AnxZW3+k
	ZWfKLXtZuZJZS9Zq6qeCTtFlbeo3mzBe0iCN02vNT3rXGCU9CYace5dyQARUB4vPWv1dTF3P+SX
	UftQa4k41h0Qi1LdmCYHH0THhUlMeo6fVXVDFNzcVFC5CInP1mdKEoShNNJ/qqceLDP26JBfJB/
	XXJqrAnxECMLd8wbVuLvNObcGpaP8K4WyMv8sAHJXs7qAbFvJRgp0b3/xzT2C6slkX3nm+O+wwN
	QqGm9QuyCWeus89kzWhh3rvM4Na+LMPLZJvP6o38/ZhH6YB6maJ2hdMh/gitADv7GKNmCu64jZy
	JnsjlL3Y/0ENMqhCUFqOmJfNSn5ouxbzhn48=
X-Received: by 2002:a05:620a:29d3:b0:915:54b2:582d with SMTP id af79cd13be357-9293e3c784cmr129980285a.8.1782377058146;
        Thu, 25 Jun 2026 01:44:18 -0700 (PDT)
X-Received: by 2002:a05:620a:29d3:b0:915:54b2:582d with SMTP id af79cd13be357-9293e3c784cmr129976985a.8.1782377057605;
        Thu, 25 Jun 2026 01:44:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm132561866b.39.2026.06.25.01.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:44:16 -0700 (PDT)
Message-ID: <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:44:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3NCBTYWx0ZWRfX/uznNln6YliW
 1AsJQFaUrcAOgQcXdFcWaWmj+++eASPCx6u8Ic6EkIv1N0HnLln2VmRi4LBW6a1orR3g/d1aeH3
 CRCkFjpLNTHBOqN+GZy/Y7FGm22RLds=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3cea63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9L-xRQyfrTjc-s41Cp8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: aKORdkf9NGRwpJjU2XCXfbulxXFwmhIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3NCBTYWx0ZWRfX8Ic16pBeKJ0w
 OHGwqRsLhJUHO2RSek5CUkRaWJbnm1oEwfURD/LsWNFIi4Gach6wE/fFOPSr+ZHduAiAIuNvFpy
 ocn7apt3aHqtTpDXEpKCkHFmqwWgMN8i7BdYGjueHeepHI0b7diWYFCvSqawqxPv+NVzRjo5+YI
 qsMxRTeUdKd5jXY3EnlDR5/G81+YK3uJ0VYz2VTr4svelIFxagUXflv1UOqxyC1CGCZi81ZHCxo
 0zskuGzADzK3iosPfAGK/RbzgLnVIasXDs5tdyS+feHu/0zoCJOxuTwedQJ/VVtkiOloiZqlEh/
 dxDg7ezBinILHjvbWM7ppR7KaH5YwUrfeFnGKL0/kCfCM+9j96aOdvYjX6dxFBFCxHJU7rZDjRD
 Mm/IQcgwi5maXZK5TECCrD+bYyJLVppOBS6OJrTMGh+amiUkrCM++Ra9A7P4IahoDwHbpfCpHpH
 TKneAJ6E7QCGtwfhFCw==
X-Proofpoint-GUID: aKORdkf9NGRwpJjU2XCXfbulxXFwmhIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250074

On 6/4/26 7:26 AM, Imran Shaik wrote:
> Add support for Display clock controller and GPU clock controller nodes
> on Qualcomm Shikra SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..1ccb0f1419aaa34d32f3c3eaabdb8727a497b501 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> +#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
> +#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/clock/qcom,shikra-gcc.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
> @@ -640,6 +642,45 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		gpucc: clock-controller@5990000 {
> +			compatible = "qcom,shikra-gpucc";
> +			reg = <0x0 0x05990000 0x0 0x9000>;
> +			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			power-domains = <&rpmpd RPMPD_VDDCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
> +			reg = <0x0 0x05f00000 0x0 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&sleep_clk>;
> +			clock-names = "bi_tcxo",
> +				      "bi_tcxo_ao",

Is the AO clock going to be any useful? Taniya recently dropped it
from some other submission after assessing it wasn't

> +				      "gcc_disp_gpll0_clk_src",
> +				      "gcc_disp_gpll0_div_clk_src",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_byteclk",
> +				      "dsi1_phy_pll_out_dsiclk",
> +				      "sleep_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;

DISP_CC also needs to source power from somewhere!

Konrad
