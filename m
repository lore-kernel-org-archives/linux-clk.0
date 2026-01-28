Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1832EC57F
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596830; cv=none; b=FAWe2SZDPu3ToC2K3VIpKguKznpzze2co0BhQuQ9V95u85kA01ZKoreUqqCAWAuGtIoSa6OSe00ewHEnb5VMVlZytAPy7ed/SeMKDtwr62sGr/aaZ3Lff/zeyPpvu+nr+oFb0q8kHsQc7dM0xPQFXqxgkUvaNg1cFqSF8mkkYLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596830; c=relaxed/simple;
	bh=xNCuBjdzS4goBIvwhhXFzsi0BmxhT/kaPlm/aIO1PAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzkxXKskOxDXDeVScyX/XYqGbxES+fEnZ9mIUfKBN6heXE6gf3+btNoJUxv/zFp63mYItlwNAEStBISaxxnNDmJ8a4Vw8hvcA6nBKFIuUGnrzZEmHuLpZ4ER4tx+zzt2uMvihbkfpW98rHdsjgbep/QECwIdrOqKn2V6gI1UM1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqIhipHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4TFVlws; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqIhipHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4TFVlws"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91oob3442237
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1RUTm2rK9W/8H1oDMERwWFJFkerUpB49X4+1zNyNLdg=; b=AqIhipHOFcS5YYms
	Ihh397u3CjD7BEppLGJPviyIAi+6GM9de3mLm9ohtwmi9rgf0K5M2XxpZEQdO06s
	02+Rs6dN6q5IiQdj1xnYdZao9go27AcRf2f0eWCqioJHwi/uCVRJy+1r/xRfagM9
	5KL2sHOpLuhhbhfjl/X5Qozauf/ByloxLgSSmX/MiPSlTWxTRs9wRKCyF7XfMHlT
	3ClKI4ld2ex0rXJLRWSf/Ks4i0YZ6igG5z/xnHlItgKkQFAZtu6rKYfKbE4Qk0iy
	tlnC/yqAdcdKxuSLvHbUL++8ENzXhw0WwoEXO4RmaSPbHdOG3eBbv+DRUPr02IJs
	Ar74zQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanahaeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:40:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b48c08deso198135285a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 02:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769596827; x=1770201627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1RUTm2rK9W/8H1oDMERwWFJFkerUpB49X4+1zNyNLdg=;
        b=a4TFVlws40h7o8i7rn9Ae8WmpSMM8JPGIVNfb2VKRhb6hsdb1JMgb+vrmKKLs9Q/zc
         IBolZS2c7PDpHBfwTCgeS/uFtCb2HKGqmONlxo//2bJ1u3JzuEcvLwEfEFqtuGPufQTw
         mbdB0HtIw6vJEoTSn15SCE4OG/4Ff3MiP2+b/+ROtu4qYstx8eHpjVp26JNdBpfhBcvQ
         Pmz/dhHKrMZ9MLfmGTl2Ejx2wvBuvehp3uKAvJe6ZkQz3bJodXoGpbqZR2+hx76DxSu0
         Hkm1CiQ8D23pvg/r1gdc3ZP24iBVCE8/nC1eVa/EtPovdnWY8YJ3wfOsaWT/MLm9+cR0
         cfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596827; x=1770201627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RUTm2rK9W/8H1oDMERwWFJFkerUpB49X4+1zNyNLdg=;
        b=O5hnkPDToG9TaDj+jwfttACtBseKKDzChhTKYcFvGao0Ih4EAjxee6KzNl3GnnYHIi
         bgxuovccO6d0vs7DsyyxpMbrxQV4+4J0JUYcSVRXlvsuK/0ykPVdqniTaH6pWqiqMlfr
         Z4h047ZONuFRhuYYbVbieZPpQEYNbScaII3r5PYpyWICOUIPTm9yXujacH6HnhA1qjUO
         oPsnltpSDRqiZ3B8EgNfawrXYBXeF6rTr/GycwIeYiFISsFtqAHXztvhIzI5qVWAPe+g
         J2HoSlaJeZAeskeiQRDduIZx94C/aQgRHTEQH2uibH5S2IPhgr46ee2cCRJYwQsR6rqu
         y9vw==
