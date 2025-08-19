Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B2430E842
	for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600748; cv=none; b=K+Il3fD7S/MBye/CmwQxPbAPOcM9DY6gzEhEN6zE1zrecnJeQSL6HXmsYULMv9tEOL/Fc2hn7N7CJN+LBwcJI7COwi/x1ZNWNoZVvmxN9d2g4olEpPdKvpUBtjkZ7Vdo0foZ8C7NcQZH1t1r1V2EGwzE9fqQQL9TMAhKrzlEF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600748; c=relaxed/simple;
	bh=JHp6Cjl/6HkRQPs/3MG0GDjGm2xUk8pgEnaUJplYzSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FN3dakHY3h9JMvBDuwYqOt5EWMtYeucChyuJIn8Mm5GOoe/rBNoK6SKY/hjtYDhdch+qdkFc6GySaKiWuCwlJ2sPWHJ17FEmpR6R5KuRqlmReiDDAUnuGFlgyHY45jLmfOXTicZoxgMFOsahjREuig5YHqJsL3W0c08y413pGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfBeKcWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfBeKcWh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90XEI028213
	for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 10:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=meTAWZ002tWP1iMId64JmPQL
	fiMSJlabjueQPGjB4T4=; b=TfBeKcWhD2yRfIk38oz9ShgSEu1KkrMFo1TbZK8+
	zgcGSxVDJTFS5BKffpapOoDeFHTUrQn3QeIuyPm4xd7LH3pxWwnE4c0DwmOcp3eO
	vJV+FOL0/cgD1JOQ2PI4EkgCnx7B8aoOhn88Zo7h5TKF6aBgNCxsJNz2E0bEYODL
	NjkwBpphEmNcmPx1idl4Mmhr81AlIjUsOXngpf0/Xm0fXX2s3kulQXrNqXIoWj3h
	uIZQAJulvydpDFQP0AmfH0ufIvxZAFqsFDa0xIgEksTxsckAi0D4wgzWhaGkCHTG
	78MITdhl/YcS5obifMi5za4UcYdXcC8Y0Ec4ToxUxDyO4g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtge7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 10:52:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88daeb18so113978776d6.0
        for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 03:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600745; x=1756205545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meTAWZ002tWP1iMId64JmPQLfiMSJlabjueQPGjB4T4=;
        b=OeQjFmv6jcIdP547YGz85BRTKEYToDOIGa9WdcUNf0nQdWc+tuh6MfwNy1gM5p1q4G
         1Hopatl+i1dq9qji3inU4j6DqI2PpBnRGWli0A+adDVFrX7dKe4YOU3efm94C7/X/GuA
         fewSqiW/1CdEUQev5pa2ECMyBBtjR+YlZc08aw+goaQ1/NOV8JbSfwxCSaDAC/fiORov
         CNBMBwOiQg5PKY+surT+c+PvsvLqZ3ZT35O2/frX/HVKgcreRRAm1C55LlWyAygVFwiM
         0ExR2CjM8kq2tu4J5V+5tgdFjuCO/YkbhnEJDGYnq5+8WAdTpF2J+jmGRu3BhDbTXioU
         tCqg==
X-Forwarded-Encrypted: i=1; AJvYcCWjjRB7ifCPZcTl9bpJBzWFBsKKijAJo+Yk9qZL4YKweEYkURHeI9dInUXBHmi9czG5KkZbHl5PhYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEjrgVeIbChNYLOcK2cSKdV+OJRWnNdYgixEFCVjNXPyT6mL75
	cFOEZqtA0s1Xri3y/rzboWzbepQ9nf/nzW/0m9dFD6+yllFd6/C0m9BDKZVDa6Rl4aZ7Pr9usXJ
	PQ+h9nK+AFhwEjwSy4XBKPdOWPi/OW6Fvo60afJKpGPEE7ucjSjZBNc2TNColSNQ=
X-Gm-Gg: ASbGnctJd+7M5H5nVQ3L1d7fpiNHnrqDwLVxh6MkymNu5C/lZXY6bWWBskUf1vXkLvm
	zJ00WsFtPCzF1b7KaB/f30G7Sx9Vxvw5YViKILDQWsBpUTOJiBw+r4DSUzD8fFrn72NA/xRQWXE
	WC42jo8m+fcnkjgZ/Kv5Ifatc2RFPL8LJu9FXqruSvUQODmlpAGjOhGOBeFMl76w2D3QN63GFWQ
	DlNCYwQQRrmibpz9Cag5g8/oF+9ZN1J3tOHLT9rqldcEbdMMVRFw1rD2BlaT79OK9F+CMkkndXv
	YAo46LGakJhxkj56cSoo8mISQiLXLgPvDeGOukVHHIA8oq5lxO8BTOikPFJnGoysLvsFSHA39aK
	ypKgET0HFyu4eg++jZlhcM9ieP5CNzaUIzatvR034A8QVSTpNdeeL
