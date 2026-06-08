Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FABD361DBC
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 05:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895813; cv=none; b=cYgZWIPRqfz7QlXwpmjZeQiiBVdn9I7iX1m+SMZHN4dpPc1oOFr+eWEVSiL61cXnBuaSisRLKIz6TubftMWduWnUihFLXLZUA1QDli/S1ZBMoHyb6kUcD1js483nfzNYz6mz3ezo+MhJts70PBayG5Xdn+h+bLcD5TUveUmBbUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895813; c=relaxed/simple;
	bh=lj2ObgYcLp/8V76akre+mvUzL2bzgJKZ+VI9e74kRNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJDdqpQ9QpUIz4sVcNhx3WVvht9xxIKyDoVTsA5GdWTFx2kknj9I26/xxLPlWy7sQJWqHXwkjrt//Op2s9NsCQAmu6yeOoBg/vZbqh8sZr61UQ9o+A0/i7njlONCPoklKbb8PVaSre8I37k9g76FvJKNUvA+b0vLEn21wSaSgSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kzv06ReG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SH2Q+cnb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kzv06ReG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SH2Q+cnb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Esrl1957889
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 05:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KJ7F/wq/zHQAS6xIQx9ATfdO
	D/ticnIDzpzr35ZtXys=; b=Kzv06ReGdJ/jlx09ztCsn/tJmf0SnTwrfyEb2W4t
	sTyOkn/XxYsXa+MWeq3nNaHYGcqMEGXuKjoyY+8W46dKB92D3X4NaYTpi/jDGMDJ
	NDBejS/IKgUXHQYNcMrOKvItolxqSk6KwJBGDa/oXVRsnAaOusv36AZLJO4BHtQB
	55d81oNCDwGUTzUR8Reh03cRc6Xus2VzXNRSLL9mA8UmTw2BL7L7acLfR/tCLMy8
	tkei6bpCvnSx7FYFGdF+b2wfrECpIATuqZKuTzvZwwjz+qvKXe/Cooo3y3Qp+1G3
	kM1iTCAgzem4nX+FvxU6dgLMncgof7QshF353cih3MR0cg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6ducg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 05:16:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c69c788ce7so1649053137.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780895811; x=1781500611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ7F/wq/zHQAS6xIQx9ATfdOD/ticnIDzpzr35ZtXys=;
        b=SH2Q+cnb3ChAhdKvcAzWEm2F/yExmeeCyiiCbUG+rSLO1dPl2PYQmLpHFDt2JhfaOK
         W5URJBwWOuKXYJSpPVTFtyD6yBE3EpFmBQtpDxk+GzDOI+EJvOBduyAZOeNiZG/sVb0L
         DoM7fvSJ15PeVNWHoWkrpS6mOVZUOR4fnu+bjH8FKC+Bug+T82Tk/6+XB5bL7JI6T89I
         ENZXRJZAb5BR//OB+rv/0Ar5s3tRhISst4k8KnG8mxIO4ktS9FqlZxirfXdNAHwqRUbG
         PA+GK83T0cmU8ttGL/2v5qyAsTFDW7TRHl0bf3nM2SdeQLL/18iiAVhjbQ/6XfTJ5RrW
         RUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895811; x=1781500611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJ7F/wq/zHQAS6xIQx9ATfdOD/ticnIDzpzr35ZtXys=;
        b=Ko/nrUfpEfGg3xw9ZznqighqL7FB7C5hfozBcrNgq/y/WI93e3sLUzSSOneTArHOuP
         xRWHlUo5PhLXfeIf8+Ec/DOGjZWGD27CmJhknO/+w+Xw/Q6WRII9RUs1N2JhHBZIU5uL
         CaA1OmtvMcV5v6vTB5zYomdDvGO14izwV/N+YeARrfXlqqQkYWT1F3j1Cmtdrmq9payQ
         tGokO6iBAZGi9YBvOVk1mNw3kmdqdQ7qsdjFnSBmZG2kZ1rziCl8P0PopLRZjkVQP7Oa
         PqlisosGgof1kM38jePE2HOFVdZwuzhp5KYa837qttYWeGLVDR2c6RQnTNxummfK94kn
         m3vw==
X-Forwarded-Encrypted: i=1; AFNElJ8oUVIhzCe4QCdP88DlJUBSozoiT5UT4x2aMcyBZE7/KBrw8Vnkf51wlqccGxLV0f4kSn7mDJHeWnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAbqSh9YVPjVwe0U+9D6zOoTNDjntOA9dVsQc4JPQkiX0kKeez
	NwBlKVRDR30G3dbhqG/Imb195I7YIe6Q7UDKzz4nIrqPjSkxRoSUHxf/TFnxklC5A8VHrIXuPH1
	nt7yjc6cxyDNeOWWk8LeSA9W0yeq2I3tcvXpz3UvnYYJ+WgvTRKO5ISTNgGVV7Q8=
