Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94772FE56F
	for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783793051; cv=none; b=o9HgKAwK4FM4QxCyXinA+psyVVo0kTdShm9tusXAJccKS2d5saDuW/XCtX4TgiZrGDu3ZU/C0X6NUPGNvNY0UAKrnMdJT0ptfulqUmA6olkFAPojlQir8WjnNnOVCMh/Dc7RMn43LdypyRTkbph+hs38YKXlSWCs4YyqmkmvHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783793051; c=relaxed/simple;
	bh=fMoeKDL01AH/hbKIXK7dj8/vhNF5UG/sgOmRbn0CUYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/SCiRbnlD/SiMKsCY8+UaTzB00s2NhnKw5oVbasvj6499sJnct28yvSlV15LOIoHHx7IZCkqA4ARqGv291UZVUA8/Aqku6KHUhii3KsxKVxnOt0u2Sb0YyPr3wMgao77ulq4tS4VR1c+W5FbLqPXS5M4ZGIv4GROXYdttZG/dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlhG9iGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEYUxQRu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlhG9iGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEYUxQRu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHpkEP342547
	for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 18:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gi7mAsPzRKDSQ0PcWw7D/RRQ
	waT6XIdXYVfkOrbW+f8=; b=nlhG9iGsUHzeL/pnhekXb0cQ7HhewmN3YpC/275Q
	H7XLy/KMwJ1+b2ZI6OhPtuAo6Z8h0M3Sk93fuuw6etBHnbb8uhshs9nhBrbH7cXK
	kLDDcoqjYUC/3uGM5+45SVW8p+6sZSFJfJv0b3z3xXUPkUl11kDeKHHj+2yU1iqn
	MfZ4lmy07AiA54I8IgdSVpsGf3QdoK2PhqnNf55ddEZm42f6cBpi2GhxyMIqsFRI
	K2/6eB0NZjIc0yVfUEniZZQd0WjQ01GTIzxTbQbZZsqw2JnKlWlBiJz0tCyvOI1n
	LdoYGMsVVVbE0IVeC74yZovJiDk1dx993brLSt+EelMtHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v9ard-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 18:04:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c075c1e25so15919281cf.3
        for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783793049; x=1784397849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=;
        b=GEYUxQRuc0ng4GcxE3S13rvuONZKCnonUfVk3G7PBKMMOWrmNnDUdbZLKYTA4vHUo4
         FLy3p8fl9RLurp1rj3YbjD82QgwLRYLgfy0V8eC/nDzD/vDMu/P6671R2ikzkfkDCHTm
         6kCXQtHid7ELefPrDWT8ZGC9LGnx7A/WiIUuvJHyqcY1ghiQdlbjMjFDG9pj3rVB/yGZ
         ZwTXpcN+c6oo51/rR46kshWndbQ1iWYnSKli9v94Om3BzFNtj0tuwUAAx2hacPGBXG8J
         FgXjEedWZqW7U8Ofx+pPSFAP2mX1DxWgj7ojbXTiQoT3zNn9bj7Nrv0IIF59kdoW0iSi
         WS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783793049; x=1784397849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=;
        b=M8Kkgsb/7Mxya29QMc2kEuyOz35XMFLPw+gGSeVSYxh9oq+joptCVWhJm/zp5WE7Rm
         qv4Rh3mpmdRduI2XNhKbXQ7Sw5x/KaeLkD7gHzvLuyHMMlrBb+UShGVHjOITnux0db3n
         t/qU+nxHZ8QwwBe6CdUumeNEtmyS+dJsXdTHvRavWYDjjoBVkJrCkb4t3Q17sSG6VHaP
         yGwvuTJwmUaaJpPnlY4yZZQb1dmUm59a5JHPjH9bLCpbAHwu/oZr/of4kHVADAiAVMbp
         06XMKpaIYzUqpaKpdsmyrC/zM6T/218BZhRssWWVBn9aaKD3vrUwsycUHjuMvNESN31g
         B2hQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoA6rFPJ20/ewb3ygtATJcHMKcQrV1itksYhRo8+FNptiMBqapVgSsL023ofEZDXRAQCQfzenCwZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHzG0FIEgv0B4Y4S3UIzyzX/yOupOsPH4+XcSSgTtJwfqKS8F
	DWcfLOP5ysr+y4f9L/V7J/lloHoV5bv9ysRCD6yt4MsDXGJsbZpG+Kzoq/WdEqVLJtsBSi/xmhM
	QIUuZZJiuTn7ZnpT3FFivUFtf6cattdKAl/scF6F48esjDUK+MK0dl4KjD+nYynM=
