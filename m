Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B722F1FF4
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528669; cv=none; b=nmrM1asxD8McPr10MV3mKsJQl8ifDHq7gSdb91gm2z2Tjsc52kVaD/flULsZd7giB0/2IBrt+YLJ4iucI/0QlPebqXr0Vz4OvoAEz7LtrQu0ooKZGZzmT6e5kWPwdOWCOqoPcPUxkoxs72kTqOtepVkotofIqi/UrUfguaR+z8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528669; c=relaxed/simple;
	bh=UEnZF331CsgXJwwFeI3HufONJrEKbDvBmT7uOVLUG0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOoehln+qBRUbWX3PdIJHaDie2W34oIDUZXTs9Hjz0bFbQvt9fTOVIwaXP3D5/RIqwia+Qt+2Z6w7pK9p1NR2u1v1y1lJRt3yXC54CWbGLwH+KSzSj71arAVDqbyh5hrXR9dKxAWYTOs3IwfUYcDlC+7KGTmLYUybGzAWywrSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDmBt9WM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOZdOUid; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDmBt9WM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOZdOUid"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UB1G1430682
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 16:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FYJXR7Vj/iJOr5VO40dA1IKT
	kKe0B9u9fRBgsMHKSoE=; b=LDmBt9WMbGw9sw/2KlRhymVsKj/mgG40TZDP/8NY
	5JVyk11bzWAjDzWlw9fa4odGrr3KJOVF1mPB2BZ9UO8+b6CBuIj3+N+UoVDYRklT
	A0HVZ75AlqcYJZlI9qyIfaVYwlIkLv758dyG6WUS0qgIfleTyao/3wi0hpZNguCM
	+oU2fUDQe2hpUeSEperQbnImKkcWh2TYVa1jveov17Uu5MdOt3QoDoehRmU+nHuz
	CSPjEPRxYusObVIut1hv2dk5acmkQtcsPmOQYkFiKyN+MAwtLWoijjnQ9tYz1otk
	Q6Oqkz7Zmzdlj+JRy9X1IupD/WLx3TiHXKp4pd/8W37K3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21uh27x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 16:11:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d76f460b2so47164761cf.2
        for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776528666; x=1777133466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYJXR7Vj/iJOr5VO40dA1IKTkKe0B9u9fRBgsMHKSoE=;
        b=EOZdOUidQGCgh5DgnMchCvQtGrdPSkuNUpXww+zp16KuSHZadF0nGpSUJRp3kemX8c
         vhNugLKLBUn6Sl6zhrCo1No1niQqJ3fopXI1hg93d+bCmLEEjIRcbDec5lCGJTPhQozA
         M/T85pPyC0rZurjdR/sqRc2JphQ+pyBNyPByetQ5KIZW0FejBYZrwQk/MvjPT4+Ba3xu
         VR5jlQjy62Vp8ibGxDk0qMOpKGXbLVXDwXg4mShIdxB09uP7NQjFmHbBukuIT90Jw/CN
         sxc/Rziu5S2qZ3tkM74jiQ9O4qmS5Jq770QGbmou6HSXxGMuq9FiIv7WMyHYUVFf6QVo
         mt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776528666; x=1777133466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYJXR7Vj/iJOr5VO40dA1IKTkKe0B9u9fRBgsMHKSoE=;
        b=X+qtqm8wFCb7qeh946YtncSP9/32sxJVNKNLx6xeF/ysLgY45RJCCKBXrNxI2l0Lld
         y89AXTYD1XSZrliFDFraKtpFYK71T3sO2NMkwOv9uok9IznPNrSmGKYhr4VSfLOKwmEK
         Iq9ZHC8yLnSHiJS8xYFIe9YzorxP76dwhxSxiXxnqy60jw0neKGQxtRb88wvkrPINvIx
         wqTfuOI8nQqg89ag+/h5mE/lyorCzu3T03ZYVu6CjTUIDoufzoSo/+MbH79JHREGQ8/X
         +06ahMhG8uMqAhIkl3ttrUIyzGfZOpSS3WOpP+K9vOogeDhypVqGQ5YDOdLlK2/X8mTx
         woYg==
X-Forwarded-Encrypted: i=1; AFNElJ9b/cH0F+zmkI7BjTpsZQ77Yi0xuwx8Ad20K6mlDZDLPGUetwQPddjzPWPT6vs+ntYoiS+0nBKNtb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0qKs2+nYhTUTkUCuHZTMDwm6rr9wsgirwyrC4AmK7oOSN0Vww
	Qe1Qwo7EIZztGcEoZ01QAmOfQ2ZSGWR0F7d2P7w9k+/xc3zZrmkW5XMDFU4vTN7BRcNvIIIQRPS
	6ql8ptY6gEnGp8giLmcKWkqzZLxgqjUtzWxKPOMsGya83qs458UH2r1ELGV116Zc=