X-Received: by 2002:a05:6214:2526:b0:707:a430:e01b with SMTP id 6a1803df08f44-70c2b6db728mr18561366d6.3.1755600744698;
        Tue, 19 Aug 2025 03:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWTcLFhjUM0I8L2qtkE5KEq6YT6QkQ/QixKqZj3wqbRnQCQfoRKDE05BN8SvkpHUbQsGPT0w==
X-Received: by 2002:a05:6214:2526:b0:707:a430:e01b with SMTP id 6a1803df08f44-70c2b6db728mr18561056d6.3.1755600744021;
        Tue, 19 Aug 2025 03:52:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35fb15sm2032674e87.52.2025.08.19.03.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:52:23 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Message-ID: <veuco4na2bnisn7qoi7fhdf553alr6omdzdrtnz5p2x4ywtmzh@2smifabnvnbd>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
 <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
 <aJ3Y1XhvTPB7J6az@linaro.org>
 <ddp77rvwe6brwyvkzbkouguigd5tjg2qqfxomlhd2hb2x7w7uf@2uyl2q47bpei>
 <aKL1NPuZWWxsAavx@linaro.org>
 <2hzzc3fd52kb54s2pr6fxfnd4svi7x3zt7dyvenja3suhieidb@hrlggbqocqa7>
 <aKRUvCVpz8y47TPs@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKRUvCVpz8y47TPs@linaro.org>
X-Proofpoint-ORIG-GUID: Y0EY3Sg_XTmqqDhROhKiAeCMS4ezrcBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX9QtHL/AbGgo3
 RCww026aWVuKvO4drZ9PzM3RgmhcE0IoZqsOaHqOxXbBaViEzzJ0RUVLCQWSjnUiNCn5d3LvzP3
 1N66udTqAnzjjlSTmOOuXjrOouOafQwLD+1fW1eCL55YMzMgOKo64Pc7yhiRw18oDrY5ojt1WEX
 2d0W+mjYD+2WDRS5cQ7NozmIooXD81DLHgzBETCSR2jx12/2/6sIRqLHtWCOHw2y7p1hpHbBUWt
 q5GYIUem6OrGaQR1I9aJjjJQH1CzyFS1dNoBiplZa1Sv5x26CKZDkupxXfNMcem/hEAi5mHlqXJ
 muKsrdS43NklwWoeX0KmuW/Ytl4bm6/PqxfZiO9EZa4nRFhSBzIOIqtTYiWAF9sUeCVPI61/B76
 54e1WMNq
X-Proofpoint-GUID: Y0EY3Sg_XTmqqDhROhKiAeCMS4ezrcBs
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a4576a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=aFVlKXMpKZbDbpKwxIQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

On Tue, Aug 19, 2025 at 12:41:00PM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 04:19:26AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Aug 18, 2025 at 11:41:16AM +0200, Stephan Gerhold wrote:
> > > On Sat, Aug 16, 2025 at 04:55:00PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 14, 2025 at 02:38:45PM +0200, Stephan Gerhold wrote:
> > > > > On Thu, Aug 14, 2025 at 02:55:44PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> > > > > With my changes in this series the clock state is always consistent with
> > > > > the state returned by the clk APIs. We just delay the call to
> > > > > clk_set_parent() until we know that it can succeed.
> > > > 
> > > > I know. But what happens when we power down the PHY? The clock is
> > > > assumed to have the PHY clock as a parent, but it's supposedly not
> > > > clocking.
> > > > 
> > > 
> > > I don't think this is a big problem in practice, given that these clocks
> > > are only consumed by a single driver that manages both PHY and clocks
> > > anyway. The clock should always get disabled before the PHY is powered
> > > down.
> > > 
> > > > Another option would be to introduce a safe config for the PHYs and make
> > > > sure that the PHY is brought up every time we need it to be up (e.g. via
> > > > pm_runtime).
> > > 
> > > I considered that as well, but what exactly would I use as "safe"
> > > configuration? There are lots of PHY configuration registers that are
> > > set based on the rate or other parameters of the panel/display
> > > connected.
> > > 
> > > Implementing something like clk_rcg2_shared_ops could presumably work,
> > > with the limitation that it will only work if the clock is really off
> > > during boot and not already running from XO. Otherwise, I think the
> > > simple approach of delaying the clk_set_parent() implemented in this
> > > series is still the most straightforward way to solve this issue.
> > 
> > I know that it works, but it feels a bit clumsy to me.
> > 
> 
> I realize that adding a field to the platform_driver struct feels a bit
> weird, but I think in general requiring more control about when exactly
> assigned-clock-parents/rates are applied is a valid use case. The reason
> we haven't seen more of these issues is likely mainly because people
> just avoid using assigned-clock-parents/rates in these use cases, even
> if it would be the right way to describe the hardware.
> 
> I'm happy to try implementing the workaround in the Qualcomm clock
> drivers, but hearing more opinions about the more general approach of
> this patch series would also be good.

I completely agree here.

-- 
With best wishes
Dmitry
