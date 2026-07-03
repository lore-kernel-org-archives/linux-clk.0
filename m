Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436AA377ED7
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062788; cv=none; b=V3ScE0xLvu7nhr68lvFrVlebINQ1ZatIy/9JfMXcomH4wAdrVHn711o76bkVl//ueXfW2psLVYQDLCiqJbybAT99cwKraVX4sMN7yekyeKB8XrfVJMcsLVMY0FA8IVAXBTaPTTt1brYnMa/KSCogXz1TRln+xA3HuyxeVSqyS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062788; c=relaxed/simple;
	bh=YdVOiZD4Racla05BzVUSupDKdhPkOP8ZTmqWEqlqujU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cv63WcIz/j2qj36/F2QmfrWU0d7GNSoyv3SQooo18/v92nNdetjPXgd8C8A2q3uvQOAfZhvRJNZjbumFe4HMg74sHvS9vssR0AeoMzMC3M3gKmSPFAATCmy8mrB9zNuGHCLESYdZXstKWVgjPKJtBmxIdrNEqF18hv4Yil2d57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifWtgt6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3IYKGxD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifWtgt6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3IYKGxD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rbiH3136127
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=; b=ifWtgt6r6NV2Ftli
	LFbEJnMqHQTSysZ2+wBgd/ecJ6t52JmAAC8o3gJKYsPrWl7bkSLu/MjxlD4KIdQe
	+vadlaDIazm+x8mYdb/PdanSdT0Sc3AiFuPTV7cCFel6qbzY12U7aeQt59ZfwKDm
	IB1AL769zKJdvkvlnpXKBbcSaYZDAPbTj/dYj7jTtocIkbc4a+u5IdcPhOQWdHMK
	vEYJ72oB6/KPUKeJa17/ntTNoDdCZ0nLRV03G6SJa0BKxVqIo3pvcSgcrBoQv+kX
	SenxrQvA+FWpNsnqhAFEusx2YSY+LeEZV7LJpIEXMGpzRdtvmZEcBaCtZRE0Vb7Q
	R6kw5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b594fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:13:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1fc94a11so978481cf.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062785; x=1783667585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=;
        b=N3IYKGxDFWSjw4ka8+wdiXcYXidjJpfF9uNyoUiBRmeu1KVbe75tCS2xjzXjHX2YgA
         H+eIrSw/7b8lkZuk1ywU0L3YccUU3ZlySWBX+rnJHCkMljOmfZ0tZo6e1SJZzfpHwaRx
         lX6/lyXUYD/WvnpRQ2gnLZzLYA71B+z5uq1B44n8KsToggLUwbtdwaSdpp5q5dgJAhCH
         Fjb/BUVLH9pCd3GQRMG3sD5m5EMHIhr0aisWuPnOLZp0cQkJUS2dfT2u+9JE9wp0RHuS
         shjww2dMXDfXxnYYjb7rEYcunWhUK5KZnrA89Qn2DZGmwGDmJP7eOfowjqVne09cUgOY
         Sdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062785; x=1783667585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=;
        b=CzFNyJhd3hmyzemT6i4/Io7p+es3x82WRRryAZJeWn63nBYI0xxuxwqtjI3nBXaE/O
         5lRW2k5or//FpGbfp6Gdlz5For6qlTz4a6avBED3m9kRIcmQiw4KZdLxlhEV3sMOkR2B
         MgDvNFKk8r6oOll1b7JZijbrdIv0TNhlQ0iaF19ajdiQLoyOmZ+idaBWdoG5SeFWhSrM
         s0rDzoGci7zeZ872xolbnGFDIfxFJOFLJvGeB1qngN9GauZkpqe3xSSsU1XC2GtXhqcw
         d2vuce9/5xaBs9o+Op2wU4Myrxke1kBos3+UyjuS4Qygu4n48apkXHwFiGqRWNWBVoSJ
         Oazg==
