Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021FC3F9263
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726673; cv=none; b=H73py3SudTbmhzd+SWekbW4SYATiliNazo1XJbprNbAqRj8QGRQeNVTv7W9bXWO01zNla5a4dN4fF386ffdXvRZO/5YXFDzardagOgcq4iqa2a/VcEeiSromoGGgAv3UgwYgeCToPEZrZnOhLHwL8eW2H2PafJ1BuXfMWG+Thck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726673; c=relaxed/simple;
	bh=clg0AzGHYAP/V3MGodBAGw/7RE1WclMLvIgKBJ9RdiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pi1QqVpTENQcV5vNcNRIXR7Oiih63w4ZAR4qLSOWU/TeRurRPiyVjtsBmSSnjklGgor7Se6kJWAOdIPoZg9aWPyAypw29nJLD58mFcrSBgmJnz0xrYknsuj3c8Zu95W555+UMFAeAQYf+hI0g7CMyx/A4I49QO72wC+y1Oc7aWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4F7cJSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/beJeHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4F7cJSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/beJeHD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xDVS2447414
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=; b=m4F7cJSsDLVJ8KQR
	xRAK8vfkJtOncPfJ4Of0R2q3n5FwWBzepSVlDxzpMsIADkshZgCj/oeIzaoZviL4
	EwJYZESsriOFsRzC1Lvc6ViLV51T+3U5XK8d4UZXPusEKbgTzAwjFNTL9HH6KWqF
	9CMtL7byypShWGHjRDEtc6EbagtgvlDsr1WRXp13wvizwHAI++aBrGqkomlc0QZH
	nPbxi9zp7wF2+dtDkPXxFq1mgAiTPH/TYmAzKukwgrqbjHiD0jD1PkJYFfNJAmCf
	nFIWDa2Dz9PU6kYAOJjWmleIBu6eBJH/ewzSf+rfAuNy51L7p/302uQpUABPix1l
	y4M4Uw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7g71h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:51:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b110673a6so58098985a.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726670; x=1783331470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=;
        b=I/beJeHDpjYCrgx2O92qmp1XXZHX8gJJtbuhX6ZIQ8fOGWRxjyxcJzAMsyMFMojVJN
         RvCtH265BIvn3bdFjACupFm0ZfQnGx2VLdNwvcxDz/mzs1MCvpGMsLsT1RSYqy+9TuSO
         9Q/z+D2n2iw1ZwHANQ8S4S0WA4B0KOPT+A4CfFA6LstTUyY3DTf9W+fjMmFnIcOQciAN
         mFku4qkzIjxdLY+CLLbHqsOptlZMtMskm8irnfKIMZO1m4ZFn7+EsHq+Ii2jtbqzDXUI
         UMlcFYBEd3DZu3WnDq3yAwUyWtMcZa4SSfV1opLgqX1JR2M133DxZkzmavvHgLbjm08G
         yABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726670; x=1783331470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=;
        b=Ti7UfsK/YGF21ruz0Ps7r2twVGP7Km1hIojXFejrzpd1p4cOIYOn34R7Yjpng9dDIn
         FuoTtrL6nvVUHhn++cxNAyvW2nN6D7+YheDpDKKjEByGnHhshN8aYy9rNCT0pe1TBIVa
         FtIU2XtDaDfc00IaSOLUlv22e693XsyKoIWUkh9mDlfOHJjytUoq5hg/QZGLnYE/2KJs
         EbOpB6qEpHPjFTCVPdYbEqoKnUVUN54emyfD1VVgfxw7Ug/X50nduH4aJ0Sd2GgmNXrK
         JHrK4Q9LxSuOYKxsKdgDUaxC4Zf6euMXRwpgwqMt8Av3vQuiUHQIMdax18oyzHnOFgxU
         aSIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GhnYLZdebEIy6yPvso57ZGRJsha2+hCUV4GP0ZG5Cbo/1Wuo+4FX6zJOl1G4d7gXE074JyG+bfUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLezc0jW5jfeByEAm+0mXxDZ9DehgBmhLgFCpbzItGi5qNDFu0
	5ytVezsrjnwEfTrlJmfLyTAUQuv7rVanMbbBGC1Kn0JhBJSfUm/9K+OrilfRbsfhJnFOH+Q+UAo
	0jP9s803RFk9OYzN88DoGGh+4aMauev+D/4GWIcfvlGFjpFKLqrZqSVmAqRLasVQ=
