Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C87215F56
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 18:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743099661; cv=none; b=kHN20EhlIXubrJ4xkhBvhVVYlKmd8rDSCmg3hk4cN/RxH1VOJhl5Sd8VSaN7io7IheeBQKdS5Io4ECB5z/wK4h1PbMMgYNu5ZQaPub/Qng7lCpWaIxeMEJ3f1hG+M5Egbm12CdwMNgoMjTS8UHCX6cfLYqmamrn13vMctznN8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743099661; c=relaxed/simple;
	bh=jhclNtUgsQQyCzKu4YAx9z0GhWqsHEX5/dnTSkWtmak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIsGWpaEcGQiJ/Otrv7ZOMG+QmZ0lF0cJY5aODwve7f9maHFo9owl6mv5v37fSFrlspy+Ya+zZ7x4SRHVEVOEmndtcY8205WsG7C7mIlM/BfLt1Vi5CAO7w5zugUaiKmuK6Jkt6d65T8BbtP2Ug423+Q+Muu1aU0wYaG5sUIiEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9ehg0Ts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9ehg0Ts"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RFOsWr005967
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 18:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQitrKmzUpzT5jYzxA6P4DAQ
	r2Y6OfHBDNkpOWQF408=; b=M9ehg0Ts2+zDgjv0Q03SOIbspwBR0dpZCQ0pULnL
	inwqn/njOnN7pJQuOHyyvOh59C+iKepz83sOL1BDbQcFCWvWbm0YS4EfroYlSgfV
	8ozY2dJ7dUy0OKp51qSTmE5yT66FDIpjgI6+w9ZDPw1DZNxHLFQySS87593KHerC
	2wN0eAYpbecOo4b5IVa/8h6g0TyWDen7UEPoyvK0cDVj6dhGkEK75SuRBGWjrPfq
	RafVzzsYiQMPxsU8tJQF2ZqX34w11fYnBePqsTs2z5gP69nx1XAg9TzzTvA03rQg
	QMWIal6yI9NTgJS0QLS1LjkFQpMbJVZUP0hRL5z57EARkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf68kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 18:20:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d9d8890fso455547485a.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 11:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743099655; x=1743704455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQitrKmzUpzT5jYzxA6P4DAQr2Y6OfHBDNkpOWQF408=;
        b=qUYkmKraDXY6F1vHevHEH45HJ2rFUSUaZ87b7Q8znHCe0xf7c1agUcypvV09KWQvku
         J+QIrRx5TUO8L2IX0z27m7j8wMV79mH5SGjExHygJuCd5ZPyPSDXQ3Rszn5nQPLjYc0B
         OJHSOxz4XqSM2SKHCFrsPlA/MqTGWdt5w2l2Zi0I68r/1NKHr7348QVWWkeEAhCvQdtj
         aCv5kpdXTPp867bq+as21YSJQu8RdYVj5HqtRITjlxrtZm0PrDLAiZhsEWSzN2xAVQr7
         ktA9I3iCk48AbIOCtt+YwfnJOboLTyIGAffYAuWe2hwQ87ZVrnX2Rm4MrI9ZnG1veDIS
         K8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCV6I+xIxeglzUmmxzd2xyThLeT3fppeIxa5LeZLUVyQouJM0HvsadLK1vgzBBC6P0ECpu5hbhHqRZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvE3gUBEczE3TvN078Gwg341OPWhn89jrkUWPfMRtm4jz7+Rl
	xyKs55DrQS4upadDfuOXAU4Qvpti6MFm4yb/Gu3brIWu3KvcNqHusbEiRcHbcBQMaZ7UvTC7KYT
	gu4ybA5lRZj0fV0GdXKjJ1HYWasur1G5sSaCTtPDVCp95n/jARV/hUUMtYJU=
X-Gm-Gg: ASbGncvmQOp2waKLIVYtKS4b8IcTv/Qj+cH2ivKwA+wfkO9n+PU0VVqxICItWXvpqFF
	HI5PSmLi9oiOZubmT/q5WbyOKvXDvNTW+B/ouOnApnW1h5ybgulR38MkatXw1BHj7al+IW1HZKd
	5BbpzphsjBdPwqyrXVzvTr0IqVdlDERlW+JCaz1Qokjb1RCCtVizgNrjPBkv2k5Wo0W89oZH7zn
	107UKLPaPOmJX0+X/k0juLzj8VBF/FtC9lD0VjvfROoxed346vSj6GcUnNnf7nHc8HA+QWUQHEp
	7dA3FUd6yH9NnD9BVr6EwkiHBbQ/LK/GzFmUGNw82t/5hHyNwWxWPwmrk8QAd/xZ6LQ6GAxZgTf
	PzjM=
X-Received: by 2002:a05:620a:f01:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c5f6c0e99amr185158385a.4.1743099655454;
        Thu, 27 Mar 2025 11:20:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLPcEsJfsh5WzbEzZO7O+sP6+vrjgV1VROPutFjOif1TlVMmMX8glRrJxjPfzNOP72PbTFtA==
