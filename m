Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682A32904
	for <linux-clk@vger.kernel.org>; Tue,  5 Aug 2025 05:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754370995; cv=none; b=PNyom+EAclXlkQtNw7Mm3pzH953RGYKo9QfFxNGs6Wh1TrKkHufE/JBMMrI5w/JoVkBMRDnyr56Adgrm+fcKOnO0FuLO6iJomuVB0zs+bLfbPXqOOeBv3IusUzYlls/3aaVJUGZG7Np/gpXk+a8wYodJ61/roN7y4nJDOm2dXUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754370995; c=relaxed/simple;
	bh=Oig3Q3hZsmlQdhFORQ72t5fDzPXNsgbDxXPWaMvU3y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSb3bwVFlGunclMXzEt0I+TPWedYAr/n44JGQIf2y1qL7bkmoKhjp63jnrRAwF+h9Pj92350gTD3YKSEiHv6ltBlT0CA3fvjIAJelZSC0MDW0huMaVaHGfX3UIWFvEFmxnuaxzaLnFwnYmuBGWXti3ezizQ7M3hHeYmUeMpeg8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkP2HQh+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkP2HQh+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574L7dh3031698
	for <linux-clk@vger.kernel.org>; Tue, 5 Aug 2025 05:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2Sp0JJ7hRolgAlgKHs4gknL
	uxQ4lo/VLiV4SU+Ip7k=; b=RkP2HQh+z4BMOxqOD7P7sW4/NkW9TPK7IOkBy5uS
	RcP7s2YTJWtiM0sc7FlIHUW4W3gmJCWt5pNDc+iF24pMBtrl2N5y/WJmGXuD8EQj
	xI0olVxVaHY0ry8XpT2IExY16wbzQc1Ch2CE68vXGVyyEnNQjhxu1esCX62zD9Q8
	qLALOXjyxEtlbR2TLkVVB2UBvglNG6LpVnAiO/k0UbQOXyRZuNnzNIZxGhxQvYtP
	EwkQAwNwseSAgy6Rg/JRcUkuemotHK5pYHm19oyWgszK7Y8V1c1R7yf3j0QoHl2w
	UdV6gsN+2Is4+N5qYfho2hRmUeJCH7HD57tYezf6deAUFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a40s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 05 Aug 2025 05:16:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e69c14e992so454423985a.3
        for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 22:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370991; x=1754975791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2Sp0JJ7hRolgAlgKHs4gknLuxQ4lo/VLiV4SU+Ip7k=;
        b=oJMjPaRMJLfJQNzB04SQ/VHDuW/6+sJr4w5l4drvyL06Wf2sruT/ws6vO+loFOiA2W
         vGXSG4hey4GKQxBi/X4fJSAjnD+DwkWa6/GyK7lHm5bBidezSeKjq1vXK4v74cTeyd2x
         S/OmIX0lbknLLfi+z2rrV1OnijGBArbQ7sre7F/9hcdKtxshauYa4LBc1czo8sMp+gTc
         E4OG97XFX/MxiVQF3kcM3adds5pBXwL6O6inTbZCMXCBE0fGRK1Gjo0RGGSUBiOCmIaH
         WASgEaT1vFhu5Ub9eoVXMLbAcTSz4eHu33pjNDMpFY9yuXYyrn4RXNXeU8oj9YN+rro+
         WKcw==
X-Forwarded-Encrypted: i=1; AJvYcCU6fZBnEGA/MNRxGsNFDUj8D7z9IHEETGS3Wv9Qt4oHmEhawRmwhiEIfxOMfJIIcVPzXW+NDZQcKkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8pgMN1YqFzfjQa7cAIpHKThQbP1Gb6eoiEWH318QoQW5Gf070
	fxWmdu5Ms1qFKruEeYZQ6JzTJiAhsP8ElSIRY+79yI6Zu+FIGjD5JrPrnRVMJbfLkJJycLzOT0N
	QS5Hgmdih5mLCPnJ4fvzHXHeHZRgtXmrbdHdTwVgwuREGKiwGeVYLCjH7mg0ugIg=
X-Gm-Gg: ASbGncsEgWDnwgg4pCXCY7drVW+BOA0nWAk9cunyLasz0TOPGVZ1ejV5+l/LX+9EP36
	G0QAgE4emP9L9gvsPlKhyIAF5BMyiFEwLLUUM/f8H8SOPpptrs852x2ooEfdfmWMqGjRTd1hlvi
	0iJua7ZxDSOyNK9fBrWah0JOpq7vUXOQ0s8y5Bm5nQ8sMmxiGc13enN/cV2ora0FWt+BKBSHWHD
	MeR6jlrE1BmV1HBezV5orWv09/MFTcQwIeAOi8i9yR0AeqJTLk6dyuPxdjQUIWjT5Wqk1OICc70
	PyK5pS4kUOyOAdbNFX+ffCA6+hVjMckTG/iXWt2uBXmE3Ww9lXuravZ2i1nPdRiebgGC4QZ/rtL
	kSQ9xnicVKaiXcx60TnUVQGm1odnpi8XhbHtigmiNvCAU1aDdUUwp
X-Received: by 2002:a05:622a:4cce:b0:4ae:f1c6:ddaf with SMTP id d75a77b69052e-4af109acbbbmr196148791cf.21.1754370991446;
        Mon, 04 Aug 2025 22:16:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoJwGH8DESoTEOJWJaexUrrK5XOe0roUw245sEJWDUswWWIFDABMaD+GvDrofNEWtsRroi/w==
