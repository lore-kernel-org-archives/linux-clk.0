Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238675;
	b=t3lwzp1MVvPnbbF5ydg0VMCF9bgaZMLw7JJe4o6iMfh6vW4UqzkYFJjLKJ7lhYRU5op9
	 mt9FElj1CoxhGXP0nEPbrQOS4HTURi49gcTPPcqHWUN74Rpvn/t8uRcNLAFeoHV9VR8Ps
	 /NZop6Gd+CiSEoL66jJuFlcpR45crj+tdFAhGWNdtyEMMoZ+7DS6m+AGIohURDfU+HzIS
	 e/7cYFYUvIJ8H8u6z70iXHYmfqE3CnV7gLiMaAABF3BrYWbsmT0mhZ7peUlOO6MtQMHz2
	 IfEORljWx0l5x6UiolEjvIikDWJPUrikgPyVdg3hDFTj7WfO+tj5iySlMqo5p0NdGPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
	b=MNxccLK8nehXyjo1KMDKvjOymveOH5r+X1KkxlEWAV09Vv4s7IrYF9qTqjz+iWQTPjfj
	 fU4m1IfPMLVqk5HFb130Mx998Me3Q6Y+2gha9I8/FBuwgTqHeUjL1OhOYY/CPrwKrcjQ9
	 Mdb9b3Rw5RRh8RAjnvFBXTGITgQXh63noblady79KOn/l6n8A0OCjHtI6Znc99+1matuN
	 KjIINN6KbJ0lcDRM1zOn9sCJJzfaK0SnV86YFSwOQyFaTPFFrHiMQIrakIJvWyGxZTbKF
	 By24dUu+youSagZHA9fIMl1YHu4ZHqC7mtWg3Lmu8aCL1J47PrukXi40kNKCS9eLcWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjE+YALq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f71RSJsk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF43606A31C
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 01:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjE+YALq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f71RSJsk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jZ7e3438266
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 01:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2NgBNbLq+9RK99duvmMJui2c
	E6p6jlGXHry0ZBzeGwQ=; b=PjE+YALq5oSs0K/SsDeOpvvR0L5UI9h9ymC7pRL4
	Sh1CdtNvbAUhOeF+ITnRzndDlS43zOdQvMRl7oTlwDSxC1XtXQ0pYSP9QWcOM/Ex
	6lXeUF6dfiTvAdaP38CmtZ5/rBba9KVHhu3X1dfXrUyxkTG/jYH+QWCnTWmqY+iR
	uMyqAaqquH6+ior3SZemUKnpK8mwg/+epjGvrdVh96j11o2rocDcEQxzZGsLg2et
	Z1v9hBLCt3l7nq72oN5/TEdSlaH/Bt6/qRPvCdt2OM8IYQHV+iewGf5ppQM5gQrE
	kBVaIbnuhE4wrRxsyrtRrQCa6ONeslB1TOwuvj6hxKFYvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc1c1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 01:51:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso56218785a.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793238663; x=1793843463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
        b=f71RSJskHUY8w0Up1IqrAWrSwJ7qGp7VMJPalzdmC6nWtGtY0GtO0lQvAIKMaDR+st
         OhwIHpUSb7y+7bsUEJqUOqeEinweGKXfKLei5UqkvHVFmTNgRdb5s4rv6suzhE3AA+ix
         SSwKewQloywHNNyJkKSTXIUOF9Xj2ScQfP+wmkaM3WuHC7e7ZqaynF1rTK4iZOqA7V5w
         pieba7oY8GrhYd6CtejMLlgoiU6wx1CYH5FWSSCo57w20zrI3EcOMO3+oyt80kmE3H1K
         /hdD7KQXPPAMFzhfI49agL10slInQvPueJC6Sb77zCNity0kgwVLQWDIUilpSsj1fD4c
         myUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238663; x=1793843463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
        b=2COXlOCZ8z9MHtkmovRrNZm40s20mYPG1DRfufns2WpOdBY+jfDCTAtbBpkCN9uEHM
         Kr3qrdcef0XE1W3WF9MhAeKMuLbWXREHZincfsaln/wV3G0QeWrnUqN4K4C6/gDkpVP3
         BSy4cIe0JVfXnTzMuY3eEaeT48NH9gvY0dBQ09wiazBuUyNA1rJ+1qZ9KqNrLIvNdbai
         xBJE/Hoz8KGZJw3kKwnIfuwJ80KTwmiY0ex0t+QOhstbsmyOV7DxM9GVPwf7k55p2N//
         p+cc8yWy7KyTvN813pAwmH8WaDxPtY7KfbwRCiHfe7IHX9/lddT0sQvIwkicOnW4nfOI
         7dyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8ouIwOz2YDu5qDvRyXh66ldZBhOB0yg4RBriiRYvk0OFrhUwZi9w+DBSU3ZW2788US0IWgyhtgps=@vger.kernel.org
