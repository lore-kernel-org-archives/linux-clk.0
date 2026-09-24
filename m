Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C95443A7E7
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240273; cv=none; b=uqzfFgkBfx5ggZIqJNKN0d5yAFgyNE4RU9/2+DDSTU/bVgYw08aHRmrYKnBczCZ56Jjju6r/aaop7gqwx2L0ZbWZ8mxZiCu/mr6Khd7c/DCZg1fb30Fh0aKaV5N5Ov631psCXLBJFwix6SVLtkbS+jCqSqSJ0Kx5dnp451twT/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240273; c=relaxed/simple;
	bh=LJz/KSOTCABZaiHylirxp5rJ3jxqoQE1ue/EegVJEtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0+wEJpcczfr2cXXCbTLqmNtCBJLmtzbSABIVhMhSsmUDvndQzhP7QCIH+CxmaEfim/S/DYbn3naOU1XYLB/fG8rZQUSbgZwj72ctxRAhC1RXPNfhvmQG1xmtxeg7d5Oq7Cnh1fnP4BWtKc0uAJquJ6ImxNMv2dy6H7XuzklZao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWdary7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XV4zNgNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWdary7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XV4zNgNU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBuM4147328
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcSrAyO5BfFEwnWITZtIYQDs54bU0FOaZ7vt2Uej5n8=; b=QWdary7AFiW95HBM
	qsNou5w1t3pT6mfaQKbHAdKUa47KIAXvIK7yj28hGwmfY50vn/ApknHdDBu9Wcad
	frAIbKCzxzm19FEQqs/yHYGARS+M12+A3vKLMpfsjGwpy2V85F5X8ETJ5z2njjRY
	NOLPCd8XDN+gn1hBwOHr3qUKCIk/6bUmfzIoGKNyx0DjAN7UzEC6XT256wLI1FB0
	OptREbqjzqM4prpcTJkZv7VPpdzV/NLa6tlraNB0D5CU5p0kcQGIoxQwVNCIVmMM
	PfdnNqYJMFWctXck5ynxxOn/3Q9gos2RPAKQjVHPFbtf8yWIDeHg73YfByKuHAu2
	A1WrdQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv46ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:57:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so3408634eec.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240269; x=1790845069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcSrAyO5BfFEwnWITZtIYQDs54bU0FOaZ7vt2Uej5n8=;
        b=XV4zNgNUmKPiAE9Ns+FzKjx7hGqSbLSyToRiAF8qlI811wSbQUK7JLsHOl50xWMBoo
         foCeb63xw8UPxqUCAGOD20ORFzgn7O77PqKfLTXtwz57CoYhMLWlSGMVZovGfUv4HbWf
         COfYkB/rytB9ipGyYETgSQaqGo7lENckTlzktZ49zrxq/YnRDDbXluGh26YBbGMkkDKJ
         mprRpHOKvKjJXdtI/SldT8xEE9NoM9FqZkrZydD1txrttCUawQE3+2UR7lSUbzCIkptJ
         NIu3wuPY/TJMtsnWSDDQzT7lsTz7kgSXETflF9QJOmJdEkn+t1O3jX/SaMNi1pECpfdP
         zF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240269; x=1790845069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcSrAyO5BfFEwnWITZtIYQDs54bU0FOaZ7vt2Uej5n8=;
        b=wB8Ap9tQ+rdEEWsOhXRcJ9wkHqQGIdkYBkGPTp/VVIz5exyRSv4WUbzPywd0CIwPJK
         flMQXgmOaqWd5biJJQgY8useICaZ9PmdfJv4B/LHHZbuKIzpmkaXPMJY3jWebaCoL52i
         t0JXGVoWsgEEdIW5Bm2iBlkh61urkzBvo94oI6Uo7mcAxfqx1F887M+TnO3vsFW/Uu89
         LQON3IRAWt7kIcBIMVAQqQb2EIyjXJYTtIe/V+gxSUmknqdl+q4iDsNjBME4SXNwRD7Q
         zXHcGWB6LXcXQ1QFY8C4Fu0P/W8KeMkxYConHwqHp4Ziv9NwXuiFYl8DKbNVA4eyPqOg
         GALg==
X-Forwarded-Encrypted: i=1; AKwUvBzp/DXHcwCCPDAxDVx+dQNGZKlSpcfaRPrGAJmUG5YeWgJvB14mJSqSXwEzdkIlGU/Ae3YkAEycFJU=@vger.kernel.org
X-Gm-Message-State: AFuF++no9TvkrXTOf3jrPvbHDfQTPW006I3yZnU5PzZQTt5s7dG9LfhE
	0Y4Ndx/+tu5nryKwHz6oWnDcYeKRUIrFwxzI1NCoLq8Rcn8sZ40Wbspr0Ocn+xCsLWB3et10EkH
	gg0+6zlw4ATz+LtrBskKrAnpJb4G45YeBfHWM2ixGpLWkRnT97g79vugef4EHAlQ=
X-Gm-Gg: AYBFou228MjQytlwQmy0Au39gicaAvcBV86Tv1GlFfzJu/MxqVzC79fisD80WCAfD/1
	y/FcELFoT8YAS9mKOYVl70thPPuGiBekZTxbURPGyYn3NyonaRS5tn9yAmdeUWnQNso3qz+9HwM
	hMYWOswLrCVbLcVBGwUhIrEN/pjnca8DN0xIkUsZ0WRa2qp4E07ezfxM0EHxo58nyNi6U3Tg3Y0
	11SvEuP6sQ69/8dfN8RsxJ5rl2FnMZzcsEqxKoRbXIEmDnmwmFotu3XfZIbJ2kUIWkb9ZmsFYaA
	Xu+OfWCrK2uWIf1/4vxwhxiDb+u2v0syyVs6WQ74X+2M4RU5e0wH+7AQNlZ3BdwHLQWL7M6I86/
	rHvm3CFV1IY2O0BMIsqJR3gsV4s0=