X-Gm-Gg: AfdE7cmLs+13ftMtAHsnWaWn/T/bWKGAEIHDdLENnANZVA4IJo5M6fthUILCOItXVaC
	rjjzaw4eJNRVDnEuAh6RUJ8upywc8gZOoxmC7xdzY/ZeWPlQ6gWDv9+lOuqDhtrOplB4fVx5CLA
	x1g5gdRMkYNI9rTV5WKIbThuoGInsPn/qYjALx9vrwT/CuNEHkEtkiJwSyZBHIIRVIPQgBaeqWM
	0Ft4BPjDbUFg4/xdA+28SqvGlbqoZneYJbXfHQG7E4v58jk/jfLTXGaseozJz16OQRkPUwscilY
	jesjn0f/pi6nGRILG5z3P4HYaLhjmO3dqt15GUuA38z+yO/toJ2MFj075oNKw2d33RGmt5tJNPu
	WibK32+Rfh+HEvWjxqHW/rLMRvZLlekvBexg=
X-Received: by 2002:a05:620a:2b46:b0:915:7c1a:1388 with SMTP id af79cd13be357-9293d8a98edmr1528683085a.5.1782726670230;
        Mon, 29 Jun 2026 02:51:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:915:7c1a:1388 with SMTP id af79cd13be357-9293d8a98edmr1528679585a.5.1782726669775;
        Mon, 29 Jun 2026 02:51:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba677csm744546666b.11.2026.06.29.02.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:51:08 -0700 (PDT)
Message-ID: <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:51:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
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
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
 <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
 <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX188bS0dllPco
 ZcvHDA+rQzG9pflPefCUoTrmIStG98WLJBj24jBxTztdoVKpIwgDH85mxD+KtPMOliZDR0kvqFM
 GJGBhy/526F1hrylJjY+OIEA8EHHS9B8tnVLzuoJcg1rsZZXtxjCgWMHEKipYYMESMPYEE8/h+1
 O60s9tQ55IVwgspxLnjG1m4VvBhazEmpFqLTDt9FZ+GBpdCG2UjJCgwX3x9efX6jT+NNeFcar2j
 p8uE7nB5eQBaZ7LIOp7cIxt58cG2BDexrzM54mpevOQ2JdTu6uvmH9R+ud+zrXpTwxBB+U2MKma
 bURHg9QIIrbWCW3i1ZIfNoE+BpTON5AkZo35FfS+WaVmhRa/1GILIY/PCRln3vc881wgmDHI2IH
 5RfSzoLAwFiQ9ZHvEuaBQYlG6Xp+/FcTAo+iCBldKZfQJgaF2JTamXaVTkjGLhcPDbCkS8DBrkn
 UBVAi6A3qLLDPkW2v0g==
X-Proofpoint-GUID: 0pFHjEhkAk9RQPogVNgrp7LDF1_Q1CBx
X-Proofpoint-ORIG-GUID: 0pFHjEhkAk9RQPogVNgrp7LDF1_Q1CBx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX2MrbsWMkOQFs
 uVbA4/gNdArhSMV3NZAHPH5j5Orp2+agPTJ2wDyxqbNZUqtYx4QSs/dsoLWVygV6hr2TxseqLU9
 UBEs896E7QYXjbbNH2x5eWauQ4kC8HI=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a42400e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6UAb0L3E1jN75_jUm_YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290079

On 6/29/26 8:43 AM, Imran Shaik wrote:
> 
> 
> On 25-06-2026 02:14 pm, Konrad Dybcio wrote:
>> On 6/4/26 7:26 AM, Imran Shaik wrote:
>>> Add support for Display clock controller and GPU clock controller nodes
>>> on Qualcomm Shikra SoCs.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---

[...]

>>> +                      "gcc_disp_gpll0_clk_src",
>>> +                      "gcc_disp_gpll0_div_clk_src",
>>> +                      "dsi0_phy_pll_out_byteclk",
>>> +                      "dsi0_phy_pll_out_dsiclk",
>>> +                      "dsi1_phy_pll_out_byteclk",
>>> +                      "dsi1_phy_pll_out_dsiclk",
>>> +                      "sleep_clk";
>>> +            #clock-cells = <1>;
>>> +            #reset-cells = <1>;
>>> +            #power-domain-cells = <1>;
>>
>> DISP_CC also needs to source power from somewhere!
>>
> 
> The Shikra bindings aligns with the existing Agatti bindings, as it is a re-use. And the Shikra/Agatti DISPCC is on CX rail, and it will be always ON when APPS is active.

Yes, it will be on, but currently the genpd performance state requests
(i.e. RPMH states) go to /dev/null because DISP_CC is an orphan

Konrad
