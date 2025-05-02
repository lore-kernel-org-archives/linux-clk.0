Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723216EB79
	for <linux-clk@vger.kernel.org>; Fri,  2 May 2025 22:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226101; cv=none; b=RKcU8+Ge89IUaAf3xCI45FT5q7LWFwflU0IMpEA0jwUuMBcGaKmPISGUUzXA03c61XSYMdY7Lv3orMi9LrfySnVftsIwRyMste4vOtJ7OVS2bsc+2Gd2GYRBEDw0Ou9qG6mjoCbV5mhuWgz67BRa/hI8oSm/UxXi8YdNsRHO7Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226101; c=relaxed/simple;
	bh=Yzfu3tcE7pGAm4ed9l1L6RZuyGcZnvl2Kch+QsjHBgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYTHhsKblVevyPNW8oorWVpFDk0JkZBgfIsTZ5BaYVnnP9v6DJHxs/sprT7c5C6RKBNy7lEIz7SoeA4/jDr14IrRdflxIThwIrTWbjGZACwau3fvEpR9eh8ZTudPfCANS6Q3zb2AogWdbs63AaOrmIN7rl3NS4lKw3iDojsMbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLsXxWq/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLsXxWq/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAt0O015873
	for <linux-clk@vger.kernel.org>; Fri, 2 May 2025 22:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eleFOyC3fOtiERUR0ch/uTI7
	FND8UmJHhoCAGFzcQJU=; b=eLsXxWq/CovyGDefzgsC83Ma03HfEVHyVuNYVy6L
	yPDK82DlulowW/tsmLvam7BTRo1DdnJxxGJB91LGYdzH6/7g1dqkus/cYjeO8Z/O
	lJxBwSqnAsGHA0KpQEoFAHpkGW7sRjbV5EgdqhP+eFy/wlzm+J9w7dBRCmesjILA
	4f6kgbAs29w8V5CTubgnQjpCSe2auxetfeV37XeSVRKWbi+rAwuYWI3H5iEMabzg
	g0UH/UTARw3Mtx/cyRd9DJBeiqLQjaR1qyb9+RC9IXb9cZbQt9xEOloowIgmAnhM
	V+m8TTAdE8OM8TjgYTwo5cBBJTu2Dh1FzumCo9+mK7fxiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8he5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 22:48:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso436221685a.2
        for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 15:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226098; x=1746830898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eleFOyC3fOtiERUR0ch/uTI7FND8UmJHhoCAGFzcQJU=;
        b=qXI8y7Rf/48s9Wa+ZT+StTUbPkbnzI8BgklkzN/ULjg/kZ4kLF+6GyBz8LnQgKl1PM
         hpSkTZGo2UC+Kjwv7TkDzpGbkOKEXHFP0LezHTMeNMv+gio0E/7oCiFNgYppVFBuQAGs
         Lmg6moybmRlFkdR5mH4zW1b81TOJYdHGPI9mC+HA15WjTx1L64JY0BwrZvzasQftWnqZ
         USH98S8Ei0IFa3GR7hTqGW3vatFDZBx0dz6SlOtk7tCck5JwXeR5bc4LjD8gRBLjoML7
         IAAK6qGLU1gFVxgtmDAWI3jN5/pLuigHVZAemDWoStnDZlsLPud0kyf2KGeUUYjQeXR2
         KD2A==
X-Forwarded-Encrypted: i=1; AJvYcCXrGmiUuNbLPDwUAcX+fBfMEb4MKF9fUXgf3G2eIB3lKbHqGz0lA4hY4pCioQKZLSxpHFAtwJBIWa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrFTqVkUasZ+ONq+7i9jZ0rJ7DVHcJQrO1hzpmiSlGlKdPNWK0
	9ajyPeQuazyAcjRBDGvyfthVYgEa7mTFbiAFYxmDCZzLGT7WxlScuWE9ZeA+h6BaDItF3Hqdw19
	exOk5Jxc++aQQayBWsm3xCc6JZX/0lIvh34+/DPWlAhqm3GJuqGKXQwv8Y4c=
X-Gm-Gg: ASbGncvjookz/KiQUxN0j3X0jzImJoCETz4S3Vp9ly1R1wqKHnUa1ZgfFTnLGNtiXrw
	f1t4GDm/Sl08qhcoMNlULk6LTOdVXw0enivLc1JPLeeNnsUg39qCCVpykGPLVHV0bm9mgYBKUJU
	/P9fLHpM1JNYWMIQsHCHT3x4KjALgmyVdL8BmI9tjNmHhhqZd4nZy4wfiRA1dlwwfuaLk8WOGpM
	MVpZjOPRTqd/ZKM1WooCHYjosidiN1jBAYJr919XlickzhnJKp+hnv7Oxq6kWhCapQpr2km9Frq
	vzNv1CbRqXqBYWHqfk5U4sogaTi6lfUEJHpL86w4OKjPVzXz/lPW2J8wR89bHWBB4GwEMeWnqgo
	=
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id af79cd13be357-7cad5b2093dmr658530385a.8.1746226098376;
        Fri, 02 May 2025 15:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxvVUCE28kLO4ASUoCbxheAfyetz9Jt5+OUgHDim+9B4loVIqn+DtUk4rE7DTKtJgIyo0Arw==
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id af79cd13be357-7cad5b2093dmr658527185a.8.1746226098052;
        Fri, 02 May 2025 15:48:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f69cfsm511823e87.227.2025.05.02.15.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:48:15 -0700 (PDT)
Date: Sat, 3 May 2025 01:48:14 +0300
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
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 17/24] drm/msm/dsi/phy: Fix missing initial VCO rate
Message-ID: <sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68154bb3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iPOKqzCR-5T2sWUWG0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7Qlnj2nDkbqcvSKu_QA5qts2LMvLZfkI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NyBTYWx0ZWRfXzWYE+jfN1PmJ JmHBS4iSmdqFZpYFu1CwQqdHfWkHsQD/dmZGPk0n2z35XnAD5RToJSfDJi+Jtmkmrr4ExB38Veq XZp8LVkr6w71EIQTTjYetER/I4ivrbRalNQ/+qh85scGC4LQqHeTiRecscdYknTHPaQw7jaaTpF
 Huu1oxXzJDIMxWZqzYXBdfyoNb7tjK2SlRTqZeRtN2PMU3Wo23jca3w8tEvLrZFDJeqIKKC1Cti 1ahnduVHqyS2UEBPuLlgyLPWI4hvHAmTKNTlYnSnx4/7LlpL+c8oUom1CWJ6B5IN/MOJjA1YNtB HE7xZC3QQPGZZHmWf1tsAP4wR+scgDLqaC4Mugm+c1WCb9e05mdbmJ3IGeAhAc4+pSdDfwNJY22
 T0W2jR0v/5xj7Uq4rK8z1ZmzZBB+hunm+zVHmxh7yVOSVzvaWNZ/gbl+LKbMW/NkgMqwa7zR
X-Proofpoint-ORIG-GUID: 7Qlnj2nDkbqcvSKu_QA5qts2LMvLZfkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=650 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020187

On Wed, Apr 30, 2025 at 03:00:47PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_7nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_7nm_pll_restore_state().
> 
> Restoring calls dsi_pll_7nm_vco_set_rate() with
> pll_7nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please implement similar change into the 10nm driver.

An alternative approach might be to do something like (14nm):

        cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);


-- 
With best wishes
Dmitry
