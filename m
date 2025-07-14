Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB938253957
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499712; cv=none; b=JcL8Rld6ZkrBwfYWMT2x9gwpY1IR7RudaMEq/gEf22hDxQvUpGe84WCZz+EzSCjR/PkPdb+4cEePzxJMP90/aUQxib+4290SkhdAvUopxkuJ2tNNm+DgHz1VZnzn3TKIeRndULXdk37ocerBEMZy/9FpA4+jZ85t7AhaY1CXFwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499712; c=relaxed/simple;
	bh=oHEQKwBatWKUIOpL/sm9kI7CU4MvbWDSdi+bybgSb3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0bzx+Tob9BmjWJvAJFsaVMGQ/SqB5oSZ+l+BQn/BylVY1HYa7B6u0DVMs8HfU0ZtVQMIGv9CUdZ5knfJqEI+vzZfv9LCmOsgHbgSOnK0kdqOZCB+nxGt3fl9ixwYWSDJ9QvjPkg8YMoN3c0IQb7zAx8zxDdXjWqKwwkld5Mrq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KraOIjuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KraOIjuM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9aDUr011767
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 13:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ob9U6sQ6B7CRRePb9koAuef4V+KwLq5wrBJm+EnY7mw=; b=KraOIjuMYxXVQhaX
	kIZthTVA1UDkARf529A33L3Ay1OXUTbakbPknENdM/vzBHHWr5cqBo/IfPw1Sjha
	acRjGHbUtpZ7Y8ks9h8O0OtODmuuAtzk3beBDqBQBMTJbo//x2ylTASYwks2rvmr
	dYsQlszRZsS2qdfZ88J0cMxzxvGQ96fEiDVWGaf8Q8O1qFY/SdtYaVkCMXWkCSqx
	VRP1ZUSShkQxeKLuKjnzA+K+3oeGZch/Y0WVSHbZqqOBnoztqLmFfh1DPt4VzZ4t
	SW6Eh8+f1yQdfjkfzXvQTnWeSeoUPu6WcZ/EJ+SSayPySP17m9jo9dBMkl+l53MY
	oTI3Ng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut4qp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 13:28:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso11845226d6.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 06:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499702; x=1753104502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob9U6sQ6B7CRRePb9koAuef4V+KwLq5wrBJm+EnY7mw=;
        b=sEJIzBKJFAjgjYTrLquxJDqLIfUDZRxeY8k98RpaqQqk+rVZHQpJL6E+o7bwwAJUqy
         1iatQivMZpB/02Vk7FG5OrMyKX4ZyA164okkcETgzM6I19eNjYQI6g0KoIow2SyF1HDx
         9pKpQsvXYdqLjQLm0EjooaDhpjPXFksDiddj7grivZfeRMLJTgsuN6XbN5En5NnyWROu
         bmllqA/hINPjdwGyuBr9ecOefW99EzSW5Plu+3/fCfrKfz4IOh++6t0DsNS5tYcAhvnz
         4+XsoB4AMzxQi/1jAmSSU+SE3PP4MEvqK7//IuZ5X0IFquTap0ura22esbreMyx5EJNT
         gZhA==
X-Forwarded-Encrypted: i=1; AJvYcCUr701LElaEhjJkKbX9RMoQVxWgVL/d/4+pFtq1kXWTTLLNV1r19crs3FP6LvcFnFLfjoFAj5N0QBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ziw7QwcfvOASTgk+0uSsiX//UXnR5MmB8oxUZHt3UEfiqAbC
	6ix1am1xyHpvjlnIuPtn+RmaR128LOXIa8c9jkigISkwQwb3P7MOSYoZFmtsCIHyk97K2g6Qa9V
	OtCnfDx/wrj16AWatCeUiUoyBacDmQI2pFvMPhRttI1oWxmd1tYPBxU6ZusJq3Ic=
X-Gm-Gg: ASbGnctniOXKNCD1z3ty/grToMpBkrCk0dLC1p2aJEQLu5WbhyxTprwfgGELSy75T3Q
	TFoVt2eiXWEinNr8JqGHhCvL2mr7goa9oKJk1pYprRI+7h/ZemNDpPFLHjV2CGfboyUQnWu659P
	KjhKoLPDBmk1AWxePB7mZzuUjnpjw+89ULEvSaso01ag5Ad0+xnIF6smzYVu7dGSztDLEr9Sowq
	DfWRgCOAPw0x6KUf2HmgaWp9tl06dfBSozNGU+VA0h0y7i1hwpFclihxLMRryR1Gfj/mdVYm5Op
	w2QH079il/elcjnb7v/imao8UzFx6De2poOo8kxAEyf219FgRyQejWcdtAIVGpq+GTRoK5Gl3ex
	fFe1dzzlfl5WFecHdDy30
X-Received: by 2002:a05:620a:394b:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7ddeb8a4a8cmr654570085a.10.1752499702318;
        Mon, 14 Jul 2025 06:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Im8XF0a7klJdUS69ADOk3tOusKi5hYyzJtkL4/kjokc0qUJhiJ6sJr4jnvb6Fh5hB1siVQ==
X-Received: by 2002:a05:620a:394b:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7ddeb8a4a8cmr654567185a.10.1752499701899;
        Mon, 14 Jul 2025 06:28:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91a0bsm819346166b.7.2025.07.14.06.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:28:21 -0700 (PDT)
Message-ID: <fc21ee61-188e-42a3-b9f6-4b81a72d388f@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 15:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/15] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-11-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-11-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687505f7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=qEq-IjhxTDjyFSs2OvYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zvcxbSY-VHwyReGvzyC2fZ2Z2ZE505_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3OSBTYWx0ZWRfXz6Z3kSizE828
 SffCaPsWdBtTYw+h4X8pstpk0TSq9TUzWALM4kihbCDZQLf7QIo4AUU8IqFtIcHj1NA2nK0IvyI
 0+BufljY1i9lxcQ3ZHOOaHB9kAot/LIVGiUmqaV965ImkBBM71T+fFq45y/b/J0N27+sFjuAfzo
 cqLN50TL38DrJvNxt1tDRuLRRco3ZxjJGphH4GHAdTr3BwTfZDRFLBhCZmIKvsMcDGxcuMtdgtg
 oIklSJsZk4vIEWCX42CWCzLnCOihVz+50CcWFWPHMxwllvN017C53bsbaebeg17VCh2b6uMuUSK
 FAhlDG0HLypHWj4LoGGwCMWKmZqlMZW4migULZ2K//mJ/QqaaqRHEj8fTgnK/cP5ZMyY4Eu7KYA
 jtHTzBb4G0PTP5/q4XwKMfX5t2240ppdH/RVDqpZRg5olQ51ntCH7kfyFnbRwf/9typcyqYT
X-Proofpoint-ORIG-GUID: zvcxbSY-VHwyReGvzyC2fZ2Z2ZE505_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140079

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 78 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index 08268f60c305cd69baf937fced6d37f2ea788b62..ace4ab2b9fc0faac8233a40220aafba200ff05d9 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> @@ -996,6 +997,67 @@ &gpu {
>  	status = "okay";
>  };
>  
> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4

As I've mentioned in the past, this seems SoC-specific (and perhaps
the csiphyN naming is confusing, as it refers to a lane within the
phy, rather than the index of the instance of a phy..)

Konrad
