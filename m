Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3713ACEF6
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132573; cv=none; b=GLock8x00Z2hQ5RCSj9ECo1+KH3uVPeguOrSfEkAIqemY34hCB3TsCYvo93GqMLyZljzkxJBNT+GxfvkXTgQELUaEaWFA2unG8PVUV2TDyDTbmeU5/j7iEdci//hQFk0RYokmTB/6SbqAcV0f8nlYrJVzxNin4EgB3cBnBImKDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132573; c=relaxed/simple;
	bh=jNMx3iwvsbfpD5vQQDO+RS21sWblQ8a23Qh7gdZ0oLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOmCm9FATNss0jaGUpdudvAP4n9EEnXcSEj+2I8qblBCRKgI6+dDCLFqiH9TZvtWFED2zTfdeePUAn4WsJ4MXN605PM+Ieeek3/pkreHnpX5Ziad4ujiu/YSXlauZjpaLdDxnd2RQRxNhLTAuBnR9oyfWqpzLnu5QTS/uCwhzy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrA9SgoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hxb0ecZH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrA9SgoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hxb0ecZH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAnvgH1016482
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gBgL71/3RmD2QYBALbwcAC5G
	yQQNU9UzYK85MCGr084=; b=VrA9SgoSW6PR2KrK3hJ5bdc+NBVoG7Ja9yzOw3d8
	ghLAxRdgPCIrruRAbbXw9boz4IEnitKpPsTPFqo5PAsyhvisTqP0GwcGKIHRrx9E
	Ecvi1w1fTXbSgqQF9w+BWU5+8Nx4IdexE4jbMzMQtO14rjNeEz2IW7UdpstfNTtl
	SFriAwswDsq2mCL/5vMK2O4yz3teAms+SXmAzP97AIykSQ8CW4wEMZ/ZR0pj1qLf
	8dELuPgck4SyUHR9Lb3Ee/sIsz4wClflQnnEGBuiZGSBAfUVp1VbFvRdEQ9KzdSR
	4geleVayiPs4m4/bj0EPAfZDFjv44DRlCwxqg5EvBWuJdw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h8fex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:49:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bccca5620so5810678eec.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782132571; x=1782737371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBgL71/3RmD2QYBALbwcAC5GyQQNU9UzYK85MCGr084=;
        b=Hxb0ecZHB9PwvEx8rCaOQhZ1kGsG9mcgGtNDD9pcYfK6aqPcm6Y8IrmGKYr6u0crg9
         fLQuacWcSElvMUetT+NoQ60S0qoeEJccolIlc6rbF8v/T2zqtxZqeHpbJ4V58n0kxSgk
         kvTKRr7hBZQ1eCWjRaPvTq4G/pSuDQOfcNlAEbvKA0hRu4vdNj+CVmpy9Z7FfDGCfNgE
         4UoY4CekGiFvHDPdEKG9s/oUBbkAS6+EE1o+26Lq3CaExKwPU/nRp4nox+eII4wTW6Iq
         Qes5OTl1v68vJObBQtwAPkEY64fY4Efulfe4REOp79DCnHEDp7KjORt2ZX0XZb7icC1D
         2Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782132571; x=1782737371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBgL71/3RmD2QYBALbwcAC5GyQQNU9UzYK85MCGr084=;
        b=PpvBnjuM1e6cZWR4IC85xs746IhTDlt6OV3S6ENoYqL3miimuDbBo46dCSgUPMTsFA
         ++w1Tms+UCmTvF5gGGu5V6OE6CtXg09oLgzPkqRAumrxKK4PanEO93V/M4FIr7kovfs8
         ReLJS800RaVOhnyB0GXmzIM1uSU0xjYyq2rxFwiOnwSFwnzkb8fcQJF0pwkgyV1IXDVZ
         nN3OWQdsgLb12XLTtJdZ1b3+CUtMWWngJ/+2BFxjbR1FGSRAc3TG1Vbsbxy7Qp1MCygq
         4tNZNCzXCGBRAKDNk7KGAUXwU34ZowjuejMjhOMF/LoWJHrYYtadTBlwuVFACiuoJi2J
         8aww==
