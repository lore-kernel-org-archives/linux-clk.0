Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C7F276038
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 21:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252825; cv=none; b=ehO07iMAGjGwjm5lyEAOkb/a+IJ6RbU/GEcVSog4nvCCdv2ps70M3wimOOjMvNYRfvk2CqOhwGBKvG/huGc0jG+TnUmlfSBLEkqfnfrCMYEoNPSxqsF45hzgKpqPaDWK1mRQXjU9ID9+Us1JSd74esC/cojfTG5FOjo/F5w1GuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252825; c=relaxed/simple;
	bh=I5ist+EvO2mxP0rGH61vvoYKEdW2l3eY87onfBP+vsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQvuIT4Qt9qv7KjjuifTUT1TddzGC++WMKkoJNszwmMo3twG7rYr7itc/N2Qw9UCJaheDTQE260Pheww1up+SxlE4LdptxFvSZjNtF2avB+abMrp6uzoMfY41O7MisY7gq7wxCKaS8FU+NBoaFjBsaLU+RkeiDLx8mEc0KU40dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IW5W80Mg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvAfl5CO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IW5W80Mg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvAfl5CO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EDBA43773275
	for <linux-clk@vger.kernel.org>; Fri, 3 Apr 2026 21:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oRO36lu8/Mjs8ncmcB1jMrb0
	3PSx4SM4zMiBDXsvdj4=; b=IW5W80Mgcmews0sCJM32E2lQahlihqrIBGR2s+Yc
	jChNL/iiB9zg9y9qf/70PKUCQc3xcY18V0RTy2YdOoG1PhaT1/eKmMSOa6HhUnlK
	1BS0eL2tkrgm8MC6tBQs668o56VHuVHXYmEKUN9KsCq2cJwZdFI6xXvBn6vVQ1cW
	BHV/tzyFeIE0HAHDBhbbXzgR05hL7Y0N1MxJoWtLpC7Mulw3BXtxbJ7wgDp+SYZp
	Uzk3rAyCoUMIQ6zKU2Fkej6AkvbAL1/UWk8BoRrNYr5ysPSjNiIWIJEl+qcGOLn2
	e+4OIpsXL+SwFmHw/WYe3N4kqhNuC/NdT0tHiQGTibX0ng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs49d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 21:47:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso41396681cf.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775252822; x=1775857622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRO36lu8/Mjs8ncmcB1jMrb03PSx4SM4zMiBDXsvdj4=;
        b=PvAfl5COi0WbrykjXFxMo+suchfzO6ryGsurK/pNXbXZeljmOa1Jghh4ypDN+ovkKx
         q+uCsCCkY6j5XdrL9BI5Jv+oxt/xOF59V3GkgSbGRQc4U9hpHWC+/5VHRaRqh6k7suWE
         UFQgEaZGMmT7rTrIHiL1ervcyv8mVnnMzTElWmGEPr4aCf86ZCVfM2cE1M2iFDr3VDko
         g55vXO/h3aGxx/J94iiM7/twWcNNGmrd+2/CEp60csfwbtoXYmXzoOKY+SllubGAOgNb
         wCNNEBhgFz0cZspmi65JWN1IzErYPzumtnwjjHeSRitM/thkpw8RSDSI60c2vdRhUIFF
         SioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252822; x=1775857622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRO36lu8/Mjs8ncmcB1jMrb03PSx4SM4zMiBDXsvdj4=;
        b=dqhFhZfd6IQ4FJVon+kF3rvEHizQP862ccjFwEy2Hpz7kKA29EkPDK1sHi32pPF01G
         hyP+fJNZeSDVoPsG9CogUKjgCoQoDcOipTAWsWDndHKebFWNmyef2Boisxh0qlvmiJWX
         Iz2iAgRxvXbi+EcFb3M34rRjn2Q6mEkoAnLh5qrEInVHAjqnig9uRLbjK8rtdSuT8KXp
         1XOVP5r6UyDyZIHeo/lUPwJbqHW4x+gRlIiUy0JJ5wnsivHf6Yi6r1hKDqkQvRrI+URm
         q8ERbbeYivprwKsVl4Xfsb0PYhWpsqhvhvOFRElcmo2U3SpGtD4LvFisqDdpeeDrgt7N
         VJVg==
X-Forwarded-Encrypted: i=1; AJvYcCUPkE2onZfpcQpiB0FVBP66uCq+xMa5VcffHoGrCm3bTcoxTFW+pvojbwyoHujRsdJ7aZ0sMvKFtxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+JEIVfgZXIy0gn4E38nZaMkrcwav6hyBN9I2jDG/BR6b3Oyp8
	vRFdgb40V49Z1hYjyqthQleB3zULjFopnh5QIpl7A0F+PHryY+Q61zxk9m7HGfqvwNGnCIgWoix
	UyN9DkjGlLhHlBJbIWRzb6JtgIxyzhJmEFLcVmiYESbiroEAx5n2wJGCBkon7AZU=
