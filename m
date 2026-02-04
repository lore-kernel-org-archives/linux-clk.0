Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E7187346
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165269; cv=none; b=svALFNeJS7i96UfdgE/NtiTSmCGewUAFocmwzKHK0GlPQi08r17+jFigtICYstsZZxY2WAOsZXBsN8Nad+tgM+uCUDoFPaenO50H82OBViXAXENvKUe1E32N5dFnu1fEajgD2Lvvpnd0l71yheEMCjpejDndugZE8oGq0YEpons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165269; c=relaxed/simple;
	bh=JZQapraUF3c0HIr1n5jj+Xl9qv7HTYhB1kxe5WGZUaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSonQGO8EErb1TGPWSC1YDvahte4FgSCSdyGF/x/wapmzXq0pwoB5PFkBchesN3VriJ6aP1mdk2FoOclDw3KH9Yv/TDxZb55SD1UYUYleFKdX0D7VVV8kaW5sehu19LoK2cKaOx7UR3A5nREYG9rMVG+N7dqMrYuO3QjOrvdcQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iiD/SY5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOPl9hhW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiD/SY5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOPl9hhW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im2nF2055113
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 00:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Y3KpF902MQDgPLjbKI9jOw8
	WubVDSA0uuvgF9yv9j4=; b=iiD/SY5Rgv0STdjZ5h7frGuIcMsCV8YFBPpsHp+d
	6LVuHDda6W0DujxoQzCS8NMvvFacO3Iq0WkN40Hu/lAWS72aMQQHiuuJeXO8YX39
	W/6Gi08KwNXZZzhU/984rhIMVMzAHkgDjH2HoE7YeDHkEr0wjIMRegZ4aGUM3OvJ
	ASWQSFXuUBAFSbIotCwio1c3fb3Hk2HBBzos+K+dW3Xp+HNRGHB4ps5LgCVN+Mi9
	uBF3juwgZJnhngOb808MeTwlvnyvkiipQUr+olmfR9H3AVkBodEoGAs2xigPwSFs
	PhYNpZeFRnjhFp4D0p+i1kr6sUgzHts4cb09RAHJAWCBjQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exkar3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 00:34:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso81220436d6.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770165265; x=1770770065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Y3KpF902MQDgPLjbKI9jOw8WubVDSA0uuvgF9yv9j4=;
        b=cOPl9hhWamm91ab/QF8ki42J/YjU3sh2wjNqKB20bH8j+bMlQTL9eEfOLEilkW17nm
         5fAm+Q+LTqKG4zZpcGT/mjpLjGpDndd3lu2Xw56O7suEcvXcFHpq3fKqIjscmczNWpwx
         kL2O4WFABqudSQc1Z4p7SIW3Ik8WU7DBwvyKS0zg9w0hYlST5UzVPQhpvqkH5b+MlITK
         JXtd+stePugmulCvgbFZHAZvO6xobG86irRXz12PW9so+MdTeYZEK+ymu4lUWgSeKgUk
         CiCLjdQbYxX135xYHOSL3Nw5u9OMCAhCHHhRVmutXAU8JbhXzwy0oP/xAJtvfxzpzSSq
         GcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770165265; x=1770770065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Y3KpF902MQDgPLjbKI9jOw8WubVDSA0uuvgF9yv9j4=;
        b=mKZ1A5+GqPoKSaQVxICAkQ1wBGnnWn9iwNjOrjaMHAGujzoBR+XwZ/Jrbyl0vP1zbh
         FK+GkjJCN3101lKeMSBiLFbXLgD2f9VzTvdQoHgCh22dpcUYMas5PzfVcLEAkmCl3Kt8
         Y/FXO/Z6tYshRYFJ+Jqi2aE1x2K0lPl/a8+31ejEBXL49+er0nomQcj50c9wF+z7rifO
         1rn5e2vWWhLy9x+mLY6Ss+rjUMLcRuBY2xw0yj/ZdoPGYL+xja6ijioNyzVJhh/jGE25
         Q6u4OPx4cypUiOr3dlI//vnlyOUOdW9tSbNUkCL/wfiVmEFsKXB/fnlKpt2cuITXlREO
         oDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkOL/g0FIFWKT1WT1ge6om8yWCwLR9ptZ+xhVp5l6c6FX8okaqGY06oH+0ZSwN9EKDerT2j1CElLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YziMPCTVfU4kOsyB0454q5lf1XLUxlIv+kDIkjm9K+r8MBjdrBr
	Qhd2UGdspn/blvf8/77FC09IH555dMC1YETpZRM82e+2W/F26FP289SqGDmEXJb7+Ghu7lagVi8
	rVxc4QUiNP5xAsdg3sXdAFRZ4xMrgNUiNEfNfwz8oF/Efj9Ejk7Hx/PmLXITiVlQ=
