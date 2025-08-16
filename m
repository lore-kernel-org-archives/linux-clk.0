Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0410054654
	for <linux-clk@vger.kernel.org>; Sat, 16 Aug 2025 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755352507; cv=none; b=A8+SS8qZWOV2DKnov1r+y9/YenHH5vrt+9LoNWPQjq1yiqCdDtVFZlQa4CMa1Tj2XecqJ8tCGvPIc0utc845M5b/viifhcKS9zeHDEEz5s21bcidLFS6rqZJ9exeD3An/+U5hLS1i915Kdbq//O3NwPUorcrHOTwteDt6wjJPKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755352507; c=relaxed/simple;
	bh=zXJNIryBwUqERcOr1QlRPNTD6RUU1fPwFpLasPETPGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcKoTBfi233f/eeFkgAh8sVcU0SvrbL/4XcTHIxL6gL2KJYsnyNgGUttTVaYMLPDkkMPRysU8u7S/Y4Adk8weoutC8eUtvTIXFTLoCVZc5HYq9i2YBX/h1YeGlyOROMK4JWJ75wqclP5peM/QYUE4zI2HJX1z+EkCIAHajDQ63E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8UPGD27; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8UPGD27"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3Aoq4020866
	for <linux-clk@vger.kernel.org>; Sat, 16 Aug 2025 13:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a9zYANIX49bgaw1SNhNNLdN0
	47lWkWIZ7zlz0nou/K0=; b=T8UPGD2796uIQ92pVnMHU8i8edIeMhZoq10gcEgu
	I7BBJ7CAR+Zpd1ur5qLaCc9Fu2rDUDtAB1DFWET8HeLQxp8lvnqKvyqyQTFgmv42
	uNjnqw4PYUyZvAnIAzfY5EexTMHzNskzNIcA76KChMqiPrU2hZW3VpRFR29X8ZwX
	b3qlJjWkNgrhHkoCbANwHkH6u/gUJZWpbr71M0H8tgVao2D6Zj6fnF3r0vlAhis9
	pAqdGg0iKaZVbj06rwWGNlj2262PL2JsXHZ08QXPEqlcd7T+PGQE2WNvnoe1R/iW
	6ISSOsEOwJDW2A3m26CFnFntEckofQBTVVsbVOE0KI2uUg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjy8rk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 16 Aug 2025 13:55:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a928dc378so62335486d6.2
        for <linux-clk@vger.kernel.org>; Sat, 16 Aug 2025 06:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755352504; x=1755957304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9zYANIX49bgaw1SNhNNLdN047lWkWIZ7zlz0nou/K0=;
        b=jYAuX8MthyAHLho78YV1/AvIhOpi/6cmnQSYTmyuHWImRHe1KKN9JQpoIKKqOVWngy
         JqgEAGmd7Dami2d7yRd2kdXRtYyUHdNGR9fnRMqH0UaZiiDhjP8pp/jja3W4ILQ+/PdC
         YNan1Qso4nP3+cbv3rkQh5eonpcYxJ7NtmtpLxJj4RQ41HOfNZGojNbh5RUouNWZQA3j
         Gn95Q4d4N0p/qrEnzeGGvUNtxRg9wt2CJiNqEI8ncsey5C/gk7sZBGVNTgyMvL9CJbmR
         1p6B5zT3/tN/Z9nCBUI/tbMEOzvxSEeERzkTXm/MTL334lPPlPuOyd/vcaxLhR8iVXcE
         ZT7g==
X-Forwarded-Encrypted: i=1; AJvYcCX79G06FOD7IbSETE3wACf4yIdN/Be9RlEb7ekw11VGb4Tcd7lyDHatKwLsmbRheHA4871te0HrKcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YysuppcqExtepclkiHe9kBbNX6R9OaiGy1lGaRl0qL8jk29A7Ba
	f1nSBlmcEJ5cVe1lInhEJxxXJcgQUA08fkfQgieCZ+Q5SAM8EHk7lhxetcEspbWQRsvdKmfnMXK
	fqgfFnafsdwjaQOf4wB46O9OC4doPIluXtwn20vRBzUuBGOulntTeMGAl4nZ9pAc=