X-Received: by 2002:a05:622a:4cce:b0:4ae:f1c6:ddaf with SMTP id d75a77b69052e-4af109acbbbmr196148501cf.21.1754370991032;
        Mon, 04 Aug 2025 22:16:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca334asm1829494e87.131.2025.08.04.22.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:16:30 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:16:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        ilia.lin@kernel.org, djakov@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: ipq5424-apss-clk: Add ipq5424
 apss clock controller
Message-ID: <4jvbnswz2445k67hy7xo4t62zevelk4bond2bzgjnsuzf57ah2@mmif5he65o6k>
References: <20250804112041.845135-1-quic_varada@quicinc.com>
 <20250804112041.845135-2-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804112041.845135-2-quic_varada@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfX+tYkdf0tdLAi
 hTzf9XbDbArc/UHBZ7NUGJ52kCsf4P709QcQbWet9DQxoa/erHC4OdnE9/1a9h4OSpGeObaSRQI
 WYw2BOs4Glnig3kwuJSu8ip13lrG8NdAGhcdSlcJjEmxOZseDvpaFV10ITd7sHICGHHZpcMPTKQ
 HITmq+r4V3T/mWmNlQJb9MrERek398V+mWe7P8JeuuZIDH5kB6lruDQKox6MvlaIajLVsZusQwm
 1bSYWq0Hyw21jBjb8vLkwL0M8Mq2AC1SgIdFreNCfwHL57eBAbSYZNGR1OAYTccPt8+syqHuVJ9
 gcUjz6iGZStbkjCFSLhgQkv/DPUPQbOKphrRmriMPL41b1l/8NQT096pxFThsuf25Y3hFJNJiM2
 +4GpS2uxTQa/M8HBuifdfiVseHVrfBqLCQwpiCnguOA2y2P3r3K/0Iw8xNMi4q3NxAO85+d2
X-Proofpoint-GUID: 0zcIC5ewDMQJ0dVqNa_b5zxZjApfgYAM
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=689193b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=i0r7BDbisMXdHKPMmEgA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0zcIC5ewDMQJ0dVqNa_b5zxZjApfgYAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050034

On Mon, Aug 04, 2025 at 04:50:38PM +0530, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The CPU core in ipq5424 is clocked by a huayra PLL with RCG support.
> The RCG and PLL have a separate register space from the GCC.
> Also the L3 cache has a separate pll and needs to be scaled along
> with the CPU.
> 
> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Added interconnect related changes ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v5: Remove previous maintainers
>     Change clock@fa80000 to clock-controller@fa80000 in example
>     Have one item per line for clocks and clock-names in example
> 
> v4: Add self to 'maintainers'
>     s/gpll0/clk_ref/ in clock-names
>     s/apss-clock/clock/ in example's node name
> 
> v2: Add #interconnect-cells to help enable L3 pll as ICC clock
>     Add master/slave ids
> ---
>  .../bindings/clock/qcom,ipq5424-apss-clk.yaml | 63 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,apss-ipq.h     |  6 ++
>  .../dt-bindings/interconnect/qcom,ipq5424.h   |  3 +
>  3 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5424-apss-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5424-apss-clk.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5424-apss-clk.yaml
> new file mode 100644
> index 000000000000..0154016075de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5424-apss-clk.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,ipq5424-apss-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm APSS IPQ5424 Clock Controller
> +
> +maintainers:
> +  - Varadarajan Narayanan <quic_varada@quicinc.com>
> +
> +description:
> +  The CPU core in ipq5424 is clocked by a huayra PLL with RCG support.
> +  The RCG and PLL have a separate register space from the GCC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq5424-apss-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Reference to the XO clock.
> +      - description: Reference to the GPLL0 clock.
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: clk_ref

You should not need clock-names now, please use indices.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#interconnect-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#interconnect-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq5424-gcc.h>
> +
> +    apss_clk: clock-controller@fa80000 {
> +      compatible = "qcom,ipq5424-apss-clk";
> +      reg = <0x0fa80000 0x20000>;
> +      clocks = <&xo_board>,
> +               <&gcc GPLL0>;
> +      clock-names = "xo",
> +                    "clk_ref";
> +      #clock-cells = <1>;
> +      #interconnect-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/qcom,apss-ipq.h b/include/dt-bindings/clock/qcom,apss-ipq.h
> index 77b6e05492e2..0bb41e5efdef 100644
> --- a/include/dt-bindings/clock/qcom,apss-ipq.h
> +++ b/include/dt-bindings/clock/qcom,apss-ipq.h
> @@ -8,5 +8,11 @@
>  
>  #define APCS_ALIAS0_CLK_SRC			0
>  #define APCS_ALIAS0_CORE_CLK			1
> +#define APSS_PLL_EARLY				2
> +#define APSS_SILVER_CLK_SRC			3
> +#define APSS_SILVER_CORE_CLK			4
> +#define L3_PLL					5
> +#define L3_CLK_SRC				6
> +#define L3_CORE_CLK				7
>  
>  #endif
> diff --git a/include/dt-bindings/interconnect/qcom,ipq5424.h b/include/dt-bindings/interconnect/qcom,ipq5424.h
> index a770356112ee..afd7e0683a24 100644
> --- a/include/dt-bindings/interconnect/qcom,ipq5424.h
> +++ b/include/dt-bindings/interconnect/qcom,ipq5424.h
> @@ -21,4 +21,7 @@
>  #define MASTER_CNOC_USB			16
>  #define SLAVE_CNOC_USB			17
>  
> +#define MASTER_CPU			0
> +#define SLAVE_L3			1
> +
>  #endif /* INTERCONNECT_QCOM_IPQ5424_H */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
