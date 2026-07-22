Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E891F03D9
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722107; cv=none; b=QKThIaGSGECFQ2kfv3QgXBjdu5wT8UVYlV4eM7PgWcuSK8KXJU3N0HOzuQoS2Gzie5PPeJzJh8pEi1oqQ8PlWmTdNVUdhGRzXdUY9DWSeC6H/MDI/JlEaTWrNszptpN0HJGst+GRzexDi3pODiFZBQCmoN/2rTv89B1zRCKJ5lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722107; c=relaxed/simple;
	bh=ElE1alLuo9MSbRob7AGyjm8iYMPHrN2yKWroUeAixtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYXJxPbKFYYARAf9i/ZwztMjcwfDePzA6MOIT9Gbf17FhzuVZiaHr92OV5s9vAfRcjaFnNrcktgTsoSDikRAwa+eZp0FqsEdgXogtuAvSNOaVgoH5kffdP6xe9m/RvlRrXrKOGSsMuvIiqY/tGAC188E06mX5VQd8QKNOtCvrvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYjnVUSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMbrp4om; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYjnVUSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMbrp4om"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xRFI412903
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 12:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ELwY2dyKgx857KJ2eUUIIIo
	N0FtWi3hRUZh7QygEi8=; b=KYjnVUSGUa1CnAbxkQbxvkNxMxnbNt5CRsDN7bxv
	kJ2nkMTvtKhJbhQLaz5798VCynU2C45HIoCWJY4CBhwLqTHQN/6h7h7sTFx03ojT
	OeeseMi1UzYlZExm2tQRP8/dNRh4wcOGUbPrh36WHKc7WdBdityXrSTNKnxG2FOk
	a7sJQNy0CrkdbUe990cOIXmY1QzUjkETtKnDtLmtL3/tEdkN6o8f3oD95fM3JzCi
	b8VvGlI9pq6SfWykbDT37iaBOEJIGhBu3wARrkGym07lHFXKHdp1Ua1UqCjevIjy
	jKGvc5mrRyX8Vw8mgmM0TgiDxkB30ba79bIBsopoHa2bnw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdhrav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 12:08:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so151543661cf.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784722104; x=1785326904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ELwY2dyKgx857KJ2eUUIIIoN0FtWi3hRUZh7QygEi8=;
        b=MMbrp4om/kyeOqevcaZTA1k1l0FXs1t0JYvMGxs/QB6hpmsifFUa9xGyxLU9aHwRKK
         NTmyTLSok+g1TVK6CADfN7G9RoxLnyRKx4Pat6c6SGOiY8otv8U0jx7AsRP4cyaAvift
         2kz37bHJ5vsYoYuqF/vTD20inL41RNNkZPHxh7L1Hl5sq2vArv9uPUdeWl2kpAUcL+1h
         JBchdqAlq0mZPPK8SEfTvEsKYEe58qEEOf8x6PcjvstoAtr+kjYFW5GHcN+7c2arKoBm
         PWMblZO+X3Pfu5qkjPqAc7WZncNOcvl46LvGIqppPyohWTCGP3c1ioJS63Y61OelbYuP
         NR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722104; x=1785326904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ELwY2dyKgx857KJ2eUUIIIoN0FtWi3hRUZh7QygEi8=;
        b=p9E6vapjXCXxtfV+1wFBVC9jGer/FofneQDCnaNBKjk5o6xMsLAcijYVT+AnfXxB1i
         uP1Wfce23ZBpDigzb2eSP+DYYcnRmMMvrJY77pcx4Ml0xZ6BEwnhhHKEIzTOmFSQ7tqR
         oakYd6L0+4YrAuvVCXGZgEXpIVKklULt1Ei4b70WvAfhGmkQLMOaiCiYSKkTqioJtmyz
         fjX2Kox3b7isRAFVnTQQ1+RMJlq2+vhlHxVMiyFMpX1NX9aK5QjBOkI4nlPMwnuoP+OR
         kVpDkoaka979XCI3ioSvWBNJTP2sfiJl7PXoT33O7JqrjGRB4Z+B+u7tz/DuPt6yCyri
         VnoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdyAP1Is1iQrV1JhTYkDQf8mXleXI/W9ASG1vcI5jkbZGMRevwwXQc8JySKERAvCRFDayfWYpzPIE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+nhXSbex71VTT4J7/rjgZQHnmZoCYWawZCFg68VLvCE7Bd5WS
	YGld1oPf7BKxA3zPgIHJN66CWWJetOZl11gQX8q8qH3MXX05JvEpZj473I3y6Yxhyb324tliIEH
	1DeLIoi6QcxyOCAuRJdj/zI6UVyEPwIU1fCgeP5CfYTKkHyIgnurjyt1S3NtabcE=
