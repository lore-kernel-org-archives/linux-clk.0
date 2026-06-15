Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8BC3911DD
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512501; cv=none; b=g4+IZVzIw81f6A+OUTVotgzJ/OfBaCnYJ1GQdeSbLx+B+EpKfa4+6qb9LGyZu1/iP7Rsd5Ostr3sQfh/zaFrmZeORA909lQ5d+cIhs5dLVwfGxQ2K5hb58EzfWeE+uByI4sefofrP2sCsdcbPxmx9X+UF6ruWDaBTq2hRlhSnmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512501; c=relaxed/simple;
	bh=ahpmKFOPe4LlOsmuVsaSKybMb/iYYSuAslh1JkXf3Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTfBC8NeW1dz3g9VHL1FiX89DcIXC3ZiJr1/yVgD927Gby5AEANPUw7SMLYLZWvDO8eVfn/KV68tTWYyWhaMqjjvwcEuYeJYcMuX3XtdmgRBpGq66Pqb+1ySr1VcZA9BK46O65fGOlrRIk54ZJy8ajZEPuSrJaVMwCZsFHkpevw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjqIPMh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/fhEF48; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjqIPMh4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/fhEF48"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KvZU3828173
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hPc8xs1suGXRUY4bN6+AiHsY
	kPpfPjS99CY9Muaoq8U=; b=KjqIPMh4x35FLiKxjJtT+6EebHU/3pbGmSmBKelO
	UADrAwRg3LVTZtcOoWz3H3GWDjmnHHyKAMO9zPUV7cb3nCacg9Y7gTsVRnRcF2RH
	ehMiup1wAazJI6n0BHsHeRmyiVuK+DMJ0gNPmVRwEYYkMgM+jze+TaNWM9q8Uxwu
	CtbsUw7LgW8FFJLQ7PEyj1RIwIHuEzmAOQt6JUiO29hdNxpAxA+B88DOguCpnsZS
	TuxmniLQoUVMJPeLd0xxX9LxiqefflM+dW/u6YXaxE9cMQdvXJJa3+10PG7g0n+Q
	2qJBjfq9JzGT2nOEnhPdwXKg5xzKOXX8fctI2klXLAwH9g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u6dwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:34:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3074d4102a9so9037512eec.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512491; x=1782117291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPc8xs1suGXRUY4bN6+AiHsYkPpfPjS99CY9Muaoq8U=;
        b=I/fhEF48tiJEErDW5c9L5q4cRFN59JOBqslABtc2KKIWxRj63A4MVIvia1AdVwi71l
         a4mwntJ9D7jMIhzaBW56tsdcdnqRpyzWRHgdXkfLR+yGjut3RHF6SyVQTBLCLUAdBR+D
         peSishPd6Prpv1bFGlE0pItOmPyO7MmITN2e6gafjy24s9sfXnx6t2dQET9KDbNF1/zb
         1LdZDHBQIEtekMCo95ueTNjiUOehCOe9QhfbE4BP2kO/qvLIb/+TsZdHtRTsx1khs2ZB
         gQiWRX4xZTuWQE1B3SGl3UhcJ4KbKCRlpwQWxfKt1mnEgpmM+lQbpSyv2rAB9POHgyzV
         OMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512491; x=1782117291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPc8xs1suGXRUY4bN6+AiHsYkPpfPjS99CY9Muaoq8U=;
        b=qZ6culPz6Rd8q2lp+F39drQXp28SPm4HZojXnEuAMkE/Qa5qInfXoDPAu/jsPo+ZG3
         WRrrSRU3evmaIgVNmNCQj/bHQiZ8zZSg8q8TEWVLgk/87zl7qu8tjjoq1a8Nz/s3pbTF
         ZRGTZCUmDdzfjubrQOhFiIpPh9Fu0id++FQTfkqeart1soGeQafHB469b/fhB0f2kRXf
         2LEikuwq+9fzmA9jICKi2X1k7j9lcilpw8O6rdhRnweW0qNwLV6x7lqLp1V+DAbMyzR6
         WYEjZdQJM/Mn6J87UB8N2XCaT/SvlbQ1wBLe/FnMMG1Ib3YRfNkKN+uwBAwXRiK5gA4n
         Qn5A==
