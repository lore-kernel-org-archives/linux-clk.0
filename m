Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDF420896
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342825; cv=none; b=aWXEdLfSJe3ujRWVo+pcSgypTRfd78wdWUer8bu/Rd3iokYBRnxNcUiK8pwNcoawzc96WABvDeijiB7H2YVkIVL/bkqZ4npLCpO1Ti9BG86B8abE97ZCOCgt9TFF/iwTj1Z5i3ZJUlt3xYtkJzPNKST0FU1F5HvxAcwSE09fenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342825; c=relaxed/simple;
	bh=PFL5j3TOs/5RUWWKBQWglpjHpi8U23pfidgWiscwBvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZurAFY5kG72XRhpSQNagIRkNeRlaHrYazKBZRRE/xiLNB1qt5+Py2TuQocUiRm2t3ZkX2wFNvA8eC8UBwa1l+55wY0wdH40pQQMmEpvRdmMsJ3rjQ0T7g6fOUK0+BG2FWcc3oOisqARVg6D5Q3TEgafUe34e/1DQ21Fj8he9tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsr7BpIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYiy+r78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsr7BpIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYiy+r78"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxB43361297
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 13:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=; b=bsr7BpINFB7732a5
	TZiyT6s6kG1k2MRD81WFcM50J11VxwmbIeqIOaXjyfPvvTMlPq01NRQajK/YXoiB
	vewBJKo3GT/2HqqwTEfheyqoK4zkDVWtStJxFgaw++ollWqeK+PDTVLROLYUTG2F
	ZV1A3t68Pek70CZDoQ7mbKXQsaEFWUsPNpmMOrKgxgYAYUzqXvmeU2P5qmJ5BiXA
	sFkUvBEx8scn6dcq3it8ILlwnMXGi7glvEddnGGz702xv/U4cQ8wYzxTlsHfmFcS
	2PE/o1INBqGSlS7otzVPrOeF/fU2q3AgQymJlAv8o3kYM9mHoPuxUbL8QdmrjRjm
	mIG9gQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h514cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:00:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2d2dd52eso1793031cf.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342821; x=1783947621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=;
        b=LYiy+r78zB9upFYZy2gR8Pizcf1i2xZuURCL6lWRX8OAcw0QK5f2gZ6FruMTXpjTaO
         qgiVsf777KrS/mJ2z7CRvFeChC+sKuobAIDyHZtJVg03dSlTEZsoHBLC9muFjTjZM7yw
         2rBkdeUFbGB8qRCKYvDf05kKImA/Aci4MfluO2azjB99hHIcg3zSZnRsSCEQJbYtxQdm
         S46P+mJYKzhK9O7OvHlKrwIrbbBFquHFZJxSZKM3Be5LIGL1vCk+tai14NkEWONU0tWy
         rVsVjyu+EayxPaA6VDeadBWOiklhCBb7+2gRz+lenh0/hI8DsAmhDERNVFnmVl0tfCU2
         vTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342821; x=1783947621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=;
        b=Nq0CVoRNGRvh+2BAQXTjuGSRKX9GTmQ9Y6BwRt8o775lGzw2Ev+xXjKSNiBqmyCUjW
         AXEb5tW27LPLnNZ+KXt9TIm98bRrnDN52TznC+zv49uBgt+kSmAO9k5PlJM3JWZsYprV
         TcvtgoAJpN35daRTvlflrQUznBjUbDWVcFbqHiwFPvLQdECOP1BhJ3/pn8MGiv3UQVGd
         +C71wLsM9C0HIjstGGP+u7JQcQbTcmHY0XN/1yhNpGNRCtJujj3Vht1CmaF07CtrvA5e
         K5G+ZpG6POJiRLNB3uTYBobgaH0m1Boc88GVnRjJNwWst7W/ZsfFaCEH7NRnj5Xm/71k
         ndUw==
