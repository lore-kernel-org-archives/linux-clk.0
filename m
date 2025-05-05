Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CEE2512C2
	for <linux-clk@vger.kernel.org>; Mon,  5 May 2025 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447427; cv=none; b=r6Coa/WKAmb/1XxnUT2TYX/NBl5qSSEafK0/cmu9qdEK7so/hmzt7GIJ2C/b5nOlHU7wKNwsnJa+wUZpdoMRTr+MF/XMq6JZNfg8GW9Gr6rw4G+RYVILlWppg4nCH/9gFHPSshWC4ZQqgAPHoESW5tFCsRvWidiWMHwiAr/h50M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447427; c=relaxed/simple;
	bh=NlALIoe0iC3WSYUHgCo9Umj2JugDI/3o+WdAPXUGUuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m02v5rbmLyV61zrQcz1QpRHLCXnzx/N/+o4T2ylZgFQvbchr/7cwBl0ne4j4+GjHpoYouzqNggGh2WW6RFki3RG0kEzPRXt/hYud2ubE50/BvomAxVS/lINp21UlSlFNXT8ovbAQ6HJi0EtvZ7tDHw3sjeK0xO+C+ZNoHAcEebI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwwMaSql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwwMaSql"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CEjEh023086
	for <linux-clk@vger.kernel.org>; Mon, 5 May 2025 12:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cBmlj28SvCZ4M7S1nnJEd0Nu
	gRbJw27zy6tWxbAN08U=; b=NwwMaSqlGyqRvyKGNJ4+C1B+9YKaFTYBTkNhornd
	2AOd2MXeKxG06zHKKNR3jr0sGT7YdDLBl0UiI17t9lhK1rK7ZHil4PlrTxPqONyt
	L+ikGsVhbN44SDGelGLeWz6jMuEw9vUu3zWMkhXx1y3eznr4EzjzExJpDi/FepjS
	p4/V9e3Y2d1AnhcLVjzH0u3h5bo3lAtoYoQWXXoCZp+8m/qZbmKcsSny5GONbOR1
	SKBmedWBK17f/h0Y5GDKY9Ta0H7bUiUBJTvmw4AUw8FrToMn6m7WfQAClFmzFin7
	6maa2wsCbtJBguMt74RI30b/CH9YNhBPniGkZe4F1Ssgag==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rv2u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 12:17:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f4f15ab411so148424636d6.3
        for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 05:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447423; x=1747052223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBmlj28SvCZ4M7S1nnJEd0NugRbJw27zy6tWxbAN08U=;
        b=GmxSvUQMqxVJCtxC3n38uOyzje4ncB85hCN1sXFxEqPzZxVkjNV6HfElNCYoVvsJdM
         7LsTJPmMWhT/nLnGidy73dSDuIb7+s72wmcX+CvteD2x3iu+66TP0AH1GLpd/hhxlscH
         T4DxcjHEHk48wYMslQhGUQytIWoQj2cgUDHFKQCLcqW6kiNJOcAvJ4XHj32o+64TMlDp
         so5nxymMXL8UQ35wvs4eXjog78NQVkhXc4Axz0C4NxheQiSyL2XVouswUXQK0IG0Xo3f
         4SMx75Q/eBIh8xHyIiqlyNrBNKeEUlWYEr+CNog9XECe3O58npJfxhA0fibhWku7/8IO
         E53w==
X-Forwarded-Encrypted: i=1; AJvYcCWEIzATuThLFVT26URdZQGKoNuxAZ2MqwjrQKZLvKzP/9jLNNtCkZ2EPxappuVliX42IV7b5nSndE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YypJ4UTzwIVCRN8yxnSFeskCppOuEswcnZ2xn1LQ+P5kQlUdnyV
	nLCgrBltvyR6Kie35bWlgY3PSP7pWGlkpNV6jBEjAiZY0rm9lLEBenvWR+gd+30BEEjf6KXO7rQ
	TrlVMmeOLxBcYbjietf/Vki4nwyCT9cD7UticUUwk5Mbsr/xgIP8Z89An32c=
X-Gm-Gg: ASbGncuhyF+U+IwRtvJGF+x9KXszfBrNtEIEjzZRUPpRlbx6XfGrpeHqlWoMPsWDaZE
	Nnf0Sf0CjuElY3tt84oiS94ESmJnwxJCFLSDBTwY3ICFQFw0thJHU9WHLQGDabbQLAjd04hrRRp
	OMM8SJUnJO/Yg8Dpfu/JVt8VIYy/o/4fVhUWeJ50z0EIYdiusQK2+ZJ0FyORE+Fo43NTk/Sipy2
	YrBVdbD032cVC6y3JwhIugSjO2/k4bWuoB8BBcOez7T4WPechR6kdo5ORTn7+Mxev6bTte5C4YG
	mL544CZ00gcPsd+73nqhgUYhhHMKHIQ1KnMO3OcuiKp/PYFv9beVLkfYI0BydgXN77NajF5aWjc
	=
X-Received: by 2002:ad4:5e89:0:b0:6e8:fa72:be4c with SMTP id 6a1803df08f44-6f528c36377mr90487076d6.1.1746447423074;
        Mon, 05 May 2025 05:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI2miDMGBi18VyNdPKWOTeIPliK5ntOZYPJ0fwhi2n4q9Zd33W6e8RHT8wR9jc3kvFT4tTjg==
X-Received: by 2002:ad4:5e89:0:b0:6e8:fa72:be4c with SMTP id 6a1803df08f44-6f528c36377mr90486786d6.1.1746447422724;
        Mon, 05 May 2025 05:17:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b176dsm1684252e87.14.2025.05.05.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:17:01 -0700 (PDT)
Date: Mon, 5 May 2025 15:17:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: keep remotely controlled units
 on during boot
