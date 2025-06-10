Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6128DF35
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553826; cv=none; b=CVFJ2nwnD5tlvMT+PpRgBp22D6wIyWnU2A42QNKkb83xT5Lnobng8zeiCpBKYjR0OHFMA4cLUAe3P0jjv3T5y8w2bxgWZftVt4DxZJrkKlRaT4TGa6mzDrOwrdfHGGaJsYbz8/x5vK+YDzAWl4DfL4oGFrh54awX8y/q2PMCsdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553826; c=relaxed/simple;
	bh=r4xPlsKaOiVx9NhoF1ofQO6ILdX1exjn3Eiq1JZUm44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5e0Ci7R2J3QzpJu07Y7LybPtfhjuNBM1PsapOG5pGkCV74wKsS5LSmHkbkz9q33rNkx8Oo6YiyOrOQikAicoJX3iqUIx6xCVo0czm5u5rQ1vRmnCcS4eND7JYcHefiuyrMZoF5o6Oiz2aNEUQVzCnP8bE5eIa+Wj0bqrIc09Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzjaTMyk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzjaTMyk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9MlKc032175
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 11:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hpn/4tPOJNmUak+UQiHyAmjZ
	rWIWVGOHrxMVzXs3PzU=; b=bzjaTMykLG9/dqIxVoTS8I8xZkxlVSxASHjQY0Ki
	DkZ6JRTnFZNakFEVYHaIZUXcH5l5bv1qSht6YxuWMsld9i/YCRnvlw1BA9bEXhfj
	RA1E67McNeZ0EeOZkII/DKRAcQnbphqo59YyRVgcf/w6HO65KDxCIlLB4ytqTaGm
	yap4p0p+0STBaLTWXph8xGkQFalZ1GlUNLiv9RBO4x6OHTRDHYZiQJrcdQ55wbQc
	cgW82MmAmVXnG6cr71QgzJzqI9hcp7GZi/F8h/WgJ/8XjXR+uEAAwyUhaAC7R78r
	ZEqgznH0fXmsJzK2YP1oPWlJkJk+kxlLilEQP1ctGNQ4Rg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv94ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 11:10:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d099c1779dso966306385a.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 04:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553822; x=1750158622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpn/4tPOJNmUak+UQiHyAmjZrWIWVGOHrxMVzXs3PzU=;
        b=hfiF7z1a6MUDD1SpHoHjZgoVO2hVh3JDKJj7AO4xvhVFCwY4n1DCRoeJ2YWtkNrc5Y
         Ct6OPiU6OaQOJ9cyzWAxJjAeXsjWO81CtcUoLEzD+lmX+CL2nPZ/XLoCJNIT1p9obfcC
         21g0lLTCpsYPrOpO6PvmGyjupeaaZWCvK1TOL7rYmqQfY21R5DiMeIfYGFSG/YDwqfxl
         Y8nlQPnvfrVintbmDTk7P9bbg3SJ/BEQTp3H9AgJ4kyzWGMbkKSjjHSGDaDkgxz5knns
         d96tp8jiRrYlQ0p3UMg3NujWiPUcMTu+78A/p27m3lZZYYlCEKHz3gpW7u72WogTuWiG
         Zixg==
X-Forwarded-Encrypted: i=1; AJvYcCWRYDE2823Zd5fFMHfW9PSr8eb0hzyCmOlz1vsMzQokpoHQJj/Gy/+8NJeK98o+73nAQAO06+wsO34=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQDAEEIkZS0bug+V8JtzMpDCRF2sAJHerDyQH1/0G84+U1jAEN
	IAb51aESSwHiNuup9zepLvJcwdkAlZyuGGCGiK8NuONqafmLgM736yCqzsyUtKb6kdQZ38fmyvh
	IFxlWDQ/iUQGYSsET31olv14uIrX2dlUG2PbMxfI8fz1nh0/6mNHBpigo9hAvpII=
