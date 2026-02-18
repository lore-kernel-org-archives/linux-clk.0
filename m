Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CCE3009D6
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411331; cv=none; b=rlAcLGzhzQ9tZhTUGx/ThgvX6jDk3iWisGTwRs0Vu3Fz7soL48qYDyHwm/DvDHGz/IJF6FRi3AiQ8h8JY2oVVdG4IsZxMWALzoAMth6jJXgXfMSxkvkxoilIkcFxL1L8uHFtFPbKVorbpToQgUs7JS8P7/fAUvyNDQw+CHZDYvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411331; c=relaxed/simple;
	bh=j05/cxfltucXRwON8QSfjH8144PoGhffNAKPXlMCtjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kfu9TCBnuc2vzTwvSGXNYUzQZDv9jeUBIaZk7GY76WMXHc6hQOokZuNkKuLVq/6Mr/c2LAd6SCu0KkHv2JtfSrO7n7yJMEadxgWjy0wtABljuYMfr8ZPqwOR6w0EEynRDfX9o8kfmn3xqIgRoIozyCW69IdmGZ92cnUvFdN/gjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HOCrC2tk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Is7JdY86; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HOCrC2tk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Is7JdY86"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8WcFO3379935
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50M2aZYa0M5or/awTAHouzvOMiiz02HpR0Cx2PU+naE=; b=HOCrC2tkGG1ZYOe6
	HcTDt/NxHg+C+q40RhtuyEMR4htzanaDOvS0TmE+6C+329+7zJaLMz5Rj03kJeUt
	gn3QiqoR+N5lzFpqWffPx7hVigKzjPhXjbqdyKWZtapUHfJhGjEBUJGOHrQCDdjx
	Nn55OJK4ajp1uEQH8Ayg6zOqSarnTqk1iCCw694m/apy11YDdds9wO58WjOt7bQ2
	QE0Z/sugrrfjJrdPF6wlZYNdL9/4fdWQVU3DiJU2hqn6ZsnZSW9E9JoA514DOngS
	RpKaD+vZf34hd+z8VFFEuhSCPgvyMYIJwjxJcxkToOg5ycjWQlRM3sfdWgJYMLzF
	USrYdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyj3cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:42:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8960257db65so39490856d6.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771411327; x=1772016127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50M2aZYa0M5or/awTAHouzvOMiiz02HpR0Cx2PU+naE=;
        b=Is7JdY868+ymInNH88zQ8rJdWpjC/5tKZH/ca+LXNRZGHorimOCg8fa1jEjI8jd8Z6
         3GmqN6GPOJsH0ITx75rbcWTSqe7fBEqIITMVb691g6fH6rCOdDjTm6PJN5BCgFEAHMtN
         y2U5Osu3JRgjBjmF08KyxRB3NYFE3XFzjFq5Eoh+HnolhH0qKERTjeW9OB7C1SpxfyoT
         Zf3YRCDj57UK8lPkf3cxuZXnHnqqsL1JAMtmZIcp5eGXK8i1/1AIjBIz9pfo98HGBKWc
         KWu/tmhJpHJq9UNZDBGb+hB9tkbgO0F5tGL6yKmPv5IF1xmodG8gNRIWSUXkRfTvZFXV
         osLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411327; x=1772016127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50M2aZYa0M5or/awTAHouzvOMiiz02HpR0Cx2PU+naE=;
        b=eTtkn2ZdeTJElF3f8spW46C2LggQmk3hZSzPyTilFnaw909cyWXz+cVxYzx6PbpsIl
         9Uj4JY8hyrBIqntkRfephSGUz1V2J2J3g/x4byg1sAAq6AH5sCF4Mw9VgixBZTazzA36
         BMJRHloHaF9/Ufw2nLYQs4C6xqikd/GxGNQblw8vnSeNrWxICS8PpoXi2iUDIs5ymeVU
         CCnzlMiDa9tOspUsQdff9ZWRMEGq/34ZWwjNfwaQy77UN3H7UegpJVaCzkU/VSAuQOUJ
         SnL4EGGRKtbyp/AzqAkT7eVxZ1had+jOvKj5VwG6O9Cm4o/XrvU43EOxhlSASkP9Lw8G
         fJqA==
X-Forwarded-Encrypted: i=1; AJvYcCWm6ZIN/V3kCBqJe3WadGO4hBR8fvFdHmzGT8T6GujFfBA7XlcHvWccTU/xG0IXGbK1LXtCAh8pTBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzobKny2rCP1SRWTcHzJ6cN4mQ6Z89BBeoQ1Pz4jjMZjEO6CZ8w
	4Ue5UbXGdhKBUuLXyXc7pp6nSJQzI78fn5x6LugPAwZYt6Fc3BNBPZQeR6Jm25W24N/RzUWAifW
	tXQrXTCeWtOc14fkGaClH/vD+r9Ps7YM4iZ/2XKJhj89xIAa8AHbtjgeY1xKj9/E=
