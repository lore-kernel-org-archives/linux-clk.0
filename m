Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2760D31B130
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836105; cv=none; b=UyHz5Foo864/R5CsRRAfpHtelXkkFOx3jHC1pjSmBXua9y0WPvyGnrc57X/XVoD42ahvQ/xC9mjqeC8gaDYfb/K2oO1RR4kzzB/+pVDctn0/2eIGjlifWMtRYLtKpak8ZPfTADUhuv7fVQoDGU2IkbJ29ykrB3pO8ILmC9aiqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836105; c=relaxed/simple;
	bh=wt2iQRvLcdM7i51XKgR7sbpRcQIOt/YnEmrjxz7bMZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFNqMrCBLLU7Fr/H/JpJXTvv4B8SSzedEoVn3gRO3C0JR85PDokCqr02Ah5a/Hh2n7AVa55oCATjxLzBYl7BAY0w0VnM/DLAZu/TL3XEskwqQOqmx12/2e4BmCY+80N8IXUZUexARKwI/uc4wc91viF5Dd8L2b/qsQsGI645YuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICG4Q3Vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUl+14+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICG4Q3Vk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUl+14+b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90mgF1904981
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 15:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ap3tAgxenSiHNhV/Re8Z5pL7
	juJCHNdQgIJ2sqs7hh4=; b=ICG4Q3VkTV13loRe4fmYE2ID3MBh/+5iaw9bhXN+
	QdQ/qdlTjHs13ZNWP5jHV+93DWUujSPnzc/C1wOQ0eruhqbj52d7HUWlJSaxVNSz
	DgCCCwPnoeLkMdUjvDiR3FHP2rXp5QFVQ5NHo0wHO5xzhYBn/R/auE13VqqrB4Ay
	lJPBnlxyZfaFh4Q5T9l2yPbqCtww2uzxUxUW16+YOv1LZ3D4mtKwBLpH82E26JoS
	TVt8OKFHN9C2Q4hEvdM7IIQrtLcHYYim9+6Zz1FegRoXtUVMgtDbRr040lTvLB4m
	U/Z4BAOoHPNrOP0J8cxXid95osxywtYDsxb8ESVI4r+PEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu9ckd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 15:21:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a87029b6so757987885a.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 07:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768836102; x=1769440902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ap3tAgxenSiHNhV/Re8Z5pL7juJCHNdQgIJ2sqs7hh4=;
        b=eUl+14+bBEByYt0h5G/TLnWCMtsU25HtedR7YDD3a4G0CbCdcLOF22xyLHDS8Lpbw3
         zXxNcGx1pzEAcmgNidgBk25qHQSbskyzezju+wQMDqBM6sy/OeBMdhThZbOx4RRd2pSX
         vdsU6F1bpJg4wO5xCiSEClx4FQHTko+xgpbC69tHKRWeD2SRIubKe8kCGyn/4LTeWZxs
         BsuJizQ7Uxo9QsPWgkEM9WB/LGhCE5HTNWdMlea5kZLxkW3z+61sjhDSL9iYLh8IZ+wb
         4C6sL9vo+gkdR1epQ38gp2njaDCO1liATJ6aOf5EaQkWFFf4BgFGbr7U1AfD3Jm3Kt9b
         Ldjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836102; x=1769440902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap3tAgxenSiHNhV/Re8Z5pL7juJCHNdQgIJ2sqs7hh4=;
        b=lb0EtOv9k1HHrEWhcsAXtjxljsHzt7rGNdN3VlMBKzBUdzy+kBECuVCZy8nfq+7fc5
         inW7Hg8dU5ccO6v79TyVwLlFB5fTkX0yDJilpM6OEdlJwASmkOAPKlvD8q7wJqWy933a
         5hnv1Zu1+NovP9ZYusr/UZEPZ0r7G22/gOINWGMrOnL3XuXwNU4aRN6lCQmplUYI6VyG
         41HPyz9FGGb8XPP5DRlCmdtVAn/8L1QY4bZ6TBHYNQ7oxC0ekDkZsNE6eonGmqKWiPDN
         4w25LtmlWV3uOid2AmpMfdxO/TF43/IlvD6sYF0HBzwuRKuU0Hx+jbge2OXJMhR8gzni
         Hxdw==
X-Forwarded-Encrypted: i=1; AJvYcCWa9NEnLKvStitvXLSs1YrXZF3PeUrZcDxoMLPA5rBmITUhFHq65GF5MMEZ+gLm0ftUbPr8zzxl+xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiAzI2x0k8UaYKXNRUfzSFn0UNRMK6izhDlkSjsPCVi5xckJgA
	wqehAjBJqT9boSUgJ0ImUfJvA6ekZXSJH9o3rBEbqw1DDX57fKPJ+vVh/UNlpsKTPPxenDgyfiS
	a42EBklA+3K+9mX+8MhUV9/1MfdVMQsnfJflYLFN7Pp2RdafKAlgpsBuNO7p1vnA=
