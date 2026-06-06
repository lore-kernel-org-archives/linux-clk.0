Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8BE2EEE99
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744666; cv=none; b=DodoacypxTy218BF1jaARwsFxjLJVRsB1LMvEFeBlnSm5pVWE7e1pLQunMTW14WUj4godacBpCbbbfOaBAf3DvQkRFbxz6QDWYgvZZiGhmW3O6VCLZN8pwf8OnUN8q/drA0gX/nhKiw+xa2D5U9oyHUA4k2UMvJtqpXe5K3HwzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744666; c=relaxed/simple;
	bh=QtS+bU0HdzQifrsDgjizrZ5jyMryQB5j+BJSEX1oMFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dETMSlqkumZvyIqOpmCaUsGnOHa0KSZYj5uoZULIjTbvug8UcHKcnkdOGG6spIvHTaCjMhmJSfHdCjQtLVtFWPHrvCntPqNyIujJdwmuIxaWv25ipHSgJIgrAeNys6zEmgPyhTL8/+j5EWQ+JaxjkdG+tq9W03fBjDsiSkUUtyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bioAmOkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvJD9XIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bioAmOkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvJD9XIj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGh0a1291148
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cLjQ9WvxzzZPujHqT8NeOomX
	yT9hmfTusim6k1vlBJY=; b=bioAmOkNJqEb+4L3gf3PY45LneEOp437CKzpS3Jf
	fKtaLvUDw60bpjGzaSp3RqQncM+ZceyCA+7XIX4GbeHjJFuaNY3WptGwyR/i7MFg
	qAIkSc+2AjgnykaSdbqMmCPGfg9xycWfF0QoGhTdE6Ju0xjV40Bdfczxdb5QhGsm
	Z1/bph0aJmkBuvDZwYHI2QxQZLF0B0aliYwpWHNV9DvcvF8UupPpianNlsUuLn6O
	wWdGTRLWYmz2/tv56Onn1ff4XKm5q6eSKQ79oLwMmHsCESN8O8LplhAybkL33hSS
	fseS3t/++1NnoX6ntUAp0iJQr5AcjWz+HjhKC3gwMjNIIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmr8xb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:17:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51775f7b2afso73799481cf.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780744664; x=1781349464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cLjQ9WvxzzZPujHqT8NeOomXyT9hmfTusim6k1vlBJY=;
        b=fvJD9XIjO2MBcgXtYiBAhgc97tSO8d7DVDi7d11bqPZTpLX17qx7/i6YlD3wYEpq/N
         pWaewdJtAyZaixRSqJ9FwOfWo2qINN2HgAdSbPk2avPPGd/abDxPjlPFwIdIwDp47LeA
         EPFCE+oZ8MOqAcYit8cD+TGKOzimmWw4C5QE4qFs8/0dMSwhahqSRq1WYkEcgqRSZQ6m
         lwPfRddmwmgzy2vpICFMuj3zsOFV+sbjCS6U+ABdh0aPIuyfaJ3YKvjNpOFVVxsEMyZe
         JTXv1if/iT9u2Phu+54bx+ahsCWEbmAjV+j8nWtyfiTFsV/CceInOOSyineSWWOsg/zn
         BZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780744664; x=1781349464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLjQ9WvxzzZPujHqT8NeOomXyT9hmfTusim6k1vlBJY=;
        b=iUIeCfJb9Qr+FmaFwQSjdjtd2yT8VWJTICptsGR9S4DJVzorPsnJB6lIQA7+gczeob
         ecTdQp9X+PoQIQMu98HNHdkBuQrhDSf+bAdjnWv63sAcgUR6PERU+DoqWoRcG3PDMGBB
         qA5p7Q7WvaRSUdWNbZkE/9mLEWN5A2/El/jaxeVdI2HRv7sjeVKk+JtW9+22e4UO/Yo9
         MWwFt+ir8qU6z/Ye0ylycWdBLW+j8k2mc97EpIJLqQ4ZCjnP3ilCpQT2MSHQAEu44Xb9
         pCN0UEb3pUNnfTfjq5ISmkStchLXjjoZYUHvVmo5yAhOwhI/xSx37iuoFIP8SoWaMZ5R
         vPAw==
X-Forwarded-Encrypted: i=1; AFNElJ9odb6d8im5ONkG1iWrcygwX1DUjE4fp+p9oKLVOELTsWvSAGZjWKfmu9ZRTyTUJAT3IWr7rDQs0II=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJP0ppkLl2uOpKbGq4Xc9uacj8XGOMAFOh7oUijzqt5GvwD5He
	O8CThdqgOI81E6pVps58VXHwGNwrzNmSuw/JBdSHkSnXgUU9sxpiLH4KIF19CeEJT8gg8Ve9qik
	5+prcjIfdwqAEjRzUFbFB3hb5j9P3pqmTmwWeV+3YU4jUaNPIcc+u4Pg24S9PN7o2M36HKSM=
