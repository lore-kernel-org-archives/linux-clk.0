Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D131B2D1931
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 23:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567780; cv=none; b=P53S7jFtBoPdJrAv+U2sacLfURln3VaBGTSi9iBSPsoSwc+5DDVKe2aUGenl6bAOcMZNdbOWasqi5O5Ld18pj8MZaptcXMV0nE8FWxpMBh2Kyi3X9dLZ9w9BTnSJ8QYlbJO4C1YfwRjHveI78o5Zw7snZG1R13EK7CrHVlKEU4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567780; c=relaxed/simple;
	bh=GSDE17dix6NM4G9TyF8RriQusXi8CIwfyjIN1giOcEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpv+yzPfNGYDROuagMs66PxaGG+Lo2gDqw4YJn6LnTp2B87Z2C24/wSsDi4XsQiiWx2fSEW5uP3ETxvuveY3fWOVzdlqGmnRVzNTSYucG6+4yGHnpDwmOLu2hVqL9LAgFltEOAUE4Bgd/PhRbTBA24VEqETB0FSMQB+Vqw70Ecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jcrbfq04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2vkd+cF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jcrbfq04";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2vkd+cF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ17qW1393465
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 23:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pGRlwJSIZC4OC7CDfGLngBCa
	nYzdpwDoYdH51ukyug4=; b=Jcrbfq04t0NEl+bQ4SMz0vX8ub9D5qnwJMVd+uOr
	T1yuRIzYNPO8JFMhkITMHXWMcZdcF7VPNw7EjcIeJzT3NwfRh0bVp+aaisw4uBMj
	tlhvszUMgO3i8mYCLs0NRcKdENGyfPI4LilFeU/DNcxXI/cEaFi6OmKc6vPwsR5M
	MnInXLQxHZtl2ejQos03+XF0e2os5nZwSfSgcRT6wtGPuKNjMuuIaDT1PAqsSB7h
	MADPTsJ0PhMsNo5FRuS3bHCALMn5Pblnuf2k6wlh220sP2R0WGRZ3NQNmJ356tJ6
	dWWLi+Kb0jO44B+sdhZO5jors91HkKxVsq9qorL9S9J/Jw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter23q4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 23:56:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91576c147a4so1006250285a.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567777; x=1782172577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGRlwJSIZC4OC7CDfGLngBCanYzdpwDoYdH51ukyug4=;
        b=S2vkd+cFHimI8OUihDK/cJKN7LulzQu6LHCf2l2FktWoTQ9m20GSyKk+Zpp+UkhTGW
         AKsJq/aW9I/Qdq4eOPdjnKgnJ/L4u6BbBA2C6VrdG64i25lqxrU8WN3c+Q6dsQfZh4jd
         uqfATszCjoxGO2z70SNw7NxIie92/0vEpUgD2cQP3mFB7cKBSlBNjACjTAzdiuj1oqR4
         ABe31SvyNYF0eY+JdNmmvSb1jWcc+7uZ+PCzofTLwja4FPdEx98MMyhfOodIsEG5cbsC
         MHiI8xlJd89UIAqCx+o/56nGSer1/tchK7ycZ2fbjEuO9Rn+XJayXWtWR+j8Oof8sijG
         cUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567777; x=1782172577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGRlwJSIZC4OC7CDfGLngBCanYzdpwDoYdH51ukyug4=;
        b=VOdzKxzuwKqmv3+gMDfSxypifhXRCrqJD4HRkBSioB8XtQGFRRbsp7e0p7Oqss5TZA
         BZni5JoKNkKv/HAq7Q4SVbCAzudGR7x/Msg/nlz5Ev0twOWgGeeUQeqMT3y7hgxrrTIW
         3sYB3XUNOly19mvZtv7qU3z7qPaL7qsFh5yOaKOqokX0G+AfpTseSkQJW/nT5NBgJCuB
         EwVWQJprWU4uUFvnyvIy3hbD5ssxperDlyZx6jpoSwpx630DNGSa5FKFjmAsDQm/wBmP
         Ln9QVg/nKcNhj6cNo9OIw4lVlLmkrrWIV5UJnQ51ovvotpJVCU5UuKsH6px2d2zntTx7
         3czA==
X-Forwarded-Encrypted: i=1; AFNElJ9g/yLER3V2wDX191IMMIortQ0ZzqI92zxWHvhOBAOyitJrwPa1F0Rvd0vwavy+80hi58IFzzYhaY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3k89fgwZ2JZ5JN7bTTpytVxivIsJlw1CEy0D0PUqbO46FT63
	AtZucefKyb2Dm8uLvlWb/HlIvO/BrWiXbOpgyUmYWoMSz4Ha/jZyyaTS/vHmrnzcUpzYoY4IWAs
	IHj25/gBrkwia7qjjfQP1P8BidKzlp0yX2MqthfMXWzThMV21gWOM+xB5EFr2pOk=
X-Gm-Gg: Acq92OHVBXqQzkjWDcPngIjSB7V+eEKO+gMvupz2X5CQ5IQzurE0jmur2/1GDREB9rk
	vuirJhWiF1txdZ4UkYeNLZ8luvtomFHwf1JLCdeQtEpLSypD9kxsxkREy6V0Qz7dAZ0823MkdEH
	SGyzHMCcOzGxS4IcjQAmwFp+sf/0lbdv2zVl6qqytH11ymCDy72QGi5P5jqofqwrUtuXihnXMZT
	O7g5duOdcjhhfonni12UCsLPN1WObHn6NRoAAmcO9zwiCOTpdwGeaIXk2iPiFClp8pVFWbP29Du
	T0liyaPFzWLUg/GiFzGjyTn6792bUkgcreneFUfqdN+IcwsxRMhePqX+6ULe483gnSSJ7I2OjoV
	Yj5OKPn/XmiPWwWSDesIRTZ6UPBCIQrgKpkDjbUxSZGLCsNGsPAoTAuTQm17VOmYLVst/VVUyEg
	lpmf1p0Fr01kOBzMRs49nmPfeqbammJaZs96U=
