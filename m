Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B2C2E3706
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908348; cv=none; b=co0lrDjnfIykBjD5xJFSpvDkqPFUp5ZKwFeCzkZrWQNS084oXGM+z0KVeZaGzC6SkRdEaCrh0+bEfcFWTgJQUMjjdBDF1hNfYTaeah0ieZ0ziFJTChKKofSaD1+CToITERvBY0Zo1uzEfQvP8G9p6Zl6aao8kIGn8iwlHvgyi+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908348; c=relaxed/simple;
	bh=7/8dM/Xx2So3McTrDBstGgyw4FvAIG3Efd5JypBSmKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgDC5m85fLXisH43WbFLperuhZYbmQnS6fyllGMYdCIze7ze71wwNR4K9FAVkhdthb3PM7OGhvvP2/cSsC6a7/1/DBUDW0uCnKr9v5GG8/S7e0i9nt+wc5tUZt7dYVAzo0liu+9H/pbAyLNU1X17LrtKuXGo92n0ZU1UInWpAhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA02Yh3N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA02Yh3N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAaf000658
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WlaZxjCGfsTi93SkuSR2T8Yq
	07Bi9pE1AjxRp5EAaPI=; b=IA02Yh3NboUJA0n3jJF6ku+QfGN0XT8g2rXZFYHy
	VCmVeGkQGdA0BITjpCxL1edsddPuQe5QTWsNLXvBQw7tad1h0hBtKRwE93PqghzA
	dhJUCdZsCZXqwj3zwbGr0g8/Ds1hKLCdjOBQNnflluOO1h+t34NmbXZzwwCXD43M
	ppy8wv9uyj/xeD8I+mcF4GXFvhh0zHrppeje6qljyf9RqJvDO/7dPwZ8/7NHxE05
	XzYTP7uYT5c00PkSBMt0AnQmxCVD6AHOAUDo+hRzv1lgQgsvArT4p6OmXhIEsaI/
	79LVIGNGDTTW64bNBp7uFHK8IBLz1Qw6dvDKJ3CXsKsEcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kycn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:32:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08a2b3e83so128333381cf.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908345; x=1755513145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlaZxjCGfsTi93SkuSR2T8Yq07Bi9pE1AjxRp5EAaPI=;
        b=B4cSCVesa5SWdQhaywcbjuTSXbmfpI+PUPxVy4rIdQ/Ua/yGR9TUfx4UxwNSOIlqcb
         DXF9b8mnhCVmvwH+iYqLaObiEEFLXWqVNkUIY4/lTZ8TIgg69DLdlxYPQM8GzzBwmCqR
         aNjckUGiXCajnsLvGYev6kv+xl5DLVU2vU+Ozw5fNRCacctOY7gmPZe4PAaHgkHkLTlM
         tb4tgrbWVCeTre+ttxWsYlmc3FI/8QB3fgHG32hRctw25I7ONIlOpTeVR5x5N1UTfCfv
         3j4n1VrDmjBu4RdrbZywBkVphaJcUoU5z/NcxaySPuVrYa3OoOFXX9jInz5nD+ok5qxE
         Ml+w==
X-Forwarded-Encrypted: i=1; AJvYcCU64/owqm1agB1amkaZIFuIMn30Qt1x4zSPzIVNN0Q3LOYOPbuTt0qFLcqmFbBwz0Wen44JbyoifHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4pc+/y3YN0Pzk0wlbnmWNyZrQywdVbD78cpDlgWqB+qHHUgm+
	HFfIdb52W5f4UldNqLpkm51sw+sX8Dtd/E/2kqXDHNbUyQGxRPPxh5z6SeP+nIjBysRZrke0Cx/
	YIqU0bFKpSqHxFudjWh5SqloGsSmpQy+/EnwHUo2s3L1hjFG6wS5cXWwUmDaM1aI=
X-Gm-Gg: ASbGncsBhuKx8JrYxiCeO34/Ys7WbvdOo05gYxA+7ZEZYUhJPrU/5DkUlWO0owMoN65
	Md0xOc7TLLRpo1jT/oux8YyqM8C7Zrr3SEQbwXl/O/1Cm+ZPZgs+OuC0hBA9q3qRmBGRqfV98mu
	JX1AuCcfYb4BiTHe2g6+4O4CvM5MVXfvSX1cfHToByEQQEh4QVOll6zXzuAeVgREbGE+nRbUuc8
	9TgNq1LPrNtnVJVhb1i1mp2YrnR0lIkeIPM+x0IYKcZtgTdJPw0wSN62dI/sSl1LTSn9QS1KHAW
	W7lEmYYPYBo6V0otaRvc1v4X7M5Syf+Fru9UwD3JtUuszeOErYAgDexGcM7LP4TrUMr+Ryg6K3E
	1GeuypZRv+hfieyCCeqj1ll4B6hIqT/UZ25MdCAvSIs1CMwSl5vkP
X-Received: by 2002:ac8:5850:0:b0:4b0:8633:f961 with SMTP id d75a77b69052e-4b0aebe7865mr200416401cf.0.1754908345038;
        Mon, 11 Aug 2025 03:32:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI8sa5r1o7gt5+wFXRCE2Q7Do41HTXVXbxsWRBmDIwxhwtGo1QPiM9a8ztAkxfkOqvDVAq1A==
X-Received: by 2002:ac8:5850:0:b0:4b0:8633:f961 with SMTP id d75a77b69052e-4b0aebe7865mr200415961cf.0.1754908344591;
        Mon, 11 Aug 2025 03:32:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898c158sm4264371e87.14.2025.08.11.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:32:23 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:32:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
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
Subject: Re: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <oukh4eoh3kwyzqo5shujprxsizssbs2gckaa3fr54tqu5qmqkc@6nbvqf4rc5av>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
X-Proofpoint-GUID: 7UbJdlph3rUG5_VFgYKwRNJdX7-ymp6b
X-Proofpoint-ORIG-GUID: 7UbJdlph3rUG5_VFgYKwRNJdX7-ymp6b
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c6ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9wg58hZYqdY_vEwv324A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX0BW+Vvz98oxe
 mbiXvy4DrH2yZb1oVgAL4Sp32KQ9uM34FnDMl4/okgGiB0YvOjr3UJ0zPEisUzs8mN24l4tda41
 VXe0Oq1zGZ2nMQCnA+eF9QDYbcR4sbNneYHPkMHT0dKjMfeqlui4yhvYbRzx7jQhrgIFsBNWp4u
 +GGNwPNdUXMH4JCNS+QfItfRu71eTz2e4haWv4XBSFHde/eRkJG6LFrEmJj4zHbW5D3bt5prpk+
 IjjV4e0Vt9Pa53CRRONflhBtR9jjYMsSFSi13sGwwH9DHuCDYfEDZD5+DaVIZgrqtMshlHwTMBE
 cHkQIRauyaRxFl59Bw+KGIl2ph1zPKhE5aOAMOKSCkbNvl8nbaIO45rHO4sQwYZ58TOTlzWYYcC
 H4E2LeIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On Mon, Aug 11, 2025 at 11:02:46AM +0200, Konrad Dybcio wrote:
> On 8/11/25 12:57 AM, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
> > patch posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> 
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Unfortunately pw-fdo doesn't track series replies. Could you please r-b
patches individually (sorry for the troubles).

-- 
With best wishes
Dmitry