X-Gm-Gg: AfdE7cmjajqyhGo8gmCt7Ruj5s4YRabeXEvTuWJbV4aiPvBTroi5XYccxQ5ba7vrZ2F
	tcyH9jsJ7+gxUSiGXH1AjuiVz/p/Uh22sW/YvwlBLBdxBlIm5vLd0xasCGoX5rqi4ou7UOl0b1Q
	3R0MYzw9tuDQOUWuWz2sZ3ylEAZvjTUh4jyZGoPs3lqeqMzPcVSyTA6oF3DSHY6KFhthIa+tx8q
	/iaN50ZI7WQ8Y4WIKQ1c9C/4x3gx9FY7vDjqKojYSAI+0IcvC+ZLX6DQzJe7fIHosSQ39ry4EFz
	tJzuW/6OGTIJPdoWQFztdyEC4WeMqRFOjn01M9zuUdrIIOirQ7AJ1tLjIOnGuEakEJ8ja29Bhmv
	n1/NU4XXIRAJTgpbSrq48TdLKJuTrEMQyKrl9OcGPXpi5sOzU4MSjRMfKoxwcrUJZVPDspu8qiJ
	+cuMu8e6PTyafbvQ8TrnAn21Jh
X-Received: by 2002:a05:622a:58cd:b0:519:ef86:127d with SMTP id d75a77b69052e-51cbf07149dmr36273341cf.18.1783793048961;
        Sat, 11 Jul 2026 11:04:08 -0700 (PDT)
X-Received: by 2002:a05:622a:58cd:b0:519:ef86:127d with SMTP id d75a77b69052e-51cbf07149dmr36273101cf.18.1783793048432;
        Sat, 11 Jul 2026 11:04:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddfbsm1478518e87.54.2026.07.11.11.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:04:07 -0700 (PDT)
Date: Sat, 11 Jul 2026 21:04:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Message-ID: <vbsdddrjoq73h2tal77rdm573ydomwsagr7fujjh7znw3dnbka@olj35zj5pyzn>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
 <4g6y4q2udludhwmoqc34afwj5svra4a4j5bmpqza7h3av2oov7@6k5r7a4meruk>
 <c11f9ddd-8533-426c-8a88-0ed461f6a30e@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c11f9ddd-8533-426c-8a88-0ed461f6a30e@proton.me>
X-Proofpoint-ORIG-GUID: jdYSJ8GcILaA0L6Knz4grxt_CXs5G2Lm
X-Proofpoint-GUID: jdYSJ8GcILaA0L6Knz4grxt_CXs5G2Lm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX4E0qeYoYZBZn
 GtgdyWbt6KQVQLVdkY6GgOEbybE7SQWsLLDsX1fO1Lu7G1D/LySpd+59UDw1QgDU3NJ0HjyspST
 lmLrowvDMOMgVE3/Sq+xBWsaTjPzN4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX2PfDT1Ak290a
 W3cch9pZkHOws8u0jA26D9jKQ6JXNClKwGGaWsRtk6ShjjWsqLH9+YtL9CT745bIHKi04HvSkQm
 mMzWV5kjkPQJxOdYnyenHOCwOQIO2YEgqNZylXJu9Bcjaj6J2PNujLt01Osg4vZgmJLdU32/C/z
 5NTeb6/oinOrTp0jtDKZ2vZiTJWepNX5LTjxr9j/tOfD9OP07xS7jrOUBSMnWjaAyWySlrj7ZwQ
 4owAduuXOkDMISPUDnptNaj2RVHNJVs5WME60oZhccozI77d4UFfPGfei3KMQJX6WuOpJQy2x7w
 uonuFhX+RcH9ghu1QsIqkTWH1qRPl+/Kuo74C1QIzH+ns7zcx8cahIpt+xKjFzBXOekNAD5wy0l
 QoR6FoiQzIP61pGwPEhOzfEdDU2W6dqrhucM/lVElwznqYqnlb8VnnqP6tbb9xNC3LbhAASCCG7
 6zN18DFtPE3W57NhVBg==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a528599 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=A3yFiG93vv4HRecOgxcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110183

On Tue, Jul 07, 2026 at 03:19:22AM +0000, Esteban Urrutia wrote:
> On 7/6/26 2:24 PM, Dmitry Baryshkov wrote:
> > Please verify that you can actually access those areas (boot with
> > memtest=1)
> 
> Thanks for the suggestion!
> 
> I actually did boot an SM8475 based device I'm mainlining (motorola-bronco)
> with this parameter.
> Deleted regions in DT are as follows:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
