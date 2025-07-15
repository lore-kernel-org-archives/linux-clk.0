Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B41C1D7E5B
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592066; cv=none; b=hgodIP0mhoStUj66aQ6EZOgf/DwMCsUYCfglcrkdOSFF9i8/ffdePasHltncX+6QocGeeTjqWnMKdH2vIyByg88QqN0W9khkvuXBQanR740edASmHriBTekC6BNelqCyXbTWuDIN3YyDVLYgzrOj/YpXDVKapJ24p3WX/mDoOgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592066; c=relaxed/simple;
	bh=nw3fUOy4Dyo7OtTrgCRJLRfNiAZiw2FkoPy8uKRJufI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcAZITUrL6+OIV9KyFaVrNZkq11oVxDkMfgjGANrDZNhZ6V0zr9cFEh6iE2WKpbrcRALSTS040eXcpwTpnTgJO6D2zmMQbv0/bmxJBL4vpW4GW/zs3vMaOwQxeJHtrM0rxRplsNeypCBe+DxumPDtbRhLdhz/C8r5ECFxKQ+rw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kms4CHhK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kms4CHhK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FCQ9AS008643
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 15:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UFE3yd+yxu1P9RbRQyZIroNt
	ei5T0YAfVddPN3zIsz4=; b=kms4CHhKguztPZrh6aMbRBtnl6d9uGu4uOFm50lw
	iMEm3Hk1vAypjt53Ce3yleNqozyM/XTTCxr+e4G/uDCfYHbXQAg9h5hQNPK9y3I2
	udYhwnexMqZsF9/inyxAfUZ76hBWYT3td4TY3OazGAs+vHQuinCcwiorjzrk+l0g
	1Za2lALAmOj85o6c8rScrhk/vR+IhdCd7eBxxr3eg9cgxubjapge0iJaHFWolH36
	PYJa/KbYNYKjmbLO0zdUTqedsIENjxR/LKLsuUc3U4b4zj/FX1nbUJwrZnhLZ3fE
	bV+7Tw6R8Bs9zY0xs7ikJuxKj8mBvjo/d/+R4DU3M38Xdg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58ykj8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 15:07:44 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-73e5582ada3so764991a34.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 08:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592063; x=1753196863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFE3yd+yxu1P9RbRQyZIroNtei5T0YAfVddPN3zIsz4=;
        b=RcZTkaPEpRwBnNi8NF0Q2orHzquFoJYqduOzCH0olg7iQQ+3K1eSAMUBL5CDt8JCSW
         o0G43LieTuUQ//k4q/DILXBw8mwHoGEdUW9o860pQL7sxCPYAaHsbpQrSY820Ed8Sqyo
         OWJYELtlD/9VTbsmoTXqCVb4mLbUloCUrd6CYp6EZoGyBgRHWS+LjgsWuO2sFp5itFsn
         sZ7bYm3AID2gy5MAVvO+0uuNY6VkxqGJpVxFOCmxFHG44sw0qqz97yktIs3/U4tg7YYv
         EmWzoKaqkI2URMob7QkSMk5WaqhjGGiDXlg5in3Jf/fgLzZyx4PBpIZgA9tFtBYip6I6
         sK7A==
X-Forwarded-Encrypted: i=1; AJvYcCU/l3MzkqN5aDtY74dhjBzBGWmwaBWXEuBV/0pxCFHtl/bRF5sqkV4SGkFvppiSSWOp1DPSmcYW6f4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNN1R2Nj+FGYEKDB0TtOmMp7D6/8gdNUbuk9/MC/iWcHZgQK/l
	2P7ZjryxuZvD1PKRVVlL50J8jd48DqKs+IYh3vPQAx3GEvc/o7Cjh8GOIru0YoWE3jQ5x0XT/Zw
	wGv9HfYgWjYuQzThYP7a9mlrazmNzIYmg2vUQgwoty0A/XJgwOYhPYVcPvrYH8JM=
X-Gm-Gg: ASbGncsR0LJ2sceNrorHpf5gEE2ExiDbEEGdqAtRdOp81Rjt5LbWkz8LhAzCSeu3KS1
	eMuDe5gMpQy4PxEecMjfzgBqEn8Q4QGAWGZxWxA7SMxiScCzLJQ6QsSbBZ43anUXTGHvyRUE8KR
	bPUuejDvHDzHRSSdonU5Ro87FNDoqZTcsTUy83/4R1usT8pekGwf0yAz/M+faJv9TmTdrvtUcQX
	lxiQylhqMFilg5EBhCeae++BtQglEZUDcIPEqpvJjLQyj2GlMWQbLTJWsOwLjWO75lP/+HS4uyb
	Zpxz0LI31OokGJK0tRw5kjjKee3FaCUwo2NEiLZjStIhPvlpr9hyDx/tgBFS2RhbajqKLssQwjv
	/QgWCwsh06zxrbE37KRqs48pwacOwTDIECctRQgO4xIazEBqHJ3Vk
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id 586e51a60fabf-2ff8f899b18mr3018595fac.11.1752592062997;
        Tue, 15 Jul 2025 08:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzt/a91mT3BodYIFDMVy8jVt1HoRKIa+1bUOyQbH9aZS0Ib97nHGb4Ty6uV5H10BORptHD0g==
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id 586e51a60fabf-2ff8f899b18mr3018555fac.11.1752592062451;
        Tue, 15 Jul 2025 08:07:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d092csm2317122e87.114.2025.07.15.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:07:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:07:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Message-ID: <qk4v2znryznnvg2vcye2m7taurfhoozjjdtye3fmk4fgawm5jq@2qlqgg4htfnl>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfXxZI8UpIpK6KU
 X23IgRg5dnw9JtL5K959oIjBAO3cqOklQNADTNKwrOPGWfbR4+K9RM8buE6Rk86/qRy1axr8w3W
 vDHV8Xze3OFZigDjfhKXASXVWXTum/rfHLo/rDESpAzprmjp4NUHpyicaQ2ThZjPJqduilfLkiv
 8XHHWnO+i2O270OZWxOVzeJb7OoU/tp+YV2Oq3SoqK/rb9tPVuoFQSxxNFnebieI4D8gAmYUEfu
 K31Nm8l0tcd2stlQ+F0ytBzihzhwglDJczuv21+NfwjZFTdRHbW7Hv/v9z7IJMYU14uoWE4ssu6
 yqj7LGd83/LGZOH0PyThLGRw12IUkZFGJs3ODaiUD/K1W4hDeRfjP0uqGo+62NBT3oGhbiBcx/c
 OAUy/2m0d6qhqBjnCcZv6PjcC4zS3H8CA2mDa97nF7icoMIPiyGvULWp1+GCTnDEFni1m+9E
X-Proofpoint-GUID: i1jnl2WfY-CMHxbW_Qe9PtgsJAFjN1X3
X-Proofpoint-ORIG-GUID: i1jnl2WfY-CMHxbW_Qe9PtgsJAFjN1X3
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=68766ec0 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=830 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150139

On Thu, Jul 10, 2025 at 01:43:05PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry
