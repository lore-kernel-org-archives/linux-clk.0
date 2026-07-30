Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E193B2FD9
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 05:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785389705; cv=none; b=ShgDJkWXlfS2k90kZ1FcjuURPiBvcxI9Wp1kSd/3DLCVa6lGltTbXDS3PVA7z5MA4/pLnd7JWZQdJA08GfczDX8pHhQvtnWQmF0228XI1QzPUCETP/Cod9YhALinIJF/RlSzdkxo3cH5FVKSsy1/P/9h0g1GLlPRZqolaIvged8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785389705; c=relaxed/simple;
	bh=Ms4Nfskcnhq/wm03qAo2m5NydjTBb5cn4qE/+3+mS3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTyJkkmBl6VvRD25reDWnkhAK420SKpNDRKyjiy6tryiVQwmu7/Q2Bq1T8cJHmWbQV8+QhM87XKJ9z3glYp+0xmyw/XteqBpWYkvZD9yDDa8jj+lXKrBab5Kt97uSxw3NDf/l/PMYX2K9mWa0M0TdJHOP1qMlFHHaFlVr5yhi3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzizE/rh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkyB35T6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzizE/rh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkyB35T6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U5Bk1r4029223
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 05:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=; b=hzizE/rh/XEp9dlS
	Azy0hiB6Zwl0iRJeAjCz8wPoNhni9YxFyn1n1baTZ9dydxl9easl9g3uEw4asx0/
	nYbG1ryH0NL4egFs64R7Y97IfFs4HkJTJsgAwi0Ol4zZGG8jhvSdIaauRM14ztbR
	knqqmX9I7pjFvZ6LWIl7B4bNzVwDmXXqs2F5Sq4MtV49/oFj5+qmCAr/EoU2jSRU
	WVVozHDopj4fes116hliJIXxsUUtIG43ISqsAq6kTGv7yr2fvOL/Xia0xDxihHYI
	SGBBw7biqX3FU5G6Xu6hx/O5z5PtYiWDjHs18yCoV2TxEAI/lgp/aV0CIY4t/vo/
	N8LdeQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr08jg2vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 05:35:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84859a64079so2655076b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 22:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785389700; x=1785994500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=;
        b=DkyB35T6K70ChGbLkZuI9kLCgnbn8i44VaLhL4lGPvqxaQNTdDow02H5U38PdaaA2+
         zFntSszbEhuTQZ3B8WFIV6ECF1h6UBHEisUxrUUa70Rth5djOKmQ+aKQLWngBCl4WqnC
         74AfptiZZmmK3KKiV7RQHi+obwSAurXqkCFfNtXkePdKKsbHXn2zpdG+NuXuMI1YS1eD
         mjRNh/hgak14poKiID1X3toSNyJAOYXdULZX4TTCNFBujQT4iJsa8H/nL9fo5k1o64PW
         sIMqVRV0TVfhI8pbQq2tX+fGux1RtX6yT95S2v4cAmPyH7BGJwwz8DsOtqsOtq+DW1GG
         neow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785389700; x=1785994500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=;
        b=krjaSVxnVnQdEg3Z/Awivl1baJf8Gjt4zAoycPV3wvMjWGJxD4tj+dLOJnQxZaCXrh
         DmNGbwR3Mz4TsyiKhLfGOf9E3e2diJbq2SQO9Mzr8nzsRksZDD0jK/PjHVwzqxqJXiMM
         TArOo1Jw9KrEazK/imYvke1tGnFeNkMVXPMfjvevaJlzkYYMcN9IzRBbyx6Ry1qRebbC
         Gqap9tsgZ6pIlm8GnNEg44lBxtoGjHeW2BhD7EnvZyazfPogCrPM2AnXMw2hJhCTETKl
         HZ/sGe8kyfowTmXqOLAloE7YjhYrkcanGU25t3cmz2mLqXURd5+ATAheqC6xCTXhq/5t
         kJHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPlzYomHhYGRvZbYMgxhZpahZcNyxM8X0kZDhAr/t807KRaWcQr5wmFG19P7N0o0tBTVS6jbn/PcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6uk01Fa/noETRb+ZLUbr3/FAUAm06vwaXO4Tzrr94AbyXLgb+
	tRynYhbEO6KhYH1Om4+ViPfacZDk5YVRLQ6+BCueX59b6+V7wTpEORdAL4K6NzJ/HN48khDU1aO
	YivDrP6AZpfcAlhMgMdCf3u7pPjarn9iHiHWbqRJOzbWi3HjwDj2Istu6e6++v3k=
