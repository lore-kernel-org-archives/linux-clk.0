Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E6029DB9A
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011480; cv=none; b=qfzocFvFb4ckFEapj+8WPPrVdov78XGTFEhg4FWe7HeyYLoIcyR81qsF/J8gmMZfpHGJoxu1jm/r86n5a4DsMHuPgK+augJMzppZUzr5hYTpEHQXKdzanLc86ViGce4lcr8UbF0YPBOTIXNMjvWQxdXhade+YtaU5i+66KyUjxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011480; c=relaxed/simple;
	bh=mNrOaTE0g5btHJAkH9znuBBNh9gkw5ZF+RBUq3Ym20Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8+wf3BHwwJrVnUvAhMG7hEy0hiFkl32Xq5d0xUoV1h4V9GDpjAMrGNm+MnM2CyUkvFJYC8avmlyuFmzRoyPCAbyvNtU+5eKjWjjskhRqxgWx//h4acHMZmSCOMePrzqVIkk2/70OxqPSxOzk6pBBWcWQ2TObunIb4jTrc1/NTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eropqvh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx3FdBXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eropqvh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx3FdBXC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Clao82706270
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 13:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSi6mbjLTt4yXQTEdhbGqtJWyZrXV7sPpk0t12kGMmY=; b=Eropqvh7d91kVX8i
	H0Xwow4ZDFnMtPc3V3ihNpeHvOTesHZ+yW/+cJ1gPNWYKixiwzPisOoS0dnhwuB8
	r5mtOPv8wMLEUraieQL5tRe/wqoXsNwxTnCAh3NhzVhFnmGQ5izKn/nKMb8v+md2
	l7/VszIr+EPdQ0abkVocbHpe1rFYTccIcZj8ZQq5mRtMaq+zq8ZkvVbFazcWlf/5
	+qR+PwzcaYG4KX1Pj2nB4k14uRlIJAVOTtyK7CEE7vXWvKynIoIrXm2FvMF7p+p1
	RaLBFYUcpEyumgTCmjSaLC+G8QKZm19o/DI2JQGZf03u706NdaJSm+p8t223ya5Y
	/7ppAA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt18n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 13:24:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cf9fa331ddso299749137.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011474; x=1781616274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSi6mbjLTt4yXQTEdhbGqtJWyZrXV7sPpk0t12kGMmY=;
        b=Gx3FdBXCTATAmlT05J7jBW41FEVXYrNarBrZ7nJTeH1MJynaOOmfodzv5s8LYTWNZc
         ZW58rgueltcGPvSvcvv5ZrY/N4feDZTk20LAIbZ+3HKpYR0irn9ccDGNYVj8BgdNMzlQ
         LrJ9MbsFgYliXVWNrHIGXh//hTm8m1qBkYwGBRVgQLR3sTScXth1hQLFRBO6SUvDlsjI
         6fwehMmPZYdiS6rNjblO2BhGvuF4LozAxYAR3fYfP1ymfCEZ7f41Zd+7o2pDFKuErsGk
         vtrAcUMR3q3sXxcwbVKn8aO4hyc26lMO0XQ/hxE0gdxeqCEaMjSMt0OjeEs08lPESwVl
         kODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011474; x=1781616274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSi6mbjLTt4yXQTEdhbGqtJWyZrXV7sPpk0t12kGMmY=;
        b=o6Ctz41g0nI/W/cyP/jsKQfRP5EN3z+v3ptkjCfKkr21PL4Z9+CI4BFwuw3rI7Ge9P
         mdARQldCwj++HiGJ3WqaJQLgGX/VMZDPT1Hx/VhNZhPgQeqUip/E62nBjShoatmx5Fbo
         O5ipKMkuBJIrY39M0TqEcC7PiWF2Rqk1q7P0uT77I/X5Uwvf04JLOgv7jpTq0HXtX+x5
         gzSqci1AT9Gv16LqMKinigcuLFRQ7vWgaPUg92jhj2oDTwvjTd1ubFrtBbMKNNl12X3q
         Pc3/EgdUTZiYI279WBBrhRJFur6bd9gWW+Vw4iqtpvZwZADLJpVgPMoFnWonJO5a6CNk
         2kpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Qn5KfAeOVNXqilgP5o4YY85eEplNdwm3amelWjZ+twd93WrJLkQdMOBMSCFxfhqpkGTQGlQV74Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEbFTznH6Fxn0DbtcxMEU9dOTFGSj2gtHvkGqRy5akNPDsU1Fq
	WClD2ng9/tNY+1rKYyApMh5goJWFMdnIDwD6EkMpxTn5XtNkmfniaIDqhNol88YWNLxFL2voLju
	IXcVBpkS3ZV/XGONg2XW+x9KHV1tcyC2XWlnXI/Fee5wVder7qHPEzq+0yIFl7Yo=