X-Gm-Gg: AZuq6aKlAhRg15+cNuqssN+l05urozWEWMPS4IQ2gw5x6eIbkA4y5ll+Byu8K++xSBg
	Sr2g8LudlPrdD5MoxDgbVjl6QNn8t4/ExTs3ZNTH8bNCgocvL5fYzhkRsk6RFVtE0YQjUUBQGng
	JjKn48QiGk120bijg8nTNl/OgeHoWjpeVB+df/VIAwSdU4123VrHFFF1n8xdxRzp/nlMu5XyuZx
	BblZTNyhpP961p5HpWxWDePXtJ+kLNoAM2ZTisLzwiGLbcUgxwvL2L3zRCSLGJiGYqA9Y7WY0Bt
	p8jEKzl9tf+98/cnRFFKC2E+B+vXMN7824IxOdCzxAeRlRm6ncary3RVBG1GIOL0gyyqIIYa0AA
	ksScgC0w78x/MayI3QDsiPPHMLgQg2emNMkJ9mpkXEcdZGTTS1yr3HQvusUu8bI8ZugRg1SzaGs
	k9vRbPO1lRgFj5uYy0st7DoV8=
X-Received: by 2002:a05:620a:2808:b0:8c6:d628:8bac with SMTP id af79cd13be357-8ca2fa066d0mr184304585a.73.1770165265050;
        Tue, 03 Feb 2026 16:34:25 -0800 (PST)
X-Received: by 2002:a05:620a:2808:b0:8c6:d628:8bac with SMTP id af79cd13be357-8ca2fa066d0mr184300085a.73.1770165264545;
        Tue, 03 Feb 2026 16:34:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3869204003esm1713351fa.28.2026.02.03.16.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:34:22 -0800 (PST)
Date: Wed, 4 Feb 2026 02:34:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
Message-ID: <abl3lfuruwzyrvf4mz2kcvhfr4efxwms5cqgyfcnfsf5ntwyrt@dyqdamcq5sru>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
 <95d2ad4e-082d-b399-3a35-99fd6a3e78c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95d2ad4e-082d-b399-3a35-99fd6a3e78c1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwMSBTYWx0ZWRfX5slqPmUXNnLs
 RtU7m6zoohqs878mbmIlNaIvkwTGqSjc6ZxW0Vpm/ZoMdAYqVtMfsBbMTIb1zdfVn7WhQRgiDwp
 MMtfFTyUjIo1a8Vkw4O7QAlyj+Tn4YTtYZwRd37F/96m8wGtnitX6u76UdFUPKVO8eQ/1xMA6NU
 jbUsEASXQ0JkNo2PpF/fUjiIldFbcjZ2sFIgGFSav5tOjmrE89BKGMkmnagDUMn2JBOjrIecdPF
 z0/jzGDHmNxa/vCUfpgxe4vBHMFBHzvJqLKvmT8zfIAXUyFFXlJKxtjkHO4Go/+OxqC5pK7VMcV
 gIUnIHQpbPb/j01JmnWz35JhpdYYPa39m78kGjlCAyKlUrORGVSb4Yk38gVoGdsYBjmH0fbI131
 5iYJH9LVjC9wlvvgbnDoo2Ht/4bD1Vt87j/THYYLnD60Wtb1aSadWGdZox/MBvZgm+uw5kafZqP
 cOpYJQOoBLmh8dktq4w==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=69829412 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gnWdZZE6b5bJ3VmEtdEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: LJ0pq3Yl_RNipjdxR4eOmt4dBxxQaFuo
X-Proofpoint-GUID: LJ0pq3Yl_RNipjdxR4eOmt4dBxxQaFuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040001

On Tue, Feb 03, 2026 at 02:37:16PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/1/2026 4:19 PM, Dmitry Baryshkov wrote:
> > On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> > and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> > qcom: sm8250: Add venus DT node") added only MX power rail, but,
> > strangely enough, using MMCX voltage levels.
> > 
> > Add MMCX domain together with the (more correct) MX OPP levels.
> > 
> > Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 980d6e894b9d..531470506809 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
> >  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >  			power-domains = <&videocc MVS0C_GDSC>,
> >  					<&videocc MVS0_GDSC>,
> > -					<&rpmhpd RPMHPD_MX>;
> > -			power-domain-names = "venus", "vcodec0", "mx";
> > +					<&rpmhpd RPMHPD_MX>,
> > +					<&rpmhpd RPMHPD_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> >  			operating-points-v2 = <&venus_opp_table>;
> >  
> >  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> > @@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
> >  
> >  				opp-720000000 {
> >  					opp-hz = /bits/ 64 <720000000>;
> > -					required-opps = <&rpmhpd_opp_low_svs>;
> > +					required-opps = <&rpmhpd_opp_low_svs>,
> 
> should be rpmhpd_opp_svs for MX for PLL to get voted to 720000000.

Ack, thanks!

> 
> > +							<&rpmhpd_opp_low_svs>;
> >  				};
> >  
-- 
With best wishes
Dmitry
