Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FB332A3EC
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457240; cv=none; b=BfSlnOWTK4JlyPlONcYeOpbPxh17FNNSDSUOBcfyyQKyWAOszyciQ9hT0QFR8RUHbEMEuEQKL7ee6CLMbs1ARfWXLSm3Tg9H0UUCjhmweBXiYdnqylXpoeua9pyO+AjB+OfwXVyIJuXXL45a7munkDVw2xmeHzvrQg0dnxacASk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457240; c=relaxed/simple;
	bh=teMokuG5eAWz337OsbJemBey333F13RFcsDFNyApnuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbdeTvsISd/LSXKyg6ddR5mB3hF+bkgyaaJ6Nvn2KLPofpgMYNoCh+MMiKA3FDtQe4CvqG9A6bZq0x26kdUwomUgIvx/Cen9bB+XtN4iaMq0kr9CnoOXXKgV/vr+zS/Ylcqg46mNBb/xwOWFnaJNar33IC6dHojRkY4vVGWLhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa/G3Nnt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3U5bquE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa/G3Nnt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3U5bquE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWlV33718175
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 14:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=; b=pa/G3NntkkJH6Hr7
	EZXyeb37cBrycJ/zEXuxp0UQGPD3NwKZ6PkjwKPDos4cNaxJ9PpfG6xsgoLKPsjD
	iB5ggGJaJxhSAlsNrt3CNL88Z3gbiRyFA3FFb1XUKdW2sL0lXIEkpiUm3sFe47Ld
	I/VoJgvhbTspEptjFpqdbRoZtqaifNAISGAnPibEIVU55moA5+Q7Yf4nCDiPd/qG
	Fz9uC6vihrrHAYG/4vj6ndKO/xHkRBcChnMR/Ap37KkiNSiguewDOWx4Zba6z73J
	PtRWCZUQnfArmjgldOexsn0SJZRe2PgaiaVS/tR/sdqXaYjUCVXaQoB0/Z0jIVHF
	QYQCUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxweskuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 14:07:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso14035631cf.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457236; x=1787062036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=;
        b=g3U5bquEWoJ5rXW7/5pjCpXPubIUuKAjmLXbil37wr6gPLxA5qV7zPBDxEVjzMmOmX
         4Wjrd+6SxJur8N/jjaJ/wFhoqaS0OhlkWQreDhlgs/8RI0j+JnKMaN6yNpOOcn8jUlW1
         vb3i7reWXLS+Fa8DyHNDHmxM+zogyhwjQf20PutquHXuQwPZujhHmj/dsqONhcRyZog4
         xBNLgcMMQZ+zp1LOfyNtBOxn8/AYrIsS0ujNk2R9M9gp6UiJZZRQRnB0CEfBCePHu9AA
         +VwTrjihH/xXwKVdRmk78fbK00M2D53WT1pF6P1hN+2d4wV1v7mwF1r5wnmebcDxsKok
         P/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457236; x=1787062036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=;
        b=SD4uq1Z3mtEikEIksKTw2ZuYdcY0Upv/QK8Xa3kWmZsTgUiqA0Y0H60FgyYozdTo2h
         Weth12+75FBRLSk0EYyvjv5hABCz/TOywWX60awUJjicPSDtYxOaarryaijr9XQXLic1
         O6fAamqgHXn4ohaCWnXafm6C0G5GehB11pXinlVJAwa/XzU5QY3U2c8AalEvuUpueWJJ
         q9WFWzOerXI+SDMa6LtQ+D6tSb77p0WueQAzj2GuRnnxw2+QD2DDBCKtJ8gFmbyVP32u
         oVIOFwNTo6iRSq+eaRzRxDCkF41iBnZwbd6QPlW6wublQ7lgxhHkhbW+i3BDkqkBgst3
         15mg==
X-Forwarded-Encrypted: i=1; AHgh+RqLeUylvx0dHond5onZ2kWbJ9WSU3PxF3Y1nLTpEOljhgsgIho6jgqezZNJ8CW1Ul2mo4dSmopTLdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3r7aM8Lv1qZ71tp5384BpIu5oIJ+Llueti5+2r5I7k7eihHrG
	FZKu2BtAgiMfSKdakcZGyz97G+2h9DfAlYH/X8tLfY/mpnDdFvBIb4hfg2dHm0lMGiKDG3OhFP2
	k5Fv2TfJq3k2QlR/kdXld5m5+8YkxbCXbCEZy9fTk4LYjLyYyT8aLPWPvDTY8Zpg=
