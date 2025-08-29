Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBD2298CC4
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455179; cv=none; b=RiXz5juNgtjWjI6+2PXZlH/7x3AQN+Nj1SnL+vZdrKV3Gx61suBhpKFc30A4UK1zePQhrHVe4TimQEpfqYSNtmZCaNtZRjWg6YTq/YfkLelEn6TFHwR6ho+5swKHqMdaRunUtWKyhQ1srXsO4WUrf+P+4QvKcWaYqGgutctwKN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455179; c=relaxed/simple;
	bh=ESqmRfPaEkfR6PdFoqiXeZ+SPkCLDFhB8f+sEh6w+2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp/gcOG86xYM33OW4cITItcc/JlVsYoCXwxbbPYClhrCta4f5mIr6tiTQPUq8gcwRIRjeYUKoWVFi0JtqggOkcMTg2+oyEELIGq/ld4t74tRn9SqJZO/6Mz8pAfd1IN6mGAFktReP6n7ohJN1om4VJJk+ZqtjUji5raPSTK79rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbWzBbgK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbWzBbgK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85ECq003520
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=akq6pTZUwGmAEW9uCIfVosrr
	ZmsXmJQUzesMSYhDo3A=; b=pbWzBbgK/cZ3pRPwEhErCVVBHLdNId4ppJxPWRFG
	11Iu7QbuYZAku2Q/l0iVQ3W5QgiXSDwnfJJ5HaZatRpPWiwScDuXYYuPx5cfEm+4
	5tErrM3S4aanHHvRRWN6x/A3huAnolbCUZGkoeINYVMP7Vst+SRZrG5zNcW0wptu
	JdpNBkN/2pMJVnXEpQV2+0wmSGKy/DHnJf7+SM785JzgNo4UTbHCX5PRRaJzi+5a
	4ZyIztbBab2dTz9q9pvQDGXh/C8ZNQE85wIL3GKSieXsT+xmtS4ODe0KkWG5N/Yt
	fWaY4HnYm9sfpaH0R7fqVuDoz4KAVdJ5FnPuBpGOJPxVdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tp5k36by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:12:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2a1344b36so35057421cf.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 01:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756455175; x=1757059975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akq6pTZUwGmAEW9uCIfVosrrZmsXmJQUzesMSYhDo3A=;
        b=W+OEFH9hYgXe5Tlj9z1uhsgDiSFIA8LwNxw2YLTNLh4N+BNPnQz+mhm/rtqXH4518R
         M4GlzpBMefY+rJ1Q4GZedzeICP7x52WwwGc4hjuPkJWGTetWCekL05oWTToJI+XKSALH
         4n/PNkYGCQI44hNR6Bgz+wsuWKQwlaRvBB3w7przJNHUgfZW7E0YKdQYf6dgWLWtDDYP
         rWnGbmct3ortj0j03vhRR3CNz5HEx2e5cqldKqstygvAYj5y7HyW3CG3mOwDiXw6cKKA
         DHnbssKKawhSrx1LZCN/MHMDP4b/kyK+SpdLMQvuN2uxZmLu71edzR0S6aqnO81x/aHi
         AIng==
X-Forwarded-Encrypted: i=1; AJvYcCW/n1U6SyvTFMAU8wZ+O1sYxU68oZLKGEN/yPHrUsDlAKB5Wbc6k7PDsFESmEE5Nh7NpWxvWmZzmO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJKlrLvCcpMuSZ0fUMH8ePye9Yij7kPdLuNhoEN87dX79rGLtG
	uO0xVd1LIwUVmD3zT2yTWVd+ZDrd5vnIHTj0YmB/OPN1ovDOo9jh+AavG0xTSjP4FFi3WyOskdn
	g9h5p1jwJ1vzJf1RXfbG8IjgOvIKAi64X+1XqsZFvK7pO5+vTpyd+uvay44lWhSI=
