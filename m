Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490A415F3D
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 23:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676664; cv=none; b=u++Ud+xlHspphXFDkibpeHC6zebiFVYJSDji7dDvdzP54KBfkl9zDEKyRYzBX3DjNFkCbLp877Fl9h4esdzHcCF3ihCBbrulYQhrR5zErIJKPsJws/w48Z7MNhj8c1AdYDfrepiXzk4y1S6c7EGObZcsojuuKcwkKjbCLd1u7ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676664; c=relaxed/simple;
	bh=B9H2lMYnSFdOZSBAxuKp1S7NqtvN6jE081MhP4yLjVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mp/y+EaJC4GRmSmjGe2fJmBuf9gpLCH9ewd5O4g6IBtO74s0FB6Ep0X0t2b8E7XCNU7PzOFfSuO+ssss/y+Ln5J/N/ktSwzvhmOffxa4QuoDDAUqT46iQspz6HHN/dCyGMMKNMqcDebcKasWDCcXYPl2yu4QdOnrXl3NFIpyLpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dY/Q5I5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuJTzZgy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY/Q5I5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuJTzZgy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZQXr3027059
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 23:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DWJBxzgFBd9Yr1usno2p1uJY
	kPMUKY4gzoTzlbUJzlw=; b=dY/Q5I5kjQq4Fg1t4umMJ7EqMBRD8cCp5BODerZK
	SKzrNFldDdjWCDI4xNOlj8muwX3B/3lImUU7zoQt7ahI3F+4o56NSqQgVtZZTgKd
	MK1ExpLgawgeo5b52W46Ryyuhkv/A6HoL06cDZ+9WFunxD61KUm+PiXufoTo8a9M
	sZhliiN8tJne6RFeKamsb+92bDxg5oBGDDLZzMNO9j0NuZfJByJBLguHsWYz/16G
	gNafJCrY3IuqhCvy5eREz0VWvPbcK9OBBVywKTZ4Ts755bJhaEdsOIHtEIvGfxAm
	7pJSUBOJGCii8yCi2ajyuu88PUgZsYZWxAsWCpw8EJ1qxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pabcej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 23:30:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso95950821cf.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 16:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784676659; x=1785281459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWJBxzgFBd9Yr1usno2p1uJYkPMUKY4gzoTzlbUJzlw=;
        b=kuJTzZgy94ub+hbfDWRDp8olNCxyGCxKYLvgEnjJyqnx8Wuv45pU/RBhIPNR15f05R
         4gAP51+y4Anf76UwASb6U+ygx/UN9lTXFHfmg1cG1b+1DBrILhuvF0CYJNb1GZB8Kksw
         0HNVz9Me/cEUGFwwTMMhIObbXBRVTWBeYXWUE+mmaNCs+kVlpgSwYi7OWtwMN8WO555i
         ZSP3bM0laTPi8WuysFsEqRGpFCct+/1vZ2pE6QdVnZAC0xrsCx+ub8n8IBPRHNznWj5H
         +qPIfFWVkNW4Su9VNRSoR92ZSgb3hdyiuWXWR2GePQKEmRft2AoAdCrGqKmXIbKpB6UA
         h2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676659; x=1785281459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWJBxzgFBd9Yr1usno2p1uJYkPMUKY4gzoTzlbUJzlw=;
        b=XLgGKgkvey+tYWgi/kQTG9EHOn9ulRZkqFocWF4/cGwv2Sw/f/azDb0drhW4ay6p8L
         SSGA2yjimpeDYCoj4OAk2eyqWGyLAJbqkAIaGXNQjC/IDHJCR9B+/vwYNm8bJn5iH0Bs
         a1J89A6q4ISqP5eHqIwVw8mI+lqi2CCrgcYK0BFr2Xde8XiNq1/TYhAd4GS5t/Oav+9r
         uCWRYVhSIrunXJOSrvXQOkq4mZKOmxMsbHSSDdyCFqX/QwNETnPlcPm3FMSXLbbWvbt+
         mQJrkd7Vqagk6CsHoUSaFhjWV047Tyd15PbkSJk9I9a5CfCgV5ombAoSsmlscMyhJuPe
         VU5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqM+hWoh2nUj9uT/ZsiNjSeLL9fJPmGOVBR15sIFRA+51Wngf6jwIjn4BZn+NOtD3cCIA1VF0ygU4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr2d5cCXVCzH0RZ7hMLG636hVZI9KUj2/5rsI6SjNacdhI6xxq
	xsO0j7kMzqwLLSDbDH525VkhIRAE53RfZ30m7UALs6Uk/LDBjcIGycSe9F3ycjlzskKocRDlMyH
	mkReGBr0eW4qBjalqqOCsX79Q/5HU/h+b1FQyBb26c9Rg75s7ikdXwgGW829qbJQ=
