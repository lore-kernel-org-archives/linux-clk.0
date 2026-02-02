Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDB430148B
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770060154; cv=none; b=C9+1NfGbZvOMjeLhxWZ7UvM5RQ7p6sT8YASXENXvvtz6FrrF5pSikxb16Beo1ya6y7ylaagdN3/rJVeZ9VMgdyoQ8d145/lRfHaFKDGa+pwNPYLgD1qJM6KcD2sF6BTQDNV6rRbkYzSbqKbk7UsByV6J+/dpDjK5RTNeCpmNDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770060154; c=relaxed/simple;
	bh=DYOamzKGh7mXxypwNElwACUDgdhs4fTQAbquZDHGhlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+LA5Ps7rDQlaRcNWJYfD512Y/wyuhEozXjiVazG0xlyBM2nxtR7KUjcTtgQBokXs1mk+cSCvNYcOClXIVPHtifiHEOGexKOTiy17f3YJy1jn/yKbd8L6QuPnuKZqPdPqDSPIBFJRuODEyOvhaqGMaReX+gn4fziFxog7cRP3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hege47Hd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+GZBBeg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hege47Hd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+GZBBeg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVDKx255028
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 19:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btWkS/c7dprwal4TPhyVpLCd
	6iARVOljRFkoRjoQnrI=; b=hege47HdG5UdDYNVdtzNh0EKWO1NWXkWYrNDKUpJ
	qZgcCBC1kRhLgqFNwgfkpmDbP1q27UF5voi1xmqP7NWXRQE7r/DVpga0Dmd+ojH6
	bDc0QXrXmBhFhGuloC55hF9gQllwqC1SBIf6CTL1MByFiBxVb9qy3znG4sfOEfwc
	PpeWGQ7Uu6cjSRffjRcc0Kl+69DISyFB4a1HF7W0pLIltEkleVjC7zeHnUEa+Vkr
	Dy39axWd4Pv4qKTT1p5PeGvD0lbLSeQ6Dlfmztz3lGUwOFia+IGX2iGRWemg5muP
	x2Rb1ET+nDPs06vlrCAeKFsJJJhXjFr6vXIRQOVZ3mELMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0khamx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 19:22:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b315185aso898905885a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 11:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770060152; x=1770664952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=btWkS/c7dprwal4TPhyVpLCd6iARVOljRFkoRjoQnrI=;
        b=V+GZBBegDSpnnZTb5H+sm6BgTP/zi2382WgYfTQprtwJjdq1cQaK3u1fW/FAt6JhYY
         Gh3ANB86EMlQ04GPcaiZ0Sn81zTtfTasu7by+ca4YltMCilPa20c5PzQp5WytjpEaaxj
         dO+r05kCwm2H9g1KUXx6GTlSKTL79tD0ncjwLi5TYtATAed40/Sj96h0KisZU4Gy0g8A
         c1mbFP1J8PJDu/i4WX4CWDHctGoLxOfnlgUC1grOA2xqnKg8tRit0L698yzo3u/lhnf1
         dQ2C3pOFmXM91u15SpA++CJud1Xg3/VhoouF5VUE6L8R5qhCBH4LZAkwCzdTNmhUeJuc
         x8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060152; x=1770664952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btWkS/c7dprwal4TPhyVpLCd6iARVOljRFkoRjoQnrI=;
        b=ULpNm2iXV1hELh2U0dWU/TYCYdqFZh734zS6enzVAKBn8lkp1SAC+8+xDOBvwnz4RY
         /Qa1TC+YS8UWbIS/tP9HRzggPDMVzPd9n3kjsywEznPuke+L9uYNj0/gG0LpEr3s1lrW
         da56LOGdUHVDMfLbA9DMkZOpdQYoEne6uH9s+aRnp1fW587RxoEqDn50sNGtUWUf2QWR
         /L6hpYnYr/v6cTnOmJT5KHvjq4H8lUiUwJWj2FjylO0OKPc8jcqnbUlq+ev4lhXFuFu6
         QmuquUBRX5rmL9AySHEVwb5ErPxkTxVVf2K/LeqdCVKVJSGPlM2O7bLA2piCaCYrDWbO
         91+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTXx4cJOfdaTNPesau2p9CYdWIwU3cPOCEb789xBPEnc0z33e/HKAZKyRv3w68NcsemtgJZYhcih4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfwkYplQ1p60K4ItIW62ukAiGwhXP3xgg/pXTcGGcgJQDN1zli
	vGku2yAMRZnheJKgQgQKHYSEEv8CYuWnnfrvVpAy2+zer5D357NVEs5nRsedwVw/wAna0Ki1aik
	RdKWUPAS1Kxh1CMwe/thZZhwuA+HZMSaua9IGP1rVy48go/6XMMOXaN3dRbPnoEY=
