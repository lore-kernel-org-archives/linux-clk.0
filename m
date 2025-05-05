Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001922441A7
	for <linux-clk@vger.kernel.org>; Mon,  5 May 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447886; cv=none; b=bil6wf7diHCBYwGrztNBTE1gfe2XuOjC1mvIU3bsLuQdbPElcJJhMbz2fHYV9pe+4Pbp082PP2nX4yLizSYPlu4iyIKXhTCMvEAe7CRw4VrhjmsdmHGfjvrPI7iHTLfCVepsmQmJytUlHkZJJCVqbTPYI672RS/yLslIOEz++Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447886; c=relaxed/simple;
	bh=1n4N8SV8iYUBKBESdu/oMblCqrUGnJHEzXHOHJjQFP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1KnX/cnNXyn2O37mb0eDqtbT497E8B3Z88HxGmq2jEY2ixmr6i3LOxBPD4COsp5/y6eC4/V5EKp2b9zfTzvoFeEXgo0UgoyOFZDzClenAhNM13ceH3Gi4LJdFxn7MoxsFEvBbblaDnRCs0fQW/uebR9q1Zr2r42b7Pi38MvaW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGrcD4YR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGrcD4YR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BXKHw019902
	for <linux-clk@vger.kernel.org>; Mon, 5 May 2025 12:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jrwG038kdxUPyHEoYbFPB3qB
	QgkZiGSoqj/0yEoAKXQ=; b=UGrcD4YRberod5zPfWFWWzSj4pz3o/+siba20sxr
	ypLY4v/gEV/YMnJYVmMEsQYwIpsuQyJjeBAyTBqbm8G1ZAbgRcjmXZkv+w9XM///
	/dyu7IR0Z97MEDsFJs/v6WhcTz2tyh2PlR5zdMNnOFk//QKksTyjwfwh3z776QET
	GL0kC37+WU09Ah5Wh4Jr3gYYJgU+KJKkDdqEtfr9Vqse7tVNKNNOOa1ZgbQcDYBl
	+p2y/PR/7+kAuOaVW59qFKUTMx4IyAMQr3Tfcq6QM9jfyHuRnGCSkFTCZYyFiTyB
	5PWbOZqzPdwM7hwTxjIOBPWeugjFWr1ANNWhal79FgsRaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7c16x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 12:24:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cabd21579eso124145185a.3
        for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 05:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447882; x=1747052682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrwG038kdxUPyHEoYbFPB3qBQgkZiGSoqj/0yEoAKXQ=;
        b=TO+FjEXRVhE0N2oMm8zckvBsI8ydSEpH0S7VAhP83uv2QsmbrHEsaf3Adzx+kfSEtk
         fTI49rY6sWQNCz3gEGnB2szFHdYZiMoCjFbH5sgmhYZmuJd+CWG8M8bKnITAENn37Oqz
         otudMkQ7/ysx7vxBZ5f5RHJQgjwUJyB0xc9fg/5oBP0vw5NVgVtfBivbfoXuE5En7XqL
         w1PWxaxS/1EYY2CynW7Ns/929Ges+LVCT1F5RIV3GVjmIC/LNzd6AmIXzmQRC+LoQ+6E
         xJXDL5AVGaAsKVt3ezQJaivy0NgHN1ewP5nu0UWn7jNXuLGtPsRj67GOihFy3bhmYMKo
         Fviw==
X-Forwarded-Encrypted: i=1; AJvYcCWkExaZcCD+TjJ16ByfSxBJ1CzrvoiRRH0u4FWSvlsD1Kk86SgeDnBTblQCs5YWz6tn7m2/IQS+LCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu4fk2lP2mWtzJw+J4wCuxnt5hdg36ujI613oN1rxaLRg4VkcG
	SvWhy67Ur4dc7u3eJddGnewkmxdWZpW0Kg9E2/KyW5i0z5UYDfn2d8szFFm3F2x5OOtU/QVYyXH
	j2Z2vndytg7mzuLduoIacGB/QBF5Mpb12xsjwMFXG19diBSC3UKnGWB1oHg4=
