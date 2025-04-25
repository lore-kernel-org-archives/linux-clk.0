Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E261FE474
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614898; cv=none; b=LVT3J7BzyllKcy+d1rTpW1r0luWHwf7VF/pbx2Emkv+0ZMQaq9TlJwf/jy6e3tG3K+EVLqJyw24XhNVoujHG4J/kjDpL9FoU+lddPpK0iXZIqwcGF9mpkbaAREhoE5qirKFCIGB0M380JntWM1U2CanzYhzl60R8dMIgQ5RoTLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614898; c=relaxed/simple;
	bh=bI7Bp9z+dMZ5FzNgBxdPEBaZNV5aEQQUjTMGvshbDcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yi/mwAZBXHV0LJDo6ITUyKRu25KJyEFTjtfI1li9ReWFIud/mRoUzGZAnhc8Co1+EkdNfEuunfFY1bCyO/jwH3MTmHtX0/Ks+436kBYZOOjt9Ar/OsE86/ViTGXgz3b7oCRWjTscQvu0OeQxKLUn/Yh+ysHy9TZxcqBj9xcYcbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpX20lYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpX20lYX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuvG024719
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 21:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xR1ahgPKwTVUbPyUmCySK93wxhHbaFR928o4V1MJnnA=; b=hpX20lYXYwJQFYLv
	65JD6t7WCpXBJnZMIhwIaodfJv4aR4+NFx6yuZpvcSt96lLGThrosMMcbIHz7/Ln
	8Z/+OqntQ0Oxy4DycP+hixUSU6Z/GkIjdHOnuEiYMNW/h7huPJjnoZLzxKkRYDpM
	GSNKiQqhLjC5GL7BjGyHLeg3RYSj6U/6lLWzfcCWJjII/7wL0jPbYVU1JGlPPtW5
	cRqlql6WPnY8Wj1fs1EGUBtit0lVhWE1rKBHLNTp+Sj885oA+9mW7ID+ssU5ByFi
	hYQloyNQWdeJy2BzEBbrrTgcgapjMmalWf/L665F2odrOiY4jDbIeY12dpS7I60K
	TuU2qg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t5b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 21:01:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae9ed8511so4894411cf.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 14:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614895; x=1746219695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xR1ahgPKwTVUbPyUmCySK93wxhHbaFR928o4V1MJnnA=;
        b=Xl4V6afjGHDZxFrvxydzXoxYYjhPo7x7HLT2zFsiaNa0NnqJ+I3eD1OOAv+v5OT6xv
         GQ9VUzUa50TaGrEeW2CTZ3cpbsO5x4Z/7NINLFx1LK3WRXvGc9lbFD/K+UXBWwRMViuI
         AyCA75Hr567pQV2zryhwAz98XXofoHlU3YyNQIPYOX92d0aTYAbHqSw7ovXWC4nFIYVU
         35zt3/lkYPBvY+P7QaY8Sug6LP5viZN3vf9WTvGWI8MQLMtryGE7NBVt1VDIBNBXrl4/
         HaL6plTEQPZPXa9XrdTbn9OCLiPfvH4hPl7J1fVQcebKuOePZweCKipjYVhJEsqHwO5m
         6NFg==
X-Forwarded-Encrypted: i=1; AJvYcCXeUKa/07nU9pgDHqZlBeonb8d1DPopsvfKuhnmBBE05lvYveSTOYA6Pzq6Aq+nrz1OvTjlGn/1uVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/cQ/mmgXGQZroAyqgfxy5sXSIWnU9rMLtXhq82ZSMuQuWs8M
	ooDjxBV67QWnKeF4QleBm4mU+8oYahesqWj7xK8ey7yhTIPITV3tZm44nQIkUxCej4dEqMWilaJ
	BGGZe2aWJHc7JjS5DDYlYGP9c30Rd1nfuxEl5XrlY+7JsFbnKc4uzuld68/I=
