Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DE42E1EF4
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601727; cv=none; b=CdWZWaJmIMFScdUZaiowMUcfMUsrzssR4Y3yhKrcv4HkxX9s6oudcPXF8GQm3Nr3RoqwLhkti205xj3pNT4FYPCpEwTqjmpujt1GeYDzQbFKN+oOI1hCe+4hoydDpjKFgIPAVgAgAI4dVL2z4TGAIOJnRtmsQDRcSnJdNLlA3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601727; c=relaxed/simple;
	bh=JLyNkkaApmbrvqwGZzopsyQy3SF6cnsEonoyInku+lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfiUoO5pStQqTVtzn29wDfz60LlHo/BCq5Eq/E9Ccfxam4eIpx0M6RVDXRyIIM2AAY0tcr0kX8/rJTp7cYDXDGPH3t0TPjBoGKusxp1Y6ga+HMQfJMTjyslYHi+fjuv3m9V5/k5kdnvVM4H8PFe750nJ+u8LUI4OywOSyUiLbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVYDHi4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiNafE7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVYDHi4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiNafE7y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91u5s3879263
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 12:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4es4CQ2kpzllBPGDjkRDsz38
	DYsO6uydqaYWOYELKK0=; b=CVYDHi4BAq+0QRi52BLyrPXm0ipyvtB9DNZJBYEA
	RFIKVSsImngsoGZF597jq97Do//9iP3DMsYIrrZHVspp2+VQ+Rbinjps/iaQ5h4Z
	6wdb3UTDxvIJK6k82AKO/Fpes4j/hc0xoYKTAbvVqfuCrWqy1PmLeejewjKTYuLq
	P6kTmX3ExEbJuRTC1ED276HrUc8A9wjqRElGRNWmwk3zeB8/+TJeNdGUvo+jnDVX
	nxUeg5ujUqNgVnu76PBgPRDFsSPqW41hxADkOa+fiHs7LYaOFZFxcAlMF03TAs1W
	n6eCRSKwFkUe+xnGb4Ie+dIX8TVUZUrBzipR/N44FWC0Iw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv1b7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 12:02:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5634a014788so6102115e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 04:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769601724; x=1770206524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4es4CQ2kpzllBPGDjkRDsz38DYsO6uydqaYWOYELKK0=;
        b=CiNafE7yl0WmxAu8mlA3bsoUbJJz3agPI9lfvmLhZpRr240pDRjvrX10Pk8PNXcRDO
         TGUv8VdUYaLDXvEWALr/v4L2DBlkCK9FhFcvemESA75FuBVQqDKtV2xXQeHCQg6OD1UD
         BvAOxNdkcWmbYasxLoeAGYMWiIZxNBKNqk+/Nn0WbgUAd3xGOfxM3wk4No/cQ2hYGf3/
         0EjYtksYKfl2rLtCnm/M4BrXCGmMgHVXoNsjjWc0/A5zAvnmjs1olPIVksLztbBacnFO
         yBzYqxvGDGkTF5em0aYQrp+2zDRnICLFtyEQComSSbGNEQfooIRB/Zw+tn+Snprvs36L
         KoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769601724; x=1770206524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4es4CQ2kpzllBPGDjkRDsz38DYsO6uydqaYWOYELKK0=;
        b=K0ZW2E98ICUKPixpmUtQiYcfa/aKD85e1mVGh0acdajEKtjWVArxvlk9Yl1URNNd6i
         HibwI+2Ty6Tc73AfPOREllXaTKezvWG9Xhv9euYpn/KGlKdTxYTQXS3if+Pz4Yf0jU2O
         C3QDX74SPHXwcCjgik4lHbUqnKuq9C7XTWTRxDW2vt5rgaT4rZpqwgIeGymQqvrcpI/i
         u88TiNSjaUT6FAXZ33/Qf15fdZ4iV0duC05dVGxUvymLzJ0NKpzyMQ+s3su/2yD/rWtk
         MAIqmmZhdMTXnbBANEySTtTrGeUf4EhfUKlmSMrAbn/8QDeYl3+JfZ/50JemAF7am0H+
         n4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXboo7H8N4Z2+JQPUwwmMEWl07hZegZtM5KtN0IeM4Z4FhXFvQXbhpx1v7NSc8/fNkKxNNTviUbd44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ybXuKh/c2iyEBoV+q9umE2GmLN9w+qQpIlAy9VvtYLndGi+o
	HoWfAOV6LJerukUOstLFZdWdRJcWvoD/50lrGeEyZ+i+A6woK12tsIrjM+ze3ds+B/Fsjq7/c4S
	1h50+bVXM0D8dArA3e+wd73qzmpavjGWa0rhPyUx6TONUdbUdUlrrkAzDfvf7o/o=
