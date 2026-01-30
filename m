Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF14332ED3
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 20:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769805638; cv=none; b=PozoKuodqQvY4gEJ1QCKwIeITokbYAADMXnm17BABsbVtbIFfAFvXXMqemGC7sLBzEu2DHz7mKcBuwlfFRVJVXXXSA9+DIwGqDSetIiFhAG9Q0rGpuJeY6pg0RuRmvAV+SAzhJ3irhhcLroybdZfjVXHPwt2FlZlbXHXjSSC4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769805638; c=relaxed/simple;
	bh=Yw4d79IEZXffsKvRGAO+y8LsCNKcQBy63V//wFWlz7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZQKGw21U7nkXDZyIxDR+coOfIqWal9mmFWLh/Y5cpZSVsRYQQO733S3bNkz13ywIAvK/Y1pJYjLt9wXXHsbN/bwi+FG8wUIohrWn/y3fnsBMbjbTvwZT7RErqmrIk8BlCbOuNTyucxKs9xyC26dcjF9SDNAaX4IIX2HpzHrBxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHnGPOJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+e0VZCL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHnGPOJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+e0VZCL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UKNGh74071807
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 20:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uGZh6P9IyChuIO7WR1H248Zv
	7S7Mvw6Hn70r2sYjVwo=; b=oHnGPOJsYlgt7YJRMyYADhltehyBx0SaWk/ET/qE
	xxmXmHtZwb0t9nsV0A4Ia7hbwl5wGYCkEoMBUyo5Bvyr4yKV2XMYc1pjwUehGIIf
	ZoGaWl8ZLgrHM08LC7i37Atszi3chq3DdKtS+bNmxZzHUkwdLjxchld0UMrg9osh
	VJSDF4Go5Jcfs/4Cqbta4nHmT8xApwd07vtRlXCxrZtIyHYS80w6nsd9vjPrrmk4
	jv0gPerSeOpzkcJK6xrWfeApWornhJRzcPmNfkBBPSyZQcgXzly9TgQ9fcYwJkr/
	sxP+yCHu+QZHlTKzKSvcyLuJc/OTOdZ6pbdDGleZoxJvyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t3420k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 20:40:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so603506085a.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 12:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769805635; x=1770410435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uGZh6P9IyChuIO7WR1H248Zv7S7Mvw6Hn70r2sYjVwo=;
        b=F+e0VZCLa6eMmedEfMgP0wgmTaF7WnJggjvpvG/jPSMve2Qa0R2x6bdbVp2TwtaFqJ
         9CnbYAV0CVk/N8SiOOG3u2F2AGed3i34sNMOFZKSqOKiM6UX3ku3VCB+13cB9i0jchYN
         rMyHY7h9aXwQxPHah9scb+Eu4DUKssOYGWkTVePkj//Uf7QfqN3Fxdw72ZdzGmIkSlHh
         ySzii2AQE5hvDXmEd3G2PHB2QM0dw5nr5/iGCHbfC2wKNKX0KobL7g5a+qNNzHLak5Er
         1rGiLuhap1o560SqL14SpRiu/CEyWkpGHTfkKSRZqWYevmgtVaf4bYG6mjk+4k0m1+H4
         7J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769805635; x=1770410435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGZh6P9IyChuIO7WR1H248Zv7S7Mvw6Hn70r2sYjVwo=;
        b=SBKfy1ZuBxpig+gafPBSE0uPBxUfBASUHJxSPi/dbqibMHFj5HTXB++jJAztR5j7wi
         44XMP/T3vXRdpsQ1MdZ/zjQS7s3yEsnYA8bujZE5N8th35+8tSthT6f/lKzWz7do/+or
         QCwOlDFAbdmWaRZx8f7ZJ28F0SaOG4v2tuc3jtT1K7/VK7ag7E7EBDXYQiFMitVGojO3
         sLSRaBEs06EWYU9qPZ/ivb9OaytDNxKMNYgTROyIWZHO8Fr13GwjjVpjLf9lNHVKdHjt
         QVwdskBF0bqS5jPs5jWcXIlS2u8pdGbSLZ2027Hd9QHbAWC7ejJApaR6hhaQIojpn2cK
         klEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXElwt41hwJJ5htAm2ZiKrjgmtzO8r029pZ9s4QfzZJOwnxEHRS43h0YoHOyrpPgH1tRY831v+XQs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEHIvFn6sKfzinRbB2CJFMT453/lnYRtPd3s6az6NnJ/txJbBx
	76JkGAMPunWIIIJRuRuIlGil1e96BV5jkfvMoYCyUpNRJKvewBFqR20f/dd3/wwAJBvH55HAUcK
	ouKQ+D6zZeBE+zOMErE8gkav1+bV0hRgE2ecM2uSunOiQS4HUXyDBlMMK8FASnss=