X-Forwarded-Encrypted: i=1; AFNElJ+ohY4GpwEFbUPFoep4XNNOhexSOguU9732awP/Xs/PI1Sc1+7EtBnlpzkWkd7po7PO5VpMaDFzXEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsrJWGCnbaSeb8SgLZ9Fm9tUhYZKizdCRbDdCvg6d8fYbQCSOi
	Kk7Mb7PbUMgRC1N08OOOOwybvfeObcat0aV+RAK9olaG9pHAopQiSNB4dhpxh28H363uAKNb9Oc
	eaVUh3cHVUKY9pM6tuPEduso80N8uWRjTk5w6qw8j9rzTgpdNGUKVyFf22z1LCdA=
X-Gm-Gg: AfdE7cnp4bl5wppsyVq1WY18GrTZpfS/caZqsDomW7mctxnCpFCT/7RjlwkthYQpJsp
	x1ju1/2wnFZPOtQMeT2ABnX7vSIIEqQZBv3ylEVOznTVQs1MzKJG5T2eNIcs3q/s3J6yBewmWWi
	h4XMG1IlaGrZzRxKM6Ofpa4KN2flbyQAYABWRXxmVNLiRGO0FOL13kJ96o7OpvjedkE8xnrJUDC
	W8g/sgu+3ijlAsB8tFDHUPVrQlUBAOqGPxKnee0vpWffTfjiCdFIdO/ZtpDZq5tGYEwSB0b5W5s
	1YJO8KJe7sfV91f5AcbWToNnV3xdIr1eLbXFgdChLlR1k6+w3vS45ZYJQide3P0VJh4hIj2CC6A
	pd1yN9P3IxFG9bNzdq+l9DQFUhCL0dy32GgQ=
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76116791cf.8.1783062785540;
        Fri, 03 Jul 2026 00:13:05 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76116391cf.8.1783062785065;
        Fri, 03 Jul 2026 00:13:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6099911sm233424366b.24.2026.07.03.00.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:13:04 -0700 (PDT)
Message-ID: <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:13:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
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
 <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX/ygTomYjB0jY
 InL9cW4SfLIwAhExDsTAm74STtjRbEY9thrKEyyAC4YYufUNJGdp9ZLKxUbpBUElxwyQWc6CzMi
 kkdWPYJ28XGhXLF1g9dxfU3WGu2uXmQ=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a476102 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=McZegf4IZkULrlfIFoMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: n9SYDxqt5sflc3TFJ6Dj6IV2RRFwM51G
X-Proofpoint-GUID: n9SYDxqt5sflc3TFJ6Dj6IV2RRFwM51G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX2FJ2noCWlvXH
 QZNWl4uTrckZC55xmcukFhVxw4iswHYfO1yDR8p/eGuwxTGlDkq1Q9y+zAYP0n5XLWcErs1h+3B
 fsOtSIv8MZLVG53zpjwJaLye5nprsbIbkFdv5g+evny3lmh9jjuE3cobIxOM7KmltAFl62J2Q8G
 VOuudk50St2JWo+CE3FnEYxe7NPzMEd+XyptK5Qnuyn8no/C8xWMLeqfxnVBH/bnrpcYkcMIp5R
 RR81vhtFBkVfLoLJ+8XR8kLADjucmqPzImQSuGPscye2A0q044bRWoe/NLPo+WuDpCKRJ2fJNQZ
 RilpsnFuxSZNW43S93MZgQ9KoJn7YqbUftakgAXD7dtQwnmQJecl7gyKj3gCeA4DVTq+dW7Mi6A
 rv2ewh8+g5rdRlcs0MLgY5kfpyZ2S1S13ikjufhy7Afc1qK7QmOAPtwBtAyeLaK9TEX/rDHwpOS
 dGvyE6ZZN9r61euQojQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030067

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

>  static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>  	.config = &disp_cc_qcm2290_regmap_config,
>  	.clks = disp_cc_qcm2290_clocks,
> @@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>  	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
>  	.resets = disp_cc_qcm2290_resets,
>  	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
> +	.driver_data = &disp_cc_qcm2290_driver_data,
>  };

Now that this clock controller takes a power domain, this needs use_rpm
= true, or there will be a permanent 'enable' vote

Konrad
