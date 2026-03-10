Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCBB3B95E4
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773114811; cv=none; b=TOvQeD7GGtH+ELDWj59Cb48e1QdNTIIEf+xP1/40Uzuy0kipD5jFfCpLdpLJZoxu84Qy9oQwBnSnSimdKRMzLgKkq7bq4xTGyJ13rCjPyOfHYqDwTp+7L0dWzdzdy1lcRbtvGap1OQ2bwuyETA+duD4N+4DEsBksvBrWuJIsrc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773114811; c=relaxed/simple;
	bh=105v4TdQrrQ/uMIjR5Mp5MhQjg2dne2mJ3lCAkK8Q0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWZ8h4WZDwI5mbswEGcRC9ozLoCfhw+kmr0xnjWBLV6u2NTi+5Ahqp1/j1lFJUxUTdFAftRU+hamBp1bPHNJKqhlX6P/QggDnX0X16cUp8ILIrzI2JDq7YopRAJJZOPyWJ+jSpA+cqRwzmvfYpD79pq+uo3YwTwn/zD6DuZoYaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+PAQR0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHiY5tGo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+PAQR0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHiY5tGo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EMvk110850
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 03:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fd/vYdqYtmFWxQGITEepV+hYM3+te5NOpBRtXH774Ck=; b=k+PAQR0pNt37xGKL
	SZgXbNFGLqykyzcI7w6wsbkmnsRVBTZOSgpFJsDLswqNN7wTmiITQbSMRt2qV26/
	iBn2X9LbHHoncWaSDwK/9UA6yci45d+6MCMYalRy2QswQ3Hyb8BsPLshJgd/aAJk
	1YP30gMR96klqI54MnmQZfpEVygOXDdlMA/jkGx67fzZ8gACLdbQ8SSyvQuteUc+
	QUBUaO0w5+BLC0gd/tV9yWOJ7yf2vwJKTavTtrpNS5pzS6SUkCRra3aa9dXSdevD
	Eywd08q+7JgO6o2DXDOOtCinXGBHG2ff3FdXjLfbFxB84OEfmHqv+QnZBUPW2Y+C
	GWdCbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5ub510-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 03:53:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35986cc87a6so8095818a91.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 20:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773114808; x=1773719608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fd/vYdqYtmFWxQGITEepV+hYM3+te5NOpBRtXH774Ck=;
        b=YHiY5tGog0Lsh8mgBIV/OsfQeUXDk90xiXkgmfCKxTWpm5Byea6BSq22uOSR9uQ3ym
         VUiD4sgrnMHh/VXhweMgSqEU5ERm98IYAEfkLrdlr8OIoGJdnF/IueGJde49AtujvWVM
         xrfnBbQmFXFUWWvRygep1eVxiE5/59xLTRGJq+FbjRvim5x9BorB59Z87VYIH0LaTTzu
         AAT11YP9xcoXcTGcOqXmv+jCuEh90KAUSPnux4vKLVrA75DmGc+r9zfDpxzumCgefuMJ
         y1T0qAWPl8VqOYOcqdm1fZSc0/AFL8BUT9OnrzBVE3MNafRDfgGLtF7yfFT1dFO+Yku0
         ljTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773114808; x=1773719608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fd/vYdqYtmFWxQGITEepV+hYM3+te5NOpBRtXH774Ck=;
        b=pB8cHrPJ661xopAQiJmGoXiPsaol+TC6XFQ+j0S4YPFRRJxONNOL2lKHAfmtXpxNsV
         +laAhe2KyOHxRjASSdb8agPIk9sbz79GJVpVzLH0XOIYTZWc26drGUccEEJi0qu3rZls
         VMJYSOJ5XdEGcTL8bfIviT4owAILey1TEEgJZBixj/elU6MRQc2TXGiyA1059wFMwn9y
         IFt/pa6S4pUXywt99pyIWFXBzOFKJvScMA4CXE51KGksglpAcAIuZCGYNOhNj20y5v8p
         lHEpqp6betyqsXh/8eOTz+psn5+BSSfFOpqYsMebIT2hIFkh+m7aSBldq3A3sHIcobab
         t2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3HqEuO1tskaGdQ1muyQO7OdEsEIrJOwfXzV3HZ/cJTWRHGdNGy93O6vr1SZxhBQw5UNh+7U6kP/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YylXsxwacdBjKB2dNSmLSnHO2FJPHe98QgrDZ/3k4TeftfcIpNq
	dJNC+FlSCWRlgwicWV4f5nosOQ8Xw++f1f6yaCsgi6ZMAYmCLFOP9gj3b37ClhywJjA1oG4oTe1
	3FhZCA6OLVsqFLG2q7a8kctG2TwHlsi/O/9sJsMhdLm0dhDiaW7yDJOBrAyhYa6w=
