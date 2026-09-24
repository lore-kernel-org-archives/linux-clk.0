Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47020442105
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240178; cv=none; b=bmh2AaQbqcBQErV5p3IWVae3+9vJaMx1kje27KrfDVsN4RVfVWVGNRWgf+vLVo4owXPbkuGsZlUDHBCih9TGj1OJgwDlBSaz/mlwhIsLDlauqAFBtVT3Un8f5XaqJ8/nnsNEz7cZNMDJei4HbQejH6TVVhjHJSPn0ESWjKJUqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240178; c=relaxed/simple;
	bh=Nup17ENEmXpV9ZwGGRFtcICN35ExK3wjqeYVDJVYpJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbTe5YEr2YV6E6Gm6vhKxJGtuxVY1Jj1/PqjFuiuW4RxCahoCn8lyqrxuRv/Haeyu76yHHO4yJI3ebVwPuXhqIeME5yMNyUvzw0skQQNeHKPpQvs1vFsptZHQskoiI4HxLggHAqNpGLi58IRGfYtB1NvcOCYX00EfF6qGls5DzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTX7ktsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+Y6g8Kj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTX7ktsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+Y6g8Kj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eOQZ582526
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bxt3q8Jtf9Fw4kHeMbUugrOi
	qJ2FR8QUG1VRmITBYC4=; b=XTX7ktslLowmfmnbQRFjDshYze/T8wCX9Z3ayS9n
	RM8AmilfvLS5mKnFr9QdowjTr1baO3y2sZJhPlJ0G0V6twHbapqcTqvHWHgvroDl
	gnRqAvTzQmzxrrkGxboPeRvV24jiEP/YMpcVOmDcgFwkxv7MgXPQ+8cNvXewdJSB
	g3xHyUUSIcTf283P0a3njGUtZ3zeBgQcYyG0lWGAMoenEKKxlIloWA8lXNPdbliO
	RFfvh3f2RfyRUp8NwUS15x3o0uhwvlAqjFnUxv0PLTh57TlFXXvZkRPQR55gw/oD
	lwjJw5i6AQ76aZmnxLYHbhz2IB0kCCscPCEywrGdWDtjYQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwm6xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:56:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1431ba79941so2197179c88.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240174; x=1790844974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bxt3q8Jtf9Fw4kHeMbUugrOiqJ2FR8QUG1VRmITBYC4=;
        b=e+Y6g8KjlXDyC4VC3i84Vzxq4QUFlbSN5Xr2b3ZE3nTyWuS5gOkCfllzcv9ihGX9VH
         Q0UPQxR6F8+pw1bHKGyxD4UDD9k2uzCDwgsbWt/y6MI8o4F/F6XDes36QGXG4kZ3+pti
         kutcPP6e7terVWH/P8br2ziFKwqPRlt0Ys8OFUL9jdc0YH+dhTcZ28Ast3tUJUeGiS21
         6F4jr+CblJKrpc4FanmHRzo/Ob9cPkwxlJpaiNyI7sI+uuYhifIYB0fJb4/IpzqFX0kP
         5F74F7Ei8Y8Kf3CPihFtiTATYuUN4UJEH2wdGwJqnDIq1bImhbWmpvl14ShjVM/zw2Cp
         mT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240174; x=1790844974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bxt3q8Jtf9Fw4kHeMbUugrOiqJ2FR8QUG1VRmITBYC4=;
        b=B6qKBHBDEzd2MURclVHs7N3LuTzmwX7CD3d34Rkapj26xj0HK8Vr4wDZfsBe7TN5gE
         UkBOphikgvaIfIxjcRDGn/7MUXDr0EkXJF0OfyBcq8mKzrS296fwJH5ZDsjPO1w7cdpq
         V4+h7MHkZnWyv/TnCIC8I3eyhtrilUeR4w9MsZlrHwtGnkD9TtjmEAVdnCZGbg/kjIHz
         oTtqg8L5kyw87JQxb+soIVYLWapTtQjCSXWE1Cy5c9oPew6TBSRQc9CacVudRK9LZGtw
         gNQWok3MlcgxQvKEJ/doFg7EoTSYeS5wKn3B44hDKr+igHTwJma3G5LMIoDft0HnOamd
         Y+sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCWdoujRKsxZDnjn98GCBGLj65OMnV6H5j1e3miE0p7a3tpqUt8GwI/KTxXlsqO+PmefHbDmdsRFU=@vger.kernel.org
