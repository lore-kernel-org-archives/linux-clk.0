Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C6245019
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 02:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782268989; cv=none; b=Ad63tRgd1VLDHtNl08IQaBpYJFCQoPflelGgAJuIe/z5N16LkWjDV/VU6erbwdLpx9pkHnLfzGrwkEjoN0JRWk1gU1sqBwn/MruTewGWzI5kw/U6Sz4iasbsAI9upv7myOwJVcyqxRw27hpqy3xRCqCYzPafHWxJkqprhVDlHK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782268989; c=relaxed/simple;
	bh=1BUkjsbXJai+1Y/OyCBHxg+SQuJVTVgUyXJfQqGUeXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqC34tK/ywvG1YqauWzNVmnnzmPJNjImSAdD7mL6p7aBKjdVZQUNju2trmeq0g1j5y59dPZ69vjLWsO3kWw17Wrv1lOMjg/axhEs3SYNtyO/YawQRTID2H6FDFnqs3SOPr726SFANXyYYooWzEExaRAner08YIP9ArYaRCHHwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+/vqGOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfx00ODy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+/vqGOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfx00ODy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1T2B54146551
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 02:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xBXRxomKqNN1kZzaPtiFIXNw
	qHBxEiMa6YFVXqngpiM=; b=J+/vqGOcxPmiitqbT4ZQ6jhFDViAQ3zM665ZnVPU
	tjYFGex99L5nwCL6K23JQv7dIf00H+7AN6cI8uKEQnpZKHwjzxqmR2ZL8F9rvWK3
	U80WJBNLcwkBV2mQlmiOCwOh2+1S6M1I4JHAqEL2tqRoMAp+79IGx1OSQ9IsgvLO
	2G/zS90V1jdKT+uEbN4yiuYN+9oPug2ECOSaXu5zSS3JoqmMgrzquWg2+7gtjMF8
	EpVAZIJXufXhb4trVXXpA33ANnHohTAkkhup95A4ysXZC49754lUvxKzC5HhD/hD
	wEgBAn6dXFKDayekajH2W7Ivnc6jBxLcRpnfOdMWC9he2Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gv2sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 02:43:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcbb34e57so696016eec.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 19:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782268986; x=1782873786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xBXRxomKqNN1kZzaPtiFIXNwqHBxEiMa6YFVXqngpiM=;
        b=dfx00ODyUz2gb/xF50h2Ggs7tmxLvPdsAIF1vuj33UbBkpxS+g+xbnZ8RGM0eagfuc
         z01Yb5/8uaBdLOSPjM9ME9l+bGl06cjfRdL1E3hrd7HVzedszdaq3RfK9cRfmmlI3D9m
         5unyEPSsmMhUWTY2+flMZ1sMKeov8RE5S9Hwj7xkqMrGFSq8fK8WgqjmQsksFmFgM/Jh
         fOfy8C/TmUL85NC5uvbQpOVnEeW3El47joQKawoEnUelQqBZ4rh1wjch1HkyV+rzL/N/
         tNFbSJaVz7iWBuiWPkr2yKFqteclQki+nc4htXwSES6sjaaU308dU1ZRZNOLzNXZTtUk
         eQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782268986; x=1782873786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBXRxomKqNN1kZzaPtiFIXNwqHBxEiMa6YFVXqngpiM=;
        b=PbTu2rX4ivDIrm38eBJ6bC882w+c7uwAQhjV3jdAhiEKKOAFLHCYEZLSdwKhNY7V+e
         0swgKv8tMATrq0OKIc5B1FLQtf4AXTR8fD0zSMQRT/y9ZA6mcWxSLv3UvnSBcGNi3fcT
         1ejxOAW+mxZkWfkpL+1P4f8Q68TQKKEMpJz2r5t2Fz+wFTASwp2jEoOL0/WiTUkUSLYy
         Vn1YdZ7l8+j0AX5vs2uCnJ80R9hvbhwRT7gvzeVZt+cSQJniIYRN1vlxMu/x19LRLjTh
         ZZ7W646w6mUXd5neoNMmRCWwvwTjPL19dyAMB4HcfsoP6gzVd7rg/ZD/adhGD9b5kDXP
         lRZA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4cfuYl8ZpT3ebVq8iVKZBiC6X6ZUJCbhmBV1VdfTxbnP9zgzpQijGfQWLda5bZ0ddI3rilOyshtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmlETH2eWK3TGD/5li867k0rRN/VZg22d53Wv0qijCufpHKnlJ
	wRHtp6J2xv96hgDgSa484ZhSFZJATth1NskGDxHbvMhTVAN/Kcsx7Nxi6CdcLIzhnnde6lypeO/
	jXjRdxvQAARHUZg1naEeyUTX4kV0Y1Z3T1poE0gjf3yLY+T69uJV6g/ie2SrOd8I=
