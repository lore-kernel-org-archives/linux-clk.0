Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028BE30F811
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463688; cv=none; b=CS2mMpoJe7H9BMb6JryqXimNhP+4Cc+0DdxfnpeZ9OdPm+eySgTAwG7pP1fhq7ZuGlVMMBRfV5IHtHggaVpqkX8M0FEtmNojMTAzIyWiBkSNacfttFXRAfUzTo0VJGsqDUdnU21bU3FkEAXX7xEgcZDTAmK4GeSr/vj5gz/96yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463688; c=relaxed/simple;
	bh=54svb4AmhPadV6Nu6fX2X0ciXJedoyOJOZZv6uYmFzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0fJc9VhHMnKrAi73hSbalj2mSA9cd+Mv61uwu4KUw2EwByWHP15vUsih3OLhOsTIuS+Flf+92lUQrahdlDc/8J64hHeT8Zyy58H7VJSYpB9Z3hdxV7Pomck+jtKMsvDyvWIet2KnHSshUiwVHepJKd+QGkyEJXN/jqDFfvxsDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPnIcjKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLnbnOpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPnIcjKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLnbnOpP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6V9sZ384218
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 11:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X5A+uS0p4cMw7kHI/Bw6vhoV
	gkI4mhoIsS2O6NL3PNI=; b=mPnIcjKTg+tFx1VoZkGPUSFYkKaHcdI0fZtZm5QF
	DRQdodX9ZnrQdy+It05NTc2HR3Vo4G0QQTxRhijVFqNIia4j97vINpNMCLQx2j6u
	EuV3EXJWGfwrv6ljlu3U4FQaE2Yh021gQQlCzvBo/vNyghZ95iu5c501pI+xEYt7
	2WIWcyiEzl8bgG2DaNLTZK6Iz/ACfKq8MBfgFJQPs+zrht/bJ6RI9y6GF5KcVSTv
	oKyDtxqiUDB/sgLzdXLk3sWIAhgWIleQE4ezI3TSJZjBQPcw5LIAcmrVI3ZGVVwg
	L1NnfRHpi7UWAfv0ZdEOTyZcdmhcrsDkfB8bCOZVxyRYew==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8j780-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 11:01:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823acf4db3so154763246d6.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 03:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763463685; x=1764068485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5A+uS0p4cMw7kHI/Bw6vhoVgkI4mhoIsS2O6NL3PNI=;
        b=aLnbnOpPCfEBb+auq0uY1Ev70PCPkHiDv1AMAleWOdaoYbVYKaP5CYTKQtqmg10vli
         rhPtMBREsB5m0Wpyogwpa4qX0FkhL4UPrhzSP6zEHJccJdJ9Q0Nh76JYKgm9m633Okox
         4e3xUf3u0moD/ybVi/dG8Z/JuLiW4AwHrgULgC5IbwSX1EQqZCdHiLLHQo/YxVJQuw5C
         QllHPfo902Z/rhYjdG27ym3wyORvd5FBGGMRybUmvR6vyY5FN5cBC3BkcI1yAQA3ypXo
         yQRjkq8MzS+jy0QQe/mU/jKHIC+q16EBqAHPzCPGA9CVT7+dPaBMkddGnHF+6jiMwt/K
         7qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463685; x=1764068485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5A+uS0p4cMw7kHI/Bw6vhoVgkI4mhoIsS2O6NL3PNI=;
        b=U2hdMkwFvkDu/KRDgOAzhEIe4/IkG6Ecm+iEJ0uIJBYfqR+Nd4Cp0bQpopyGhpGhwQ
         E+cqFPdy3rm9PFYwWEaQIWpLB6bheQdo2ZI6dxADFh1eB5jd3bv/QWKG6x1tBFTY7DLX
         pSiudWs87xME4ahzm5HKc2X+jDrrsnP4RycmzonW3JrS85EkbKdj+ByMqvv1vq0jWwTP
         3IZ25IhxVVvGB5dTLhXqZzPbqpyncbyMZ3YT2bewY5A+VI7lDUQwQpQFta0yo3xgphgT
         ABg4PhzIV1om8yJKHY2FtX8Va4atHKcGmQhuabh1IgCeRsotve7Fcg3ne2AwVLhW026L
         8z0w==
