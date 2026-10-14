Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3A560ADF
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995750; cv=none; b=OqL7yi9EJXvUqvE3R0qu2hwz2Et5oLoVqftKU4q8AvuOC98YGsjARFScICfzQWDI/aOybo9gR4IDgFOes5lP5wpeA0poeGaZV0hcuoNa2qrxUL4ZMh57zK9tr3gaa8DL0sGg+LFUhYWKUJxV+6mlpWyuYJXyGQMTXmCKVpcsKOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995750; c=relaxed/simple;
	bh=X7mKNHor3cLzTX4RTHI+QUppUjJFb+b3imTL4fc0ThA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWRfv2kUM9Zf41FCRamJxpnWq3vVKHhiDNA4Wakm/IDjFYmP9dYRTDz3a2mA4WrgndZBhe+LDy4lVeZUbnkOIoCRsEOxtBhsepfyPGOvqIblLcLAUDvxr0lsncY5ib5aBOA29Bw/lOOxNuhNuttq2qpGJxyVFX+RmAYE81r+b4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct5TPH8N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPKGg5rR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct5TPH8N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPKGg5rR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJ0d3642818
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HpmIVHID1TA1uCqcusH2OmX1
	9l/wk4ki8tc/4k57N84=; b=ct5TPH8NgJ+6hz9IIbYXlJOOpxRT8n5U7uAB9ouK
	COsMrXkI4FmK3lof4Mz73RkJFJtTbOh/zK8swqvWDTo+qdZSZTHFUDviu/5609Xa
	qpeHhbtPHsSnjFifl16byXoQ7NC/sByLV+EtHqNAHOUzZ0voS7TjkmGb6mTzN6CC
	EwmQG2T8PPptEvr8aTIcwHokuJsb4Gl7RsCLEdIGaZkZh+7oAl+88uIE4m6tM5Ot
	r+OfbYLPMyMNilHf/HHSPxkZWM6oYjHdmpSXYtOYbIHkbtQ/8yv4wqo/IXf/s7oN
	Cn+tn12kZF5JxLbHEiPQcoa53dmWG1Vk15eZehqLBoTRBA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470ahak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:35:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9195c59ac8cso135573596d6.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995746; x=1792600546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HpmIVHID1TA1uCqcusH2OmX19l/wk4ki8tc/4k57N84=;
        b=LPKGg5rRpjCcgUaaNSFkzMk4CigG7cWS8QH+NolbnUltP26tye4FuBflfA7pp45ER9
         x4Jp1HDO86LkB1mieUMCVNrfEpwBn6dz87qbdORs07awhs3ZiYTqltxGBXZt/xWOPOxX
         QbbBVEYR5Rd52UsgflhpR5a1QFR/n/y2bSMBBDyH06gjSiTuuu4WCHo9sR6zF6QkorJg
         x4Q7wK+F/tN9KUrm0hBEFzmuhVA06VYlEbtjOhJPD6B/tPh/mYO4HjXimsNrt40YuqaN
         LJEFuU2iwvujzzl80jlyOX9tn+5EFFK7Dd/0Z/movPsQ9bc21JNvPn7oahKSTEJ9CSDY
         2pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995746; x=1792600546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpmIVHID1TA1uCqcusH2OmX19l/wk4ki8tc/4k57N84=;
        b=cxpKGtz+i7sLBGtKPiS4wyP9iPfIt/yWfIG4A5UPohL7I6egTM42pY/Mdj9mXsT0/k
         U/nkl6i4ROZSNtYt89GJxeaebTVwycj1xLYODzE8qMh4X4zLrJBb+OEG3TdkZtur7NbX
         5XSk0PXqk+5xMuI1SZcU7WSyJ2ji0EOH4YCnrCQhtNKrCriiOGqn8PlWdvZGMgwVkMSm
         gtBHZBvUknmlyxXPXr+pVA9HtOghP2RUkzlMIT5M6fJtf88DmIDe56dOhTSe5pV22iis
         LpUdJ0dthleui06B4HmHQXRuRIm96COoJNOv7rhoXkR+/yvfw/jIUsVWAPk3FXQUuJVG
         QJgA==
X-Forwarded-Encrypted: i=1; AKwUvBz9TYrzAyZ92OcYWRCtDT5FTJx/BrcBIvrGzDr2Ood9urjCcRvtDtlEcb8IQNxkuhH+fc8NbA/87iA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8vjN2jy+2xOqxfKU5KxOCohsIUb8ZsPropKco8vpisBSU58Og
	kxU6lEQTrS0hUyzCQ3w9nvS3G/FNuMHJ3ecqH9RfaSOMnl22QafwIxa6BAhWBZE4O7BGq1rJptA
	e+JJu2FDRlyeohFpNACZXlwKBdA1PvyBzhSgLKQJ9I+AZiJIKvcdNfzswrXFVSdY=
