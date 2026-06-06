Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED4623EAB8
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745730; cv=none; b=MQ//u0oH57kLWAQ6POeqotz2DX2iVcQ8sXCS0TxNkJqRE66nJV6hUlc9erfv6/mx50DGtUucg1uQHz/PyeVfeGz6J5ymqZdlWHjLi8SW3FaJuofwzSjv0X32Q+3xaVA89susd7g65prDVwIwj80KX3JxUrK+GLoBMxlO+h8/kns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745730; c=relaxed/simple;
	bh=uNdueR1Nq2+/2mkXdFQFHylHgZEcgPJArgWDAINFx3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwTtgrmi1U6SZ2ptNplgN9og6vypiqbapKxFbWJnjY7Ttas1LRZ1YLxpbHKJljcL+AJPmeL6eeIbWvzMxxy/q4hb0lMVW9b52QJCPQZUlcMY5Yn/0aM61hI7i5RNRLymkT//1SJ6AZUt9MtodDJQItH/9Ea8Tl255Q7BOzTCVsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dyh0Ncdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TclADoLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dyh0Ncdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TclADoLd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BHQv21250931
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K2eoP/NzpVpO34TdHsZFoeE3
	+eHyzR4upcTrGDql8jQ=; b=Dyh0Ncdx8mDba192J6czd57AGZXYl6/05bZhA5J/
	kG1oJPztyxlOm7cjC19NUZtWbcXAHTRyN/hx4fd/1dgAgp/wL31zO24Wu1uYoniG
	MQSXVDVjXHiLrvJfhNDlwJcXpt6lNPNGeIeJUC9kBkDo1772v1JhZEBppEXGrnbl
	3n50G7P0nuodR8ybmxU7rOVrPQfKdteDHNJ5+k/cOMLwWizOhh84LAYMME3lw68l
	ZW0i3Tpj0nMy+n8DHDUdSDxq4kN8LT/pEdbVDRmUAMa1DOMuxZFZk9+ED2d57/XB
	WVT42i1/HXyNTZm4NExqT8IHPoh6lZ6oZ44MlZFzTRKF9A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf14yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:35:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c67361f5easo5094047137.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745727; x=1781350527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2eoP/NzpVpO34TdHsZFoeE3+eHyzR4upcTrGDql8jQ=;
        b=TclADoLdNZCCfvoywOkOCjhJETVYgbdZm/uyILYEi/fk3tNrU7wXviEDIhXc8ls4/8
         qyrDkGI9/fORGZsa2SfDh0p7mLToT2aAHh2zWkEAY2xn9qvD2INux6eKoJAgro/wumt9
         oLNnimH40h9gaCW/d5YrOLdsb0gSVaGT+FeoRof2Kvobwrh9MysknRjkMhTCRcPLTC+q
         tFS2dYFlwddBHY3VteYuDBvbCPILsU3d/a3hMAjShJtxWXo6Yz6ZBAsFiBAHNxIkn7HF
         P5SsZNEGXdr1cvdsfGugbpK6tvxvYtgp1ZpyLngLfMAvVu4YIQh9mZGYyg+AH/NB2S8F
         pkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745727; x=1781350527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2eoP/NzpVpO34TdHsZFoeE3+eHyzR4upcTrGDql8jQ=;
        b=bgpmeoG6ceGPkBioNakxe4FMOI8BUdeZZfO++vTPeWPVYdIJlKDjMORHVh8H7d5LQJ
         wjrJIUN/+edysiWXmPwYFgvJygmDQ0Nm1PFrhK2ngCk+c2UL8GUlWBhG2aIfc2dbkVwM
         Xf6R5a3uMh+7CWQHzplu+eoLYViWM7/CSoa1LJ24xYUbXG9VUFVoggkEUDGqg1Pyxohs
         6huH5+M2cw1s0We+cJYpUG+Zluo09DZsMXXiQu9f3drtGo7Em9VvRnAOFWXk5enL9h1T
         QkXdnQjGV+BoFivm6L+d4ugaUsWQh4qpICJJ2EXe2D1IX8bRsf60oS0gQ5D+W7RYtHBe
         HeeA==
X-Forwarded-Encrypted: i=1; AFNElJ+hLNJg8B3NiVUcv7U1S3g0IyxWmzKdZJ3Z6pWsn3fn8r03VsAYkuLrDFLQjY1l092NpDQKXbEcr9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFe56RfvX9dJmSdKpDCJOHG3dRrg6BJFJpu78NplbYd7RLJgaK
	1tdb0rOLJpLxvNUK54aCMRnaja+M7OMV7dIlVukAIaSpHDV4/c7iPrVfGXBUo1r8Jb4FId/vygj
	u+Y34zTdLDdf45j8tST5yC7NTIWzTrcqSXWR8Ywz7fvZDNIoQ9+xiJR0CFu6bQlI=
