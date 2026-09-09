Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E6477287
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942680; cv=none; b=lNPW7Lv4QnleCEw4UDaK7fbYZpSiVbkyzb1BjF8D5S+LuWGchTBhiKAOku1O2GydDL2xbrKY0cqySppkTwewDsoNlZHbahgYsE7ebkc7MGdnMckm7aCIpv81kJ8Zt959nqn0Qrhk8q1chwq0zCH1fZr00PFlazJdRxjdNRlhpqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942680; c=relaxed/simple;
	bh=rZ8DjkKmBHedyIDcWayVpq5SOsoVmYxXX7VB04WSCkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+O6FUcHHhiKa+rh1Tzb2HsMAG23Owq4TTTCn8riPit6DaLXv8eSS7lYcKQeiX4gvJUZslKRxHu5jQ7hsF038fGLRgSYRDN8oSc5a13jaGGNF1uVsyUEcjtcjl9Ic3+nE9Y+GE5yLEu84/8ojqvG8NKPSQEQK9Z2i4B76XHh8rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pn0CP8Vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VarJKn49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pn0CP8Vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VarJKn49"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6898PvO7639493
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 08:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bg/eHNRfWD3uscd40GV8QRig
	po/JtPPXEdYD1Se/H7Y=; b=pn0CP8Vi19ezKuIiBkVokjSghRGhDI8D4h5CtbQT
	zMkTS5BVsNjt2oyJ+PtZsMb9zJu88Lxj+KK0p6Q6uCVYmASChhOn/7Ch8n16iIoQ
	1DOw0f1C+3oh3JrZ1pYU3bud3zj+wCQO1L2/FpiP4kveuJhLuWzgh3rnp2AzEQlE
	BRNQfOVnWVkjw4eGfReXUMzdzF3jB9Z0VOgzWHu3hRtTzuI35cpjyYNi+hob4LN9
	qst7tzAkJcYtjge4E0Sr60uxgNFWY7kivi8Dd71zSCgDdwgr67xLwwIm+GYNl2Na
	XtPrB9m6kYQ+Wqfc9JdeiggBVPq/bIHPE0uIsct+sKnTCw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqj99pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:31:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39906175917so6633019a91.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942676; x=1789547476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bg/eHNRfWD3uscd40GV8QRigpo/JtPPXEdYD1Se/H7Y=;
        b=VarJKn49yLWvlpeYk5lP1QtpfsNogouhS2Dfinyj5UOyjfXZgHo/8vQLAygunuB817
         lXLlPET7x0wzkoymWHYHhrSFhK9T/GWov1Vci6IwydBXXBQPSP2lyPfeLxspBlhngjeN
         h6VIMQFhUKpt2ieXT9uuq6QX55vtNovjIEbIEB/W/P1H87Jl4BhtWDiMFr9qfH1bzAJI
         y6qSHTIvcs+fD+b1nL7jeR36nxpkiRqCtMVpzo7Fv9IpSt6SpcyZndQb8ss8zhqc86cw
         Q8PA7tj99Of04IV72gpoqGTCj8hNl8di6tu4ViQLH5+C3njW3OTuFZM0qIlIyVBQNoXW
         ZitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942676; x=1789547476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bg/eHNRfWD3uscd40GV8QRigpo/JtPPXEdYD1Se/H7Y=;
        b=CVBEMrMFNIXoyZU2Sn4OPPdxR0WjTxLBi5urg8dubnO9yCmBR/3MWu2iTAqBxgAhHr
         V72/tLXlAnIKnn0TjFn90sx8wK5CPVWuZEYeDFghENgmO+TwX8KFGqTHPBCSiANammSe
         JJqghm9tS/PFD1tAWCtAIbSKrWtsX/hU+SEHMdEYK7mZ3gVY0Dithk3uvDCK9tQZubPN
         gfpOjLi/+8l/WMExLjeGRwf7R7pj+ACuwBgvv7X2ZISbp04JogLEOw2VpjkcqvMSbZgU
         bC9tqqEHnV+KwxnwAW6E1Kvj4fF6HJtOncJtdGB2F91cIBqfS8TcuhqG35MM0lQNnGrz
         5T6w==
X-Forwarded-Encrypted: i=1; AKwUvBwVPdEVF62an1KyiA75etM/ioa+4eNNNU/OLKtQdvxnZwt5oL2IWmNy1qLwoYkF4B/xf+zq73XBVHE=@vger.kernel.org
X-Gm-Message-State: AFuF++l2zGjzX/qOLvz1PMDGF/TWMqHqs7Rs6uwuDabgQcwiiffWGKcB
	t/a8G6hAlSZnQGsQsFYpENMRQM4y7kJqygA9u2UdpFNjBLLpB63iyJt8gb1v3nilHg6IYZKX8D7
	nU6XxxB/QMc5rIPTxm1wrWvYR1+dH+Q5U2jHmcQ/eIqBcKBWkZhgdxs0CIyXQizc=