X-Gm-Gg: AYBFou1QbwCMWT90MMv43VTIkiqQmuEBYljKggX//6fOANgwbnlnu3YY4WwbWmc/Gtg
	Jv8lU8/GYXwsWAUV4MVX0v/KnXXR4kBHJrtz5Lq4FMnMVkZZJNTAdyVJCWx7YTs94UnGLlKzeWP
	Nfc8DBAgrfnsU2gJeVQM+dBvS3Iwa4/lRo4sT4MGIwnqW7VOKsOTXeBCEKT/v7CetFZeJjAYXc2
	dq3mzI1wHBKY0s6yNqiYMusToVDo0SqBb6DtObBUn2v6PVrQ6dXIiB2I1nKYM8kdJWbefE6vjsi
	TJ7LoPWmB2/CdzNDUS9xbNXGHslPHbXLfsykgehh56rlgrrOdwqbNsB73RtgwCKCht4IalAg6eF
	HVYeZPatKuGLOXCPVX+DpO567Bqlz4sJmRAEfD7jZkCQmbLGLwJ58s8vH0eQ5Fyca2R2CWadZTR
	eVrQJHVmP5BwuH
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1967089285a.82.1791995745884;
        Wed, 14 Oct 2026 09:35:45 -0700 (PDT)
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1967085285a.82.1791995745377;
        Wed, 14 Oct 2026 09:35:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33da271asm764183e87.81.2026.10.14.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:35:44 -0700 (PDT)
Date: Wed, 14 Oct 2026 19:35:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
Message-ID: <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
 <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
 <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfXzWy9ub5mFQjB
 nnJiJPGw4fXWt+RUfnTRH4k5odZqoSCMXNnmx/DJ3ycnK0jb9IXClCWQs54Z9ZqbTWxKPIDZG4R
 SybijhWnBTwOy6RXFJFF6ngJwc7iXQ2df55rIf0BQO2rLoZ4L72PhvXXvcNLONZxIegsytshydQ
 tqmRA5goxEN1X6SS6m2PTL2JZgtgfo/p66uovUbqflW9iLumcIUKbS8kKl+nzDfdbkffReOeAvU
 qmK0o7DSNFDcuj6k8vUFedduX3PPEm4+tZd17pPDgG3Mj+kAthVVM4Qxq0rxB3gdP+G+mtBzmXH
 ayHMs6mjmqTP4sbKeyjsoXgrfDHUx3RZUr2qviZlHDNF0z4xNrO8Z5Tu7S8c6peMs1aUwy4EUap
 hgXih6hZrQgE7WPF+0gAEAvUs9uISd12CEYIw5oq+xmgdoHXsr1X11JJKh8jiOZ22+bRjsWGmkR
 GAMlBq5pLCHxZCd19dQ==
X-Proofpoint-GUID: tB0vTYop1kcSS86c-1r0HCyCHskvW1c4
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfaf62 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=N4fB7MosYFnxNERqB6UA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: tB0vTYop1kcSS86c-1r0HCyCHskvW1c4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfXySYSzPIH4cdM
 H0fzhTQJEbGUlxVeW4MAnDKDvA+Tq8+aMkHFz8zRhSQarD2GMKpzjLyOJ5OWU5Q1hsLPC2dRx7C
 gnCQTnKZvCdR5+2WwqcVGtFryBCXjbA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140066

On Wed, Oct 14, 2026 at 05:22:40PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:40 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:14PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Make use of the clock-dvfs infrastructure and fill in the power
> >> requirements for SM8650's clocks to ensure the hardware can operate in
> >> accordance with the specification.
> 
> [...]
> 
> >>  #include <dt-bindings/clock/qcom,sm8650-camcc.h>
> >> +#include <dt-bindings/power/qcom,rpmhpd.h>
> > 
> > I've commented to the cover letter. For me it feels like the layering
> > violation.
> 
> I understand. I still think it's okay given this is a driver only
> for a specific SoC.

Then soon we will get MMRM submitted upstream, which (currently)
randomly imports a set of the clock ids and asks consumers to talk to it
using the same clock IDS from DT bindings. Doesn't sounds like a good
idea.

> 
> [...]
> 
> >> +static const struct qcom_clk_dvfs_data cam_cc_camnoc_axi_rt_clk_src_dvfs = {
> >> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MXC },
> >> +	.num_pd_indices = 2,
> >> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
> >> +		{ 300000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
> >> +		{ 400000000, RPMH_REGULATOR_LEVEL_SVS },
> > 
> > And does it actually have the same vote on both MMCX and MXC? I'd need
> > to check the clock tree.
> 
> In this case the RCG needs VDD_MM and its direct child branch
> needs MXC for the flipflops.

My question was "on the same level? Or on different levels? In the OPP
tables we (should) have 1:1 between scaling PDs and PD votes. 

> 
> [...]
> 
> >> +static const struct qcom_clk_dvfs_data cam_cc_cphy_rx_clk_src_dvfs = {
> >> +	.pd_indices = (const unsigned int[]) {
> >> +		DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MX, DT_PMDOMAIN_MXC,
> > 
> > Three domains... If we want to have three votes, we really need to have
> > three votes in the .rates array. But then it starts to feel like an OPP
> > table.
> 
> In this case, yes, three domains, same RPMH level for this clock alone.
> 
> Konrad

-- 
With best wishes
Dmitry