X-Gm-Gg: Acq92OGQ0rXQGaLDMAkyrFZUKPqWb1fpIqzO3fA2sAYHeKvRQvpBLywmxHMKMboxAYQ
	eaMQlJfYupBrXa6XJn4Q5wwtTF+/9QcR8drgd8I0zdBus7zxiPNolkhdWBsuQH0orentKSFxu8U
	GGlDU0cBfi0AZRdoWlmem2+QA5XdDTOyGyNobSZ38KYkazGhT2hc7QE1Ti5qaw1ztvi4WSVDoAI
	vlEUkXq/hefanwzkj447oYC8rl1A8SVsLfKNiGWk/FSOLpbE1gbTFNn3DAsFF4y472sGnt5JEky
	lABTONgpBRb5zjZJh+k9et7TkUwL540wwP17+xxQlVT94pi+8duddSKKqb8T0u89RAth29gw77V
	s0CUBUxOOrQ8jPO2fmDCT6385iOA1/SYl9isHzolsF8VG1t/WF1TAqK/y
X-Received: by 2002:a05:6102:1487:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-6fef3c04af3mr3212908137.1.1781011474299;
        Tue, 09 Jun 2026 06:24:34 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-6fef3c04af3mr3212894137.1.1781011473857;
        Tue, 09 Jun 2026 06:24:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912faea64dsm4883372a12.19.2026.06.09.06.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:24:33 -0700 (PDT)
Message-ID: <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:24:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LbV0dD7vlju5miN4qan8ytEJFmAov6bQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX34fewLtYWoxj
 lyyL5VtQZzZ4K3SIV1qdXUjKhfQbffGY9ZPdxQACNgvCRXmEw581B5lQ2oOrtOi/RfkmLfJd/d4
 EIOCcBrGC3Za0xiOwSE/xM4XRocaghqY6thTJ6egt0Ypt5Qri2KrjpfnWfuf6vcnDEg+rs6mlXy
 MaKTmlU05e4YiCwVmYeroSlt3FcM/kTXiJ2PQZFPl1XO2VBWxM4sF019cccn6lZaw2R8QzC5A7a
 EQPK1+yxXXQ08eVdnuJWj/eRKs9/LHn5MpWPF3T0DecUjh0Iie2LurMMWMwJFY/AJQ4IXiGq09L
 MwNgkMaKVjvQA0m6puuAMwUn65BMadIvybW+/7/r/DH9TxpXzQDY8sKQxCfJx+zM9SIO1YVtBIq
 UK3XepqpzwP40Lpf3Nm2jRjp0Lqse6VToIGaKhLUi2lEd3r0V9PmqfujM7Iwh+g8mp+2ZxC1wsi
 KPD8+xshIDNjjW91gag==
X-Proofpoint-GUID: LbV0dD7vlju5miN4qan8ytEJFmAov6bQ
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a281412 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IMCAxTU7yX7nb3N5cp0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
> clock divider. The hardware generates a fractional output frequency
> from a fixed input clock (typically TCXO4) using the relation
> Fout = Fin * (M / N), with duty cycle controlled by a separate D
> register. The clock output is routed over a gpio controlled pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    gp_mn: clock-controller@88d3000 {
> +        compatible = "qcom,clk-gp-mnd";

The compatible must be SoC-specific, looking at the table, we could
use these example socs for the versions of this block:

8960 (v1.0.0)
8974 (v1.1.1)
8994 (v2.1.0)
8996 (v2.2.0)

> +        reg = <0x88d3000 0xc>;

Let's map the entire 0x4000 that this block spans

Konrad