X-Gm-Gg: ASbGncu5jkItv3GRD2mTNoSOORcwUjcGQFqNxkLI0JdNjAMJ2ArgCXryQZrt5Zfwed5
	vIJvDNvHarAb5xEHHyHVLkHQqZMapXCff0YxHR72OG6fBp03InaUhCLDl/tiSq06piaMBEcGnys
	EpOq1fUR958mCgRxizygnRRWGin+9HGkLhKvUDm50YtECxK6/qb2uN79QRtZiKQkntoeJfJggHn
	q3t3M9vnVeBVIcsW45kiOCslWF8qH/BBeOjq8M6s1ZZOZOMrmygKOcIKKhDBm7oYfNUpltCZUNn
	jiKIKU4sYxbw44ZI7gorJLOQRFn2wSY8Xc2VVfgWd1Jgu7iPKjjNKlxXtfclQrO9GDSsSVXuPNU
	fEntKZIT6ksAe5+4sgpoKIYrDZXP5BGPSsfE=
X-Received: by 2002:a05:620a:198e:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d2299025edmr2630761785a.53.1749553822374;
        Tue, 10 Jun 2025 04:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuXICBhdrwFurksQR6OS+y4QHN0UrTWRMmZU5j8Di3gdH7KR6uSaZW6QrdFBs18kU8wa1rVA==
X-Received: by 2002:a05:620a:198e:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d2299025edmr2630757285a.53.1749553821987;
        Tue, 10 Jun 2025 04:10:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d00c0sm1512628e87.22.2025.06.10.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:10:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:10:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
Message-ID: <20250610111019.osnrknvff7tlvrfz@umbar.lan>
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HeJ-lvo2AS7TAz8tnLKiXoasJPQamKnv
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6848129f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1kStAPyy7fiUOHsjtOQA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: HeJ-lvo2AS7TAz8tnLKiXoasJPQamKnv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfXyvDtGQmsIqtr
 Y68BhpfXHC0IvmfOKC7DH+B2kIFBkkJl1tLNqtGxpdWJOXm1xS3wZyEwPewYh+9sHmcevu16BJW
 DNvq+ODL6b/anKDgQ29VLfo8jXsvcN3wtEs7I6NsyE5w2IMvZOT1V5s5HPdVv+fftY6OomAeisv
 3FKUNzR19g2a6yFN7/nB8rHK35sJEtSPfyPVXNn71zGn95NFDK+9/IELHnFrCTcQX95ytUiX7GS
 BA/be38gfdP8zRUBmwU3GN6PSOLhGwvs36KFRjeCzdY8QQ/HMCxqKOqWWiWfgbawjGTcZVSaNNd
 KPTS1/iouBvJgAnKDlJKWAl4O0pd1NnDolGZlYTwLP0HBwt/nHvMQm4FQ/L61fF6dwfnFBA6uM9
 4Pjyf8QV9E/gnYXkmnugQzQeGQGENs2Y8XnovHKU/gR939jIDj6d9Pl4UJXAhnn2UoExOPtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
> When USB controller enters runtime suspend while operating in host
> mode, then wakeup because of cable disconnect or a button press of
> a headset causes the following kind of errors:
> 
> Error after button press on a connected headset :
> 
> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [  355.725844] usb 1-1: device not accepting address 2, error -108
> 
> Error on removal of headset device from usb port:
> 
> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
> SID=0x0
> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
> PLVL=1]
> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> 
> Enabling retention on usb controller GDSC fixes the above issues.

Could you please clarify, if there are other platforms which need this
change? Is there a chance of switching all of them in one patch set?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> 
> Note:
> The above mentioned issues pop up after I enabled runtime suspend after
> applying [1].
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 
>  drivers/clk/qcom/gcc-sm8450.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index 65d7d52bce03..f94da4a1c921 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>  	.pd = {
>  		.name = "usb30_prim_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  };
>  
>  static struct clk_regmap *gcc_sm8450_clocks[] = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