X-Gm-Gg: Acq92OGEfXLzh7nr8lwXpE5oVKOqLlsflaZbN7p5Opr/E0dttPlKv+ck5QhKwFaVQl6
	+yexf1pTWhK8QTtbq7R/KKHo2jDWaQ5FECwDF8NtPlRs93Pgf/CqFvzA3CrRUTD0e8F5kusjX4v
	CSyEO+YYKvuDFZkWk3D7tgsJnm914ws7Qz/Vabe8xS1lqMAk4L2HMmx36SVRznbLnxw8RVWjbiI
	t/g5tY6t9m9CcNdT68i0/H8tWG5ADhruwDt3VKH7aPjqqFXMuv4N+npxNl5UL1F8ySK9hhzHQcd
	qAi1aKJ9ngomyLVZaaiZlE5v0Wmv1qY0/U7zR1T9uKhY6qzeVMSI5LcdVxp0vFCQwVmEPEvrfit
	7R1sQ4KVZuuTFqG7vAV9AnAUfotCig+n+KvuBFIrumXnbY1O5snHeuWLoNEVQs3+hTGG6vXk+P9
	X32PUE637JnHeW3pPPtZGzcS8fIrVw+D1o1UwKLzzVkN9EpA==
X-Received: by 2002:a05:6102:46e4:b0:6c5:b556:6d50 with SMTP id ada2fe7eead31-70035aed2b5mr1840527137.13.1780745727449;
        Sat, 06 Jun 2026 04:35:27 -0700 (PDT)
X-Received: by 2002:a05:6102:46e4:b0:6c5:b556:6d50 with SMTP id ada2fe7eead31-70035aed2b5mr1840504137.13.1780745727070;
        Sat, 06 Jun 2026 04:35:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm2376921e87.30.2026.06.06.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:35:24 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:35:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
Message-ID: <2c4insgmqmpk6zothe54ktcdrzkjbbaiql5m3csagq74znnprj@4p4liju4xcii>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-3-a0a7bfb44455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-gcc-rpmcc-clks-v4-3-a0a7bfb44455@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a240600 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NxhCX_73iKeGXg_BdwEA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: X1nxHPQc-eq_JCt4x2hSrApUx58aAb5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNSBTYWx0ZWRfX3Sgjp6ah7vdP
 twfocOoD/gUcstUmy72ewl2eDUw/KNIW8beJnQOZbEnN2e25kZPAi3dsozlToNvC+S3FPcjY3kz
 CWHMBuLLv1xd1Ufr7QheqYQt+RAzxSwwsC3aGlwP4CtNvEiBjDJKBV/NfGy7zXstLfnTMqi5C1a
 O9zIS00BWmakTxNOdrFrHB0r6/vmsjoELzeYE/3kgVqAMkjU88m8WMnX71rptoIkRRvqjSyuNVU
 vvKiCo8NeFtvGk+WrAg2T1bKb7P0I0pQSzlSJwJBO6fUVS2BuRVqkAEnylVwQ3yIIa0foHT1XOp
 FzfztyKQnYWl29BMmm0nccdqVa/spUGkhbRbYUIhM8V9N5Qn5XWobUhBxkTP9NME0DvlORbN/rx
 6FJcrjGQjUa9zUVixCgeHR8xd0+LXziO5hYIczsy+RPXaJHabEGKBo86wxEEjDxtP0lgiVQkAYS
 kCkNGWRhNWmueyVcNtg==
X-Proofpoint-GUID: X1nxHPQc-eq_JCt4x2hSrApUx58aAb5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060115

On Fri, Jun 05, 2026 at 04:49:13PM +0530, Imran Shaik wrote:
> Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
> list is same as QCM2290, hence reuse the same for Shikra.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 103db984a40b950bd33fba668a292be46af6326e..d0d19bf0616efd5f1bc2caa037ff36d830a3495c 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1289,6 +1289,44 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
>  	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
>  };
>  
> +static struct clk_smd_rpm *shikra_clks[] = {
> +	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
> +	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
> +	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
> +	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
> +	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
> +	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
> +	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,

Are there no RF_CLK1 / RF_CLK2 on Agatti? Or is that another omission
during porting?

> +	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
> +	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,

-- 
With best wishes
Dmitry
