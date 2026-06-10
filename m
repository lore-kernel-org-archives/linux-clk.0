Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F7730C35C
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098770; cv=none; b=AHtSDSrOdv81YyvikeU11XpiqQKqgFNa/giplduvlEkB7o3/nhuGb3jjlkHMsSxpLG02M5rY/YFMAQHKTWwua4WG0GkCr2FcWgZIHDzHjkhuJdMlBXJG8IrPeUBN3D5MF6Eehvu+B9Cci68xhm2zyuq1OPFr/KmoVjaHz/5JHbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098770; c=relaxed/simple;
	bh=H7A/F4SMtA+MlL6psxxUHLW4kr3yvL27FTnGc5CAs2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCxYgmmWOompDkWjT6G1HnfwaADVTnu9TnMyJlX/DlGjGWe0RFu8GbRJ69gpOORyKYCKLvAYNAa7+RdbyvbsKUSaWhPtqqRn19VRFDA625SeObAmXAjJef0MzPQmhuL49QIvNFVZW2kBjgaqMgseLjLWs/Y7dSWmxrZIAnHo+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyTFF/Bl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0A2QPyk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyTFF/Bl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0A2QPyk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCQCX1554960
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h+hAhPYAj8DNFBrgO/hXZBez
	gqnqrmjN5oDOEhJKrOk=; b=PyTFF/Blp2tAx0ILFeAADFDO9MZUlP70NOmi95wg
	EW7AsYfyOYg2kXyINTohsBb09sAykyU9p5goKIe+s49TIor0b06aHbmb0dwuGTEh
	SJCdC8SUctql/ylxjo4bZsa3AodjG9WR0vyOQmETanW8xH7h5+eYA3CaqQAFQFMJ
	+Qu2O8l/Vzzpq2F96NXiT4HdEZCY47s8OoWa+wvJyT1g+G48xvHXuM9yFL/wjwyX
	d0hxmu+QhrbLkG6nOThjYcu34U1jtVxo0SDWCZzN7uuQzu/yhLW8wW5pFqavhSic
	pDCmf+QySvH90vwWKo/TLEj9DzmrkLT0A2jvSjeNOpve7g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnntqd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:39:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so7429729241.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098767; x=1781703567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+hAhPYAj8DNFBrgO/hXZBezgqnqrmjN5oDOEhJKrOk=;
        b=d0A2QPyk5iiq1lQnCMrVvkq5rMTYgjKSwU6+kSujjbBinGeGeYSuyRmAAdlJCbyIZt
         R1q70JQCrgB0fOv/YZi4knL0Hv6oL/KXikJ3CpslYFiMrMvl6ZB/lRqpvehfdZNoeoVq
         fNz/GxzKUtBFfXtbWxil5P3QlmHaYNX7QQuiVuKkPrEgcZ4lfHKrnzECjCQ/q5YgDnO3
         n+yZbD9sXMrMMezJeHTWzXhfYM6croE/qehL44N35NPQ2pEs4AuFgNUpxuicjnSjcdNc
         6oz4Gg4TbvZ7Z1yc32/isnB85r5UHheDXfXLHD+ffX7FxS2oX1rv9a5hgmweaWGGWyjf
         DHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098767; x=1781703567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+hAhPYAj8DNFBrgO/hXZBezgqnqrmjN5oDOEhJKrOk=;
        b=B2IVywl1GoHHkmp4KEGJLzyWyuo+gGRjkSsNeyQSfJfntYQtPXlmBFKz3J+xdpIeot
         W/Qg5Rl2/6jin6Y0RyYD6ZjIMOkgVm5tfppNXznkbs4eaQL2sBX06IarvRzvP7e045Vr
         JNrtwk6cKhplGOG+jvZCt9HpOH+Qwc0tnFi4r7FWkNhJ7VeUlKeom4z02D0ohW5yPO8e
         SZE5wbuXz3+dGhy2PwO55ynheRHNH3UdEgebZfP/SFEXliHj/hzVSGocDyC9f4k+mI1B
         K5UFkKL/BbsXYvWQQpIFZmu8Xlu/hsIkqmmegZNrttu9njkU9CSbhSefIbTLT725NtP2
         P4YA==
X-Forwarded-Encrypted: i=1; AFNElJ8nZXbxNlqW5UFF2jqKv0SvUGQnApM+6M0rTV/Fh1ZEc1L1QNv/5uELhmoV8xqCEUpE8NMEZ3z7Z3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YydtOayF4bsyWmFJ7Rx8NFLaZ3F7wo3Xksq2V7x5AeGs1ptk2JQ
	LMv0Pg1hI5kc4yW4yOkhMU/GgRIoZJHqcVA9PrS9jdFN6/z+Honxi0NAckTVtalm2ryXhwbL5Z/
	4wo4Ed1A+MqasJsrY+6I3InmUH4Iu5lyH9Pgb8WfCJIA08Qis3Q/c4Kh7ch/DE5g=
