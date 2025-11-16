Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2F22756A
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 11:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763293136; cv=none; b=ep/95EIiDp9VxZm8SWd+B9BjzIe52pX1fUcla2fHHejDbBrrHlXjSBkTfWKC6VlTnOD7b37H155bO/UGUyum9xdJ29WOhdI9/AF+Ho1ni1bHaKEl1b+26v2AIuzCWr61v8KR/khAQFbswYAdvuq3eVLQV9E/knS9iyQSBe/dJZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763293136; c=relaxed/simple;
	bh=UZkZxW6oDJLp+w4C8bfan78Ipn16wj0YBwH8H8f1BLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awVD41jK79y7KSQFgpiDP5gITJDJf76IebvAAkOEw15ytJ4foI7UMs1ojXJe/noGE18wRFU6UguucGxZx8hmzIcn6ii8yi3zfdCYvfZ0HeFzV40lDYY/HAmz19cc4HqEXzzjF2UrMuPpIWF1yscVhz8pi5B7OKFsHLi5JZABudE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MorxaGdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWMccUOV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MorxaGdu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWMccUOV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGAkEeg434222
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 11:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gpMNilTiqKZvFerSznNOMiBk
	SRtg39dU1DzYkv9O/M8=; b=MorxaGduOY0TCy9sMgYn8YWDPVfCfyM3zsQnT0cX
	0h3hgtsxLQv0r0zLfLPOlWKSqvsoh+9u523i+0GWKT47EjggrN7c13PKq42cnS41
	c2I1HXJHXa+gQOOSE1oh6tiB3jOCpa2fxMW/VFCM0+ZSH1lpN67GMDBmZgbCrsvM
	jVie0+7KSYAQUdfBDN/1MDrrrf0q52w00htKo3fx8JKJfFp7wKhHdFI127oomGMs
	jtzv66WCzI2MIViOXVNrQYZatxOZskQY2LuYr3KBQrlRjNZftN/dwkX4Lcw9mtVd
	Eo1Hsn+jtSHL3GLgwRiy54AvJZX/KIKXIqel66pGDeqmeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejph21vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 11:38:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee205eb70aso352051cf.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763293133; x=1763897933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpMNilTiqKZvFerSznNOMiBkSRtg39dU1DzYkv9O/M8=;
        b=WWMccUOV+SMr+huHLz4u1wI6mKUiIDl6smYOvMaxeqveyZ3G9DdD/qIFVvBqztQMsw
         dmtpdxy54RR0MIRbQ/e+JSpqoDvBPTr62z/xfC7mdLakecJBiV/qkirH9TIRGfknOOXw
         eHovPUxU+/ZmLBFM3vtNByu+FBV2qMkkIcSbkEdCy8MuShgZRx14+L/TtAP1IlraYIfp
         e4bJmh+wGsHrfmodWoqRS8JiboxCF/HTI2wZmNLZUibWfZjJ+ZNw5KQZqTqiA7u0U1ge
         twV3FytdFRMS23OiqLKTr4CFWMnW88QOT8/A4wwkbkumtu63Xjjd8L7MuOw5OmqnJDLC
         Gwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763293133; x=1763897933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpMNilTiqKZvFerSznNOMiBkSRtg39dU1DzYkv9O/M8=;
        b=h3q6CvsCroS6sXgL1qQjaVSkIc8mUrjp8abXeaM1MHJlbueN3nk/3zBWhTLGlZuR06
         vx3NH1CRvzzqiJW/scuiBrA3q9ZJRgvzevHPJ1KEK1P6L+ZJkZ4cJK8rPe0yWyHTYUzP
         1JfRFidXacr0u4OPRbH2hoiR7tlgGm//RbXw3gHc3qOShKUXk+PlZIZ/Td7jOkV9qhiR
         f5s3KW44GG3JQqgE6Qe24U/MCEz+f4896LCB0Rf8sp+K/ayNXE9RoWtuKOVv/EZqXjX1
         Jh9lSbMdVJjC8M/qpHd1cZn+gBYkfVq5LBtbvBRFQN3388qfdCfR1VMzUwF9LttMUjOH
         NyVg==
X-Forwarded-Encrypted: i=1; AJvYcCVB6BhrBePsnyk9u6WaHTGxfVtS4+SPKGV2zB35VFbGBk9o6m3sEAOZkY9ONNXkJWPldNJUuRXfu9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLbG3kx4a571xFKPKaEAdlbofNHBruYlMdQXNV429Eho2Vi3G
	IV26cbAlayUZVvuvQr3hKwpoj0PX5QAjrVWl+IJnCm7sgMSWQZa/o6HRwlWnLaA6hqxtDCFJH+E
	/WBboGrjgUzlX+JBONOYpsTzsu/YFObPBFizRlc17Rxt2XGs3IJ9KgG9Tnd1hjiY=
