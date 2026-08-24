Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC4738DC43
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558268; cv=none; b=Ckmr7Fw96giLUp6syIbj+BKpjjUVL9oEa6d/nzkb91TsnWXuTqC0TonZhdxRTwM1ysDkPH1UU7nPjOgbTHcnHNeGFbOGLRht8cPWvExHKvhefjOouzCZXUmCRx/H9Vwt0bQpk95llO4n4T6mNjlDqhG4/MrBHnFY5qwOLFsDX6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558268; c=relaxed/simple;
	bh=GMRE8o4FYu0fpDK6C3DwWUu00g4PLrDg1fl5q+NGQb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxHhX/uvvAgecINCq+WiFJor5p8iGsnard0aIcpAlENxmdoKcRXjJTrRJgxEtEqkwVycOWaDg8L6nj4Uf1tFPvSQUw0mWeVSxfPxs9IhltLfTXOIg+vF5s3KY32fTXcNyB7Xpt/NtAsWsbGQbDDGpU6jx9w1vOz0Cgaw96esAg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovgqGziC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WheRhPkc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovgqGziC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WheRhPkc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RAUl1937628
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oczCj5f3UWMs39FGECP1/K93
	ViDAX6FAuEBjSlTzqVE=; b=ovgqGziCxKRiwicrKzukwp+Vw5GFK9548mfORnVf
	O53d80Esj50DcLKwJfUquyd8gQdmqd9aSE/jKEmLtsk3GpoBqTBm3SfpqGZ2PPbk
	WeVczAQNgwfIUaGvZMIqQ+p7XAgir3mldG3r0V3SuJIlGlWPouFEaNP7SwPhsYlr
	QIMZxlyIKlNquzN9U9zhbQLW3lCY8nwysjlZ0KjX6lMWSX6AkR/zqURB9v7gaXqr
	tlOr+uiMEaEpbp4AgdAgEO3fHVp+uvahtZoeyhDQsPpfqskTIJvU7WfA/TE3dpQH
	OvU5BHt7zntrSmyLXDiH+BVHbO3wDe6CSWdm+FTdbJBfNA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qx3c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:57:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77cc8fbe356so72782137.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558259; x=1788163059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oczCj5f3UWMs39FGECP1/K93ViDAX6FAuEBjSlTzqVE=;
        b=WheRhPkc5jYeuWCzWZR8BTMEHh7RfQrJ1u4iE5M9NatBHapUQZnmrw6kTX2cd+vN4L
         8uW94kV3+EZQi9YowVS2ss2FAL7gmmhnC2O3yYy03cQWH5PTQ/8xjtyWhoC1rRgRCNTh
         ZD7P+6HLPxtsJAypX8PrxQmST61gn5Dj8jSzhC+cH4X2oOsuD3fxku7v1r2A0WGjF69A
         8xrb8FsziKHiOngIfs9mC+PlYPetyNeujRVAQqTR6WM+lT9vH+xVcb2lomP8QExfMZkW
         h4xTkcx3DUAiCUG8TjEsCcqhKEcCIoqGjTGiplsFOEzskVn4kSZRCXH/Bk8dIKYXTAv8
         dCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558259; x=1788163059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oczCj5f3UWMs39FGECP1/K93ViDAX6FAuEBjSlTzqVE=;
        b=aTVIyTHHpYJljwzQUZlWeFKvtG/WfekZiLQTsjw4rinyeSBGJUOQp3Y2xqgrNPYtVU
         bNt5AHbAX4homl+K3GKB1rmhp7AjP+rB86m1NOINrxfGn+8r1j6kLpWBGC+WTGOp9oGt
         zPsLhT4K7fzY/5vJJicidLoBxzwy2r7/BmUXIdv1z0EB5H6EQjB5mZQY3zH59r5OkqSO
         ZgFNqrgSxUxkdZwj/5XaccPLYslFI7IsetHvq6UK9iTI+Nnx7VDpi/W64eAuBMKSePqB
         8+VJ8iaGvlOb4tC7OCEUyepROAUtXz2YczhYT+C/+e3YMSMeS3wmwjOp7kGm99c4qM52
         qYaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1+5pt3gB0wwIOYotNrAFGcqs6b2rZwXHm5SyiH3G4lLlkByFb76z/rYVi8Oyv/8KQbyge0upAXDY=@vger.kernel.org
X-Gm-Message-State: AFuF++n48bB9L28VjBTMYEejqT0B1/LWtSblYFGCH8U9zzmtr2EO4/Z4
	ZwDLI1sgG2R8wdrOz8int0a7fxVMS9sOO7N1M/E7oN8XIuzuaqYzkitRcTQH4Upx+dF4xOWHtiR
	PGqE3NhGtzpX99Rl9VPmsXHRVzf4au8010lKKXfN3A3NdoIW+JDbcw+deqtLJ0wnivQYl/yA=