X-Gm-Gg: ATEYQzwCCrmN/8u6CmmltzzrbCxw4h5eaIfOkQWPBB7po79fq57W4+kb4j5PwMDYgvt
	+hypOzO9zK3rtbbaK5kWbFdbqbvbAzhjT3PTtqVvchGq70Kjb/9xzJtBhHqH7D3boLrmXfZIHGX
	kESKbeo+/ACPA8w0IIne9tBc2Is/YOf8JdoTs7fNkVn707hnvrDXR2FrfsG4/29gBtclh52sxEV
	0Joal3exr6+cUWlx1ngm/ZSV0EjVO2fO2RbnIXzD064KfrodfnAkEIC3W7WfnRVEuJUl7dsG2hR
	cdHi4dcHYQM4IZaSVYocEELoOU8CISdwIBGTFNfMCMXF+MJnoYtAsrTknygScJh7F/GbgfAK/rp
	RVvPrWLJdmZLcfCPmIBL7IEg+sHszOGEsOpFGfFehdgCc0iHXlg==
X-Received: by 2002:a05:6a20:394a:b0:398:7949:38fb with SMTP id adf61e73a8af0-39879494e67mr8280827637.54.1773114807595;
        Mon, 09 Mar 2026 20:53:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:394a:b0:398:7949:38fb with SMTP id adf61e73a8af0-39879494e67mr8280804637.54.1773114807109;
        Mon, 09 Mar 2026 20:53:27 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e184f92sm11379844a12.28.2026.03.09.20.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 20:53:26 -0700 (PDT)
Message-ID: <12855948-936f-4762-aff2-1777bcaa5638@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 09:23:18 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing CX
 power domain and required opp
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fgSCEpx9o9oFucr9F_iTnlH-R-VAxGY5
X-Proofpoint-ORIG-GUID: fgSCEpx9o9oFucr9F_iTnlH-R-VAxGY5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyOCBTYWx0ZWRfXxOtkMFnuIX1N
 jlt0EpGPa2mAk3hVG5tnW+LrZ53l6IOxWBxnO2ykbUmYdLKt73OORk1yeMv+bMgCR0Dx+p88tXx
 auFQUgsHyA5YxPBerzbtW4ngZowM5CGObbU5ANQLDKz3BVvtDcOZmsCb5hrFo8Nr++yrg8Itqj9
 es6V/xR7kygnutWzdB7Ks62dUeCpM/VNnylIgmhgI/8Ir16F/WO5cEfBjMSwMgNAPu5m+LSPTgr
 PvPzImXZr6qBV83meeJ+LCzxTELOaLTKz7GUajnnUhdUf0ZmIRhgeZB9pKZO3JrQIY5eB/fOAGn
 h8f2KouwvmV99H3rHiLzhDV1phPtI/mhE7uli4sQ9rjZDZ1yeIAXWgbb3GCA1Q9WADmnsCLiJ1o
 qBZg4IapTO9Ip6WOR406T7JdC6X/f4SIFUSQrdqKpNfYqkhK+GGPlfEUQ+l2iCSg7pM8EE1Sxuv
 6Y3XiS7aJpR6yipYUrQ==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af95b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=g3FZPDIDENTUAh6yQDIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100028



On 3/9/2026 3:36 PM, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 

Are the consumers not taking care to vote on clocks to take care?
GDSCs from design of hardware, never requires a vote to operate. It is
the clocks which has a voltage requirements.

> So document the power domain and the required opp to that end.
> 
> Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,glymur-gcc.yaml         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
> index b05b0e6c4483..94a911855776 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
> @@ -65,9 +65,20 @@ properties:
>        - description: USB4 PHY 2 pcie pipe clock source
>        - description: USB4 PHY 2 Max pipe clock source
>  
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier for the CX power domain.
> +    maxItems: 1
> +
> +  required-opps:
> +    description:
> +      A phandle to an OPP node describing required CX performance point.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - clocks
> +  - power-domains
>    - '#power-domain-cells'
>  
>  allOf:
> @@ -78,6 +89,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
>      clock-controller@100000 {
>        compatible = "qcom,glymur-gcc";
>        reg = <0x100000 0x1f9000>;
> @@ -113,6 +125,8 @@ examples:
>                 <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
>                 <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
>                 <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
> +      power-domains = <&rpmhpd RPMHPD_CX>;
> +      required-opps = <&rpmhpd_opp_nom>;
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
> 

-- 
Thanks,
Taniya Das

