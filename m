Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E93142624
	for <linux-clk@vger.kernel.org>; Sat,  7 Dec 2024 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733572760; cv=none; b=cPAiJrNYf2claYK5SKwom6yZnSABlX4dnf7o45Obm5JbmuyMF4wyGMC6gZUv+dseuzQpwNirou1vUaVahjOqCSkZyJ9INxmt34FQax9cAY3iPB4coWzWWJSdkiCK3XHiqaRlQTifVgL0Tj7oQ/JOcY9FsIJON+zZPWxpmN9hpzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733572760; c=relaxed/simple;
	bh=mGZn0CG4Ny68vFgd1+6X3q26cRYW734PaY3Qehg7YCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNFupuFHhuUNeGdlLNAoMHpVwGfDb0Y4ghjfLItrcxIenJ/nn/C+0/W0DnBfSQazgVs2s2XSQA66HddB6zXDU1VfIdv2V4tui9K0rtqu4P9px3cyzsqvWxmnelFvVrwVhqvi8rZjNv7t+MhU+nX0bw9i/T1c0/1V0bOYJ993XYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsjcO5Jg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsjcO5Jg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B76RcJZ010393
	for <linux-clk@vger.kernel.org>; Sat, 7 Dec 2024 11:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGXhR18Fq97qh7TbUSa0kKhL/ZByCAhy9VcD/gJL5ME=; b=lsjcO5JgY9n/l930
	dD5YoEleoZmmaNmxtMyiIQbAl6lMueD0jtsqgwWixSfoa7rqEOUgV6NhrYKz3d9J
	S4Ok3T/JQn+JFXBxw9HXCxHmIZ5Kl38SMgUD+7dMiTAWaqBwLJnzUnoZLQAAHKGg
	Hjv71GKm9lThlvPa5cKpfW3B7RJgzG76JRXrLLrWxRT9j614zUS6GJyMU3kenEgi
	oKCUKxxD1ZTwd2iyoOl5YD74POtXmVq2hMb0eE2N6h0KcnqugC4LKaCgpHCnKVcv
	MFr5Fg6BTP7catpxvb2GjGyYP9f26lQmf7RFEEp21wzO3Sye+1X00AfU9rYVOs7D
	s18E2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfn8rg0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 07 Dec 2024 11:59:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d881a3e466so7956526d6.3
        for <linux-clk@vger.kernel.org>; Sat, 07 Dec 2024 03:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733572750; x=1734177550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGXhR18Fq97qh7TbUSa0kKhL/ZByCAhy9VcD/gJL5ME=;
        b=ghRdMi6et/eBUMUPAUQfUvTc3LRyzgRRsT6G7LebTJznRmxvNbGNWxxW7+rZ+4De37
         JvlG6Y+ElTbrPCI6++7TFGdkCmRURzAD2b4j7eN6u9sfNjMO010IWyHCL03oejfjoESt
         3/GLmvMaGM6wIJzjBY2Wa7Bfvt09yKrGziXVo3GBi768AImx2cwM189OtyKt9ThjuSSh
         1s8IdOPXDjDmkVKYfVS83A2ZTleAjLeDMY+nMfPhIisDaJz6C5MIdf58rfwnswUh3RjJ
         ur4Vp7XLKxi3LCXYbmzjgelRop8ihiEALqBbQN4hWmSnuOC0zBG5ZX3jNauyceneFnNQ
         r97g==
X-Forwarded-Encrypted: i=1; AJvYcCWTepF5VuR9sPw27R/v00h95rj5DYtAkOzfwa0Wjahyn/DxmjC8lrPLYhkz1hL55lC2bjJi3IhFlak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSlDA6dGvvy5Ke9cPzpOGh2cucoUXXPK7DpT7f1WLN/QQ01QeO
	zTJO4ErGSemW1LCboxu/8PFwnUv7U9H2z7upd2H+VxtIsNKcvt6bxXZJG8mHRcS+OLaPcQKHY2J
	/LJGNFQsrii5+IY///8EODOF2seiqopBhQGTTf7FznRjEyEEwnZbUPazzd/0=
X-Gm-Gg: ASbGncuG75F0IIMtbfkeX2h4IaJrUIm31VKGnNPGK5PY988K8qo8yBHjvd+T2PDPZAb
	L+M4eC/wEKmTEjBY3atxrpbggJG5pyFYOSss4L69UIBQmGS9622RlhGTQFb4dn91Du5OQZmVOLj
	2PYUsyX/C3zHGv+X24My1fHe5kzOC3luUpd8pDUg/Q7i1FrAPYUSVZhKYQQueXYSpN0m8WwGw0V
	EiqgCB40elFYJi6L0CaOJmqaOxXCV49+m1BXZPgufOwoFfQUSSRJ8vNmhSQGHQ+7GIU7uBLyL5u
	0A/oZFAClE/qmvG8n386CICk93FaeKc=
X-Received: by 2002:ac8:578d:0:b0:463:5391:de49 with SMTP id d75a77b69052e-46734fa37b7mr39903331cf.11.1733572749708;
        Sat, 07 Dec 2024 03:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPlffbEBpmwwLn07e4NjXlSpPb++V4AbkGPE+RE6e5rhThB9Z+v/f84NfUnlbSCUlfPWRp0Q==
X-Received: by 2002:ac8:578d:0:b0:463:5391:de49 with SMTP id d75a77b69052e-46734fa37b7mr39903151cf.11.1733572749290;
        Sat, 07 Dec 2024 03:59:09 -0800 (PST)
Received: from [192.168.212.163] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96aabsm381402266b.63.2024.12.07.03.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 03:59:08 -0800 (PST)
Message-ID: <b5400627-6359-4dfc-abb2-2c142217a28b@oss.qualcomm.com>
Date: Sat, 7 Dec 2024 12:59:05 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
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
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-5-54075d75f654@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-5-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: msYGN27IcY6dlptgLwYrWPRbaXLN9hu5
X-Proofpoint-ORIG-GUID: msYGN27IcY6dlptgLwYrWPRbaXLN9hu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412070100

On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> Add in 2 CCI busses. One bus has two CCI bus master pinouts:
> cci_i2c_scl0 = gpio101
> cci_i2c_sda0 = gpio102
> cci_i2c_scl1 = gpio103
> cci_i2c_sda1 = gpio104
> 
> A second bus has a single CCI bus master pinout:
> cci_i2c_scl2 = gpio105
> cci_i2c_sda2 = gpio106
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 162 +++++++++++++++++++++++++++++++++
>  1 file changed, 162 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 5119cf64b461eb517e9306869ad0ec1b2cae629e..c19754fdc7e0fa4f674ce19f813db77fe2615cf3 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4648,6 +4648,88 @@ usb_1_ss1_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		cci0: cci@ac15000 {

[...]

> +			cci0_default: cci0-default-state {
> +				cci0_i2c0_default: cci0-i2c0-default-pins {
> +					/* cci_i2c_sda0, cci_i2c_scl0 */
> +					pins = "gpio101", "gpio102";
> +					function = "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength = <2>; /* 2 mA */
> +				};

Please match the style of other nodes (flip drive-strength and bias, remove
the newline and remove the mA comment)

Otherwise looks good and I can attest to this working, as the sensor on the
SL7 happily talks back

Konrad