X-Gm-Gg: ASbGncvR4aTZxXEXmfVQkmlSkt4C67wetkzorKxaaztUWG95uZbEZNiiZZyTzRb7ThD
	2F36vhk0ubXXRpVmBgEbxBU1fKUg2p5dlPXgwbvikLzaEDvYkkGay7lWnXifZpBEH2W2T5Wqdl5
	UtiGI6g85NFzfok5JfR5MWIM4b+PjBPRoeH55QMMYLO8V0nCV0w2N/GQhZ8p6C279KS3zmyAibV
	yApfwG/s1vNPOogcksdFXIrB/sGZ7ghlpryQTb9Y6pOBztEz9FsOyzW67ZXuftmUSMQrgExxtbs
	P0UuEMQEXzQ/A5X9GeCG3/kMH9dWTJNzEY1fEQIZOewq+LpSg4udDIvHojO5wLZ7v0Ns7+G4c3J
	H4/12LAquo5qQjBAZtGw1CqdfF6cbumCz/8Fz/z1py651osd77Oim
X-Received: by 2002:ad4:5cc2:0:b0:707:56e1:4806 with SMTP id 6a1803df08f44-70ba7c0c266mr64819106d6.26.1755352503826;
        Sat, 16 Aug 2025 06:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjK12eVhr12VMUi48bvOGnpy+oqFtp/dDx+KcfOB4Ct+XDsdWZMBpgCzIT9Wh4SppdahooWg==
X-Received: by 2002:ad4:5cc2:0:b0:707:56e1:4806 with SMTP id 6a1803df08f44-70ba7c0c266mr64818736d6.26.1755352503240;
        Sat, 16 Aug 2025 06:55:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35153asm866295e87.16.2025.08.16.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 06:55:02 -0700 (PDT)
Date: Sat, 16 Aug 2025 16:55:00 +0300
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
Message-ID: <ddp77rvwe6brwyvkzbkouguigd5tjg2qqfxomlhd2hb2x7w7uf@2uyl2q47bpei>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
 <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
 <aJ3Y1XhvTPB7J6az@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ3Y1XhvTPB7J6az@linaro.org>
X-Proofpoint-ORIG-GUID: 5y42ERAikSF3RzkaeCVeeoo0nn-5Mgok
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a08db8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=vveynParcMvujpoCFGYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 5y42ERAikSF3RzkaeCVeeoo0nn-5Mgok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfXyN16L6oTVnQC
 4yowHVdCcq9b9zNlpynLuZJTTouVBkvShY3hertn9/Lk6xqz4hLyegAYtn150x3O6DMP8swSE9h
 sKD9ehikUKq/0IUQ7LFf4VoDPF8b96/hmlKEA5/4NL4jOoCarW4RhBajbMPrJKmvztuVuxF4OY+
 YNq02qTA6BEAvINno/5sGsDbphD1MyNuwOT6TqXbxXk1m0mwb1UbesaqyzsmDU45hjkVpDZzsRo
 ylXJ7CJNoTvgfon1Wwg6UdDAFFnDKsjBCVrM890UZX5+JtFuJzo1IMHr4potws841FIsAaYKg+W
 AQSVtmgHO/QlAzqkhkgo68MbcTBhT3ZblBM6vYFdPPyhUww2gkkKM1rcucbPpJAoLq+4nmHUb3I
 MHQk949N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

