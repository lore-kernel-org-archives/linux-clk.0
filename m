Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DF62F25EB
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787884; cv=none; b=e7qAOL0ud+Gr5pw9+yDRL3kU3wPGrwFTCi6ef4ezIeF3qvuC2Oa4eG1TEDWEqQu7+4ujsQ2kJKrJlZnm7WuJDJ4y48PTJeBi529fA4ucSPvMsnw6yFqAuv5FHe7e91TofcP/KvIMIshknctujntS0lYu+dp9Uvwroq9dVZfsbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787884; c=relaxed/simple;
	bh=MZrSJkX/zVhb2SHr5TN7TgRgyGzhssV0KFhxXE9mb2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3+FyaNmhCs9OMBmnjApOPWth2Gfx3IFijpTPUSkJwmpuE3JGNG2UNNVzsS7yc7HXhzlJNXM/5IlKXDCj4fTK3GYUhiAgNRmnV80Nd1KCeOkMtSF/WhRYOzEUDy//SOiy366mDnoo4QZ+k+DbBV3y+s2NprXDwBng4oi2mgsehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cd/b/mfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtRhvn1t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cd/b/mfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtRhvn1t"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079q6AK218483
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 12:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B8DdWrTqA5MJK0IX9QJHOaBg
	riaD+iPxH3wCc6Z0zlk=; b=cd/b/mfOAvReJlNiL2kdfQNwutDDZbbPomqgNSwB
	XBY+WKW3cf6+Y4DZd1+FtMvM/OdURJweunR8Atk4wu6Jg5eUeh6tFD1wH2xBDaii
	dTXiDYgJKbQHX961th8IJEiBYatQ/p4ua4IRjQ+REbAjOcWhZlJ0OmM77u/alosW
	r8R/us21+a0RkCAzFDRhsNRYXUoe6Iw2HV8D+ga79FnuLY4Bl/wKgG9SiThzBXWV
	KJc/eI7qGCYZNXAjk9ZKEUWWB9Vy5aTuQNuC/QhFaBQgV/9KR0d+h6ngH+SQOCFv
	JdFREcQAOqqc8U+EH4tSeR7A/NxOKMwXQEEWuDvkmo227Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn808cvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 12:11:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9411b2335f4so1436403241.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 04:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767787881; x=1768392681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8DdWrTqA5MJK0IX9QJHOaBgriaD+iPxH3wCc6Z0zlk=;
        b=JtRhvn1tMsRtWO1uEMBKdJlPZKGw3/HSQGu36a94ZW99APRbSdVOcX5wOEpbsFw1pg
         rQsruW6t6OTTyn8fvfSquW+RffXA5qAVvwoJdyxqPkxt1EJExQ3MI/NUrMfQ0huHvFsU
         r50h0WsvZMFbkigp4FK4hdG7IXcoj3vhTgAUrMf5er0D17nYH+YE7WSjaq46XKuMVVXp
         cXTAsPgaCAJEzIQMacXB+krvKkPshVeQxgKd+VoQnjsIDrW0rIXr6cHlWUmjVu+yy09L
         zGzHeZBHCCAsGxpx2Sx32LICM40tC5dyw3J3TpjVRVQoz0dv85ckPVAWSCwuLMMDyWUl
         D/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787881; x=1768392681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8DdWrTqA5MJK0IX9QJHOaBgriaD+iPxH3wCc6Z0zlk=;
        b=FJYeXz6WvXazzdWEL2MQ/2wnbx0G3bGg8QShoJ1SVFkOoQT74naJrYHoBX2n2wzcZC
         DZrG9dEDg30qP3kzb1mzaaU0WcXyV44LhBg34ChUwVoEUYjBPSeBvJgd6q0wfFVGhhVg
         favt4bwqZ5rHTocuvISjUWB1iPoYezMykaMBP0vku4+jVy7KwS9bOqBnzNZ9NcpnP4gu
         fi2jcJx93Xsc60Dckj+2Elq4aTUpfXn5G3yjZg8RFp/cPRNJwe2hKQ2cPz43mn5TPiq5
         VNlmGf50EBa4OIaU1uNutuCkJuYgIDKwFMIee3g8kIYwJX0Tm/tCi2QhrncsjK9Ox4W9
         YQIg==