X-Gm-Gg: ATEYQzzVaWEo4aPz3vzsy4iZalOFw/GV075tb/GkacDdctnPHZ/nzGIqXM2aKzjUjnW
	FRMHqnfXQFbEqf+WiciJpEY/Ge6NiPsEr6+p+eYcH3b2h84l0xbbLVWjVTNH9s01MgGof3f+J7w
	4ZUvSDzocqFhGC6YmV1QMJRF8a/7H2Z1SJup3TZS4BpaHIYAgw7o9oEotXX5cVWUpNxFvtLDgkz
	NlR1dbg3/8SgFrB8gNedCHT/zC9AruBIwFKYRV5npyc+dHIiwx7bpK5GaGP6ytTlTs7HcKlC6iM
	jOR5GW8dF/sWX46IVIyToO+4BbkwS6R6Hejhmzea69aex/qZJbGaTyMdqs6FojQtIgGN0bGvh0l
	/rbaUv4uBNqLJHiMG3LeAAc+4MRvFnKIU6oKCdy2zyxYfzzOgvbgYBkUPEDihzDVKaqtRG2j0W1
	xpruCwJO9NcW+bGdmln2GOrlSlMGOsMhUCMLE=
X-Received: by 2002:a05:622a:6695:b0:50b:2763:2bc7 with SMTP id d75a77b69052e-50d62a8f465mr45207511cf.31.1775252822586;
        Fri, 03 Apr 2026 14:47:02 -0700 (PDT)
X-Received: by 2002:a05:622a:6695:b0:50b:2763:2bc7 with SMTP id d75a77b69052e-50d62a8f465mr45207241cf.31.1775252822119;
        Fri, 03 Apr 2026 14:47:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm1672808e87.62.2026.04.03.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:46:59 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: qcom: gcc: Add multiple global clock controller
 driver for Nord SoC
Message-ID: <qnlojbjjo3agzoscf5edwglxe2oto3gnnaj7c24itd7dn664pn@uryse2ulsvsz>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-6-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-6-018af14979fd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8kKtukKpjyqudfNTz-ghHNONbgpw_hKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NSBTYWx0ZWRfX7HeDvYJ8FDKh
 VrTvp3TBigGsHjf8JFjMNKeA67C1gU97vJVBxD+FSdLy7WcXiS/xI+4HbjtlrMXCurqkA5fUZ6Z
 ExjIeGOp84Yldh3WyjRSAZxcDB/mZyQWUY/m5BFyrCZDqKwgZ8lVv1a3o8r1PGmkyvjzmHr4AEm
 T26T62RdIVfewVHOHoZDQGTxydlhJDDF31tKIt3/PwnnGjgAzesOlVyRsj2iy3zucTuabB/9BBZ
 Yy+EEyHKmT5CCJ9kDyy4IZ5TyjBfHXOJq2g7Pcs/MJzvHXyht5u/tbpoGNPfsJC0/EZ1X6wrM36
 CkuN9p9139r2svBpSY3sQrffhDA54O3m8ItLW6rnMtb9VTWMK7obcdbfwLCDKYVI4fRhkFqkW93
 D9oA0MDYuVYZ57V5kjczU+OQ7dpqaR2+iYYPxa1GDoPMP8YezULmaned5y+790Fz1FnAt88kBE4
 68Rr32EI7hln9nuQfPQ==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69d03557 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UazbwbvKEZ1Oz8zh9_IA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 8kKtukKpjyqudfNTz-ghHNONbgpw_hKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030195

On Fri, Apr 03, 2026 at 04:10:54PM +0200, Bartosz Golaszewski wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The global clock controller on the Nord SoC is partitioned into
> GCC, SE_GCC, NE_GCC, and NW_GCC. Introduce driver support for each
> of these controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> [Shawn: Drop include of <linux/of.h> as the driver doesn't use any OF APIs]
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   10 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-nord.c   | 1901 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/negcc-nord.c | 1987 +++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/nwgcc-nord.c |  688 ++++++++++++++
>  drivers/clk/qcom/segcc-nord.c | 1609 +++++++++++++++++++++++++++++++++
>  6 files changed, 6196 insertions(+)
> 
> +
> +static const struct qcom_cc_desc se_gcc_nord_desc = {
> +	.config = &se_gcc_nord_regmap_config,
> +	.clks = se_gcc_nord_clocks,
> +	.num_clks = ARRAY_SIZE(se_gcc_nord_clocks),
> +	.resets = se_gcc_nord_resets,
> +	.num_resets = ARRAY_SIZE(se_gcc_nord_resets),
> +	.gdscs = se_gcc_nord_gdscs,
> +	.num_gdscs = ARRAY_SIZE(se_gcc_nord_gdscs),
> +	.driver_data = &se_gcc_nord_driver_data,

use_rpm = true?

(here and in other drivers)

> +};
> +
> +static const struct of_device_id se_gcc_nord_match_table[] = {
> +	{ .compatible = "qcom,nord-segcc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, se_gcc_nord_match_table);
> +
> +static int se_gcc_nord_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &se_gcc_nord_desc);
> +}
> +
> +static struct platform_driver se_gcc_nord_driver = {
> +	.probe = se_gcc_nord_probe,
> +	.driver = {
> +		.name = "segcc-nord",
> +		.of_match_table = se_gcc_nord_match_table,
> +	},
> +};
> +
> +module_platform_driver(se_gcc_nord_driver);
> +
> +MODULE_DESCRIPTION("QTI SEGCC NORD Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
