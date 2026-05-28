Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF74221F1F
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980506; cv=none; b=ulMwtb7zEoSS9iSCyx5zwsUfZJ4nOrv1O+5ucWLsh7Qm0HcLedKSW0mChp7GCkhX1GqZnyhElBOGN8rzHbyfnAElKFrV1zG+SZT9c/xJEM2lkRMal8t21yxuRwje+D+DmJRiHEPqImRZYXFCh9VGc+VJ3CrvngFAYB/vrvRU06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980506; c=relaxed/simple;
	bh=4GnQVk4uJA7GqOVb6u3PPbujRwmpQUG2pQItHH9GCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NO4tz/57ygEiVn94wFGAugAFWLXJ5UI7adtxAXWSSzv3yMOzmOkE+4r680URe6YMUCtxPTcN7nU6nf22C+pe7n6YenUUXAiTY5lqyXkchOsGaWbK7BxfpE4FqCOQN4Jw5xAiFKWgTrKGVOm97U90OZvxy76zIPzUNP8YR9InZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9zBzMtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpCneZn+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9zBzMtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpCneZn+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vPtS3545377
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 15:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HaNfui2FG1mDwh5+yjz39dTw
	V8xEs4HnIe4IRTWrOCk=; b=j9zBzMtpg2a0zAo1dbjkUAhgcaqPvS3C88TpbmzA
	uVUAYH0iMmGQ2YPZKcK6NJkkZIjOVbedeR6gEZZSwwjlHkq1ghl1aSNlvdRsItcv
	Z2a6ZupDf3940txV56UAhdQDw6duoQNb/cZ0Kke4SaJuG8SVogdSIL+ZAO54JyWi
	7mnGRPt9tize3mouTI+CaCN68ukd/YooOaG8fO+f8chao1xA2WLD/a9ZeB0bHJET
	QmzxRMXmVDVIP3Wp3xJppAfQaM0slC+POgxtkeFkHJGBnt9V42Us9U61IUqLaEMO
	+tZm3Yj5PXxNQpbqphnX1dOsJ6C7eSd3NIVCCGO9Lpd7PA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3u7wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 15:01:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63cbb164b37so22560726137.0
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779980495; x=1780585295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HaNfui2FG1mDwh5+yjz39dTwV8xEs4HnIe4IRTWrOCk=;
        b=EpCneZn+Qeia6C8temy4Yh9j1Xmuaxzi/2itOlFfmUtPfsO6F2vVLU0o4XnvBlifEC
         T9nQwPBSVYhZvpm/uIPeRdi3Lu/iUrdiWQ4o5Hy5bd7iTfAfG58ow6w407R5CTPWHXcE
         ou54kXe5zAEiE19sGk1DTWYib3ZkWDenYOalqyP/ntNNhWKiLVgM7M1Pq8Yj+lbmL+Uu
         TsUdCxRSYUm+qgUbAmvzPZJpk1c2LyeunBmCyPwERtBwDiCEgaSS1GkD2Ax3XDK/aHhC
         ppVcJAcz7IJXC9/z7aU6Ec0rSIPjbTTAvBet1gypnao7YDADYco9WtZRgeXxh0A0dXhE
         b/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980495; x=1780585295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaNfui2FG1mDwh5+yjz39dTwV8xEs4HnIe4IRTWrOCk=;
        b=jXbN/UfuXB6YGidk6oqcTHa036UkK+8gadrHN+57Bm4qmsl2tnCzQLsb7gTmToi4sM
         apdmefAlpLl7hk3QwudAyBu3PsB+cthuJ/wpHVN58vqCj803UJfRyHPAX4SLNEmQbgR7
         L1y6L8thB620Cy7K41b7pMjzWkhh3njciK6LfBtnvUA42yFE2qvxZ5Hj0m/2hjP9ciBg
         YuGNfB7uh1JeQu6Z+QFr+MVyRq8txxAJq8TA2ZRGmEVaNWfsKNUsuX1cFoWNqQf1z+so
         HqDeFm+0/NswkRZlox9f2EcWB+bLaJLGMD097JyLNwHRPIh90JgmON3vnZshyAE9lVas
         hQlw==
X-Forwarded-Encrypted: i=1; AFNElJ8pL30VUE2ve6K789LyMH+FcwmpVmj9aLYeh0wBPyRilpXnZJ0dd/hYHnkAmIsY03/cHD8JVk/AXP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysKyjbhrJE81an6vU8bG+pijhsYI73Wv6FnJt83W83haJ74bV0
	JAo3M5kSQienj/SEHQgD6st5xHD+IozYb2H7IRiQMj11kaqPka5jd1tZNwEVze1K+p2Satr8TdS
	kepdRoQeeUSDQoti6V2QFO1EGGuV3h349yktxjhzFsvOyyRDEVBmqA1Au/0OWUqw=
