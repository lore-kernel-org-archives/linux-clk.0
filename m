Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAAA2FFDD6
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745523; cv=none; b=emqYIQ5UIn7FcYbtdQ4oFqyI5k9l57rFgd+KhzQf1p1AuztTuAI5Q13KHujtGC9/vQ1msPaeSra1FyofGGouEozkuMhWqD14BrtzUOk3+IAPKrrUsqlN3pRBd1ZSNg+r1boEa1jxKgyq2wZoGu6NAI9/bFof1cwfS2v8L0VheA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745523; c=relaxed/simple;
	bh=qzKzfJNwhUcmU4gTj+upXOKBJeFWIsGwBWcoGZfnOuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzLDTOS594Nym2u0aodZaswaOswFg6WekQYv3Kt5eOUoZKcMRGBoxUogRQbwrhFW5f4dMz2NvXYrEE/J59vzZwKBEEgm30Nu2xtm6VXT9b/XgsFCZpH0muJR/uxSvDc7UsD/WSe6UHssdAzvArSLe3fIsue7LFr0Rmpicblo9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRM1kJOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOCwKpVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRM1kJOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOCwKpVF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDZNj1279183
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BsN99lzTPiEul/ZpmdaPw+E2
	/yyTMZ0opEwuAf8gkRU=; b=jRM1kJOBGeMRvnW1jkSBKYnf3geD/V/4NuA+uY1b
	YVIaXbBBzMTm2NOENtRu/xc0F+ng6WIIHqIL+PHyJdeVO27dY39FFrC9dS+pG/wa
	wDuvusqzYb1tm6kByd8mfxDH6urtIyv3+D51kAhgiJO58M3OU9apMHr+PauyeWSm
	FKL/jWhQ+hBsVPFgvwochw2lErsC1OmXhtOfieq550xIca6/0cmsHwNqrFi5x32m
	qouuhsC/7tEBrQUTWO9ZH77VyleH4pZ+hrH+Yds/g9rw18bND5lsQMFs4M28SWfy
	2Mq1hAqygO1t74m1pQDmJdOXxlgNE3s6pziq4Akj2eLRFA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagr97pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:32:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1773354e0c.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745521; x=1781350321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsN99lzTPiEul/ZpmdaPw+E2/yyTMZ0opEwuAf8gkRU=;
        b=ZOCwKpVFii6zR8VcUNw2IKNQ/flDus+L9fXMx8p+YDtJ6ZkZw4CYGzu9OaJcExKBov
         q22K/6ld/77ULbenvLFZdvtPGYwHD5yHBrBusYbaxSip0r2KVs513mYTdmYiD8LUKHv5
         9KxV/LBKz/LeJlbTViSY1k/JhlX5AUZ81QKCL4fYom8ldareQPVKgbkXKgVqkXqWBE7/
         z+wyi/4/9jB+EOXw7FXASfU6ELB+5we8MKVY3Tk4kzA0yjhAtO3wvtjE6xaAz6+Ye7eP
         Pi/rzQxjxtj1fAk8y6PuFNhDOrz++kALJuMgixNADhPTrZEBTY48UNKpGhw+kmIyc7eu
         kvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745521; x=1781350321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsN99lzTPiEul/ZpmdaPw+E2/yyTMZ0opEwuAf8gkRU=;
        b=Ze/qqLRbz9vSKCJlih5l0UP5WI1MfLPQs4seG4/+D2Hh29fCU9d8Di4b9j9Ne68Qhj
         v8mswEensb4K5VMV0N0Jg4EePaH88iNb0KoTJxtt8KXRzCxM8RtziBjXlKxJdQGw60S/
         QgnuJTpiJKhVbReoC9ndpgWn0FzOkSdne4HxLEO/SUxw4q/kOriWTG0WjLh/0Flkmo8G
         /rTnFu1snjwwzCYQ30CZouF6qAm8ds7nM2Jcnk0fpQFKa0GdE95iQ3z1q8OjW6QPyuR7
         c40Ikt/cfZESh4+4+JDhq49FNKrjdUxoo3pFB7us0r6QS6sG1jY/NAaZe+1O0G0FKnJJ
         ZdXA==