X-Gm-Message-State: AFq9FYLra3DaiwCNZ/kbHM27UoMUxAymBT7+FeUiezZF/Wiwc3bH8cQa
	po96CsFD2+tM5XXKJHjJmFrVkCDxjOv+qP8aItS7YBns+ziFgZ4Zzhqm/12FJuEX/cbm1xQmWy8
	7GvlcfNIRyIQXseEv5nYl4kZ/sEMVtVFyM6LivNuGeV/f79P1mAHauZwx/gPqGlM=
X-Gm-Gg: AYBFou2zmzHf2gXOy1YzpjJA4vzBeJLhtDOQ8tRiHhmp/B3AWGpLqyDAeUQsJv6ULcl
	olgETLMCayX/BRoP1ZZxVQVk4nRByvrVdZ19CNX2DyprGZHQ+DVC5sl/qy4aTleSLhtk1rR7YNT
	vXQxVIfXBh8GN3qnBo9wcq2y3ZXsUvvd7sSDBYj6l30xvNyH2JQc7HaHW41oaxMreKH5HJ5w2rl
	H3IOZ8902Z57LsQo+W2xG1Xg4YMjg5sMQ/hwHb7ORaLXW1+KnwzxdAEUFvmTTAQP7BLpIhOenMH
	aOehabIRqjBs88IUEketS1jTf1vzjMJxgJZ42ODyu/WGSY4KRKJeDrwD0gV5Odch3i2Am0XyaN0
	tB/Y9EWz/RBo49RXwsQcmuL+VzUAWrAxEgvZJGUJtzBM1C6sPdRmeG/M+OvNB+oTr2JnnOyP0Yt
	AaY+cotr3xHW43pw9SC41HMmIcdc7nOSz0iK485DuEp76ReQw7uM0ix5zruyStnQ==
X-Received: by 2002:a05:620a:2815:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-94413381feemr207244885a.17.1793238662535;
        Wed, 28 Oct 2026 18:51:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-94413381feemr207242985a.17.1793238661951;
        Wed, 28 Oct 2026 18:51:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c8f4asm982402e87.83.2026.10.28.18.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:50:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:50:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
Message-ID: <uqtvrqp7rsmxcloz2fgzv2jbcofd3x7y6hm6plnan5mao4t5rr@6lxub7q3duti>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
 <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
 <Sm-FvdxaOiXpzzGo30wECHdQF_-LtUaJCO3mGpBUxXfnVCYjOLE5DhNWdNmOMhYdkR1RMXhPzWuHhsZJkJ_Vzw==@protonmail.internalid>
 <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
 <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae2a687 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=z-wHjszcAMnUrtkC1bAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WVyV4VTppT27uBr-lqAumkmmqfHrQWx_
X-Proofpoint-ORIG-GUID: WVyV4VTppT27uBr-lqAumkmmqfHrQWx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfX7EA/NXQi2DwK
 UrHvAPrbh1CclxHOE+BjrmPMLmZFoZURicoF9QalFvqT/p79ObFnP5AXs5/uDQdQkzmDcgrNPtf
 byZJoSrx2+o3FMCXzw0zwnkkHQ3w3tgvMePbZXVGinnNHBnUAo5NhIjklcCD5ORGpchXUsUOt3I
 DXyZekoxyhDHbAhsXBTf5Gj1Vgb9dwi89bq9QNW2Z5LBzuOcT6agwp5IcS6c+sN6b53bzngRAhC
 WxbsR8w8MCvrWIv5Z6oB95NNTfroZNnZcsU8kpDprgH7xatEIpS8+SGvFjH6mzOUeBTsaQVHSIb
 Smq3vW5fT5Hj/+I7jzm/vj2B91QmZrlCKBYrEDZY1xLyaDyWYvcwfwBjEZnoOHazY0ufltouuJd
 Tp2hIDXjMzw7BGEM0PCKfVwUcCe2S3ZbhUP8qgNg57ep5kypWOc4NvGGCZapkaUcSKT8uu/2Zzb
 B33jgkvBa6vTJgJedFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfXw1AkM9AIegxx
 YJDH6K9VOxBhItj/Z7l4eg9zZquZw72aUfxjOdgIS4eZF6oXnuqzmzyQfpfa6PqaDsnd75jbKat
 wdtEa5kg+ij3x+2eUgmiGXUurwOTeDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290007

