Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BE22F290E
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065605; cv=none; b=uQh1gIKJrUxP0I2ffacc1QhmFsAd4d5k497lzaoISpYmbOJ1XWAI6fLtHsbK+OsptQYogFaLZbttHG70W4/fqvXktawMW2u2iU46mRgUqStv+Nfov2x8/RPVoSxkvW3I0fgUY6eehdlwrRpdE2KJbFkJJoeEtG4Qjb56rfya7Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065605; c=relaxed/simple;
	bh=2vlaXSLaGFUxT7wOiZ58bkGZ0gHHQVhhJw2/lTdIGlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7C4y32sgVz+xltEJ09bI5J8mld//1w8QiEld5RgLFX9ukCDgG9gdwNWMpJYg0YhDbZDTtMmHXbNiay/gXWxE+KHg4cfIeNRRBE8iB37iuEsAqV3NrbsgW06mCxe2PhHPIbc9e6dRV6V3e3kSzWDpWqzxEtrb8eEngaFjZDnEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldi8WUkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXnxzxAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldi8WUkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXnxzxAu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612Jxn822848628
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 20:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GLN+casBjIOKtCjCw2YctrHy
	DRXxC6sdK2KmnTQrA6A=; b=ldi8WUkSBgXdDQk1Eww4iqoIIz22hZ2iY5RhbEfp
	LVZC0/H+FGOUfKw4DnYgzzoqmroc7Y+6USnEAadekY57SKMVDxT+gsaI+3eSmio2
	XE4kHWBt0CO4vtHM+AkG72XT/5IWLLtZLF2QMl4iseICP2eS4yDnWiUQDlDGZZ7X
	doJGRrKH/NtlaSO5jjGxh5ZQryJqKHr4JjCaEQdDFztzp7VEGilW1vR7mcdMDofs
	zYGaBIC2kQDyKyp4pXq2lPOZeD2WsLbmNR8EnDxGpnvAH6N07gbrOlrDpfpStSIc
	gwYdVXkZcqrsfKZWGGzVJilDMMlVLxdMPzBqckvytPwIKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqthu4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 20:53:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52f89b415so1374478085a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 12:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770065601; x=1770670401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLN+casBjIOKtCjCw2YctrHyDRXxC6sdK2KmnTQrA6A=;
        b=MXnxzxAuhOocVo3c0SDH7a9VT4DNYq6V7J6P3ZhWl1QyJDl1J895TTYlUVe1/ooiYT
         XCX4WoviR3HMa4mVZhb4dJUEWTzQZXx05FIJHrycy/aV0fBqmaFsCtwLXhJ1DgPpQLMQ
         KQmR9cuqCW9m+4qHLDfg+oz6TVX1LUWKMOEjpz2YdDdgr3zDiVdMpSCciR1M7pjJgCcc
         c92q2EooXyo8dfpFIZWJ4Vz7UZ9tul3NMRM9mSsNnKSGInbN3AFSFH8ebEIxHuq1ZCAR
         +yuSXURJwRTBKL8ty2sFKsm+OhGS5HDFSvzYd2IksyVE1kdM0ak+aV4Z13fpvYlcZI+K
         FV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065601; x=1770670401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLN+casBjIOKtCjCw2YctrHyDRXxC6sdK2KmnTQrA6A=;
        b=QrPDrQ0wgeFCrBIA0c4X6FHPTTrBFuMUJqmO4wfAtVZlRSMXBUdIZdzUIRJRI9x4/X
         GjZ6QxqtbELXiCASyhlg6wsXrLp4jBToowImUhBlNhd5w2xp1ZHhfpLiXPjhvzt9v9WN
         2tDlTZ3q1z5XUvjuXmv1Mgskcld2qwYZjtfgHB2lkT10T0VC2swe3QYfgmwWiXTLnBFe
         xNclZbcNOx5+doTxvDICvHIvoSzg22NwLVBORIPB4KiGJyI3jMvNa4Ypwh6nJmAVBWx5
         1jJ727TOnPWMpFasas1hZEDicGv6HMmQU2wfM3RQiE9tvd9Ky/vdpNsHRFpXgU7F+kR1
         KYgA==
X-Forwarded-Encrypted: i=1; AJvYcCWBfJ+ypOvhSl0mDixwbQUFNMVplc0lELvTAZhx12BfRiXHeZ8VRIDV8A9PUiXYbPddS0Hv39HvqXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/8L+akEpQIqPh/4fri4ur5TEhVXtsgpAc8SLCb4h2Tmkz2j0i
	WyMDT7/pRGZilqKd9oyseSmNAd6NBkDziC36gng0BLc/8LNnoHlbxo6Ht5epb3ivFzllpJ+gkGl
	AYRcbmsptUlIqfvzjqVguzQMqARp6zIxS7hnUU1B/nJhUHgLzNXCbW6MHkJO9HLlfulY8M4U=