X-Gm-Gg: AYBFou2XY/9CHYS6B25sMvqhDxvnA8U/Y8Tx8uNSb6YnUF8YcUUlK/9DJXjjWhK+NLV
	0bh0iiE6w9lAMYlYVNaW2LWVok5vLVk1m5HdOUN6h/GPeeR8cZDHGWK7Ai5sc86gBiL8yRwpiHY
	5jKKUCLQ+HTsi8/2+jGtiBHgRMwdQOJXLiNxHWeV4xdqtG+bONLM7zASanGtCaWIsdAvKkPzVOR
	N9SiP2TdZl/4hAQSaYG0WxZB3w6b2ntzYTwPsf21kMa+WrOSiQArjwkA2vhRY2Q3SMK8N7SInY9
	u3XUG4UtMg/NRs7zTBEhTZNiP5xNPKS+m0Wq+0GUiSTsphXPc/coV8qNTFLkrqZE2xxK6R0Hdrd
	gt+zzksG4VTDuHCJ7KOq7VWVPFBmhYylDzY1wIF0j3FM=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr50788801a91.16.1788942675533;
        Wed, 09 Sep 2026 01:31:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr50788731a91.16.1788942675042;
        Wed, 09 Sep 2026 01:31:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm39776875eec.18.2026.09.09.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:14 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:31:08 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <aqEZTDMtVaGR8F6o@QCOM-aGQu4IUr3Y>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aZ3mzpji_ITOaOmL_pH83vkFNXE5Yorp
X-Proofpoint-GUID: aZ3mzpji_ITOaOmL_pH83vkFNXE5Yorp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfXxZgCgroY2uw3
 yOEU+yNk0exuIksUnu0I8Vd6QQ/Sen8O7bZGkJumKpn6pyJBEMeqUWFVu5TEIdV6w2O88GQYroo
 REOc38qrvrw1JcCgsbZ0YRW63v0BlQhD9FWFn7fUJ/xfkht2Y9Cg7+lo6uROS+Wzg1SuGm2H9go
 b5h4+QuYe4ztkw4Yo8BWQspaX6fA8UCkUPYI0fHinAAfK5oI2R8zNXoQrM0XwH7sNz631Sl3lmK
 8M2eU0GZo5ft5/60bPf6n4+t55c3ylaYNoM20jvaBlIZBmkweQQxIWq8AlgHgxLPWttn5wQaw9J
 n/4+ChQnoUFp59rR/vXhxFJyPfhDlRzLOtMAwA03heOhB0tfr9AP75xk7Lve3UHEwDgAfa9/Twj
 FK/+/aiiZJngjz5YEMBtCoPleeouKSnQcRcE6QVuXN8chR6pfhaxSggxGFxU5ZaCRj8CI3NuZXB
 lZ18E4XLh+GB1arWL7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX+kQze4+uNCpS
 /wVif5P4ZpuLUgAaSOz7cSnVIX6dlnvgHCfM2zzn98K9jRKf1BmSqAIQWp2/lG5fpXYfu+/Qunr
 R5XPHh9SjuPGNKYGLofeVOcMkSYapIw=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa11954 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=FJ8gEVljA5m4mNThiM4A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

On Mon, Sep 07, 2026 at 01:56:14PM +0530, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fbaaad1f3db3ff67589d6201ed0e25710c044614
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm DPRX Clock & Reset Controller on Nord
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |

" |" can be dropped?

> +  Qualcomm dprx clock control module provides the clocks, resets and power
> +  domains on Nord.

I'm not sure it provides power domains, as the driver registers no GDSCs
and the binding has no #power-domain-cells.

Shawn

> +
> +  See also:
> +    include/dt-bindings/clock/qcom,nord-dprxcc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,nord-dprxcc0
> +      - qcom,nord-dprxcc1
> +
> +  clocks:
> +    items:
> +      - description: XO clock source
> +      - description: DPRX CFG AHB clock from NWGCC
> +      - description: Sleep clock source
> +
> +  power-domains:
> +    description:
> +      MMCX power domain.
> +    maxItems: 1
> +
> +  required-opps:
> +    description:
> +      MMCX performance point.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +  - required-opps
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    clock-controller@a940000 {
> +      compatible = "qcom,nord-dprxcc0";
> +      reg = <0x0a940000 0xc000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
> +               <&sleep_clk>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
> +#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
> +
> +/* DPRX_CC clocks */
> +#define DPRX_CC_AHB_CLK					0
> +#define DPRX_CC_AUD_CLK					1
> +#define DPRX_CC_AUDIO_CLK_SRC				2
> +#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
> +#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
> +#define DPRX_CC_CORE_RCG0_CLK_SRC			5
> +#define DPRX_CC_CORE_RCG2_CLK_SRC			6
> +#define DPRX_CC_CORE_RCG3_CLK_SRC			7
> +#define DPRX_CC_MDP_MEM_CLK				8
> +#define DPRX_CC_MMCX_XO_CLK				9
> +#define DPRX_CC_PLL0					10
> +#define DPRX_CC_PLL1					11
> +#define DPRX_CC_VID_MEM_CLK				12
> +
> +/* DPRX_CC resets */
> +#define DPRX_CC_DPRX_BLK_BCR				0
> +
> +#endif
> 
> -- 
> 2.34.1
> 
> 