X-Forwarded-Encrypted: i=1; AJvYcCVKOt9uxJmPtYDrQfjn+NB64IiwrCUkjSV3wTAiEpLSW1oovMAJnJs6wRmwJD/ZNxfuUm8tSTSmoZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2In1njZ3CZqMXKx1Ewd5mXQO+WKyv+4ZMAPtaOOL6MPqeqWq/
	jlNMh7NQQFwUb9gtR/wmWdy20q2IyJ4H8Hy63Ok9dq6rNQa7Y+S7eO73zichiHOVkpIZo3l/6pE
	Dn6pGo/F/cDdhcvGY6/KOrYgk5x9a8PgR4K26FPvs5JVaIb0kcybw1qen8mxidsI=
X-Gm-Gg: AY/fxX7Q9WaAxxJKErDr9W8xlC7pzEW1b6XfrdJ0COcytjJeXNqIXy20HJf/QXIAos/
	U1vHifxePZ2EhAeLxPMOISUcwVTkR8aT3cm5JQSdTHOV30N0/z9eQypIsBXfmaFO66PAkI8yWWR
	Um6+O8TCJelFlgJrwtobmROWCwnFiSRT3GVSsYKnQfGjtdohimhjPMKGVKnSLhU3+KIeKuVkrPA
	EeIxzVIB+clEm7mfKZj/g7xlvouwOHHy1ogkHkbFPpQH8ZOVXpa3e6liKy/wvpRgO2Kk7LxzsJy
	tgaMt9lcUlaEaU0EEkhD8kJE8Kr5l+70GFFSpTCa2hqPXRXWk8ubpfDtr6/4eMjZPaBMUyKKayC
	FeKx1586KF2Sr7h+K8ix7IPgLYnsfo/VG+uh6mEKoEab44v27VeOlgmGgk/eNlvcV5Nr1p2LA9c
	vpJfAt6eGuuFrZzqp/ndbZ8Tk=
X-Received: by 2002:a05:6102:944:b0:5db:e851:938c with SMTP id ada2fe7eead31-5ecb5cbbb36mr717456137.4.1767787879862;
        Wed, 07 Jan 2026 04:11:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh1Hd2zzf+PWTMiMR3FmXPRYIbB3XVhByWTYZd8M4UR/fRJlpbBKx6uJ9xR17c8To6bYWZoQ==
X-Received: by 2002:a05:6102:944:b0:5db:e851:938c with SMTP id ada2fe7eead31-5ecb5cbbb36mr717436137.4.1767787879384;
        Wed, 07 Jan 2026 04:11:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7a50c7sm10830281fa.15.2026.01.07.04.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:11:18 -0800 (PST)
Date: Wed, 7 Jan 2026 14:11:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: petr.hodina@protonmail.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
Message-ID: <e4sfp2cexck3llleywxev6hfn72zx7kuq73kdzckks6qms3fvl@i5jjlq6y6rcg>
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e4d6a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=wgz80j5CkXKHoATOBwwA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: uNwtyvL-xTdkGVkvYL6Pf4_IbJ1xsJUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NCBTYWx0ZWRfX7hbi38U2jWNi
 q/eBaNdLSzuV9UKLfKlSwZ2/y7qrOnhsJ5viai63bSWzdLpOAWmOG/m67ikK2n7oRZ3Rn3pxIXl
 mNXJDrIersStX9+TD7sgpQthJ0lyXAVLliGQMPjeMabRZ0Ml8t0OWxr4I4oVwpdWcbBiXaYVF2H
 IKF3QdmUVaj9shYwR5aevbu5/LvCxhDpvVbXXaCUryhGldykXZoDjmDIrupK+knf2Uz1IlfSXc3
 syYRD5kcB36akyl2WxHlViv8pUvqWcsc3OpgwqpMiq2TOSawjTWnEiX2019SwpEg9wAXSMmcAg/
 fcPZb3Nh4i6sVUEW9JDZlo1j2A7Gk1y0S2Pjac8hfXng0y4UlUrJAoQ4F5ckjZer1Q4g+/Ot5jp
 SgX3FULlTXsb6n1jwMJtODwe7lyvBS14riIWW3gj4zN/WbZ0OFcGBKQLb/TXWohvV4Fi/Xi1jCQ
 5ELSVZQ7VUtEiWQwIpg==
X-Proofpoint-ORIG-GUID: uNwtyvL-xTdkGVkvYL6Pf4_IbJ1xsJUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070094

On Wed, Jan 07, 2026 at 12:44:43PM +0100, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
> 
> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.
> 
> For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
> though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.
> 
> Kind regards,
> Petr
> ---
> Changes in v2:
> - Remove commits from v1 and introduce proper fix.
> - Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