X-Gm-Gg: ASbGnctt9fLVHF2zjRb2ThrS2yr5qDlHvkbQUzqRC2as877oLWvq4jsy4Wwd8dMa9e5
	tmnmz384QeCP4VtRQoRVRJ+A6NGM5x2MpmXWkS+3e36chIlGtGuRC9f6+T1KmgcUPd5O+fKJxPg
	uBd3NTYf92ZKQZ1ikGmt0VI8N2gkdV2O9h/6ODNcTzX4ss+t5efbmdusHbv1xq4RhLv20hTAFly
	gUobQI0Qt/CacvqwMk41MYTViF65qQcpW50t3icpj2nBx7ggj9BVfFYnUWKjtiT8CmnpAxBuroC
	NBQwri1kUeQEWGO47sAUyAIczjCtaXUGIyYt0yf8L8XgRwPc/L82h9fUjmEVWDJOXfo=
X-Received: by 2002:ac8:5a81:0:b0:476:af54:503f with SMTP id d75a77b69052e-4801c0d6cf0mr17928521cf.2.1745614895011;
        Fri, 25 Apr 2025 14:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDD4DIsjJW/tCe2Z3iSjgVplvrQe6JD6qbHnxSZ6hgFtwLPBMqeYJtiD8Mox2CAsRHhGa6Sg==
X-Received: by 2002:ac8:5a81:0:b0:476:af54:503f with SMTP id d75a77b69052e-4801c0d6cf0mr17928151cf.2.1745614894435;
        Fri, 25 Apr 2025 14:01:34 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed70606sm186518366b.160.2025.04.25.14.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:01:33 -0700 (PDT)
Message-ID: <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 23:01:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: x1e80100-crd: Define RGB sensor
 for cci1_i2c1
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
 <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-3fd4124cf35a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-3fd4124cf35a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D5zVQ3Z2WmnN4oy7QqswlQTCo_gj8ICu
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bf82f cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=qEq-IjhxTDjyFSs2OvYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: D5zVQ3Z2WmnN4oy7QqswlQTCo_gj8ICu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MSBTYWx0ZWRfX0YSYLa1Ee+yB e92NAHHnDxHJAJR7Er5PQb4bX/Vw++aoIewjxzebItgRcfxvRikMHvz21EmBzDvGpaBRR0rx11m 8NbrtUfBz6fP5wHHe7aQqR57I93V7iTCUpwAi1No4oydLBIosE3mEfapwfXSStqK7Zkf16OBzVC
 hx/vizWKbc+LBIE+Sx9wREj3+KprBda0OW0B/9WxNmQQRk+1Cbvy9D+CYJAE1zekrii1X8D4d8T 1KmXRzwymRssyhSdNUXwOnZW/XCRrYOhwNIR2nd+804ce+C0k0kYPmkRa6jLoup+lSKvX9YuwQQ aVInLmrG/g2LqW//8YXQN8IHQqyVkm2XCzA3Qu5YzcVgXYr+mcHRRs1mnnS8W52GWHkv4sdIobW
 cPw9gJ7bL+NOWktgjVXzYCjlknoYyeF8Yhrw0djW7dHJ6oI8fkniO4G1NUaUoU3leHAo6ySs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=915 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250151

On 4/17/25 1:27 PM, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 60 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index 74bf2f48d93522d3f5b7ca990c06519ca664d905..048e49aa805c7239e1a22b59bd784683d1d0da08 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -894,6 +894,66 @@ &gpu {
>  	status = "okay";
>  };
>  
> +&camcc {
> +	status = "okay";
> +};

CAMCC shall be enabled on all boards unconditionally, if only
for unused clock cleanup to always take place peacefully

> +
> +&camss {
> +	vdd-csiphy-0p8-supply = <&vreg_l2c_0p8>;
> +	vdd-csiphy-1p2-supply = <&vreg_l1c_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4
> +		 */

That's SoC-specific AFIACU

> +		port@3 {
> +			csiphy4_ep: endpoint@4 {
> +				reg = <4>;
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&ov08x40_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible = "ovti,ov08x40";
> +		reg = <0x36>;
> +
> +		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_rgb_default>;

property-n
property-names

please

> +
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		orientation = <0>; /* front facing */

This most definitely needs a dt binding definition instead of a comment

Konrad
