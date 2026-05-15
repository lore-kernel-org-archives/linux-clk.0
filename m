Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6253F58D5
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859694; cv=none; b=KpK3xupkFgkO2mL1ddk1wTfO+avpNSrEkyRTRA+VeJZBKhPh/eNfPiAxPLh183YIKIw17zMQUMOSFVwPtRMpWmjrFP4upGI9TnH+20VDwlf1uafXMyZz8jr0cXB6vjvQ7fMKMpvyiVuyM8LnD7oFqMq9X5zg9Zqs6s+xg4y/Fq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859694; c=relaxed/simple;
	bh=Pc3MpCtVK8p6OudMDqnhjwapWxM0T8CO+YFnhbV1T6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnjXmxCrt4m4FPDQbdAlRx9jEOEP6TjiagKwwZFyoIafNn/TO381yu36LmEi9W39omIa8RGD3DEACHytgSu/v1c7vxEmbrqVqqBHHJ6KFy4jhKRoulCRTHOp2tTlWTseiCQCFVtdq4PJd5W0bX0szCXhNhlo9N2wvzAR3ocuZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIadg89s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XI/ZNVF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIadg89s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XI/ZNVF8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FCM3R93795431
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 15:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=48QgJCSDGrxZEEMu60fAJNCo
	YBZQJr3kDDsz/0EEYCc=; b=VIadg89sDaZvWClueo52v1sDS1B/qTeTPu3I8+xq
	+s/bqhRXAb5w1C4wkhNEn34mfKed25guHcntxkeO0pduG/MoaWA9I9x/7l8jDC0k
	vU5XBfJI9CZPjB1EuDsWhcNxP/XQI7IYGiKe/QaqhVmcFBJ7aqtWAhrfmoPV0Hl3
	5HDE9Z8kdazyRMV11Ifumjyr9HYYY90gm9y/jdFI97gDG8QA8HW2x04tityde85h
	CYqSpRrNz8qWSf4aV7MO2MXW+mQrKQwW/Pt9/0xU5DNzh3MZFKm25+2atgUNyev/
	HnQB3ojb0tOelxpO5NgTLLoksTYR42yIGmqxkFK3CcZnyw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sutjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 15:41:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso12148819b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778859688; x=1779464488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48QgJCSDGrxZEEMu60fAJNCoYBZQJr3kDDsz/0EEYCc=;
        b=XI/ZNVF84nrZAKcRgX8L0pw/ZhBrb9nZQW2EQJb9/YeXNbu1asTxQ+W0m/ZWOow+tX
         hj1bCTApP7OWJ8iAEmUNs+4sPeFug9/98ORqW9d56sK8FM0Nmm8GeccSHhIW+LpzsCM5
         EjTlLG/HwLGFUQCpQ/8/gcFGdYLzPNVQm3QkBzpWgtBI7C0QTah6DJoCFiQ6/+yRb/p6
         OK2qfIMvYk414Gb6sUwVKOAsKrQ8d6GpjORw/qofvkL5m7k0c7WzFoc1IWbdYnlHxsTv
         S5xpjtnW8Kzhe/DBTni+8MWwtkOQ/9F405Ob8jpniZIVs80ywcij9mKTkmzirDWWyjY9
         jUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859688; x=1779464488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48QgJCSDGrxZEEMu60fAJNCoYBZQJr3kDDsz/0EEYCc=;
        b=Pkch4KqfApWj5P60Pw+11DT48wqunOQONRoerECr1xg4Jkgc00/icBxBsOFDCQSwyk
         9nCYvTy2cfeVEE7kndRiSwvBbaz4BOJlCuJsbM4XDQODzKL3OqEJF9GurkWfb85pTKv7
         BJggRpqTwVNqed5h8XJ47HsRokv3a78B6AKtORweYYKpdyV7HMWqPShi5t1BI0TE1oW8
         jeETwhUH1zoZ3TABwBasbW3u4YhuQ07jBReauQXKha+xfwWZrpcu4Q75cIzl2XzTk7zk
         baGbV9lm7EiJ2KqTr3cfAXXgbU2Yg9i2Si/NMwQ1wdBEw351jrJFTv1NJZe/89sjW2sS
         jF0g==
