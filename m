Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243BE258ED5
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609407; cv=none; b=A14QI+xqtPHc3nI3Qz1DOM6uEKHdXF9AwEriMiOnjIXESxlahvY0vVIGCfTW7yBVPJ/KbCAxC3WSk1Abk8SRo9kFhPdLuJawqDoKcPMnpptJKsvv08Z/LFwAKsBxyLwLik9etcR8rkG5zkLv79VizEMXQgL713AH+OTPvqZOOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609407; c=relaxed/simple;
	bh=nPO22Pk9oEOy6P/AoehUa+28euijor3hUcDgnvgMSJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=el298xZhXZ2qmQkSJx5Dq8TkYQKXIdz4gwcSwZue6jJNk5T2jqfprX961TzLbMeKlkrTXiKPBXAgJITXSs6gKzAZ3hORC3aVbWsAmlDwsW7uj2b7JW8riVhK4bOzGbOVPlBBRm8PFtx/2B2o28yMmk9QQY/kbZ842FK8j5j2PK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ2H7aXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlCnOtcQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ2H7aXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlCnOtcQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92WE54008386
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 14:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AA5/Lo70A2JiDpn+2PpdCMbf
	BH7wa9FOwafkTgtB60w=; b=cZ2H7aXlV4/x/RXaBDlt7JLRZP452S4r0gkwfDdu
	Hcb3rnCDEtXkYVMdXHxXlxb2lOVz4TEcHk8tRoMTy3I0lbLQFg0IsFBgDZANPexn
	xRDKqIe+/xcWnavTx9Iz8qX8ILR3KfhtZuEEm/sbX8M5UHjybOmY6zdhu+RfFLEd
	m7LuoMuY1NpNxv1kNFnqQOgd5XPPyLXJ3tFBiUqaBWPEvirhNXHA5uFl6UuM2WIo
	qh+XUUzidn/ShOiP0L1rkQmuRBIViHam3Y7A4mxcRN+wU65Lgtw8bifqnDuODk7h
	lg+rZQQe+m7DWjFdITr/FCh0Ph8aPT0oLVWGxZA0FqiJFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1jx3t9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 14:10:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ab7f67fso665951585a.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 06:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769609404; x=1770214204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AA5/Lo70A2JiDpn+2PpdCMbfBH7wa9FOwafkTgtB60w=;
        b=DlCnOtcQ8tesQNbOqd6JDNYjxMMmbUNlQ42W/yoQlvJ5ZuEGd8o+LqoTxCTA0EGky6
         PX4c3RD9EJioX15c5IaXVcawuLej2O/WIZ1nFbEFieEmInI/kbc3VJH+OjSv4Vs34E6X
         CO+DaoMG092Sl4pyMRmORdrApH2NFfZuH7ZLSO5hDIir4ICSK2cmGLb18hNTgGy4iuZ0
         9QqioGq2FJlJI79kZlWykPV/qq8ufE3ZJGhvkymvnspxksSqmS0PKMQi1oU7V4RWVuGx
         R4HF7GgoqvvAgdqFSgpa78EdenamPhkhDdJH/YnXclcjwHKWJ3T/Pa/9yFn+UQSQ++9O
         R7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609404; x=1770214204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA5/Lo70A2JiDpn+2PpdCMbfBH7wa9FOwafkTgtB60w=;
        b=Lel29yNXSia/3XZJl/hcwvbJ9XlbNy4N3CvSsFNrWstFdbl5LhLth/9SVx/6VMbQON
         /L2wwu3HrqhdZ5BQGH3Hu4Z+fkst4FY+eT06RU9LdZtYpJ/ffa2H0Rox9lL57DWAAPQD
         dBNUf1ssQW+cdaRGkQysd7jO1dTnHczqnogspsM4htRqi0PnKK0uziy4z7wTPqa2Hr6g
         gyzWQknq0IuvOjXosT/zhst7sWFshTYFTH3WUJrrqNvs7a48UTpm4jxDgVNZxcI6fpJK
         PUQm/893qyiaCaFBU2orZu6BrOleeJiopwNIsmratj/bWFD8VFAwgVY5e0/yM2nwGIZ7
         dc3g==
