Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8843C9EF6
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 20:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580850; cv=none; b=BOlt7JZoXDzJjLAysxx5yY2oDfBBfZf7YUUSHHwtNR/u+ohz49CDhzBAMcbOMPXQkIpe7p3v3AqlNo/7Xd/fT7Q7d6L9DYvGTLVsrOcPEHjvyz2P+qcVz/T421pw/A/4wSQRGLcWp8JdOa5FdmD2E0VLEJmGx4SfpN4sLRoiJNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580850; c=relaxed/simple;
	bh=1EVgJNWCRuzAlEHe+3TzOLwrGNDJPNFqa3vOnnu3LS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zf+/jlgytixSBScficNgCy3dJZ6aPELL9ccPYZXvecM+D4kPIkD5J5p8eRru2BBxrvsvc4q8T8YaQflQXscf67nAtOg/vsbaoiiHbR8vbhKzYxSJ5CPD5l+CE3Ce7jO8wTge7j0jeOTx41AFY7pXsb6G1g0Msetsh7bfGFZOjRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaQXqoB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbFm0QHU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaQXqoB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbFm0QHU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTRGj447232
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 20:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z7ljRJ72JStKsC34AghCTdU6
	lRU6juRMv7sa0ZJfgCo=; b=oaQXqoB6itY2L+Ir4CLAvzOR0hZ4yqLUO1QS4zTD
	1jFcTDCl2Bsuw1PMRu2aN+7dBiXi0SbYI2hLk4QWuwXdRl9l0CbI0J1hKB+BiXO3
	mwO/dKmlZdlDMFINZhdfnbe44U3x12kY3MGxC4EcK6BiXtKN6uXlDvGSzdOsH9tx
	HnDmvEd04ysNTifF1CyCY7Z+B5JZLUORLQLqzJywGiLPSkhWQt4J0fQiCcCEoO2p
	XjZ8poNlFZLQ5IjQ/tjRPEjIi6jnrsx6OcKKKWmytL118GVtYMrYm95JB5rMiVNb
	Ikje9Id/HpymSLx/xubqfFRVru3j1wj0iZArm4F0KDpgXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5ruum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 20:54:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f871so200129566d6.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 13:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784580848; x=1785185648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7ljRJ72JStKsC34AghCTdU6lRU6juRMv7sa0ZJfgCo=;
        b=SbFm0QHULBOs5XnKt6+tD8mgXEMGqPowWPaRMKaSk9Ik64beaiIIx59eXZ0Ett8N2m
         LRYqoDh0yZEhtERCHZigh9VL+ApvK/0dQ/MwgDzxKTOPO1RRv4/qSH3p+uBsuBPKhC17
         l7hbWeWYTKQQ4ssquiBqlWuwYCHX9+R4ywm3sfSWzfolU4FFHUJ1C5bA3Gg99OLmhpjb
         MTfpzIshPmI1JzsykM4s8LRxGyQ34Jzj6lVYM2k+qJLymom8q4WOthq6G92h1NyjOOJi
         koJxsXOObQ6lREM3z1ddg8AcXd2WXpQcgkwXToCHCL9xdRQdVKjwSl8/UTgfmOjncomV
         2uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580848; x=1785185648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7ljRJ72JStKsC34AghCTdU6lRU6juRMv7sa0ZJfgCo=;
        b=hgW0KQsHuoitAsv5CUHtffviCgL07T8uS/RbmFm17G50xIl3+RRt5o7fkOjEa2m0HS
         0xnA+BBT20q93DOuWZ/Da/zc4bgEdqR3PZ3evuSnkZ8uYXrWd/i2aP7LKJrCZuPLsRvz
         X8Tkd+bByvfTgCQWH2MsErB7sWJvvXrpGZn7ecT5NvLdHV3Oi2PFFtQwK9nEkB+74w1A
         ujyIdZLrxj3vl4qOz830oBUPnddWwyDw3IF3HfeEou4SremarnVQp8H0XbViy1THkSJx
         LksYsUzJbepj2GxrMtSWbbCcSDUk2jdDbEGfE2tvmWfEX+EemtE7XD0ONTs4+FYGZoaw
         /TSQ==
X-Forwarded-Encrypted: i=1; AHgh+Roh/nUfYVAD0ebHhib42jDvlS5AQhUK4wJU4PI22E2PwJblzpZKgBTUvBLrk+ivoYWJwZXjfG7jwxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlYpJOJUUzyZNeSkjV/RaAcvMlI3+L4ZnA3p9ifR8Zf5yhMRK
	QieaAjGH1Dv+HLAnA41pqiuRcMAsu5fQqEvPa7kleoARr/1nisfXTe0fEGA4bBp+/s1EaTJAm/r
	/NppmqvzDYPhH5Z4+F1B+/PItSWNpm/NMOqkwxqu6jX3Cd94nF41xVWpd5+ZpfR4=
X-Gm-Gg: AR+sD11pGyTVdFfznlFMh23sNR3aCei5+kKvYuk98ypEIxUiMC7wJM+SCqILbyNovNl
	jijfTTpWSpHi0UrkLccWx+Zz4L1kU61LW5m6Duc0kxdZv8tc65hdkTsHynOXqdZdrhz8HUV/Vy/
	gjYg+jPX6m/ReqOv0PSt2WZP3RmkrEwKcQm3YQsxexkBD+6z9KmES2aiZgLuDyN2WXzPuZ18HuK
	hokjcH+EM/kevgDUmm83UU6jqKd/haBO9qxTGdRmBIPuPhnuyMk0CqM/yXat0ebULTjuWh/Bts3
	JuCqzfNA3ZKjB/KVZAB9+CP5eR5RbaMdA+BrirNAKKik4aEdH+IJH862zFQJWUWa31Nqq7/DQqM
	4cDgpew0QRLluqBXtbD9H5P5KqFV2D9mZoxGst4J6NrBNAcHcKwywKOKaDtT/TI1GTXhVKXc87k
	Jt/5Fv9xY3BEFy2Q==
