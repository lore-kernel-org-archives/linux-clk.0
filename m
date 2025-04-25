Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0B2236FB
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614756; cv=none; b=oGb5SSO8dic1m8Z5FJFWeE/wqemXIcAa1yHTPorikf5TLRGp454kkVOYAOTRpQ2PYC+WFLcQFPPHhDkKWEnz7uYhsp/IHATpTCBvkWiA+neG8lanx3pI5eodDJhyBPi7obbL+VGrrr9RolgI+IRYzNhXhPiiNi574oMDnS7CH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614756; c=relaxed/simple;
	bh=U77G/pwPSxuG0YbGLIuyGneBztbU3/zw1RUcuJ9AOg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3UqBZifLT4Z+vP24UpHYQhoamxlCJiudontp/RwWq+2OQE6ud6ufjcCoZZS6IUo6qCT14Zw82fjQcq9TKSABpGH2IeylCoUUtTPLq6egymw3A5q47j9k1PamClt1t8N4Boj/Sn4DAm3i0LIi+AMiu6VC9JKQh02zxckBiQcpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWbMlZeE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWbMlZeE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwml032069
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 20:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LRFKuyQj8tzl/ipkd3V4uRPUSagaj6nf2RE33l4njU=; b=aWbMlZeEd1EckDQS
	VPzjP/hQDdZRJxEh+p0DZGaTR1Hkao4CYTGWChsY5lnXcxzYS3HOzeHjRu+QprPt
	mDp6Qi9hkqNGXqgA89Z3497QMKG3kCyPmLQaaOhPhojaEBkBWTtF+x9VDOLpURjh
	ixWZm+31W7m9HRkenWmVRgbAkkJvs5LcieSU1Shg2wLNG8zDZsV5FHvU6wPeKxFz
	Upa8xM+v8ebRX2StHuc7ZwBM5yrLhrgzwjs4tV0WBbdXWXolQloCPXAl+pul0vCZ
	5ixhJRBNHX0IVbCcVmS5HUpCZtbc+Ozojj9W3S0P+QQKi272gI5WI+J2qFaseuNE
	3MHakg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1a4yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 20:59:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f3c21043so6456976d6.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 13:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614751; x=1746219551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LRFKuyQj8tzl/ipkd3V4uRPUSagaj6nf2RE33l4njU=;
        b=k1YeCMhhIsd6M8L1DcH3bZNL2S0VrTmCiU5MxJ549MResqq9eBx23WWvlOZbAHZ6bO
         sGIpCw+U7NIssYcwKWscXN5gz/ORi2b3zBcwy1idybLU5Qw5mtOb3ziZ8n7wHKXRoFlr
         TsCnqFIff0AKeOEnno62LHegS+jWNQpoK9Wx1ww8/46cy4oIO3YQc8emXkWk14ubI6aL
         xsf/7y4jv2oxHlw9sZM7RQhKXh62UuvdlOEWf9/CP+O4nLTfE5k1U1jlg/r+ZG9f9W3/
         IbCPUMi17Liy97NrjToVxbLNJ7cwx1uoxCp4R/IvhB3BEpYAKg287kxE5ueqdAe9XPQs
         k3bw==
X-Forwarded-Encrypted: i=1; AJvYcCWwSyY5fXkZvGCKvdWHiwnWdwflV5h0Esma8XFpzHS95znzaT+ossXarj6N7J92+cOfK04NUWDjGss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww7pdFBGdcQph5RmfTUGr/aHj+TrO0CTyHWvhB1ozOWwMUOp7U
	NJrxhDxZ5HE+01LjRfpZ6IH8HYwqffKydGHqs3fI2AVIlYc4K7JlXVKYRJFcF+kmoRzjIrdpgen
	ip62KrcicmAcJJ8QJz2GGZS7DTqsmbZCR6Mv/SEvdrPNzKVlGXB+I4vfkhtk=
X-Gm-Gg: ASbGncuYOCDwkQYHQdKe8OiHcOTVvHTGZSDrDcg1eGxMbWhEZ0mvf8OUZyDrc8fJf1i
	jstUOG1RA9+zoROG0ZUf94wbRZuVadOyGDT4vCwLXxiowAN+MHOy7zqRvX+huT8blrOwmRziVnG
	QwlHIOfuCzDygEMyFYq55V4QqzuPIm3y8dyDWpRIzzPoIR5uiyHhyZzt6P3kfQMU7wAZmP4YDYe
	F9oOy5tLe2tgxXVO06HAgisH5uckHhXBXgtfxfuXkHIFFJ202iFCtcdBBopf+JrlxAd7vNcC07K
	/XcJ/8S5U1reKkyyyIfrOh79MSZSNNVg2bnbNtPWGKX3hYFunNVSoaDY0hLxEjwWA0c=
X-Received: by 2002:a05:620a:bcc:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c9606e2a2fmr207583385a.4.1745614751630;
        Fri, 25 Apr 2025 13:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxSw5TJpnLmV47NsHo1BnQTpTa/Sw5u0NUbO0lbNkne0UoYmYWA/fJrjJvN1Yw56jJoKlr6A==
X-Received: by 2002:a05:620a:bcc:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c9606e2a2fmr207581985a.4.1745614751239;
        Fri, 25 Apr 2025 13:59:11 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa375sm187614966b.121.2025.04.25.13.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:59:10 -0700 (PDT)
Message-ID: <f0443faf-ab55-4962-bab8-ddf31a751459@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:59:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
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
 <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0PJ_3Cpg9dSjk2sXHK4LoWk3IJ7Kd4RI
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680bf7a0 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=yamDa2HSj1aoHl3nUysA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0PJ_3Cpg9dSjk2sXHK4LoWk3IJ7Kd4RI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MCBTYWx0ZWRfX3ciBW0wUakWQ ZAW/WAOzb4sZJCN/AY7IVmrPhBId+SmdGbeNRe4jcUJ8Wgrn7SF0BzxSVOaW68gP/eWlsX3Luqy BC81Vu2gsauKhi9bjYKebqSJgVUALfy5xmSis7VWrm+SkEj9o8NE7t2vvQHj8V1a4lBBYmMhnsn
 pvRafAipeHh9oVDmZSw/kQDNe3YIUUH8RugfIOf56qkWS0sjw3wC2dB+06qbu33l6Ggl6fN7iDi ag0N0RgcM7SgqyzPic14p4GrY1nGroR3n0I2e735Uvvf1fHVBdFTBv8TNnpvvyg2j43A+VOjthZ ndsfkK/1bXph6IIGTZPT1M0Hx0fFIPdBKry/4tpeH4DoDm/4psT4a1YY5DEPmzvyrcrwJ7HKEqh
 QEmBzoWC2PHbA+MLotRxeXaiXaK8G531eDW2GCYkL9alc3x7otw4wJIjkxWwfa8i8xK4eVjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=934 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250150

On 4/17/25 1:27 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index e2f6e342db7e2f7cfbda17cbe28199546de5449d..74bf2f48d93522d3f5b7ca990c06519ca664d905 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -858,6 +858,36 @@ vreg_l3j_0p8: ldo3 {
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
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;

Is this and below +8000mV a fluke?

> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vrer_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

typo: vrer-vreg

> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p9: ldo7 {
> +			regulator-name = "vreg_l7m_2p9";
> +			regulator-min-microvolt = <2912000>;
> +			regulator-max-microvolt = <2912000>;

PM8010 coupled with SM8450 has:

regulator-min-microvolt = <2912000>;
regulator-max-microvolt = <3304000>;

although the x1e crd schem calls this pin ...2p9 (though the names are
doubtful at times too) - please check if the consumer is happy with 2.9v