X-Gm-Gg: AR+sD13Bi1D6L4/gSKIHTv58wxBBhU9uL2BGSbW2LVT1lNEWIxBek1Xga8VFGpES28u
	IATarHGagiQ6BdKT/QdLfFCbo0ZOMPneuqSz96DyTn0AJvrCJQSvR1MXK89qJ+WCll4O//ZjqpK
	6IsJ+CksV5avg1JXmlmXeDRUAv4gZLS8dveFmvHzZc9wsAKl6ybTTJZi+4GIKnCtuHeWV2Et8Sj
	BCjNNNdgmAUT3e58FFxKBGWeF7zD6o4ahiiOk0EmPpdedN/Yus9R37FrV6QZAccBSSsF45mPEGE
	8a4t7/h6+Hj03FpXsVD8F7UCY+RPJiQrdm12mSrPG0Qz2UmPnWAIfpbiPsxB4g4hAFiJugj73mm
	siwi4SiNm2UQvBShHnGyMJ9SFtprT1ulghC8NMj0LzJmGhFH4qe0RClm6i9RZxs0hDTDwP5uMSq
	+JcLNetAkhsg9ePQ==
X-Received: by 2002:a05:622a:aa82:20b0:527:69ae:474a with SMTP id d75a77b69052e-52769ae48b0mr23632421cf.81.1784676658927;
        Tue, 21 Jul 2026 16:30:58 -0700 (PDT)
X-Received: by 2002:a05:622a:aa82:20b0:527:69ae:474a with SMTP id d75a77b69052e-52769ae48b0mr23632071cf.81.1784676658429;
        Tue, 21 Jul 2026 16:30:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d316cesm167103e87.53.2026.07.21.16.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:30:57 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:30:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Val Packett <val@packett.cool>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
Message-ID: <pb554dy6e5ek3ftasgskytydumajnb6tomncbny2me355aaq3h@pazya2moabb5>
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
 <bjgad2qs6pt2cn5pr353qaelxa3gtpaqfoxjnrwfhwbty4g75f@ngu4ddk5jeyf>
 <31d1ac01-ccd2-4abc-9828-be120f095de4@linaro.org>
 <wd5rytfnsj5vppnimpemocstsaaqhmt4xmie4qnppdh45vsnml@2xne3khyalnc>
 <6875d673-4c33-40ed-bec2-d158651194f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6875d673-4c33-40ed-bec2-d158651194f3@linaro.org>
X-Proofpoint-GUID: fD9zzxDLLh7MHETfshiTz-_6qaiBehDc
X-Proofpoint-ORIG-GUID: fD9zzxDLLh7MHETfshiTz-_6qaiBehDc
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a600133 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=KKAkSRfTAAAA:8 a=VnhmXOk1u3MlwGWApt8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDI0MiBTYWx0ZWRfX6GPGV6Wa3bkj
 WPc6nFgmEd4zP/I0IofmGEDlpFYbjw1rg9NxRD0m+QToGyqpVF3KumZUDGMGrOHoQzVWlOWQbZ3
 kP3cv/GmvSouqq4+RlQcrIOtC+b/VZ/ONIcs5+1xnCjh9G7W4WTWtqzHPObsZTutGXB9DrLtPGO
 sXfEvEA57ZHalB0M/U1HSUSFC48sVE1sTy9mNTr3v20GkJbjBf16giuPB4DM2vYQmVgp5TL52jH
 MYSgAfRZqm3Nm+Cpff8qeUqXlVkoTNKg2+qvLTin3VaMHvAqikfgiwSgMc8yihRfRnPE2NsPDKR
 vl31xRG00OY+l32m2gWjxNm31mV1702n9SH2bqpLwe/PbuYjIcQNA0YxHI3TmNxucmzt+32j1hg
 cQ8k1XiY6883LBGqsKBrvM/dqtVe+D38DQT4721iAaPqe7NDAtNw0a0W5iWi67RXTYOYv3sbhXk
 hNh6+aZe7t0tVcfSa0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDI0MiBTYWx0ZWRfX8skX3KOPRiBR
 AJmWL4iUSMWlPGF2tsWvA4g46X5ArtBoIEyNiQHzH/MfFi/FMI0gsMIO37r5TNrxeKxeZ807lhJ
 NNwcK7XYakzvGwbCPYfScY0F5b789tU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210242