X-Forwarded-Encrypted: i=1; AJvYcCUpwt2I38nlwJp0vnRTTS/CLaBkCKWxGj8w/RSr0wdyTnUdtpd1RWWJZnlTMcf+rQdtAy/clzsmxec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP1OpC5LDO1Groekas4vjXT9kU2Ise3d2y45SSOCfUd0dNPCVp
	2MEvIoL9RcVT3pye4oXtcuQBll0+40nmmH0IkiA5524PAf8r7BnZMs5Sqbl150p7q9rYfzzlBjy
	hbxIDrumPka3FBZZCnlB0/kvp17axnmjp5NawGL4kOXYfcUMJlzdpSh/inRH6H/o=
X-Gm-Gg: AZuq6aL0mKyok5g86l69qqiqXyuIhs1n2tuJGs7s52EXz1VSexlfVZ/JZ65UvweYI+t
	9MzE0yfrefE+MlW2LVO5/7k85rvdtE6Wm2b7RyPfLf0s7oHBL/dmROWqPDZ70Yrz0Cr4szg2i3j
	UFIMFj9UAxyTdjChzLQau2WMmZma5XegM12/wAsioGRiZ3MMXeghOFONS2vmv1fiCCSVcTGgQJb
	FPleExK9E22ocfMCTJfQqcCMISv4JXqLFz1pXANmFKkzpxJlk8HeO1Nb3Rucn12S8GNicXN/Gb0
	Kn0AIE6GA+GaJ7Zj7hvNUVTE60xzCOAfbIhAEnhDU0ZQInYtpy60Ydce1V99fsocE9BtEOEkltT
	+aXellUjSCIMJeZSaZfKBftKZMrZfV9l+sIly3GvYdf6EEFZvCDskQCVOKhkEhSzB018=
X-Received: by 2002:a05:620a:1aa0:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c714b481bfmr123925485a.2.1769596826879;
        Wed, 28 Jan 2026 02:40:26 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c714b481bfmr123923185a.2.1769596826370;
        Wed, 28 Jan 2026 02:40:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm109656966b.31.2026.01.28.02.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:40:25 -0800 (PST)
Message-ID: <734ae332-e1c6-49d8-9f10-a68e84360ab7@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eM-AC-3qib9qPrty2MwQ8ZQ4HU0NBjcP
X-Proofpoint-ORIG-GUID: eM-AC-3qib9qPrty2MwQ8ZQ4HU0NBjcP
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=6979e79b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yZxmAL73Vz1KKP0sLwcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NyBTYWx0ZWRfX9qMJ6r0JtmlR
 z88IfqpQibz2eoe3wZ5deQ9SI4u3CXmGYW3qTU4GqYedr7/pZ8cU9pJlh/o9bHFlfDIeSoVXz60
 6bQs9QarRrXN1mdLZ4+EFITUOSEyy4Ofy3OnUvSLgxOK+VrbvwRvgYefM9tPQR81idhxTONtZmv
 9fjQRrkOeaoNRYXYmwe/oJBcHmTyzDlpu1BxDsGyhQD8TCmtMsCVMA8R4YFVBxKq+pzAiPAYrX2
 LKfQxA+IKAefvq1GB9f8O+GMkxhm7GmP4PAbHxtkqXG7bleiRxBSOgO2eTtmFoB+8wq9meSLhqM
 QltJaiy2I+or5o07zhsR20t/Icv4tHjm159tSlM53bzh3QHSm4fCyuQIcKZqoFBoh5bz8JUCNSr
 9qZTnxazylw8cog68CGF7a0tXwOmCJUcY5BCj8KrWBjpiOKkSy+9Qo91SqWFXJHBROJrQ/tC4pR
 Jf51UH95ap/Qu4MEmHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280087

On 1/27/26 4:03 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 547729b1a8ee..cf46a6585174 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -940,6 +940,25 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
>  	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
>  };
>  
> +static struct clk_hw *eliza_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,

I see that downstream also has LN_BB_CLK2 (clka7_a2) and RF_CLK3-5

Konrad
