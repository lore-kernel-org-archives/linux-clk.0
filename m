Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24753016F7
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095149; cv=none; b=ZL97kTAincrO4cx6TNulcRGTuu3UdFbn5Dor1UDA8+w8i/nh0W+Cz52yUvnKlLxZtHzysolRqWgS4iBtEtbAIFWN0jxV6uhh8oNW33EzsDTX81HbyvY/Vs8bOaA35DFv7q767mXuwigRe0tfFBbjUeTA8enuP3bNbvbTvAXx5aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095149; c=relaxed/simple;
	bh=IzSLreeQoCw7D4iAy3wUNJ1iSVzNzx0iH6ty9Dq/OUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y46friZoOH7HHjuyUyS+zRCgQrSwhNgLRRBBsAvdO0OOPJmvcg1/8uoi5g1Wzh6JWQRGTEX1Q/xV18ohXGyXr18QiYM2lentOgnQtKV51E4zLDDMJgowjK81EUrzl/lhCqSUxuCzTVKhOemdR/tQZROaKvM+Kllz5BvvjktaAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1+ZAO89; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFqQdY1y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1+ZAO89";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFqQdY1y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xL8H2650901
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A02wTRJ975rFMW2wk1hYlR4W
	67AFtakoJZ6vTYb47Fc=; b=P1+ZAO89p4HNY4NOGL5w6zU8U3WoKSeVxuDNZqIP
	0uPpDwjsF4wcFbaOrfAGFdOeu39VPIqWBQD+1ETLfpRl2fV/ElORdOiqk1sBC0kC
	K40hcj6c9cBU0tTxoWukiQTmQ4+kB1iesmmvT/2Z0fDwJWBwqUyolfGKDzPfETGE
	EitoHvdHtT7IioVn8S3xlWRvHVz7KOSiApQUVdbWqZrcPfhn6AdVsL5u7y7jhYo0
	v1nZQSF6q5Z4OeeL5oz/3GaIm7EGzdYdqCEdUegKzuovfJ2t0IR5HmDq0wb89Dqs
	uqLExbG+UdQ1S42cD8AqYSkpwRnEGyVH/puqFlLqlU5cew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabsfpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:25:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b17194d321so748267185a.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 10:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764095146; x=1764699946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A02wTRJ975rFMW2wk1hYlR4W67AFtakoJZ6vTYb47Fc=;
        b=bFqQdY1yrWpYxz1xmw6vbePMOZH1Bwy5L7eeFZFwwFvyb3VjId+f7S1OvI6xditPVW
         yHFFtQ111RQ0b9UExi5SEQ5C63D91DIZAb2bIN1nQx3Q2GRiLqFcl9XHRgp+398WIjBx
         HE7oRssdZYM9iYQVBPhuGvu6UUQk0wPlnV8fpVukrLMhfLpRra7CW48yw2dHym9Nq/Wk
         0zP8w3Yqd5cGs04yqY6SSEglXoCQzKtb6vDm6d+/x+gWLCendT4p7wu7MekK4js773J1
         jJFe62LQ/ZehVsPpGa/pdDyaeZXodkmVWAlYGQi4ToSnZYw7mHxNgCFwjhjuQtvAalRi
         Uwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764095146; x=1764699946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A02wTRJ975rFMW2wk1hYlR4W67AFtakoJZ6vTYb47Fc=;
        b=LLOtk7tzvW7q9mo9guTgndicaTwHiJuLm8KbzLG+kEwHVePyy4FIG3SiKFsayLJ+2h
         WTpMIpLGxUyyXkvstcUHXrgfuLd4BYs6Ipj39HtHJM4R1arAB2mcxu0WIx2mnSR+8N4R
         7j/UFUC7DKbY9iwvlOovsZBR/Y1jQohaxlXkPVFqbiPXc50W7B+eZRBYdWuHC1epMjEr
         RqG5Vypj2dCFqlt9r9bBA4OOy1ElUmP2tCnfTcCTRqQuW/PSF8T2qzokJ2GcPi44CC9w
         G1wcQP1CF/nn1PY2t9neT+kR/mfJt6pysOyHkIbjMME+JxGevzFRvFXOKyCRhsoy3Kce
         m0lw==
X-Forwarded-Encrypted: i=1; AJvYcCWdWLW6t4HWJo8mstB4U+D+Hzc1YxKcHYknfA5xji4dPoDTMV17+fN49sfD2Yn/J3WMdC/+WTljPaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHnmHzSz8ouvcs48SnV9Z7GyENtuJ6LWRlMErRMsAS8wCh8YHm
	II/S5nDo70IOU2p6/ep+TjmIrRgR2tyQJoQNzji3JYjy49GgzDT8sIuH5b9jbvC8+7Hy3pW3v+p
	zC8zd8mBtf25R0U4LIjySJhh6rRpRTiWAVkDxBlv2qj4NKYKcNDklReHkHZ5qHxM=
