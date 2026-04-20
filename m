Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC533A7F52
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707164; cv=none; b=kx8FE3yx3rYdSpzl7wgl6C2winEK7wOMc08rNmfMfscb1trL50PkI/W2XUhm5VnTTF8InCwln7fhueXXdxFbmXIUEqLk59GGQ4kTXrdoixNXMolZ2DL7HTFJ6lROiiqYolYrRRMWFwpMo9BG27cToZa2p1PVAUvfieNwWff/FG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707164; c=relaxed/simple;
	bh=PK3Og+Wr7SWodQIPe7b9VhqU2ni5wqa2k0fzpY/+vuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBsy0HWvZ8mBs6cx7mhxI+tiTuq5iut0cdnHrPS1F0MmyP7iD57hQyuXriyAQ/udlSQs4Qm0Bk3KY7a+KaddRWhsdCnaW5q5Ze4J7eomccCCg56qA8ZZ7xsmJBEMctSDdydRzC1IQcBAHCCV4GsnUgZjulkqzpm2TjExgEaHLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SS25jlsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+7ceZUx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SS25jlsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+7ceZUx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFHJG52281687
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JTG3cvdPMdhP4qQMHJXwSELA
	V02IJif0JhtB+/RFegQ=; b=SS25jlsblDDx6UNZewZFwpFAieQRVxRF6z1IAh6J
	OtJXbGE1Y0EIpf6Qrou/50N1lTDMesF2nvemw113zsZxxp/SWhHVIDXvelLkFgb+
	ETW4hA/PPYfXv9qEYsUeI11uVegNo1j6FXTXUjcXy6BcYzeFz4G0Rg1JfEmsoqbt
	pMpKM70SlBafkyBe6UAqNwkw4si2cN+MMK335Xv4A7cK2ra4QUxhBvYUMJA6DjxH
	yhPD4lb55gxuJFHQIv7q2QTgjXccHTUy99ofzJVKBO8cZ7uFXlAooSKxetBnlM3I
	/CWNiGOunzkbYoTli4czzOT2nuuEk/vAxUuILD5wGp9p6Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599xx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:46:01 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-950bdef305bso4737752241.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707161; x=1777311961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTG3cvdPMdhP4qQMHJXwSELAV02IJif0JhtB+/RFegQ=;
        b=V+7ceZUx2bb4GdLHaAHgipShpUgKLPNqzy9O5fW8DlJSi6TOHH8dtsu44aoPXWQB1W
         qHriCTHSAjvDlHBLuLGHnEkE7UJUPpg7OvT/HhqEYD6l1NqxKS1N1jVFrmrvGVSJa1W4
         5MDRF9IK6XOwt9id7Wltx98thGycRT718XwDcKyzidLJFBQABv0UT+TCQ/5W8jYcUKgM
         ta8WqlXQjjxg+g8kipP8qto9uGF6oVYxucLbHYek48C6LINHPJ1Qfq0JTBqwS7nIthC8
         O4tzOnBaxXTuNPHFwRth4v6rptiftPMqrq4zeEFlhCcJlQaHqDMj3L1dCGqypgoxO2YD
         Q/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707161; x=1777311961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTG3cvdPMdhP4qQMHJXwSELAV02IJif0JhtB+/RFegQ=;
        b=p/+4xVPQ3iCkH4rsJfjXIN+UKdON8yPUSkizpjJXlk+9P8HULISpoioaICwsn5IxO9
         zlBD0Cd6oefz09dmNglHx07OwpmtrJ2undUwe2mejj5mcNhBIsvcfZSut0HJffBDbUUn
         ugiAs/Th9N5zvr6InuX7eWsi7ydRkNtfEhGqGzr4XRVSpZSS4GVHEEXPOiYWwkwnXYof
         c4QWGYAuOpCUNZexBBvQqrvgocHbQnaEEmj8WwRFAA5TUfTKyEtSqFBCIHfFulofREK4
         VadDP7FH3nw8yXu7rn/AlEN3aIR6lCrST9ke5ycCioEz9feVzxCxLTPW6QvjrJAMQspl
         fLYw==
X-Forwarded-Encrypted: i=1; AFNElJ9E4uBvEFJ5ijpLWCJs1E19DxYovUZx6MOcdDjsx29pXzNqKpT5bo0CtmvVjHTOG0JChGaNMEFwRbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqlwn0JbpbJfQx+esZzttZPT72e6CSsqg8exywViqq6ndH7F+r
	xs/doUPm617GqcZvgMLBWJ6UlY5/k1eu+gBJq/NVaFJBolmXohovYRzfIS1y0fW7SomE0ys7iLB
	4ABrmgXSkD5EBavf2H+NmSPHXuR2fXu/OHd//eiFiGdC4bCBnxNqMq/28mwi/Ys4=
