Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2511C3E16A1
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250700; cv=none; b=sWLv0P2tIHO8Ld0iyolnshwiB9LU+Xvm6K9dRnEA67PPGCGb9Yip/LiZ3gG0qlnHhfev/J4TTDKSE+3S4fsaPmdKejB9BJI31f8SclzRtfMcVDrIjRRCDNKYEDatXxHkf9rFnQMHo8qvXBZwMcbSTNW7w5bYBu88u+eVMk+FPoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250700; c=relaxed/simple;
	bh=NPuKeNbPTvcVpb7ngb26wQ9VRTuyAsAMPzqYxepm4ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz681whvTuyuzCUfEK1cjopI16tR19ymS/2SemZYcgO/q1ZUzFx4QJTagM0js3ThOaWmnZjy299KwFE7qGCb7Tu1IB6DSRJdmg1Tch+7YQ7EZ6wb6bcij0BbXO2rhSn8+KNUvR98mHlHHyiSWySYaJgEmzDnmG3R9Hr1MS2IU2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jua/5bgN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhguBMei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jua/5bgN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhguBMei"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39efd2516226
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 07:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QbLNJ1CmnvnZcLpXFuJz3+LW
	dd9OGVyN4S8wDwD2Jq4=; b=jua/5bgNAt0lPCRjQ8qa7iOYxfUWBr7EpI5MscJA
	y5eRX2eoO+zHpn/SVqoA5UmVWu/EjYS2EZt7yOB+FfgGDuUJGfRnQIQNYL+hqg4H
	q9IacWxaauxP7ABarfZhsUwZb6Jg3W3trnhTA6lEF7R8SrT6AlzNmysdOvFQiL+p
	X0vJGmtaJ8hGKoEjDgliG52Ew2Nt0h2EZEZzlY+wy4aXoJg1ny9SzKdnC5EQXCob
	zJ/35/XTxz2J+ytPx+BHqugXcy5ZEGPbmSXvCwev3k6A6H1IhXKGzSxalxoFVUSe
	TEpsA9vJtDVnLjRbcmKHmR+LnD97QSWBpUxsvenM4294Yg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r724tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 07:51:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177bddf6e0so15495121cf.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250697; x=1781855497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QbLNJ1CmnvnZcLpXFuJz3+LWdd9OGVyN4S8wDwD2Jq4=;
        b=MhguBMeixI7IZ5f8RgPmR1U8KUiG2fuRR2N1e5NTNOCW023cMsmJY3aYbTU/zNevxK
         7dQok2cMAwrtnN/KJnBa0SCq9TBRvwX08iuIoKcloU17EmHLtUONdyozq5YkLFJUCcrI
         hMajRGfCHHV1MgDNsKr/C+RsvXDXoNr/fj8VmHPciYbtB0ds62Y9fNx/tA7i0Lz5Fvbr
         U0Zl2/s0MiwIpuWl1UIfhsx3mVi51VdVOuZZefIOvXl9DbvgvmulHKDNZ9XWlWBT0FLo
         PQ/DinE/9JlQ/MnyG7Bkn6dJmRv4QF437RxZ7XAY4VK6ySObbHhBLtOYvcCtxGim1Rme
         fwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250697; x=1781855497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbLNJ1CmnvnZcLpXFuJz3+LWdd9OGVyN4S8wDwD2Jq4=;
        b=nrNX2VJDx//P1iri0kbNvlB2gyA3MRkFrN6+YSRMVnHqUvWIki5VjD7NlsxRLepdIX
         4xfJRc7sv9M57cvOKt37/SOB3TNZwYlVRGECS/riITf1D/uFGb8ngqk5937Mon7lUxuN
         /4qi5bNE0UhCWG2RlikCv3A7h81dkAWaesyp6L3OMFYQmhUIKoBdiWHBy5wDO4NM1guu
         JXP5Pq+LV2XpYgJNlJUIeZH6iUR5qAWuXTL7leau0XR+OoihV8mszIjSe9OGUz9gU6oy
         nJq224R79S6UKVgO0qYGKMAr6w4lYDim1wHWyx/h8E55QYSlNW+LNfh0vdio/mmdpYeq
         VuNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9y3WIs/4ucaQ1znmjkDpGB0p8aDaobUMvAuuZNHtl0UYuOOlmD/W8BpJS7Gg8UzbBiS7qB4XuLwCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfDfqxFx5eEiMxYPZKQvncOBnXGyJrpChvW+wA/ZzrYTkEOt6h
	2ywFAyiM/LPGykBUWDB4Q/O5ifJbGFydGbeFDiJj21OM9VSEV/THmkx2KyYqNlava2JNlIu6CqU
	lVOW7za5MADGhw7XZebtmUJuukDPBH0HYdpNL7Xlck8qn6vBTMLhZDBrWrizFujH5BLJ4MfI=
