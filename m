Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E328DC4
	for <linux-clk@vger.kernel.org>; Sat, 13 Dec 2025 04:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598570; cv=none; b=PG1BFc4cPcmP5uNuRSwISQtTANXDOBEw97m6K3nyTwTJAgEQXGUyNE6yI8DPRRS9U8Yba8E2UDR56VYEr0D5t9DSSdeCxEJdbwjsBU58X4W6S602qtkT1/NGBltHkXXXE9U5YsGZoBIKjnQTuTwOKuwB1D1yuzm0GsiUFVLtd4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598570; c=relaxed/simple;
	bh=0MKogGnSoL20C40NceSUiBaIPgiZ3y6eHwdJtwL63tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufKKZXxo666nbgr/ThABEi5ZNSKZwG47Ubcihon/gtbHfkbXFPDRuAaDiEIBPhhcEsKi1Kv7J9JrfckajjpHVYNuB4XOa23lY4NzZHcF0+GPMGtinChHLcX5txbieAEiuCRU9mWkGwIfx482PUSJUt8C+DW8Mpg8wYjk5PrxxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVC2IzOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pio99yOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVC2IzOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pio99yOX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD2Xb9t2103783
	for <linux-clk@vger.kernel.org>; Sat, 13 Dec 2025 04:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=krIrLWAixu9t46zq8ZyDKkJP
	caIYHcMtAO/tuk3uLmE=; b=cVC2IzOf9nucZhnAr3gZ8t3dcvAFn+hYXis/U7wm
	RY0Bu3u1cUK+I/d2xctFSU4nlRmqjr1zcmztMyXZzxyd6o2NF61P4MvGJVmKcAmM
	90yQNRB4+FOGM6tdJpjv6xb5TP/SJPaSrok5S92KPVjUhFgg0C5RtTLj4TTPWCoE
	2vlU2WLGOqqvYCT9t3f4FtNCt5aRn66aszyIChZ9xwxysEj3+nXXfztJTjDMCH7p
	atU9TuChBUHpyw3CWhLL22YxdM94NHJbS/yHClETb7srwigtqqys3mSanmDP9MuC
	u++Mvr5SegvLGmHGHOOt1dvyBbuOjSFE4EyjBQi9SIJ8RQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0yff03en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 13 Dec 2025 04:02:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1dea13d34so6612931cf.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Dec 2025 20:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765598567; x=1766203367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krIrLWAixu9t46zq8ZyDKkJPcaIYHcMtAO/tuk3uLmE=;
        b=Pio99yOXNiRpfPk9sNxKUtsYCMAr3dazVud6MTMwrGCQSFysiYmOXSzHKu1HtYg3H/
         2JEfxDpSnpMZ66Sl6f4UZ+ZXprrxEMAv09fF44cEgyh9xym0Ik50IEac9Pj46s4jvIgV
         3cZgWRsiycGkx6Q8BKOl9wKThnT9WNWo2AmwhwAxbiVYKm1ax3qEYffJnzbMT9nQqvDF
         NPNQYtwaOvPJ4dahPJ5fWwCBpYxsAb7Mxe9gw4i67iMAc6ZlmN1zj0ryfNgCL76qTENf
         E8qp23vneR71pM11VqvReZJpcfX96eplOJ5lRNagnNVH81tBniZCW+ajfxlDrB5IfEh7
         gweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765598567; x=1766203367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krIrLWAixu9t46zq8ZyDKkJPcaIYHcMtAO/tuk3uLmE=;
        b=feQSQbIPNPLVW8JaPylHLaznIPUz6fy0ZstRrwgyLEbp+t5LbYqTmlLOumpm/BxICV
         zrknVWwlJ/rs7VA01vk56VySVfE6gWJBK9waHewjNZz/q2k2j/qbVUQCFECUQJ1EyWA9
         qB3Qw7kVjzypYxrUlTAXN/5sOwYl0tZG0CKPpTBhOCX8A3PSpvrfv96E/I29FGqprU2C
         vLCvjaKN3ZhdKnVmp0j82sscJz1NdqQ/pUVu0Mh/h917DPFVGNc8FbVpD3g1UBXaPlKi
         Sr6Y2yJB6x8xJDc8Clx7+siuiR3epkrT/ZAWeHtZyImviCba36qdy+JlJr4ZvkcQNS80
         s73Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAS3WVnaskSlit66ts7pBdfVOc32ZlaOJKNQuuvCcpSlBjz+3bhk4QMPfPgNop9Sw5ANDYvtiuZ8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6J6ScwzRKGiP0Tw1DNqk9DN5/i0hB16i4K0IB6FhFhknFOKQ
	ATbyg3pK/v5XcCb9yyHs5JXQhE3l3RHhtOWPvz1Xg50wya/VsdFtTIPEL9sBr0btw/farWpPb3H
	jLmHgdBqtU6cWUsJfgZs38kKRtJmuX16ccLvGY0MApOLLod39NLz9iBVAqmRKDkI=