X-Forwarded-Encrypted: i=1; AFNElJ90dlazJnz7HU1AtUqEjWdtGzEKdCyZeML/W6OxEr7ImpuFYyhbveGv9o/dMRJmtETbGOi8TVnCIsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCRKUm9CogNGVtl/mPyGWdKrYp7zQWvgaky5yfdHP/I3p+BNy
	LewUx+Y872MJM642CIuGfjGzGWLu3jCEKnzahaAYTDiCi8zVtMifn3T3taQXAo/zr5TvIp5yQth
	0Mxxux9YKIyhHjnm/7iieYC8r6gAvtsxXcld+T9/Mcsg7GIRZKQ8Q9TuF0XmofUk=
X-Gm-Gg: Acq92OEAdPlFuabfcfqrXDrIi+j7I4/Kf9XKTmNhzga1IspQ/QcHdhwRdrAs3HVk8NR
	eQl8LOgzL0zP5Pn19SEg0DOanRHKKGtF75WLwjn9buvbHBMJ+dMlRE7oNFKQPZCTBOEl+H0r1iN
	SoF7xcay10zXpEX63f72N61837KtkLn3RHCgXX9N6CUMYkTjJJni503hSAAqj2rlgbgGh2edDqT
	FFotFzFOC2XWzGXIDFKjKTV+A+pwpe0THFGVUoIl34pL5XaCfrW8hCqVI5DtsJHKtF0MGGbYecE
	c9fN52+AesZMTmjIOistpOCWfkrSpxXQXUBB3WHOxS+cpEAmnKmTnq1Yq6bPDoXCAS018jApnKW
	pvS3DHN+syaw6ga4fQRYeHyW1Ocwi0VlOOofthb0un6D+xX0Gq9Qrfm20mxLTCv53Uu6R4QHLDp
	C3Ffy4vI/s02ry/SwPC9UzRm30jY2I6akH2VuAavPLM7X/prSwCyg=
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr4982583b3a.1.1778859687682;
        Fri, 15 May 2026 08:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr4982557b3a.1.1778859687257;
        Fri, 15 May 2026 08:41:27 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c39esm7532977b3a.36.2026.05.15.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:41:26 -0700 (PDT)
Date: Fri, 15 May 2026 21:11:19 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2MCBTYWx0ZWRfX86CeW9DxEXiU
 +r4aov7+N0M/Rbnxv0uKBHl3VuC1qug4qazmeeg1OGDOU/mMBZaE3+VX64AK0fNmsRosXwTOOJG
 jK/XULQwc2RPUSlUm0GI6dnB5TJjDAIiPN4pqIwbnnbSWvngfkT2HXTrkX2uCnP2ZgKBAPnEBod
 km4DU/kVI0eDDf4VQ4N20cvjMjoKVMEEGNoiQPgXR23J6NJhykNpJ216K9st5m4e/Gd4XwCdyZX
 mJVQH5SItyJEt9nAhjqJJt9MFNBMY3A+/vl/wlu1oOtnwiWblYFo0PwfEkP2pPZn6n27FWRBZ3H
 Aa9lGwOyxTKO84KvIQ7PjzqgZ7PXIWZRuiBys7GTLXMLE5U6LsxLNbou7O9Loz9/UK8tWj8RUoT
 Y+Wh1Jm49USaOf8vjIx11DSouavKYL/QzvSzkHPplvbCzsI2hmYtmnUyB039PCenOzBHRIGTPXh
 WZErOSJ4F6JnSvOTy2A==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a073ea8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jBAFZfc0v9Tf_D0DgaEA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: EuP0C5bx9qKN3oOSUXreguwCQFQblB_v
X-Proofpoint-ORIG-GUID: EuP0C5bx9qKN3oOSUXreguwCQFQblB_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150160

On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > Use the icc-clk framework to enable few clocks to be able to
> > create paths and use the peripherals connected on those NoCs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> >  	.driver = {
> >  		.name   = "qcom,gcc-ipq5210",
> >  		.of_match_table = gcc_ipq5210_match_table,
> > +		.sync_state = icc_sync_state,
>
> in Kconfig:
>
> select INTERCONNECT
>
> OR
>
> depends on INTERCONNECT

In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
INTERCONNECT and INTERCONNECT_CLK.

Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
Please let me know.

Thanks
Varada