X-Gm-Message-State: AFuF++lyS6IVqcObCieJLLnfqRH38CYwhLiq0ReKv95yQ6rCmTLjYY3C
	75oC7pfIMDSyBh040CL5CYKcc+4Os09lwg2v26NdsM200iYXgfFrZ/GiLD5lA5Aj3ZnuIUDv+wS
	rCltJ81Qt0QVaVj5eWVGuVRjKMyQK2VBeLJ5eJrY6zzqBccOhMRG3fDaR+mCn9es=
X-Gm-Gg: AYBFou37T2zmiIxbOx3QyB8xdAtnhUSup2uocNxEj0LdPbIVv5oRu1Ln3wIaAKK5Z5p
	4BT7CsWp4XtB0u0Jou3vEx6Me6awiR2ShwdE6Aqv6/oUduwwtxot9s6d4cn/znR+D7S0Ve3v3SK
	xdV8v5M2R4W0P/Z1pNJK2DtGOv+cLZyhZl8vDyqNeefCqNv8p6dBTdhbfPLX6LrlSHRX4O0uTj7
	X6bcnemVlCD9qv/1zQdq7YyO6n02BzrXfetys72+fKhjUokkpjmivGT6uEG4kybJbVUBt/Fm9JM
	kloW3HAUHXPBxWT+HUzMPUVhzUrUky3TQlVpJ0l/FJ6TgnwNLMzBHhGdm23flJ9jB9qkQrl67uS
	DcdGi9qTEBmJ9M2PDUTXkpvHCT64CYob74ik41CZIBA==
X-Received: by 2002:a05:701b:418e:20b0:143:298e:913b with SMTP id a92af1059eb24-145040d3ecamr1278188c88.45.1790240173744;
        Thu, 24 Sep 2026 01:56:13 -0700 (PDT)
X-Received: by 2002:a05:701b:418e:20b0:143:298e:913b with SMTP id a92af1059eb24-145040d3ecamr1278165c88.45.1790240173132;
        Thu, 24 Sep 2026 01:56:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm19986937c88.13.2026.09.24.01.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:56:12 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:56:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <arTlpnQCjyXk2clV@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX0EJl4M1JU6x3
 ImhNpukf7YKJA2Y/BPwLLH78QT/oEjOp8xb4dQEc2y+OUW6o6GwLKJg5gfrbhSwo7RjEcmHAuR9
 lXjWfAGqUasoeXLjc2+EM+LfP5YMnDqgb55XRMoNdANppG7mm18e4CXTE9l1NU/qqiWGMnrMDzR
 GeRfOB/mkhY2JeyvG+ZA56c2Lfj61u6uOR2gIgvcCfNh0g4oE46ZWOqp68BWSk74mYARWC4of8v
 T0RofHD0HQsGiIbQpKwDVGGH7fafSYXJlKOIRzbqhh2DO+6kxUrtk3sZZEHN6nPKxwLn4xNgNAK
 P/W5afqwcKaVmHLu3+2lOLSjquSBDKF1uI45DXN09TbpF9dB6XVQWzpPspOePWW2Kdz7jZ0xxzA
 5nuu2gx4ESINS49vOhZCHDkE6sAsiXvlvPoQhFKuVI5THGpxozrEMygSjaFSVPFC8ZxDQfemUjU
 5KiBTg3/ta9v4Y0ji5w==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4e5ae cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=cg-lLse-URA5QQXuI28A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX6XsuIFOdL4dS
 invaNUVNDWRSJ+zQpRNnCxlmzOqjUc4OVcnreWbkxbgxJOPuGsSXGn6OVf9T6uKpBODb4J9cvhT
 NBLpvI0atbGvcMP49KO8c7uiIA84lPU=
X-Proofpoint-ORIG-GUID: rtdqe4sgQyUZFK5LXJoMRl33AJNYteIH
X-Proofpoint-GUID: rtdqe4sgQyUZFK5LXJoMRl33AJNYteIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240037

On Thu, Sep 24, 2026 at 12:51:32AM +0530, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX)
> Clock Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e3553e0eecd5027155b4dca5c0596e3140641aa9
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

We agreed to drop " |", didn't we?

> +  Qualcomm dprx clock control module provides the clocks, and resets
> +  domains on Nord.

You fixed it partially by dropping "power" but keeping "domains".

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
