Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34346329E5E
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095191; cv=none; b=Ay/HW09VBnQfHMoCsR/f1/jnOuRDNVVD5IkEP7Zn8QGTQgkdei0eVZeSSe4hipAeBK/cJXtgWSGMdzSlUpXyN3Ba0EenMeTUuN/IQPlgwONRaoz3+UGVsyPp0RTiiQ8RmDRQ485iHDAKcYJ+pZpT7AawCaOKBUxMTp1sHCj68mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095191; c=relaxed/simple;
	bh=ebxjg6gB3x4MpDFvERk9WCDA5uPKeU5F/fUIRzDY0jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObJR5E3kzmRXSusQlcwsQ78baIrELIa3eytm95eOlCcRi7fKWnMMKOOHYB5BziySz/rBxewCOzgId0EJKfz6Yp22WIwnTrB05H8T09AAVOn3R1cPT6ZSXofuHQGrAAOQnlsjOrLeEpFmFwnVXyEnD751drlpunso+gQ20HhXjEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxNpbBuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyT4E9GQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxNpbBuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyT4E9GQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APE0XqU3706625
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kD1u7+cJseUlBfgY9G7IN8T2
	h35v2Fl8hABAZni79VU=; b=PxNpbBuSndx0tDPdVy3yS3topP7rFOSEQNRxb5nZ
	UnOjLike2j+x6E21+f7gxVTtkcPa2zydF0u0tzF3bZ2eY7B49eYXbcThTaWA8FM5
	an/JORQ9J+phUvNxagq2X9ebzrYKIU8L1vhQXV4sXK/bBHsOv4DYysC982iSpA0A
	tGmSvedf7IQ1aLwZgpM2x4oZhXq8PINDOviW1JR+tTD/BbM5H+h2FNXPZfQZW5dI
	YN0XBvHAp7ydsqaasK7t6QNba+u9b70xQWNc1L2SjRzGO4b+4pt7tYiS/SMMvvz2
	CLbUiYMMqSvBWstNC9CCxkAyk1PKdK30S94igdNyCHfxzA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufrtjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:26:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee41b07099so63935661cf.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 10:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764095188; x=1764699988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kD1u7+cJseUlBfgY9G7IN8T2h35v2Fl8hABAZni79VU=;
        b=gyT4E9GQnXtoiXr3Vi18RHjx40VQWOPXHKcgoN0xkNX7hy4RYMjXhV0gY6QkCQP90F
         89DRUDwTSLSajI+edS4byc6GdLqmyzpxL4eMym8GOlIEzasJS6X2B8ON7XzsVbOzf66t
         KqFCo5ndYQof5cWcAM9no+EDO1gqsWuidXzpR/1vJA57o88y9SdiTLf1Eyb/Q/KuhW2B
         j+AXYF3aPyzPOuZ1MKuzcyYFBpmkXMyhpo81GVMtm1ktGOFgpQnh0XIoSJnY+XDMghIR
         xg8neSTi2ntt4OLxJr/OiPXIjTkkn7vP2guK5RWCgCUM/v/qhMgwJZDWIh0pIrCOlH96
         8kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764095188; x=1764699988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kD1u7+cJseUlBfgY9G7IN8T2h35v2Fl8hABAZni79VU=;
        b=d8+S3EpMGRqvLiHNh9MtIRK8DCcX9Lfv+YnAUWtxIXE+j6aDEJ2vAbSRT5SjxPx+dH
         J0TZEKStQEDKZZiGeLP/Bts15yXY90JRcfBhaQwa8a3xwWFyo4q4vyZO+6ml4EOn2gAj
         k0aCpM56Uf52I/1drWAHT/5ZuBljKBa4pWxLZWMobMKNS3qwUAr2K+sg23ddUb1D/Ges
         Z9gxNl7ZpDg5gh6a9OO+WscXw0WzG/dVIUknzLQ4m51zNoI0T38v/pvNEHu0wG3ciwr5
         0TkzXprX1oJphfUZg34bIFSeT5TxVGxD6nU47TDy9WKN5f0ObcKyo4v6n5FqQyEgrkuQ
         t+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF1A/LSoCGWugU1FUzmjO0rHWSlnY/mu/xyck3i3wCiRcqgRDwzOxZOh3nca8WVoDH1/CIzvOUbtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKHl4o8TyMAi/I80n16zA+pNigYi/vZNqQcNy1EJPayM4CysxR
	BxDVoXvgfJz3RNyCI8OwRrSAv9KtJf/LP6v437DAw6v56P3jGyMde3mzd+sO6kWTv0xrNAk9Hki
	LCfXQXjOE8ZO+90n34qc42RaIYza4fyNYGMcdniFabRYPcatSKQDLTZmmdZUr82s=
