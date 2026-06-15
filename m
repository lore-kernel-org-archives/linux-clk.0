Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0673E37F01D
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513168; cv=none; b=uVwcszwBoAwN49Re94sv4RAbs8Kab5lWlft2bxEtMw2j+PxUeYxqf5q+Arzc8SU+xR/GVPqW02VqoX3dPdQToqLfpFGGA94uPstYg1MtK8jsnX4NR4FmvJf3BhvFx3AG6EirjTkpJtVtrhPlc2dqtfNcu8JUvNKlZ9M7Wocw8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513168; c=relaxed/simple;
	bh=/O05/RUXDTPoINgeXSSQztmerkf3/d1laEEbbrZivPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W90287dgaZHZdJNXeWsYFrhSmyYfdGhN0TNNarZxs50AhmzMZjy5HkWRlGOm5/A8uoj6BW9PcXd9kwzyft+ceIH655glYbS4ztBCYOEHNVpJh4St8iQU2ZZXDzKuD/p0Clbd92IgIPu6zL6WsYTWDAH8BkSscOjs/eapo0evftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N48wynWW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5H5X8Rn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N48wynWW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5H5X8Rn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Lig33853182
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TQmsqoe9deZs4vwOMpPUgVk6
	RggtnzeexXvCM12GNX8=; b=N48wynWWB2UjZW7DAs120KmX8QCk1JlgW41b5BCN
	AqFz4HYgYHskEveUuXHDleVDHk61XBKUNEij+WPLD2bWLQbXKR9KlXgU/sEOErIa
	O2Y110pBeQ+2Up6c8upo/UcbNdhFOb6IYvPcPQ92h39nEt0r2AX85lsz5wexDW20
	+4JbhUlmzTZXVMGNftODqJwA4HMOi09fD1xAw74RFGvJscnydfPpdwHx5jlocgMd
	TpeWLDATv4WNTvizEHc9rund7ldYUNL5DK23Zks+yEdsx/DtauHaeNWY0CxLiWWy
	hnq1Ymmhm7coLwy0qfuoc7EIRs1R/KhwBJCIokvGxMYgzg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gxhwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:46:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304dd917645so6630289eec.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513165; x=1782117965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQmsqoe9deZs4vwOMpPUgVk6RggtnzeexXvCM12GNX8=;
        b=Q5H5X8Rnyjs71X8xhLPgaMC03QiGmpYB2rCIDefYKCjk4QmKYvCXMolualyuycKmpL
         zJmrTz3uLNTsjIrINtOacJ1rRZfy+HRjpV4rQWfgccdX1ZyZu28wJhpqrsUocCAzOZGI
         8eCfFmpcrBls7l8o/pusgCBwk8TqcCbflVWbCfghkW68XVwgnILB9ybApYR3ApRkBkH2
         4xJfNr7UKDZfRoeeWw2ssdzzvBV2LhnJzdJeBSOt9vilrL8Ape2ShrM4eISG22bymvNY
         xBwtOU74OKeFRNc9nrcWpraBR3AraGAViMMMJvhQYGLeJQEzWGD3UavZ4i52U+J67lxM
         pIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513165; x=1782117965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQmsqoe9deZs4vwOMpPUgVk6RggtnzeexXvCM12GNX8=;
        b=Hj3A2jFst28l071N537Y2nTKujgEOWO+jr9wZy1e4Nn19GGYqCiZhySOOwqvotf6FY
         Bry0Uc7ZBBf/43foPg6ZkMs8S/NC2u1FZ7Ex+1bDtgFtC8EmZZklFI1m1ZfbQQ6/D22C
         3iE/c0K9Y7MESvmzCJu/jDSRoruD8eLEuO6qcYAwklHZsssg//rhXsT/xmb3xi2fSEU5
         rwdU15wqj9ss1V0EZGRz0BEwv2NjpFKQRE1PrNqjoJGeOqIjSxZzogc0oeSOzEWmPq8x
         I1S02AVUVyzvrJqoN9zxlg0tUnIvMSl/XcgFd/TXBuEBTeAOrDZdWxr8gfHc3rBKS8Z6
         EoTA==