On Thu, Aug 14, 2025 at 02:38:45PM +0200, Stephan Gerhold wrote:
> On Thu, Aug 14, 2025 at 02:55:44PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> > > Currently, the platform driver core always calls of_clk_set_defaults()
> > > before calling the driver probe() function. This will apply any
> > > "assigned-clock-parents" and "assigned-clock-rates" specified in the device
> > > tree. However, in some situations, these defaults cannot be safely applied
> > > before the driver has performed some early initialization. Otherwise, the
> > > clock operations might fail or the device could malfunction.
> > > 
> > > This is the case for the DP/DSI controller on some Qualcomm platforms. We
> > > use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
> > > but this fails if the PHY is not already powered on. We often bypass this
> > > problem because the boot firmware already sets up the correct clock parent,
> > > but this is not always the case.
> > 
> > So, the issue is that our abstraction is loose and we register a clock
> > before it becomes usable. Would it be better to delay registering a
> > clock until it's actually useable? (and then maybe to unregister on the
> > link shutdown)
> > 
> > > 
> > > Michael had a somewhat related problem in the PVR driver recently [1],
> > > where of_clk_set_defaults() needs to be called a second time from the PVR
> > > driver (after the GPU has been powered on) to make the assigned-clock-rates
> > > work correctly.
> > > 
> > > I propose adding a simple flag to the platform_driver struct that skips the
> > > call to of_clk_set_defaults(). The platform driver can then call it later
> > > after the necessary initialization was performed (in my case: after the PHY
> > > was fully enabled for the first time).
> > > 
> > > There are also alternative solutions that I considered, but so far
> > > I discarded them in favor of this simple one:
> > > 
> > >  - Avoid use of assigned-clock-parents: We could move the clocks from
> > >    "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
> > >    from the driver. This is what we did for DSI on SM8750 (see commit
> > >    80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).
> > > 
> > >    This is the most realistic alternative, but it has a few disadvantages:
> > > 
> > >     - We need additional boilerplate in the driver to assign all the clock
> > >       parents, that would be normally hidden by of_clk_set_defaults().
> > > 
> > >     - We need to change the existing DT bindings for a number of platforms
> > >       just to workaround this limitation in the Linux driver stack. The DT
> > >       does not specify when to apply the assigned-clock-parents, so there
> > >       is nothing wrong with the current hardware description.
> > > 
> > >  - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
> > >    enable the new parent before we try to reparent to it. It does not work
> > >    in this situation, because the clock subsystem does not have enough
> > >    information to power on the PHY. Only the DP/DSI driver has.
> > > 
> > Another possible option would be to introduce the 'not useable' state /
> > flag to the CCF, pointing out that the clock is registered, but should
> > not be considered for parenting operations.
> > 
> > >  - Cache the new parent in the clock driver: We could try to workaround
> > >    this problem in the clock driver, by delaying application of the new
> > >    clock parent until the parent actually gets enabled. From the
> > >    perspective of the clock subsystem, the clock would be already
> > >    reparented. This would create an inconsistent state: What if the clock
> > >    is already running off some other parent and we get a clk_set_rate()
> > >    before the parent clock gets enabled? It would operate on the new
> > >    parent, but the actual rate is still being derived from the old parent.
> > > 
> > 
> > But... Generally it feels that we should be able to bring up the clocks
> > in some 'safe' configuration, so that the set_parent / set_rate calls
> > can succeed. E.g. DISP_CC_MDSS_DPTX0_LINK_CLK_SRC can be clocked from XO
> > until we actually need to switch it to a proper rate. I see that
> > e.g. dispcc-sm8550.c sets 'CLK_SET_RATE_PARENT' on some of DP clock
> > sources for no reason (PHY clock rates can not be set through CCF, they
> > are controlled through PHY ops).
> > 
> 
> I don't think there is any problem with the 'safe' configuration you
> mention. I have not tried, but we should be able to use that. However,
> my understanding is that reparenting does not fail because the clock
> itself is in an "unusable" state, but because the new parent is in an
> "unusable" state. We can run the clock from XO, but that wouldn't solve
> the problem of reparenting to the PHY (until the PHY is fully
> configured).


How would the CCF react if we return -ENA from the enable() method of
the PHY clock if it's not available yet?

> 
> (It would help a lot if you can find someone from the hardware team at
>  Qualcomm to confirm that. Everything I write is just based on
>  experiments I have done.)
> 
> So, assume that DISP_CC_MDSS_DPTX0_LINK_CLK_SRC is already running from
> XO, but the PHY is powered off. Now of_clk_set_defaults() gets called
> and we get the call to clk_set_parent() while the PHY is off. How do we
> deal with that? Returning 0 without actually changing the parent would
> result in inconsistent state, as I described above. clk_get_parent()
> would return the new parent, but actually it's still running from XO.

For RCG2 we already have a lot of tricks like that.

> 
> With my changes in this series the clock state is always consistent with
> the state returned by the clk APIs. We just delay the call to
> clk_set_parent() until we know that it can succeed.

I know. But what happens when we power down the PHY? The clock is
assumed to have the PHY clock as a parent, but it's supposedly not
clocking.

Another option would be to introduce a safe config for the PHYs and make
sure that the PHY is brought up every time we need it to be up (e.g. via
pm_runtime).

-- 
With best wishes
Dmitry
