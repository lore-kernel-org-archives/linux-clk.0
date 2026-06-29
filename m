Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8518B3FF1D5
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735797; cv=none; b=djPUTzOdDPu6Prssbac5XxIY1v2QZozHEHLAUTZOoOoIJmEVv9aZIhPdu5HQgD52Tgry2/Q5XeFjDSer7VOvSakS8wkPsiXFOFMR+SA1eDm8yV1cNvIfP3zi9UPrAfOTzGoOAiWGS/bBWLCT2Qnw2RORlOGGYgQPEZ8hcIHw8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735797; c=relaxed/simple;
	bh=P0YY8NDT3Os8syC0XVSuw44PAHlOaYunR8ZRStks+Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRB1LzjoW4kyvmsTh+OmJGhvqqhU0Hy+8+dDzfHwsn48az25ex393L+b014PBpAGphuQ/2+ptldox+koU7Z99g4FEONGIA+E30V682vvxcpvAhWBeQaS+a6EkqAYmbNbQEmzgyH0Psb/0ifnlnQJhKIFbA4tSH0nMClt0EbUGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpJE+GBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XepedFN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpJE+GBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XepedFN1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATN0K2619286
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9nsNylN8z5JWVNL1IlFXlPQs
	WEx/6QZBCwRBdmXQ16U=; b=IpJE+GBluFJVHwDOePp8ZUW1FUkjVTAGYnKHjIpv
	gVAYg80NSIwukR+JOrIW8COcf8CwVMDPTiSrXbAISlIM5qjdoFZ0GxZ2lG8qIbB3
	D4YiITO2UQHGW5hHoA+h7UIhdKwQJBbkpvCu5jTiBQ/kE0GSNhuRxyV0mrbVPw0w
	kjetJK5pw/pfquod8j+lQAK7kFHe6uMUod10kjliQ4GRu0TaK2ABJV7D9PYLvkbo
	vd2l6ZiAkpG2I0rsbdVq0RLXN1ZLpQiRjlewJ+7/S0BSjk1HkzmNJYRkWWxvMDEV
	jPJm8KFpOmpT4DCpGvKrTD6NkeWTf8y5oNVAKWVGxvxJGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkrhh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:23:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca0481106cso7615735ad.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735794; x=1783340594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9nsNylN8z5JWVNL1IlFXlPQsWEx/6QZBCwRBdmXQ16U=;
        b=XepedFN1XTzk/w9vdy5Z79ro9LF+tHzzhpqrgHcfuJSNWBmzALqWLW6SXjhZYH+qXi
         HdC9KB/WGbsJTo8efvyWWk/6jzrSEpUMt7EB3CQbZbgvRAtFbD8oZbfaQli11IdinDaP
         0Pp3Dyd7Q5PpCfkqOOL23p3+dBNvHA2tHWgp3bOmw2mds13WGxQAZnMmOtmmgTBMH6jQ
         IoHPBqA6oBO2GkllmLJHlR1jpyyG9Lhg/CrhNRZTbO5c9tvKJI3Ua4Xkh2jTK/NleInF
         tDyUs0ASxC2jEOEDP+DE1DL7WHjWoCN/ruuqbB1cdGXO8r+oZDP22PKHLxFo4GSlar9f
         1Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735794; x=1783340594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nsNylN8z5JWVNL1IlFXlPQsWEx/6QZBCwRBdmXQ16U=;
        b=ZBXDnwMELAHSJ7Fdz0qJLSnz4CxoLVMdVbz4a3jgaRs/tImD9JmxFxDLQv49/TKO2z
         s7c18D+Lrvlp7zVb4ZBCOPMn+Me5rBOTD1O/e5dpJb0/KHsART1B9Q8z9XN+7e8jOg9m
         aqBFPe7K62oxVC8/7JWAGi357dIIpFVQucVGLLwrjtuyx09lYwRDn3xCamBFth7bFxgD
         B25L/Vb/wN2m3dSOBU+NuRAd49oXCmY6U8vsAJDb04kIrtTrEPOkry2qMAdtruhnWUTz
         u5Du7ZC1VywGMyU7IS5jQVoAzJIJFFLKp7KeLPDnnN1/YXCxazdqVHTRh33mOX9OQb8i
         jOug==
X-Forwarded-Encrypted: i=1; AHgh+RqLlMIt1i66FW0UzAcyKl7xh1ZTfJUZKuIrZuBJ9jOwGo5mz/R1LL8oL4n21WcznWK3Qpo20UZPlho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/una6gsEsZCYumkDVpnq/WNMvbaGZsjCkz3Y/C5n5Wmff7zJj
	KSn0JG2cPyt5uX4jl3UskeU2a+1PHOcgBcmbMhdyOLdBYjbQIKi2XevQLlxH55LooPcz0iiO74B
	j3VdW+nqqYZykZj6YSxlDhOb0Fpf3+IfjWfqJNSTi0i6kY/5FWYLGaOmBDnfAyQs=
