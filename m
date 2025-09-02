Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2EC258CDA
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816565; cv=none; b=KFFOSOuqGNXI7V2k4QNao4vn3EwqsEDxG+/mXdxF9hN+RmbOEtEi9mXXykhojM9rrqGUBlrKcTrJkL0J/qwf2NJADeAvJMa11PMKYBErVeZ4td9sgqHc7xJEaMAICyAypsa/1LjCDIIwkk2L9cF6zC4GXBi+iG+mVfNV1lnOFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816565; c=relaxed/simple;
	bh=3awv6U4/xXS9ndF1y7siUavi5LFFCkIU3jbXd69usVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbGdqVQIXdyi/9nrGUweqUnAtYsMeACv+w3vvINWmaIlkU4gF8hVPpkTLXZpJKnldkEIE1v9eh2CJ7RysND2t3JeUSCqd8jVChmcZ0DBaucBvYO45w4qI58aePLsHkDnfjYTAzI8shvnqg5wFP/+WkybWPp3lwNmrEuPo5LfhKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fg0v34Qe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fg0v34Qe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B5HKL012501
	for <linux-clk@vger.kernel.org>; Tue, 2 Sep 2025 12:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ILiX1Kte1Zc25Jd6RLaKwW+X
	3sQ2KmSi7ISWDpWCZuk=; b=fg0v34QeKa8PlKiA8AmqgJc28GgFG57beSxyadVE
	Ouo7snmBxZhCd09165t5Guo7+2q2SlK74wL4OFgCoSP8dMpT+9kylrWKouLpe1Ed
	Aqr/9iNaXc0NB9a5p9k66CcM5bIC/9erA4LC9s6I4pzuvcBVZE4vSjIJ8v7ZH9s2
	gAH4swQn0EEEUglXDerpFaAUsqMS+3MviJn1eY939x0l4aowwrjVrgA5+BI1vK4N
	H/aEFCsu5aofmSL3ewAVf28ATrWHyv5K9lJCYfo/iwWL3XJO40lxGFqlW1M8RHW+
	1g3BxCZykbwGPNXB1q/+cHydivt3sW9jSMuVHhLZ+OKRvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0efwue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 12:36:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3316dd5d0so49419061cf.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 05:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816559; x=1757421359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILiX1Kte1Zc25Jd6RLaKwW+X3sQ2KmSi7ISWDpWCZuk=;
        b=fJDvqShwcNgR3ILLmsMvC5g346FY1zivQgU3OiR6J2RjUAThXTPdCEtLeIo/0rwHCD
         AjGN5VLQ2glS1/v6qxt+FW8XYeVwS9Gm/Ab+OagWJlXiDCwjEOIu1HdP0VrcJ6vwnL0T
         ZMkheTxKg1vaulLfV69Z1TLVWKnljolnTtymOelvKTllVGyUEC5XapDuq1lUbJhIEU2E
         S52cLgN4MQ3mx/qbVSwmr5LHWSEe+MQ9oZ6p6MPj6yJvUbMFY8XRE7+tSARwOfCsRA8q
         4ZkQZ1BwQ1YevEzjTsFWCzRyrkV0X0iyxWTlWpsFLPqCKsmOj83DMHAoejiRYHGOMwcW
         kVLg==
X-Forwarded-Encrypted: i=1; AJvYcCVJOZxcAiqs6CxaPLtX0RQKfAYYjPpDQOZP5W5URJXIzgqF/G7PM43h2XJkqx3tq8eX/US/9ZL5AtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/E7aEur3nkHh0WrOgbXNgEuLndI77po7XMjIQqeOnjGcQevF
	ThvN6RbZJkECoxH+6OngF3hL4n6+RRD2u2hN3rWC5c5cnDZJYC0Jm+R/tjr9usnJwakx4PIIkuR
	V8l4D+wnAOMSeXQQQxWZhfRV3VYKYOIT3HrmDzVznElzhUWv3u356yvJynHH6h/k=
X-Gm-Gg: ASbGncuBxBb/uKzm0aX6A6O2TwCpKTSS6oadI2r3HZMHO9E7bPw2e5FChqYaK6O7YrI
	YHi7WzOFb/Q39JKJkdM32IsGl8gnJ58eZUh8BLeu8yGSi72Agn1s4kVBXZhUyV5qC2yLkR8Y/k2
	T0kl606YHYYiT3Th8oUv3iZfE9p3LB7ZStSCNgkQYAhBn6vW4/XJnyVZZRm7SqTVHxGdlXQRhg1
	FXhBaZ+TyPbjeQDxW29V0217NcYaTdDwGTNSAo07AXm2UQbQ5GMzV3+cC9VW5F3zTnquDkV4yLy
	H/WqvAe0wNJxbP6S2svEHoSH4g8Zj7y7FdZ0+4kRv0pclpUJ6cWsQKcPj72uoIgIl9NPX0zmHQr
	fE/Uyus2hOlqBI9ln2ZGOM9OToxeUwzCZKfejee05I7TKgVhyyOwr
X-Received: by 2002:a05:622a:2cd:b0:4b3:81b:c5ac with SMTP id d75a77b69052e-4b31d85d5camr129761261cf.24.1756816559354;
        Tue, 02 Sep 2025 05:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvKP2rcrShFJTSAgCxbP+O5cx19CegSGWpv0b+ec33ky1+7ucp/wBQW9HOyyPTSs0QsJn7tw==
X-Received: by 2002:a05:622a:2cd:b0:4b3:81b:c5ac with SMTP id d75a77b69052e-4b31d85d5camr129760761cf.24.1756816558669;
        Tue, 02 Sep 2025 05:35:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56084bd2803sm317462e87.64.2025.09.02.05.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:35:56 -0700 (PDT)
Date: Tue, 2 Sep 2025 15:35:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
Message-ID: <uhjhgutnur3qjbmqhpjgg3dnsryf6glm56szwy6iys5ffuijsv@ld23wny4s2fx>
References: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
X-Proofpoint-GUID: 2N8G2wAorw-eeczbomifXJmaNvfUkJGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX1Nxfa5pRB20t
 uWKTbi49LHrUtuiHRxVy3R1Cgu4f4jjxq7AcEHBIzDS248QFFd3l30BWJPmmIqyMGkjH5b/TIz9
 cu+69/7VFMuR3cJjuXdQbzeF3+skKGVBnBEp7cl1p2kH2osSW4TBf5Ddan6jG8lBx5jSNwF7TT+
 epbI+0EJw8mO6yjISHPXYwV/swGu/K6CFCl30ZrQ9vDnp3S3HFk3hKHNP8tWzFql401g90Zcv7/
 kHoxjb2MsD20X5XPHPqP4nCBkjWq/PMZhOpWyFsOEEbOLO+5GqlHwb0LbQwKPwmoF3lch7GhjMs
 l6nyON2JeX8faVMsu01dPZtn79fgbqFYUD5F5QpZ66TuQnopE4iYWeoOO93sKhOZorqTTi0dlVl
 wG/oRJs5
X-Proofpoint-ORIG-GUID: 2N8G2wAorw-eeczbomifXJmaNvfUkJGs
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6e4b0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=GxmfVdM8WKu4Uw088-MA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Tue, Sep 02, 2025 at 02:17:54PM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock
> controller driver") adds the config QCS_DISPCC_615, which selects the
> non-existing config QCM_GCC_615. Probably, this is just a three-letter
> abbreviation mix-up here, though. There is a config named QCS_GCC_615,
> and the related config QCS_CAMCC_615 selects that config.
> 
> Fix the typo and use the intended config name in the select command.
> 
> Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