X-Gm-Gg: AeBDietLg2PQtOydCAjBYKr+86hRS+PrvqwQjyD+78EzWaSOZk4B4VVAOkztxhkbTV+
	6F76QGt2DAZTWP6UngvKhg1K4I8jHqml1wIszAyL5hnIr1DC2vqU95Aa58KlPLDFUUUUsEHhHql
	53uacPVegpBu/sBnq6PwZG6H+UxwiwBl4C94iRKm6Gaqr2HclEst2Omi+wnD+alO1HigqMvLh0S
	FsrVinOdXESeOxY4o8pj4BfbC6weeV1qchkQwWxBNw+yUJGDwu8JPeqqiKngPa4mFypD9ljwoBt
	VK3FEnArRlWVmAWvImexT9fhXaXl/g+/98zpiQW3n4XmJYlk3W+WIUuXdHmn8jEMM4jSXQORQKH
	HoGN90/AArJQUFQ3XW72oY4tz9+Ayu8H2bE1JNggxjXuI2gHFbK1EaQYPC1lNIZjnkkYFprblHs
	3Yt+No00o2tVDVlV8/p2rAdCQT9WU3P6uOjiQ8PJPD38mk/g==
X-Received: by 2002:ac8:7d4e:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50e36b5bae8mr106235731cf.27.1776528665885;
        Sat, 18 Apr 2026 09:11:05 -0700 (PDT)
X-Received: by 2002:ac8:7d4e:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50e36b5bae8mr106235441cf.27.1776528665507;
        Sat, 18 Apr 2026 09:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c88adsm1464383e87.35.2026.04.18.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:11:04 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <rnpbdbjlpx6wemeuzsm33njmnihhli6mvjzhwu4m64vpgbxait@7pnk2rdt2djk>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
 <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
 <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2MSBTYWx0ZWRfXz7sa3PQRydxi
 GQqZdbMullWUlDI1msRRyXzPUdDxl1cmE2Ww2JEXTBMcPpZ3Il4+FtaAjmSbPFXs4wLf63q1Mb4
 JXTDq7fXUWKIV73F7XCKLn3Teqa1P1nF0UtawmtWK68zrNIfbJ1m1uUV9Yj6c0CXyXhrlMPQpRr
 i32iW2mw+zpekzUvG1bON1vwzniIVcGqPd+t9YiQFw3qHyIdi70T9P541drMFeVsUg2bII7nO4F
 2RxFjZ9pnBH6QPEGqTbI3L3kTXAR0o/fqV4YPUtA3ex5854MITnyIa6ghdcKvZEgLZEcTfB6yZi
 0k+p2rAyDOmK4Gnjm9CH5llVTNw/ylRx4FESyHddiLYvJeNLWIKxtL0YVRwgeBI7SSw1sTeO25K
 WYlxRcZokDCLvJM8oXHbfrIYUjVbteCEMSpVTWd3lWLU7i1g4mnNxI/AoBPnYT/JmiznIp4apsA
 BXueRHFDz+Rg3dkH5QA==
X-Proofpoint-GUID: yTKetQ_JHcI3labKgSdklfKzKMM-PHYF
X-Proofpoint-ORIG-GUID: yTKetQ_JHcI3labKgSdklfKzKMM-PHYF
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e3ad1a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=wxLWbCv9AAAA:8
 a=wPxmQtTReXDiQBvha_gA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180161

On Thu, Apr 16, 2026 at 03:49:33PM +0200, Konrad Dybcio wrote:
> On 4/15/26 5:20 PM, Antony Kurniawan Soemardi wrote:
> > On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
> >> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
> >>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> >>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> >>>>
> >>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
> >>>
> >>> This doesn't quite seem to be the case, some fields differ and
> >>> apq8064 additionally has:
> >>>
> >>> QCOM_RPM_PM8821_SMPS1
> >>> QCOM_RPM_PM8821_SMPS2
> >>> QCOM_RPM_PM8821_LDO1
> >>> QCOM_RPM_VDDMIN_GPIO
> >>
> >> Ah hmm, the MFD driver seems to provide *all* RPM resources..
> > 
> > What I meant by "clock descriptor" in the commit message was
> > specifically the subset corresponding to RPM managed clocks. From what I
> > can tell based on downstream code, msm8960 and apq8064 seem to share the
> > same set of RPM clocks, even though the overall resource lists differ.
> > 
> > Is that understanding correct?
> 
> If that's struct msm_rpm_map_data on msm-3.x, then I see that 8x60 has:
> 
> +MSM_RPM_MAP(PLL_4, PLL_4, 1),
> +MSM_RPM_MAP(SMI_CLK, SMI_CLK, 1),
> 
> While 8960 has:
> -MSM_RPM_MAP(QDSS_CLK, QDSS_CLK, 1),

You are comparing 8x60 to 8960, while it should be 8960 to 8064.

I see that there are differences, but the QDSS is the same.

-- 
With best wishes
Dmitry