X-Gm-Gg: AR+sD10ZavtJKI27UVw5E7ytSUr3vquSJqQV3EMoUmB7zGTQd0qEey9FvogeVgBrDy9
	TXKmZeokX2uwHo2q13xHfY8ItWADeYHyAfQ/BI7iQJnMTAjU/GzEnaRiDOHQrzGjYkqwFLlEK1A
	UT6ED3yVMobJgNGjSKepfgzrtS5SeoMM/sSp3QdJoIaG+WlUGALrckqEzLkYXmdusgll2cIguvC
	hBH3fQE4XJUh97A9MmElpmMw43MWgRIqss0yT0H55VTa1C6VQpFiCQ/rpmiFCZxE7r7boYiqabB
	NrXjo1JsBG5xXKI4z2uOlBX+fHkDSHOUwK+cexdwAI7kaVGySFAJC0aMKBSzVavVSDiFyVOY5Sj
	XHBJn28aczGEJiI+A1Bt6aqgkwADWonBrVP+VFUS3uLWur1ttML2DDBd3Mk4x7VCslSVBle73xc
	PsDcBFJqsiqjqvxA==
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr4447031cf.6.1786457235736;
        Tue, 11 Aug 2026 07:07:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr4445721cf.6.1786457235149;
        Tue, 11 Aug 2026 07:07:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fbca3sm2995831fa.11.2026.08.11.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:07:13 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:07:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
Message-ID: <lpzyzjmnhofp6plxscqsuisoujfdviry6xy6poghyltqtm5ean@dum5bcc3ffqx>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
 <f7a76790-0e7f-4c4c-bb33-36134a0f3e29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7a76790-0e7f-4c4c-bb33-36134a0f3e29@oss.qualcomm.com>
X-Proofpoint-GUID: fks4jHdB_Cgjr6QUERB7lNo4bDF14UK2
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b2c94 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ixw1xMl1IcNJksMvGswA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fks4jHdB_Cgjr6QUERB7lNo4bDF14UK2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX++r5sbA9yA9e
 TqKBHXZCodQKBf8kbw4XrJH0g+t3z7CNPEgT049u7AQS2nD/nOd222nVnH8PnxOrogQw8VxtSIj
 1sQCRifIhPzlgeowNq35N80EwGfP8nI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX+Fe5d5gGApu2
 pXtY2wUfwDGUqaMVQzVCpwHLNWhLt8iPXeK4LRQk1/Q4pNu13QKIeqRMnkr1y4J9eqwNMkOWXIw
 tNQ85LKKjU+BaXk4ToMLPi4qH8rq7/2b03ERcmcbNZdiz0tDUOIwfmZW1ysLGYnp4Yr7+FR09Bu
 EbWuT6fxOZYtAssuO0vpdXhu7vGe71K8rvLaMvOkGuxl9SM8v3TZTQnoEyXHxM7apRRjS64bYK7
 C6ig2PONAvZEKTQupTiUEgXwvIRrWfUK50mc7twcsKzEapm/vq7cayN2dX+AdouGbz8rk18JIMD
 EeexcIkLT/CNU2TH+U6luoIs8yV3mnsuM4L3khAX4jiB5Ro8QJnOxINwG/aRDyfYyyvZVftb+0T
 TYqMojwy/XrGfE8Mxr5qOCOnU0KaIMowE3oLe+V8hWYCmAxv3klkgQ0BCo6zrTlGCoe9XIB7DkF
 13I8fUyN2ZyrjjKCGWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110118

On Tue, Aug 11, 2026 at 09:17:08AM +0530, Hardeep Sharma wrote:
> 
> On 8/11/2026 6:30 AM, Dmitry Baryshkov wrote:
> > On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
> > > Add the interconnect provider driver for the Qualcomm Kuno SoC to
> > > enable bus bandwidth voting on the platform. This includes the
> > > aggre-noc and cnoc-main NoC instances with their associated BCM
> > > nodes.
> > > 
> > > Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> > > ---
> > >   drivers/interconnect/qcom/Kconfig  |  13 +
> > >   drivers/interconnect/qcom/Makefile |   2 +
> > >   drivers/interconnect/qcom/kuno.c   | 978 +++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 993 insertions(+)
> > Please add QoS settings.
> > 
> Thanks for review.
> 
> Kuno's NoC QoS is provisioned by RPMh/boot firmware, the same as its SDX75
> baseline.
> 
> The upstream sdx75 interconnect driver programs no AP-side QoS and only
> issues BCM bandwidth votes; Kuno follows that precedent.
> 
> Hence no qcom_icc_qosbox settings and no QoS clocks in the binding —
> matching qcom,sdx75-*.

The QoS-related clocks are a part of the hardware description. Even if
they are not neccessary now, please add them to prevent future schema /
DT changes. See how it was happening to other (mobile) chips.

-- 
With best wishes
Dmitry