X-Forwarded-Encrypted: i=1; AHgh+RpmJnyt6yQoLS5v/hZzLZJG3XhhvDgh1yNPiH70ARetGUQd+FiA0lVNWu3f2s5C1qhta9WcygvZJgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdg94aFLqFiNUuGHe+pZupvz9bsa7StkUMgfXkE/tjqqhAgVA
	OjtY/FcQ9JEWpVlthdAdYc3BQGkghpPuGPLPZ7WypjTLXfzJoIHq9pmXEZJiLLdAQaxdC/MY+U6
	ZDyT87EIarfu3uoUKAz5TxMeqi5KZlfEoThklat6GM9msmzdpfGVCKdmx3roIBk8=
X-Gm-Gg: AfdE7ck/BB2I+O0vI7ANct3j+s9rW0QMVKR5uurxo6oSr9VT9Wktttl4KCqY4Yc9JWT
	fAo/e1HHjPnIj8NAgfhAL4i53PrgnhzirnEj7l9p7bvDCtJrbHiHexP+SGOaf1Z/QYzdU3C/2u3
	TuwupkVcravmM2Zfb1hf2QlisIht8hsKhLfgE1bmFoRQ+97QzdgcCPGb/JX72gKo5XLbkjuwbhI
	lcNIJ28zwKB9dV4W5k4DWbpXHBk8xAKQyzsRrFYtbt1WmhEFs0cmMMolcuWftaqwRUdaWSD48xj
	LRBJUBYgQ1Rz54SL1qRaKe7R4PUi9SMfjfcS6qbE0uBl1ekqIMW4u3a1cytlQ5pZwPuQ0WjyU2O
	VEDqtP8aLE0bHS9Mg95MlwGvRWDzGJW/qLY+IVpE0H2T3JKTgKM8pkcNUDw==
X-Received: by 2002:a05:693c:42c6:b0:30c:1b70:896d with SMTP id 5a478bee46e88-30c1b70d9cdmr5364487eec.31.1782132570490;
        Mon, 22 Jun 2026 05:49:30 -0700 (PDT)
X-Received: by 2002:a05:693c:42c6:b0:30c:1b70:896d with SMTP id 5a478bee46e88-30c1b70d9cdmr5364453eec.31.1782132569728;
        Mon, 22 Jun 2026 05:49:29 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1f0a9sm10322450eec.2.2026.06.22.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:49:29 -0700 (PDT)
Date: Mon, 22 Jun 2026 05:49:27 -0700
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
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF
 regulator support
Message-ID: <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MGNujsBN89ayaDwzqoSIdF_wp3pwt_1v
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a392f5b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=a186fHh2H6T-cRz7arYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyNyBTYWx0ZWRfX0iv7+kfdWhTV
 bX6u4wRaTC3k5r5GkekX7J6xY8U1BNWdOISl5i/KtxxAz7lfgu6+gK/nOPegTjqXFri0WQznT+V
 ksjGo0JlzG+71L56YQeU02vVYxiyF3Y=
X-Proofpoint-GUID: MGNujsBN89ayaDwzqoSIdF_wp3pwt_1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyNyBTYWx0ZWRfX9x2ixYXMj9/u
 WYSSpyKudN0aAJMKzCcIyEPRbZdiowmb+kRm1xB+8NWYcxYHpLXmp05qYPACoeYPl6Aui1TLHIK
 nuH2ViZcnJqjFUdSOHHakWpMka8hAubppfNKZwkbbySMuK3Cxg7MNJhrP9txAZ9s6Xk5RDjfxmX
 tqzCOT9SmSIuEr1DU28mkjV6ECrsVeOQRT4e6zujsFm45XWQNLiIWXQSSVyrOBOxVRHZzi4Btvd
 X/iepEK8925rPSiFGRnf9AmACMTvQ41bkQCliklMTjl2gINpjdxu6VOIun0sZ3fS5KGd27QWjUb
 1TLOQa7wvSHGK636FOwjKmH/MekJ3HoVvDwoBuvVyFXtSHmy8aXU9UbOL37EydL903Z605ZSoEm
 lv/OQltq1usVyeAf6sk6p7RXv3HEVDL3KPt6/4jQT74b3m3T5RZmnBbKi7S9XaYEZlOLHqrrREC
 RdmGDZ8nPkVCRVieB5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220127