X-Gm-Gg: ASbGncsLPIzkoV0tnGfvhoDUh9NQp2+UGEgRKyFyqpTP+CYtaWAuRLGxvwWw/NLv3+g
	LqjM9QXfa9D0tRXZdK13cvGcAXzSBeMOQwTAwSQW6ByYSsom+0XdQHOW3s8vP5bklqZHAL3xXVG
	OCsgBRmo1TwWruOe80oxfqiNcB+SLFTI8CphOhDPHxmXs0Q79P3ySJdJDbkgigoHVy4cJnRKmdp
	f35QRFR1oVZWITB4AbCJrLWywJ9Qs9scno2zUkdbvfsnRbgUP7iFTEAC4wxWbDl5yushvPp8J89
	b2D60vzfc8nlt51Ijk29pO1em4Wnou3jwMYDngTYpUIePRqrFgP8Z+8/Lsx0LOxa7WhfOjVJShQ
	c5c4soaYZYCxz6KnmFDP7nPz6JG/U8xPr/VF+ooPL15Y9oWzwWy4P
X-Received: by 2002:a05:622a:16:b0:4b2:8ac4:ef74 with SMTP id d75a77b69052e-4b2aab27b68mr306580491cf.67.1756455174780;
        Fri, 29 Aug 2025 01:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBGKTRZTpOuOpXVxyWJk8JocPYSqoAYxG868i8f6qtyGtaJh4NBuDYynh+OGgpjz7v/Dq+nA==
X-Received: by 2002:a05:622a:16:b0:4b2:8ac4:ef74 with SMTP id d75a77b69052e-4b2aab27b68mr306580171cf.67.1756455174056;
        Fri, 29 Aug 2025 01:12:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452d6sm432746e87.70.2025.08.29.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:12:53 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:12:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add DISPCC and reset controller
 for GLYMUR SoC
Message-ID: <hpfeihpixuauter7ik6om5sv7ocmots5gq3fw7cvn5wkuieipt@jitqslr4pkw4>
References: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
 <20250829-glymur-disp-clock-controllers-v1-1-0ce6fabd837c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-glymur-disp-clock-controllers-v1-1-0ce6fabd837c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V9F90fni c=1 sm=1 tr=0 ts=68b16108 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ylH5ykzvLjK_7KeajYoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NSBTYWx0ZWRfX5AkXYEyDi+SX
 9SZ0rBeg4Jm3yJNAx+gBlqZOGq9qibEDlRVu0ifgoyRB/cM7E2fBfCpqJXpXp4ht1wdzOMoHyka
 BS1hPS6d1jTqv6K0USyZAX3hUZQzd7TKanZMIPdArV7+By89J35sJA0uxc7M09RoTwQhcDq8o92
 97G2lHd4zvUFvmLmYp++laIQe8ge6ASt2W+7JJg+l1uSW1UxgFCl2T4R+hkROBZ9DGk4r2s8ZDX
 G7mg6xkRF/OzoqRyQWI8O5PWIXHsdt9T9M+Rdq87QhV2wRMtBySZ9FMzgQWhFwYlURQVWBp50+s
 zi/RLQ2xivQFl0R/SP3yuDRNBrCWWbYbfdzS2qkokeKz01fID6lUxVpaoKZLC77yjIr3qcsAZJz
 /qryHF8i
X-Proofpoint-ORIG-GUID: o2D095Pxdip6HYhqZOQy4LQdHPnKUbQ5
X-Proofpoint-GUID: o2D095Pxdip6HYhqZOQy4LQdHPnKUbQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280095