X-Forwarded-Encrypted: i=1; AHgh+RoROvRrjFm5bpK93CFF7p1dhs6qViU4pmXjjcL4CQZhcqw8KbF13IYnZd8OoPOqLgQwYnIgRL00cFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBvuD7Bs6SnMRNfdPvzMb3RypGFEKPW1tVKuH84TvD4TdNVWJZ
	O/hGvDEARVWI8FkeRYIbjGkJdsGPxTMPd25zdN4OWnIS11md/XiAiSMArOYb0DeHRiNFhnRANRt
	37E2Ccxu0OwISmEq7Ai0YikWm29wgjiIElfKpGT7kFJYCTN8PHw+//q+KW6ce1UFiVmwjS5Q=
X-Gm-Gg: AfdE7clfqAB2ma5ghLj3rQHtGtgmCSHYTPuBabFzlm9rTOXbOqGEf9qduS9BKR4imc1
	d8eeWRp9y3NYFPysF55FR9Evaambuqy3pP+X+qER1MrBcdbEXIjXSDDMuYdulEhXm7Btc4nwObq
	hU7WpXPA/tI4AAEUEGsOe52j3+prISoxXAmgiFBaBVrXLma18vfTS/nkKUgVScO66AWCBm7T98+
	O2FJ0F+IOPm9rcOM8O7Emsq3bgk8wZDjm3s1gvlJZOgZ15VsKJfsbP+I52uQRqJLNBz98n+94WD
	9EyoP/hskfAOzdPpImwgvIc+bG3rslzpWZPRUiuOWh3VmuaB00IlSRDg6gC5r0zgnsabOeyZg/t
	2Ju9QoZ0B2KjHYf1lhWKoKEKjKTvtAFBnTHM=
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr90901301cf.5.1783342820353;
        Mon, 06 Jul 2026 06:00:20 -0700 (PDT)
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr90900371cf.5.1783342819707;
        Mon, 06 Jul 2026 06:00:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091785sm772908166b.16.2026.07.06.06.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:00:18 -0700 (PDT)
Message-ID: <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4LKDOJJGGMHFk0Ytb4CYkMLETQ4qQL8D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX/05r6d1vheW5
 EMkJV6sXtFQxsbx8bpcwjosJms0gKvI/5XXNebIeTLtmn+WRg77BAhop6iZxIjKN4hOWLsYLIZO
 /ZCYdQ9/jyOAxh42XU8XG2YlwgKr+7I=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4ba6e5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3UrmxHwGBoanhqk-odsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX0EDha0Hz8b9L
 l8GYmS0/GF7bu5HphZ+OT5y7dq3ADvNiXAxODJ/AX7DAwI/UPt4BH6HpBgGOyOLSeD/ougXW/V+
 DTT+GfLQHsmqefb4AoGHnrl3omJ4DSpWP0oURkoyH5Ctjz6XtRsUT38p54kMPQCZuDsmuXzuuQ9
 iZMc2y5b+WqIGyUoAqSXp+wpGzohQB9EKdx8QYco6YjUxlSE908Y0x3iiB75QN/ftrUJs/lK3pc
 FofPGWWlfkH3MFz0PdW2KhfI3Q7SidF1xNxtplbqhWcRqGm1sQv8hLZdRBtunM7GANd5rfWKBOt
 daD280rX/dXI493XCNJaOuEboSH3LzUArgne1wf3pEy14xNASbPJ0PSOqOWdF66HFFnCJbXMDvw
 JqSPCRGwinr9Wvd9Mw9veJejYMSrIWrEgvO/bBYcWC+rEs3ZW4wPtf030Qt55ooRNpA+ZfPfXKG
 NUWsfyYwasQF4BeyWoQ==
X-Proofpoint-ORIG-GUID: 4LKDOJJGGMHFk0Ytb4CYkMLETQ4qQL8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060132

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Add support for Display clock controller and GPU clock controller nodes
> on Qualcomm Shikra SoCs.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
> +			reg = <0x0 0x05f00000 0x0 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&sleep_clk>;
> +			clock-names = "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "gcc_disp_gpll0_clk_src",
> +				      "gcc_disp_gpll0_div_clk_src",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_byteclk",
> +				      "dsi1_phy_pll_out_dsiclk",

FYI neither Shikra nor Agatti has a functional DSI1_PHY, so
unless you're worried about some incorrect bootloader version
toggling them and want Linux to clean them up, adding them is
no less than unnecessary

Konrad
