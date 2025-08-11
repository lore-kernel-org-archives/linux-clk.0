Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F91238D32
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908537; cv=none; b=ZinBR/ECkYoqAPC69hVz4ffF6Fule4On4Xv/98YAa2l/fBwCcUlno92Tw4/GjEX8ispoSj8TzW8yTGGAsg4UUFD7XAzTVcC25iJGKLZbBBzPB+uva1YzD/UFPTQaHA0OliUIFuPWBGHtD+hOHf4xCQN0ZwnifCnACOlyB/9wRlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908537; c=relaxed/simple;
	bh=U+O2YmiUaM5zrBR2yEMYBT03LRa2SmNuFAgb0DjKNA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAotfglqHdqQAfLjaZgUShmVAdXDwM/JvCOKj9F3BO5r1ox1vHz5gOI/sqQAnhu2W4f7TKDTl4cYiPRcBHRmQqHU/+wpF6Ubdq4CRvbTH4xyKeX7/S1qHkrzO5qqgOLOhlllVlOyRFfLfVd/D/Cp1ojbRdEiDGmQ6IcA9Zbrj6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iabp8jC3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iabp8jC3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dGoS000789
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3nfN60jdUBtaQs39UNaxVpig
	z5/FB/TFepwaJ8bZmqU=; b=Iabp8jC37l+5c1heoHBD+T5SrH7/okVsULQROKRB
	4CBkj/JSZHMqZ54QQXeKxOrXHgbXoGBTBdDjtNoQM1iopYSgO5Kg3/rUdb+GyHoJ
	Zy/PeLma5V2wHjNIQwvYYaeu8RQnFBuFf9xDlPa55UVmVazVug9oUJpEx+QIGIcp
	FFI6oYnM0VaYO4I/vbi7rCii9D7n041roc5P361r663yV1C3YHwoC199KRuO1KIu
	VK5l9p3LnDvx+xpZlohvUh7wp/b516RQBrqA/poieFDWyyf3mqE/RLRLR8yOeion
	gnrszwMY/4JnQCl6Ni4juj+H7xV8NGGqda2WU1e260uNOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6uyxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:35:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b06a73b580so62328371cf.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908533; x=1755513333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nfN60jdUBtaQs39UNaxVpigz5/FB/TFepwaJ8bZmqU=;
        b=EdEkFK/L9t2sbpvAB7R5wzy80Z/69edT5sQOjOQUGvZVusdSMdwPl/AUAD4gLRRaZW
         gJ/cm6zVOKsocp+/K54fUpiirMN9qJwQWdQWY/RsvCVJLkhVGlxGqMpkL/XUX2W+AjK/
         GFt/iA938quSzThLGM4Eu3P+2YWBSMia4fzJ+Tl68LbnssJx/zKYqB6W03WmCZ24jGuI
         OhA0W8vMSvzrcBqFBjMf9DkRgddiP8MbiyH6EZM31U+Je1Sr7Nj+rSxJIvTr68XPCuSb
         XaW8jHQKCBbm3vkddCIo2Yk16ffK7M19qNevW2NIjDjfrHP0BT6svYfj2FUW3+T9P43f
         oX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn36do2EUHRx0EVaNduqiTvBABDk7lt910Ox6O9C5K5F4Ww6pF27/tmHuvPXT/9R+THJHovOtz+ZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4av7bZ3wTuWhRYJpfUROv6XUvSBlOvJyM7ANPdoGPYAc8QODy
	Z8qYhWnZMJKQ5fSdpsfoAmz19YCBGLGZwU7RRzkqgl3pW0SJMCo7NEWHpS/CI+sfaSbZzsg7IEm
	pVbJc6mTNT1aLXuLteorXgAtrXJyTKOL5b0NFLOe8p8ZWdeKXvqS79aiDgT9qVJ4=
X-Gm-Gg: ASbGncsb8jF612TYPuT9bgmPBGOIvgThc+eCTx5mGhO4h938VV0p1QZ8TXJicR8o5p7
	YAzS0CuZD5VyL8XasbSLRJKDMDtC6BGC7E2X5M7ZJQFWAlPOSS2wRy1BodAj6fK3yCz2VB+GZqW
	aC88SOdzzNqqQFXhfM6IR/NgIAn8OV0laXpG5n7+iHZVoqb8YKhYw74qS/g7gMS+Y2Md2YS7p5P
	3FO4649d/qALkJO0+AH6Zma2VNKmu6msoL+skNj02E7uOV+XmEaqO7en13okm9PVpbAnik+cFNr
	X4skbDLPQxU3tvGHVrVBODMnteTJ44n4NbJN3h4ZbD+ROPQniDmBk+0KVh87gCl47k0dkrqtHi+
	md3D++IgAtSBeSvHdjpduLD81AevjiXtRmFI8YL5I18rAQbRkLSNv
X-Received: by 2002:a05:622a:13c7:b0:4ab:3963:c650 with SMTP id d75a77b69052e-4b0a0718816mr236623551cf.10.1754908533219;
        Mon, 11 Aug 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEyahsxVGaRdWMce+qoZBor8nKFhSp+X072mklH4pqlqFsX+5NaNxsNkaIEI2fGWy6wHtVUA==
X-Received: by 2002:a05:622a:13c7:b0:4ab:3963:c650 with SMTP id d75a77b69052e-4b0a0718816mr236623311cf.10.1754908532801;
        Mon, 11 Aug 2025 03:35:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55c9c847db8sm2272681e87.84.2025.08.11.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:35:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
Message-ID: <pem6b4hf5gzo7jbo46asminbqqrnkhcx3nwsvstv76ntmeasfr@sgckrdc5s6og>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX1+AMqr5EOl9C
 TQXSSsDmtuXlhEL8xgPPtHEoV7s17q4UeVQGazATu1jDzfpz598OVf5wKJtTNkeZS4yVj5+45eN
 /QNU76tkh5S6pFKNQOeLpIOK+ng22mFzGWFbRxJK3N3Ohq31xZ8/5K0FkeV9cpiWRew/bfZjNdY
 owFL3sF/CYtM+5B1L4zoGM70LE34H7Y0h+RekHyrrN3tRkTZohP9K3kFNs6LlQMkmVgFnIhmme4
 uv/ppantIEMIHIloXUk0SHSEVWRO21cQ78/ndh62Z97d5ZO+v6P9TOucQgK6PgrlDRpbPbQHqeH
 6ObCrKS9jPJYwAXL0ew110cC/5q0oehrpY2tvP/iVD33/e+IBLl9npqTI1ikBF2KhbTCEZ2lCPa
 tSqBy3Tx
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c776 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 9lvFfPbAAZt8a6BQ-q4OgSBoHuK5v9DQ
X-Proofpoint-ORIG-GUID: 9lvFfPbAAZt8a6BQ-q4OgSBoHuK5v9DQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On Sun, Aug 10, 2025 at 06:57:29PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