X-Gm-Gg: Acq92OGAI4MqTjOcKJF+D6QQHm8Hy7jweu2k7+UvH07Go9vrOOPdPxemKZwY6HH1gmM
	vIC2xVEXqbx4rcsFAgxo5cYoD7ZrM0X6gQaseAoN7Q5dFndCK5vtDGQ+qnrs9SIJ1gZucbusJec
	GIwssVuqbE1ELHTJ1spfa98mhUHvdkhQ7wR6NF159BreAq3DlSYzDYs7fRE5dzACCGF+Dg/qur4
	Eo/jY/YXn1RUvCd+6mIoGtizJIhqvMZgKRq8oGltADRTzpjpg5EDQW+nflzmgAntHb30W5EMv/o
	uKWydx4qboupUQ87yj1AA60uCksYoNMdc+NlEyNDeFf8zXNzpK0QEymErutHRRN7ArFuKEoT0dB
	INx0fIIj6Py/km+vgGPJZSOo2Glx097cI8XB7uvyvkCpKKoYUemD7ilfnnSvU/lKZ9zanbTU4MF
	yRLhNm2H0DPPRgKGDznvM1/qFMNrBqsEKXPg6W4eyGxG+XwA==
X-Received: by 2002:a05:6102:6447:b0:6f0:3c5c:76a with SMTP id ada2fe7eead31-6fede2771c1mr5901471137.0.1780895810622;
        Sun, 07 Jun 2026 22:16:50 -0700 (PDT)
X-Received: by 2002:a05:6102:6447:b0:6f0:3c5c:76a with SMTP id ada2fe7eead31-6fede2771c1mr5901458137.0.1780895810241;
        Sun, 07 Jun 2026 22:16:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm3606753e87.84.2026.06.07.22.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:16:48 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:16:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
Message-ID: <3hezaeahf25nlcjn7ilq5ytlwalb3vahvpox7icmoegkggtlhj@rw66m3dvngyo>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-3-a0a7bfb44455@oss.qualcomm.com>
 <2c4insgmqmpk6zothe54ktcdrzkjbbaiql5m3csagq74znnprj@4p4liju4xcii>
 <a3d34087-528f-4543-81ba-8e7ee5d85aa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3d34087-528f-4543-81ba-8e7ee5d85aa3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a265043 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gm7-7hryOjzUkzP0QZ0A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NSBTYWx0ZWRfX3uM0b/3cYrdm
 9tFGUI+BH+0XmhL6aiXT+WrvETKNfSIRdfySw63axG6koRiqfKI5S2Wa/f3/CQ3RFSIs93mKuEV
 FE7FNToBkxl5V9ZPkbdI3q1IQT6g1ZZZ3WcsQW9QaDZOtrzWDdH6i6HGJtIJn/6p8XtSQKmR2fQ
 lZZeQJPSOoLXowVTWrK2ABfVxSjBDLeFcBr8YuAuAV8+wgmiTvpRIFKonCqLhnfbO7NtH9Jnseo
 Xf78Yt2OR8/6aLdD4oYSdsdv6I/glRsHZ8lDBayo2i/o9JEKD6ULaQK+10CHMVYhtE606gS5+WC
 MhqJcSPs/AzNHzKDgyg/jk5M3D2gamrdymJLSe7/7JoSZBeR2QNgNXnQp0JWuSGegaojTnkAmXp
 q+uo8szQnx+z7nBcREXJlLtpBm9NaLGrOUPxQ9kimhjYNmP9jAYgVz0BXQq/heggSIirqFtZWi9
 3IEaSp9h+HFybUWuSfw==
X-Proofpoint-GUID: 5zxbKFmQfGb4_TXB2bGhc-3dCh08lRYa
X-Proofpoint-ORIG-GUID: 5zxbKFmQfGb4_TXB2bGhc-3dCh08lRYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080045

On Mon, Jun 08, 2026 at 10:02:59AM +0530, Imran Shaik wrote:
> 
> 
> On 06-06-2026 05:05 pm, Dmitry Baryshkov wrote:
> > On Fri, Jun 05, 2026 at 04:49:13PM +0530, Imran Shaik wrote:
> > > Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
> > > list is same as QCM2290, hence reuse the same for Shikra.
> > > 
> > > Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 39 insertions(+)
> > > 
> > > diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> > > index 103db984a40b950bd33fba668a292be46af6326e..d0d19bf0616efd5f1bc2caa037ff36d830a3495c 100644
> > > --- a/drivers/clk/qcom/clk-smd-rpm.c
> > > +++ b/drivers/clk/qcom/clk-smd-rpm.c
> > > @@ -1289,6 +1289,44 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
> > >   	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
> > >   };
> > > +static struct clk_smd_rpm *shikra_clks[] = {
> > > +	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
> > > +	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
> > > +	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
> > > +	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
> > > +	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
> > > +	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
> > > +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
> > > +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
> > > +	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
> > > +	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
> > 
> > Are there no RF_CLK1 / RF_CLK2 on Agatti? Or is that another omission
> > during porting?
> > 
> 
> The RF_CLK1 / RF_CLK2 are there on Agatti as well. I can add those clocks to
> Agatti clocks list, and update the rpmcc bindings for Shikra to use the
> Agatti compatible as fallback.

Thanks!

-- 
With best wishes
Dmitry