X-Gm-Gg: AfdE7cmsEWMfMNJ04aoZXHU55n5ir5okXrQa1YgixdEBFXX7bBpl0UkiPYWsxVU0W41
	TsfqFBy1+Ve/aKWnOolwMqhImxMcPwkH4yNkEFEnMmiY2VvoHyxoR61+hIrmly1rV+J8Pg9JCXd
	kq6r09zNyBh1AowaF/3laKzjw3Yfgp2J4gOuQUH5t2iiif0Q0sEUo568p2E1KKNgAePp5glvd6H
	kfCwcg2w26CqVIdHa5DZBO1dupYpmd7muXnWJps+srhOUuRva3SB25kN4cTrc+IbRoZRsQmFbCC
	T2Ke7Ou8H1+EUT3Ra4s/S3nF/Nrz6TD3stBlgPE6WJufpKkS/ol5lDDEWk9jMX0ICYhAR2Ca58c
	6SrIbd456KaAf/ItcdVSia7FAW7ebpoyp+2kopGOg9jeJYCerYqIXLg==
X-Received: by 2002:a05:7300:550:b0:306:f474:738c with SMTP id 5a478bee46e88-30c68d1b308mr2036633eec.13.1782268986066;
        Tue, 23 Jun 2026 19:43:06 -0700 (PDT)
X-Received: by 2002:a05:7300:550:b0:306:f474:738c with SMTP id 5a478bee46e88-30c68d1b308mr2036590eec.13.1782268985518;
        Tue, 23 Jun 2026 19:43:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c6eabb7a5sm363369eec.26.2026.06.23.19.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 19:43:05 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:42:58 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
Message-ID: <ajtEMi-HQ3AAOTog@QCOM-aGQu4IUr3Y>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4hUU-oWkRbIx35M06dJWdEc6lhuGbEqQ
X-Proofpoint-GUID: 4hUU-oWkRbIx35M06dJWdEc6lhuGbEqQ
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3b443a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uRAUcPz_pJdlg0Cm8TEA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAyMSBTYWx0ZWRfXywPnUudQwxWO
 o1Sq/4maghUpx/X86QuupRAP5g45qQjjjmuiriAvetxvoGOhE3Fsf1Ljlxn4UUmvCJzcqHHU0g/
 v9CurTlPLFj7jivFUoV+d2obBNC4X08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAyMSBTYWx0ZWRfX8oz60ASawAQa
 kp9fe/Sr+dYFbwj/B4qp8CmX0FumBLaOtqTcR7pAJvGJTcqIUTwsPJtc4JoabkvyG7izQB0P1F3
 mV3EuUcTw4+5N8dcROmZ1RAuUP6qz00RSM/ehkZ6A9h5kmtst0Ukf7EerpgXwRuPdBWUlBH725D
 Cu+7QblQ6NmZT2H08hZBdrLuiVn64I43DVhEmktoZ7IykCSlfKtyQbJ8mCNTs8HEodJ7EqBW/rs
 6QkrgfxyFEl+EEv/WVncwH6shtcWLRQkTDZe2zXr484pQJ6AtHQQLPfUL9GF9xrNRZUaSB13SCs
 jr7d6xQcPaTgk21MH4zrEmZg7FTkU/sRcCVywek3YGxwuSYKFZpoFMiwd0Jimq37XEY2OYdycpG
 Z02TGo0xOFv2o9VRwGPUbLbc/7eWriUwLLTwulhZ5H/Uz/yi1/U+ztUUlfXdhdDU9MZzfffRq9B
 6rYrBwIWhSatkFm1A6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240021

On Tue, Jun 23, 2026 at 04:24:07PM +0530, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   11 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/dispcc0-nord.c | 2006 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/dispcc1-nord.c | 2006 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 4024 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 7d84c2f1d911a35430bba7670409f59972dcca0f..874136a2ad9aaa117df2c7ad5c8abc5280b76339 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -145,6 +145,17 @@ config CLK_KAANAPALI_VIDEOCC
>  	  Say Y if you want to support video devices and functionality such as
>  	  video encode/decode.
>  
> +config CLK_NORD_DISPCC
> +	tristate "Nord Display Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_NORD_GCC
> +	default m if ARCH_QCOM
> +	help
> +	  Support for the display clock controllers on Qualcomm Technologies, Inc
> +	  Nord devices. There are two display clock controllers on Nord SoC.
> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
>  config CLK_NORD_GCC
>  	tristate "Nord Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 58f9a5eb6fd7fc457607a179d8bab5623fedf706..4282f43e7078f1fe0dde6f942040eb6bd122d7ce 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
> +obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
>  obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
>  obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
>  obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
> diff --git a/drivers/clk/qcom/dispcc0-nord.c b/drivers/clk/qcom/dispcc0-nord.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c0097482a1a94a99a05767726b5a7405cf014fea
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc0-nord.c
> @@ -0,0 +1,2006 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

This include shouldn't be needed.

Shawn

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
