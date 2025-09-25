Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2DD31D733
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835693; cv=none; b=Sp9iVDMIYOXYODgHRKixEfCwLA0+B8zjFjJY4MutkklQGz8765SU+u+VePeeqRHiYlpbNoOxKpXpC4B6FOsHZnAobWm8wRoaWenyeLwgoGEw2aNA7J4TPdC0+kgAHjI1wuuLZJJGW2khpuxR0O5L9KHX1fCYQg3i5iJb+AGZ5UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835693; c=relaxed/simple;
	bh=mGf87w9ZJVllgijc5JEtI9vZxiYgE1xsayOGWYC3GHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrrPQU5OyDn+cQoA90iYRDVEH8yH9a6+FifM136TVHsQ9ROIu/79BxhciRydy+lG4qOaDS17ltwcbgQdWael0+K+SrY+G2KjLFUZUpepcJNWxM1x5yXIV7uD8c2o9NRh0ifdJ4VvnbSoBOga9xIitU+aw07WirI0LYxjjSghBUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8sZz5an; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8sZz5an"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPenk023368
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xVJa3hRBr3b8zN4SyC/HCbPD
	O2Mv7vIE7SFYZLeD+YA=; b=B8sZz5anXZPlbzTc9hWAN039PM5eI/vPGLR9keVD
	lp79P3PfevuRe+d5Kc1Zaz8mlSd11QLO931d5PcKqGVijyYlGPGB1nXoKRUwNdBF
	r3mDHD73DhqAZQh3wDMrj68lJ+5USVUq75bsLx66tk2WZrp/3QORyHSOEcvLe9wf
	y8omFZDmX2TZuDBkSmtRMFPvf83NQiUaucsmNvvZSrZGrMqRnyJixksO4+y1EztY
	VnHysQoE83yxbJZqAyvpNyBOsYtcUUGmarQWl/TG5ay+HJFznS5hOU4wO+7GGm46
	GcJtkNrDyZm9WdrSfEoFfeVC0G+0eeIKz5SsHpJie/v9/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrenk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:28:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d91b91b6f8so33015561cf.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 14:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835690; x=1759440490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVJa3hRBr3b8zN4SyC/HCbPDO2Mv7vIE7SFYZLeD+YA=;
        b=gvZdt0sTn6iCTKiJ8aZOC396uJBL/C+MIxsIV8GeFmaxYqD8itMWkGpgvCjhFeAuH9
         Z5piTH967UbLdmlkf4Chh2nZz0XW9FtKbGvd9q7++/OO+RYe2fR3yg7M1+4t4pmY66U9
         CJDl4lHDXBi/JLW8c2WMiaFaWGPZYWmT67zVTwoMis5C1nTffxMtwSd5IyylDFvegpFl
         U+anufG/YSiaQXJTdy/6iqnXazqgiNb5VDF8+TNvNjd1GiNFwqvjMZSLSTczIN6EktSh
         aayEYrZrdxCxlfgDAlWQxJ4GQE2mzxwrS3BlYKwHxgrS0ntv9JUpDml+C9BLWQml+em1
         SnAA==
X-Forwarded-Encrypted: i=1; AJvYcCUkfeL1T+L4iIpYRs7rnP/4FHkZ6ppSqHQJtnMVVJIrW4jvcM8bPhkEXNDPBwgAudyo7agD6fas0YE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dcBJLYAD8gwqaBL5bXnXlS76Dg9JSErcvsGCVaJYuzo2L999
	uRHyKr3vvelYuIxXo3gitmYLRgyF9sv7KCNBxwN0M+qMh3Qd9T5TCR8ZbZApg1yvVZIZmfYXKmE
	J7nTx3p3CjNlHNWY41kaIofgBHb/rRvrTvoy73EUbGwgrSJd07DXHnOv2RZedp8g=