X-Forwarded-Encrypted: i=1; AFNElJ8JFbZxrk8u5svh45JI135IsPLQm5+lUSn/Yy4uqPVwJfz9jUfEO2SvU6ILsKcVQW3Mkk7Z0fevFCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybhYChwLYkz5yd0C/DERAJb/AFU0ZeL6DFO9rOe5vMOU1fhzXU
	RJ9i8d5hAK8C0rnVitw1+xPoCUpYP5eZ6P/2zhYvJBg6HuGyVGH5xWX6wDSGAcTfQEK8lzH0ad0
	S75WFrmHFP29BCGVlBY3RyuLwhxQIWv1KHKX6YOn2mxoSxs5KVnZ++6TbdosfYhE=
X-Gm-Gg: Acq92OG4wE+e4tbu2s4Sot+6Lr48IEfSjXiBM5vaGSJLTX/yT5g98iPtVkPOL+evck7
	IHStgLC8HHdd49Me4K2CXZE2qcav73XGNBSjSR3airzdl8/B1QMofK0T7A5AvrX+S4xEUy9zPfu
	9g60XH/U+CcJKLW4sieflLkw1Y9tZa1HJRHBNHX3l+PEYVLtVHBqpyq0/BV1XHF+wJ4I9fLv1WQ
	IQh1Ir9fScURSolp1Gf6fGpH806a56QWuxhFouLfVeZi528MGSorNxWa+L/02brra6uZLSh8KWm
	NkN8n+hw0JePKpH4CTNbXIHaGOHa1JIG9yBN41gHWBkuIkhULROIJv+liJK1CGaur97sxSImfQL
	tuzaJuAl62bV8JcFrnUSufzE0xsZyV/8jWC20Zm7TluhghcMBE4lpnt0+UkZy752wHuI7
X-Received: by 2002:a05:7300:2148:b0:304:2e00:5fb5 with SMTP id 5a478bee46e88-3081ff4b72dmr7832577eec.3.1781513164778;
        Mon, 15 Jun 2026 01:46:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2148:b0:304:2e00:5fb5 with SMTP id 5a478bee46e88-3081ff4b72dmr7832552eec.3.1781513164193;
        Mon, 15 Jun 2026 01:46:04 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb8f8b2sm14166142eec.27.2026.06.15.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:46:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:46:02 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 3/7] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <ai+7ym+qM1GbTO/b@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
 <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX07uKNn7cnwdR
 2J1OYPxIDXzxoGeaerFCGD91+Y2UBqAfU0pEdWUzZuOPw15+7rXnvlrz56hciDikURt8A7yhQdU
 TrQyU5WDXAzESlkp7AuRHAhFJDvhEZk=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fbbcd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9x36BgKddDksvwc1ZLQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX1dUfR5JGEKDS
 Xv/CaQoYJ+FOSlw6knKjtII58auKsMorHZrs8MJJE/mW3kiTtrZ21dxTcXUiyF6UEOW7AoeDlht
 P0fM428XKWfcyWe6eYgEPYIgqj4lAei1oCFvJvaZVzR1UZoUInPH4YYQ8Yt/iiWXIDDG9oijgyO
 nRqIP0VKVy/S5NWYyLNzjUoIq/vao3xQY3xjlXw94ElNqdHS2+ly0QBRQEWy3jjfSV6O/eOcl4Q
 1Oc4GTzPs6wsdWtEFLOc5TdSWex480279hj4aCw5Gie63E2fgn4ZfN6k0Oo2zn8L3Fo77w80T32
 ns2jWLx0D48aOymyEcLerTJaJl/R9x/6D27v/CxBIi+pxJpgMYkto5LqjgoS6C2ky/BDAVgJqYY
 seKcaYJvjRl8E6/Kmn5MvXKlNUXdC5SsdQuUB05gDzcIXQs41NsQyfZimSwUC/YpmlBWjikSzzo
 eTQvdv4h5E828eywxjQ==
X-Proofpoint-GUID: Q5lSdCK8AbMXjuwr6XKTJ4fgGRDjFrYu
X-Proofpoint-ORIG-GUID: Q5lSdCK8AbMXjuwr6XKTJ4fgGRDjFrYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150091

