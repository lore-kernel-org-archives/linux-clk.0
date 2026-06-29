Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D06367B98
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731472; cv=none; b=nmkWZNLntISLqTTepmVUAX3Eb9B4kgJSr7t2tTYOsYfB+ntL1NaOE4N4z/DyVfTljumOTS2XjbYf1Gzz6s9S8q06h5fmGHswkMSs1mnR58hotaJIMqAmmc/5wcGG3W9WbaDB1CM2ZHp7rsn9DA6of0QZ0+dpyrpU+r4j7XaRUZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731472; c=relaxed/simple;
	bh=6VI1cOI4DIVFsX2jNSg2ArLpeV8w/QTRo+eIPG6eK40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpmJWER9H++rhMIoHAKnWe81q259/XlldRb+VVLlPJzA/sNCMo+VToPcwe5OjMo45lvCZmgQgnoywx1/y3iQ2g9H4q8aYGLE/RrBoQTQO0PozpWtbZ6zPxO8UZRhsyatSpHB2AVkL7WmNjmpzm95QjGmSL0e5TJiqbJ2yf8vJYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSuOCJ+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/FU0TRv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSuOCJ+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/FU0TRv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASr7P2601130
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 11:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=; b=HSuOCJ+zxyreW0Hk
	IyDtB9ytcO3gjFdlN1o5A9tsQZ00nr5VO/Zl0oxoWn6IHiwtq2vXO3rDTYhCri5A
	qm0S/QSFeST0yw289rrveeZhA3CRBNVd/nmJphq8qeaZ8JxE/5QcI/3qJpTunv3f
	5KDnrEt1AlmiHWTtZzxkviB9bWjsSKcaBfrLMllOvSKV2DjxNL6y7WXIian91fZE
	CTSUoBcK6u7JhftAS1BqldyeBeUfruSPMfZfQ04ZrAsT6BpbDDIqwm1bOyeGq4hd
	Cu0ILbeffTMdQ7L7CK1x31iVhYuXXXqMOCkPFTCey7mvxkRm1E4YrJkjTMLazMs6
	KeeZcA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8gjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 11:11:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c82843005eso30103585ad.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782731469; x=1783336269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=;
        b=P/FU0TRvmrNd7f6WKU5sOzzBIc1JrV7vN04OTDt0IZICm3+mn/VWO0F4wHyEUYgyFW
         tS5p9lVjm38ydIqLadD9DvhcZUoCFWF1gYHz5yU57U+X+62agv2WaPaIwjL0UNm5CU8g
         btb3O4ym+4IjkP2veb4FKuGLgYm8sGRL++jAumQlnhSl2iZFTxL6msFYRP/PBs9dh6lr
         wK6IZj7DRb6mD8ER3y1UH6GJ8obFJqOStlwCr9MzTn6BpaeVBFmkOf2JzVdQtvm/bEoB
         TSGk8H0s8CQGUDxV5+Yndxwv1L/yyww5StBlvqMtuBzeqH0rhXszAJenzUbkfDcqJm8R
         9tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731469; x=1783336269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=;
        b=o6LElkLqfZNbjq1C/VE4XSRc8XLzOwDdc9sdofydc5o7ae1OjLdAmk2/fm9tvpE7nE
         zdbXKfb6jtGmVl7e4p7YvYrvdADmKeB1CTnrXuqCRxfeYMJu/+cuZF0fAdWYIHwTPyVe
         W1qryaseBckPqV6C1AgpJxdffjJmfCX/B8qFrLagnmo6xosw5lEdmLPmmekni/MrZVHX
         P6Dwa3suu/xEors3yfgmaK1oj4gD7/rgaNF6t1OKGa84BjBCz3PqVYf01lu41UOSO28N
         iSJeyzRRC6jYRrTmekZQDlpMAw72iXxdzNDVRirJHCzHfyKk5WW+w+fyao+MNIp46WJt
         ARmA==
X-Forwarded-Encrypted: i=1; AHgh+Rqf3wusfJzDyAFsE/G6TVMuF7p+UDYF9OuCSNwaXaPgEgEa+VXBsdiur7LHHdE+jCdsTvBf0dLE4EM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1dw/QKEiMgUnoBY0rvvqkX/w+//AZVwIgLH95YA4l6oBXfZS
	ReZpkOcWA/m/pTf8/XNlIG6pyiuZdfvR/6S/lBowcy3wKXF6rt/faXU5TO/HWpJu4+wkvjM8E8W
	CzS/3n2qtSiKVO7EnDv331mPvR6KPH2kw0uE9ZAXTrXBXDS+0BC6yCbL35utO/FU=