X-Gm-Gg: AR+sD13zEQUMRNvDjmtJo5kdt9C9vsivzBDzPhOHc3HbeJCkGBOwNgvEqwHXndLRq42
	6cCvqkO2oQEMh0rGjQXovY9O2lTgZ8AoogMIW6uPXdBByim4qcPic67OG3DzO1LQl1gwYEPoX3X
	h13aZF/n7zSTB3CioINpZvJt7zmwuYuyGjlNeBaq7d2iAk8t0DMhkYAmro8U0PuPsIs+cr7yDiw
	PDQOX4GZSXrjaYE2fKa1QfpoLrcBEYDc+00rt8JP8d3OmZmBWw3etI6WLFnsUcrY9aVWF1WkuRt
	yQvWS0F7X9I3cm0C4NJbq4cZ4HDbzjm+zSqCOlF2bY2xyFAAVCVnTWYGyKsmTeeazN41Tdde4SJ
	UoI4Ey/2Nqijcl7J5BpZrBYDuTR96y1LSN/gSObicFPqIEavcH1OXWixA4N6laYOpr6TVJ5BJzg
	T/hBEkYiBroE0gpQ==
X-Received: by 2002:a05:622a:1813:b0:516:eaf9:f6f1 with SMTP id d75a77b69052e-5213c0073fbmr214005441cf.13.1784722103664;
        Wed, 22 Jul 2026 05:08:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:516:eaf9:f6f1 with SMTP id d75a77b69052e-5213c0073fbmr214004021cf.13.1784722101953;
        Wed, 22 Jul 2026 05:08:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30758sm442372e87.45.2026.07.22.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:08:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:08:18 +0300
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
Message-ID: <dfvbkhfo4xkbr7widmnzbcfhflqggljbfreym7v3mlp4pwzhlf@4jqynmw42kq2>
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
 <bjgad2qs6pt2cn5pr353qaelxa3gtpaqfoxjnrwfhwbty4g75f@ngu4ddk5jeyf>
 <31d1ac01-ccd2-4abc-9828-be120f095de4@linaro.org>
 <wd5rytfnsj5vppnimpemocstsaaqhmt4xmie4qnppdh45vsnml@2xne3khyalnc>
 <6875d673-4c33-40ed-bec2-d158651194f3@linaro.org>
 <pb554dy6e5ek3ftasgskytydumajnb6tomncbny2me355aaq3h@pazya2moabb5>
 <d253894c-9400-4c2b-9074-c5f9eead7b21@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d253894c-9400-4c2b-9074-c5f9eead7b21@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExOCBTYWx0ZWRfX310ebCVpIdkX
 opIosJxevn/M+h0rEGyXCFfaMPe5pIdcEEmjbd/OWMTEW3gpeWInVs5SiR9zbdjdTAZBRsVlXAv
 TOTykJfVaGwnhv0llqNm8VDBw7DOUlojwQdoKTbOOZGX3N41lAWBmDIulunNTWOpEwz/16nMj3n
 4dceLieC7vyn8TKDEPFt00BKgPe/bNX4g5sMdSjVH4VkHwW+tI2qSqhUq0Iaw1R9L2OV1DI7BzE
 6uQilZHHCNDJfhrK4r02jnXqSy5IT3qi+I+8KD0lzxcfQJ686PlM7ywB8ZlPzytzGVt1P9cdacE
 vBWNY/zU7E4Lc7f6znciO+q7X5k+dZ9njdLHumb3E0Kw1AHYl9fg2vNVGcXIQQetsy8PqMCLQ3f
 5fCfNG1EO3A59jZc0EihEyYsxHFPuNU1/CiXHCYjriobdu9xTs8FokcXrJrpebpHy1nuWtQ+lO0
 6SvCMSuBccIyHOTBFjg==
X-Proofpoint-GUID: OR_X7uLzZ_8NzpU4MBA9Ir77qSTNndWq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExOCBTYWx0ZWRfX60qSasrk/C75
 fCzzROHQSf788iWtv/HRVDlbvFd5vvTSo6GlIt+3SET6ycf0btf1Vs6jqWrKtIuCeS99bmvEJBW
 B7gwrOouQufP+WsP+9AIMzZb8uf4Hto=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60b2b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=_SYEUFXBIhQAJDrr0zYA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OR_X7uLzZ_8NzpU4MBA9Ir77qSTNndWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220118

