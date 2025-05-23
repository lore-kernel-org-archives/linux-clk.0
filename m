Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014C22B8B5
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989010; cv=none; b=U1uPTF1SItpcXOKf23hvclJbDGNEDglrM2Y3ssvV96jlLikN/5EA2AAGux2MfcXnon1ELamlr4uSdtbA5nEgl0zTSxouIIeOB+o0rnpPidnppbmA+610xmO02YgSzT0Rlg0yOCfxDr8rVYWMsmFY2JK9tUWnDrPsfFnCXChoixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989010; c=relaxed/simple;
	bh=Ba/qEJqFr6Ls+4+wQI/kPTBtztizrY6suF60TaJ7cfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVe1TL6qrNpsXAS5325DmYnaJ38+aTE1+Ifrvn78asGI5zdMPnzCMMcSXV65e9bmRKWAO7WT1wzBAPW/KLGvELjWCOX21dFYNjSrAfbBG5Rd454tFRI7oxhd+5Wt6qSxatb4CUncWAoLJOLI6io0ZKYf9tXWKG4jfYrH3OqRly8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpHJpQN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpHJpQN0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N375GT021016
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 08:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VfiheIwlbsPSX3tKRqcUN7oc
	TCW0r9qBhyKUU/kzcNM=; b=KpHJpQN0dwtJLO+HTWzFKrFnk7bx+iSwn8bK+dSQ
	OcDSzPCmLUMrm/kv9g/5xyF0sMhlh7fYHwVBpNLpRtNlXPqjfnzO2V7n7/shn76n
	H+1+qDbvv7oTE12vRufyynS784yTKkqgKG3HYryJHeGvRlw6VpH29+fp5d6v2mh+
	O0EljvCWr36c4t6relmE6w4GeExam1CEKbOEzDi2Vv2gXldPFq+aLeAFJRke+mBQ
	wi4GT93K8pVkXpt80tvRVnaalOgvdiYPtKD4WUzq3WLp8LDuhgYoZIqJPy7cXJB0
	SOeAYJIab+0mlin0k1dpH1a8nO9fBiWQkDml+gGCajTHSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf09g12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 08:30:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so1566961985a.2
        for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 01:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989002; x=1748593802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfiheIwlbsPSX3tKRqcUN7ocTCW0r9qBhyKUU/kzcNM=;
        b=vSNsJUn37hEa5ym7J07TBC/SKLADp167yyrHtNajjHa5FaMnGxNe8kZF5a5/076uSy
         eAAJXtrcnk6C+a1ZMRv+OoK1/VqFN2lX6WDRnT6TzhqQ+ctD+IK+M5zgsUiGFr+s8f2K
         p6lTvM5+Xjc7Rnys3E3f4auBs/BFwkdvSMjBT1OQ4/uC78sU2lsKr5EWwUmJkH6iHbYK
         leV7wYE2CVc7U5kQMRMEn9Z+a6GC2wE2AsqKTKST80jdkpZ4y3NdcAS9v11iGrsCfNPj
         IX51d8K6ceRv55RHal4nOXAKlolDO8fBr0rBX2crbwIeuegEtK56Rm10j/bOUkcZyNx9
         pLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtsjepFpW+ggw9+7ZJAGPlb0OmXmAkGltwAi6hrQK2wOVcbFEc8SC/LUDKOUvXh0mNcwL45xj4T9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfd60aEE/dqPLbLsDHsPzmQFU03p+T3a4PsDRmIZ5/T7rJCiaf
	EFE7pgDC+z5VXuPsOyxcCqg/VppZDVYFksArYv7dIZ/MyITO5nHP9qx1NXCx+ILcun3yPnR8TjM
	RFP2uC2ov4ziy+PZcHQzgsM3tiqY5Yo+nWYd0ZeOUOTMA7QUCXJv8OFwYXGhPhhE=
