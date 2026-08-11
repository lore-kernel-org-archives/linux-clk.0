Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F018F3815D0
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 01:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786410908; cv=none; b=dBmgfdErY56TdLBo9p4ApCvnlbcYxTwAHvNa2/+A81S1FQ9uMsepq1VPJ5/Rk3edvpqGKRCejmFz+lEhRlu6gfurFRSt+eQuSWFWtJ3eLj8J7RpbUQVUAeuvmIl647FoMCqUziik43cNoiGxTX9q0NWaQOBWXJJufd3s3cJj53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786410908; c=relaxed/simple;
	bh=GueRRaGK153pH2lJbZ8XAdC1P9r2Q+bS3QvQGYSD6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8QYElq9E5Tw9UwDyTe66jyOAPQF0moFg18+SBrXfWgUflaBTtLNPZkR4UKJPwADUanj8+httI1JTAWwnnGkvCLByJUDE3yzSBsagFg3Uig0nZ8TZfiYYG7eysdchzS5cTqOToTzOssXoOwntLulqXvNuH+DLm8lsoYgt4Eoegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Isu7Zsmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Boq5MrXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Isu7Zsmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Boq5MrXN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqOkb3308011
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 01:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GGaUnVMUNJgXa28mOYG9JE92
	ABLir+NK9V0hKydCvc4=; b=Isu7ZsmxeG/DdK1qdM8rQPW5sU18oqleRDKkyXS5
	KK1SIMJwez3qh4KCOnHBbjGXadVXbfzEE/CjtM7/L4ztfGRca2DrCtqYkzQpwB5E
	jf0WqZXFuETpkUD2ZX+1UcoUw6dxmqFu1iTOmXjW8SixqCUFCjeyPobZSxbyBECy
	527CYDKYCj3O5JfqBYwpV6jChtUgPVL7waX2UqGW85h1C42SWzqonwDanul2xPXr
	CHFVtJxoWuUPiXeKwvGN2fyCfk5oR48IQ/Jiq/O+T7WXguMzO/XrcemJIAAzseYJ
	QuHwt27KZrIrh8vF0iKnXtqK+MmxTKbmHUgGpk/on8lWsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfsnmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 01:15:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso4955411cf.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 18:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786410905; x=1787015705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGaUnVMUNJgXa28mOYG9JE92ABLir+NK9V0hKydCvc4=;
        b=Boq5MrXN67JbyUwUfoGbG31wYICW4SE0EFs10HpqdMu/8W72tKG0VtO/C67hT2KIiE
         Ut900h+smkXMKZe0PE5Zd0iRnk+FzhFTUbyRrzGKbYjdw0h7gdvkzYYLrwOV8vyDKqSE
         ZYDcVe6uFWHbCeJWDzL8pVSWb5PLOfLmvWVtLNW3x1fMPefg1O+JdN+aIzzwMV+U91LG
         yxv9GrJDDiT6O/1FL+yYJ8y3gAp89r9p8Q728LGXEyw0YsjC7ShMsZo8XtCeE1wwo0Ra
         RZJN7ctDq38W47rWfgXOUHPxUvHcErs7pQNy6fhduc8/80WlcifiNTVPS/7FQKpCfuPa
         xCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786410905; x=1787015705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGaUnVMUNJgXa28mOYG9JE92ABLir+NK9V0hKydCvc4=;
        b=HrV2GJPPaNM+672Oyk8P79ssMcortD8G4LrW7zUa/WQOgICWSxygTlwM0rpJgLqGua
         snBFeexbQut5PtcHkhUNb39EKWo8bni+z4ivfqCJsOSBfRws2gfjObVb2+p4oifYhJVV
         3nlKCdyKS7XIEo3dRMbfdbjlI9N4D4qAvjbNw3DGz+I1MGVY1W45cmSt7w2dekjFf0BQ
         /EqtuzDXmGaKOh/AdE1lpV30gazY2ps+MDncOMaIsYAJRThTDz/sNyxbo+7GhRCjFenH
         q5SO7djNMYNJLcLqqs5CSFrFCZU63qvKjihWTJozkkPN799mIXlwRT5vhJ6zWO+6salu
         OpCg==