X-Gm-Gg: AeBDievi6ieSFD7EWfZeiBZ6pi0bBe94zRbHko84DnSauZQ4B4p1h5g02msfEJ6AFlv
	CwXCvKZ7dpBRngR+vhZmVYWuBmBW967NJ6MM5jD+YuNQrDScsJ1mUGCZSBETm33EHllF2aXC7Dz
	ScnLu4lsjz6u2/Gs7yTjqiE1dhYYVaPP3X6D0qhiE85CBVuymOFSaXo2uPd2yRFl4l7zAp1h4ur
	F1sydgqu7RXazNdTlbtnt+hUg3WKmO94kpFApuRkfzt6iheSqtKWFpjUsCi8TVOWZwPJdWddrmg
	DiNSCHI64ZsREwXIpQOjCHesAPnqlHfgn+F3zcajJZ7pmFAKcRhTvXKbgRJ0P7Jib+v+ZDhj39g
	23bazLOJ6eHin54Sf3GWUYPH7ynM7xqkPzRmoaeCHP/zwqvaxijbXXzGc7BfJuAOynegvlTcpRT
	xL5H89cEJhP2Jmp9kXxn/EvIHgFMwJWm2GhVtwDszMVji8Fw==
X-Received: by 2002:a05:6102:3581:b0:611:b9be:1199 with SMTP id ada2fe7eead31-616f6ee96damr6894885137.14.1776707160467;
        Mon, 20 Apr 2026 10:46:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3581:b0:611:b9be:1199 with SMTP id ada2fe7eead31-616f6ee96damr6894846137.14.1776707159957;
        Mon, 20 Apr 2026 10:45:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0d49sm25711771fa.19.2026.04.20.10.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:45:58 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:45:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add
 display CESTA support on SM8750
Message-ID: <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: adE2aoOoQ24yxIXJDDvbw5YMkE0RAHnF
X-Proofpoint-GUID: adE2aoOoQ24yxIXJDDvbw5YMkE0RAHnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3MiBTYWx0ZWRfX7rM1IRFL7oDx
 Uo4bSsFmF4nt00zxj3NnVecW+T57s9byp1+zlN9eEJHZ0AB+d2X5dL+Hq7SmtPyIn////zJLYj2
 v4PIBxPwMXpsGoBFXg7CczkGKxK7AXzdhThbboIap5hXfx8AN2FR9684mR2DiDCH+YdiIFZ/yvH
 qlVgptYbYOj/7XRBhnSIKWJSJJ+kndx2pfkNbOz2itntLwGOLozBlvmFvHKt5u+DoUOEFQada/d
 yBR3buAsbZln7NR+k3q9X1Lf9qcZdDEDkLhOwFemGEpvNOuJwPh93GZdHUuQxnYycJ9uPMyD4Ep
 4Pgx4VfnZSFL3fCx7XAXL8kwHEgKhTVb0+mfZmcGMu/ikgTeKo225Vqv7zlwRGvvxsa7Gi6Xul8
 PUnyHJHGly4q07xSziSwRAowuAuwaVcr8doYqzhe+YVwzCyeuB+zDVeGq2ZVzECqa4808rGhwbc
 Q2KFpWs5Vx/WsPTtKOg==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e66659 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RHCnOHRpr3UYmH0CO9YA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200172

On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
> On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
> (Client State Aggregator) hardware. These clocks can be scaled to the
> desired frequency by sending votes to the display CRM(CESTA Resource
> manager) instead of programming DISPCC registers directly.
> 
> Add bindings to allow the DISPCC node to reference the display CRM node
> for sending votes to CESTA hardware and the CRMC syscon regmap node
> which is used to read the frequency look up tables provided by CRM and
> populate this data in RCG's frequency tables for CESTA controlled clocks.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> @@ -60,6 +60,18 @@ properties:
>        A phandle to an OPP node describing required MMCX performance point.
>      maxItems: 1
>  
> +  qcom,crm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
> +      with the display CESTA (Client State Aggregator) hardware.

Is it going to be shared by several entities? If not, can be make a part
of the dispcc and get rid of the extra CC <-> CRM API?

> +
> +  qcom,crmc-regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon providing the CRMC (CRM clock) regmap used
> +      to read frequency LUTs (lookup tables) populated by the CRM.

Why is this coming as a syscon? Why isn't it just a register region of
the dispcc?

> +
>  required:
>    - compatible
>    - clocks
> @@ -100,4 +112,40 @@ examples:
>        power-domains = <&rpmhpd RPMHPD_MMCX>;
>        required-opps = <&rpmhpd_opp_low_svs>;
>      };
> +
> +  - |
> +    // Display clock controller node that controls some clocks
> +    // using display CESTA(Client state Aggregator) hardware
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    clock-controller@af00000 {
> +      compatible = "qcom,sm8750-dispcc";
> +      reg = <0x0af00000 0x20000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&gcc GCC_DISP_AHB_CLK>,
> +               <&sleep_clk>,
> +               <&dsi0_phy 0>,
> +               <&dsi0_phy 1>,
> +               <&dsi1_phy 0>,
> +               <&dsi1_phy 1>,
> +               <&dp0_phy 0>,
> +               <&dp0_phy 1>,
> +               <&dp1_phy 0>,
> +               <&dp1_phy 1>,
> +               <&dp2_phy 0>,
> +               <&dp2_phy 1>,
> +               <&dp3_phy 0>,
> +               <&dp3_phy 1>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +
> +      qcom,crm = <&disp_crm>;
> +      qcom,crmc-regmap = <&disp_crmc>;
> +
> +      #clock-cells = <1>;
> +      #power-domain-cells = <1>;
> +      #reset-cells = <1>;
> +    };
>  ...
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