X-Gm-Gg: ASbGncuVvgzDuDXfPRY8dITpBYo9pOZ53cwB1qkZbP0zsVOhlTY9a3dyqZPbGgfafbr
	x1+SOtEa0yDLtfDUbWECKXGLA7oEuQfFOUt0MFuzn1MHkjvfbroA+QeVeMBzYRAoSdEEeoXBA8I
	cLfugOUtOrxbQlNB6KIRxDWDu7S+pY8gpXh+FZxCMXrBSEPNf5NFEiHO3j27CfFO+lMvGlHLCk1
	v9D0S0X7euEk8oz8TrVqIN19NXd6VcUzUnSksoQOBadFcgkUxWFWfsqSWQAcQVvecjeJtzTvKO1
	ywbQUKJIo0CPiVdzIJEJFW/OzSgjb+vDK1FKcszrFLEOdI7+ePg8clC6MiWerhGucaEI5Hbm2g8
	=
X-Received: by 2002:a05:620a:1723:b0:7c8:39ea:5166 with SMTP id af79cd13be357-7cadfeda709mr1534151985a.55.1746447881962;
        Mon, 05 May 2025 05:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQVHNC/X4ldrU2WAdEOvCrJu1jzAs9DRDibWoLBRLHVoPEZe8mcE+qcx8xAVSbPy2Iuw/oTw==
X-Received: by 2002:a05:620a:1723:b0:7c8:39ea:5166 with SMTP id af79cd13be357-7cadfeda709mr1534144385a.55.1746447881548;
        Mon, 05 May 2025 05:24:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b16b6sm1706106e87.12.2025.05.05.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:24:40 -0700 (PDT)
Date: Mon, 5 May 2025 15:24:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
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
Message-ID: <ygd6givaigkmypmaufpeidkqauoujcndm2xemi5pm5zue6ou7j@zonusie3tuap>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6818ae0a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=cHRrv4Hvtu4HjFTugcMA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EzONxEb7U2-GiCwhAM90Hwh9uCZqQ2Fr
X-Proofpoint-ORIG-GUID: EzONxEb7U2-GiCwhAM90Hwh9uCZqQ2Fr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExOCBTYWx0ZWRfXxV5glhpS91fY
 fnoqC6SKQ018EAyxpOb7Q3l9MRRBbQFwwaFBCOM34Pte9Xasv43upmk3ieRnnDNBOc8yH7Eyvoc
 cdXfMlpiFtwnEdicGzhRH4DhCyJucyo26BA9xKYFiEDzc9EM5KI5m/fodkrmYjNdiPdDjLtDZpx
 Ms5zsVbPDoQzPZaPJz2HqfITER45guL2u9ahgzJlfsOadIcNpcF6EzRITmfG1faCRQbMSd0k9o7
 xSL0fbSWc4QJsD0JDSagfbbeUOkAtUcVf7l+fEq4/lliAielT9/F0erD1vzfMAc/gnpYVsrzigS
 W3M8mIQKFCbtZKxVb2NDbfQR0sW6hthjNpHbj33V1p9UXAU4mb7EsgR0ufo4XAJyBhYJwJlSdT+
 9Orw5jCjclBoT+LXTRA2g+6YpHZ+xom9Xien1YStn7Yja1ToLWz6fSRiEkDxNnSxRtPQsMQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050118

On Wed, Apr 30, 2025 at 03:00:51PM +0200, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out(),
> setup_border_color() and setup_blend_config().
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
>  2 files changed, 94 insertions(+), 9 deletions(-)
> 
> @@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>  	c->idx = cfg->id;
>  	c->cap = cfg;
>  	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
> -	if (mdss_ver->core_major_ver >= 4)
> +	if (mdss_ver->core_major_ver >= 12)
> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
> +	else if (mdss_ver->core_major_ver >= 4)
>  		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
>  	else
>  		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
> -	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> -	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	if (mdss_ver->core_major_ver < 12) {
> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	} else {
> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
> +	}

I tried picking up these patches, and choked on this one. This heavility
depends on the DPU fetures bits rework patchset (mentioned in the cover
letter, it's fine), but granted the lack of the reviews / updates on
that patchset I can neither apply this patch (and its dependencies) nor
steer Krzysztof away from basing on that patchset (this patch provides a
perfect example of why that series is useful and correct).

Abhinav, could you please continue reviewing that patch series?

-- 
With best wishes
Dmitry