X-Forwarded-Encrypted: i=1; AHgh+RqUYfdtpbmN93eTccdCW+3wlzqWZHJ0Lrpk8arPsujczo5P1/sLDkia1V+PbPLhxoCfzcvkEQcYEzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOXXGy5dngE8JXv7y5I2gEbvo74sAV9n3yyUOH9tpBLicNNqC6
	QEDEmT15IGi2VIrPj6ozSF5wohXxcjySjS2JHi9ZmzjU7LPhzZGRjM37Pgc27fyVShcSYjG4+aC
	UbIxbibGQOhYT5p8mCfUVjgIAHiuSbc7ISRALU92SI4eFYZG5jivG87Btihujd8w=
X-Gm-Gg: AR+sD10kuwNbpr2EOr/HW84Nkdfnkt4hGdYNvUuuIA3hTB+x+Gp5jhp1DSVFJia8xDr
	E+YWI8Gysx/uIVLXXD4mPDWcGmwb4wigLB8C6E0baPze/4RdYIefzyffJSLq+9DLMn5Oy2XYzJN
	6Yc996HXP2Sn6AOUZuLzZ70EskrqBv1p20e5xY4aV9cYuUVo/VjVN6ukdplcvAdKiAWDVqvD5N/
	W5v2nfe9rMosZcKegq8XGrKkNvBXQbMT+BMdedfRWqMxHQmGHFW2Kxh1Y0aELEECRBz5ImoRqxZ
	hpC9RAXeaWAABSNbkE+o6aIy4pH+ef8fU9qd+zntuYgYjkr4pzpeYFTAOiLOK2VOCthVkYjfcUW
	t15IdeymHiTM3V8nW2NDZlz8eWz5B5D80Y6lkiHIXDaeSR2rifJF20i+tl7VsuxQhes6LkdPd8h
	FBWMzLYxVnb8DbNA==
X-Received: by 2002:a05:622a:30d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52d514bf630mr27102881cf.10.1786410905088;
        Mon, 10 Aug 2026 18:15:05 -0700 (PDT)
X-Received: by 2002:a05:622a:30d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52d514bf630mr27102351cf.10.1786410904654;
        Mon, 10 Aug 2026 18:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056eafc0sm2347318e87.76.2026.08.10.18.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:15:03 -0700 (PDT)
Date: Tue, 11 Aug 2026 04:15:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Message-ID: <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
X-Proofpoint-ORIG-GUID: qaED-tB4UfEJWj2EC1cGUCye-0dwFl2f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfXzpRKYQpxi+St
 0BdWs7qqaMr75StSl6VQ6nGx7hbcKhjdfdualAIwniB21zSQAEdLhgSJeRD0toqBP66GA+twzGB
 9E4rhuLzPg8iMbl/kX4Rezl74gEbtYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfXxgB/JGvNTeEf
 mM4E2h+v+75L0RnvEtbAyoQQemh3VEs6MndFAViHe9g8/bBWK/4rt7PZKrsG5dvCUhEngsyQrQU
 WeaXz/STV4WXZx7EcMszMfrcQ736ePLaPpBHQuAjITwE9ISr3Eg4OFoag0y7yuCTyF6NIRG+1yQ
 naiZmfEm6s9qtZb690z0a1ALfFmw2oor88KJ/QNyvG4I4wD3H9YGyKkbPURAJNRlXOdJ51g9bkq
 HZ2oIVXGB3Vvb8M9GVETr/LfciWXGB2iajW+pR55Y629NmTIcKXjFSKvgTEUN6GTa0X1GW7uO4R
 rCz7ZOyr6j9QHgz7pDQUQz0Ys4wIJRkCDlyhVZJXLKTR1PK43C36FDvloVzEIhzMS5dZdzeYlfS
 fIDU613mz9qxJi8UyAHdHdsZoC2MKecZpjiIPUEgtIi8CCi6ocYn2FtyfkIyIvPp3WbHIA9L557
 pmVOBb5SdpO+L2l0R1A==
X-Proofpoint-GUID: qaED-tB4UfEJWj2EC1cGUCye-0dwFl2f
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7a7799 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=SI9sQr29kBuAMZg-vOEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110007

On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
> On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
> > Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> > assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> > hardware.
> > 
> > Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> > wrapper for its debug UART, so this assumption no longer holds.
> > 
> > Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index fd4d4ecd2df0..5b3c9d31fd7f 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
> >  
> >  config QCOM_GENI_SE
> >  	tristate "Qualcomm GENI Serial Engine Driver"
> > -	depends on ARM64 || COMPILE_TEST
> 
> depends on ARM || ARM64 || COMPILE_TEST

Or depends on ARCH_QCOM || COMPILE_TEST

> 
> >  	default ARCH_QCOM
> >  	help
> >  	  This driver is used to manage Generic Interface (GENI) firmware based
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