X-Gm-Gg: AR+sD10A5iv+UeJTXqQTxpfmhy65RJuafYRZQrTSuzuLWOEcL5V68lM4VrTK7lh7xBF
	8a3e13k5I1rcfPahI4u+uZV9OP3jvBBQLrSNQztsIU8Ll9O+FAPXZkxaHNZjcl00lrBA5SpI/vA
	zpH1lZqiu8J683eAOcBtSkU0M9oKZk3+CvvLe58CmAv8Aumysdwpgxl+V187OdheEjPR5WpuLm/
	8e7tzB7pndPQQCLrLzGrHy0TJkdENom2Fa2YlgU070t1YKIjXwVDx1MwaJTVCkRJMSnxWL9Q9fg
	Xghsfg6yd8G3UyhSsSO5mDZMQYrdR5NtI1o+XO9SAUwAY69jxPpt+zDe7eZ1yOn555FMj9tjpaU
	EIYzwCTL2OgeRqEg=
X-Received: by 2002:a05:6102:2d03:b0:77b:2d24:db60 with SMTP id ada2fe7eead31-77bd3189574mr5175328137.10.1787558259427;
        Mon, 24 Aug 2026 00:57:39 -0700 (PDT)
X-Received: by 2002:a05:6102:2d03:b0:77b:2d24:db60 with SMTP id ada2fe7eead31-77bd3189574mr5175296137.10.1787558258934;
        Mon, 24 Aug 2026 00:57:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm8633622a12.1.2026.08.24.00.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:57:37 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:57:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
Message-ID: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX+uOD+E50+8VL
 eBMmspmkNeQjSHTApOmbpWGH9Ioy4jaAEDZH4NOqebsBoYmZjts5w+8tmx2upT4lpxu2NpKXX7u
 hbYLLaGydS4lHExPUE3ubBlSMt3mE/dM8dzgbKGrALfgD9DE4ZTDlJk+xd5JovOYjgIJKbvji64
 ZM/xTVh/zBNH2ShZ95fMT1sIDbK+IfNHUNw2b0KRjZK22XOXsyYWpxyD/++1/Wj0IiPRLP8GRNU
 UOOgWHSWwYDi1DmijhOE3PcrODh0g3Umg4XQftlsI+Z6BgZoNM10Njxbjnt1zwBaWZidpVvD9pk
 UJeYVopQ3Tp63WjFhb2qu+Fk6mWVSCMDISIbYBBY8dSU7GczgIOwGnuEVABy7ubV03zURoInfPZ
 6tSFmZ+eKj2QMYzr1or8EdFd0BFCdl3noii9h3udOQzJ9Px5S538fkZmkjDpNQIWBNdZL5HYKPV
 s06Ye3Vq8sfcevPftUA==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bf977 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PAQKBgKzElogREcGxNUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: sgwJPIfxLg6L-7JBz-Nze4UPu1qgFq6p
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX9AmiNLeQaxjJ
 jRYW140n6c2rnYPNv8rRK7MVWtvnlJukidsEew7+QNy3mq3dAPadiiy+aAJuZeSLHgFrix7rrh6
 r4ut8+2eaKVCOXP2cCvIhgTYmvlsAlw=
X-Proofpoint-GUID: sgwJPIfxLg6L-7JBz-Nze4UPu1qgFq6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240069

On 26-08-21 21:39:00, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |  13 +
>  drivers/interconnect/qcom/Makefile |   2 +
>  drivers/interconnect/qcom/kuno.c   | 977 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 992 insertions(+)
> 

[...]

> diff --git a/drivers/interconnect/qcom/kuno.c b/drivers/interconnect/qcom/kuno.c
> new file mode 100644
> index 000000000000..9a5bd53e7ed9
> --- /dev/null
> +++ b/drivers/interconnect/qcom/kuno.c
> @@ -0,0 +1,977 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */

[...]

> +static const struct of_device_id qnoc_of_match[] = {
> +	{ .compatible = "qcom,kuno-aggre-noc", .data = &kuno_aggre_noc },
> +	{ .compatible = "qcom,kuno-clk-virt", .data = &kuno_clk_virt },
> +	{ .compatible = "qcom,kuno-cnoc-main", .data = &kuno_cnoc_main },
> +	{ .compatible = "qcom,kuno-dc-noc", .data = &kuno_dc_noc },
> +	{ .compatible = "qcom,kuno-mc-virt", .data = &kuno_mc_virt },
> +	{ .compatible = "qcom,kuno-mem-noc", .data = &kuno_mem_noc },
> +	{ .compatible = "qcom,kuno-pcie-anoc", .data = &kuno_pcie_anoc },
> +	{ .compatible = "qcom,kuno-system-noc", .data = &kuno_system_noc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qnoc_of_match);
> +
> +static struct platform_driver qnoc_driver = {
> +	.probe = qcom_icc_rpmh_probe,
> +	.remove = qcom_icc_rpmh_remove,
> +	.driver = {
> +		.name = "qnoc-kuno",
> +		.of_match_table = qnoc_of_match,
> +		.sync_state = icc_sync_state,
> +	},
> +};

qnoc_driver_init() and core_initcall()

then

qnoc_driver_exit() and module_exit()

Please have a look at all other Qualcomm interconnect drivers in upstream.
