Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A3C4D94D4
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881464; cv=none; b=IZr/3cHILNULds7tK66tP5d94Qp3b5m1XbEydqKW+BIhk0TNwnCfQ9doBTFQCvPx3U0i6QkbaCcX60Z5FEuwqj7T0tK9BNM/p39Gt66dWycWBmrOsUj9L2xSFONEB2Uc5+7vEmfcb3fnelm4k6ggZDE6hCwIkUxcdqD+jkZ8Q8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881464; c=relaxed/simple;
	bh=l0e5f2jWVtuSG5EsoRmMeyrqbrKdMDocpuar/ayJUQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwIxthyCnE7xRzYwheGXrmddr1lR2CfbhLDB2oqgWMGSKOouXhuf2Pwj6/645Mw31tGUZOSON2bYWw0BmCJA1k0oPdauL1XUO0uT+JXk5yk/En5CZBqiqx7Zb6HSXbjhJyE62rEEK5P+cMEv4FRMUnnphYnipf2fn8zdBCo8SIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xe1rwkCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vds+4XLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xe1rwkCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vds+4XLa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088kmRp3608866
	for <linux-clk@vger.kernel.org>; Thu, 8 Jan 2026 14:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDj0SyrBKwtUZwnlbW0UelR8aNx3msiTcnFCXsLwInI=; b=Xe1rwkCwGckOz/a8
	3so8x4aVDhwiZlkEaXxHAfVRb5wKbEEeZ7oFQchh0vDe/VCC1MuJb6kY8a5oS5Qu
	1/xIQLviuBoUgLy/9gB3MuGRip+GWJRODp6NsAgsu195nTjXdfNmvm90AgX2+A7F
	+nU1NkgVuxKDOsH6cQ2QPkinJzN1ZQ1jqkS4qt/wBzVvk/lIkp6s51aG+B/RpJwl
	KFBW4kPNeNCITPRIVeNwAJvPIJzPsq9ubu/juO6YaBPpMMPMkI7jqvmO/IPk2sUt
	6GTXmYiiPWCPDr3qcLd/nReuaXi9C/VnGmditW9zNHAj/3tfFK9eXv5ZKNT3incT
	NsfzJg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg48pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 14:11:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9414fc8eb29so718813241.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767881460; x=1768486260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDj0SyrBKwtUZwnlbW0UelR8aNx3msiTcnFCXsLwInI=;
        b=Vds+4XLaBiqBdzr9iNezr3P6SrYoI38P0fFJEZMFXZ5JfN/WdpjQhPnkxZ3XbanfDd
         YKDpbfO3t2uiQsAvlf5VG2lCGQHYw4No8RldvPlw7mpcf/bFMLJgAbtucvrE9EPJ/HAl
         NZAbSWnIdlJ/U/L1VTg9UlBUmPYIPIO77wWLsnRP2pHQU0NrFySKKuGnuLO8k0ynQl7+
         RNLJ7ZC13w6HVxMpDAbwRXuUYYfETiN1hGftKQBHJakxlOK6VDvXW4XXqB30vkn0PqTO
         sPL3bAJgnop+axBj0YUTmC8lLJO8cTn/yhrQpUJYjiX5j+H0vjUabQ9Pnq24QmvZT2AP
         gDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881460; x=1768486260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDj0SyrBKwtUZwnlbW0UelR8aNx3msiTcnFCXsLwInI=;
        b=JIgAq5rO/f54fyjPNmBqbGgFd+Mv6LbQW8azsxquut5bNJe4QFvYbFdESCWN2Ece90
         Pw5mI7/6Y96KsHQlGY4DsHgFr6uwqVo2IESIcw9vyKKHIRF+ZdONupANZQyl1lJPXXoj
         0uEfhaZzvHg4Br38CD49CbgAiI8qrss4KOckh9R/odsHsyAbbcP8B58fgerlBBvTYrV7
         Y/75zt0ZuIO4qL8RIJcfOVwFTpbg1LJynlLaWwZe3y0NeRbKr/BtNr3AYNM+ri1tyBK/
         SkVSwyZV4JPY7cEYpfSwQvL/gW90dvqQFseIGMtFWxyQnbHCbgLmaszV/KrvFk3qNB5r
         rixg==
X-Forwarded-Encrypted: i=1; AJvYcCXcaADnHdPJiaoa2QrJi/Zg04pQh4+0j80cD7383YHWpX82tUA78XFLwdcSWo4N/QxyMdBDbHKVt24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxidGfRjSyg4lWuYNiYF4dEwJMXkEtO3RPYCe6xGqNv7c5MlTcJ
	pqVBuCCWLR0ZVZ3R9ldO2wfs+xKXkVtwyvG9Tq939diy9JVRbOQHQB9xGoVwaMPu7L8G5YdlH6g
	U75aPuC6jfSpJTSz9n7eb7YeIuhx1hzlUfGzeXH8RNio928cVyJ7G+TnKWwzIiNu22pzU3r4=