On Fri, Aug 29, 2025 at 01:28:03PM +0530, Taniya Das wrote:
> Add the device tree bindings for the display clock controller which are
> required on Qualcomm Glymur SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,glymur-dispcc.yaml         |  99 ++++++++++++++++++
>  include/dt-bindings/clock/qcom,glymur-dispcc.h     | 114 +++++++++++++++++++++
>  2 files changed, 213 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..063da2416dbaed764b8579a090bc5fc0531ab60d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,glymur-dispcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock & Reset Controller on GLYMUR
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm display clock control module which supports the clocks, resets and
> +  power domains for the MDSS instances on GLYMUR SoC.
> +
> +  See also:
> +    include/dt-bindings/clock/qcom,dispcc-glymur.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-dispcc
> +
> +  clocks:
> +    items:
> +      - description: Board CXO clock
> +      - description: Board sleep clock
> +      - description: DisplayPort 0 link clock
> +      - description: DisplayPort 0 VCO div clock
> +      - description: DisplayPort 1 link clock
> +      - description: DisplayPort 1 VCO div clock
> +      - description: DisplayPort 2 link clock
> +      - description: DisplayPort 2 VCO div clock
> +      - description: DisplayPort 3 link clock
> +      - description: DisplayPort 3 VCO div clock
> +      - description: DSI 0 PLL byte clock
> +      - description: DSI 0 PLL DSI clock
> +      - description: DSI 1 PLL byte clock
> +      - description: DSI 1 PLL DSI clock
> +      - description: Standalone PHY 0 PLL link clock
> +      - description: Standalone PHY 0 VCO div clock
> +      - description: Standalone PHY 1 PLL link clock
> +      - description: Standalone PHY 1 VCO div clock
> +
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +    maxItems: 1
> +
> +  required-opps:
> +    description:
> +      A phandle to an OPP node describing required MMCX performance point.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,glymur-dispcc.h>

Should not be needed

> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    clock-controller@af00000 {
> +      compatible = "qcom,glymur-dispcc";
> +      reg = <0x0af00000 0x20000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&sleep_clk>,
> +               <&mdss_dp_phy0 0>,
> +               <&mdss_dp_phy0 1>,
> +               <&mdss_dp_phy1 0>,
> +               <&mdss_dp_phy1 1>,
> +               <&mdss_dp_phy2 0>,
> +               <&mdss_dp_phy2 1>,
> +               <&mdss_dp_phy3 0>,
> +               <&mdss_dp_phy3 1>,
> +               <&mdss_dsi0_phy 0>,
> +               <&mdss_dsi0_phy 1>,
> +               <&mdss_dsi1_phy 0>,
> +               <&mdss_dsi1_phy 1>,
> +               <&mdss_phy0_link 0>,
> +               <&mdss_phy0_vco_div 0>,
> +               <&mdss_phy1_link 1>,
> +               <&mdss_phy1_vco_div 1>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,glymur-dispcc.h b/include/dt-bindings/clock/qcom,glymur-dispcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..a845d76defe282d953e82e8b595433c5f9cd364a
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,glymur-dispcc.h
> @@ -0,0 +1,114 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_GLYMUR_H
> +#define _DT_BINDINGS_CLK_QCOM_DISP_CC_GLYMUR_H
> +
> +/* DISP_CC clocks */
> +#define DISP_CC_ESYNC0_CLK					0
> +#define DISP_CC_ESYNC0_CLK_SRC					1
> +#define DISP_CC_ESYNC1_CLK					2
> +#define DISP_CC_ESYNC1_CLK_SRC					3
> +#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
> +#define DISP_CC_MDSS_AHB1_CLK					5
> +#define DISP_CC_MDSS_AHB_CLK					6
> +#define DISP_CC_MDSS_AHB_CLK_SRC				7
> +#define DISP_CC_MDSS_BYTE0_CLK					8
> +#define DISP_CC_MDSS_BYTE0_CLK_SRC				9
> +#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				10
> +#define DISP_CC_MDSS_BYTE0_INTF_CLK				11
> +#define DISP_CC_MDSS_BYTE1_CLK					12
> +#define DISP_CC_MDSS_BYTE1_CLK_SRC				13
> +#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				14
> +#define DISP_CC_MDSS_BYTE1_INTF_CLK				15
> +#define DISP_CC_MDSS_DPTX0_AUX_CLK				16
> +#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				17
> +#define DISP_CC_MDSS_DPTX0_LINK_CLK				18
> +#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				19
> +#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			20
> +#define DISP_CC_MDSS_DPTX0_LINK_DPIN_CLK			21
> +#define DISP_CC_MDSS_DPTX0_LINK_DPIN_DIV_CLK_SRC		22
> +#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			23
> +#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				24
> +#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			25
> +#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				26
> +#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			27
> +#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		28
> +#define DISP_CC_MDSS_DPTX1_AUX_CLK				29
> +#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				30
> +#define DISP_CC_MDSS_DPTX1_LINK_CLK				31
> +#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				32
> +#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			33
> +#define DISP_CC_MDSS_DPTX1_LINK_DPIN_CLK			34
> +#define DISP_CC_MDSS_DPTX1_LINK_DPIN_DIV_CLK_SRC		35
> +#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			36
> +#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				37
> +#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			38
> +#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				39
> +#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			40
> +#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		41
> +#define DISP_CC_MDSS_DPTX2_AUX_CLK				42
> +#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				43
> +#define DISP_CC_MDSS_DPTX2_LINK_CLK				44
> +#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				45
> +#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			46
> +#define DISP_CC_MDSS_DPTX2_LINK_DPIN_CLK			47
> +#define DISP_CC_MDSS_DPTX2_LINK_DPIN_DIV_CLK_SRC		48
> +#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			49
> +#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				50
> +#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			51
> +#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				52
> +#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			53
> +#define DISP_CC_MDSS_DPTX2_USB_ROUTER_LINK_INTF_CLK		54
> +#define DISP_CC_MDSS_DPTX3_AUX_CLK				55
> +#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				56
> +#define DISP_CC_MDSS_DPTX3_LINK_CLK				57
> +#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				58
> +#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			59
> +#define DISP_CC_MDSS_DPTX3_LINK_DPIN_CLK			60
> +#define DISP_CC_MDSS_DPTX3_LINK_DPIN_DIV_CLK_SRC		61
> +#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			62
> +#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				63
> +#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			64
> +#define DISP_CC_MDSS_ESC0_CLK					65
> +#define DISP_CC_MDSS_ESC0_CLK_SRC				66
> +#define DISP_CC_MDSS_ESC1_CLK					67
> +#define DISP_CC_MDSS_ESC1_CLK_SRC				68
> +#define DISP_CC_MDSS_MDP1_CLK					69
> +#define DISP_CC_MDSS_MDP_CLK					70
> +#define DISP_CC_MDSS_MDP_CLK_SRC				71
> +#define DISP_CC_MDSS_MDP_LUT1_CLK				72
> +#define DISP_CC_MDSS_MDP_LUT_CLK				73
> +#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				74
> +#define DISP_CC_MDSS_PCLK0_CLK					75
> +#define DISP_CC_MDSS_PCLK0_CLK_SRC				76
> +#define DISP_CC_MDSS_PCLK1_CLK					77
> +#define DISP_CC_MDSS_PCLK1_CLK_SRC				78
> +#define DISP_CC_MDSS_PCLK2_CLK					79
> +#define DISP_CC_MDSS_PCLK2_CLK_SRC				80
> +#define DISP_CC_MDSS_RSCC_AHB_CLK				81
> +#define DISP_CC_MDSS_RSCC_VSYNC_CLK				82
> +#define DISP_CC_MDSS_VSYNC1_CLK					83
> +#define DISP_CC_MDSS_VSYNC_CLK					84
> +#define DISP_CC_MDSS_VSYNC_CLK_SRC				85
> +#define DISP_CC_OSC_CLK						86
> +#define DISP_CC_OSC_CLK_SRC					87
> +#define DISP_CC_PLL0						88
> +#define DISP_CC_PLL1						89
> +#define DISP_CC_SLEEP_CLK					90
> +#define DISP_CC_SLEEP_CLK_SRC					91
> +#define DISP_CC_XO_CLK						92
> +#define DISP_CC_XO_CLK_SRC					93
> +
> +/* DISP_CC power domains */
> +#define DISP_CC_MDSS_CORE_GDSC					0
> +#define DISP_CC_MDSS_CORE_INT2_GDSC				1
> +
> +/* DISP_CC resets */
> +#define DISP_CC_MDSS_CORE_BCR					0
> +#define DISP_CC_MDSS_CORE_INT2_BCR				1
> +#define DISP_CC_MDSS_RSCC_BCR					2
> +
> +#endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