X-Gm-Gg: ASbGncugWV1fMZnqgnXmfzZKmVtlC9winrW8OLK2mq42nYSReGiDyVsdrlkcAKsAYei
	ky8FmvcrWbVsRDrl61MYryyAwVSmrA0VyBhcIqZNurCDr2EycF4M1HKFGCUy/OhxfePEO2N7qck
	dejypoUU7tm6IQbdrNleE/CdElRHR9HJxeWPuhjAltifEH+DCHG3snf8moTiGJGyBnb6dnpJtMx
	54KiLoHC9ERIMRw2XXI/k22yXuOb6HHRfu+5wdXFvRWfaQ3A0z9Tx+Lca6SCj/eHTKXndCRAA1J
	Mnt0M74BDIZ+EQFZYM1FhUBC0k1GGnEsMZblrL8K/Ls/B1IXecXFdBqBtnz7rXas/b3LKP7qOFZ
	TE0wfweYoA0ZKmb9CKYmCCJmMRjTMEppcJ8otTZNFFfAHmBOncSRaq5992LxcbirFxnkh5NK4i6
	tMKFYrMNzLY/5v
X-Received: by 2002:ac8:5c90:0:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4ee1365bf2emr37920291cf.9.1763293133613;
        Sun, 16 Nov 2025 03:38:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0+9gZPhHgtYyt7zLD6HaVCVgBxPCKeg233JhdH4Sb2vjhtKBMn9il8vin0Sn3yAQM/ExGHA==
X-Received: by 2002:ac8:5c90:0:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4ee1365bf2emr37920121cf.9.1763293133096;
        Sun, 16 Nov 2025 03:38:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804057b0sm2301873e87.85.2025.11.16.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 03:38:51 -0800 (PST)
Date: Sun, 16 Nov 2025 13:38:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/3] clk: qcom: mmcc-sdm660: Add missing MDSS reset
Message-ID: <iqljxclxt63ncwllj4n34inffb2bn7qidlj3tlupfeqo3ltbob@mfaf6nbtvevr>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
 <20251116-sdm660-mdss-reset-v2-2-6219bec0a97f@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116-sdm660-mdss-reset-v2-2-6219bec0a97f@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDA5NyBTYWx0ZWRfX6QGQGQW1Pqdr
 S+Y7SZIwCh4vcCngJq1kkcsffVstU6qougRs1prTrJ2MQ6xupl0HbK50kr5WcJ97Jbf3Gm0U8mD
 sFXosIs+fpGyEb9gH6QTdo5r+7Rz5RV3csLx+29lpxsmJ90QwvPcL99bH+xh91d81bJySLsB/9g
 5oWwEKuA4j9DhdB0XK6hapG9OLhMYY6oUg4xieOFtkKnSnO3xMOWEqBAYthbtbBgdcUPF1ugz8s
 VQdLISpzk07DfOk9B3pPlJomvX1DXGYcQyJ1bZJ3d5Typop9TYfE0CfM6aDzjn4UQ/cHxm8W+zX
 zyAC18l9x6oi1/dDt2ZgGidQPbWUdr6nQ/UC8ZJcSYSsgiF7dZEvp9JUlsa2X8loL7K2e22dYww
 03pm33plmpY3oncrGqv7mItvraw7QQ==
X-Proofpoint-GUID: hPynuuBnIN-NhhYA37RVt6_mBKZnjlaE
X-Authority-Analysis: v=2.4 cv=E4vAZKdl c=1 sm=1 tr=0 ts=6919b7ce cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=10pTUH41BiadPyba3gEA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: hPynuuBnIN-NhhYA37RVt6_mBKZnjlaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160097

On Sun, Nov 16, 2025 at 04:12:34AM +0300, Alexey Minnekhanov wrote:
> Add offset for display subsystem reset in multimedia clock controller
> block, which is necessary to reset display when there is some
> configuration in display controller left by previous stock (Android)
> bootloader to provide continuous splash functionaluty.
> 
> Before 6.17 power domains were turned off for long enough to clear
> registers, now this is not the case and a proper reset is needed to
> have functioning display.
> 
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Cc: <stable@vger.kernel.org> # 6.17
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