X-Gm-Gg: AfdE7cmH6CVrKsLL2Xc0gvrzPYAPcLWzRhbrlEXbUBFc5b19AhkRWf5iJeRTHgdV9wo
	trR+N5R1ibAodmNuVWDLX/dgHaSGRcVN1eCmeaii5wSdfeQUYzDQX/qE/qKPque7bmrLqE73iwx
	uGMXXGyt3Er1Wfq04Jwb1OZn/4mgkkDq75LwJcGp6LkvhOqfJxr3AEOvYMYiMNUo+GmC7wU9suU
	acplz5usYZ8XBZWgKpeDArIr6Mxyyn9dpAeYgzNVAEaOLJYX2FbqxMVUVn+kPYmJk2MSYkhOraE
	pxyYkwT++RwZfPV11fFHonS2gkYgfVAAFtohakpGpl6wvtfclhJ+wSgzHf6jDIXzdzE8278zG6E
	xansaVgxEyvyNdg2w3+LCuRjMoqnqSPOPO7vAZ6Sg2RmZOKeP1cEGbI8ZAQ==
X-Received: by 2002:a17:902:c40d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c7fca15745mr154651105ad.21.1782735794336;
        Mon, 29 Jun 2026 05:23:14 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c7fca15745mr154650725ad.21.1782735793839;
        Mon, 29 Jun 2026 05:23:13 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9a93d5ebdsm46981245ad.74.2026.06.29.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:23:12 -0700 (PDT)
Date: Mon, 29 Jun 2026 05:23:10 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Message-ID: <akJjrh5z+IVvdRVp@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
 <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
 <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
 <8e4ea76e-f1c0-4dfd-8477-35e01ac0ba0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e4ea76e-f1c0-4dfd-8477-35e01ac0ba0d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a4263b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FJmAmWhdmJsi9ACvDYgA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: _SdhI2XXXfMhjYk01Rvy2AOAQAhz1WE8
X-Proofpoint-ORIG-GUID: _SdhI2XXXfMhjYk01Rvy2AOAQAhz1WE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfX0jy07C84NaLY
 8bLzT0JNkxQw0EXcOtxR9xK6SsE5Q2Y+UKFMsI6oUOSkabv9rNfdbm90aTx+Fo7TvrlwzljAcI5
 IuG8nfZfQZaulwjL8fY6GGFOCKGZHvW7/azhg5Q1qPRkCNZOhlG//gxzTTwISEWyWj0VAZTSLj0
 Xa90ZHLdQDwlGsh9dTco0cfiVnYO/MHaRbFquReNCVfyPDKAAa77yNtg9BAN+R3HJ/Lp60Hm7MC
 OhLrK2Eo8l8Xbs0q1Xm0deRTyCVFJFdgVahiV0L435O5ytxmPy4kvYLx8LjKOm6jvEB18HY5Cw1
 CApEBe5gqgVNRorTfoD/wZcH5EYClduewY4GhA1zq6mjg4smKzy0prhF2ovQRxz6DNVV0N/9F/Z
 SoxrRjhNM/KIYeWO6Xn4YuMO2O2u1wsNmAcXjsrN4rdNJrnmuxltVs1zT+nDA8ct5e/JuitygKg
 1x8SYaznLkARRXFK88g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfX/R2hnCvoyx+6
 0iosA7Ah/SGHXZtUcE69x6uvRmTdU/G6AY3KrkFYdSvSdsgEIs5bwFgZQa1BTKQBg3Ci16GSKno
 6EZFSr/RXkx8iafhZQE++vVTNSHebD4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290102

On Mon, Jun 29, 2026 at 12:34:10PM +0200, Konrad Dybcio wrote:
> On 6/22/26 3:31 PM, Qiang Yu wrote:
> > On Mon, Jun 22, 2026 at 02:18:54PM +0200, Konrad Dybcio wrote:
> >> On 6/22/26 7:11 AM, Qiang Yu wrote:
> >>> Mahua has a different PCIe QREF topology from glymur. Override the TCSR
> >>> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> >>> LDO supplies for the PCIe clkref paths on the CRD board.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
> >>>  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
> >>>  2 files changed, 19 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> >>> index 9c8244e892dd..8b42f5174b31 100644
> >>> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> >>> @@ -19,3 +19,18 @@ / {
> >>>  	model = "Qualcomm Technologies, Inc. Mahua CRD";
> >>>  	compatible = "qcom,mahua-crd", "qcom,mahua";
> >>>  };
> >>> +
> >>> +&tcsr {
> >>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
> >>> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> >>> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
> >>> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
> >>> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> >>> +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
> >>> +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
> >>
> >> The supplies are correct, but QREF uses refgen4 on Mahua
> >>
> > 
> > The instance is REFGEN4, but its regulator name is refgen3_xxx. Do you
> > think rename the supplies as vdda-refgen4-0p9-supply is better?
> 
> Ah, I overlooked this. Maybe 4 could be better here, since the supplies
> that end up being assigned there match what we call refgen4 on Glymur.
> 
> But there's no good answer, both options are terrible. Let's add a
> comment somewhere (in bindings?) describing this mess, perhaps like:
> 
> # On Mahua, the REFGEN4 block is supplied through pads named REFGEN3

Okay, it's better to metion this in commit msg.

- Qiang Yu