On Tue, Jun 09, 2026 at 03:02:27PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > Replace local clk_branch-based clkref definitions with descriptor-based
> > registration via qcom_clk_ref_probe().
> > 
> > This keeps the glymur driver focused on clock metadata and reuses common
> > runtime logic for regulator handling, enable/disable sequencing, and OF
> > provider wiring.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> You can remove the of.h include. Apart from that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Also, attaching a diff to complete the regulator map. I'm fairly sure
> these are correct, but it never hurts to triple-check.
> 
> You can add:
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> if you squash them together. FYI e.g. the tertiary USB QMPPHY would
> only start every 20 boots or so without this, running on pure luck..
>

Okay, will sqash them and add above tags in next version.

- Qiang Yu
> Konrad
> 
> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> index e317003398d1..eb4ee8ec9ad7 100644
> --- a/drivers/clk/qcom/tcsrcc-glymur.c
> +++ b/drivers/clk/qcom/tcsrcc-glymur.c
> @@ -21,6 +21,14 @@ static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
>         "vdda-qreftx0-1p2",
>  };
>  
> +static const char * const glymur_tcsr_tx1_rpt0_rx0_regulators[] = {
> +       "vdda-refgen4-0p9",
> +       "vdda-refgen4-1p2",
> +       "vdda-qreftx1-0p9",
> +       "vdda-qrefrpt0-0p9",
> +       "vdda-qrefrx0-0p9",
> +};
> +
>  static const char * const glymur_tcsr_tx1_rpt01_rx1_regulators[] = {
>         "vdda-refgen4-0p9",
>         "vdda-refgen4-1p2",
> @@ -40,6 +48,15 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
>         "vdda-qrefrx2-0p9",
>  };
>  
> +static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
> +       "vdda-refgen2-0p9",
> +       "vdda-refgen2-1p2",
> +       "vdda-qreftx1-0p9",
> +       "vdda-qrefrpt3-0p9",
> +       "vdda-qrefrpt4-0p9",
> +       "vdda-qrefrx4-0p9",
> +};
> +
>  static const struct regmap_config tcsr_cc_glymur_regmap_config = {
>         .reg_bits = 32,
>         .reg_stride = 4,
> @@ -52,6 +69,8 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
>         [TCSR_EDP_CLKREF_EN] = {
>                 .name = "tcsr_edp_clkref_en",
>                 .offset = 0x60,
> +               .regulator_names = glymur_tcsr_tx1_rpt0_rx0_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt0_rx0_regulators),
>         },
>         [TCSR_PCIE_1_CLKREF_EN] = {
>                 .name = "tcsr_pcie_1_clkref_en",
> @@ -80,34 +99,50 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
>         [TCSR_USB2_1_CLKREF_EN] = {
>                 .name = "tcsr_usb2_1_clkref_en",
>                 .offset = 0x6c,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB2_2_CLKREF_EN] = {
>                 .name = "tcsr_usb2_2_clkref_en",
>                 .offset = 0x70,
> +               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
>         },
>         [TCSR_USB2_3_CLKREF_EN] = {
>                 .name = "tcsr_usb2_3_clkref_en",
>                 .offset = 0x74,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB2_4_CLKREF_EN] = {
>                 .name = "tcsr_usb2_4_clkref_en",
>                 .offset = 0x88,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB3_0_CLKREF_EN] = {
>                 .name = "tcsr_usb3_0_clkref_en",
>                 .offset = 0x64,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB3_1_CLKREF_EN] = {
>                 .name = "tcsr_usb3_1_clkref_en",
>                 .offset = 0x68,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB4_1_CLKREF_EN] = {
>                 .name = "tcsr_usb4_1_clkref_en",
>                 .offset = 0x44,
> +               .regulator_names = glymur_tcsr_tx0_rx5_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
>         },
>         [TCSR_USB4_2_CLKREF_EN] = {
>                 .name = "tcsr_usb4_2_clkref_en",
>                 .offset = 0x5c,
> +               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
>         },
>  };
> 