X-Received: by 2002:a05:6214:5b8a:b0:8ee:f81e:7927 with SMTP id 6a1803df08f44-9077851aac5mr193014816d6.48.1784580847698;
        Mon, 20 Jul 2026 13:54:07 -0700 (PDT)
X-Received: by 2002:a05:6214:5b8a:b0:8ee:f81e:7927 with SMTP id 6a1803df08f44-9077851aac5mr193014546d6.48.1784580847286;
        Mon, 20 Jul 2026 13:54:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a24737cdsm292909e87.77.2026.07.20.13.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:54:06 -0700 (PDT)
Date: Mon, 20 Jul 2026 23:54:03 +0300
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
Message-ID: <wd5rytfnsj5vppnimpemocstsaaqhmt4xmie4qnppdh45vsnml@2xne3khyalnc>
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
 <bjgad2qs6pt2cn5pr353qaelxa3gtpaqfoxjnrwfhwbty4g75f@ngu4ddk5jeyf>
 <31d1ac01-ccd2-4abc-9828-be120f095de4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31d1ac01-ccd2-4abc-9828-be120f095de4@linaro.org>
X-Proofpoint-GUID: mQu7q1wMscrh3i6i4sqX31_9_R1lASL9
X-Proofpoint-ORIG-GUID: mQu7q1wMscrh3i6i4sqX31_9_R1lASL9
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5e8af0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=KKAkSRfTAAAA:8 a=OHL0lA1bxIn1Yf3bK6QA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOCBTYWx0ZWRfX5E4xfzW3lvIt
 NzcIOGN/Ud1eBXu+pBHuB/QZxbZb0twsYbqDbONPeqfY64o4/vzg/43CWVntHFQoSs4xa9pigLM
 ccxRE8qFURuu77lw6cZwY946I/jQWvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOCBTYWx0ZWRfX1GKGdPfAVlBg
 XZXnwq3YpIvzIvCooZTgnkfERWpAybMyGB+8eCasxkMpMRWKu0URHIE4rKMUmMiZvXY/5e3URF1
 GyDvD4HjgNniKPVwchaQE3xVDa6nOgIxud4MgYdXZfBhmhbg/k/nzw1m9wLOeaLTpUv2+KBGWhe
 RB7stvejTd+613CHU8ssap5EX/XAIIafq3wX28gQmOMrsN62GvQpNIny5rC/1pBcwxcDugOKqVB
 dXZ6dJ2ne7YZQjbuQJhkUK79BcRNF5lx7GnVQ2o3UpfCLNHHBxmX76ElKD3RoPzTd7Yv8QB8QHq
 7YmijZjbURIkZqJqVsbd3kycAOcFtnoxu4IfgjqAO+rF7w+/GJqiCoUZ7Fl8JaJhI9WggvQcoav
 wfy1pC0iBqe5tyCmYpO4TxAIhLAnHS4osBYtfiMAk+tLOsrE4uwepJv3prn4ItHr7Pk7fkvAtpK
 EJHQI/YrSfh4PwoJRTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200228

On Mon, Jul 20, 2026 at 09:21:03PM +0300, Vladimir Zapolskiy wrote:
> On 7/20/26 18:00, Dmitry Baryshkov wrote:
> > On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
> > > This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
> > > 
> > > The commit causes quite severe problems in runtime due to the introduced
> > > cyclic clock dependency:
> > > 
> > > * dsi@ae9400 platform device and its probe depends on dispcc clocks,
> > > * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
> > > * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
> > >    the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
> > > 
> > > On RB5 board with no connected display panel on boot I get this error report:
> > > 
> > >    DSI PLL(0) lock failed, status=0x00000000
> > >    PLL(0) lock failed
> > 
> > Why can't it be locked at this stage? Is it underpowered? Or is the code
> > trying to lock it on some random, unsupported value?
> 
> Since there is no display panel attached, I believe DSI PLL clocks should
> not be enabled at all, however the reverted commit requires it to happen.

If there is no display panel, you can keep DSI hosts and DSI PHYs
disabled. If they are enabled, they can be configured to some
intermediate values (even if for the sake of turning off the GDSC).

> 
> I don't have a panel for RB5 to test, if the PLL clocks can be locked or
> not, when there is an attached panel.
> 
> In general I believe the problem is plainly related to the established
> cyclic dependency as it's stated above, and in any case the reverted
> commit is a clear regression for RB5 board with no panel.

RB5 ships with the lt9611uxc bridge.

There is no cyclic dependency, AFAIR. It's DSI PHY PLL <- dispcc <- MDSS
pclk clocks.

> > >    dsi0_phy_pll_out_dsiclk already disabled
> > >    WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
> > >    ...
> > >    dsi0_phy_pll_out_dsiclk already unprepared
> > >    WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
> > >    ...
> > >    Tainted: [W]=WARN
> > > 
> > > The problem has been already reported and discussed before [1], the original
> > > commit was done for "preventing potential stability issues" reason, and this
> > > time fixing a potential issue introduced the actual one unfortunately.
> > > 
> > > [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
> > > 
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > ---
> > >   drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> 
> -- 
> Best wishes,
> Vladimir

-- 
With best wishes
Dmitry
