Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B3189F43
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 01:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771810044; cv=none; b=ReIXpcWswgIsfD2LOn1o/eAkyOu0TZVtboi/ivlaWcrF1OqUXR3hQrd3a5e/guPbOry0Yquj//B2H/dmUEKybjUyRUyNuVbv0di8XZ+cABceFTWp0jnuz9Pqz/tiFWToBCCk9yaoHOTysubnNzgvbewzD3PXuQVQ0en9d2aA1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771810044; c=relaxed/simple;
	bh=0G3/fVFWXDWd5zj6OScRBLA7Pto39xgPATr4cu62hGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN01/aVGxGD8SOGUg3S3FJJeghlAOBOfLl4QibCuw/nzgo7AngYXQgJInB0xVKHhH13Ve26T+gLRKWjSqg8g/LYiE5ms8nBXdmnBfjaBwg0WQY1X+/pSTn67+m17cLFrHIn3oqg2jYTr+SWLXw+niN1Nbj0Nble6tR9G8zSpoTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNS9gO64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbOpltJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNS9gO64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbOpltJb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MHi1351883531
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 01:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nc/80AnnWzN7Qo5u3ZWEwQKF
	DtrZaT4Kue5jCLEJQfQ=; b=bNS9gO642xJRcQUTr0Yep2Af/2ExXZssXrHLX6T1
	vpovU956i6r3RufAlUUT39qyiRpqRXM8Pdt2IIblyLz8/tY9SEFna7EXh3/31Ka1
	sx087LBjlwy43/hFJkx7gjwImm2RhxtamB5O05pPKHSUAbNTA/4vlwHby7A0fO0M
	yCgU/0wmpbTD+agoYBoLEbYeAZwjIA8w+D4K9mQ5vj+NT0PMGIVvub5Cshk8v524
	Uroh3SHNGUf4IJXqVqf9eD7rMxGAMNhvfZVlILH0CT/XWC5Ih7T0j2cHNzZDjLuR
	WTlNX0uQJfOjBOFaZpBTpYUAfGKEumARTrfbQA9VVb8nxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyu121-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 01:27:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so4908428685a.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 17:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771810042; x=1772414842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nc/80AnnWzN7Qo5u3ZWEwQKFDtrZaT4Kue5jCLEJQfQ=;
        b=JbOpltJbJbjt/WqLDMTVnf+pZ/6Unyr5oS+Y/MsaD+p2JkMtlfd2hwcZD+16orKTYL
         yaX+omxo4Y0na0NPLc/Lfu8XP3Nrf1VJW3SeOQhnYpQyqlqzEvXEsVw6KCVrMGmTXPWV
         +EMaALj/aNwR0hOaTo3x8e5xC+OF8wIT6XDeHYsI1hoOdC7/xhHd5KFimLhbDFKRpKfA
         mgWkspZjBR3C1v2XTdcokoQa4i9uXPOEonGpZEDi3+ADtttHUabvwlaih1e2iw2t8Wg6
         auy7SkoEK+5ZqRZ/PteUZvdPzrcZEdylvg9zMF2WbGmdATK0LSSX/gshsKWxHBhbYgVl
         kB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771810042; x=1772414842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nc/80AnnWzN7Qo5u3ZWEwQKFDtrZaT4Kue5jCLEJQfQ=;
        b=IC8upuWkRiWg/d0s47YZErr/Z4tuWve6AGsIy9kfv49IOH75mF7c+sfK/zc2nqQYJz
         +vElE+IkAl0OoN9lSG2hTvgBTOAjTkxawZlQfDlZHf/0YLAqQfOQp0WJwAYvBCM+j9kl
         C4MDGEKthSXljHhOm69r156FMmbIQy/cpO33/K2Ai9kXcUysJqEJSTfib1hVMQGRdVdJ
         ezeq+DI6JULImWAuceCFerA9nn8JIh30mxzz7pBVQtnsVXXck0o8AiXySxTxjGkPdhjo
         RQqwen5NSi9t2YGeaTteK1TmmVB1ExFWXEiZ0QXYN5QCpfHFZVZKJljl+OO8p56CjkS9
         SUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZzd2CRNZiot3QamVn1zXyy75kui6yC0KAzeQaJ/vjUDi6gvdRsMp0aB5IFpcxiuL2E69rgNwK4CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YycUPakrj8KXBxHm5dgkF+YGR7EyDye+ottaJUoG79jlYyN4EsO
	WiC0+Gg7LfMWItrW8HaKU4Yr6514HM9PUTtvvrvJ6sWPm76ord0f4wNX6e8Nt1AicylRL9ZGAN+
	DFwWCKi9qTkCq3rKoffnMCEEO8fURTPBKagEpn76qXtaqjtfpDJY82ioppTX1cKc=