X-Gm-Gg: ASbGncvFM/2Dcjgctd7T+PmrnWitkws9J/BPabxzXVqGcTUKe2W82kBBeC9UC4Bgadj
	Kah4J1PwVB63T9LSG+G1/Ci+SaXhjG3wmdCRQIoWzCNkQWba2xs0PIL5PGuKdITDEiCASeJC0nB
	vKrL2D2whZHr0A1yxS3j+i5qyRc+nR4eIsmR+ZKfURsesCcVTxcD0ZMIMJ2V3fpt2WwTKg8fjIc
	qd+42g0vcIvFrObmaBELqCwlS4WAkrqRPOpkCY8Xk+LRL5SXmzNGWRSC9/C/OrbigNaraB1T8uc
	/+6sm87CTdhBIdxcQjdsjYZsnrWBct4UAZgjA6YLN8gTNs1R5FtzQ9oIASBmkfcbyb2qc74sgwn
	KF86SR5CXhiscOToKmis+iHVSCc108ZCCHRou3+dhBItEg79GxIy7
X-Received: by 2002:a05:622a:4208:b0:4b6:2360:accd with SMTP id d75a77b69052e-4da4d125b3bmr70727601cf.79.1758835689960;
        Thu, 25 Sep 2025 14:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERpLILMpHgYah/4YChT5n6vChPATcZxT+HTlD/SkOj7T7pjCCewNbSF+lhHTpWFPOyyIoKdQ==
X-Received: by 2002:a05:622a:4208:b0:4b6:2360:accd with SMTP id d75a77b69052e-4da4d125b3bmr70727131cf.79.1758835689375;
        Thu, 25 Sep 2025 14:28:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313dd66fesm1132195e87.54.2025.09.25.14.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:28:08 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:28:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 7/9] clk: qcom: clk-alpha-pll: Update the PLL support for
 cal_l
Message-ID: <wbabc2pjwe2ir6pb2nd5s3hfaf6y7nd6baabjl3rdgawtsdxq3@ncedo6jio7rz>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-7-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-clk-v1-7-29b02b818782@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dNSdkvtoNHhjRHwl3k0LYx_GGRyYnz7e
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d5b3eb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QDpnt0wtCZc4EWvjjt8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8EQ9duPEsUX6
 Ey9Nh1gIbyNGZxYLcRELINbk9H7NIU7OGbOc6VbwEWShUeBVyPAin0ulaFNc4T9YBV0y2IIwjcS
 svWAg3BSXclW5f9t5JLYbfOt9KjIHSmG8MB09uYEoPpizdv+3lErYUY+5nQsWdOTgEMTn/V9O6B
 F1EJwJ4SuiZ9fhnQEK8YXOdqkgB8H/FMl0oss4m9lyGYyMh/HLI7DjqH7uIyF2La0Mraj5QY3tl
 JQV4l9fMBVkWvhsaO9gxnW7660fecysncFeeP+IF4Zrw+GiOwPxwdjlighqtHEandDIxOlkCmMe
 GAxg0dCznqgtklQEeCynE62agrDmik3ah4BWgDyi0Gvzl9tuV/4T+3ElhXgwM/bK7h7DwCidbtY
 uzLnWuHDQ/x9uVtKvx7Z3NcOgYkiBg==
X-Proofpoint-GUID: dNSdkvtoNHhjRHwl3k0LYx_GGRyYnz7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Wed, Sep 24, 2025 at 03:58:59PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Recent QCOM PLLs require the CAL_L field to be programmed according to
> specific hardware recommendations, rather than using the legacy default
> value of 0x44. Hardcoding this value can lead to suboptimal or incorrect
> behavior on newer platforms.
> 
> To address this, introduce a `cal_l` field in the PLL configuration
> structure, allowing CAL_L to be set explicitly based on platform
> requirements. This improves flexibility and ensures correct PLL
> initialization across different hardware variants.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 6 +++++-
>  drivers/clk/qcom/clk-alpha-pll.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