X-Gm-Gg: AfdE7ck3USapdaU5AgI7muTrXv+yfXJiOtmRyhHBl2yrD/oNwZS16ktoVNXdODH1HBa
	hKk0cNo8rhMWWTeEhbsx/Sl46rtXnPyOI5iHX29HFeN+FuQfhvUut7xMlbKVpF4+2382GDly9Za
	ynNygnH7146HubTjNl5oI9QguQFoopggaQEDv26kyGXLstdCJljhDY5wHx5FX+W1oddNyWqCcaw
	xhamaLHbn6unDG/JEwNQ5rBSSAsnR8EnArMoz5rQo0ZhLFb7uI6FqRFPhGl7rkIHcn8Ys7UmJlF
	kY0mK8xvYmCb1fiOz1LyMjquCBeg9/bkfzh15tePk8IEnfxx67cOCc97FGYWH7RkLg/1wSkMWzS
	wkE4q6gyhWKzXR5nq243qwENPEDzFDFaHftuM9w==
X-Received: by 2002:a17:902:db04:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2c9c46b131emr62759045ad.34.1782731469371;
        Mon, 29 Jun 2026 04:11:09 -0700 (PDT)
X-Received: by 2002:a17:902:db04:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2c9c46b131emr62758755ad.34.1782731468960;
        Mon, 29 Jun 2026 04:11:08 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9f452ccfasm22477525ad.17.2026.06.29.04.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:11:08 -0700 (PDT)
Message-ID: <11514281-234b-470b-860f-e7c620ca28ec@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:41:02 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX4yScrEzTOxY3
 HB/BtILTlumIQoOaHtHb+lkahs4i2VzdA3rCInRpVueVWf5V44xDKVgw0F4QTuFKKC3h3ccfklK
 pYx6231db9rtntSQqUIipPUH3pe/m9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX3oJpNPd8Y1MO
 muocS2yjv7Xdj97wEU2bgJPsfEx7IEkHq/7GixSja3x5ZQMU4FfGDJx05Z2New/0MjGwFLLtK2/
 Wm1Xp21usfrHOiy2JHq/5vFr73G0Lv+AFUYPrWs+HbH31uAsYYN+KeaaIUggDviNTHtUkjwppXW
 wv5jpn7pfxi/olPStJ/OFYGRuIlsoDZnPrn9qoUgY9Ky4wOphCMM4IPdzP9cl5JkXfsZo76oeDQ
 X+fwp7GaZr9x7hyScZm3wm71lGIKwdPr6bsZY2IIX1VJv4AIJUt/zf7lgsUFuJNtvf//EDPgm2d
 SWxrvn4JD04C3Q6CI2KKVG1nSswiaRCQcf5FdfUnPWstghAAa609sNcy3Ca+fc0NKlFjENlWXIC
 foJIJ3MWTHOtTx0kKWomgmr7IMSch0FDBiHI1rhc60PkRu135/6szL7jNzXN/WKJBS6AAyUMiIM
 f9XwSXFQ3v3Wz3IheOw==
X-Proofpoint-GUID: gG3LHchdqYdi41esHZ4JXcVO2leZNBab
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a4252cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DhQjvcdHTzzIjdopfFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gG3LHchdqYdi41esHZ4JXcVO2leZNBab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290091



On 29-06-2026 03:21 pm, Konrad Dybcio wrote:
> On 6/29/26 8:43 AM, Imran Shaik wrote:
>>
>>
>> On 25-06-2026 02:14 pm, Konrad Dybcio wrote:
>>> On 6/4/26 7:26 AM, Imran Shaik wrote:
>>>> Add support for Display clock controller and GPU clock controller nodes
>>>> on Qualcomm Shikra SoCs.
>>>>
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +                      "gcc_disp_gpll0_clk_src",
>>>> +                      "gcc_disp_gpll0_div_clk_src",
>>>> +                      "dsi0_phy_pll_out_byteclk",
>>>> +                      "dsi0_phy_pll_out_dsiclk",
>>>> +                      "dsi1_phy_pll_out_byteclk",
>>>> +                      "dsi1_phy_pll_out_dsiclk",
>>>> +                      "sleep_clk";
>>>> +            #clock-cells = <1>;
>>>> +            #reset-cells = <1>;
>>>> +            #power-domain-cells = <1>;
>>>
>>> DISP_CC also needs to source power from somewhere!
>>>
>>
>> The Shikra bindings aligns with the existing Agatti bindings, as it is a re-use. And the Shikra/Agatti DISPCC is on CX rail, and it will be always ON when APPS is active.
> 
> Yes, it will be on, but currently the genpd performance state requests
> (i.e. RPMH states) go to /dev/null because DISP_CC is an orphan
> 

Sure, will check and add the power-domains support as well in the
bindings and update the DT accordingly for Shikra and Agatti both.

Thanks,
Imran