On Tue, Jul 21, 2026 at 01:39:23AM +0300, Vladimir Zapolskiy wrote:
> On 7/20/26 23:54, Dmitry Baryshkov wrote:
> > On Mon, Jul 20, 2026 at 09:21:03PM +0300, Vladimir Zapolskiy wrote:
> > > On 7/20/26 18:00, Dmitry Baryshkov wrote:
> > > > On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
> > > > > This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
> > > > > 
> > > > > The commit causes quite severe problems in runtime due to the introduced
> > > > > cyclic clock dependency:
> > > > > 
> > > > > * dsi@ae9400 platform device and its probe depends on dispcc clocks,
> > > > > * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
> > > > > * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
> > > > >     the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
> > > > > 
> > > > > On RB5 board with no connected display panel on boot I get this error report:
> > > > > 
> > > > >     DSI PLL(0) lock failed, status=0x00000000
> > > > >     PLL(0) lock failed
> > > > 
> > > > Why can't it be locked at this stage? Is it underpowered? Or is the code
> > > > trying to lock it on some random, unsupported value?
> > > 
> > > Since there is no display panel attached, I believe DSI PLL clocks should
> > > not be enabled at all, however the reverted commit requires it to happen.
> > 
> > If there is no display panel, you can keep DSI hosts and DSI PHYs
> > disabled. If they are enabled, they can be configured to some
> > intermediate values (even if for the sake of turning off the GDSC).
> > 
> > > 
> > > I don't have a panel for RB5 to test, if the PLL clocks can be locked or
> > > not, when there is an attached panel.
> > > 
> > > In general I believe the problem is plainly related to the established
> > > cyclic dependency as it's stated above, and in any case the reverted
> > > commit is a clear regression for RB5 board with no panel.
> > 
> > RB5 ships with the lt9611uxc bridge.
> > 
> > There is no cyclic dependency, AFAIR. It's DSI PHY PLL <- dispcc <- MDSS
> > pclk clocks.
> 
> What does '<-' above mean?
> 
> From sm8250.dtsi (using labels only):
> 
> * dispcc is supplied by mdss_dsi[01]_phy,
> * mdss_dsi[01]_phy are supplied by dispcc,
> * mdss_dsi[01]_phy are children of mdss,
> * mdss is supplied by dispcc.
> 
> After the applied commit, which I advocate to revert for now, the ball
> of clocks is no longer left untangled and linear.

The devices have always had a circular dependency. The commit in
question adds nothing to that.

> 
> If there is a clear regression caused by some commit, it would make
> sense to revert it first, then reapply it after an alternative fix
> is ready.

Unless the commit is correct and just uncovers an issue elsewhere.

> > > > >     dsi0_phy_pll_out_dsiclk already disabled
> > > > >     WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
> > > > >     ...
> > > > >     dsi0_phy_pll_out_dsiclk already unprepared
> > > > >     WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
> > > > >     ...
> > > > >     Tainted: [W]=WARN
> > > > > 
> > > > > The problem has been already reported and discussed before [1], the original
> > > > > commit was done for "preventing potential stability issues" reason, and this
> > > > > time fixing a potential issue introduced the actual one unfortunately.
> > > > > 
> > > > > [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
> > > > > 
> > > > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > > > ---
> > > > >    drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
> > > > >    1 file changed, 2 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