X-Gm-Gg: AZuq6aI2vHXsX2kF8cnGstC1nYz9/3hKGDNL//p1qG+GyIUP/LveUWlBEHMeyhkhddJ
	xwhb+4sUujYW3eh0oShfLYsc1+WE2l0e786QNVxZjuI/WkpzLiQoEslR/Oq9dg0CRSCP4Gmmk75
	2skvqhd6a+L2SExNzzCSzOSC8iO8k0ZEQCxXhTRJ3RfnLuWLIfrwod9RFSO2i39PdscRLTE8CY1
	n6Syc4iyX3Z9ggZMkycgSUH5WPNvERBCIBoT15fhBNP5QrUOY/hgx5C2GZ29TRez6esqhDeGKdk
	EBzIsNZZauXAy0xetILHUQWw2ZjI86ul6/iRifZv/SBGhhI59hup1Mq2weArVRQFrg9RvCQcaxa
	aH6w08EEovGWqp7KkvQ4DDE39Q48xubJ3JtKA2h1bCllCjTtLKsV0qHMw/WWar6tfg5uil7jhIE
	B1DJ3pGJqsYEbr/4dO5V42M3O8bK1sNZVjo8Q=
X-Received: by 2002:a05:620a:1908:b0:8c5:3045:854f with SMTP id af79cd13be357-8cb7bfe7916mr1526393985a.30.1771810041895;
        Sun, 22 Feb 2026 17:27:21 -0800 (PST)
X-Received: by 2002:a05:620a:1908:b0:8c5:3045:854f with SMTP id af79cd13be357-8cb7bfe7916mr1526392585a.30.1771810041462;
        Sun, 22 Feb 2026 17:27:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78d2326sm13201841fa.15.2026.02.22.17.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 17:27:19 -0800 (PST)
Date: Mon, 23 Feb 2026 03:27:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
Message-ID: <mgsigotfsu7xbquwgsrrm2rctx2e5xjmaijg6b7nzaedqerefi@oxvufd72novr>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
 <vbmo6qvepw5sjmtrffkdiaqulgqrhxlo3lrlzxhjz6i252efvg@uyhzdskc3jut>
 <wiztxwsea2aojcxmcs2q4vskooli7lrw3oio75bij54273mrbr@ody4vonry2qr>
 <857f0582-8b46-4bfa-8c62-5ca6f3d0aec5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <857f0582-8b46-4bfa-8c62-5ca6f3d0aec5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAxMCBTYWx0ZWRfX04JUS1cru8f/
 pTU2G6hLNGq3+WZ45BEhW4dJNpAs4OsET9zk/QMf20bRg3ep4NkaFlonY8xecEtIUmqrlUcnA3J
 knLSnwUqoCQUHifJbE/QJrzSqbpU6yMSUH3dplni/rkkUab9UjxIAegx36Xhte183Lc385+8IGA
 m8fr+lgIpl963FAAC/d/y6Z9OzKiZTywFbP2TE67977UYCMTMSlcaNWKNRM0ZrYdFKK/K5IwuMQ
 e/xYe9jd3xyg3eJM5R82q2iUl7E+YAx1Hywtlfhu8HewTIsh0CdIISDAKlDmLwze86bUi6mmSnf
 E4Z1AU9bxL/F7leAcL5TmuIh7S1yTXg9ykM8QFCv3jNUdU1lBGxKBnTB30/aVOhlDrUVasonrJs
 1RbDtXgrSAmZP6T1IcmvM/1lTvtoetKSAmHL6pkmdWgLaDKkm2HOcQ16BidehC+aT2fmBABFgXQ
 HdYnlpGvKMs7glWhp7A==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699bacfa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=J2S0nMzMed9wqxottccA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: G99wZ0QhTSANCfeyhTGbCNi-iZnc4Jk0
X-Proofpoint-ORIG-GUID: G99wZ0QhTSANCfeyhTGbCNi-iZnc4Jk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230010

On Thu, Feb 19, 2026 at 11:41:06PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 2/18/2026 9:28 PM, Dmitry Baryshkov wrote:
> > On Wed, Feb 18, 2026 at 08:49:34AM -0600, Bjorn Andersson wrote:
> >> On Tue, Feb 17, 2026 at 11:20:42PM +0200, Dmitry Baryshkov wrote:
> >>> Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
> >>> on until late_initcall_sync") setting of the display clocks is partially
> >>> broken. For example, when on SDM845-HDK the bootloader leaves display
> >>> enabled, later the kernel can't set up DSI clocks, ending up with the
> >>> broken display, blinking blue.
> >>
> >> This describes how the problem manifest itself. Can you please document
> >> why clocks are partially broken and how that relate to the GDSC state,
> >> and why setting GENPD_FLAG_NO_STAY_ON solves this?
> > 
> > Probably the best answer (for the second part of the question): I don't
> > know (yet).
> > 
> 
> RCG update typically gets stuck if the new/old source is OFF while the RCG is ON; but
> if the RCG is already OFF, the update proceeds safely even if new/old source is OFF.
> 
> A possible theory is that if the GDSC is in OFF state, the branch clocks will be OFF,
> due to this RCG also will be in OFF state, preventing the update stuck issue even if
> the new/old source is OFF. But, if the GDSC remains on until sync_state, the branches
> and RCG likely stays ON, leading to update stuck issue if the new/old source is OFF.
> 
> Ideally, if both old and new RCG sources are ON during the update configuration, the
> update should succeed regardless of the GDSC status.

Both pclkN_clk_src clocks have CLK_OPS_PARENT_ENABLE set, so the parents
must be on.

-- 
With best wishes
Dmitry