X-Gm-Gg: Acq92OEz0k7Qkb8tIV7mqUbk5LCnIdvBjx3FwWQOWan1eWETNlP9kfjT8P8hHzlCL9h
	6m8/tyzOaMuyaRDJtaI+bSN9OKZKPGINnOHghlFQsUjn8hfO49Edi8bq4rPonLj65Jz4Mbqvvth
	JoIY+BunT0JHD2bc6QQHsfhGUTePhe7e1qG9sA/8qX+UFsgTONEUDBJdiNnibydyzqKvqowpw+t
	tQ5ujZ3EoI1FZ1CswHiOrCj+oIeetqZfxPEXyskgJnNVQSw/sy5A1LH3mOC3gtOgCdHzIzQa923
	E8PVtgVrsCwv1j4cZjYYuZlTD8E0woV7wFcoCb+2W3d9j0WW1D8qg8+uRaPx9Die0Sho6bgfaxx
	ui4RXLKIiBNN6jp1nq61hoxFzAjt5DfZR3KaK4DwwcpBdXB/Dw0Ns/CLfyN5E0Ga3O401PUJAEE
	o927R53ZTwfFGgW9GDxW0CYdLu6eyS+gCh4Ai1Rf33Xr1aSg==
X-Received: by 2002:a05:622a:1982:b0:517:896e:980d with SMTP id d75a77b69052e-517988745d7mr66369211cf.37.1780744663714;
        Sat, 06 Jun 2026 04:17:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1982:b0:517:896e:980d with SMTP id d75a77b69052e-517988745d7mr66369001cf.37.1780744663198;
        Sat, 06 Jun 2026 04:17:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d503fsm30608431fa.34.2026.06.06.04.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:17:41 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:17:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
Message-ID: <o5k62vvdprueqgruk3qtkugyzvnqtba5h3wjbpuui6pvfytcic@euzvxdlmrhri>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMSBTYWx0ZWRfXxkqB8K73IkkM
 ltQDGg7ld9bzTI7pXYzEPDVolHv9Jg9XWc2bHiN5aLV6LUvRUWKtoftHz4NeusxuvxX4VIwAu1y
 nXF1HlvnzVvFJisfNA+Fu7bAHLHC2mVH7gQzZ9jdk5wRNDYgIEeyi6dBfMQpoMNeCD1o6PrtXMl
 2eWNEa9Fy14jP1S+SB5gLA2FIB0+Ly4ldCopT13OHgc0/BvnJhRt2UzuVgoV2n1JXUu6uSt59az
 uDvSUsIfSwkoIm4IKMUXOhQFpQ4fGM5a5AoKyrF8dkH91mjuNDHqCezHrBmtKkocIikHyaV1p3i
 KsJp/9mFhQQ4lJ7fqq9MOTq67x3KmbkfKwgz55z+u7Z3P+KlqLsanW3U7i0B86xD69DnrUfmX02
 YsliYEznw0vwhxchP9YoM3VbRSHBUNNAW8vNL/oDR7wlM4cnEsFcL1eeWJ38cB0PdbNSSZbSWs+
 mCOmsvZVWjyY8HsB2fA==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a2401d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=20KFwNOVAAAA:8
 a=X9BXxLd9AQfZTjhNIisA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ASUOQEG9Kd7BkIdxrgG8Qx-sNRrJuVV4
X-Proofpoint-ORIG-GUID: ASUOQEG9Kd7BkIdxrgG8Qx-sNRrJuVV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060111

On Wed, Jun 03, 2026 at 10:21:48AM -0400, Brian Masney wrote:
> Convert all of the qcom clk drivers from icc_sync_state() to
> qcom_cc_sync_state().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/qcom/apss-ipq5424.c  | 3 +--
>  drivers/clk/qcom/clk-cbf-8996.c  | 5 ++---
>  drivers/clk/qcom/gcc-ipq5332.c   | 3 +--
>  drivers/clk/qcom/gcc-ipq5424.c   | 3 +--
>  drivers/clk/qcom/gcc-ipq9574.c   | 3 +--
>  drivers/clk/qcom/nsscc-ipq5424.c | 3 +--
>  drivers/clk/qcom/nsscc-ipq9574.c | 3 +--
>  7 files changed, 8 insertions(+), 15 deletions(-)
> 
> @@ -249,7 +248,7 @@ static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
>  
>  	icc_clk_unregister(provider);
>  }
> -#define qcom_msm8996_cbf_icc_sync_state icc_sync_state
> +#define qcom_msm8996_cbf_icc_sync_state qcom_cc_sync_state

This patch will need to be reworked after adding a check to icc_hws. For
example, the CBF driver would need to call both functions manually. It's
not using the qcom_cc_really_probe() anyway, so it shouldn't use
qcom_cc_sync_state().

>  #else
>  static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct clk_hw *cbf_hw)
>  {
> @@ -258,7 +257,7 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct c
>  	return 0;
>  }
>  #define qcom_msm8996_cbf_icc_remove(pdev) { }
> -#define qcom_msm8996_cbf_icc_sync_state NULL
> +#define qcom_msm8996_cbf_icc_sync_state clk_sync_state
>  #endif
>  
>  static int qcom_msm8996_cbf_probe(struct platform_device *pdev)

-- 
With best wishes
Dmitry
