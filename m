Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439D236BCF5
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091657; cv=none; b=SCJdQGumvXGpYevWzLp93GhZntbqYc5bKnqTq3xNMAfHaZTuZ7AbO/cbJmohka27QNS/ntmqZFvZ4k8/8vy159U9hjX5x76eGYs0LmmbV0iN6rwKpMz3gnjlyr+cMsxVJ1D1LVX5HGY2LgI1MKVA7z12ATat71lI68vpZoTMg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091657; c=relaxed/simple;
	bh=Ia8Cbh6/+Kbk0y8gTmD1N8Hdl5uzj82V+GpajWlwRsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imDytqgpNt4qQB9kCcnpKwnjUYsUHnxYuNQa91ApbTZqoQ9XRcydVPHFhqhGQd92PCYPy/vNFHgSXppw+/jEljkzI+UGNNgu74OYfzBE1DBegIDHuuojuyQNeQug2A11uC0GXMd9GLBLsgYlfWq+fmws1CdZQO13Y5YSuSRtksE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAhVOMD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLrpxNXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAhVOMD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLrpxNXN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBwJf2427819
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 21:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NffRds7Kdw3GfATErgD2BYuO
	9VlL9883uve+FpAdSz8=; b=YAhVOMD4sLCdGdkCsQPj9hbYj9hbLiaCIGouq/7f
	Lqk1Db6fNF1xkdLUr89TySHRsLlKAiLU/8yzXWkMOqmy2CnLr/1OmSDWynltm22E
	mm6f3Ai+kC4tfsXe4vsbHWUpdIM1gDdh/r4vN5bb3ZckWlHis/y8bXj6RBUMPMHa
	SqBgRwSAxKuxpUQgzw6qdKZFUgAMUh4XUSQELO/ark+PVDrRPBiRR9rkiVyCd/QH
	VIO//xZNIRYTCZEj2mGtfDCWq1BYc9CcsoDuIqn4ATPITWhw7hBGcX5pNTo29XeN
	0gjMcv2vjW5ajMtq36UzX3crjJl1WO3JQIMSMh9/TNlihg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eks21u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 21:27:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso138458801cf.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 14:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091655; x=1773696455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NffRds7Kdw3GfATErgD2BYuO9VlL9883uve+FpAdSz8=;
        b=eLrpxNXN72jd/4y+6CaJdcC1Ax4vwqtfvQ2arzGnfyc8gBCZ3KRnFlTNhtjNuV5wZW
         crT/6fRhlbYVIuqavAv1cG+25V4KOQPHFXgzfuMX0qXGiF1Kpz1RCkACG9P41thQoMav
         sm87wR/eJabfJlrjsCbf1+psoQOstXDJOsu7sCsE3PwZtLxvHlyAANTOxD5sLtbpQIwt
         iqbMPoHjdM2WHLj5r4qCJLPTMgs7YNMPMVLT+HjcumQYHunj1iEqnDx5ZdKr+eHA4u5m
         djM3Kau36vE4xljTAo16tnCgJsN6iMEYHm1/zlMWlHGS87raDWPcqeJVfQlR2Rj196Tq
         cj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091655; x=1773696455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NffRds7Kdw3GfATErgD2BYuO9VlL9883uve+FpAdSz8=;
        b=utnmhOhW2ngDzVUQbl+4PPClzWozMk0JNAnus5XYk5K+BKqOruGifELl42uWxcTIlw
         oPe/V9wUZHR194ZLigfYwXT+VM/N5JoZU4hOslJHbAdEHDK2cAYcdwTYyDOUuFGg+IH0
         5l1Y5KgVZbVUrtT0wsRzJMVwMSB4r4XUneLmF8zXM9BEQ4YYi+ikS2e7sPFiuE3oLBK2
         VYQO2xe2As9j5G6Fj29zJhfCfGlhpJHODMKKLy1/189IIE058Dd/C07BmTpv5nhXiA7V
         wXvKU3crQwwsg+VJmBREjUQA1P2RXeIlbi+tXbzJb7xJFU+QFJU4ZvMVA0LWQxfxhk2t
         0cTw==
