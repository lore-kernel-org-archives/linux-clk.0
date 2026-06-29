Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3BA15B998
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732435; cv=none; b=cFLsWfuEFSaG7KhHSbfWOtLT5IUEtz3V8o+WiDsufi6Bo0S3P6wow4BMAWKKxBgmCX0yDza28anikJgGxPf/QyiTZvobaNslFxakoEd2Kf5N3yJhllzWWu1vvP4c+BUX8/wysXeu0x8WWWtszP24wory6FW6u2JMqRplpHTIPII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732435; c=relaxed/simple;
	bh=5y/17dYe+Bvw0qBRtqA4kM3JEDkLAjs4N59TrsSoxLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulil7y8duv7t0wmrxzb1b7dXJOVZlBXMYLDIh+E3FPxyi/VPZElOLa2TWS4vAw9OVxjmb0P3lB4MUUa3xMbIGuHWNh7U9K4vr0VYo+EzKvYP+XnhSmpuTI9f4KzWXrMdfuNq0NaLswcuQwR78fMAQ7VcdRni4Y2AZ7nC0AAohqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pumQgj/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tjol5TeU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pumQgj/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tjol5TeU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKFo2656155
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 11:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mkl9ZZvS8Z3Y+zNIIUBowVu2
	nI0rBD9T8F6UB6fM11o=; b=pumQgj/omUBLfnKfponUFIXE3Fj3qML4892AP3iq
	sS+83arkhEF0+gUGFm8TQ0h3kR3Ea6Ci8kxBRBeQRTvAVbgrATtlo2z1qBbnkcqK
	GSYkJA2kJjviKl0xbyB0CemMSMWySb47hQuNZy5A9O8waSuxK8lsM4m9k/kmmvvT
	i6JkqFf++t/KeRXvBqiWnXvBubNdRsrmbqnCG/P5NsuK/RrwWrGCAM854hocdwQG
	k7yqzpketgkuCJ3NdRdSC75hYLVkP/2jdipqEm8yFX8dSE9nT9uLki4Akp4txFco
	FXzlDcL3aRmhX+QSYbT6BzR+/Vel7jSBdoTLvAY0SvFcxg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7ght9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 11:27:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e538afe65so123702285a.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732432; x=1783337232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mkl9ZZvS8Z3Y+zNIIUBowVu2nI0rBD9T8F6UB6fM11o=;
        b=Tjol5TeU5gM7TOuRdQJ0LQ6hngiMIi2VVM69k6ttx1OtCcwvyjbP+95x7s4AIYSSS6
         h4BM5aBl3YWAtAyiytihuVvXEXYHmhD4ODFQSUty0w1WEh3QkpO/Q1tfTMB1FGlmYMig
         hrAiugFCkfaWyE3YXu4mqLEPbykCufp1pQGFp0EOe7v1qcgAi2mJNQJFltE4ajbMF0or
         X9x4ix7XYQa3mY9Gkevaz4zgZBMSuWO1wsxJgiRiGZe2ZNLX73dW+iwpKwy6Ki8ce+L/
         xeua54+ba38muksq7ZUZ5R3hEVEvc+EzHY2uyIgrTrRB0xZOJTtypVutlYDgVT4zaKSq
         rWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732432; x=1783337232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkl9ZZvS8Z3Y+zNIIUBowVu2nI0rBD9T8F6UB6fM11o=;
        b=kBItHcQwWQ/ieiBuwQvJO5NLR07apCBeyaS6wBaouwRtfx+R4eJWu7fNhVLpNBdkDT
         1dWjwgv9ocO0uQ+HsHwebQYJNC7lRtxXzA94KzzZQJm3KJwxGooZ+UI3ThmftqFblrGB
         4zPO9yyeklQZTn1B77lDk0/bFk6HpFbTp8MkCgMbDQnvHmBtt3091vnCZXcoeYv80OWM
         meB87fTNykI6h+XJiDiKcm/R793ZNwk1r7PGfzk+SvFJ7veJeLAvaK1BsOTNeP+xYHGl
         Twh1Z1MFoW0zqki/B7vD75IgWJAJ0uBIn4Qcctwx1zwjcVcgbgSX5KQhLUFZD7bnbUSN
         GxIw==