X-Gm-Gg: AZuq6aI2iXUkBAaMW00EuqxVXy6FeOu2a84fijHiGcrHVBeX261jwEqHoTTsIwZVrOJ
	qcVyDlk1NscP7aOi0/rpdrIsWK4MFq9BEo4dC7FdBnS5waMrR4hdESPORKT9374ZaYhHP7mbPkm
	fjU9WCFfvWLXZRtlmnNk583d1t0iQwYFpab5smu2kQpV3V7EtcSBVDT/y9ZT6tdPomlnEfiDipI
	ntgVP2bDRZKgrYJuEqDDOQdIREJ5X7FX+DVRWo5HycX2UZyQhPRdv0FRUQfqDMazFUV9t5FeZw1
	r2bb6GfKiPiCiubb5VJWBe8pz26O+JFOhuNicS9uNjANyNVTmRNjrcKN2BXNUvbRkDDTsmRfPqI
	MzVWSRVcKPc88y2+KQtEJCLiC
X-Received: by 2002:a05:6122:7ca:b0:563:7d93:b135 with SMTP id 71dfb90a1353d-566794ab056mr1252887e0c.2.1769601722659;
        Wed, 28 Jan 2026 04:02:02 -0800 (PST)
X-Received: by 2002:a05:6122:7ca:b0:563:7d93:b135 with SMTP id 71dfb90a1353d-566794ab056mr1252834e0c.2.1769601721973;
        Wed, 28 Jan 2026 04:02:01 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e135422csm6553300f8f.40.2026.01.28.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:02:01 -0800 (PST)
Date: Wed, 28 Jan 2026 14:01:59 +0200
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
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Message-ID: <bsaj7umwdw6teu5tsuptbhsymo7aeorlqlnzayvlvqjvrhmwtd@axabgagssltv>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
 <734ae332-e1c6-49d8-9f10-a68e84360ab7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734ae332-e1c6-49d8-9f10-a68e84360ab7@oss.qualcomm.com>
X-Proofpoint-GUID: sTFyxT9yCYhkKMx159Tw1H871M76uQwP
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979fabc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J-NJh31Enpt0SH5wFCgA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5OCBTYWx0ZWRfX52pkLzwAp0su
 aDS5HkL+I5aB/fBg/iH7NIulER6jAp8RS/lBKjJRhBaJLcliXUmAxzhYhHDOKsXj7ef/SVAgLS6
 xcJXFFweUC3djb6QEj0skPPRd5IG3H6eML1fT7vDETYeVMfq2bPRO6l1gqF9l3hLY2vTJDE79X3
 OSbeNanIwvYivkeI4vnVKH0d5/Lpwm9W1LYiOfhNHuv1PHPlAjykTm7PbxixS70O9znarsvN3g3
 0NPMlfPwpy5zwMJ5Wo1Ep63Ihyhvj4ecEI7J3waw0LNSZ4Q0QN7IefUYuoQ6aqE5XWIEt6viewR
 vYS0z/wUdlmlqS5OT14fA6ttjZx+c39VMcZTAhEqaauq3vqcSoZTxX7FtEaqDLVSX01UCS7RtBj
 +SjmQyGUtqFbHyvZoyizBmKEivHZcP8zowUVrI4Mu923ZaI5x+J8sG2RoNDJP9GkLWkedEQWy8D
 nm7Jlf6xFqtrPON05Fg==
X-Proofpoint-ORIG-GUID: sTFyxT9yCYhkKMx159Tw1H871M76uQwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280098

On 26-01-28 11:40:23, Konrad Dybcio wrote:
> On 1/27/26 4:03 PM, Abel Vesa wrote:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> > 
> > Add the RPMH clocks present in Eliza SoC.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index 547729b1a8ee..cf46a6585174 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -940,6 +940,25 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
> >  	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
> >  };
> >  
> > +static struct clk_hw *eliza_rpmh_clocks[] = {
> > +	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
> > +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
> > +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
> > +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> > +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> > +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> > +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> > +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> > +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> > +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> 
> I see that downstream also has LN_BB_CLK2 (clka7_a2) and RF_CLK3-5

All I can say is that those do not seem to exist in cmd-db on the device
I have access to.