X-Gm-Gg: AR+sD12GFXI6aaG4Aw/7+jiUomGiHcqi3CPOKgmhys+xXo2zkYPfYTSuiAKcE/JypiY
	B6CJaoyZxEz5o/AF3ty+IK6KFBrsz7GwbqVjbQZE1XlAEemK4TFTZGrNlRiBy2c9ItH+q8L1AZR
	hoxYLgX6Ixeeoaqx9b5MLdddPORYQnKYVi/vUWOAMiGButwjhkDXruF70Hx9LYLgrX5DMqNzbXh
	hEFvd/G9xChoa5NJfTesbjtwI/XOSumOF6Sr1xi2A0hLehx/BxsHvDaQgj1CNaj0FLnOmO8Pi4X
	+i12P5q/bdpyVsMoP3L8iOUm3r9xBoZ1B/3mozeipT47K8Cfs+lFqTHB6Q3hCVxqpV/fi6u3jEu
	pEa2W8Sxckai3B2dDNSbAJ0yGXyzbgQ==
X-Received: by 2002:a05:6a00:4c84:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84ebc3cf6d6mr1338798b3a.35.1785389699848;
        Wed, 29 Jul 2026 22:34:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c84:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84ebc3cf6d6mr1338773b3a.35.1785389699398;
        Wed, 29 Jul 2026 22:34:59 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm2342241b3a.31.2026.07.29.22.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 22:34:58 -0700 (PDT)
Message-ID: <02b51d6d-0b65-4723-b1b5-307726c76fa7@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:04:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
 <qTmyhh5ukxu4BQAZXvNyyUvZxucwjv6bNoe2v30cfjsdhuzg3ud5DZzGmSBlYICc_POjXS2sSvhbRop0i67mxg==@protonmail.internalid>
 <8210513c-288b-4d02-9688-1de10e40d9f9@oss.qualcomm.com>
 <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAzNiBTYWx0ZWRfX5pMRAJ6nVO8/
 XIb4q9wK1DaUudG4E6zb8w04AagXptMT7FRmhO2O4eFck9obUXNfM07QK8nPgYg7P25RIzclm6U
 +7R8rqKa1utuQ2BMajRfIbD/ejd1X/M=
X-Proofpoint-ORIG-GUID: bCkX7fDM19DvaSGBpdsQhSwU7dFUCnIA
X-Proofpoint-GUID: bCkX7fDM19DvaSGBpdsQhSwU7dFUCnIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAzNiBTYWx0ZWRfX67B4HDcJMIbu
 5q/ZzccgDaRz1B9MUcP4FGRCToq3L16ULCH3KtlAc405u+MthyrpIA1azq3FwppP+yjiFxQOzqd
 5JQEyOla8f9vlyTRRA5I8gghH73mZqqRU/zivy/FUECJyrap2qSAeciIRgUi3YhSIsVAiCN8HzH
 u3Hs66SBrDo2A9ziWA5BCp4rh51rorXq1fUm4Q10fnHWf5nPI5x+6wyIffQ8XVUGgbR7yvYzoDB
 ALmYqHW+tmZP2Jd2Hleio5rrx10iKrSghCQs3i556gVQy/e+oWIuN0QJHhbqdYVyQfPMNPEpOw3
 D0on2tKmhjNDuTxdPgtzoSxmfTp6h1VnzKeTf2k7gqo50FxK/wwF0TyhJwTi9qYrzs3b/P12g8S
 XCFGyIJv0rE1Iz6Z+wKfNI04mtuBB6TCHpU7mQ0Vc+R2lxx9wO96DV3XpTJZx6DeGuPA91g3Bpf
 okQNC7lnRLJcSUeQPGQ==
X-Authority-Analysis: v=2.4 cv=A8pc+aWG c=1 sm=1 tr=0 ts=6a6ae284 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=U0KInS6uA2ESEJLtUTIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300036



On 30-07-2026 02:01, Bryan O'Donoghue wrote:
> So I don't think this model is in-keep with established DT practices - if a driver needs to parse a property it needs to have that property in the device node it handles.
> 
> So with data-lanes per existing camss bindings in the IFE/CSID node everything though should work as-is for you.
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/tree/arm64-laptops-v7.2-rc2-camss-v11?ref_type=heads
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/blob/arm64-laptops-v7.2-rc2-camss-v11/arch/arm64/boot/dts/qcom/x1-crd.dtsi?ref_type=heads#L947
> 
> &camss {
>     status = "okay";
Thanks for the quick response, Bryan.

Confirmed working.
Root cause: I had data-lanes only in csiphy4_in_ep, not in camss_csiphy4_inep.
CAMSS parses its own endpoint — with no data-lanes, lanes_used=0, vep.bus_type
stayed UNKNOWN, bus_type check hard-failed with -EINVAL. That's what led to my patch.

Dropping it; fwnode_device_is_available() fix going via your patch as Co-developed-by.

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur-CRD and Monaco EVK

---
Regards,
Nihal Kumar Gupta
