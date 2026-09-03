Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8364A92EC
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441060; cv=none; b=ESQS5krjjse9Ta5Z9nchVEOWev0PrN/d2qYBMlygtgLKMmr/Hj2Vgqhe3j3DF5cgNG0ciNUSL4yUSCM2yZWMq33TVGha8YfDRwGx/ZNB7tFfmMQEgcHRVeJtzf7S1LKY8kWmMcBc0S9SOwt7l26rwrKg0izgyZJtYaoFaRBVF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441060; c=relaxed/simple;
	bh=OUocHxNHaoVUmZukJnp6L5cZUWHYtQ8kCIucV6TV0dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub4Qr74CQOkGEGqz7qW7N2tilfwwQVoRzqUCOT7xFaMNLALHq9lDGNhu76hw+KkVuvll772C9WbUr2S2Y/S7gJagepqC5vms7RDZI2vX6+kPja3r4LFDshrTMcxKMcumm66m1upStp5vxUvG6+pxcs8ta967w0LCYbcZt6vSzmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKptOiMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Frbutl1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKptOiMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Frbutl1X"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAPG51040600
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cn7sN8g06PhLcqch4IQw8gv6
	uTx2KKsaOGyxpQeDq28=; b=RKptOiMUoW8m6un7H8mN1o8vuFe58rpoeMHd2MB+
	FpSzPfgYfRk8yln61tLY05aKdlhqqlg/yIvwhNmUX+/aTZQ48+j9nwEnd99Fm/Gw
	Yl2h21GuM/Oh16enKrF20x73FapEdqdvGAcWaD9IZ/eXi13uFCmpVxlXqgGgBIxK
	ficdduSqECy/4PHfW/BAWAED3Z63CExjKMEiSsnYee0mwj4u5plLoDErK2L6vBEq
	F9HtvbyOJJUQfUPOrL75jjVZwqeM0g3MrZg0RD4epFoULebGqCUbCd41OlloA26/
	vOIiPdV9vB9BO4GAFIxmksxZzD+ZWojePPztkbA5XfuQoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hw56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 13:10:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso397448385a.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441039; x=1789045839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cn7sN8g06PhLcqch4IQw8gv6uTx2KKsaOGyxpQeDq28=;
        b=Frbutl1X9lV00ToVuNj3CqVOKjJ2A+TixGO7y9vaOM24BuZER/RdWpBFP6pZ1x0/M6
         DGHlLgUjP+LsTkUnKz9gNRj8M6NdVgGtxYbXUKLn4JuFuypiyQBJkoxGjqwkJlWuD9Rg
         kATPgQLuKMXA6ANY98AvucA25oGjB8BkebQDUICPpp3cPpEPTkqebgEhZtgt8xGP+Yr1
         LSvMQklzbQW5N5rhtnkYcPHUMVfPyiCjuQSRUgnEf4tBC6YTaLXcqoPeYWI3e98oTL1g
         33sgqqOVbXu+NrocjA5AiGZ+1b+QE86+zGesFxtkMV+ENrOWXDqZvYVuG0gjHZO827Es
         XV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441039; x=1789045839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7sN8g06PhLcqch4IQw8gv6uTx2KKsaOGyxpQeDq28=;
        b=hO0IcBKhRCqWK300wGIyunikGTf8qU3PUl3DGQ3BIWunDcAIHvnD4d6l6wezqO+7Ab
         hVkMbehd7EKF93ZqiuNaPTvnuxo7/A44bGP8i9lvJ/LfsRoYDANfCtsN/aYc4Lt++es2
         Skhg6i4JSrxxDg2ObOG6uLEN0BA85l1Z6GxQJuDXSPw6yJPxfiHDC2m4TQpnoeGU4p8l
         X9lQN+dG2x0B8aRbba4D25rTNKG8o/RytP4J3rp6qe06BnS8UNMpMudtIPUWIdo9gPsJ
         fmLPz6SAez4gwZ5n9CW93jRJBwh2kBrOej8qLelUB4bflKw/cYueDNUUwVO+EA7nEWgZ
         FXcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOf1I98aDJ7Q/U7sB92eYL+6PWfPAgM9ZHhupuf3l/TZRsS/YPW03lTU2AoliEouH7q+HcgZozPMw=@vger.kernel.org