On Wed, Oct 28, 2026 at 11:00:29PM +0100, Bryan O'Donoghue wrote:
> On 28/10/2026 19:10, Atanas Filipov wrote:
> > What clock votes cannot express is why I think the camera NoC is an
> > interconnect:
> > 
> >   - The camera NoC is a bus with several independent masters: the VFE
> >     write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
> >     and the camnoc AXI clock sets its throughput.
> 
> I've always conceptually viewed the CamNoc as just another NoC that happens
> to live inside of the TITAN_TOP_GDSC power-island.
> 
> I think the trouble here is the CAMNOC_AXI_CLK is just one clock, it's not
> interconnecting any two things at all.
> 
> Noc entries in DT usually look like
> 
> interconnects = <&gem_noc MASTER_AMPSS_M0 0
> 		 &config_noc SLAVE_VENUS_CFG 0>,
> 		<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI_CH0 0>;
> 		interconnect-names = "cpu-cfg", "video-mem";
> 
> In the second case we're connecting an MMSS port to a DRAM port i.e. two
> completely separate producers/consumers and we have specific ports that
> RPM/RPMh is involved in managing.

RPM / RPMh are Qualcomm-specific abstractions. If you look underneath,
you'd see NoC clocks, being managed by the RPMh cores. We also have OSM
device, which describes how each of the cores / clusters is connected to
the L3 cache. On MSM8996 similarly there is a CBF device, which
describes connection between two core clusters.

From my PoV, CAMNOX_AXI, is just the same NoC clock, just not being
wired through RPM/RPMh. From this point of view the clock can be
described as as an interconnect, it gives correct abstraction: no matter
how the camera blocks are connected or how the connection between them
is managed in hardware / firmware / clock devices, there is a bus (aka
interconnect) between those camera blocks. If at some point the clock
becomes managed by RPMh, it won't (significantly) change the hardware
description

> 
> Which is not the case for CamNoc - here really we have some shared clocks
> which we need to calculate across components within the Camera power-island.
> 
> In downstream the CPAs code does that.
> 
> - icc-clk would I think over-provision clocks
> - CCF would as you've observed under-provision
> 
> - But a CPA's analog in upstream which components set/consume ?
> 
> That would work.
> 
> After all what we are doing here _is_ specific to how camera works. We don't
> really have many - any ? other examples in Qcom SoCs where we lump a number
> of different semi-independent components into one area - ICP, CDM, VFE, JPEG
> and ask them to share aggregated clocks - in a way that is specific to -
> guessing but - specific to how these components get modeled in silicon test
> benches.
> 
> My vote is to replicate CPAs in upstream with a CPA's icc provider driver.
> 
> The bandwidth calculations are already proven out in downstream and if we
> get it right - potentially its something downstream could switch to.
> 
> We could even use the interconnect API inside of the CPA's driver but, I
> think just doing votes via interconnect and icc_set_bw() into icc-clk in the
> drivers directly won't produce the same bandwidth calculations we have in
> downstream - which you may loathe downstream code but the clock calculations
> we'd assume are ~ a pretty good starting point.
> 
> So; make the CPAs driver an icc provider.
> 
> cpas_icc_set() could/should absorb the downstream cam_cpas_hw.c heuristic
> for calculating the aggregate clocks.
> 
> Its not represented in generic icc-clk right now and as we add in more
> clocks/SoCs this disparity will grow.
> 
> ---
> bod

-- 
With best wishes
Dmitry