X-Gm-Gg: Acq92OFpojUVXcNYTGf/bD8Ce276TYQMnBSW0OqiAF9erFA/htZmmvSxLcdN9xHCe+6
	AZTjShxaAtXieuPXFDEUANkxU4Qdn0gRUnovjwtxGGiO+tCk/FO794V19sj9D12rVQILbdsbVXp
	6va9zaecT2iVXWWpS4ISoxZwHvwfCftpD3jsoOIHHg5U628jLplPJZkrRZnO4O4RFyLSyNKZmf9
	lcTFnrP2Q5i3WBauBviAojm0tBLkxBkAGOyEnADl/BGfYpweIjbpenviqZCC9RNl6hr7sCf3Y3k
	iZ4Ap8XNoItZyE+fxowDSzNwZw94RMSvOzo3qUDxC4rcQbRY2CGis2t6J7LyNKtslCDQBEvIrvv
	zJvjPn6unkqYmNPbO1XdAPVWfdt/q6NG/tKhCyOTEEFjqpyZtBc19g8EPHWTXWFTclKJVOyzFxg
	namp3bbxFv2AbmhigZ56Dpzm09PLoRBYDLs9Y=
X-Received: by 2002:ac8:7f90:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-517fbe615e8mr25490251cf.20.1781250697447;
        Fri, 12 Jun 2026 00:51:37 -0700 (PDT)
X-Received: by 2002:ac8:7f90:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-517fbe615e8mr25490051cf.20.1781250696994;
        Fri, 12 Jun 2026 00:51:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b3d0bsm316257e87.71.2026.06.12.00.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:51:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:51:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED
 flag
Message-ID: <3kyvob7ovt2penl2w3d2tfjcan5txz7q63jdvnsbpd3qlz2ipd@zhctl2sk5w5s>
References: <20260610-ipq5424_drop_clk_ignore_unused-v2-1-15240af073d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-ipq5424_drop_clk_ignore_unused-v2-1-15240af073d6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: o5k0GoWfU7XwldjzXli9LhQHuYve_vLd
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bba8a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8
 a=R6xCDqHOQ7rDVscz_h4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: o5k0GoWfU7XwldjzXli9LhQHuYve_vLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfXwW+qPneTLpHa
 mnMvvoYJ4uLNHZq5upHq0aJoxND3R/UCB4a4aFHHKYSrpdZzXw1npvTpDxTV0sD9yuxo4qEKJeu
 LFM0gUn6DTVRh6EHUgdGFGkErMfHjOa9pERFf1UNzCCYdxjBoeNqegH7Eueq9iZWtkQK5Ta21tC
 xYX8s/e6pGO/zabfhbIiFEwZqqoaGaEdGinQSV2XhYpain5Upd3fCHI7cUyQh6QqDrutEJO31GI
 s2arY4smPC5N97WiL2BuuSuilQ8lVm+nTxly+xzGrar+OsTMxLbfJRjtLyO88tDOyI08mbgkjz0
 FCABESvK7nqMTh7wOmsDDNQiWC79ANFKKvgutuEk1cmd3C+Z47GkaFRHUg/197P3PrxXVyBKfnH
 wlMahCeu5FxbYWMpqb2MEzUHZdrRzWzluPNqkYA1M4mCnR46PSExcap4TtcSUMEMMAAJvJWkzQF
 gewPxgVd8kxIlx7EUtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX9r80HBAEJquy
 L8G8MG0W6Ypss2Yl21JCH8zs5NSIpHzoLIdgpjMujHx/BnC9OxNcDYkaG2XYzseU5htejDcW7GN
 rtFTrR9wqqZwV9Oh93n4cqEVU2iyAY0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069

On Wed, Jun 10, 2026 at 07:49:17PM +0530, Kathiravan Thirumoorthy wrote:
> Since PCIe and USB are enabled and consume GPLL4, there is no need to
> keep the CLK_IGNORE_UNUSED flag. Drop it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rewrite the commit msg to include the consumers explicitly
> - Link to v1: https://patch.msgid.link/20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney@redhat.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
