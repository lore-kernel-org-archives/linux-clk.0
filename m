Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183836215D
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 04:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775105265; cv=none; b=Kwu+UGP0GglhDVhVdz5caX6AN0VeAm+9ffldlhNjfpJu1rhpfzgHLW+TZWG0wpDdE1yT6LJU46JL9fNy/T8lkxIntGIFwEgDLxKxgZ36xruASyhqErtHrTs+vGvz/hHWCZpMr+SoPxq2vD4e+pVa1wZ+kTySsIr2lhccSqWQpZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775105265; c=relaxed/simple;
	bh=wk2CEsRe94TXY0TOzVrShJauVcawcTr12uXI7AppV/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpV2YIbSjibIXU1cz2X6AlfX8gtPoLg3nUNfpypiXaIn7IBPeJxFDmqXxWOmSoZI9aHtGOMcjcL4orPAg1YhnOLVqzeHNWpOLsMfjMF0PaT85kJ/FhujVCBhC1qtNLjCKzmqv4XD5CK8e+nb8SW1fYNMSVQBL4K2WVpwLOfiXqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEqhM3WP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/zLNUCp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEqhM3WP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/zLNUCp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324Qwx11551693
	for <linux-clk@vger.kernel.org>; Thu, 2 Apr 2026 04:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=igGS0tjH9YzgaYiuHHy2F++w
	pOEywQ8Ju4ax1XR2ztU=; b=SEqhM3WPToVXRXdrnsJa5le8wU6bFb8I3c6lPXtS
	b+LzVnFe67tRzd/skIVSyuH9XK0bfuhWUySShUldL0molg8V5AwCYLML2Fjz6RRN
	d88JgVDjjdIRz8Q6njwCkaD2CYI1AUS2FDTTrmAY9jdBnLynsawtObJfN3TtZKqZ
	A4pA/MakLdXz5cbpQchrCSjSYB3GCFAiqjM2VwBwhw3QMSIFNKMwPbeHsiZh2xRT
	myP3vMK5yw1r0AEZeqGDudv5wRXxwB8ilSVJ0I5aROArtneYB67laeOVzBwh6en3
	XdDvjJTGWCTWtnyM3uvJJdPIDBq/qKva8UQOPWiSKNiNYA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heer1q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 04:47:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ca0eb21c5fso3167428eec.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 21:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775105261; x=1775710061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igGS0tjH9YzgaYiuHHy2F++wpOEywQ8Ju4ax1XR2ztU=;
        b=A/zLNUCp/xiTk1fxfGhmIhWVhcbrsnXr2eCEHuDRDCLic5GKWKGUS+59gxY7SoUYKL
         UEj3JwRgL27fKQr8xTm7/z08KIRgUAszyvSEL5kyNWdUUj9BSF+S/cJCZvphwkuuMHRT
         qV/WrrSG240aI+87yYs0wEVQyJwJ1EwC4AjeszGVDXBReDkW/Ml6uM0Tz+jZxlJg9shG
         lcMYrZbMVjJZuP+1t9/jpDETYYRlBG1nMpEDAvc4L3bcFojm8pgXrrYlUyOBOBP0kqea
         /R1+xIqG5IkaG/6uaIGVXWwj/6qa24M5CdOcY5TUdfwLGHTIbkLRIVXiPFUYiO5XGKYc
         ZhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775105261; x=1775710061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igGS0tjH9YzgaYiuHHy2F++wpOEywQ8Ju4ax1XR2ztU=;
        b=SmgZdipe6aotCxtGXFmS/vp6hnsDdPjgd8PesW3ayQR/tD5DUmwkcTIww2dUWUUglq
         zEFil85BAgAja2Azwqo0CGPPf+8IgcVSZKmLmpeasvJilmrrUiD2SXZEy2LhAx6LoBaG
         bFZ9r2N3DpY/8JxnizdeGjUI+0ZXbp5fgPqBG44tdd6yEpMLpTZvhKng6DUnnWYgyBoN
         8GG0Wf91UGlyLyZ0ZdZHBWqi/9tp1I6f+iBB/Weej9PnlxmKfhEVYF8lkWpruK9x2Zig
         JfCOLy7X94nBE/sUhuqj/gaTTg88LR+qU0LVNJzTAn9YvOVaVKrsQ/3f2aV2u6WjJ9Au
         psiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbIUPlBBlKHzZHIU2c0CReSUkp4p7Z/EfqVRz1HSGuomsn6Sk+nsY7YknvMKjCkORGbbdr/9W5QjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8989sj7cSGjmTCeqzwJ9afmteiGO6tkjPjdxu8q6DoAQXivdq
	ScXm6mioeUGdD9sy69KfPQ9Q+8oVyM0jh5JdDWDhvn7UnVIB2L8HXKimZNExAoQiohmEQlQB2a4
	9+NHGJ29SAJaEkjcknkxSxhM1qm8vmmsBLsTFfRZJHKTf1SWwv7opYl5uc8XLra8jFSpptXvcAg
	==