X-Gm-Gg: AZuq6aIykOWrfnHIJpmwcJ32bAKKV4J68rDnH7jf5FA+RrPsUF3YVtR+j8w3I8ejbQS
	blrPpYrNOBbh6mDrNz4W89EZW1Vn2mohab9rXLPleTaFtMiucIXeD3FqijhCcwDoaOAn0ih6IkF
	t3BEFWA3YoPhiN6+nWBlyHZ0K4jXLaUFZQeRzJUJxTm3+5fb++mCHWj64mZXrQtctC46lMWft9N
	vyAsactasfqVSfS1yHVUmHa9gAaWmzF92yRvPje/QigIY3ZXmMLrOX7TdHqo3eJ1CImjhEwIWuC
	0dTFsMLJcPVNz9oUORnaXjD8Y3SlX2+yq/8DdC7H1D32DLAuDtW6aKR11bfLOgEdwG6ee20ShHa
	HUbQSEWQX1r1qKEWEjNuTsthn
X-Received: by 2002:a05:620a:40cc:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8c9eb2dfeddmr508956485a.51.1769805635546;
        Fri, 30 Jan 2026 12:40:35 -0800 (PST)
X-Received: by 2002:a05:620a:40cc:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8c9eb2dfeddmr508952485a.51.1769805634986;
        Fri, 30 Jan 2026 12:40:34 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm25014137f8f.35.2026.01.30.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:40:34 -0800 (PST)
Date: Fri, 30 Jan 2026 22:40:32 +0200
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
Message-ID: <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2OSBTYWx0ZWRfXxhVg5RcAc4WZ
 6nCrWA26KtHchy8ZiqrVAt+adR3UyPSMClRAzn2nZU4g3z0Q7ZtesXZuJjssT1RTlnBnzEWPAjb
 JI9RsWWM31u95gJUPVF1AE+fCpuAy8oJq/6wCclQvoPhv0gPjrYTW2UwmBuQsSJjAwN9u2s+K3D
 ppvyyCR2MtNPsnJ7Z86+IArGvFPlLnasmaSv88jKHrHWptl5bTDAD0y6OtU1S84UX0b0JX9VHZ3
 X/9pzUnUVHldb5oYrjEtD5zRPVJRc4GcVFjvqEHZip5a61Kkgt886Nz6LxK344YAaA3ZFCEuJRK
 H3utCCJ3BuPQaP5NLK15Wg760Ki76l+5ix0Gk6oS/nSPXdHckxYWLjPj6omvJfj+++CV1isSyrT
 Si7az9Te7rwjzCqcGI0667Q7j2rwit/pZuiLXiHaA1k31PZjGRv6LloSQFcixRYd5kCO7qwfNqk
 FbGA9TwIFWXUAC5zhlQ==
X-Proofpoint-ORIG-GUID: p8jFSUKHJvX8cc02GU9vRFo_sTlVDyct
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697d1744 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ynA9qmrkdMhaH5VwOwYA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: p8jFSUKHJvX8cc02GU9vRFo_sTlVDyct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300169

On 26-01-30 10:43:44, Konrad Dybcio wrote:
> On 1/28/26 3:10 PM, Abel Vesa wrote:
> > On 26-01-28 11:34:49, Konrad Dybcio wrote:
> >> On 1/27/26 4:03 PM, Abel Vesa wrote:
> >>> Add the TCSR clock controller that provides the refclks on Eliza
> >>> platform for PCIe, USB and UFS subsystems.
> >>>
> >>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> >>> @@ -0,0 +1,144 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>> + */
> >>> +
> >>> +#include <linux/clk-provider.h>
> >>> +#include <linux/mod_devicetable.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/of.h>
> >>> +#include <linux/platform_device.h>
> >>> +#include <linux/regmap.h>
> >>> +
> >>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> >>> +
> >>> +#include "clk-branch.h"
> >>> +#include "clk-regmap.h"
> >>> +#include "common.h"
> >>> +
> >>> +enum {
> >>> +	DT_BI_TCXO_PAD,
> >>> +};
> >>> +
> >>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> >>> +	.halt_reg = 0x0,
> >>
> >> These regs certainly aren't at +0x0 to what we normally expect to
> >> be the start of the TCSR node
> > 
> > They are if we add the TCSR node with reg range starting at 0x1fbf000.
> 
> "if we take the wrong base, the wrong offset is right" ;)
> 
> The docs for Eliza don't have the nice separation like on e.g. Hamoa,
> but 0x01fc0000 is what we generally agreed upon to be "tcsr".
> 
> The registers that first appear in that region are the same as on Hamoa,
> and so is the address, so let's continue that tradition

Sure.