X-Received: by 2002:a05:620a:f01:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c5f6c0e99amr185153685a.4.1743099654957;
        Thu, 27 Mar 2025 11:20:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59780sm313691fa.108.2025.03.27.11.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 11:20:52 -0700 (PDT)
Date: Thu, 27 Mar 2025 20:20:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 04/18] clk: qcom: clk-alpha-pll: Add support for
 common PLL configuration function
Message-ID: <zyfr7dd3dwfbcyztiaajr6tac7shn6ecrvy5277bfk2uwh3txp@gt4tbxh6xx54>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
 <ddcaa5e5-b5c5-4d78-b44a-4cea75ec6a77@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcaa5e5-b5c5-4d78-b44a-4cea75ec6a77@linaro.org>
X-Proofpoint-ORIG-GUID: NOr40_PNK2DHq4Zc9GHkQdmlRiUkSlsy
X-Proofpoint-GUID: NOr40_PNK2DHq4Zc9GHkQdmlRiUkSlsy
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e5970a cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=qUIExaTrLRACx9kgswEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270125

On Thu, Mar 27, 2025 at 03:51:33PM +0000, Bryan O'Donoghue wrote:
> On 27/03/2025 09:52, Jagadeesh Kona wrote:
> > From: Taniya Das <quic_tdas@quicinc.com>
> > 
> > To properly configure the PLLs on recent chipsets, it often requires more
> > than one power domain to be kept ON. The support to enable multiple power
> > domains is being added in qcom_cc_really_probe() and PLLs should be
> > configured post all the required power domains are enabled.
> > 
> > Hence integrate PLL configuration into clk_alpha_pll structure and add
> > support for qcom_clk_alpha_pll_configure() function which can be called
> > from qcom_cc_really_probe() to configure the clock controller PLLs after
> > all required power domains are enabled.
> > 
> > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> > ---
> >   drivers/clk/qcom/clk-alpha-pll.c | 63 ++++++++++++++++++++++++++++++++++++++++
> >   drivers/clk/qcom/clk-alpha-pll.h |  3 ++
> >   2 files changed, 66 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index cec0afea8e446010f0d4140d4ef63121706dde47..8ee842254e6690e24469053cdbd99a9953987e40 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -63,6 +63,8 @@
> >   #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
> >   #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
> > +#define GET_PLL_TYPE(pll)	(((pll)->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
> > +
> >   const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
> >   	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
> >   		[PLL_OFF_L_VAL] = 0x04,
> > @@ -2960,3 +2962,64 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
> >   	.set_rate = clk_zonda_pll_set_rate,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> > +
> > +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
> > +{
> > +	const struct clk_init_data *init = pll->clkr.hw.init;
> > +	const char *name = init->name;
> > +
> > +	if (!pll->config || !pll->regs) {
> > +		pr_err("%s: missing pll config or regs\n", name);
> > +		return;
> > +	}
> 
> Seems like a strange check - you are calling this function in a loop which
> looks like
> 
> for (i = 0; i < desc->num_alpha_plls; i++)
> 	qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);
> 
> Can num_alpha_plls be true but alpha_plls be NULL and why is regmap
> considered valid ?
> 
> I think you can drop this check.

I think pll->config should be moved to a calling code.

> 
> > +
> > +	switch (GET_PLL_TYPE(pll)) {
> > +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
> > +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
> > +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
> > +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
> > +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_TRION:
> > +		clk_trion_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
> > +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_FABIA:
> > +		clk_fabia_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_AGERA:
> > +		clk_agera_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
> > +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_ZONDA:
> > +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
> > +		clk_zonda_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_STROMER:
> > +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
> > +		clk_stromer_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
> > +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
> > +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
> > +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
> > +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
> > +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
> > +		clk_alpha_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	default:
> > +		WARN(1, "%s: invalid pll type\n", name);
> > +		break;
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> > index 79aca8525262211ae5295245427d4540abf1e09a..7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.h
> > +++ b/drivers/clk/qcom/clk-alpha-pll.h
> > @@ -81,6 +81,7 @@ struct pll_vco {
> >    * struct clk_alpha_pll - phase locked loop (PLL)
> >    * @offset: base address of registers
> >    * @regs: alpha pll register map (see @clk_alpha_pll_regs)
> > + * @config: array of pll settings
> >    * @vco_table: array of VCO settings
> >    * @num_vco: number of VCO settings in @vco_table
> >    * @flags: bitmask to indicate features supported by the hardware
> > @@ -90,6 +91,7 @@ struct clk_alpha_pll {
> >   	u32 offset;
> >   	const u8 *regs;
> > +	const struct alpha_pll_config *config;
> >   	const struct pll_vco *vco_table;
> >   	size_t num_vco;
> >   #define SUPPORTS_OFFLINE_REQ		BIT(0)
> > @@ -237,5 +239,6 @@ void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >   			       const struct alpha_pll_config *config);
> >   void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >   			     const struct alpha_pll_config *config);
> > +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap);
> >   #endif
> > 

-- 
With best wishes
Dmitry
