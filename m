Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3196B251791
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499803; cv=none; b=SEiIcdIviyDlxFD79wOS+lniQj+pg5wmh3H6pwxeQ1+P8cJFPDSC31tCq96FVLgfm+ToFDHPGgb3yMKrG9cfZq8DIq4gmYPHnKlOmiz5SbT7QcUvLQdi/OJ4sTpw3hPEguhUrTdtOUXRRWzhfZ/F1uw0LwRRX6dNArYsyohdLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499803; c=relaxed/simple;
	bh=3uKXuWP37D0CEeXXM1tywrvm2McS8VXMhZeTn28VHoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGHcCGVMSFmpLU8N7DtaobGLxfoC4nA6MmnzZH256J75LqGEU7aJQsg3pO/LUkiV1qyXG/ajHQAuzMWqgO+UJMeZCUdbTmqxEaXO+DV0r0iJj5doLpbHGaW/NSOoIyKNcseEl5GMaPNAPvreKPFrxFE3nCiz5YuiYWiREKs4EDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni27Lgie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni27Lgie"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E7RBle008440
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 13:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EwocCM6XUaxUM6zqzmqtMLsjRln2ZwRH5MrCIvcpmqQ=; b=ni27LgiegFlY/Rqd
	7oocgMbfgVrGrmZLlh1wU+5fWe5lXdhnbpjBjLfspfNAvACzfPxjBDG7UJSHkVZs
	/p8Fb2FeDKLIq/x/54voDnw7RDbpboVEDnftVbB4E4Kb2hiqXd3LMRZDFVHPRf/1
	XZ89NbHnIfBMovimnGzgkobXxU4Pe5FRELVz6JAiTZsNY5QYRnOF+asOWCQu3v1k
	h8MbmNIf23va0W4Zi3h7wMI48cUCLac/m+feu6lHP/SCfPeh/OmN5AM9HhDK2Sft
	bapFm8gRZxa1kqQtkxYkffuQuyQI9G1P2cNHoF5wzhZeK3ysHiVBxOBpSy9dAbPj
	KAOO6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vwghh4a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 13:30:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dea67756f4so77946685a.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 06:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499799; x=1753104599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwocCM6XUaxUM6zqzmqtMLsjRln2ZwRH5MrCIvcpmqQ=;
        b=QfdzP9VXFg1tVQ94NJ8tqozMcOBXakwngHaQoQGiNaNVOHZN7zOFY3XYnchKAXqr2U
         Rq2Bqi1kpbjaFY2FnFdIpz/lmTbO2NEXCmEKnvtX7UL0tPaUkutdART6F2MAEe/qQV6B
         ZXl85ZUbGAAeMbk4SkVo9UiluyIwjR5curihj/aA8l8st5w5JmgdVycLLDarQ4e4BDQO
         IFZLfELqYfonjZHCNK1fw50M2JGBMACC4wkN99J0YRx3TBv3miCVyw39nUTqh5BKh7LL
         el3w93e1bpfWvtrOaBFDe8rDynUwzVUx2rxChsPrAtAiQJvLAZfOg/NnEe+9MSvCJOzs
         G92Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfYMUNSKriwGcC6Q3qoom7sfvcV6WV6YbmlwTJ7vzIuKB9CuNhmcUUZ/fWFU3aQJPHrb7ronnowFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZgWZZTqk1kLZZKU2IuE7Ocu8fm9rSS0F3fxM2SB7vjdsuGe06
	VGkdIOCLT+gKFkO9mhvjzGQH0SH3MHpdPLEFKAJCL4WlfJbjVxn3PZU0MaaxnBAJOYjqxawJ/PJ
	83smym6+XZmq7VuWKrec04lt8alWJVrO202OueJYbag6QtBWgDGbcR1rQtqsEI64=
X-Gm-Gg: ASbGnctesqj6/7/sVg0dvQwAeLZyaeyYi6YxtEgNT2tOSWXIsLHZK3NShGtjanFjimE
	0CZaCVV/gcSROqeTqepK7YlMJW28YbsuEbrRUIbQ3DIwC6+9Eq/wVEwjJ9YDtzXmiVcP6wu/3F4
	6swsK8sPFQhw8q4CYyEXEGVTukUv7TrWloq1hcKACiEnsxRN5aw0cf5HhIaa2ziLp4kdyifL3yE
	QqAFjG4KkV5BV9hE14t48Uxto1jFLVKQIVHEjubAaFsjzPgZHr8mFUSJkWrxJK14BPwUYTql9cp
	o2uz5E6OFZSm4LKHkcXDzjqrs7RGoKbjdBDwRmDgn0AIiTRIRehQaZyu8UrQ0ha+xJtGDWqNebS
	6Bijkky0+cSnUwy7h/YvU
X-Received: by 2002:a05:620a:4712:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e3297df03dmr166521885a.10.1752499798878;
        Mon, 14 Jul 2025 06:29:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4pVl04wh4MC/yMhCnGpjY5MlKKeWfA0cK5VDPj8AHG8h6eRZW2+HItMHeuT0gOF1TXD/tzA==
X-Received: by 2002:a05:620a:4712:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e3297df03dmr166519985a.10.1752499798442;
        Mon, 14 Jul 2025 06:29:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91c81sm830369866b.37.2025.07.14.06.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:29:57 -0700 (PDT)
Message-ID: <d35d95a9-2844-4940-bfa0-aaae58de48e1@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 15:29:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/15] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
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
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-12-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-12-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbLIQOmC c=1 sm=1 tr=0 ts=68750658 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=tqOywgo3-Srlss81Y0MA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HnMTG9yXbzymOSVoWdVvGncz3NnY6DE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3OSBTYWx0ZWRfX9QzkhnVGIYxy
 cmAhHeYOiI+3oeDGTFRFZz2fzAJx5F2mP79vu37/QOTEDb97Fl3U23f6V1r7HS0BYz3ArGfounb
 BZedGtpxUzdhKwfF4NjYnQdIxo8di1jjBhAXulOsWMjOqH6oi0vzRTyJcKHaFd1ZrTa3YhT5I9W
 EVbrgJk4hNr5kMzCGdav60cPnv5Z0LvbWrbRtu6j86sOfMv2aMg1Iae/NVYF0XuWg9Wk+dF2Thy
 ACG1h2FyrFLLIRTfxX5ZIV/rURjaHVAB7rJTP2ruNVxcDM0zOy7yMO89pu+1fnyoF4+lABC2a2d
 ND91Dne+HDClvYoO5SwhpFSGVg+QgKvTn6jDJa54kYZZRhYCPj0HNfoJXqaXPNqijT9hLoWs37i
 AY25xKOQ94sZPXPgCERBDCEmfgtkHULBkxJ4LqNvKHabAsQw5Tg2pnrl+KWAsACRGdWRAK2C
X-Proofpoint-ORIG-GUID: HnMTG9yXbzymOSVoWdVvGncz3NnY6DE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140079

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Add the PM8010 PMIC providing the following voltage rails:
> 
> vreg_l1m_r @ 1v2 IR sensor
> vreg_l2m_r @ 1v2 RGB sensor
> vreg_l3m_r @ 1v8 IR sensor
> vreg_l4m_r @ 1v8 RGB sensor
> vreg_l5m_r @ 2v8 IR sensor
> vreg_l7m_r @ 2v8 RGB sensor
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index e19daf0f41f1f081e4b0c04be71e37f6ef492b6d..c9215c1a37cf4e7bad1512f52afdfc18ea616127 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -580,6 +580,13 @@ vreg_l6b_1p8: ldo6 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> +		vreg_l7b_2p8: ldo7 {
> +			regulator-name = "vreg_l7b_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>  		vreg_l8b_3p0: ldo8 {
>  			regulator-name = "vreg_l8b_3p0";
>  			regulator-min-microvolt = <3072000>;
> @@ -823,6 +830,58 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
> +		vdd-l7-supply = <&vreg_bob1>;
> +
> +		vreg_l1m_1p2: ldo1 {
> +			regulator-name = "vreg_l1m_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2m_1p2: ldo2 {
> +			regulator-name = "vreg_l2m_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vreg_l4m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name = "vreg_l5m_2p9";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p8: ldo7 {
> +			regulator-name = "vreg_l7m_2p9";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};

Have you confirmed all these voltages on both T14s and yoga against
schematics or similar?

These vregs are widely configurable, so the reference values may
not be what the hardware expects..

Konrad