X-Gm-Gg: AY/fxX4pJU9CMwBo0DEOQFCSu79KqSvm1Fs5UCasXLmANcpYJaSf2t+bQ1pNG4NXs53
	CPVmurwdk+MwSWya9BoTmlpwSRAan+X1nq3eL7lxdpEgBJ8i3W4vBo1hy04L1KUpodwRbTlcuLu
	ke5h1o53aIigiY5LfmCCbrqSdKiP2Dx+UUSZEHoH4WWVSgkF1ItP080NoG6LirgTXIA6IlHUvLC
	PMf8qwhf6+IQDJ7TUoIomArPcPlzG8fbQ/i14+csvMG6a+cN/4ZizVzdZ6RzWEdlKJ72ydb0Pgo
	MhO0v5W4eQg3OGb/hOTOPTBxtNHBaAG2bByvyyhExtknCrpYsm+YrnbmI33II3hiWckRXD6l2Qf
	xckdYoc0CbmjlrOSAyJ9SjLys9vI4rFe6Sq/Ers6ZvXkbK936NnDlMYyPMBNzRtWUlD0=
X-Received: by 2002:ac5:c15a:0:b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-56347fd3dbfmr1198684e0c.3.1767881460078;
        Thu, 08 Jan 2026 06:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEijgO1jNR3691smMRceSnemB4rFBjC4LyZ/kq7RRolPPOrjZaN5nPFbUqww4SzQgZyOL1U9Q==
X-Received: by 2002:ac5:c15a:0:b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-56347fd3dbfmr1198644e0c.3.1767881459379;
        Thu, 08 Jan 2026 06:10:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27c0bfsm841928766b.22.2026.01.08.06.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:10:58 -0800 (PST)
Message-ID: <328342d6-e833-4fe7-828f-6978ae17cf0a@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 15:10:56 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
 <20260106-qcom_ipq5332_cmnpll-v2-3-f9f7e4efbd79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-3-f9f7e4efbd79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iPFtR-_AXSugEykN1-XyvhGpJ6k-Ony-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwMSBTYWx0ZWRfX9cSoAY4EqKTX
 ZVUGXvVm7QypZcsCDvlno37VJXe4Ej2vjnv/oUtLdLqNa/eoUMZiWJ1p8Z86LGFDvgWO4MV6Dgo
 fmTj76rPgywcsp/jEHhIUtnFcxPUm6a8Jk53TvjJ1zQUIsWPB6SNGtFcasc+nsUFKrNsUusuE+6
 4JQZBth3vTWBteXV5aEzUQOk6xwM4B22GLH3TZcYANmEAubCvOWBiJc9Pk64aNs5J7Kvo+iDwXE
 mjGhfxbcu6BtFyrNzKhubghyJwsiA1fZCr29xdh9lUavOEqMWVtSgaQu3E48okmZBUy780VFYoH
 zZsLGHkUbKgOBNt7kgdtTZZ2G+01YXwuwY6v/nqzf9K9g935NGyBL/XSajtzlWVxBdVAL568w7a
 rzV7aMCqWr1IzG2UuIh/chf1KyVKFmqGD0AhwYb/sdcytHjilBVJcqBbmME2E9GE2EcKcyE2D+Y
 PgfvI/ezsZNlFYujzrA==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695fbaf5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=20ciNqFLEIM2uVeCJLoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: iPFtR-_AXSugEykN1-XyvhGpJ6k-Ony-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080101

On 1/7/26 6:35 AM, Luo Jie wrote:
> The CMN PLL in IPQ5332 SoC produces different output clocks when compared
> to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
> (50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.
> 
> Add IPQ5332-specific clock definitions and of_device_id entry.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/ipq-cmn-pll.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
> index 369798d1ce42..962462286837 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  /*
> @@ -20,6 +20,11 @@
>   * and an output clock to NSS (network subsystem) at 300 MHZ. The other output
>   * clocks from CMN PLL on IPQ5424 are the same as IPQ9574.
>   *
> + * On the IPQ5332 SoC, the CMN PLL provides a single 50 MHZ clock output to
> + * the Ethernet PHY (or switch) via the UNIPHY (PCS). It also supplies a 200
> + * MHZ clock to the PPE. The remaining fixed-rate clocks to the GCC and PCS
> + * are the same as those in the IPQ9574 SoC.
> + *
>   *               +---------+
>   *               |   GCC   |
>   *               +--+---+--+
> @@ -51,6 +56,7 @@
>  
>  #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>  #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
> +#include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
>  #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
>  
>  #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
> @@ -117,6 +123,16 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
>  	{ /* Sentinel */ }
>  };
>  
> +static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
> +	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
> +	{ /* Sentinel */ }

Trusting you on these entries as I can't find a source

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


