Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A133D6EA
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043919; cv=none; b=CyputDLHm+HXyfTEkioXDi6TVsYpSB7GulGMmFko4AiLQsBt1dJ28YGAb9x0lbATHX0/hPyRxoc1CdXXxpsI5SApTnSPbMW2f4wo5Er8ek6ZkO+/Oik354GI7EC7SRVAQrOPLyYXLsHAVkjhs/jfRSE5PWiLcGfNOjTYk1XoC5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043919; c=relaxed/simple;
	bh=Y5i9WcyiDzQjtJSx79lz5XChtinSTRrDP5DUYMTy97Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMLrHkk6z3M2ra25J1MTA2Kcy3YHxwdoDoOH2Zu/6hARxp65Rm3ahuV3WPGNAZqoAgWUUO2e/9FZN923MY9zul2SrXZibQWsG2jIjxyE29N05aUI5rbXnGCuqM6n9FKEdKcf4mWj2wDqPcCiucqAQXfCeb6C9sFIfQX1liYEDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqLG13MY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNKU4PAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqLG13MY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNKU4PAA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HANRuv1888240
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 18:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w8qDcE/JkXAvARu8IjsWPZkQ
	lthwgFQJ1bcCPlrXmHw=; b=YqLG13MYcGs2osLqpsGGB9+Ep4Lp7BVQA8pnn30n
	jkCl2uge06yWxC1xdsrYDWBfPghOMZkIYeohGJmDgi/e9hRhVqjqg8u2y/RhdDqx
	o1W3AgwnG9b2J9FjUEf+s2VAk5LM6c/1zKTytynM/QdjRxfC9aeE8SAYayA0r7wF
	O5m+gOAec4uFNK5IGzqavxEDh/6ASx5DIhCnmEh0p0MUS1F1g4q+4tXbj+Ie86p+
	3mm8v1l4npSsrls0yLneJYRfY/BDCgOJlf0S39CbRc6oOPIjQk61RhM4zYS+Zmr0
	1RrQtnpX57ZmRTS+SsAytHuKx1YGusMguwe1jERRJB8qZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwmbdvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 18:51:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so51679631cf.2
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779043916; x=1779648716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w8qDcE/JkXAvARu8IjsWPZkQlthwgFQJ1bcCPlrXmHw=;
        b=BNKU4PAAl/d/4hFcuu1gCJ882A6UYQAOoA6+BIhE9U5Qvb1tdyQjSzKk81MbVz+cFS
         JkeEqwVWdvWFi66iO1tDY2XQgB+q900XS5E+hdth+Qfz7Lsq8kB+609x3V/v79KOJsfm
         e/yULAAwQSa3oSpva5IeUR9TfRaIvcgyrl9h1ZyinJfHyYkBopg/aJ8+4WWqfSXMQqw2
         SBe7/px5067JENK4ZJNt38cYq83cs+y6FrqPxuuoVdAraD8hnA9z3HijUlok2kW3Q8wH
         xQHVAW4lwhKExwdRWr6vIY3np3/5KT6U+tsykprzGBljHvaRYm1zToREOzEk9brF2t8W
         0Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043916; x=1779648716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8qDcE/JkXAvARu8IjsWPZkQlthwgFQJ1bcCPlrXmHw=;
        b=riGetTFQ8sDbCt7YSy7t7hk8N9TSXEbgcTE+ZCGd4y+MJStwXNXNazycTy6zHc1BCh
         IJ8jB9WQ9tTyLrJpekqcNMCsa/G9HeLiThUR74hncXEnb82o9+oDhAQJpHZWRMXzhx89
         13FUYpgBinJKWoQIoUPRYCFqr4Z1jfrXLL4yfdhDjvp3mP2PmKRQbfaDrOUCUADpfwJW
         qOwzM1h5yQ68ebfQ/7+bYu8XZbYSmYJ/VKyCu6Vk2f9eBaVUKmqYfJGcV8LZW2bTlICq
         ivAimJ3g2Y8BcGdaiRl6//JZQuKQGOTvPrOadtqjxEgUxt4iAYShtFvzTom7ptXT8iJo
         KffA==
