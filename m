Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579DE224891
	for <linux-clk@vger.kernel.org>; Thu,  1 Jan 2026 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293953; cv=none; b=c4qBv4cPN6k04UBOblFGGi3YOpJ8FC+jHJ8ETYBWjHrbg7Qv07s2uFhrqWdWtCdCxZnH8kIvpQbZX4wP8BVONbd4w6t8aIMYR1eHvkfEKpnQYHYEUVJbpdqoIr1YElYx4cCuFBYvck3+189pMPo++ieVuAj3wMe8jBmMTPKW5Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293953; c=relaxed/simple;
	bh=SY1mfUzR0kljOI4AnzSXIwwOJodmSB+8pf9K4FEZRbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZrm9HSpouO0hacup10ptX0ufTboLrQ9/AoaORP3k9avDQdVaFvv+2IZHjaJYEhVRb+FJqYeAUcJS48iQNHb5HGQIQPoxzNH4y6nBsqOjzpdad9iv/vbDHl1q1+554MDrrpNdEfTbQmKo554DiamKchS++ZO1H/mSAbAeYwXhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+cTZFiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsQgQita; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+cTZFiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsQgQita"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601BkvZB1926814
	for <linux-clk@vger.kernel.org>; Thu, 1 Jan 2026 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JkglM1+aOC2hqCIcySYqY8Wi
	aGjCaJ47xGM883ImLcc=; b=G+cTZFiuin4orzyYsozWq4Zfz1RMh/g6OUtpO+T+
	AouAjBtYvOyz7ClwMxqnYxhQNLTgUDUuj+dW+QWU0y/+sZ/byy9xhwXlSgE9MthG
	DtG577SxXMyCHJ1RN4MOPatfLmEsfpGO1Lm+Z+/SK2Nwd3NCcsRD0vDzqnWyOTJv
	xBaMRS82MCrS+lwjraP9UdKw4gmX844qGICaMCBTfAwFYUyrTSUYlxpfEIWIUn+3
	65AcgcBNwVowyyXaL5fkjqCclVUj74qByLU4jM8w7hrZWhCBJ2zyFiroy+XG+5or
	mz3y+SdocXdY6D+Nyfr2vKxmoeHiE4AuQb6l/9xf5InDzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vthv3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 18:59:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso321602751cf.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293950; x=1767898750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JkglM1+aOC2hqCIcySYqY8WiaGjCaJ47xGM883ImLcc=;
        b=SsQgQitaDiNqhqOJLCfetch8f0ePbE6ICD66AzpoZpqOfvoc+enqmDPf04xBd21JF1
         k4CObH8qMg9DMLM0qWclCL4t28f4/UByDNF665Ek5dD/eebWDwOjZxG+2Fu8HHxdIqaz
         z1iaHTCTbHrO+Eda2UCcCmN+hvsGP9YeGMwzDFJwGDZUTBsi4JnibjxBN15lbraANPLu
         l5u/mWWMOnEj+SKOeisALgwZ84sXKVBrk3bhYfAMQkE/tc6hwPeMfqQYEnT2/mFM1BLJ
         tX2Sml+OuA86Fg6XJBSH7u3hrCONHu3Bgcu6gElZ1v/2hScz8lOHIETHNS/NynyZRuAl
         JtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293950; x=1767898750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkglM1+aOC2hqCIcySYqY8WiaGjCaJ47xGM883ImLcc=;
        b=LZ6Ua2jpdpkrvwgNK2zORKsI2Yshy8miZe1DmoxKwHjxsmBHkb4GpGcqok6GqyVGNY
         zltBlsr6bHQ2/c6tYm+u5zkHn+FH1hZXssyvPzZ3sC7+JKhWHLV9F7lvnLX8U3o8TgFN
         HlW1bRNz10k3dJmp/8BmmsRz9UmMwk1M8+f0EenU5OeaLDld9N3SqWb+03SVcTUXTvuf
         yHy1UDYF3VwEtV2u4BG3W3978JY0kkdZqe6hn1Zaxq1VzehYbywBy6urKfAQhGrsynhG
         zJ80KC1NqQos1dxe4ptMwELJl8aIRX/qWY6Og25o6fS1gzxCgoif0mbFc7ku0uMDdaAY
         MfOA==