X-Forwarded-Encrypted: i=1; AFNElJ+BNhl8gEo7gs58zPxTg3n88IFTL2t9+GmzGDXyw4lnb/dzbTihH+HKKn8XYd7sHq93A2p5k1xKE/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOUOmKXrgpib6P/4fNYwNe3QxTkHkmgxOH5lPbVCnK5PiK8kZw
	5Jr5vW4j1ZKPQkJO/8UHStCGNR9+3GViyg0I/sS6LwypMr7raXl8KDgp8Q7olA1XFARnqsVWmGv
	Kkood04kDNk79z8jL60PqvjY86hAxPM62pHGVaYQq+/CTDr7bjBs+MK+jiRsRVTI=
X-Gm-Gg: Acq92OE5GKq7FhB+c41RdbC4lRGM/twdNcMmFg3wcQY3N0iu/+KgD6BtC/6DsQ+v2Dl
	2f+biEBgSgh+adRhozAqYQshNZ4bnPHBpAxt5pbgCH2AFEhxQ3OsQoxDKXuZavlM/jgKPZKUEKX
	8Ww0L1oCnU25fAsqXetqbciOKWG/3oqUYUJ0Y6GB/sGnlIkyqyEOHI2A7ahqz5eLGd8k8T9QCSX
	NNV8Kgqd2FsiCLQiB4zSPmDT0Dp5keP5R6O41/A/LUSK8UbI9pr1QGINt4KqsFxEMHEhNSnItAc
	oIqLK3yxy6Q8U99+eLiO50jgfUhfSiyfxAQNw7ufIxAR63Unxn8Klp9Fq8muJenGaVg2Wi9KRQC
	cFz6RLf70j09un3Dktip8Dv+Ey5tGED9pBA9flCqX8oVvkvXkuTbIoZ9RfOiQ7cWb5RaK7CHPYA
	rtoUuD2zfOFThrISKn/C4d8WNWGxJZjZDycZsvDvJ0dLbcCw==
X-Received: by 2002:a05:6102:80a4:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-6feff81b7bbmr3588580137.28.1780745520787;
        Sat, 06 Jun 2026 04:32:00 -0700 (PDT)
X-Received: by 2002:a05:6102:80a4:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-6feff81b7bbmr3588573137.28.1780745520387;
        Sat, 06 Jun 2026 04:32:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9929cfsm2415672e87.75.2026.06.06.04.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:31:59 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:31:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/13] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Message-ID: <aqthrh2kj4rerszww4vf4gp5f2f24wdreld6ot4w4kmzujemya@ftoyzykhkzmd>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfX8teDZuGwvuuM
 pL7FHSAr2NQO99AO6W2y/ewnvNQnIM9UQ5tGRGyGtIgkVEXyLSFeFPiLh3vvK3Q1Xeadt2yNira
 L3iMyGcomT2Nk2cGMzdMUmH449SlViIO2vf3/fPjj5rOtscKDN+EqLJzvefPslqwpwl5E+c44UA
 4QZI2NprtzWkgW5uwya+WgPaUaUH5OSTEfgfukQAEbpxY/4yUNPv6gHPBPWxuq7sFVagEVx4WNV
 YoDKyXMpFoD3p+LK51OUjlYWaUvGiUSqL7LI2lmA9yWO35OWDAEJEBfoVl3ICLm48lNsssROOav
 cC28i0boeouy6g6sxMRaytwyfVL18NVDPN2uXg30Zxi8GqXKzVFhzjpSe6yDace/ksC4nq/QMLH
 zUUidu4H6yxt3Yy6jAZaykm8956ebXPyBIlrv0wPlrxlOoX4jnVgLIriuGlu0zhawSLRxjRx39q
 xZftiRToGzZ7wdFriNA==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a240531 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=244XV8jIjgl5S067L6QA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: TCsX6-YKKxt3FJ9FoVObrqWTmTRr_Uql
X-Proofpoint-GUID: TCsX6-YKKxt3FJ9FoVObrqWTmTRr_Uql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060114

On Thu, Jun 04, 2026 at 10:56:17AM +0530, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Hence add support for Shikra
> GPUCC by extending the QCM2290 GPUCC driver.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