On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > Mahua is based on Glymur but uses a different QREF topology, requiring
> > distinct regulator lists and clock descriptors for its PCIe clock
> > references.
> > 
> > Add mahua-specific regulator arrays and clk descriptor table, and use
> > match_data to select the correct descriptor table per compatible string at
> > probe time.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
> > +	[TCSR_EDP_CLKREF_EN] = {
> > +		.name = "tcsr_edp_clkref_en",
> > +		.offset = 0x60,
> 
> EDP goes through CXO1->TX->RPT0->RX0
> 
> > +	},
> > +	[TCSR_PCIE_2_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_2_clkref_en",
> > +		.offset = 0x4c,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> 
> this is apparently for PCIE4 (the name you used unfortunately actually
> matches the register in TCSR..)
> 
> (ok)
> 
> > +	},
> > +	[TCSR_PCIE_3_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_3_clkref_en",
> > +		.offset = 0x54,
> > +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
> 
> This is PCIe3 (actually)
> 
> CXO1->TX->RPT0->RPT1->RPT2->RX2 (ok)
> 
> > +	},
> > +	[TCSR_PCIE_4_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_4_clkref_en",
> > +		.offset = 0x58,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> 
> This is PCIe6
> 
> CXO1->TX->RPT0->RPT1->RX1 (ok)
> 
> > +	},
> > +	[TCSR_USB2_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_1_clkref_en",
> > +		.offset = 0x6c,
> > +	},
> 
> (usb_hs phy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> > +	[TCSR_USB2_2_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_2_clkref_en",
> > +		.offset = 0x70,
> > +	},
> 
> (mp0 hsphy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> > +	[TCSR_USB2_3_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_3_clkref_en",
> > +		.offset = 0x74,
> > +	},
> 
> (mp1 hsphy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> 
> > +	[TCSR_USB2_4_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_4_clkref_en",
> > +		.offset = 0x88,
> > +	},
> 
> same as eDP
> 
> > +	[TCSR_USB3_0_CLKREF_EN] = {
> > +		.name = "tcsr_usb3_0_clkref_en",
> > +		.offset = 0x64,
> > +	},
> 
> (mp0 uniphy)
> same as TCSR_USB2_3_CLKREF_EN
> 
> > +	[TCSR_USB3_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb3_1_clkref_en",
> > +		.offset = 0x68,
> > +	},
> 
> (mp1 uniphy)
> same as TCSR_USB2_3_CLKREF_EN
> 
> > +	[TCSR_USB4_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb4_1_clkref_en",
> > +		.offset = 0x44,
> > +	},
> 
> ok
> (although there is a comment suggesting this may be NC..)

I checked ipcatlog, TCSR_USB4_1_CLKREF_EN is not in used. I suspect this
USB PHY uses CXO as refclk. If so, we need to remove this entry. 

> 
> > +	[TCSR_USB4_2_CLKREF_EN] = {
> > +		.name = "tcsr_usb4_2_clkref_en",
> > +		.offset = 0x5c,
> > +	},
> 
> CXO1->TX->RPT0->RPT1->RX1
> 
> 
> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2

I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
require QREF. So I didn't provide its structure here.

> 
> [...]
> 
> >  static int tcsr_cc_glymur_probe(struct platform_device *pdev)
> >  {
> > +	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
> 
> Please null-check this
>
Okay. Will also add the regulator list for other instance as you suggested

- Qiang Yu
