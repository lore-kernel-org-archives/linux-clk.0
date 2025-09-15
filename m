Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A542D20330
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757895258; cv=none; b=e8RiODLrIQnaqfLimkV275UcME0vlWlPSoaYfv+dRUfU/vO8ukj+cCzHFiCZ125dm482+wugWAspKyyzyXGtOWAoI5ex/qfLOHAEYJgogYx9KQza4JcoHOIHQ8U5//txvxDTX5FMpeMBtCEnWCV6xx/yqtE+Zj9iGzNlBeDnInA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757895258; c=relaxed/simple;
	bh=WC79OzZ3VedAq9lMgsTQbFWH55VqwdungFuaBpz3XX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUnhkf/qLbaOXm9463MguAbClzt2N98/jjvw9FAxMWsL+0kK6U4m5p8tNFnck0nw43BqGISNSMbOicb2HafBmL/z86YhLEycgDeqhTXrvArCbGz4iZxHK5jam5ETcrKsssjnzfKwWDevyFTm+4LAWUqRJhm+rmD6kJBS/s3/Qac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUOFF4XN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUOFF4XN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ENFJHm005201
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 00:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wfIfmtGDU0fMWPSXfBq3QGPr
	RejWAR38abE4jrrVyJ4=; b=SUOFF4XNRO46ay3UYMsN/RFX10KQxXKyoxTnQuXZ
	jFJzdaDG7YKTMEn9DWCJWxVSXROJy/EXK3NdO04I9mcIXSc+Yh/oybm+zoM+ge5X
	gi4fhfdHiD1oKn3jHPCZVjcbVhwM3M+b5O/K2xeAn5ptq4erGu7d/KduI3Oth0WJ
	+B805Q8T8Djcm8Rj4Ww2v9PMeN3VK6fe56aORWjK90imQIePdZ9NFJr4nuelu3MG
	rhecpEnLlhZspV/JJp+w/R9551cQIuSaCTbO+YqVOXuJrhx273m369UH0Fdvprq4
	MlL1BYxYnMQndpZgj3CiU5DnpjQx81xZnY8MOt7Q2TsqqQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072jxca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 00:14:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-767e5b2a74fso27625606d6.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 17:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757895255; x=1758500055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfIfmtGDU0fMWPSXfBq3QGPrRejWAR38abE4jrrVyJ4=;
        b=nLS5D/jZKTZBG0v0OdgDAtdx4Qp8++1lzcsPZLD7zOh31LxSLzOx6dfPYj0vveAhsI
         pk9uKUtg/auq0Wigdmr4LijDhbTGIvXKOt3yd4VyncZypLyOyFYEtD4etUqYeoQF5gQQ
         Q+tC16GhXEzx1ZUJuG3PhB/vEXH97dn3SKGp/Cfy5irVPS4iQ/fcAp2HiTqdu7lIJnu5
         b0ReFqGJKRLamHu/tm3JKvGv6JTM5MxbdMeay4WOQu+kR651xR6MCtQWHkOjls+9bvrQ
         5XiN4dY3skaJ1k+oIUhmNfEohhGirvafhdnN5mQsCyLJeJ9tmONhWPvvDOMuIvn5wT3/
         BGMA==
X-Forwarded-Encrypted: i=1; AJvYcCXKCcLU4Bj6QAFySBSVWMbzQ0CB0Xe+4g2OvlRpUaamGza4pubzAWVTtRmwdEKyalBsyVufI1nd1gc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+OqZX/H59MqjfyNPY0gbwxeSb/yxL0ea+achaDYuMUlQh/AnT
	3MhpAe1ZP3jFUJVu0NfTbdoRMaaH2LyUGiluoMT90RbY7LDyShkZLz+/2wr1r+GaVZj8QjEA0XI
	BW6Q+zTSEtEHTFkA09rAUutMABoucgPQJzOf2DmBktHA83sogrpHlD+zXx8NF8cs=
X-Gm-Gg: ASbGncu3jEmi97d5WjLKzFEL4zCatlAhPQf0CrIXikh8mmTYVJazajJMODLDlDAvmXC
	hXeYGCYgs8fRIVuNGR9CL+qJgNujsGZ1L5kEDOQuYa3bKKlCwI32qiiuAV90E9EV5t7sYzYAzUu
	T+ifLZS6/Q5/1qPhx789XZncc9Z7vmRVLL9hnCYYxvqJttEp72/aF7sMOob40Iy3ZY3jlTBXuZX
	nEuF0mU7A5f8K9+640kE5DVbjrxrcvMorrD9jTHDwmmVSbizfFQ1ao6Jhp50T7PAvvchti9dlxd
	nQADsrAvgBw9QzLfZTt+uibUoK8IKTTlHHlMTJzNgqeYgNe2Pco1Yq+xmwfDyaoDvTyhOuI1Mvq
	iPUmLdImDzjG6PQ/K6PS5cXKU7d12NXB0Z0XfA1OIr+6IkmQ1Fz/7
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id 6a1803df08f44-762262daa1cmr182242036d6.27.1757895254737;
        Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHObBFwIlp3GQ+VOBYwejw1PxkvVAwhDilkZbOEooVdFxkX7Rq1AOhro4RGokvljow6YU9iPw==
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id 6a1803df08f44-762262daa1cmr182241606d6.27.1757895254257;
        Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c692daesm3255202e87.26.2025.09.14.17.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:14:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:14:11 +0300
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
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <pdodeksqchby7gtr7oukm7wqleu535kzh2g3uaseqmkxv5g7qx@jvh5fcppvutm>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <aMawQYUIjPw9m4IO@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMawQYUIjPw9m4IO@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfXzlYyTcUZt8Ym
 y4Ifp9Uneguzh169nKsXxT56Hhn3/+wXytX0rv0wVOWsFrgnocJMdi8BAwNHLUD4jt67ZQydj2o
 hOSYNXYv6ZuH+PF1iBR+AKSxsNLcmfhEf05JFnwRZxQo9mly33objYvJZsyisN+jtD6McRHLv6b
 AWuW2OtP2N8qs04lW4Exsbp/JLGE5Pom0D0U75JHxQZX6MeZDPUClUFYWBCySLQIfEr+48upkZI
 7I4omHHyKuUc2HzgSsihU4q4mVGQI/Pq3aRiUu1E6h8AHEY7NPeyOUC0kMtFg8pNSGVe7+hqOTo
 j68t9cPMrb/lttWTK68HDgwEucZjotI5Fyr3p50xaDosmG110AAMMApnR+vONU3YL+g1VK7t+Gx
 fdHIBtAf
X-Proofpoint-GUID: 5dvLVqu4YjYA8eNd4rs4gfYSJ4Qwc2Eo
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c75a57 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=ErCwDgQeR7lfzThPobAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 5dvLVqu4YjYA8eNd4rs4gfYSJ4Qwc2Eo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

On Sun, Sep 14, 2025 at 08:08:33AM -0400, Brian Masney wrote:
> Hi all,
> 
> On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm subsystem using the Coccinelle semantic patch
> > posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> > 
> > Changes since v1:
> > - Drop space after the cast (Maxime)
> > - Added various Acked-by and Reviewed-by tags
> 
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.
> 
> I'm not sure which tree(s) this should go through. All of the patches
> except patch 1 have at least one Acked-by or Reviewed-by.

Patches 3, 4 were merged through the msm tree.

> 
> Thanks,
> 
> Brian
> 

-- 
With best wishes
Dmitry