X-Gm-Gg: AY/fxX7wtcQwLQCanVqCQonV39B7PtdRBCL2hYHewtZ1U1DN0gvcn1tG8RjlDbn3OjD
	iwmjW+zGAIPhr1lV03Qh3E/DEXdrX+rDinRQdDXgMynT5goioCBUblcVD9ESY1m+0rqB2Xqemqf
	o0u0uVMdFJ8I5yioq2Q6O3FaHxtLlbnAWZAXzb5lLmbkPxCnsGpzlRxEBBYHf6stV+btDxhY+16
	38loXcnhFzA7Fdm4yiKNoeKY0AuJDXgYS6hmz3RRRmof13+GdaaT0POrInHoKXeVUVnwBl9TXI8
	wuOQWRr/zdIirtxFXN7b692NWc7lJ2OZwzEMCOP/l0ImtUQm6mnNA+c3fWPBGJ8h4nm/o0K3+/o
	J3n++ttWK4UXdZ8Smbez5aILp
X-Received: by 2002:a05:620a:29d3:b0:8b2:f090:b167 with SMTP id af79cd13be357-8c6a670434fmr1543095685a.24.1768836102276;
        Mon, 19 Jan 2026 07:21:42 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8b2:f090:b167 with SMTP id af79cd13be357-8c6a670434fmr1543090785a.24.1768836101680;
        Mon, 19 Jan 2026 07:21:41 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569922032sm24757404f8f.8.2026.01.19.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:21:41 -0800 (PST)
Date: Mon, 19 Jan 2026 17:21:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Message-ID: <s7b4wjprfgeaif7rzjozilp3zktrqctltr5bpprae6z3t7kjqh@k343qdom6jfk>
References: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyOCBTYWx0ZWRfX0XkxlkjrGCLv
 rPsXBz0Itrc8JhVibI3GeClUJJQGspa7mNoIYubJsYrhuSldv6Ug4TemeFaLQKVf4zfRN53eC/G
 zG1mkXSi16pK6O8/pD5sIWLY9MADMBJDSyVUS4il+far1W1HEhXvzG4XZE+573DVEU3/O69WMPt
 gdyYc6TXHobf9PPi6Ixk7y49wkF85ZYkfFxT8wnes1lQKHUtX8T2AVo40iSJZLQ6QCAC7Kmu+6B
 9R+x6cpgDZEVkBdYbzidkyMUxHJDjwbkRYp5V/N7ZHyRM5cTbuYMmsFtMxgHkGzPGdL8nru4Cqw
 2dbL1/AnEltemoBFth56dc+QFfAYa1pwlDqyIzvxoPiV+QU6qG7AAm2ptQb1XO6BK624asuTOX6
 h2RCUcBSCJ4eTiF5QN7xSyJBwVMwcKhKmam9cp8IKl2/tuLzyIfi/ebvifhv2ZTpQvCMf3oTriF
 BCtmcsV5IPmKwa+CwKA==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e4c07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4zAq9UItTR4ueoMMHEYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9wXVSuX6ibJ49ttpwlM44iEPhchVyt3p
X-Proofpoint-GUID: 9wXVSuX6ibJ49ttpwlM44iEPhchVyt3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190128

On 26-01-17 05:54:47, Dmitry Baryshkov wrote:
> After commit d228ece36345 ("clk: divider: remove round_rate() in favor
> of determine_rate()") determining GFX3D clock rate crashes, because the
> passed parent map doesn't provide the expected best_parent_hw clock
> (with the roundd_rate path before the offending commit the
> best_parent_hw was ignored).
> 
> Set the field in parent_req in addition to setting it in the req,
> fixing the crash.
> 
>  clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
>  clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
>  divider_determine_rate (drivers/clk/clk-divider.c:358)
>  clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
>  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
>  __clk_determine_rate (drivers/clk/clk.c:1741)
>  clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
>  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
>  clk_round_rate (drivers/clk/clk.c:1804)
>  dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
>  msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
>  devfreq_set_target (drivers/devfreq/devfreq.c:360)
>  devfreq_update_target (drivers/devfreq/devfreq.c:426)
>  devfreq_monitor (drivers/devfreq/devfreq.c:458)
>  process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
>  worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
>  kthread (kernel/kthread.c:467)
>  ret_from_fork (arch/arm64/kernel/entry.S:861)
> 
> Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