X-Gm-Gg: ATEYQzwANP0FysWubk1z4/5X+9H18+P43ljRw8JAZ4c0ajZTjKUfVVCNiH9wUtJnRqc
	7ji2SwwV0nGZGviC8Mrf/pQta4FcYIQFMuhsMCRw+Kv2zioeuNb3+0EW8IoXkq2TFKdh0Yk0s25
	Z9Dh1x0xHUSd9aNnK+rL+fQQPWNrJn2dcXvfTMmducnTf8yHBct9UI/Ry1slTGYo2AH8CzwSuQP
	Za9yGqmlV4egN1+FFMB24MOvnzNEHvY7D8rBWYo9oOuNMYrifjZu4KC+/T8DjqQUquN4WSki4Vs
	C6dJAdjJClnujRkW7nX5tP1s1l96peSNt866mHIiV7CIR6gUhb1vEAA9fdu+bJwJugK0a2FajWA
	ARHsKTY69QtV/b20Py2uhubMBohvBMFuUyAZ2qOoRYlVmyhTrwb+f/sx7XupvLu5CSV81
X-Received: by 2002:a05:7300:2213:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-2c9329a0e60mr3038422eec.23.1775105261420;
        Wed, 01 Apr 2026 21:47:41 -0700 (PDT)
X-Received: by 2002:a05:7300:2213:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-2c9329a0e60mr3038410eec.23.1775105260720;
        Wed, 01 Apr 2026 21:47:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df5ec7sm1482412eec.3.2026.04.01.21.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 21:47:40 -0700 (PDT)
Date: Wed, 1 Apr 2026 21:47:38 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: h4qn7nP1ZVL9H_D5fppmUJvTVWRBEc_1
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69cdf4ee cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pj5R1tjK13g_stPiHOsA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: h4qn7nP1ZVL9H_D5fppmUJvTVWRBEc_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzOSBTYWx0ZWRfX/kCsFQrWh0xi
 VasdoBoTaBst/OnHDvjhERGGWS8JckKL0d2ys8oxRVaSxPcEEU88NQ/yN1/jOMpLlO3dNAW7Vtf
 svC3DkeA6JnOmOV5YooxO2Ksk7kuXpwEwqRAk1RgBkTn96ompzYMLnSHmH8LQAy2G5kdRdRanxe
 FJ3jU9BilVCLGK4a4PF4eMGLickGaPTUcRNCofRh7hM590OPVF3n6oXGTDd2aMrgQDGvy4qkj6h
 e14tuyTksdGdtvuSS9oX0btJBHjEzb9Uk61Xu2qq9YIzJrDO1ALiOv8vKHVT7i51kWH0MFdmPtI
 RT2UAmroT8myBo/EPQN/zrpsRGdUm4ls98wBj/u7kudO6EH5io9fUAsCdfMqydIf2xgSu+9rP16
 7uKAlCFqepzHlWhP3urGxKYQBeSn336NOevQ87Z62G+fakqK3FsWeh1kNyC3J909X1uUSNms56N
 qEUpHXlvgDlBrcPNTwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020039