X-Received: by 2002:a05:620a:1a1a:b0:915:1359:fc5f with SMTP id af79cd13be357-917f03a447dmr1996388585a.14.1781567777155;
        Mon, 15 Jun 2026 16:56:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:915:1359:fc5f with SMTP id af79cd13be357-917f03a447dmr1996385185a.14.1781567776692;
        Mon, 15 Jun 2026 16:56:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f74sm3150225e87.7.2026.06.15.16.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:56:15 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:56:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: github.com@herrie.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sboyd@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
Message-ID: <4g73mxbfc5s23hrmuoacmsqzigtminr3adangfld75l6557shd@w4p2csvkt6u6>
References: <20260602042747.277270-1-github.com@herrie.org>
 <20260602042747.277270-2-github.com@herrie.org>
 <b51b4d7e-fdea-4793-9007-c9e3ee922f70@oss.qualcomm.com>
 <267d1996c4f6b25518d30eeca129fda4@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <267d1996c4f6b25518d30eeca129fda4@herrie.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX5G2wxvTlr4Li
 q/UiAA4wq/lUpSS0Zj8iuyXbZVQswbxoxQSe1rbCF4dMljm5+d4N0eBDDzVRfc0oiFQROTdINMN
 M8io++qDGLMxNdoZ1L/XqhXkIBJAyXU=
X-Proofpoint-GUID: X6q_3aePlFNejq9SG8QIUiWxJzfIq7g7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX8bNB1P7He2AJ
 akLpANS4kW1tw3KUEPyXtAxih9HQ8h7df8kxJtrwY7bezf3kx8wzw/Bjn1JOlFDhC/Q10H5pWwY
 vyYcFyObF1xFAhRW6qtZOuBJ3KbD3YMW+JEwdoXAZaKnuo6AXCrKzeLccfHc4Wuf+19Fgufbnxq
 IMVo4IaJIPoT97I9rzrTBiqBsbLUGNNSp9njzUN/DJLk/Ti93iwx1z/nEVUECQ6kOE3Mc3t4P50
 9zQiOHr1LPcm5OzyzVqUnNXLRgDwqWBevoSuiPqy4NQpHoXAmMSm3amNlSONF5H4feto1ZjizFr
 +sYQBISmEKmh6aR0LBnPhYlCUjR+N7DB3wdv15Ck+cDMJD2dETxMYzooaqv99OrRO7r+uwSy7b3
 MZqB0Mde15TJvmTwumbMgfs3GYzorGhA/b/4bjP+of0lRZJjZZ3r82TDTaaE6Zary2sObmwdTtn
 odlhMs3lEhfdFFDJpEQ==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a309121 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=cTwmTnRGAAAA:8
 a=n78FrjUhffZnk7pW8FkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-ORIG-GUID: X6q_3aePlFNejq9SG8QIUiWxJzfIq7g7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150253

On Mon, Jun 15, 2026 at 07:21:24PM +0200, me@herrie.org wrote:
> On 2026-06-15 18:36, Konrad Dybcio wrote:
> > On 6/2/26 6:27 AM, Herman van Hazendonk wrote:
> > > On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
> > > a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
> > > existing dt-binding header already reserves CE2_H_CLK (ID 77) for
> > > this clock but the driver never registered an entry for it, so probe
> > > of any consumer that resolves the binding fails: the CE2 MMIO window
> > > reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
> > > signals that never arrive.
> > 
> > [...]
> > 
> > > +/*
> > > + * Crypto Engine 2 (CE2) clock.
> > > + *
> > > + * On MSM8x60 the CE2 block at 0x18500000 is gated by a single
> > > hardware
> > > + * enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The vendor MSM8660
> > > + * clock-8x60.c routes both the "core" and "iface" consumer-name
> > > lookups
> > > + * to this one register, and the upstream QCE crypto driver requests
> > > + * both clock names via devm_clk_get_optional_enabled(). Without the
> > > + * clock present at probe the QCE MMIO window reads back 0x0 and DMA
> > > + * hangs indefinitely waiting for handshake signals that never
> > > arrive.
> > > + *
> > > + * Register a single clk_branch: the consumer DT can reference the
> > > same
> > > + * clock phandle twice under different clock-names ("core" and
> > > "iface"),
> > > + * which yields the same struct clk for both clk_get() calls. Per-
> > > + * consumer refcounting then works correctly and the single
> > > underlying
> > > + * enable bit is asserted while either consumer holds the clock
> > > + * prepared, instead of having two independent clk_branch structs
> > > + * racing the same hardware bit.
> > > + */
> > 
> > I don't find this comment particularly valuable, given it ends up
> > describing the fact that the common clock framework has refcounted
> > enables (pretty widely known) and details how the DT is going to use
> > this (which we can read in the DT itself)
> > 
> > I think the commit message is really exhaustive and it's a better
> > place for this info anyway
> > 
> > Konrad
> Hi Konrad,
> 
> Happy to clean it up. MSM8x60 is poorly documented in public and whatever is
> available in downstream kernels is often incomplete, so I tried to document
> most in the various commits. Happy to put it in another place if that's more
> appropriate. A lot of the info was found by register poking and trial and
> error because the lack of documentation.

You can move it to the commit message. Another point would be to make
QCE driver request only one clock on this platform. Is there a point in
having two names for a single instance? (well, unless there is a good
reason in the driver).

> 
> Thanks,
> Herman

-- 
With best wishes
Dmitry
