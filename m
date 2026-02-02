Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9F3570BA
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026876; cv=none; b=SDTD72F6FqHkTst6HAcCoNAzN5X7zLvsBlom8npDpzJYo+PSJ7UjIFpvR7QTTPQMp0uslwi1EEw86sgS32+5nyOmloDAEn0EA2lc+W0BoTCPrqPDOhzBYtafBTdAEvUdLp6j1V8WwxYJl6/XqZPDGrWv7Z3NSSClmN825g6GvE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026876; c=relaxed/simple;
	bh=q3JaYDRlGftnLJOlP1bnLCR8rpRNimUz9APehgOhwOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuKMBM31/rlIWw4Gd5adLwwnhOH88d9C80lTN4Q+BFuWY0DP0H8mnrCMixOMez+0NbvSXqaEfymyKq1PM4h5p1sc+Dv9gr7hyyZiig5DFhVIDuacSdBERmsGj7qrbgpuXzSdbh3Ba0Kob6jdIBd7Yh1laBOuFvRAzgreZtdtQYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjI4TeuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFRhmYGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjI4TeuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFRhmYGm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127ThVH721975
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqHE2GDZe1zyJo4ZPrRbK6NLScmcoInrwgQz0HIxVJc=; b=TjI4TeuJh+/ZJDvt
	p60NfU3wG5wVtGy2uL5ldZlv6P8axolCiy2PiutSf9zDrIkh9XItcCaJZ2OgjdBP
	2F/zYNFzCpFf3L+n49TBRcC3pTkI7PidXyEIxMhwVlCVruleI8+D/CoST+WmXBG0
	r0UzgeyoxFSiveWhg9DS/awlj7la9jfxzytSPzJ4CL6/+Fi9KWjPWSS+PfyuuYtj
	OVVBQSxeYrrIkEDfLmwxfLzc5YGSnYDKD2gO8x6Lws+v+1AlHemYL0sXS/lxa1Dt
	o5kl3jDRDj+P5uUaclvX23OlZ1FVhgl36z0R6k4wW4DupFJ+VDnQ8WrStiTbnN97
	Og/Dow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnw1m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:07:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so71888285a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026873; x=1770631673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqHE2GDZe1zyJo4ZPrRbK6NLScmcoInrwgQz0HIxVJc=;
        b=WFRhmYGmKbgmSnL/dMru58unSTCmcpJTaJCVz/rA3LqejNcRCX3qE6oE/bschLqdoD
         OE2LcjxHMWDMxZFo2rIEd+jeyvBaPA5xi4Mout7DSdh9NS+CaoQkggDcJF8SUb20VjAE
         FhgI3OANJx1y6jn2SKO6ARPCAuuts1Je7Rsneqlatyu3OAI8ukjAlSwk2Gg5arPu/SyS
         QeJc+45ru/PBd3Yx3dPy2u8ZdgOTmmQLbbLicE+2Cewvo/e5eWmLvApKScpBtDVkFZmr
         O3Q8wqlljkyP5YitvWTRpf3lV+WsQ8CYoVHj2QkQroFGQ0Io4KTAgI+60sRJwY4tcgaF
         vEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026873; x=1770631673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqHE2GDZe1zyJo4ZPrRbK6NLScmcoInrwgQz0HIxVJc=;
        b=DpDeE/99dyiFuq0ROin70L7xALcKKQCDjk87KwhlK7kpHxZOPokjwO84jUEmVvRRj0
         KNnu07rM/z1TzFctiL2wbeCbXEALcBhIgUTBCRWOQQEeoDGcrE+kGtg58Xo89OwNaHTb
         N6ooNAuvcG0S9UsDBeMoq4WK4ifgfc32bchQOiV4z5CXF7ayb4JSZAEBw+r5l8Bw+0CE
         Ggkfd0h3frbzV5uKgsTBT3l+BlH1VJfpwc4ve85mmZMAMBMYdHGho1AGhMP/jIs2jX4I
         hUBT7WBjsOBlvFsreWm2POEXpJMVVsScpco6FNGQAmgJEklSeC78fAQoUYeqrE/rfHS6
         PpWg==