X-Gm-Gg: AZuq6aL5sJl/mOL2wFAxuv/L39NLutwMYyG03j2aHiKFOPqhkOgCxzmvQvjYyduRTNn
	fn4SEizXQqJDHvNHOO3tXL/veqPR6xJgSYcN/gk1I2KBJPgeSJ6yVKYSwARrcy1796ME0Oxot3A
	p4OvbiQWQkM5eJ9qGFSjorKmYWIDfcZwwhoM7uHtTeTGYtWeBbRVsUaEu59a8Cwx7mBb6i/qXQn
	+1KSkkD40r9/dT0GKAwTbe/dMcVxxnayphMLrcZsHA845IBEheR2vlnkcGZiUOh0eEHx0Ori57V
	m+UhMADIGz7zOvuBwleIUNaj98i0z9Nm9oUaxWTb6DUUsG4pHG3/+VS8L6oXt4Tjr9ZhUm9WkFB
	PWZzrsM6xhWpBtl+IaqCVjF5v
X-Received: by 2002:a05:620a:440d:b0:8c5:38b3:fefa with SMTP id af79cd13be357-8c9eb315ad7mr1821082085a.79.1770065601409;
        Mon, 02 Feb 2026 12:53:21 -0800 (PST)
X-Received: by 2002:a05:620a:440d:b0:8c5:38b3:fefa with SMTP id af79cd13be357-8c9eb315ad7mr1821078485a.79.1770065600824;
        Mon, 02 Feb 2026 12:53:20 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm44717903f8f.17.2026.02.02.12.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:53:20 -0800 (PST)
Date: Mon, 2 Feb 2026 22:53:18 +0200
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
Message-ID: <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
 <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=69810ec2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ga2sCeFbclvdr6Ph1usA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hAmTnfrmlq914p94RoyeaPdVDnauUgV7
X-Proofpoint-ORIG-GUID: hAmTnfrmlq914p94RoyeaPdVDnauUgV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE2MyBTYWx0ZWRfXzqfUzxTbe3Uq
 mWnrVc+pbj9e3x6QaFg7cyoMmdDqhx98BCoOjDTxtzP4fTylaNA8F+1mp5NF09lLgxanctjbMsR
 J/4bcpiIwhbx8W3OYnT+4quNkBc2fj0KjlwP3xXdl1ZoncDYUjPBb24+HRjSRXLQ7ZyZjjunixT
 2me7ZR711zUZkLU9LedFLezqxD4ayOEcvxD05yHdQnqhR9YAa6N441pNWGmdJ1zaLjmHfnKSR+g
 +SnxXDu1oZn2SeSHdDaCsiVz3qayAeG43MoqHPZd0VPdqn1SXJgbV2V4ccI23Sx5TjMMRdxZsYE
 MYydawonS3KaPIMbvl67UyFcssEicEw33YCHXv4moClYkWTsME+0zbmTue3Too+1S3Eu13bIXJ2
 +whwWnzLBMz+QcLkQQUaffGGE8ZB9nAKnCmKKZsxdLFHVIEpHR2z5utdN5jlylFBncUXQtvh70D
 CKujsoWzRbkf4EVGtTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020163

On 26-01-30 22:40:32, Abel Vesa wrote:
> On 26-01-30 10:43:44, Konrad Dybcio wrote:
> > On 1/28/26 3:10 PM, Abel Vesa wrote:
> > > On 26-01-28 11:34:49, Konrad Dybcio wrote:
> > >> On 1/27/26 4:03 PM, Abel Vesa wrote:
> > >>> Add the TCSR clock controller that provides the refclks on Eliza
> > >>> platform for PCIe, USB and UFS subsystems.
> > >>>
> > >>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > >>> ---
> > >>
> > >> [...]
> > >>
> > >>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> > >>> @@ -0,0 +1,144 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0-only
> > >>> +/*
> > >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > >>> + */
> > >>> +
> > >>> +#include <linux/clk-provider.h>
> > >>> +#include <linux/mod_devicetable.h>
> > >>> +#include <linux/module.h>
> > >>> +#include <linux/of.h>
> > >>> +#include <linux/platform_device.h>
> > >>> +#include <linux/regmap.h>
> > >>> +
> > >>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> > >>> +
> > >>> +#include "clk-branch.h"
> > >>> +#include "clk-regmap.h"
> > >>> +#include "common.h"
> > >>> +
> > >>> +enum {
> > >>> +	DT_BI_TCXO_PAD,
> > >>> +};
> > >>> +
> > >>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> > >>> +	.halt_reg = 0x0,
> > >>
> > >> These regs certainly aren't at +0x0 to what we normally expect to
> > >> be the start of the TCSR node
> > > 
> > > They are if we add the TCSR node with reg range starting at 0x1fbf000.
> > 
> > "if we take the wrong base, the wrong offset is right" ;)
> > 
> > The docs for Eliza don't have the nice separation like on e.g. Hamoa,
> > but 0x01fc0000 is what we generally agreed upon to be "tcsr".
> > 
> > The registers that first appear in that region are the same as on Hamoa,
> > and so is the address, so let's continue that tradition

Actually, the 0x1fbf000 is the right base address.

TCSR mutex starts at 0x1f40000, and everything between 0x1fb2000 and 0xfbf000
doesn't really look like they belong in a clock controller.
