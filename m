Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9C249F9
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753729152; cv=none; b=cemDueVwSpDoV268JHJQunHLGfmtgH4GygBJjZLXyJKLeDwJNNZYlBTp5nmw9x1aw6Qzo+cXO7A6jWUXeetqPGg2x4isHOebnBeHdc3oUPvX2r9rKdeowBGQTLHEtUsOZ8u4hcv3+sX4N5JbVAhUGxw/zd409bVOTAudtV1IDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753729152; c=relaxed/simple;
	bh=IWpZoNGayIjThY9y6ABT29cNtcvfwrGLV6Mv5IWqx5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OE3whdVYXf15NrIJHjxnIgAHrAvSVxkL3vZEvRcz+rv1THh2/DhXyy0BcOq5/rU2ws784uozdWZ19bo9Hb/zixVsI0WrRLz/N/ZrbakMCTqQBQEHS1SNlhKwYLyOodupYi+ud9DiWrqJQvm/fv1Gh+5iaIRsdszwKn+RQTBeg3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcFmvrzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcFmvrzc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMSA028180
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g3b9mjC0DOS1TwNiZSFPS5aw
	kCSouvEfEECI0Xi46LI=; b=pcFmvrzckhuIL++xLIxfre8lNoQD6k+Ws3MV2M6w
	btcd6Titg9W1w/jUeebgyZbMIgfwYKc71Bk4rnApD8XY5EW56PdJbompNCwbJD6i
	7EJJFtNSbNprjMuS4Q4D1+uFs7lTCMbC4XEfoyKTyeCdskXzGVBU7WRjYpoBY+Ja
	SN0Kvz3cnFujCiq09UUWfWtxoUcdQODiGRdSJW11M7f9iWeef1BK4lwP24g4mlzc
	555Cn72oYPTQ2krMRu6FUoksgZWFWkquoVIClMOc4IjftpJe/tQsP7a79kW4XV8p
	iBmXxnTXff2Xo2YnHgUMWfqh5RrVhqlwsmZAlYSdeqOSoQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2dh9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 18:59:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70708748fbaso78583486d6.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 11:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753729149; x=1754333949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3b9mjC0DOS1TwNiZSFPS5awkCSouvEfEECI0Xi46LI=;
        b=fhmOGfYUHO04q63oaH6nI4lFzBO+VfFAm2FmI1gT+qox0UIN5M6NFqi+ZvJRF8bJkI
         xzzY+2l87Hk0vNCfiQBj+rLDr9drg/dRMPMSyMF2oQt+yOzMiGVlfQUpfkw7Jo2IA/YK
         8B7olHH1FSavJxERTVagFMxHzkb2LIr5Ji29HiU+uMrGJ9FI4QTJVbMfX6xagnZhdwsL
         VapOSumSJ2L8as4p+QTvvBuPb67FTmgHAUJynQ34rojfjVLy8PPV1PQyMc1sCj4vz2RB
         GBKs2pGU1yzKR7RCB7v8Bth+hZYKw1BTu5FUmCTLagAGE5u7/xWWCtOUzLpdfT8uc8o4
         Gi5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFJakFemI13q0cEb5Skt5SHkQYq4aCIcTE/hfxyVAZCcAvcmDCUHN/JjmzIVVyvxR02EJZAHS6nMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9zMWECYkCspON8gICMLa5wcVTi9UMaXGTRsq0BuPNMr7VifVm
	fcBf/2lbCF18FkkH2U5ga0j18ec2oLqD9YK8BUO2PaIlcpDLyL9eOn0hsvMgMCxGXZydzn/XjOD
	MYHDyA0Ftp+E0xe/4LKxW5ju2AETNdqrE0gW0I6iruFQ1mLcZJSV703YUkHiWcrA=