X-Gm-Gg: ASbGnctOnAoDtOV5tg1FxxmfYJ+qPIF0l0jTWsyuN+eZHARvr6YC6gZPczq4C2Yducs
	bmysZRcqhADcyHS214DBAN7Nij3h+6bFL3+XwIFjB4oljr8PfLUawZ45O7nJENFzLYeb+IdxBUA
	ynYNwBm8Hdr+M8ArnCro/IAocDGO0Fwp7kPfz6zALBbIc605csF6ekNKWa4L4uglxEjQwM/hhCQ
	pjJrpYPg1WzoxnTocnLG7XCnRQ2MlDEM0JsMFULVIkoCtvX5haK4A0C5Fmr8QoeNeKKFmgtX+B5
	8MyCfshPgn+Txd99sZgqGo35RAtOYtoTjT7Z910myomsFwZAObiWJPrF6A3th+hvr4i1yoBouaH
	bAV+igdpjNg8xffQACt7mgxi+9mnWP5wJcopNQ3r2Hhha2DPwB/pp5EsJw0vW/tfvtFZFoyeRaX
	JMt2s6bAWlE2GdL4lRKtZYHSM=
X-Received: by 2002:a05:622a:1ba7:b0:4ed:6303:ea79 with SMTP id d75a77b69052e-4efbda958famr49464261cf.54.1764095188281;
        Tue, 25 Nov 2025 10:26:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF89eCmHbFpIp5+TB5GdNuHM+TjnMfVnv7SdEs+Iq4wEVhFZhvdYmllhJEiyz1UytnIPYP4Og==
X-Received: by 2002:a05:622a:1ba7:b0:4ed:6303:ea79 with SMTP id d75a77b69052e-4efbda958famr49463791cf.54.1764095187798;
        Tue, 25 Nov 2025 10:26:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd2d1fsm5272025e87.102.2025.11.25.10.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:26:27 -0800 (PST)
Date: Tue, 25 Nov 2025 20:26:25 +0200
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
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
Message-ID: <pkcwprrzpvbe6sxuuzanaqquhezz2ftoxtdt2fuufrjpmnyeqx@e3oodiuwhy4p>
References: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6925f4d5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=q7dqqsrAYvYYBxBYVC8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1NCBTYWx0ZWRfX9bkHUF+BeqUX
 UnA6XnTUBeA42ZEXIHzIinelo2yDtx12CFZtftuuIlS5Kj6fNjqK6H9JmibT7RqLNhqn3wDNNDq
 k+MLaP+iIhlpwURg7LHPhQ85td7Y3cXfDfeErx5XpZlvIteAs/mb2/fnt8e/NhwaQ7PTsw0RG7I
 fq5DtFQaeOSOJy7v1ES2szsA+RueAIzmtEezPvCRcHiKgf6hnbpPKzedszK2UnDZKKq8BNgWRRr
 aEkBn7zpt5KHuOB+8W6P+E2HzUwP3QBGLGSmtEY4nNt6tVr7nbe4CWE+MWWcjUHCkgzM9lHK1qq
 PxCzxWEHFqwLKT0j/hCRhPqwFZPGLp5Aw6yrdnTjU+iO60MhQnJzM1wRu2ocqb1XYooLMD/iJ+s
 yRiD9qSAoltCU+UuGLP/hBZ+AwO06g==
X-Proofpoint-ORIG-GUID: z4Sok9EnaBXS9c_btpcdQLHv_YvIKFDB
X-Proofpoint-GUID: z4Sok9EnaBXS9c_btpcdQLHv_YvIKFDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250154

On Tue, Nov 25, 2025 at 11:42:39PM +0530, Taniya Das wrote:
> Update the RPMh VRM clock definitions for Glymur to add the suffix to
> indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
> C8A_E0 clock resources.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")

It's not a bug, there is nothing to fix.

> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a370ab2d96c34fa8e7a090e8427b11008318c02f 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
>  
>  DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
>  
> -DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
>  
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> 
> ---
> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
> change-id: 20251125-glymur_rpmhcc_fix-5daa36a1e8ff
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