X-Forwarded-Encrypted: i=1; AJvYcCVM1bOTuViwr1OI14X1zjIa3LLCgrEnIGWQyXd71YnrA9L1az6BiWn79Rd6gspXoIvvvB41tU3IFL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSN1X+EaGrbs/2r3y594wrHSYvdx+stoBnyy+8k3/slt24xKmv
	C+pZobdXfxtuAgEY7cusEu/Gq+S112S2menb5acCh5+9BRnShsY0u4LHP0KhJery2ANXVxfjcwv
	wVFHcuI2+MkPQHhTK8Kqfy0CkT1AKBZZ7dUewLpTbGE5Z26DyVmd5qUm5Eop8qFc=
X-Gm-Gg: AZuq6aI0E86Fi0X75NxDhAexzJz5spDTcYSQOR2ZyRrJDoP/xKhHoR4B1as9opQ3ewa
	ccP/fQrZy101k/cJYx2zqM85Wha3A9dNDlqo+qP7hT2iASPSwEk7IWHtiEt4W6hShtj6flgJTfJ
	fD5TmVocrmXUY7WhChSDOd4/92Bj8emEPe2JnHuiFWPDBIujKifbGSO5zsp8/B4EKancCRYwSeh
	RySKtdA8vWg1gV1ybdIw/0tqs2kpyV0b8a4p2mBQK0GUBW2qd54bUocetsSa0QkhbVicXOgP4iK
	SXY4+7V+o93KZjj3YMw2uxFsXArvrtwqjJtCDicqPRza7iLi0u2acAFwFPknIlG6WrT+C8uKr3/
	cj5oOFhQaiQu0C/SXTtYq1v20T9iveNrfxDvFmDT8h0m5Zuah8m9R0UafWS0hNUfP0Dw=
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1175775285a.1.1770026873272;
        Mon, 02 Feb 2026 02:07:53 -0800 (PST)
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1175771985a.1.1770026872726;
        Mon, 02 Feb 2026 02:07:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeff5629sm856529566b.27.2026.02.02.02.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:07:51 -0800 (PST)
Message-ID: <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:07:47 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=6980777a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R0B0fMNruX7Akzlv-IwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: a1RFdsDFS1SOBtR7msdqJxWGqYALVLPR
X-Proofpoint-ORIG-GUID: a1RFdsDFS1SOBtR7msdqJxWGqYALVLPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX8GP0s1MZkObx
 UgqVQiYLifMI89tLV7Y/URDlrqAPl0ako35ukLg2Wjn3NN8xsYKhezyZPVhECPFu6OEVftC2YFF
 rdbuQUTGhElqOMxrKdAnhY61vXQFNozgAcXaVG1UhIC+qrg6Pc948zMYhkqaAcpvODmMdq6CRTQ
 pz5G1zGCUucsxYMcCcDRmNXtQQdY+bQweYqmTzWY/YiXt8D2kVX9RMVdxmiTyZsGUY9LbfX3CZf
 z79dKpu6K8j+fDIwtyfY7/bCfjAR58NBKj0HG7/0akHna3nxokBAW+vhyFyC0DHCZVknzRAmtxE
 VFkZESSq3jdd1BpTScGaHfT6kgJa/NHQ4DgvlOkcWE1P092Cab2BdW43PQY6/W74edXMeZJOh8A
 YQiAVlo7v4Q8QhNC/2XtGYxYSJy/mx8Do77L1pExJAnDsclpsUsG6Npz7HXlCcRJUeEaT2JoaO1
 F1kEwIbD+XhDza1Wb2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL it powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibitility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..aa71f7f53ee3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>  
>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>  
> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>  
>  static const struct platform_clk_data sm8250_clk_table[] = {
>  	{IRIS_AXI_CLK,  "iface"        },
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7b612ad37e4f..74ec81e3d622 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>  		return ret;
>  
>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> +	/* backwards compatibility for incomplete ABI SM8250 */
> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> +		iris_opp_pd_data.num_pd_names--;

You're decrementing 1 to 0 @ this point in the series

Konrad