X-Gm-Gg: AY/fxX4neDQrF9DN2TsV34cW1HgTpQYCD3xXTGYlH/DYCeaU9WyXUQ2Vgozeq1qv8x6
	1deWgkPaYipVTiSSLPEgAzGQYnsMfRPM+0GAuUbP4sfq4OtGIqNHo4QF+LzfQN/sb9LO0SznQ6r
	0yQZFlz1jC0BL3R+hPUyIEGIMnbVl1hwGkJPLT9Qn60MYonnrLxah/5bSE7YodudN/3WYhZ6kIW
	oUPeTB/G5QQE/erOWFAO6irXnyFt16uAG52GqGCEzyVlcZp0hjZyFHZv3y+HUBtfSJwV5xiWeLQ
	3ZNxngBT9DmdzDpDns0iw7BcPYc09Xi3g9/D7tgfFi4oiIKfCWlAuRagHHQ33tJL0kJiTRV/D2V
	AZHMtPBoqTl8QfGvQ3tTyd1PGfidjKtXtJ2lsUuXmp2euJH9uKVRPvrQGT286c+xQLOqe4kAqRN
	cagPdjuDqmtjQOciS6s1Ewp7M=
X-Received: by 2002:a05:622a:a18:b0:4ee:403:7f3e with SMTP id d75a77b69052e-4f1d04df845mr58487761cf.19.1765598566539;
        Fri, 12 Dec 2025 20:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc4ximOjQPXVj5aYQYKEhiuT3BE6BDth/OUUa2d+dNwwoMbOuQg7anTaVZtZI83QA+Bbx45Q==
X-Received: by 2002:a05:622a:a18:b0:4ee:403:7f3e with SMTP id d75a77b69052e-4f1d04df845mr58487511cf.19.1765598566091;
        Fri, 12 Dec 2025 20:02:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2fa7fe0sm2582787e87.72.2025.12.12.20.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 20:02:44 -0800 (PST)
Date: Sat, 13 Dec 2025 06:02:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add NULL pointer check in
 dpu_crtc_duplicate_state()
Message-ID: <hl7op7zsxzmyttdjv2ijyutnobwjpl2fezaz7ohnlahzatui5y@677c4g676ekn>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfX6X5TFmqHAmCg
 p02GGZzK2ZcoegurGn/2o+5KSwhKo3K+YYeDXgmCh7LnrI2JICMOA836r9E8xidKCCT9/cZIK/U
 NqFAqQ6r26SqVd3yHro0sfDwYjDZtWXBz9Vt/TXU7EdMnwgz5XdFonDtm6z19jrINITHl6l750K
 iWoWjuPsXqsVeJjAuuqdWl6JFbHcGqFOyOKxevpxBOA7zCG5RgGXswMNTHLFtju40NWkbpPj9EX
 1pGAT82N1KKaVd3EK7pmHam28vWYMjXbCtiM47ASWQXbLPG+FNJ5QlX0NLNwRU5hE1MFCqjcGQo
 F225Zhz5i8hHUD7/d8GtBPYtzAQiRo1DMJ8kF7GJqAW4nDolYOoi/DGNPs61eSfphAGStjiDpQd
 QHg6oVrLGwFHemqeMk7jzf3Bh6breA==
X-Authority-Analysis: v=2.4 cv=e8ELiKp/ c=1 sm=1 tr=0 ts=693ce567 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=NGQ4gkOAZ6mTdP00BBYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: UB_U0gHlr4t_AGBz2oF3h1aZOS07Hh-W
X-Proofpoint-ORIG-GUID: UB_U0gHlr4t_AGBz2oF3h1aZOS07Hh-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512130030

On Sat, Dec 13, 2025 at 12:08:16AM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> dpu_crtc_duplicate_state() assumes that crtc->state is always valid,
> but under certain error or teardown paths it may be NULL, leading to
> a NULL-pointer dereference when calling to_dpu_crtc_state().
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Missing Fixes tag.

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c39f1908ea654..d03666e14d7de 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1114,7 +1114,12 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>   */
>  static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
> -	struct dpu_crtc_state *cstate, *old_cstate = to_dpu_crtc_state(crtc->state);
> +	struct dpu_crtc_state *cstate, *old_cstate;
> +
> +	if (WARN_ON(!crtc->state))
> +		return NULL;
> +
> +	old_cstate = to_dpu_crtc_state(crtc->state);
>  
>  	cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
>  	if (!cstate) {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