X-Forwarded-Encrypted: i=1; AJvYcCX2btsZ89lFXW+iJ7Mo6AHRINx5MDgCwCsUhT0rfirrVMcuvO872DdhHcxmv/j24tm1uTwQXMPIUr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJDN7+7NQL31De7BEBvJp0l96dTuPDwXoLHC81awiAqfnuOqg
	rwbP3dHR+Qe9Z8TQA9kX3XPr6aNavJXZGVUDdNLyrVatLSqszi5+ywRxzV2gBcBXxQgd9szXgt4
	ygH1lxiUr14JRebqMi82IgsGoB3aQK+3BtKZ7+vUKmAnr/RfWT/i2OBtcg1fhsF8=
X-Gm-Gg: AZuq6aI4STb/S5ltFup1GICaUpxK8ijCdN23wN9fFGItq4Vps6hJe3+Pl5FvSycTTO1
	Q+HJsrkf7VL2DLIixwKCDg25tY/s/3yOa230H75wih8aThb/nz2SzsM2CHeEgaVG51qW7AL7M2I
	e3RVQD3MZLt7AhvtaQFVVSgNOZq/x4GHz53eIg/Ue3zZWJs9ukkS8ZqVEqViFBCtGcpBJvA/9FB
	2aS+y2MVWQY5BQgwbZKJz1uN8U8nCupMlrwTgx7fl4QZkCBpYs00RfTTT6TABBbcnezyL1r/w4/
	/KQLPP4RDUOl9/lAuJgid6DVWYQ9XGtfICLy/6MqcDXKSIJoayQoxV0um0O9FSDkp5gznL8Uw/Z
	BgfzRSA+TDmd1/pQxDzIdZfle
X-Received: by 2002:a05:620a:38c4:b0:8c7:eb5:8545 with SMTP id af79cd13be357-8c70eb588damr388868385a.16.1769609403781;
        Wed, 28 Jan 2026 06:10:03 -0800 (PST)
X-Received: by 2002:a05:620a:38c4:b0:8c7:eb5:8545 with SMTP id af79cd13be357-8c70eb588damr388861385a.16.1769609402986;
        Wed, 28 Jan 2026 06:10:02 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm7465247f8f.41.2026.01.28.06.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 06:10:02 -0800 (PST)
Date: Wed, 28 Jan 2026 16:10:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eROC2tvCGffWwjIfGrj9IUmxGcWJe09g
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=697a18bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rJ1U_4G_ZJY64H9EBe4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExNyBTYWx0ZWRfX3sFX8JLM/w9i
 xY++iNFNp9xYhaxxVH1/o/VAoSzdleyky3R0fQq1Ex1D3rbkglvu94rdQHuk0cl8HPHM9A301Yn
 cFGuU64yoSjuWER2NMPQZUtcQMra73xYm6KathcY+d7SSYgKO3aF1qwI/rdY4FBFm0vxHuw/7Sl
 ZCTpf/IIB99eRbkSwS0SnVZOeXPHcIS7i+c9r1KjJuOVBto7YVzNe7k9vPY8LvLTNjPbNFU2xag
 3TMCgGlkmX0xh51b7rWH4PU9Rg23t5dw36x9Eu7MkEwDrMef1oRY5p1dZ4QZyKiNfgcO5SlopOo
 wkBjDvxzPeRJ3xtBmbO3al1M7FUjL75i5rTY/Hr+x8hh/T2Y7/lVNF57DazLat/yZH+CZD6QWZ5
 6QlxniqIYFWLrsZMoO1Ncrszfag/pubhilaFN9Z/HrV+cmaUE1XNjpbMxmKmu09LM9R/R22LJik
 EiaY/poLxwKEihqGD3Q==
X-Proofpoint-GUID: eROC2tvCGffWwjIfGrj9IUmxGcWJe09g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280117

On 26-01-28 11:34:49, Konrad Dybcio wrote:
> On 1/27/26 4:03 PM, Abel Vesa wrote:
> > Add the TCSR clock controller that provides the refclks on Eliza
> > platform for PCIe, USB and UFS subsystems.
> > 
> > Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> > @@ -0,0 +1,144 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> > +
> > +#include "clk-branch.h"
> > +#include "clk-regmap.h"
> > +#include "common.h"
> > +
> > +enum {
> > +	DT_BI_TCXO_PAD,
> > +};
> > +
> > +static struct clk_branch tcsr_pcie_0_clkref_en = {
> > +	.halt_reg = 0x0,
> 
> These regs certainly aren't at +0x0 to what we normally expect to
> be the start of the TCSR node

They are if we add the TCSR node with reg range starting at 0x1fbf000.

> 
> [...]
> 
> > +static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
> > +	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
> > +	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
> > +	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
> > +	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
> 
> I don't think this list is complete

Yep, missing the pcie_0 and hdmi. Will add.
