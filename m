Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F931481CD
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680184; cv=none; b=Fc9aaKvC8La4pQwur0FkZ2eE+OY+Nenii+AICwRXXq91M/KgscwRlPLk9APwls8vKwOg5969rs5tYMbiTgCzz8hC/nqgYvFeia6kIOLma/mPM4ft1Icsx9JlC/A4qzSUDbIo9xFq6qFj4Kig0UFM2eqP5RRdGi2XBBKzRsAVn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680184; c=relaxed/simple;
	bh=t7DSi05slPCkN4UsojGxy4oP5CIR3/pwbBY7inCPQo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evw0M4hQkiH2V0940ZHtW9U7cF+xX+hr7erReDFjHu5Aiu1VJMZ3shjLI4jqRb3Dfjs0uBZhjI4ms4+pLm1CdcE1yxbS0nbJ1j/wmLK+hLOSL/DLf9grQ473lzadOOBwXlIoOPDrnI7MQQze/KRfq8R9JChG+zQ985zkA2ht3KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/Wx82xZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/Wx82xZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GC8bnS019476
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q7Y+AqcTKt1Ceta1AaX3XL0N
	rlaKK9iAw6+wkY7W8rE=; b=G/Wx82xZSe2Wc0oWbzWkzHTDG35xXiA2MkyjjaVH
	sqVYAileg22MC05qJnFNUV+8vjzDAtcjKYzTA5bI87UXmzNmt1hzYgc2x5Qgzah8
	vsbMNiFZXXohjuSFLiyC81WKdYYBnaYVn6bPkzKlPonuYiBArFFM85OhMCKS7Crn
	oRIMR0kz7XTJn4xr9S2UDAcVzebIPWlbVtNpd032NpzHuht1fCeFYPZp8vgMmLDK
	9fXDGNBTaFAH84h5EmC4uqSDyT+elVrP1izxx4pqylM0IGvnt9jIyBqtO3594eq/
	+3UC13+ffAndvuiU4vhXedqJGB0ju7FJsxLVthcJKUZsNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsq8qj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:36:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e1aeab456cso504532585a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 08:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680181; x=1753284981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7Y+AqcTKt1Ceta1AaX3XL0NrlaKK9iAw6+wkY7W8rE=;
        b=M49njvzIibQ51moslDNa0wl63WaFDenCANCSymuzlo4G1NXklaqO1lcj+TUuI/WBna
         LhXJRIYdTN+sEO/rwaDiyhFQBLbbK9GPoN3TyOFLjNrrkD1S7O9Dzh0XrSq7S3WwgX8d
         dfxZosQiE25+4BbOar7dZ7RcYJSYHSURUySqNdpQ3XykvrBfWCX57XMUdC5jz4Vrd/Wk
         hIZj28LFaINEGfrQXqJCGmnjw/GbIBsog0Lcr7LNQhrSLwukXAQ5tE4YP8gqxbkvhGxx
         acLEWgA7S6e+Szt4NlPxYTTE9dBnHPoBYQLN/f+4qtvapreW+cIqx/mcmy1IGjBc/Odv
         1kYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV64nPKGFYpYVluU0Zmy4rz3ZcK5WZ1hAM/OX/A1m2YXRYyG1V4qOfiBbX/ntgo15gxvkgeubynbGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG/JHbrzwpS9zjTFlbfQkyHPWF63qrMsAxblVb91qLEYZH3DST
	pWltynktxkoj2ImoCcgdySivq4iqH5yYoQc6c53m8+wGSdNP2YsfshuPnzoDDqRvm/PqBuXZA9R
	aDr7QMiuwGjyqHcA0fgNUuLq2Ga6fdR0RyEeL3Ity1AhkVdFZ8UHiTXgzT76KSYQ=
X-Gm-Gg: ASbGnctkrZ3yIVpQR6N5jIRatZDv6el3ikpQiAtZ1N5WFGRNnsz7vg+9o1iIW+rkaNZ
	qGMbFK7xAUYvQnxdG4u77kgwGVBMsBTglWz7sGDeLK1rSwJfwBYUhSbjCCryZ+UedcpxABpFyWJ
	AYYxSzgsqNDBAqkEZVi7ZHIzjCazo/QUU3jK6c3kgBb+U+8YTPF4jbhCJf3JPEhfQfcMAGyqI1n
	POojvv1DDJPc083pKHXgm4OTylnW2JcIOfRzBUnReEvniJTqjdqyOV/XkyerJn0OpUZh7yW7qjG
	W+ty0z0lvyx4coTkc8ds3nn39+WFXr3F/ZJLFbEMjdikPCJ3wc2N2fTCCEMOgmm+A9VcPQVjkvA
	HDJLfSXkQE9j6RyVSYbqSSJE6Xjg2opJRnxz8ZEhwkPKFafMH1YXx
X-Received: by 2002:a05:620a:4546:b0:7d7:2647:da9d with SMTP id af79cd13be357-7e342b5d5d3mr506342385a.42.1752680181191;
        Wed, 16 Jul 2025 08:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhZ0QjrGWwHaDPGp/F9PqlexGFcR5X+X3OWVCipgtBtA0DpbAzcIF8dPzibaOM7PevWMFHeQ==
X-Received: by 2002:a05:620a:4546:b0:7d7:2647:da9d with SMTP id af79cd13be357-7e342b5d5d3mr506335885a.42.1752680180581;
        Wed, 16 Jul 2025 08:36:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbb5dsm2690071e87.18.2025.07.16.08.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:36:19 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:36:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EKO_T PLL
Message-ID: <3exm3tytxfyc2f3vwah5gkxftibf2xrbzowe56gbgtk5j7as4j@ocnobxe7dspl>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-6-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716152017.4070029-6-pankaj.patil@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6877c6f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=zIiPdt3-swY5NxfCfPQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tmwZ0F5B2twOh1u0GWDsn4OopeLJGP0k
X-Proofpoint-GUID: tmwZ0F5B2twOh1u0GWDsn4OopeLJGP0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0MCBTYWx0ZWRfX6tJrDm/LIRoT
 YiLskXyS/E5814OCWqWP8KDWQ8IaBGwTy+X7/SyB3Pas9QbQEoQkkfYDKHrWZ0adIleXZ3dzA3m
 G46E8euOGFKY/VgI6kzfjVLR7IIhME72Jq39HOqqiKeelfqRS/riurLut1zgKXjoP8kfE6tWwkg
 u39KULFlBq93pnCua02G/GWuQvfwyyGFfRWri83pMVaeAETS+yy5P9Zv2gvyR9mYueV6SbcpCni
 wn4LQW3j41pmY0X5y4HmdAJqMmQIfpKK7cvpY7xgyrYdt0cx1gfKs67tGL3fWd64nRaOOvh/Kcg
 ouzFpmshYHNiLH7MfPPAvnwr2l5UIUDvG00jzJrwFZweYG1EEpO7FnW2lzhCttZCaJ+UZdUI+Mh
 FDSJ3ioibarEMzj53bvPgqmNuXjgla7ZOwgPATNdXEKm5imsA9rBK+lE/q/Iq0rPdA6b23fA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=951 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160140

On Wed, Jul 16, 2025 at 08:50:15PM +0530, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add clock operations and register offsets to enable control of the Taycan
> EKO_T PLL, allowing for proper configuration and management of the PLL.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