X-Forwarded-Encrypted: i=1; AJvYcCXs5Xkog2vpDx4F6vyGWWjKoWSs4uDMHY5v0YQ7zF51acTpfo2EGXpvY/CDXCgHbtiwjjuhMfO47EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO4V42rmT4piIM7JQ5451aaXb8Ltb6h8gEhy2d2FUx9YJZ/U+S
	avBteN0AjFYXEyKTTvlka6rKznE8SYYlUKGgmYyDx/GJbl3Z85Jte6I+cp7oNpuuVcBCcMU7ukw
	DtE7tSI7lAupYvPFq+nbKBGXJ+my++XIREmwEC94emRsyUZm6E7v/9iutFl0WTfA=
X-Gm-Gg: ASbGncs+euzUyIR7ICvNxu3SR13XkOAZBWS40pzzrDv9Lbq9ONLcmMiVS4IrIR7KIk/
	Ejy4cue1IaUQj9SJF6wIRi2jpLVUDLvdR6oD2X1/kThOKGRM0GslTmvjL1mgnklyBcIP0AkvGLN
	bKrLysJolpzo7vkJiG476v93sSGTxQh0JiCToBEcraxdiyM97O4L18RjOzvlI4X3qZtu9El3W2h
	BBfKRRJ3myAwkKjkDr1CaFKCcz+8MnnkS8IK2eepam6pj0SQfAndiWSdYTtv0AV+lY0SJ9xp56r
	c4Kcm8YTtrQW5XsuRoxmbpb6jt080CTuIjZeKUYcaX0qrQSM9t3C4mf54SWZ9iNnQHglmu/6jLz
	n52Lum7P0boE3vYChv+TcJI6ikv+o7pvTuUhgAfPD7fi++9Ja4/j26g8w4ULvAYg1y962i4UmBc
	Fk+sLdd0VoLXP2
X-Received: by 2002:ad4:5ce9:0:b0:880:6263:fe5a with SMTP id 6a1803df08f44-8829258efe2mr207729356d6.6.1763463685065;
        Tue, 18 Nov 2025 03:01:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKXukumLWLvwPRs27cFz4PFyKqeVII2Q73c+Oev/tcaH1R+RpNBh4GhkGkdN78aU9ajBkQ+A==
X-Received: by 2002:ad4:5ce9:0:b0:880:6263:fe5a with SMTP id 6a1803df08f44-8829258efe2mr207728706d6.6.1763463684439;
        Tue, 18 Nov 2025 03:01:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b310asm3874340e87.30.2025.11.18.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 03:01:23 -0800 (PST)
Date: Tue, 18 Nov 2025 13:01:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/5] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
Message-ID: <x6x6m6uiupqa47nj56cq7f5bmcy3kzrgb5otykgqmjsukzjsm4@krgjaxo6ui2l>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-5-049882a70c9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-sm8750-videocc-v2-v4-5-049882a70c9f@oss.qualcomm.com>
X-Proofpoint-GUID: xQuwDAqzsKw33QBk-iCBqdXpHNqV9dQX
X-Proofpoint-ORIG-GUID: xQuwDAqzsKw33QBk-iCBqdXpHNqV9dQX
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c5206 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4OCBTYWx0ZWRfX7lxtAyUfJCaX
 m0CLnun+NM/Sj0sWfF86gLbwO0YCGeUn0FjXwL8axwAR0g7FQ/QlOYHKLBiJjG81ICsBYyvV+VG
 QTffgV61wCE/ZvFftzPXUbU3yanIyKtzC6APWANbU1ICZ5dzOU6bEN5bmpYxmgo0woI/FWTsVgK
 BSE6EgiYYOgC6EZX9ecb2aRSzv3fzj8trxQ9xzqBLv9EizmcdjfZIw3jMTOg94/JuCwDXAzbHg6
 DOZjUeS8NdP/Bhsy0kPvFLAet9Ctuqf/a6dT3ZlBPNqn8/uIgNP4TbWGc0an8u1FA4JHBvnRdMt
 uFolnSu5qYGzSrgZwzNX/u708uOugN7ZdolPDrhYoCTWxs09jvxXVtGfnF2SPShuCiMTgps73vq
 U2J7WJxg+gxzGrT8W2ocmV61LqYeLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180088

On Tue, Nov 18, 2025 at 12:47:09PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on SM8750 platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |  11 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-sm8750.c | 463 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 475 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
