Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C664636214F
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 21:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091752; cv=none; b=AKDVbuL3wF9i9LZve+vSi30COnoqbNUnZ2cQMsLOcaqmDaMbKWuufKJm9xEzC1GLQPxezf/ZCbqdFW9EOl3DfWPqB6CggRlM/Fscr6bF9My88QMdar9LNQrTeEBfJJbeU5FxFT7vKnsbpm8WXj/4OuFm+YKn3Ln8ykeOggxKfC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091752; c=relaxed/simple;
	bh=yx/PJl3fOh8J95iIDiPr9KOd+MZ3nf8yHNz14rVyUdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekhE/og936Uti1oEplvL149ZKEpLSYdTyFfUgGInZL1ViXcHfGAG5CvcU23G+ES9DfYjGFgSnzPl/9dPQsnIElw1Wb0NNytW2sk9p/f2Pi8IrNCDlP74c05kyKaJ2Vuj1v+z/Z/BxXuHB08MQHjviposPS6fdpgkmG+nZdoyUW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTxc8vQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0RSw6FL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTxc8vQw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0RSw6FL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCfO93281674
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 21:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5rtAzHt3NbBvzXh2JyDmHMWK
	PJ2f2balQs8e+pR1eT0=; b=NTxc8vQwktdgwjKha6NJT9BAaTuetQBlt860s7Wx
	pHv/QE+8Cyzi/SNnU9UJNFNcPOG4M+1ybPa5T/Q8bTdaNQGkTC7ps3D/iSsqLrHs
	EFpPpGLfToj8OMN4JVke7l1Vjw01Pfym8usgNafKJaZE2Gzm2lEdUu2Pdy3PGNne
	ni9i0pb7O2usEWbgU9cn1VShgZdxGfCNYrd7NE2CFNEO5g/GcKzsuN0xrnSIqpPI
	WukWw+AcdTqWLw94uukDeZELVy+AqxoTrfs7oMZNkioyKLiH9EfcFlPUlMkoD0v5
	1v/EW73IwmMaGJt4YFSqHe/nH+AukONrtIvk76usu0i9LA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyb9k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 21:29:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd858e8709so1406755885a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 14:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091750; x=1773696550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5rtAzHt3NbBvzXh2JyDmHMWKPJ2f2balQs8e+pR1eT0=;
        b=c0RSw6FL7NMNNuQuWI0rfqVLSlbqdF821Nj0mjbMd9NDD75fMijSnroO/eW23kcknd
         mdbooMkElNnOoVNW804k0tyuo15ggYNVEBUl8iu7sQqbr0q/szhQ+T1/e4ER9wRfy/lR
         ukNc/6iL0wuMTyiTJmPQNDOHUDtYY8D+Z531zD+DJp4mA7x8/J7JC2dD3QCuoaj9f2CZ
         hJ8ZO4LTrncWUw40jYvURPldFyrMcf4gXU4+4gaoKNd38XRUet17ATlBEo9HeI6SxW2C
         YRIqqjyjkAwPPxE26pxCGzBSh2psrwB55NNLzp2lE/RJf+pfrXYZvX6y7fOCU3pROhk3
         l0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091750; x=1773696550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rtAzHt3NbBvzXh2JyDmHMWKPJ2f2balQs8e+pR1eT0=;
        b=Jw/ALHPUOBz/GcSk+pT/TMQNmvv726fxIwdk9ITha6rwYgPLWmd1e1+jDPqJJFFPLJ
         mmMj8LTjvXBzN3YI4fFEMNMYsfSfUsFCjDcNnYatiEHmZYAK/wZgLP6vrw6sB1NnPgNK
         dzzlBMTl3be6r3+1OMaMoTw1kIUR2CAxh6EwD1iXiSXwG3i4yqyu81ppbZKsNK3W8PzL
         4XyD023sEhuQvP+788pcosriPP7pFDwmoxD5r5js1tTADOSv/y6S1XNSIlN8SAC9t502
         Pu0UiT2r5nTXJJC8Qdjc19U3i8JhCLigDJvHlgW1jzqNsrPR89siXwzmMFT+LnXLron+
         7+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU9O/TwY5p4kbFPyNsRF5FhPPCuLaWFUmc8vYUUHMXR/OSX51kpp62HjoPLSnHTazPW6T5tf9dUtIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCk9+vZHsOSQDYJc4m2WzuEsPdh9TxaKB2cY6XsInlK7ifRge
	6JtmP51Oe+HSQJRA3OL8BmIS7GYhUw5Fs1DODBZAllMEzCR6CFhJxhrTROUqd8rbk6eci4H76Wy
	OWF0dSB2nWY/zBM50ikTd8g0jCY3XNr2BNasVgIrltjIbVYmK29NW+aYm9oWMJmg=