X-Received: by 2002:a05:7300:d0ad:b0:340:7202:d7fc with SMTP id 5a478bee46e88-3407202e868mr739335eec.17.1790240267511;
        Thu, 24 Sep 2026 01:57:47 -0700 (PDT)
X-Received: by 2002:a05:7300:d0ad:b0:340:7202:d7fc with SMTP id 5a478bee46e88-3407202e868mr739303eec.17.1790240266727;
        Thu, 24 Sep 2026 01:57:46 -0700 (PDT)
Received: from [10.217.217.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm12993532eec.4.2026.09.24.01.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:57:46 -0700 (PDT)
Message-ID: <da745b17-ff28-4276-803d-3241d69290df@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:27:39 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>
 <arTlpnQCjyXk2clV@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <arTlpnQCjyXk2clV@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfXwx70nGDow2h1
 vc3ll/SYcVlTIlSZP6eL8YdpuSAe1D6+mxhayc62pWKG+bdlc3kUnuoNgpYkHhA0jIzufTW2dXj
 0WQQmSmWUo+uJwx3luVe3Yaz/5829ZVyvusswHksoqyCDrxGlUkMFtIgNpX9vyHBgh0mOCA2fAc
 AdNlDW9sjH94GCR9n/yRFnOcUttb+DEaFSXX/wyfwg9uFiUL/fXI8xp9WnndxTMWWmwcNzHCTpU
 OudeWMmnYeg7SOMQI3ocFlJFl45keeCYwwcb9OE/5bllU160lECILzYpxDot44qVQ+JK0YJsMGL
 yH6c2udcloTkb38ydMJ/XnL2ScnnQMCqsMklm7c/g0JmUWc9CTyvoa1sj3Z1GBA5A7KA4KYFe2E
 vVMcRV92gWhxOkxpLIpcLs3qMUPI64WSY8IIQCuAkcXv8IPuZ8+uuq2yd5aUz2PgUnM8lVyZhtl
 0x5JUI+WJsjxQm9Kveg==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4e60d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UHbYQJEj8knhjxSQlJwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: iWJj0It12VUnWNbsBdIbpa-7cksS2iL_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX/WpFDMc22xDU
 Zls33xqq0LYgWZYxo8HiCCd5jHw2w2YY1EZ5oxrDKVgxpLPfxw4fNdIm4YcvtPKQYrGCbr5tsjY
 3PyUqSNWYcoFpYCbSSRYfB60InNI+Qk=
X-Proofpoint-ORIG-GUID: iWJj0It12VUnWNbsBdIbpa-7cksS2iL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240037



On 9/24/2026 2:26 PM, Shawn Guo wrote:
> On Thu, Sep 24, 2026 at 12:51:32AM +0530, Taniya Das wrote:
>> Add bindings documentation for the Nord DisplayPort Receiver (DPRX)
>> Clock Controller.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
>>  include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
>>  2 files changed, 95 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e3553e0eecd5027155b4dca5c0596e3140641aa9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DPRX Clock & Reset Controller on Nord
>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |

No, if we drop, we need to drop the header inclusion as well.

> 
> We agreed to drop " |", didn't we?
> 
>> +  Qualcomm dprx clock control module provides the clocks, and resets
>> +  domains on Nord.
> 
> You fixed it partially by dropping "power" but keeping "domains".
> 
> Shawn
> 
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,nord-dprxcc.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,nord-dprxcc0
>> +      - qcom,nord-dprxcc1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock source
>> +      - description: DPRX CFG AHB clock from NWGCC
>> +      - description: Sleep clock source
>> +
>> +  power-domains:
>> +    description:
>> +      MMCX power domain.
>> +    maxItems: 1
>> +
>> +  required-opps:
>> +    description:
>> +      MMCX performance point.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - power-domains
>> +  - required-opps
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    clock-controller@a940000 {
>> +      compatible = "qcom,nord-dprxcc0";
>> +      reg = <0x0a940000 0xc000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
>> +               <&sleep_clk>;
>> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +      required-opps = <&rpmhpd_opp_low_svs>;
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +    };
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
>> +#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
>> +
>> +/* DPRX_CC clocks */
>> +#define DPRX_CC_AHB_CLK					0
>> +#define DPRX_CC_AUD_CLK					1
>> +#define DPRX_CC_AUDIO_CLK_SRC				2
>> +#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
>> +#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
>> +#define DPRX_CC_CORE_RCG0_CLK_SRC			5
>> +#define DPRX_CC_CORE_RCG2_CLK_SRC			6
>> +#define DPRX_CC_CORE_RCG3_CLK_SRC			7
>> +#define DPRX_CC_MDP_MEM_CLK				8
>> +#define DPRX_CC_MMCX_XO_CLK				9
>> +#define DPRX_CC_PLL0					10
>> +#define DPRX_CC_PLL1					11
>> +#define DPRX_CC_VID_MEM_CLK				12
>> +
>> +/* DPRX_CC resets */
>> +#define DPRX_CC_DPRX_BLK_BCR				0
>> +
>> +#endif
>>
>> -- 
>> 2.34.1
>>

-- 
Thanks,
Taniya Das