X-Forwarded-Encrypted: i=1; AJvYcCWs8Rm8bxseKkFsVJR+57oDIhIach4yoJew56Rh+iyjnj32L5QYTh1CQv0DduOCxkIZ81g83AbAgJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zCcF6raOkZANxFukxNf9unVeUIgMbT0nUAkxcumeUq0jPEPX
	U/f+O/k9M4HWSqMZdnAmW4nPpTs/HF9qKkekz2dixqxzIbtZu33Q9sTnpO1/N1VRW3BdWVsFNjj
	DBLY0QHF/4EKJ3rx0JC7Xpgve7XW0tNewXyEUpXO4EyaEx5HF0EBjkv7PhXFTI14=
X-Gm-Gg: ATEYQzxvza1afyB51CRN32ubS+OB8OvLJIa4MgO/cj0d0FpjX+xHQGXeuRRf9ZVAq+K
	EEhmwKPkSxfDJrQHR/7/n2YUAWl84gNyHNCPB3iYpXj7qa1SzHdes/3ZjLv6djv7rRCdnVuZLIb
	LCdW6JREY8IB3IDaCUnu00UWKGT7SNNsepXewIgmHSG0As+/GQKF2bnsmZfa45DONHOk1IkmdwU
	yKBeidTr3PTsu/+nN4eugnAE9bmFXD+sjxIoHiIq6dVtOES+7KM3LIXbPPbTjoX9fY+urSoJvjx
	XVjJnzJAt3FkS/UslmoKFYnA7um1oMqLnAjuGY5XlrbFHMRHc1NLrvhBx4f8kT9tY4IzPnv1pIy
	CR1adoQhb811qdi+xOV7bLiU8KcSVJzS5p2JEfkwMh/NzDd4C+R63hbDkA2DPBKMtRWUXbhCwW2
	Dle99cTqkVzaWvMX0yj6ubs9BVEa0CiNCFzhc=
X-Received: by 2002:ac8:5a55:0:b0:501:b1d8:637a with SMTP id d75a77b69052e-508f4961581mr160517141cf.61.1773091654321;
        Mon, 09 Mar 2026 14:27:34 -0700 (PDT)
X-Received: by 2002:ac8:5a55:0:b0:501:b1d8:637a with SMTP id d75a77b69052e-508f4961581mr160516981cf.61.1773091653855;
        Mon, 09 Mar 2026 14:27:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085efcsm2398578e87.64.2026.03.09.14.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:27:32 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:27:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing CX
 power domain and required opp
Message-ID: <qqizoxngoey4ij6757k544tssarhisyj4rh7jynf6srgoiu6vi@lhyhu4n6w4s7>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
X-Proofpoint-GUID: xLhP7Air-iBkWvm1yJaqqFRg6gmcmvGx
X-Proofpoint-ORIG-GUID: xLhP7Air-iBkWvm1yJaqqFRg6gmcmvGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfX0Z4qtW3x5bkC
 dxukylVv9tim4b3uaFeatvF+4MCgGNr4fX/oFw9q4s9ZFijC845+aOevo6Pt2h7zeZ4JH5faksz
 MFLN13qjfHeHtoyyWqRDeRiCuaMwtfFpyNxf5NWRqLO3PM7CmwaqspurS8xBYknsoiNxDiq9oCO
 sjbPxexhdq11kRwXptjhE5IW1zk5c/NWMbR++ix33BmTOR9BgpI3ErdeTrxirtbFwuE6bXz6AON
 FE+MlpLWNovp06lwEPwhj3GQ44IZOhv2ql4fxb09lifL3N0ip70CGhpGMtJQsHJuFaNrBAHfvI8
 yKQR4uyT4+F382RsyNV1nOh6oudE1+gSWVIo3K8kenXrKgFLNLvEmR479wkGocoovY+yYT5bS5k
 sKdvUlDF1VLGM3Lt7USswAnHaTESi4bKHhfYERRKrqhElweZXFtRD/cJUJIYg6rCuoii/03JKm9
 /ymLAlmGFmeExXtwHHQ==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af3b47 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=G8-z_bGVGM6vuBRgOwAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090191

On Mon, Mar 09, 2026 at 12:06:17PM +0200, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock

Which subsystems?

> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 
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

If you only need to use CX as a parent to GDSCs (BTW: now all GDSCs have
CX as a parent, is it expected?), then why do you also need to case a
vote on CX?

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

= <&rpmhpd_cx>;

No need to import another header.

> +      required-opps = <&rpmhpd_opp_nom>;
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