X-Gm-Gg: ASbGncv3VUE4ZpS3w+eKgTDwtfkZaGO7q6eFlnWcbka+CpIgzueXcHTxBHj1d/wgE2e
	OMDZsNBZ/7nrT5oTqb1MjX+Y0om7dPZXjVNbrEjHNLlL2Yi2CCzHp6ryk1sl//Ecqc1xMeICwxY
	t3WVfXcVevdLRv4mNr9uI7ci6JJA0E0DzQxsAK6TBbstqEn9uBvGqWKldR0iuPpg3yYtD05i73F
	z07rcKI5MQasRIbJn5QC7o1mYBbB+yiqG/zbNFCbSeF6qRY/exMiv0UZnXb6Cm14Emx+4qE8P70
	GT1c/OFQgFs884s+Gtk3IaWN0WDkKR5kgH/n5h5LvaUo3ag6+7CFtKJ++IYCY5LqzqWfjR5vYOK
	WpXFO/Dm7sWkiA8FMEQV1VEKWhvQY2XbPgMEfOzHpZ9MKYbhrPjERBJJWdAuuwbQuogUO3dMkS4
	C9r6RT3HqrN8UAFANgEq7lxrk=
X-Received: by 2002:a05:620a:4110:b0:8b2:ec5c:20bf with SMTP id af79cd13be357-8b4ebd5221emr513999785a.29.1764095146073;
        Tue, 25 Nov 2025 10:25:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpceJA5GPR+w+PFvq4RhqsnRCcvJZSSoVUfQbCpueCo5hkos/APHsoaEC59Zev2FvVk3QTwA==
X-Received: by 2002:a05:620a:4110:b0:8b2:ec5c:20bf with SMTP id af79cd13be357-8b4ebd5221emr513994485a.29.1764095145565;
        Tue, 25 Nov 2025 10:25:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee7bsm5374894e87.50.2025.11.25.10.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:25:44 -0800 (PST)
Date: Tue, 25 Nov 2025 20:25:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <ykiqrdylblbfgozswsogqtiqj3tdbjrk77kunllqfwf6dhhwrl@tmcnamk55yh3>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
 <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
 <ab4bd349-9f63-4a2f-b643-414510adf8f9@oss.qualcomm.com>
 <a1ab1656-d140-457d-8b25-f2c65c4770a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1ab1656-d140-457d-8b25-f2c65c4770a7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6925f4ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IjlTTp32iJfPQkFbh5AA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bNB2ZJ_3s3eispbzAqSPVzqnLs7UzdvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1NCBTYWx0ZWRfX917NyBw26fDF
 mubi/LwfXDFAzEQGwAs0W/+igdV9NrNZNb9836MeDnLYxaLlSMwUWPt6/eEGPn3R4spofhiYCcs
 gG1/1kRKr712CAMFpZfrLjfycKdcndIpbflLgpXOBohwBTqpK7O6wUxatKJgtYTl0gCHa0t8yCa
 5QFjvnePX2Bbgdhrx55tX4YXJ8fzUrpeJ3mFr1PjWYlrZ1KdMVP6bw6pSSXxzpV7FXdN4PhRRSb
 b9RYoGP2T1HD/RR9DMpsVzdkL/s3u2dfJ4/At4N9Bj+RUZ2sbpzoIXg2Khp1H+Td2vHZf8VFAzJ
 Wu7ZTUczdbv8MXSMVL6DJFrNMRHeTGgGClyLdvw7Xe0i69GM6R7IFOpBnBU9V4Io1nRbDGrwAxU
 PUH0X21xxF8YFSBTl/HcNZu+I8TRiw==
X-Proofpoint-GUID: bNB2ZJ_3s3eispbzAqSPVzqnLs7UzdvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250154

On Tue, Nov 25, 2025 at 11:45:23PM +0530, Taniya Das wrote:
> 
> 
> On 11/22/2025 3:30 PM, Taniya Das wrote:
> > 
> > 
> > On 11/22/2025 2:10 AM, Dmitry Baryshkov wrote:
> >> On Fri, Nov 21, 2025 at 11:26:27PM +0530, Taniya Das wrote:
> >>> Add the RPMH clocks present in Kaanapali SoC.
> >>>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> ---
> >>>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 41 insertions(+)
> >>>
> >>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> >>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
> >>> --- a/drivers/clk/qcom/clk-rpmh.c
> >>> +++ b/drivers/clk/qcom/clk-rpmh.c
> >>> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> >>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> >>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> >>>  
> >>> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
> >>> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
> >>
> >> This got better, but not enough. Why do we have now clk[12]_a1_e0, but
> >> clk[3458]_a, describing the same kind of resources?
> > 
> > I am going to fix those as Dmitry.
> > 
> 
> Dmitry, I have fixed this on Glymur to ensure to use "div" and "e0"
> https://lore.kernel.org/lkml/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com/T/#u

The patch should have been a part of this series. It makes little sense
on its own.

> 
> >>> +
> >>> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
> >>> +
> >>> +DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
> >>> +
> >>>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
> >>>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> >>>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> >>
> > 
> 
> -- 
> Thanks,
> Taniya Das
> 

-- 
With best wishes
Dmitry