X-Gm-Gg: ASbGncs1mxEFrTq8KV7xBHVXMfhKCCjSVUwIzgZCaVStjewZmsknSFEG1zRpqj09dzL
	0AyveTHm2YF3d031EdgNiKlRyTWJ1mqBkSXmfJ4Mh2G+y6Qj1HWXmWOfBZGrieZr8KDjEsRwmBy
	V59aB/zOtcXrHlJ8gO3PHcKhR95CjcNjTCyp1m8+VlxXg4DuSVcPXyXIXfTIBJONPnLnj5g9nKl
	gPDsp1m1U4gjgSw7YGUzJt3HGYChVvpNdSvhYBe9HP+WJ7HAKRuUqg05naEYnRdOdABA5NW3uKx
	dTBzxeEAcZ88yakr8RVtwZkVRDeYRcEIOSpmMGOKXIdSUvSvi+kLNH3Mik1hIIuTYieNmyjmXhY
	WsWtvFbwB8ZAGalqc2Y096ZhkhjW8DNEwjfPCzpSAcwrHJjY/tm5M
X-Received: by 2002:a05:6214:2261:b0:707:1b3c:4124 with SMTP id 6a1803df08f44-70720514bc6mr139815996d6.6.1753729148806;
        Mon, 28 Jul 2025 11:59:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeR/e5yy2Dmbqpj9B2szzZpphi7NqKMlFSMX2Qojm62xxZ84NsscDMGppFa+sWmqZGFGaQuQ==
X-Received: by 2002:a05:6214:2261:b0:707:1b3c:4124 with SMTP id 6a1803df08f44-70720514bc6mr139815506d6.6.1753729148113;
        Mon, 28 Jul 2025 11:59:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f4267695sm13324171fa.50.2025.07.28.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 11:59:07 -0700 (PDT)
Date: Mon, 28 Jul 2025 21:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
Message-ID: <kvnw3wkbn3jedfxryqdikef4db6ij4lobgj4qp4dgrpd3sliga@w6do67fiyhri>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
 <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
X-Proofpoint-GUID: Nkww-RMZYqQy3VPrmGwp7PpFx4R6srGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNiBTYWx0ZWRfX755Lqyqp5q3I
 LlK4hCYNOvefAU8DllwtzFfoDP0pW8XJineJ5L7caEfw58qSpcbAdxuXrOWAkW5rYNbxXOM1dtb
 05cinAuAPN+vWWPvKaJn2lujD6q4F5cXKwwRgVaI8CePyipB1M4L3djejW0YRnQuIUXz915J2Un
 4cbNIYtgj7wYP3J0Q5evAIYVrzhM7iZVUivGVvm2GwwNTWY8xnJ045LzO19Xg2IvUzPLaU/ayZK
 Q+4k/8yG8KroQIxQsdrkgSZHQ0PtVyG1Jg2K5cModcY7CFvFDvdSxtPfOh5tI0r/nW12YncXu3I
 P01pUxb2lIPSNxdPxR3027bIWtQjd/HkV7WlgdYpRZ5kfFVZBOrYWiqmOisZ94zPZIBQcHhPgJC
 WErOrnIjsQX0HAVJbIT+Cwqg55YA1HZYvgfVmYomEwmwiMb5VcseM3hYJ5af1cQe+bFakXmD
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6887c87d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_uIZQMxxb9QNBo7-lSMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Nkww-RMZYqQy3VPrmGwp7PpFx4R6srGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=672 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280136

On Mon, Jul 28, 2025 at 11:29:31AM -0700, Jessica Zhang wrote:
> 
> 
> On 7/19/2025 2:14 AM, Dmitry Baryshkov wrote:
> > 
> > On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> > either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> > the controller). Reflect that in the schema.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > 
> > Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> > laptops. Please include this patch into the series (either separately
> > or, better, by squashing into your first patch).
> 
> Hey Dmitry,
> 
> Thanks for providing this patch -- I'll squash this with patch 1 and add
> your signed-off-by w/note.

Perfect! Then it should be S-o-B and Co-developed-by. Thank you!


-- 
With best wishes
Dmitry
