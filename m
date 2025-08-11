Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ED422A4F8
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908509; cv=none; b=qZjl8k056OGmR6NIVfBeuWH6nWbpXZh/UqsxpeNANWr5HxevKfaDV0B4a9BWQeLB+bVmTd0lqR8apB9VP1mMpHisfldC54mWEjkL8Rs2gOFU3wDXCPpe25IQms3qJ013NGEzA5f6nEdf+wmROpCQO7RInfei/yUOQcPk+lXwHxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908509; c=relaxed/simple;
	bh=bmQlxUXXqyRd/mIf8K3AoOou+MqJRLfIh/bynmy2eE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ti9TLMtCXG2cNqEggCq/V3RQc4yg2Gqveu1iyPPlYWyX02wutp9CUMUk7VYIAZMT2F0oWEo3q68/DDv6Z5j3UTbv1jngqOACSIuB6mCzrbaTma1w/Is0AQY4ypLTqFncUYvWxINqpaHqPU/GFDbIbdjFf/0LLCSdQOcXFq2mgf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuQzg8J+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuQzg8J+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAC0013094
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PE6gchWgUhiQ/wADu4ACCMtr
	JWOkRrEv9QXoDjpuWRo=; b=TuQzg8J+9bNzLvszHl0wheo/9IGGjtChvXLsCwO2
	y73TqgwF55KLwjVWLrhBwLXoggVdelQUYVadf3P9rQ2TlQWKZ8w8SSneV85Ui7lH
	BTwIIkYjfXO6wAbWxelBGfn7KV5OdBcaCuwYBAa+f0L3+M/Bo42bTqJL99e/751s
	GZ32yVAC8gi7Ywwv9hQtlURN4ndCWg5np1NQ3rh9IbLy6j6QJiCZoUVDfntaEVtC
	NXf6yNm5NaUGMWSH7opBibEBjmtgbF0bbcnzEM3NBaQ0lb6F3g8W4/r1qWVstbGS
	rWsMxs1Yo/15XCANUnJj9YB+oem3thraVjryUrp6row0eQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmm5m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:35:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08d73cc8cso119731801cf.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908506; x=1755513306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE6gchWgUhiQ/wADu4ACCMtrJWOkRrEv9QXoDjpuWRo=;
        b=GMRfVKOxFRbCdmgF3mU0BXnMCcxPkGmg622R2v4JyKJ2xe3PybVq884RYJLG8nEM8C
         Ezw5XL91oTh+Ww2HuX2PsL9Zvc1dVqC+FKGrW7k2dn3BMd7f2rfmf9TI0WbHLUk/ARjE
         B1uGoczURf3eIB6x1A8Y5OqPx9fZ6cj6laIS8LIoxjZ3O5x1sxO6X7HBA07E5YG2WgmG
         /wNHVESxB728ZnfK5fTW2mAJYul+x2vDrT4c3QJMDQSD6f7Mj8s9xoI71LLVVjh0YM0H
         xafqBYRISH0bIWyMIeIXotLzBKv6QymleFD1Oe4Zg6ATXaMejQ+sRnE+ZfWgWXfzmPUO
         atqg==
X-Forwarded-Encrypted: i=1; AJvYcCXwKqmEN/26ycPwyFHy5yCoFBkn4wR3z8YsQSN2KQsFW9nnuh5y8IZQ3GtVEgDZBdu9cm/tuhX0iMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPr9FcGLwFgsXzg0PvVWoLh59QzaN44iXvi4S9RWk6V/YvL+0
	Ndk9HECjPtbmr+efK8jd6fONnzkyzK4PT28LSaf/5GEBaUpPMocSKskv9iIj8aFCLcxCc9KuWUS
	EXOSfIXCWasoS8XqIBNMK8HCtZ0ZjgpWB1PDaWYch+LP6N4u/ys4WR4zLvGPXUmw=
X-Gm-Gg: ASbGncuoA1X1tqL42HXXjXKb71ILfgGb5ncWAesR78gD/cRcvUHXSAjm/gbGZpyv0f/
	XdULnKsdXDyYooF/Dy4D52WU7g3A2rK4qO4xER/TN8hI6F9IVVWDZXFJF81onxZ1sTn/OCSzDAw
	zJV5ux8vdO9ta7UhgiflNS7x7e0E9joZTX5TKTzQZBfn/Na9slPnK1S/doQfMVMSSjApuR/Y326
	bT3f9CT/FO67Bfg3vywMfqMPYbo+jtSR9aLNP76yYt5ly48J2IWYsVhme6keyuaYodFq2grL8KT
	9m9lMYKXagY4jOb1znAUk94ycGv9fET0H6ypiQRlWGXiqjQQxRyWuxF7NG+4w/WnS3jlf79fwer
	j4yL094qMqfDDs1buqW2uZ7SE0sIus9lwb2444TmCMR31X1ZTCcAX
X-Received: by 2002:a05:622a:1105:b0:4b0:82d9:7cb5 with SMTP id d75a77b69052e-4b0aed4bf82mr177683111cf.26.1754908505870;
        Mon, 11 Aug 2025 03:35:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5z1smTUet+hX/GcT1aT/9S2JjVbf9QV8q4hC/iCGMx16KAq7C3GFwGhrpRcaCu48ZUqvWAA==
X-Received: by 2002:a05:622a:1105:b0:4b0:82d9:7cb5 with SMTP id d75a77b69052e-4b0aed4bf82mr177682791cf.26.1754908505440;
        Mon, 11 Aug 2025 03:35:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cac7626fasm2255259e87.174.2025.08.11.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:35:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:03 +0300
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
Subject: Re: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate()
 to determine_rate()
Message-ID: <2q7yo7ad7xvxkij3jtelrqxxctmaatdyi6zavsfhwq6oga4w2u@woq2yrvdt5u2>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899c75a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: gOTxIOe4ewIpKNgBrlwKKGUUBppR5YeB
X-Proofpoint-ORIG-GUID: gOTxIOe4ewIpKNgBrlwKKGUUBppR5YeB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX+u8HSn5mDdEY
 LaKNYJy7ARhW75NH4Q2WDuBbtAHQ0yG+Zt0c4YmZfUCAtKACynMbCTxBSpF6V0P+mzcWeAMvZxj
 HI66PhEMh13r3qct8q9HwBAfQylu6Cyt1W7odsKiLsz2La7FKoqm7MyMQxRfUJcKDQ/taqmlWG6
 GFNFmrmDDKv2GvHWZRJ/dK5Fme7R+wL2gI2rjOUYqgiKf4SemCQ9JJRybhDVRxuomDy6J0AotGr
 3CoGro2kyKDK4qC14/klA6rgUhTPNDBlDI11MCiAJ7/n1OY4dFXTuHgghhzxYmNGrgNsvYeTqLu
 N6VYWqUjzr6tu1UpLgHZVDtoAd0XcTXqXtQtugda6WRY9pdVecUTK5ZSUZyutNniqc73YrWVPue
 5/23PUmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

On Sun, Aug 10, 2025 at 06:57:28PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
