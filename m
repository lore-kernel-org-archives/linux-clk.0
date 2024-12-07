Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51C1422B8
	for <linux-clk@vger.kernel.org>; Sat,  7 Dec 2024 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733574292; cv=none; b=UU21bSZFXdcixqa6JuhN1EfaI7iozgndZU3Fw1qkU5WOP/bMyFIWxERtq+91aNw/E7t2hAh+qxnT4a1mT0MbzFYk3sJKCWrDrb47QOSXTUtZr1tIbiBXch+0hHmrx0tePvXfv3mKHtk8Buy+OZgW0OKovmAK0ewnlWsk4urjESs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733574292; c=relaxed/simple;
	bh=Imkwjvr8OjZv9fFVDAgn9vb0dZxjoY+OVBVdlvMWILM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+4GeI2v5qBzulNqNK0hut1DAqQ6HeMqzRwbEHnIuxWEhPqzb3CZEa6tbUsgGy3LzPSuKgOKu6KXIC3SdrFAHFW8aRMwhADMbvE7DL+7sj4nZjyc2/C0Ub5ZBf6YFg3+DCWydtX/ABgo9pzKGt/rKxmLy2HvQh4UMJFDD8iHQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJZBlDqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJZBlDqZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7BuLR3013339
	for <linux-clk@vger.kernel.org>; Sat, 7 Dec 2024 12:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQ1BefPPZjsefk+Q7pM32V79KkOTPD7KhjkHUZEtT/k=; b=nJZBlDqZ+b9Yua5E
	mXTXJlvIv05Mqj5rN1UIOjD4GjbItQeFae8dq6PhSauWIDEcP3Axb7wFROEpYbNG
	x6wylpHx9NzKmL2DhQIXod/nA3HJ/D9sS1ZDNeAfmQs9C+0tc8DLN26DSJf1lfFw
	2J/kdJppCP4G2hl9y7to0N1gxxg3VvQXAPzsi/apeHsa42MQVNqfGh9bG/ZG0sWB
	SUa4XD5o2nZvdK/JFHpmrnOQSjfK1tyax6e8rT/fj9Iksxk8XkQGGTJhO2dRO0f6
	50q1XvTss7q8qFL6LalhOJ3k3cMOKvwiTgzKinzRgvhMm+yxC8wle2gDFjRatLeL
	nTlpuQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfhk8h62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 07 Dec 2024 12:24:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8e7016630so4202006d6.1
        for <linux-clk@vger.kernel.org>; Sat, 07 Dec 2024 04:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733574289; x=1734179089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQ1BefPPZjsefk+Q7pM32V79KkOTPD7KhjkHUZEtT/k=;
        b=Bki39grq5r121WeRdENKQAM+5MEb9bT0QYS4KgmbXda2WNeX2pwb/ftGARJKzWc8Rk
         BbJksFJw4EfWQJALZqtERI8qpi+Sq1GRKbwo2+AvC36wdTeIsN+RhO/M73NjuY6YTSHN
         P5hJz0r0L4BOpsOeQDHabUAFWBEsljB7sT6EOSL17GD57WohVW3AdoPT6LV/0cVxhg+c
         sR5HhGaAxLxABOVbBkkyIXO3/MQZro6At7/KTwu9IPBxbxKFHs87U9HOSX/yvwb7zzFH
         h5ZfL2y2UL/9meWTbMAX1aVT3C/nZj8P8rwE2f0u05pf/YP+QX0923B9OjPWpz5ANLB3
         UZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPG5r+8lArcd259zEw2HiswibINdledb4abjqXz6jNcjrxuFI1jTEs9G4W4lq6zg2TZM2UC8e/SjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJT6J+NQfAxLDOGNR5mQ3CCnZKK0oo0nAd1YTIe7BvpyZ4c+he
	gMIXFjUFC0c58LAxMbBXPompSQxiG2YfBme52FY7YWFR0Bx2uhFpUIsjgxggIc3hyy9h/wPGf+H
	rNoUujl31XtjrTmUkeaTEpqSyh/Mbuh55gJhlby9o2SMr65wWYR7N6RP0x8A=
X-Gm-Gg: ASbGnctZC1a693ftWbFSorKDIQw0NKysUHHKwsE3vbeCKwW3tLdyxP2yoVMjTsy9IZN
	Nird1Y+RHEncLa3xj+I92vlMc1jgcQomov924PYkTj5FOGZ01+O8r5Td1tWcHfq01/k1MUwikD9
	+95tYD0EzWQKkrJ1WhnigQEzjDfROXol+rmQjlPB3H57ge9FSkfMnRdm0KwQ6lN1z2JHGvaHAGW
	5+j2CdqlXvQWnpMVmQ82Dt3g+h7mJWSYd+RhB9opXQ000sNlvYVSb/ogMz4yDmvnm7zZxPUolpA
	gDYlVxvPE6gSwE3PSK3zOgn3ndSQE6w=
X-Received: by 2002:a05:620a:2681:b0:7b1:4579:80fd with SMTP id af79cd13be357-7b6bcaf410dmr314488685a.7.1733574289356;
        Sat, 07 Dec 2024 04:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq8U8Ty2ix6xok3zzJyL1MAVWdr2aIcau1ywhGnswjMwOh+jLaNEvEH5AowyHkAWxYwSII3Q==
X-Received: by 2002:a05:620a:2681:b0:7b1:4579:80fd with SMTP id af79cd13be357-7b6bcaf410dmr314486985a.7.1733574288928;
        Sat, 07 Dec 2024 04:24:48 -0800 (PST)
Received: from [192.168.212.163] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e92a79sm380101066b.43.2024.12.07.04.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 04:24:48 -0800 (PST)
Message-ID: <3c34afac-478d-47a6-97df-cc45415f6411@oss.qualcomm.com>
Date: Sat, 7 Dec 2024 13:24:45 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0mrMoNPY22tkqxxospFOL83Yvfi25-6k
X-Proofpoint-GUID: 0mrMoNPY22tkqxxospFOL83Yvfi25-6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412070103

On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 180 +++++++++++++++++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c19754fdc7e0fa4f674ce19f813db77fe2615cf3..f23352493cb270c0fdc3c42add032286601db1e9 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4730,6 +4730,186 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		camss: camss@ac62000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>,
> +			      <0 0x0ac62000 0 0x2a00>,
> +			      <0 0x0ac71000 0 0x2a00>;
> +
> +			reg-names = "csid0",

Please remove the blank lines between x and x-names

> +				    "csid1",
> +				    "csid2",
> +				    "csid_wrapper",

This doesn't seem to match what the commit msg promises

[...]

> +
> +			iommus = <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x820 0x60>,
> +				 <&apps_smmu 0x840 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x1800 0x60>,
> +				 <&apps_smmu 0x1820 0x60>,
> +				 <&apps_smmu 0x1840 0x60>,
> +				 <&apps_smmu 0x1860 0x60>,
> +				 <&apps_smmu 0x18a0 0x00>,
> +				 <&apps_smmu 0x18e0 0x00>,
> +				 <&apps_smmu 0x1900 0x00>,
> +				 <&apps_smmu 0x1980 0x20>,
> +				 <&apps_smmu 0x19a0 0x20>;

>>> for pair in a:
...     print(hex(pair[0] & ~pair[1]))
... 
0x800
0x800
0x800
0x800
0x1800
0x1800
0x1800
0x1800
0x18a0
0x18e0
0x1900
0x1980
0x1980

Please remove the duplicates

> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,

QCOM_ICC_TAG_ACTIVE_ONLY

> +					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

Konrad
