Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B93246EB
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302320; cv=none; b=aicyk+9DvrfAS93ltxQ7mQMXZsu3uHBlF3iLprldU7m8CKMDcDkAH7GI0VuCga/8Pg5AoCEvvuk8Sc8ZVQhPjaSqbUqJnknHtO9W5EnJj9AP9+gW8c6ucHTaQsN1Sx/MiQ+R+jzMiasU9izvymvW2oNlRnab8Az3ky1Z8EDbz/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302320; c=relaxed/simple;
	bh=DgXVKovqYOMyCgcKbEEZ/ZPvsx9IUv5q4P3uWGz/7Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDwaGqgHCQd05sX8Ljfa6SF+clgT1Tlva+/ham3btGBhZQe7PjEHIraoALAQDNw91uMCEW9elMA6ZOZjwTi+1z85ROf/pYArnGjgZzdaJIhxJzvlS0uIl8guS7/buN5t/RakewJ1BxNXbMN2AJHibocXHQ841LBecct/KXoP4eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jT3uA7Sg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2VENgd+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jT3uA7Sg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2VENgd+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RD51jd3961988
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 15:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BuXcTyTBJ4Pak1kn48bsQ5Ld
	q98WTYIpaFUXS4EdpsM=; b=jT3uA7SgBmiY87R7yPjrSboE8tbbz5bN3QlqVnEW
	xtoEwJnN1EjIuNJ3OxJBrIA1VPcBEDLGdTNi9jmQ6kzq+owxnnzDuH6CZPkRw+M0
	0Pc0qBHjYuQayf3mECwCgFVkmnngQFAyrgWY7JAFe4o6RalZAzsgvta6o9hogAfV
	OA4nkC8cPg+cLPfUVbE4/fbceGpdbDkmAW+kDX1JuU07SmNFWaT7ZBDfj3S+451O
	Vg9Dts0lC0t0ifVuvCxsF/CJXQ+h67aIxYzDPpC/nB883T05KF3WIz3VGft166lT
	7+ps1uSZDGs2LkEKHVAzn/Xxm1diHCRWrCYF0x3TU8zBvw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k31nd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 15:05:18 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12dc1c0b7ccso3101774c88.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777302318; x=1777907118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuXcTyTBJ4Pak1kn48bsQ5Ldq98WTYIpaFUXS4EdpsM=;
        b=M2VENgd+BarL0CCmg/kxuyvmd1ATcePxc0lV+LJZkzYQbxSIx22gwwU77373cBtvMc
         0HUH3iCAAHPGh4MlZURDxkFfKzGUcBBNSK8164EFYPaDVnyJ4wRYkSLN2LL1/Zhc6K/1
         pIgBjXhudmSJbakP5FNv67OmxmiH26tT3Mo0vK108Y1adOB0ZVHROh4vpg9JOxvGImAx
         jsrDhnXUgqwZkJd10FfYgi2Mr4jXSFX1cdUg0MeMTtQOmScciH7M9r7hX4PQXooITLyg
         kDWsJ16u0UPr4DslIPSYKsll09p9GZJemijghG3LAnTqP75DB4O2POJPQwaKaekHJPoC
         Vabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302318; x=1777907118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuXcTyTBJ4Pak1kn48bsQ5Ldq98WTYIpaFUXS4EdpsM=;
        b=JKnn/5XaMV1MOqqwO2NoRfIwmR5DHBG/xeSiCG0vzvoHr0dAQzrknKwO0yqOC7ylUI
         fKRFidnaDPS/ArbBVNjIyqkHRYCqTCJKqeX8GuUl9QEhG3pppw5NXCtdiVoI68IT+Y8p
         AQUafn8ygsn7oQDDs8M3Odm4IFuwKMgZ+dilO+sAtxYC196wzQX85sQK8/IjbXs2otRU
         MZtx/vHtB2mcJg7IGV5nHUTbPdn+O6jK1ShsQo9TKbvzFN6Khu0Pn4zYVovAmxHkl1y1
         Ml1IpDCBigoSzqlDRKlFM1jq3TX1zgYEdIkhhf9leho2e4epDCDFw2wq8fSf5w2K6Em5
         puTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AXRf00Sfy6xs5eHu3a2jihvJNoerHXOlP2w0zaNuD9RBo3hTerie5fsVcEL7TLudB6VM8OsbqRXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3osf6wjhykd/oc1mE7Qrm7TISRlhBOt1BfZsJ4yeMguvRB4uF
	e5D6Ce4dmvesiTTncRW54a2By21q/ht3NUvV6ue3qLZjRZ3TL92WRrKZH52J9ffeFmlyA/c+e8b
	N/d6eCIjrjeCTLrJh7Hjrjxv8V+KEpouIKIncDqPMiD6oK2hlDQ5Ep0M05En3bj8=