On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
> 
> 
> On 4/1/2026 12:05 PM, Qiang Yu wrote:
> > Replace local clk_branch-based clkref definitions with descriptor-based
> > registration via qcom_clk_ref_probe().
> > 
> > This keeps the glymur driver focused on clock metadata and reuses common
> > runtime logic for regulator handling, enable/disable sequencing, and OF
> > provider wiring.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/tcsrcc-glymur.c | 340 +++++++++++----------------------------
> >  1 file changed, 93 insertions(+), 247 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> > index 9c0edebcdbb12816d1be5249e4f04bcaf02048aa..585f87b23af2d92daef1787b2f38911681c0d8ee 100644
> > --- a/drivers/clk/qcom/tcsrcc-glymur.c
> > +++ b/drivers/clk/qcom/tcsrcc-glymur.c
> > @@ -4,265 +4,115 @@
> >   */
> >  
> >  #include <linux/clk-provider.h>
> > +#include <linux/clk/qcom.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  
> >  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> >  
> > -#include "clk-alpha-pll.h"
> > -#include "clk-branch.h"
> > -#include "clk-pll.h"
> > -#include "clk-rcg.h"
> > -#include "clk-regmap.h"
> > -#include "clk-regmap-divider.h"
> > -#include "clk-regmap-mux.h"
> > -#include "common.h"
> > -#include "gdsc.h"
> > -#include "reset.h"
> > -
> > -enum {
> > -	DT_BI_TCXO_PAD,
> > -};
> > -
> > -static struct clk_branch tcsr_edp_clkref_en = {
> > -	.halt_reg = 0x60,
> > -	.halt_check = BRANCH_HALT_DELAY,
> > -	.clkr = {
> > -		.enable_reg = 0x60,
> > -		.enable_mask = BIT(0),
> > -		.hw.init = &(const struct clk_init_data) {
> > -			.name = "tcsr_edp_clkref_en",
> > -			.parent_data = &(const struct clk_parent_data){
> > -				.index = DT_BI_TCXO_PAD,
> > -			},
> > -			.num_parents = 1,
> > -			.ops = &clk_branch2_ops,
> > -		},
> > +static const char * const tcsr_pcie_1_regulators[] = {
> > +	"vdda-refgen-0p9",
> > +	"vdda-refgen-1p2",
> > +	"vdda-qrefrx5-0p9",
> > +	"vdda-qreftx0-0p9",
> > +	"vdda-qreftx0-1p2",
> > +};
> > +
> > +static const char * const tcsr_pcie_2_regulators[] = {
> > +	"vdda-refgen-0p9",
> > +	"vdda-refgen-1p2",
> > +	"vdda-qreftx1-0p9",
> > +	"vdda-qrefrpt0-0p9",
> > +	"vdda-qrefrpt1-0p9",
> > +	"vdda-qrefrpt2-0p9",
> > +	"vdda-qrefrx2-0p9",
> > +};
> > +
> > +static const char * const tcsr_pcie_3_regulators[] = {
> > +	"vdda-refgen-0p9",
> > +	"vdda-refgen-1p2",
> > +	"vdda-qreftx1-0p9",
> > +	"vdda-qrefrpt0-0p9",
> > +	"vdda-qrefrpt1-0p9",
> > +	"vdda-qrefrx1-0p9",
> > +};
> > +
> > +static const char * const tcsr_pcie_4_regulators[] = {
> > +	"vdda-refgen-0p9",
> > +	"vdda-refgen-1p2",
> > +	"vdda-qreftx1-0p9",
> > +	"vdda-qrefrpt0-0p9",
> > +	"vdda-qrefrpt1-0p9",
> > +	"vdda-qrefrpt2-0p9",
> > +	"vdda-qrefrx2-0p9",
> > +};
> > +
> 
> TCSR clock refs are just not for PCIe alone, they would have supplies
> for all the ref clocks. These supplies can also be shared across other
> clock refs. I think it is not the correct way to handle the supplies, as
> TCSR does not have the complete supplies map.
>
We have complete supplies map. You can get it on ipcatlog. Here is example
for other instances eg USB and EDP:
- Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
- Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
- Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3

I only add supplies for PCIe in this series because USB and EDP vote these
LDO in their PHY driver. They can remove them in PHY dts node and add same
regulator list here.

- Qiang Yu
> 
> > +static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
> > +	[TCSR_EDP_CLKREF_EN] = {
> > +		.name = "tcsr_edp_clkref_en",
> > +		.offset = 0x60,
> >  	},
> > -};
> >
> 
> 
> -- 
> Thanks,
> Taniya Das
> 