X-Gm-Gg: ASbGncvi629ePfT4n4CrwqK/T6e4JYmfeUiJbI4uM5hPi/R59BUUwrPcxQ3REtzeMzO
	r6ttg4Y5jpeZweK9GzFYxSm6T8LegidQS8uuttm3B+fGGRohQ7ctOWDAEDIr4ct1t+CiX+QWMk1
	XDv9GT1YonTp6FWmLLsBfHMeG8Jq+NxICR/A6tTGeM+kqZv68/CiG06i+3kHMZwGvWVWxXw3kVG
	DiJsu1Hiq0QPye5PSgAKvmDGe3Tq6+28vQ3SfOzbKKm5BpuVS93TUfT7lBuprXojhUaArf9mFIL
	SEwHuYZ/68eyIgtP6EepZF94EDtXcraE5CEdbXLtHLAeP2P5gFRRS7Bes+0qTLWvChEJFl1yT9E
	=
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fa93aa463fmr35204536d6.32.1747989002046;
        Fri, 23 May 2025 01:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQTPt4MTIbkICZvOrh1skICymAaWmqgOHvMqVvofwa6vGpCOsSPPMr6URNTP7Fxd27LeFefg==
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fa93aa463fmr35204156d6.32.1747989001635;
        Fri, 23 May 2025 01:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551faf6be77sm1933997e87.84.2025.05.23.01.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:30:00 -0700 (PDT)
Date: Fri, 23 May 2025 11:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <dlkrweid62i6jz3iexahbludm32hppzen2odjx27sxfe6opt5c@zqnryzjpzqoe>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org>
 <aDAdax7xdeDsvQHB@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAdax7xdeDsvQHB@linaro.org>
X-Proofpoint-GUID: _o5b9A5HVf-iEgGBurNC0xet7VvC46Ma
X-Proofpoint-ORIG-GUID: _o5b9A5HVf-iEgGBurNC0xet7VvC46Ma
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=6830320f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pcGS-iR_AO2RkNitFtoA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX6AQmsd74UPr9
 HjcV5ERuFTjzrFe4Azmmu1nF1wBPaRjxdCEwrgtKKMr+TQk135I+tQCEWfamxbknHoFctl91699
 z4fkh22VqsvZ5jkvnAOemWPrLRJu1jxo4M1hnMLHs86t13tbah0OIIOdV4Nlu8AMD1LMlq6stxu
 Ntob5EVTi3TnGpyOQk7mt6kcfyPEhzqTBwAMIT7GxtPLLoONflJoRolSW/jlR2lEzXcaAae8szd
 iuOLAnKUrkBE0nPwO4Z3yMUh9KjqUmPVikVrl0R94D8EM4Ub6JlhM1pi5CHpZzufogMK41ALD9Q
 7GQcf8FzRWsVq3XFVlwDmvREP153FWFD9zoX7Z08mWxzS9G/XYu3Ezh6r3iFWUAOy59vfdEp9Ff
 YKEQC/r7FKsF3JVJZWzQAb3w0Sf2/0FxlRv+YVJyvYUXWDcVFZOGgLvtwtnf5nR0k36pwoZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230077

On Fri, May 23, 2025 at 10:02:03AM +0300, Abel Vesa wrote:
> On 25-05-23 09:55:00, Abel Vesa wrote:
> > On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> > > v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> > > differences and new implementations of setup_alpha_out(),
> > > setup_border_color() and setup_blend_config().
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > 
> > > ---
> > > 
> > > Changes in v4:
> > > 1. Lowercase hex, use spaces for define indentation
> > > 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> > > 
> > > Changes in v3:
> > > 1. New patch, split from previous big DPU v12.0.
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
> > >  2 files changed, 94 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> > >  }
> > >  
> > >  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > > -		struct dpu_plane_state *pstate, const struct msm_format *format)
> > > +				      struct dpu_plane_state *pstate,
> > > +				      const struct msm_format *format,
> > > +				      const struct dpu_mdss_version *mdss_ver)
> > >  {
> > >  	struct dpu_hw_mixer *lm = mixer->hw_lm;
> > >  	uint32_t blend_op;
> > > -	uint32_t fg_alpha, bg_alpha;
> > > +	uint32_t fg_alpha, bg_alpha, max_alpha;
> > >  
> > >  	fg_alpha = pstate->base.alpha >> 8;
> > 
> > For the 10-bit alpha, you need to shift here by 5 instead of 8.
> 
> Typo. "6 instead of 8".

Granted there would be a next iteration of this patch, I'd suggest to
modify _dpu_crtc_setup_blend_cfg() to always use 16-bit values and pass
them down to LM's setup_blend_config() callback. Then LM can perform
version-specific shifts, utilizing either 8 bits or 10 bits of alpha
channel values.

-- 
With best wishes
Dmitry