X-Forwarded-Encrypted: i=1; AJvYcCWiuic12Mdir6Bx6dhN2bLxrjS0mGjsBd9YaCh5UuJjoSFiGPmCeqR+hLfJ85o5005680jrDAH2UNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNSXJY0UKWYz60Q/WnbrkFwZNJELQfTACoHOfst1MlcTYTb6DS
	CCa7RKLDeG8wGNVHziHPki2otBTJV5w9NodiPVVyuv9NVnD3l/TVQRHRnkygrQmEMzh1uDijd9i
	3I++Qfdh59Roi35LM4q0vueAIsC9OtBoZnbFCol2ymZxUenCdPkOtW6d5xcnAxAQ=
X-Gm-Gg: AY/fxX5H71G0lpivI9tnZ5sRRqwj4SIwpvsYgjT+dsNO/LQ64sHJEbpw43nBKeSV8ZO
	WbccGQ/1CegBwp1KGUoBHBvDlHMUuxQNx96yUMbaf4KyY6HC+B7IjMZRZ6TOD6oqwfaJ94ZXipU
	WJ+9K8fUipUEH4ooRtPbNIwpNfE/0rhb/1uC367OF6V5SE2MArdgdxRdlrnUXvbJ6S9ik8pYthc
	TTR9n9yLWoZT6ebY0rCt/wfwCXd7f+CJcX/9wjYisHCVCJTl4BNeacvtgCrSCvBjICzFQbkYamP
	UFpabGN0Hrbr3fbTCbOAAS+kPAPbTvpIdxudEfL951rMt4fdGgrQa1MxiakZ85iy9yIWNRi+lNw
	ZyHpZ0DA/hHxzM+CWpz0w
X-Received: by 2002:a05:622a:259b:b0:4f4:7b79:72ef with SMTP id d75a77b69052e-4f4abd6fcfamr659645501cf.53.1767293949649;
        Thu, 01 Jan 2026 10:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE20WFgF6uiFUXY205JRdsUZUbKjo+NyqH9+Jcy+puXiXLb/gwLgViiHqrINvWZdNeL1A1ivQ==
X-Received: by 2002:a05:622a:259b:b0:4f4:7b79:72ef with SMTP id d75a77b69052e-4f4abd6fcfamr659645081cf.53.1767293949084;
        Thu, 01 Jan 2026 10:59:09 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f7bsm4245998066b.18.2026.01.01.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:59:08 -0800 (PST)
Date: Thu, 1 Jan 2026 20:59:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on
 Kaanapali
Message-ID: <eauy24wd6kyd4rm3b3gjngbkwksvqjmaxg2tufqagvulkvbqgo@x3x5osjcezly>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6956c3fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=snvUICUIuoXJ_myJnVgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: gktaZiWUAITNmbM76khjMZTdITQr1IbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfXwV/lfcDZ/+QP
 ExrPllP1h93XS2xgxwtnpUBJBrhuRHOgVm2RNazVwUvsorPE8m86BIdFFPam0UWZncyEmAfweHG
 +justQ+5xkLH+1kO6mugePA+7XhrPoK5ujIvR7XqdvGCDqHICHVgbOqlcdaeE5R7aP12jE+Nq8C
 JJxFfqeXQcF6yQhhNXUE6r0xzYHicWN6jQte68UDS0B2w7c8BqodEjNfj5vW2om4DaQI2Hp1yCw
 a5uA8oLlNucwSpN/RNGe5NCfB4suukc939MZj4so9GcmwDpoq8r+oGb1HVLx9DGLh+8bQGwi4gD
 d7tNdPHhPK9DYfjWtcIajL9w/cjUseKGgJNHANCyfKutBpzawO4C2mI6Czvnp/EfcH0TXJjM/fa
 +dXMJy2GYfbv16CD3fb/XYofp+ZmWxqVK1yExVPMeD1GoiN2Nk6Oe5Rgo7hjiLWTiEren6OwSrS
 VZzeRsdMFGpEMvGihbw==
X-Proofpoint-GUID: gktaZiWUAITNmbM76khjMZTdITQr1IbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010172

On 25-12-24 12:22:59, Krzysztof Kozlowski wrote:
> [RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
> initialized, as reported by W=1 clang warning:
> 
>   clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