X-Forwarded-Encrypted: i=1; AFNElJ/WSgY1/KJwLJxQ26FMudEA+YoldmzN3Umz1vdCIZRXWpHyj+bGoqQRljVdeOOOHzBbsXTqISwmZsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmLi1WG7QPbh9TQ/1XCWsUZ/MjccaJNqXICIkd9xhAb0aQYdBX
	O0kmlscsMnL+ObLub8h0L9vMwDi3U3ku28mDCx4MRIYOHNdNJrJAQbdbkcDep+LZ/jCemqrJNrD
	QO7QP4VyC3AK3xbjvmtyu69iv6xGSlr+neClgSzO7w2m1K0OfXPaD/9JaBGmGdf0=
X-Gm-Gg: Acq92OFGr72HjGnxO7WQUWKTOSZdZOOpCcfWmqbd65llj5cABlpTBsN80hrVK5VZNW2
	ErFgJisyIuHsE1uaDmwg5XWTXkWAYndsUablg0gz6G74h0NqrsLqhCwXkjGtxViS3sedZyKjVVP
	75LFeI3b7sx9t2bucfFlVQnSGFMNW0YXmra51ZThPHuCYGgjqzv6UsA6r/s/rxx/xuOsTJsM5tr
	GNwkUFUJHG/iO5woqgNvVLKTEZaYWZ36ECk5EgueTCDE3G/nBbtWoHPxA5uZRyFcKCYZLg9AH6y
	jutgWrp01BPTfNqO4GeDwq9uxatxDsGph+cvtSu1GnHjpwaF1iY5JC0wdLYXWoUjHm7mRqlXjp9
	3xbamOFtq5gP9kfFbICaNtz6avQOsxBLsVPllTkw02jxEPaza3XGgcZV9o5ZMn+kzwpX7mJXsaO
	iwn6xFmMygeUZel+ja+Yc23mQBbH1S47CfmJE=
X-Received: by 2002:a05:622a:4a0f:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5165a03ad56mr162139291cf.15.1779043916042;
        Sun, 17 May 2026 11:51:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4a0f:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5165a03ad56mr162138991cf.15.1779043915619;
        Sun, 17 May 2026 11:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c74d6sm6943301fa.15.2026.05.17.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:51:54 -0700 (PDT)
Date: Sun, 17 May 2026 21:51:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
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
Message-ID: <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
 <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
X-Proofpoint-ORIG-GUID: LCGZO8HIarOmS2aozZh4oo0K_Eegsj2P
X-Proofpoint-GUID: LCGZO8HIarOmS2aozZh4oo0K_Eegsj2P
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a0a0e4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=92o4APbqSy6JO7topJkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwMyBTYWx0ZWRfX7yOG2/jMjEwd
 y27GeHGs6baN3otjC0VR1T694Sh08Crq5HvWGsE+OkyrhpSJIPLxP0cexRQCCBqFkK1zofRKA7x
 Nv5EURn2Vey6+NK/VuNOr3Bi2/eRFTDqACJmh6iJ3HiODmqdXNER+Heo15AIQJRLGQ26AXO5PCl
 kHhwn0/acF8Rn7OaAzIBlA7nRntBpXm8otso6jcz9vbVHLJNs6c5UMhORkathPXAexRscqCgAzO
 4knXf2Z13lfLEvJs7f4RQY5THMSdAWyVJHm2cl+WYLLXowhDhit38/Fit2taxxtlAcR+WxPhAp7
 haX2jvZEQsB8jw/8DTHp1dA8nTnRIZr+SzMWdWhgWlULROcuJcIIvf1a/XaJoHIMh3G5J4w6nIc
 IFbyuySpw8chrKKor9bztPm9/bZXR7fc6kOqmHV+X1/ejhfIE40qtbGD5OYFbyFFsx9C4Zcgw+f
 zrgiJzz6jes+nJ5Iatw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170203

On Fri, May 15, 2026 at 09:11:19PM +0530, Varadarajan Narayanan wrote:
> On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > > Use the icc-clk framework to enable few clocks to be able to
> > > create paths and use the peripherals connected on those NoCs.
> > >
> > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> > >  	.driver = {
> > >  		.name   = "qcom,gcc-ipq5210",
> > >  		.of_match_table = gcc_ipq5210_match_table,
> > > +		.sync_state = icc_sync_state,
> >
> > in Kconfig:
> >
> > select INTERCONNECT
> >
> > OR
> >
> > depends on INTERCONNECT
> 
> In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
> COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
> INTERCONNECT and INTERCONNECT_CLK.
> 
> Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
> Please let me know.

I've sent [1], let's see if it gets accepted or not.

[1] https://patch.msgid.link/20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com

> 
> Thanks
> Varada

-- 
With best wishes
Dmitry