X-Gm-Message-State: AFuF++l1Cd0gLmjGL9d0pJkddhOzM/hZaxcyerPXxNGv19fFw93FULEz
	stiwNN5wZPu0PgksKCvg7ELcYXe6ml1eXr62l74LpfYSmpTw+8y8837ObGXoXxXlpxsfFfPVV+Y
	MWPrTAKdOlNDUmYJOKod1iCeWyEhcF1b8Eb1wdgunCZpPiAcAw+RiqxAsKl6PqGg=
X-Gm-Gg: AYBFou3dfY178G8ARYPvZmoIvHZ3tsZOIDZx+vGTbqW+czEW59U/5SwVaJ0KGMmwEP1
	8rG5l96Ueg89VOvef/XPc/sLls+sI3qhIesd2c8TlijVyuampxw6X1SMNIqg9Hg4hEDdWj8EH33
	WlWOrIB4kf5TxEip5V+f3VYzfsSbeHr8+urQDtjf5kBFnyASr3tM5FmlIzwDD9MCtWTuZI4TSMs
	LgeLqf15rb63jV5ojQqtJTPC25qEnIrB4Mbluddl5B2BgyzCTPXkfTYcFn7RddcUpxGmBVXdvP7
	rvFg1MIPVewU08D11kdJocLhEUniuOoc8JnFGjOHcTfzn7CFEmDNJmD8aQcOxUmn6IfQ9Wb+P2v
	m2iLSIaMnO5F5bg==
X-Received: by 2002:a05:620a:f01:b0:936:cda7:554d with SMTP id af79cd13be357-9396e9bc00cmr596205985a.14.1788441038759;
        Thu, 03 Sep 2026 06:10:38 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:936:cda7:554d with SMTP id af79cd13be357-9396e9bc00cmr596195985a.14.1788441038097;
        Thu, 03 Sep 2026 06:10:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm76285335e9.4.2026.09.03.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:10:37 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:10:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Message-ID: <44uo7pmwu3iztzgwqwzygyisipoqt2bczsawojzdn7hszk6tl6@c4ybkv2zvcgy>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9971cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=T-px378Lc1Y-79xuwAIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KesNoTxlt8hgVMk84vFp4WyM0dcEYXJe
X-Proofpoint-ORIG-GUID: KesNoTxlt8hgVMk84vFp4WyM0dcEYXJe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfX4t+M1fXuqwuU
 qS0oQDiy6N/IIEo5qpPZ2uhDwZp2OwLcq4gWeQX8oz6z4jt40u96iIdtwwXj3anS7HXbWKxeNzG
 +0BBDFSR9J73Lj/TvlqWb5Ls1IOCM5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfX159R+op1Hali
 TJJZCGvW0zgegDdTErPecFIHnF4R5r/KNkSIDk/C66oGA6y+NUh9LYJzNEO2G4Lk/+CAjZLzJqS
 p1CFgno8+ICL7HVC/+2DRHT1vzQjaRTiR/7eryAxs1kil0VBjs/Ez/HDlxl/X6SdALV2E2aK7LK
 2ibxXTxwahHF5njIOhus+y3DfkL2e0Ah5VcXT3lwT4AxHf+GVakbxpTgYj5KKcqvjtmewk5ildZ
 br3z8EPkd6x7ECwfFPI1BpVWMw12rIe8SNPdwWiIsHWqHzk8sgVGugb8x5QVEHJNtGrNzOgSiWM
 gv1KSA1ep6WVwYazGTyCyRVPbY0bfA9YWmcxH80rsjYhm2XW23MDbTZhZnM/qzEKE35O5enu9nl
 frMCRT25bog3puVGGfDNR8PDfABaXC/ZcAg7DmLis4Bqi1Av2f8v8r2zMQICaFcLF04kTi3zhn/
 QYuR4CZUa1FqM0sJ35g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030114

On 26-08-14 05:48:13, Luo Jie wrote:
> Add a flags field to struct clk_regmap_div and OR it into the
> CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
> divider_ro_determine_rate(), divider_get_val(), and
> divider_recalc_rate(), so that qcom drivers can opt into
> CLK_DIVIDER_* behavior variants such as CLK_DIVIDER_ONE_BASED.
> 
> This is additive and backward compatible: existing clk_regmap_div
> users don't initialize .flags, so it defaults to 0, and
> CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