X-Gm-Gg: Acq92OFP+CBQ6OVxIcuCIgsAA6F8NNqwU23zSg3cR+Lx1sXgBKBEgQKzs/+1HdKMpai
	ZXk7YwzQ6KQYF45yBN6VlktJ1jkQ84kqnbmk7XEO4KR2yObn8uIJCxkDP3Xxt+INweglLKBcZov
	pm22fhL78SgmuTmnXLO9YfxGk851tlZbFxUy8PRPSdgoR70zmVfqvWU/jCD3kfNrKLVON+t/65z
	Y1PQjZAYXOCL+q6mUwS5/4JzvzKmgdYgv+hVdMmf50ARLZ2VgsJU0dD/ck02veGrDrqF6juomdm
	KSkIIO8YUnRnBxPtCqQxUYhJ6EWEcgivBRGzhbdUkK2Dv7N/Y+kJGXtHITZSqXv/Fc/Vr25dmeg
	+okVZevJy5QJz2lol079kCXpeo7OWCd5w3w/mCtookZ4uznwhHgV1rKw+6lyVADwDjtYlucbG4u
	+bUe4YbxHvWUjPmHMmJsLeSavxRWhBzLUAg+QbIwfvgQW7xQ==
X-Received: by 2002:a05:6102:6489:20b0:631:6e70:b905 with SMTP id ada2fe7eead31-6b8b027285dmr551982137.12.1779980495045;
        Thu, 28 May 2026 08:01:35 -0700 (PDT)
X-Received: by 2002:a05:6102:6489:20b0:631:6e70:b905 with SMTP id ada2fe7eead31-6b8b027285dmr551891137.12.1779980494380;
        Thu, 28 May 2026 08:01:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2f502sm39258551fa.35.2026.05.28.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:01:33 -0700 (PDT)
Date: Thu, 28 May 2026 18:01:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ci6qjemmmcrtva2o33mkcv5hu2o3woj7eg5563sursf455mygc@fuigqdocarsz>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
 <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
 <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cqSq-a-XeqOczIxe1sD2ai82MlZk2OqE
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a1858d0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=2Qrb-dWxc7tvpDbJBDUA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: cqSq-a-XeqOczIxe1sD2ai82MlZk2OqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1MiBTYWx0ZWRfX2tAOFdJ2rBVg
 nuKIrcYRRh8ixuuZTuDaCszJ5+s0rIRQOCtWL2OWa6qr7XFi7xkfdfQZJLinBCKrWVOWq7ndJwo
 HYYlivB6LFT8W1wrwirur2HxWdXwprjMjB0IW/IbbHOEwoHob2sl0oTBKZqoJODQH4Kt6gY2x8w
 lTVs7k8T4JplCC4p+r0aBtf/+lubH389z31o8AqbNHzsWJyOmYjmv2qiYo6p6+lDi/Yf3JQ15RA
 Od5CBSx18md09j6CX9GLbmNL4uffrYdbKmg3zxO4XM4QX5JhKPNzAmdYgHQVBkw5M1cZQ5so/qd
 +DdsUtGqg2085KXCcQ8+7EQUpaMe7cRrjQGNRZJYkWmphUrvQ/sCIymMepWFri42+VRYYHTeAHt
 KV3VnOS9gANQ5HR48E2GCJ6nz+s8gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2605280152

On Thu, May 28, 2026 at 09:46:51PM +0800, Jie Gan wrote:
> 
> 
> On 5/28/2026 9:06 PM, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
> > > 
> > > 
> > > On 5/28/2026 10:29 AM, Qiang Yu wrote:
> > > > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > > > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > > > register controls whether refclk is gated through to the PHY side.
> > > > 
> > > > These clkref controls are different from typical GCC branch clocks:
> > > > - only a single enable bit is present, without branch-style config bits
> > > > - regulators must be voted before enable and unvoted after disable
> > > > 
> > > > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > > > of reusing struct clk_branch semantics.
> > > > 
> > > > Also provide a common registration/probe API so the same clkref model
> > > > can be reused regardless of where clkref_en registers are placed, e.g.
> > > > TCSR on glymur and TLMM on SM8750.
> > > > 
> 
> [...]
> 
> > > > +
> > > > +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> > > > +{
> > > > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > > > +	u32 val;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> > > > +	if (ret)
> > > > +		return ret;
> > > 
> > > regmap_read returns a negative error code on failure, but the
> > > clk_ops.is_enabled() treats the non-zero value as enabled.
> > > 
> > 
> > A regmap_read failure doesn't mean the clock is disabled.
> 
> Do we have special reason to treat the error number as "true"? Its worthy to
> add a comment to explain why.

to be 'false', the error number must be 0.


-- 
With best wishes
Dmitry