X-Gm-Gg: ATEYQzxUGyhYtgkPG6SILsT9xZszpfUOiINJT1g5ud5Bxnt8AVz+6RqpcZY9QrYwM4O
	5BP19k7e/bDzdOvPa+rm3lFihZUcrEJB930Z/oJh+ekyKu5cpAitI6ruPHYYCok8v23e8dnWDwj
	IO3/iA6/+3b8H7fSm2FJq6S4Mq+ya8Q6TbJABCkByb2FBhh6xmWayxlTyOvPfHzB6fWkr1Xzqk4
	2lvcA6YlYoU/Vns+QniHVTnnKcuEnzyL+GP82hBoQTYPgUiKeabMlI6oSZela00roufAid/+kCV
	yOpKg6Fav5AAQx2js75PtjhgEuEfsnYEHBNCu26cNp8nZLvNIVARvYrA76cFS8KRazYbcmMkWzx
	Nl5Yf7by4XRi+nEP/HQRz+bStiCWnHZBDGis420+rGSz8omtVlZRnHTwM0WOI+f9oEwNAySxpyv
	J8AM4bPxmJz1bLhC6KdlxOWvlV34wR2uc0KTc=
X-Received: by 2002:a05:620a:4147:b0:8cb:b062:c2f1 with SMTP id af79cd13be357-8cd6d43c6f0mr1633872085a.29.1773091750060;
        Mon, 09 Mar 2026 14:29:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:8cb:b062:c2f1 with SMTP id af79cd13be357-8cd6d43c6f0mr1633867985a.29.1773091749621;
        Mon, 09 Mar 2026 14:29:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d088f7esm1383011fa.45.2026.03.09.14.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:29:08 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:29:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Message-ID: <pdakhjbawafhsc7cqlcyd6n5bn5n2llpiaa7gz4h2kubz64fax@kv4ttde6hl5n>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-2-f682c82f116f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-2-f682c82f116f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfX0s1VSbMYkHrK
 7pMglF0OwI/ECZ+urJZ+XzBW7S/03/pZjb0Q3rLY59IJsJWtMYSyKIayN8JrPMkkZeFlS2jMtCB
 YvR1+geEJ45o4t9cb/nvpC9FZdVKEZOf+kC3/wCA+1UvRpo7ov2Zdnb4bjcbcuuHWpmTLU7frRx
 h+Vn1IyuE0ujtP1yzz9LHL1+uwgTxxiB01KUYDDaCRfBjctMCNfBLC6tgTrUaRrWdPXCx3Y+rEg
 qovA21snEMe3zrK3b3S3+QcxkTF96mXlSOPVoaLhq9r1BY8RFQEl55iJihU7yOZ+kZIBb0pIE3x
 GF7FUrNcDt6xSuAKW+Acc4I7FJe+l97veUCGYLA37kTMNdAPWvPzKYBKVSvTsKrmqKxPzrU+cYO
 pJFDUVktVI+XYiayg/dyfGNASpXr3oZycIyEczT4lXr5H16sInkYeRu77yKxiPitL7sVAxLVPzj
 MCJdZfHNNV2oZfalc3g==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af3ba7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5OlZN23s_qRqNvjSa5EA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SBo2lV8RAbw7OHnppBpttnUBuLqDt7qn
X-Proofpoint-GUID: SBo2lV8RAbw7OHnppBpttnUBuLqDt7qn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090191

On Mon, Mar 09, 2026 at 12:06:18PM +0200, Abel Vesa wrote:
> It has been concluded off-list that the controller needs to scale the RPMh
> CX power domain, otherwise some of the subsystems might crash or be

Which?

> unstable. So adding the RPMh CX power domain to the controller will result
> in all GDSCs being parented by CX. This way, the vote from the consumers
> of each GDSC will trickle all the way to CX.

This seems to be irrelevant to the commit.

> 
> So since there is a power domain attached to the controller, enable
> runtime PM.

And this is relevant.

> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index 0f3981252a68..7cb5076a460f 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c
> @@ -8578,6 +8578,7 @@ static const struct qcom_cc_desc gcc_glymur_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_glymur_resets),
>  	.gdscs = gcc_glymur_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gcc_glymur_gdscs),
> +	.use_rpm = true,
>  	.driver_data = &gcc_glymur_driver_data,
>  };
>  
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
