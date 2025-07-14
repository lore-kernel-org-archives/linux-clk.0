Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF1239E77
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484052; cv=none; b=i1u0+bZP1Id+mklg/f5+sBbe84g5zUqHEUECHBvreQ/322NBeMA6bozgHZ1cLetcDQPcV4uS54RM6o32J8GK1PYja/lN6md5EDcXLrinbx7pHt0N222d81x6VX/tYe6O7KUt9qWVFFLN8O18FCt8qwQa1zVnxF88iE680L1meNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484052; c=relaxed/simple;
	bh=IEo/0ebyLqCtoPIUGho1naveiGhjOQs40pxOBVatadk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuOOPsYMEpB0ZusoFsv5zk31goNRORfWjlfaUXaoBHuhb84LDKiTRSjBJnd8dhbPVdzfJ28Ad6CdBqfTfUZ8dMG8TdCj84eRVFSyO8AeydB2BugrQkCcN2dZgnt0Ly2uF7AKEiUYfljQ6AIzGtTtCOahhyXHaH8AUD5F2KEdulM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYbXmRbq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYbXmRbq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E95gFx026582
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 09:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dH8858t1uDwuloXXZdQnkHNZ0NilaSKFnXkLNu0wdfI=; b=AYbXmRbq8xd1OCk/
	s+IyeLmGFfeiNNGNQIdNkKND663wReiQq1+hIG8/I5qZeIT8TH+Ck0PfG/m9KDuD
	Aa/RkZCCB8R5Wenu+hwrbLVhltILB5yq7T52m5EIy9X0jTnVDd3gcedmZswLld9T
	C2UCqHn7JusrK1QwKFzv6ShZkNOxoY2SFv6mWrZm6nwqstbrUYt2Iv6fg1mymird
	eNIzgKDJQT8YUjLdpuvzDQaEovjfDe4SyOaQrh+EiSB7er59VYloiV6sIBxYdI6Q
	ouk9hq6OyzhQLgZ/LkeBEfmMPjOdPzk/EmfpVHzQeET4CFt189KXOOH25S5KAW1r
	GMd+vQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37uwr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 09:07:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6facbe71504so16252766d6.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 02:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752484049; x=1753088849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dH8858t1uDwuloXXZdQnkHNZ0NilaSKFnXkLNu0wdfI=;
        b=U4M/k6HMzsM8/04uJOXdXrqMhaaw7PkXEsKMc/Z8/r2FXXzc50qlCrrlHfNRpsKTzz
         /uQF85LMzOrWZEyS+zvSLv6YN32fWT6w6XQNMNnYBRj0ISFggwdluobJaSigX/wj0Zuc
         Wxksl7SFWBgO+CqQMQ6X9yX0hFg6k5t/9H23YVDGyOSwiv87BJNN+5NhCHVHR4hqsGGK
         wB5mZ4n2KQZ/H0VSOtNxfQcr2mLZ5HRF37aTbRJGra+eAT4LXWELFESVUFJSIDJVbcY8
         e5zYxQNTyzWSRciRDgbtx8o/EiJo5j+S8EDauHBaXq1i7h9Eu7+w5vkiP67ftVSw9bRd
         6tKA==
X-Forwarded-Encrypted: i=1; AJvYcCVd/Gcbgyb6RzrYWC8bsiTY35cKb1rChsX2gPu+ZPXDINdolUWilON8r7EyvwwrXUHwJ5xORdBPOj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfiXP0Acmtus0yLYpXjeDrC5FMPAINdVzB14DZt1K+CPsGgXud
	1BriaK/XLQF+keurRIzMg5IDDU/l0ySVfp+xrlBsFdWcfRZAcnvx+2ZpZKd8qXagC0hyeZmNMNI
	r0wMu/c1OvDJUY4IHDW02FuZTm6Nl43i2B2hkx74eW6KpqwA8BcBtHRCp3bpuht8=
X-Gm-Gg: ASbGnct/QrKENw+mD6NMaMPx4tPmU16skkxI9IjqwStzpzZpODMp8T1DvPmJNnGTbSk
	/9lu/rQH2WPnsshBKYBXMERlCqS+q14B4MwaV7FNZp8BAn050XgfxHwt2/tG1ww8scsM/hgrmtV
	1yoUl89gQMUsZGufkyZRacgc+6QWlkrhc29zXUzj/w4OAtmHmWp4lnKZFYAwceJVYkwkcXiN7wg
	XLbpQFSE2CyvWeaoQjcOvcvt/ggy2pKM2O1x8y1VQZFCOuCLMyUaQiDUksXm9hq5t42tjZIDwXZ
	ygjHr7PLWUdqHmGq5FSvh/ugF/CcbDzYfwZ9nEUFLI84YSdqAd/ILvLYUqN7FxZ83NvYuQYJ5z+
	GqGPWGMFKUUcPNYTwF22e
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr658698685a.3.1752484049215;
        Mon, 14 Jul 2025 02:07:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZeBIEWBgGO2oIe//VMo3cjAnyraMQetm8FdPub/ATMMOvADVyOJZ09L0sSUjb+pJk+fkycQ==
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr658695585a.3.1752484048682;
        Mon, 14 Jul 2025 02:07:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82962acsm790125166b.139.2025.07.14.02.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 02:07:28 -0700 (PDT)
Message-ID: <7d9d027c-87f8-494b-9101-69c83ff21353@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 11:07:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/15] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-10-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-10-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1MyBTYWx0ZWRfXwvx8zc+mBFM7
 pzTR3hN/wYa/xmD4Y5CSn14AeLqRNYKiSTpkEJp0oDVu/LleurazjMS8+854KDniNDkxwjRyxB4
 1uMlev+yIFVEkB8DjC471ycPSvv5VOtqXMpzQhmtNfUWPYYC2rIqcjj+gQah9P5TxPJaPQa4Vz1
 q4EfPJhhgKWO/0KLYKp8Ffats+ntFl05Z2mkDqSDdHTXZHPtyf43LaPegGZzalIsi/hGwOS/8iG
 D8DiRvzl5WonVUGsJP2tHfmEZ5cU1QhnW3M2lPq8Jg0ztFVWlsdMgsTKhyxzdNbI4kAt0hBDchf
 dFubWtLB8wJJIXaaBUVgRoUsXDmF6Bh9KS9G9LLW0yBckCUv+s8kQGI2ZIwxLdoV/kP8aRdAD3z
 8Msl85HxV0JFcEAjXouLdP5cjhAD20jWLr8FsqbwirqgMdsVKxE5uAjajivonMpsjeHQRC5A
X-Proofpoint-GUID: raPmvfDOk-ROKLvLHN53z0m3NLJTAygJ
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874c8d2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8FxmNogKXzv6K0n2ekAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: raPmvfDOk-ROKLvLHN53z0m3NLJTAygJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=961 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140053

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index db87b9b5be63d4fabf5ced20b23080a1a49b1207..08268f60c305cd69baf937fced6d37f2ea788b62 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -960,6 +960,36 @@ vreg_l3j_0p8: ldo3 {
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

vdd-l5-supply = <&vreg_bob1>;
vdd-l6-supply = <&vreg_s4c_1p8>;

> +		vdd-l7-supply = <&vreg_bob1>;
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

"vreg_"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