Message-ID: <aw6tjh5q6t75bif4jyusrdvroq53lbwlljo5cdgzrofn3a4loz@ixuu3yw4ucil>
References: <20250503-bam-dma-reset-v1-1-266b6cecb844@oss.qualcomm.com>
 <aBh9WL2OMjTqBJch@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBh9WL2OMjTqBJch@linaro.org>
X-Proofpoint-ORIG-GUID: Hla7jUQZzSJ1fWBvQo1npy0XXYyTgbvr
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6818ac40 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-oSGpTHasqKTVeQyqFYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Hla7jUQZzSJ1fWBvQo1npy0XXYyTgbvr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExNyBTYWx0ZWRfX/oprCTmwmFBz
 pSy42X6ldg/SL+7WCVZU/0yebnQNHuXHe+rDcpPWPOGI4jJumg7cscEwxeD7Au99C9LS3+QpoIs
 ZySSehABEsfkV/FpesUTAc245A8VYjIhDngdVA5soYF+yt7iwxYy8/K8hvwP7gORlcqFfihdZ3d
 8pyGMua9nHdFsv1j4+UUkBd7JnFKVEllQphFHWsCKc1GFQeEKOfSh1rsyB5My2gdoA7ZUPyK7rE
 ZJ6qvQ9dr7h4o0BpeDTgLCFLykvJfL9j8Bfc8cc0LaHnB3tAOtW3QPB7HKIijvdltdnmXLd8eJF
 tkFF1vzsoZTCYkMP1Z1hiPxL35QvS61juq4lkhvOkJMjAV3boCz4aevb6NSQdZJJFx7S/c/2IWb
 sljYS0yRRp50ooy+WITqjoSFWrMmUIVGe6kd1Lxexn1UNwzFycxXSHCUe1/eVsgxKGdmIFId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050117

On Mon, May 05, 2025 at 10:56:56AM +0200, Stephan Gerhold wrote:
> On Sat, May 03, 2025 at 03:41:43AM +0300, Dmitry Baryshkov wrote:
> > The commit 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM
> > underflow") made sure the BAM DMA device gets suspended, disabling the
> > bam_clk. However for remotely controlled BAM DMA devices the clock might
> > be disabled prematurely (e.g. in case of the earlycon this frequently
> > happens before UART driver is able to probe), which causes device reset.
> > 
> > Use sync_state callback to ensure that bam_clk stays on until all users
> > are probed (and are able to vote upon corresponding clocks).
> > 
> > Fixes: 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM underflow")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Thanks for the patch! I actually created almost the same patch on
> Friday, after struggling with this issue on DB410c when trying to add
> the MPM as wakeup-parent for GPIOs. :-)
> 
> How is this issue related to _remotely-controlled_ BAMs?

My understanding is that for locally controlled BAMs we can disable the
clock at the probe time as all the users of the BAM will be probed
before accessing the BAM. In case of a remotely controlled BAM there can
be a user (e.g. UART) which is running, but didn't request DMA channel
yet.

Please correct me if I'm wrong here.

> The BAM clock will get disabled for all types of BAM control, so I don't
> think the type of BAM control plays any role here. The BLSP DMA instance
> that would most likely interfere with UART earlycon is
> controlled-remotely on some SoCs (e.g. MSM8916), but currently not all
> of them (e.g. MSM8974, IPQ8074, IPQ9574, ...).

This probably means that the definition of the flag needs to be
clarified and maybe some of those platforms should use it.

> The fixes tag also doesn't look correct to me, since commit 0ac9c3dd0d6f
> ("dmaengine: qcom: bam_dma: fix runtime PM underflow") only changed the
> behavior for BAMs with "if (!bdev->bamclk)". This applies to some/most
> remotely-controlled BAMs, but the issue we have here occurs only because
> we do have a clock and cause it to get disabled prematurely.

Well... It is a commit which broke earlycon on on db410c.

I started to describe here the usecase of the remotely-controlled DMA
controller being used by the BLSP and then I understood, that I myself
don't completely understand if the issue is because DMA block is
controlled remotely (and we should not be disabling it because the BLSP
still attempts to use it) or if it's a simple case of the clock being
shared between several consumers and one of the consumers shutting it
down before other running consumers had a chance to vote on it.

> Checking for if (bdev->bamclk) would probably make more sense. In my
> patch I did it just unconditionally, because runtime PM is currently
> a no-op for BAMs without clock anyway.

Please share your patch.

> 
> I think it's also worth noting in the commit message that this is sort
> of a stop-gap solution. The root problem is that the earlycon code
> doesn't claim the clock while active. Any of the drivers that consume
> this shared clock could trigger the issue, I had to fix a similar issue
> in the spi-qup driver before in commit 0c331fd1dccf ("spi: qup: Request
> DMA before enabling clocks"). On some SoCs (e.g. MSM8974), we have
> "dmas" currently only on &blsp2_i2c5, so the UART controller wouldn't
> even be considered as consumer to wait for before calling the bam_dma
> .sync_state.
> 
> It may be more reliable to implement something like in
> drivers/clk/imx/clk.c imx_register_uart_clocks(), which tries to claim
> only the actually used UART clocks until late_initcall_sync(). That
> would at least make it independent from individual drivers, but assumes
> the UART driver can actually probe before late_initcall_sync() ...
> Most of this code is generic though, so perhaps releasing the clocks
> could be hooked up somewhere generic, when earlycon exits ...?

The spi-qup commit looks like another stop-gap workaround. Let's add CCF
and serial maintainers to the discussion with the hope of finding some
generic solution.

Most likely the easiest solution for Qualcomm platforms is to add
additional vote on earlycon clocks and then to try to generalise that.

> 
> Thanks,
> Stephan

-- 
With best wishes
Dmitry