X-Forwarded-Encrypted: i=1; AFNElJ8/3ULCNhTtCHLs1z1lx9VObdlWiJQBSBU12COJc3nEt4KBJpV6HRdQZfFRn5DyAonlIBr3rN9uzFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXAPWIMd2JPV2rD5fQRECvwRx2IoQi7lugaZiWM4UDcoGYnkaR
	HX9AFKOxsPC6o4PYK8hPbogaELByDqlwoe/tzf3lgUEAyPF0g51nhHCgNJnlezhTYefrESPamLx
	axAkQ7/NlFZXWKrxCg9fmOU5fxE4SgO9pcBDtF0mC3tHKDe31Jh+ebBTxfzW9WP8=
X-Gm-Gg: AfdE7ckGLrUV6MxVYWuomfD06dSOobCX3qM9JzxXleCZ8Ldose7Tu5Wd1Igs6S4w+VN
	suGd4ncFP5WiuBZhUBohsqG7yfhxf/Fg8RctKStkm1pPGUgAY/spM7R7j7p7qKxfM3P/iz68QVc
	7LU1W3YTvfeFGbhCUHBP6zYbGcfH893nUx6VCRu+LD/3qWLBMuvqTTmRfYtKbNFKcveXwPU0ld1
	NlFVVXzNWsWtI12DRn0oqHsY6KnvvunbQsbjTtVCNtw6rHrZpVgG6tr1rQDBZKjjKPrxcJWE/7K
	jj7vtbu1WQlgWob5rb4dYbVnavTD37WE8leOiwGIpmdjPeEFZlPiXHQYiKnyuUag5v7A7W4JDmO
	MuHEXXjRBv0s9woJhFi1Pow==
X-Received: by 2002:a05:620a:1794:b0:92b:a2f6:d1a9 with SMTP id af79cd13be357-92e5f3fb05bmr45399585a.44.1782732432395;
        Mon, 29 Jun 2026 04:27:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1794:b0:92b:a2f6:d1a9 with SMTP id af79cd13be357-92e5f3fb05bmr45392485a.44.1782732431659;
        Mon, 29 Jun 2026 04:27:11 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm537854145e9.15.2026.06.29.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:27:10 -0700 (PDT)
Date: Mon, 29 Jun 2026 14:27:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src
 RCG stall on Eliza EVK
Message-ID: <lardu363empfwocbf4g5z3ndb5tyaa6ywnqusuzea62435vvb3@iu7qzomz4ijv>
References: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MyBTYWx0ZWRfX0libIWeA3JHB
 zc1tHXQiYHlzRNUy1eSK/pHLf2ijVEKX7Sqmm+48zvHJOoK1yANjvQI4c38r2cGuzORPMKVlhfZ
 ZEHC3lTQ5lTb8bjP7/Waknc48OBfGc/mRNJ8gOneg+8a1VMKX1FcS31mmNq5AFT+15d2lf9//WZ
 twN6u0mchVzkktt38onpNFeT133R8UVvdkWW2hf9qOc6M4ZKI9idvxGKOpsX1/z+5Rw2gLQel9j
 9nLZWzSM89725mtXq57uDI4eBgjwhHyGbV4ZJZYaqDaPToUsV3nF3WT4TcjTcAV8PwG2bDDxvc4
 8GY2SrCr+PhKqAtegdl/rKdDM2SeGyxt7vsN7cG8DzTN7w6lZO7uMk+sT/0S6XTTvsnLeaDTr0p
 CdWp1wvAa3hfVKEMfG281SAsUs/5fqCDOIQyE0pZipblKDkUiY+jpBNY6eiWgFIXY1L+EfTnnU+
 L9ygB4+roZH7rZNwyJw==
X-Proofpoint-GUID: PPBOycyJBuZk-QCiChtYwDSwR3qrMv1E
X-Proofpoint-ORIG-GUID: PPBOycyJBuZk-QCiChtYwDSwR3qrMv1E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MyBTYWx0ZWRfX3UdWX3CrAhqx
 9C/t+4tVDejxfNRWFtUVFB41WjcCBoFES3mBs57lfFmtlhQzeGhZxKyKpKh02mONotTy9P+e6qd
 RTE2b1GoeXVPgpSgzanteCLsxdUl5FU=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a425691 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NLju79vw_jn_z0NdLzsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290093

On 26-06-23 13:56:45, Krzysztof Kozlowski wrote:
> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
> Display Clock Controller is enabled and references parent clocks from
> DSI PHYs, which causes clock reparenting issues during probe (init) and
> warning on Eliza EVK:
> 
>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>   ...
>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>     platform_probe (drivers/base/platform.c:1432)
> 
> Fixes: 0e66f10942b5 ("clk: qcom: dispcc-eliza: Add Eliza display clock controller support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