X-Gm-Gg: AZuq6aKiqaW+g8KH+V5bAVkTcw66zMF9vnOXAEAtb5qvH3WYVp9KuBzwa95g+FBquBj
	fGrQAaEakrxk6dRhiLYnaBjQis4MdWa3b3jtU31bGZYr4ApZvhJNrJrFCLn1qQnBDAhKi9AcDQm
	VDpNUpvYVkmlkCrNImvWmhMhbWTp1cfDUMYGVmfa6jcbwYXXkPCAvGEE44GNxhZeWO+JJKkWNqS
	hYnitXTKdxhQHykwZ3obdFbB+5USKU1wXBBg71Q7PaFFIA938KsU4QIGaOwqYEmp5tKZdGa5oID
	XndWneWEfsbkup4VdjoiczNtzKL+PRPWzNKPL0krYoaL3dfLjVstqRePWKe5KLeBNYrFSZB/IoL
	nzCbmMSDn/X06mDmaxNeDtVYvQXmvIxUhO+rvX3lkQNuGaD1sXhv8LbEbPM36QBzC+C92CrV7SF
	XDqCc=
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr173741606d6.0.1771411327312;
        Wed, 18 Feb 2026 02:42:07 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr173741416d6.0.1771411326901;
        Wed, 18 Feb 2026 02:42:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e390bsm2923880a12.17.2026.02.18.02.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 02:42:06 -0800 (PST)
Message-ID: <b96b9752-6432-419f-b49b-a34416e691a8@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 11:42:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: add device tree for SDM845-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-4-866f1965fef7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217-sdm845-hdk-v1-4-866f1965fef7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _CG4KWFBnbIhEndG6_7u_W7j1-LuR-II
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=69959780 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-UWIQ00ppj3yYQeD8CsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: _CG4KWFBnbIhEndG6_7u_W7j1-LuR-II
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5NSBTYWx0ZWRfX95etTBvL1U75
 sFIsF6ZhR0PE45+7/dm3EXUTNaY3nEb39xuReA0k1/cV1W5zLR8KBD9PEiaETaFzhbQRXb5SVGI
 CyS7aTbJfOEXA8Rfth6NoRDfawIeBmqEiainV7h2odMTxxJn8rjeHKFKssB0v+cEdEO1a1YJl9Y
 WUuoPa1yWQleZ+f+W5YejT9oAvpqPtU0QCkBbdHUMLrIDJPPY9cddV+fDw6khJO+qPknbtdPvoL
 HuOsLfnqD9YIJXfjPUZ8mcVzHeawoD/EIKORfWg3DW6AORZW2qgazRu+p0JRPxsqOQt8m+P6HPc
 Bnm22dJxyQuGhhUNc0QlxMq/0JbY7I70ZOmsjbDPstri0XA2hPC6nC+D7lR8rM+j2KTau5ACH0D
 cT/Cp8NH0nrzSDtZ95Tm3MX2WN22pQgBVs/pu2bExHlD1P8Z8ueOSsrkyZOn5LmLQcL7EWDTJNC
 uWMunnkDRrbxZr3xhHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180095

On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> Add device tree for the Qualcomm / Lantronix SDM845 HDK. It is the
> development platform using the modem-less (SDA845) SoC, optional onboard
> DSI panel and a rich set of connectors.
> 
> Working:
> - HDMI display
> - uSD, UFS, USB
> - DSPs, WiFi, BT
> - Buttons, LEDs
> 
> Not working or not tested:
> - DisplayPort - TCPM not supported for this PMIC
> - WiGig - requires power sequencing driver, doesn't work with the
>   current in-kernel driver
> - Audio
> - FingerPrint
> - USIM
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&home_pin_a>, <&vol_up_pin_a>;

property-n
property-names

in this order, file-wide, please

[...]

> +&cluster_sleep_0 {
> +	/* default, 0x4100c244, kills the board */
> +	arm,psci-suspend-param = <0x41008244>;
> +};

Does crashdump say anything interesting?

[...]

> +&mdss_dsi1_phy {
> +	vdds-supply = <&vreg_s6a_0p8>;
> +	status = "okay";

Let's uniformly keep a \n above 'status'

[...]

> +&pm8998_gpios {
> +	home_pin_a: home-active-state {
> +		pins = "gpio6";

gpio5 here

[...]

> +&pmi8998_lpg {
> +	status = "okay";
> +
> +	qcom,power-source = <1>;
> +
> +	led@3 {
> +		reg = <3>;
> +		color = <LED_COLOR_ID_BLUE>;
> +		function = LED_FUNCTION_BLUETOOTH;
> +		linux,default-trigger = "bluetooth-power";
> +	};
> +
> +	led@4 {
> +		reg = <4>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_HEARTBEAT;
> +		linux,default-trigger = "heartbeat";
> +		function-enumerator = <2>;

function-enumerators only seem necessary when the same color&func
combo is registered multiple times

> +	};
> +
> +	led@5 {
> +		reg = <5>;
> +		color = <LED_COLOR_ID_RED>;
> +		function = LED_FUNCTION_INDICATOR;
> +		function-enumerator = <1>;

panic-indicator?

> +	};
> +};
> +
> +&pmi8998_wled {
> +	status = "disabled";
> +};

It's already disabled

> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	status = "okay";

last, please (there's more occurences below)


> +	pcie0_default_state: pcie0-default-state {
> +		clkreq-pins {
> +			pins = "gpio36";
> +			function = "pci_e0";
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio35";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;

bias-disable?

Konrad