On Wed, Jul 22, 2026 at 12:28:18PM +0300, Vladimir Zapolskiy wrote:
> On 7/22/26 02:30, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 01:39:23AM +0300, Vladimir Zapolskiy wrote:
> > > On 7/20/26 23:54, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 20, 2026 at 09:21:03PM +0300, Vladimir Zapolskiy wrote:
> > > > > On 7/20/26 18:00, Dmitry Baryshkov wrote:
> > > > > > On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
> > > > > > > This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
> > > > > > > 
> > > > > > > The commit causes quite severe problems in runtime due to the introduced
> > > > > > > cyclic clock dependency:
> > > > > > > 
> > > > > > > * dsi@ae9400 platform device and its probe depends on dispcc clocks,
> > > > > > > * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
> > > > > > > * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
> > > > > > >      the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
> > > > > > > 
> > > > > > > On RB5 board with no connected display panel on boot I get this error report:
> > > > > > > 
> > > > > > >      DSI PLL(0) lock failed, status=0x00000000
> > > > > > >      PLL(0) lock failed
> > > > > > 
> > > > > > Why can't it be locked at this stage? Is it underpowered? Or is the code
> > > > > > trying to lock it on some random, unsupported value?
> > > > > 
> > > > > Since there is no display panel attached, I believe DSI PLL clocks should
> > > > > not be enabled at all, however the reverted commit requires it to happen.
> > > > 
> > > > If there is no display panel, you can keep DSI hosts and DSI PHYs
> > > > disabled. If they are enabled, they can be configured to some
> > > > intermediate values (even if for the sake of turning off the GDSC).
> > > > 
> > > > > 
> > > > > I don't have a panel for RB5 to test, if the PLL clocks can be locked or
> > > > > not, when there is an attached panel.
> > > > > 
> > > > > In general I believe the problem is plainly related to the established
> > > > > cyclic dependency as it's stated above, and in any case the reverted
> > > > > commit is a clear regression for RB5 board with no panel.
> > > > 
> > > > RB5 ships with the lt9611uxc bridge.
> > > > 
> > > > There is no cyclic dependency, AFAIR. It's DSI PHY PLL <- dispcc <- MDSS
> > > > pclk clocks.
> > > 
> > > What does '<-' above mean?
> > > 
> > >  From sm8250.dtsi (using labels only):
> > > 
> > > * dispcc is supplied by mdss_dsi[01]_phy,
> > > * mdss_dsi[01]_phy are supplied by dispcc,
> > > * mdss_dsi[01]_phy are children of mdss,
> > > * mdss is supplied by dispcc.
> > > 
> > > After the applied commit, which I advocate to revert for now, the ball
> > > of clocks is no longer left untangled and linear.
> > 
> > The devices have always had a circular dependency. The commit in
> > question adds nothing to that.
> 
> Unfortunately the devices were in the circular dependency,
> the clock controller device driver/registration provided by
> the dispcc and mdss_dsiX_phy devices were luckily not cycled.
> 
> The reverted commit requests (unprovided) "dsiX_phy_pll_out_dsiclk"
> clock to be enabled whilst setting "disp_cc_mdss_pclk0" clock parent
> from "bi_tcxo". That's where it breaks, I suppose.

If it is unprovided, why do we see PLL lock attempts? After a quick
check at this point we are programming the PLL registers, but they are
not reaching the hardware (and read back as 0 at this point) or the
hardware is powered down.

I've performed several attempts to understand, what is missing here, but
I didn't get any positive results. Neither of the following works:
- Adding cpu-cfg interconnect
- changing DSI PHY code to power on regulators at runtime pm resume
- Adding refgen supply to DSI PHY
- Adding MMCX domain vote to DSI PHY
- several other small hacks


I will try inquiring internally.

One thing I'm pretty sure at this point. The original patch was correct.
We should be turning on parents, otherwise the RCGs can lock up on
reparent.

> 
> > > 
> > > If there is a clear regression caused by some commit, it would make
> > > sense to revert it first, then reapply it after an alternative fix
> > > is ready.
> > 
> > Unless the commit is correct and just uncovers an issue elsewhere.
> 
> So, what is it be to fixed here technically? An advice is welcome.
> 
> OTOH If the issue was there before, likely it hasn't been ever
> reported before, and now its rate of reproducibility jumped to 100%,
> this is still a regression.

-- 
With best wishes
Dmitry