X-Forwarded-Encrypted: i=1; AFNElJ8XdnsmIkMuS3gXcaB3mfyXDU6ehkfxV0+bdn2BJuTsQKwR0J5YUzPscTugD0vgm5lftrL6+Lfbsm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7FQ97ZGIKUOHBYHVuK9+v79rjpkSKU9v11L4FFElmq2fEUwN0
	z6FcRwLhr8rtRCZJW1EtCPBq7nqKYgkaTviec4HuQ4gXZc5MyCCAPUj5YfJSDACHkw/dFSWfJEG
	p5uC8BMc9Y74sLYRoQOJCmZ6y+VL9cC4JQBWyMYOGqnvlUtpqvptLRLRUPm5i2EM=
X-Gm-Gg: Acq92OEhjve5q8ObiEE7wYgN6UNtbO7rt+93EaCNUXuwOh4ES6AAs/sGcoyB8wDgSPP
	D9zJkLpCOJTBONMf50vJZVHHO+nfP2cquWG3Rj72WVEKU47ADuYPbeiiH67PXJCPydjOLfFT5nW
	wzTtex1Zy/JL16tXjuagnSaWVufyEkGsi1Ekf5JpIGB1wsPhJtyn3NkUKF2Xi1N0vFcigmtqIgX
	Re/FE4co4oISXZmTec4ngVPiivDgERdYlfP5S9DpxzeejenWdN2pkjBdglQihDynUCE1ZRTkYdq
	srOv9AHNhaivq6rlFzgmXeg0lA9oQEzmIElTp36TrxC2JCb0QmbpBJPbexuzMBlLMHGOtJwBZun
	HTljENGOw3FLrgFJK+Heik9ge9VXDZQhdbgfQwJdW1LTEMuG1kdsqWvHs9iaYVFPFmkQK
X-Received: by 2002:a05:7301:19a2:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-30820262d7cmr7349893eec.33.1781512491199;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
X-Received: by 2002:a05:7301:19a2:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-30820262d7cmr7349871eec.33.1781512490626;
        Mon, 15 Jun 2026 01:34:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489621sm14099720eec.6.2026.06.15.01.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:50 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:34:48 -0700
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
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ai+5KOgueiN9FTq4@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2fb92c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ukEeeJt9K7XwON3hb0cA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: tWSWBm5hPqMSFXR6lV713zhXxsL8witg
X-Proofpoint-ORIG-GUID: tWSWBm5hPqMSFXR6lV713zhXxsL8witg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX1tAu7CZqnd/2
 Qdhy20nYVy6hNjUzjQVyCBhwHRTRvHezlWPD2pJqYb31uMRMfdQjhDjRsy//ShD0PFbiLWdQ3C6
 a0Xm51plIIJ4RMEqKgaOn4jt0Khjq+CskLlWUtd35E56WttblKssHTwbLK4eVeSXcAuyt9Uj76n
 cTBL+8kK/KUYWG5wXsjQU6Ytwc7HbK7/BkpoLnvR463KApLpYDV6OXpNe6saOREwK+RQVXKbnYM
 PGAeSlsIuVTQESCCBy+JyyDIWABxGugtNHgtd6eTETajNwBXssx0hosmymBq25l1GWamqJ75ZEA
 0h5RceLUzkeUT+IZ7WjfiYdZntQDOgJurhPUULOn+4ppRXZkR9o2cVQV6m3yKcianbgzBFBEr+A
 dRSirXGgHXPNuxFlilUmA0J4k2vuRCUckvDTLh/sfKrLYIF4yphn8sJuYss567QfuzJCE3DGms+
 0aEQXfp1bDTr8KO1LDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX3GT3X9Uxrob/
 uv8+zOhGdxHNZZ8AyHs823nw6yx/SZjmOdWg58pnRmlogJBeiHB7buCi2fx7ihtYjk8KNV89iZH
 TWuKh0TjcXdpY1Y00mONNyy82+qrBsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

On Tue, Jun 09, 2026 at 02:38:08PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +struct qcom_clk_ref {
> > +	struct clk_hw hw;
> > +	struct clk_init_data init_data;
> 
> We don't need init_data for each one of these, we can construct it in
> probe scope:
> 
> struct clk_init_data init_data = { };
> 
> init_data.name = clk_ref->desc.name;
> init_data.parent_data = &qcom_clk_ref_parent_data;
> init_data.num_parents = 1;
> init_data.ops = &qcom_clk_ref_ops;
> clk_ref->hw.init = &init_data;
> 
> ret = devm_clk_hw_register(dev, hw);
> // not needed past that point, __clk_register zeroes hw->init internally
>

Thanks, will fix in next version.

- Qiang Yu
> Konrad