X-Gm-Gg: AeBDieuLN5uSfWAbeNl73LwK5KIlgdhnFc4uUFLGQNAsM2dySDyFNuOmNiMCb0e/t4B
	PJAL5F7JIwnfUpacIgFzu/y7e0mc5NigW/myX2KIVQtZ+EKrEMlSPEMLvFkVZQxgWWzwej6SHYy
	sPGXxjHtDzuyczwRWXx64YBrjmSuws7taA8K8DH+n1h/SB8B7tKoi69r+nOGhoquG1zdUAuhIDT
	WMJXRhdQXMX1NshPzerk4rPJDRRguoQy17zncEzGO7kh8S1ut+58yrpaqWybpaVgFoXuwoOcpLE
	xm9NCEMuxTmkpd/9fb3Npu3YypRYvL4YFwt3QxGac6E6NZvH/RISvFtxQR4Ra3NZdsID5pqUKha
	0HdwpEjOODkHhPCJ2uxWkZnyHxVAXkwS+85AzlQjOeW8WASCLeAYNwWGJcFAW54IngcooiBan7X
	8cLcbAVJjQdA==
X-Received: by 2002:a05:7022:ef0c:b0:12d:d496:a964 with SMTP id a92af1059eb24-12dd496af49mr2155419c88.20.1777302317720;
        Mon, 27 Apr 2026 08:05:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ef0c:b0:12d:d496:a964 with SMTP id a92af1059eb24-12dd496af49mr2155376c88.20.1777302316982;
        Mon, 27 Apr 2026 08:05:16 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm42339974eec.25.2026.04.27.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:05:16 -0700 (PDT)
Date: Mon, 27 Apr 2026 08:05:14 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] clk: qcom: Add support for global clock
 controller on Hawi
Message-ID: <ae97Kh8kAIDOs15l@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-7-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-7-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1OSBTYWx0ZWRfX0b2SNL4F2BIh
 C4XtSlv6E9/s6ACTbqdPNMBI3KKh0NTBfhKQYDPzAVO5vQ9ptigxOviMbgye/X4IEcXKHgblHtC
 aNQeJf95Ywu192Ds0jCvB2mnCpfnL6pD+bpqVmIeeZMSkQeIyVlvURdbC+Xca/n6q5x4KL4IR8I
 +KhZUE7Al44afPphOpHn4wf8/Bva4GsYmANuTQVyWpRjbJiDUFYPSU25vIvN+TEut2Ok1mXpiVn
 6pf8EppAQIuv+Lz0RxIS/pgg0qa+R663yJ16KBxQ/QDhIW7luhjGlaP7YXf8ePl1/nzyLkKY5HI
 +U+lmcel+N0FwtZU5hgh+rnn4ehX77cmxsau8ej0P98aroDkS/NjsCft0Mrnum9EdvBRPSTJ8N5
 ycY+2+i9K+vL+3wDIjxAr0tSimemYN8VXed6JTRdca3TO9PAzGW1SsI1TzplU64HJ9luLDEDQVi
 Wq/n9bLVWPvFdqJq44g==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef7b2e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7t-CPqBheUaPz9YIfAcA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: jlV7vvcqGyR21eyDtr_EFR1I6ZLDKLWB
X-Proofpoint-ORIG-GUID: jlV7vvcqGyR21eyDtr_EFR1I6ZLDKLWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270159

On Thu, Apr 09, 2026 at 01:51:41PM -0700, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the
> Qualcomm Hawi SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |    9 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-hawi.c | 3657 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3667 insertions(+)

[..]

> +
> +static u32 gcc_hawi_critical_cbcrs[] = {

This should be const now since qcom_cc_driver_data::clk_cbcrs was
recently made const.

> +	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
> +	0x26004, /* GCC_CAMERA_AHB_CLK */
> +	0x26028, /* GCC_CAMERA_RSC_CORE_CLK */
> +	0x26024, /* GCC_CAMERA_XO_CLK */
> +	0x9f004, /* GCC_EVA_AHB_CLK */
> +	0x9f018, /* GCC_EVA_XO_CLK */
> +	0x71004, /* GCC_GPU_CFG_AHB_CLK */
> +	0x7101c, /* GCC_GPU_RSC_CORE_CLK */
> +	0x67084, /* GCC_PCIE_1_RSC_CORE_CLK */
> +	0x43014, /* GCC_PCIE_LINK_XO_CLK */
> +	0x6b088, /* GCC_PCIE_RSC_CORE_CLK */
> +	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
> +	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
> +	0x32004, /* GCC_VIDEO_AHB_CLK */
> +	0x32028, /* GCC_VIDEO_XO_CLK */
> +};

[..]

> +
> +static struct qcom_cc_driver_data gcc_hawi_driver_data = {

This should be const now since qcom_cc_desc::driver_data was recently
made const.

> +	.clk_cbcrs = gcc_hawi_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(gcc_hawi_critical_cbcrs),
> +	.dfs_rcgs = gcc_hawi_dfs_clocks,
> +	.num_dfs_rcgs = ARRAY_SIZE(gcc_hawi_dfs_clocks),
> +	.clk_regs_configure = clk_hawi_regs_configure,
> +};
> +
> +static const struct qcom_cc_desc gcc_hawi_desc = {
> +	.config = &gcc_hawi_regmap_config,
> +	.clks = gcc_hawi_clocks,
> +	.num_clks = ARRAY_SIZE(gcc_hawi_clocks),
> +	.resets = gcc_hawi_resets,
> +	.num_resets = ARRAY_SIZE(gcc_hawi_resets),
> +	.gdscs = gcc_hawi_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gcc_hawi_gdscs),
> +	.use_rpm = true,
> +	.driver_data = &gcc_hawi_driver_data,
> +};
> +

Thanks,
Mike