X-Gm-Gg: AZuq6aLX8ReI/gokL1PgRgG8ZSZZCey1Y7dwEMC7h5i/aqiKadqKebtiLFsIfOU5ZP5
	JWuV4KzLXJqDsACmMjeSDryJma04gXDQl9MLguKoRZKFVzzh1pGzLIFmKKDESLbCH1igvsZ+vvl
	YoyxLfasnmJS1AFeXzvaYO9Igjbzu/OOTih3SBCsOCMmbLsi8pIm7P4mW1Iy8YMykf+rh22r7ym
	X7lSjFy0Q0QwS6nJyuxQBoCXcHwWp0MAaj8V+t65WJgZ/StZcYqgCn4WyQFgd6KxmKacI+jlA22
	DzE8dZUn/oNgeN86KyrDlfBtHgB7Fvj6POsbz0KmG6KM7yL1HNNx45FHk/73vpmLWNduH2L0qAI
	e85Jmv9FyXINb3XNyFX/KKPNhjLEH8D/zJtK51n1MkBdJyPEo+/xd+WfWqS3UvRG/TvDRt3rZZR
	I66K3Ry5UXorMpW97Vpfp7gOo=
X-Received: by 2002:a05:620a:254f:b0:8b2:e70c:427a with SMTP id af79cd13be357-8c9eb2fac2emr1664618885a.44.1770060151765;
        Mon, 02 Feb 2026 11:22:31 -0800 (PST)
X-Received: by 2002:a05:620a:254f:b0:8b2:e70c:427a with SMTP id af79cd13be357-8c9eb2fac2emr1664613685a.44.1770060151233;
        Mon, 02 Feb 2026 11:22:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f8b70esm35186351fa.34.2026.02.02.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:22:30 -0800 (PST)
Date: Mon, 2 Feb 2026 21:22:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain
 handling on SM8250
Message-ID: <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
 <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6980f978 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AedQi1eqkiGwAd17v3cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MiBTYWx0ZWRfX3qE7cx09rERV
 0OUQ4y6JSUiJ3irp/9hHK/P8ZvIhmWdBmBcHzKPaQKWPMEHelEcJzatLzRymhk/Sl3m28uiC5yA
 +w1p63dbC7zz2n3Vn7uzyjvWaSnnmDhFb74gCIioZ9L6PYf/vF9ZMvJh2fYhAv2NuQCkghSPpXc
 whBcA4meVCQS/5zgB9xHdaDrwsIiYn9dHbIkvnaYJDl/G+t7iedyXGZoYzjOVLfRa8SCR/TFZM2
 9b/Ik4ILHCdybBaDAlGWHRvcpVoBZAa148rG2G+ubpiKScAFuKgopbG/ORblipCX+a1KzaAEKhz
 f/1b1los6XHYRd9w1eLz2B1J29sbSPPJ1OOYkzMJ/OL4nx/JtNIf2Bg305gGBa7MykhI0ier3G0
 RomdjSa1CHRL3MvayZdRX+pTFOh9fwKmQW0cWkwbjvJPPbwrUuGCEFpBBH7RFFDWKMbQnBIVp9z
 fE8aLvw1O7MXGaE6pWg==
X-Proofpoint-GUID: Tajup4ew85IHdscVsD6QUyD49tCXRQlo
X-Proofpoint-ORIG-GUID: Tajup4ew85IHdscVsD6QUyD49tCXRQlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020152

On Mon, Feb 02, 2026 at 05:51:16PM +0200, Dmitry Baryshkov wrote:
> On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > > patchset, Iris aka Venus description has several flows. It doesn't scale
> > > MMCX, the frequencies in the OPP table are wrong, etc.
> > >
> > > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > > stopping it from being overclocked).
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> > this point?
> 
> I'd prefer it if it is picked through the immutable tag/branch.

Another option would be to ack merging it through the media tree.


-- 
With best wishes
Dmitry