X-Gm-Gg: Acq92OF6V69XoXUnoIfJDWwTPAvIlw/dk0fNDmng9G76qaRhX3cdDz7ypcJUzknY1o6
	r7AYO1RXur1UljR6d3beUCpA8LwVnMUNkMHewz4oeeVQLmb73JfZiHvLJPvhFG6s9DmuLipMOKM
	LBoLjDa7exEX0ZvCsHHoiDIXq2hfdTO6fkabrsrEKzS5uRKC6HTBtXaAZBt+wMO4Fh5mLhmdwnb
	63N3Aaq1KmXPEyKpvsdgar1SCRl/MufynUAMMwUg0SQIoIIW8v4HzTeDL3vPhT3E/QiPpaD5j4f
	SCxdAM5Hkhez5FDs8HjyFAF7GfXnQK6FtzxnQoUhCYXemCdZ4is2J7x3OZ6Ebaw+VqKEhApArq8
	YTMNxqq7oCohuREGMGwdE4/79SvGIszjelluy5abogP7tRkNVkCZ8ZHMwzCkqAplABop1QfNhIb
	vFc9j+k6RoShhMhCOXA1HqSImNTmLroPljMBfK6lxQTUakSw==
X-Received: by 2002:a05:6102:808f:b0:635:420c:9b00 with SMTP id ada2fe7eead31-6fef04ef441mr15031866137.10.1781098767267;
        Wed, 10 Jun 2026 06:39:27 -0700 (PDT)
X-Received: by 2002:a05:6102:808f:b0:635:420c:9b00 with SMTP id ada2fe7eead31-6fef04ef441mr15031797137.10.1781098766707;
        Wed, 10 Jun 2026 06:39:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b906a83sm5419614e87.33.2026.06.10.06.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:39:25 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:39:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
Message-ID: <5umlewznxfu7pmprbvbprsqt5uwjzb666kw5gwdxethpfgur54@mlggwypljii4>
References: <cover.1780148149.git.github.com@herrie.org>
 <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
 <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
X-Proofpoint-GUID: x8MR6oUqv9sDe9aekJpBcGbz5lPntH4g
X-Proofpoint-ORIG-GUID: x8MR6oUqv9sDe9aekJpBcGbz5lPntH4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX3PE69WsRkYwb
 d6k6XSEvX/ahsZKmg/iSP5xauR4RMJo53eJmkfeVNO8AqYkXDSVxpfSFb3JftSvaz3f7QU7ILjC
 nOfGlhsBjbA6Uk9YfMUSGYH8aJVNZ2I8h8X9VrIIgtEt8Lfcj/y/4DL59QF5BZV+P/1irC8YP1B
 87fdBfr7LFn12tlKiFee7gYXgFYiu5WJI+0hpitL+jgsPuG/W0QNhn4/nunrAg88eIy35PYBZEG
 0jac3SoKhtkfbJ7Z8g2HFO7eDLuhTQnHpOBJ/bJmXjRrqP+hO5ZLf6zsXy5DVYht9dr2mw9pHMi
 ul7rRltAtJ5adVaw7EDBPXrZ5ZiPxoK3Ug3vazjCmEBxoTVB1kfjWBCRbhga6v/cVoG7G3bF2eW
 kJIcVT+1LQJklQu4D2oG65/LK2JoIZSmAMrawPcwibQmQcLdmt0JsMKNOWasxIqQqHk2QCc9LAt
 UTVqUM3gIQ5tLk6dGTw==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a296910 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=cTwmTnRGAAAA:8
 a=wrmej_e3st_QPmaCYGgA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On Tue, Jun 09, 2026 at 03:44:39PM +0200, Konrad Dybcio wrote:
> On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
> > Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> > MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> > generation that preceded MSM8960's Krait CPUs.
> > 
> > The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> > make a separate driver cleaner than parameterising mmcc-msm8960.c:
> > 
> >   - the pix_rdi mux requires a custom set_parent op that temporarily
> >     enables both parents during the glitch-free transition;
> >   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
> >   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
> >     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
> >   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
> >     later 8960 reorganisation.
> > 
> > Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> > display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> > rotator. Reset IDs are exposed via a separate header so consumers
> > can reset the GDSCs and individual blocks.
> > 
> > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > ---
> 
> [...]
> 
> > +	.clkr.hw.init = &(struct clk_init_data){
> > +		.name = "pll2",
> > +		.parent_data = (const struct clk_parent_data[]){
> > +			{ .fw_name = "pxo", .name = "pxo_board" },
> 
> Please drop .name (the kernel-global clock lookup), this is only a
> backwards compatiblity measure on existing drivers. For new entries,
> .index is the best (because well, it's the fastest)
> 
> [...]
> 
> > +static struct clk_branch camclk0_clk = {
> > +	.halt_reg = 0x01e8,

From msm-3.0:

+#define DBG_BUS_VEC_I_REG                      REG_MM(0x01E8)


So, it seems, it is a debug reg, not an actual halt reg (but I might be
mistaken here, I haven't looked into the details).

> > +	.halt_bit = 15,
> > +	/*
> > +	 * The legacy webOS kernel used halt_reg = NULL for this clock,
> > +	 * meaning it never checked the halt status. The hardware doesn't
> > +	 * properly report the clock state via the halt register. Use
> > +	 * BRANCH_HALT_SKIP to avoid the "status stuck at 'off'" warning.
> 
> It may be that some piece of hw is holding this clock online behind the
> scenes. Is there perhaps a Qualcomm-authored commit that mentions the hw
> bug, or is it a guess? Due to the age of this chip I would imagine I
> won't be find an answer if you don't have one..
> 
> [...]
> 
> I see you have a lot of inline note-to-self comments, please strip some
> of them.
> 
> Konrad

-- 
With best wishes
Dmitry
