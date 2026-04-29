Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7FF3859F4
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477034; cv=none; b=jNZaYwHB/f8rKz+oD+hYEQUrz+tSfV9C/wlmtolNIW6qK/XOQO2xI0OI2BvC9YdJP6Le6x7uToe/a51CBHt9tJA3WUcaQR7eGau0+75fHI92IefA8bhCj6fQfPZ9yZoolncBy2FnoSCrMPN6TrBDRLqnwP3DVaXtDJ284iqY5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477034; c=relaxed/simple;
	bh=ZcFypg/iBdGOtUJoMDDi0uJSfpc3s+lAHkhP9pI2G5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGBs4+aZwT74iPJoVTqXff+o7B1FDL96xh14f5LObThbmDH60VeUHXIqXFI8kAm+Kzns29qYV+ZhaTWM6Fz7jAxqLWv0IA81S8h3wJz0bFAHInIJpzFSzDIrdM6r/e3izBzLhvXQ4ll2rQZYBzb9oGz9cFeyn1wUA3ghvRLAKl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5m88xAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIGeSk0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5m88xAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIGeSk0v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFSq2V1641536
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=; b=B5m88xAsD6DN57Ez
	E7h6ycOi5W4o29U50EqZau+EFOpZBC2j9Wue2s8g0/W2viCCnwlRfBKBAbrZ+AOd
	gE/wtdb+7byiot1ef5T2XCYAK7h3fF044Fuqnz0bawQcXb5knbDOH42lWcTKkno9
	EPe6M7vuUoISg5qxLb4B268EI3wBrGBT4w8p3ksz0TjjwZ6CajvwGnMnObvg0Yec
	WNvsWJt/7gxUi0kdHXMQ4UQrS7mtx3AERg4E44ITuoJlBGQduTBWdVBstA19JsEG
	f5OAz8rdV2Xa5pvCfPlqUzlIYSa2Y0d04bqzLEfbi68V3PIBv4C3FRMRv+Cx79sx
	b4MymA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj827mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:37:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso16142328a91.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777477030; x=1778081830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=;
        b=iIGeSk0v1nQ0GLNmz3k1j0ifvnYahfucy5Zx9G7veg639h8luBIpltBgRN3VMCbUBf
         UWtSAWC6EO3KyOA0ykeZBpWuaORfkTXNoB0QG8EgEDSg4ahNZtQf0cS+v/dKkSvbHQmS
         vynhmyihqUen+QopX6AKigLUu5dlv/spmPALIghETdD3ysIGNPNnJWvBpwTDC0catfsA
         XqI3fi8XihsiQlGYa+Rn4VmWOhn/td3/xSuBge6TszA2RyfGOboI7Ompg9IaKXH+aHEp
         k2EPzjHI5QQAW0GvajSR0iSi5kRfYZDO55KO3mcg+TWX54Q+cXq57L7gxzEU7G4PDmzW
         sP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477030; x=1778081830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=;
        b=X9zLkwnDVQoK/ZW+npbMNm9rGRMZ3hjigctn+26+KFLLbwPu9SUgsAiBrq0C5gWiTQ
         VY1kKNLelnMHHffHnlEy6FBZ6u22rVfMYJjx1aR+lDLABW42wG329UKim8X/FFQPxMEx
         58Iz2jJwyQC00AG6GT3OUljh3KLj46/Hui+Hw9j3x3uH5B3IvT4Igb34q8YR/v5FuM9f
         quJaIpyLRYe8qI45TCd4HADFL+kzIlIdCqW7iAnce02MpLZ8QTGvKvQw22F0wi56/39E
         PEf0nhGoBXgNGuZGBXSwyVkd36B5jVRP3sDSDgkpf8t+dH20eqzwbxl2A87KOQSwsL+k
         ng9w==
X-Forwarded-Encrypted: i=1; AFNElJ/HtRLxZPN7pzJl3uapUzfcanmghcUPXy+rUs6CAok+XbwEs+LNlIWxPMvFxTDKQ9SKuiD6HEFcLZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmh8G13Cypy45ItlkphxmW0vfi6yW2hT1l6nTSlbnrMGfmbuMt
	PXgQNzDV+ATou1yYEVU0T1/Un+lLIbzm4k9tfQOpAD2PevT0ZsqWCZ6IaPKzm21WFoYJGKeudiZ
	B7cFnCHO6Iig+mk3E5GtwmdAKQCOIjxvY0I2ZSq8T/fFrsUnO2BLaaaCpGgYHwJE=
X-Gm-Gg: AeBDietb6n9L5PDL+PSzwQWbcsxLuRaViWmvfoLjQmTMex1AH3YW8ebfY5Yrm898KT+
	k/o536/xBYRrgEMl/4FWHPG07TPykxkH3mowGhpk8rfaDTQVlmyq85HMkpt16nOtuTQeDORSGSa
	zz0G2L0VPHL8ZCF2C2fswoxxBHhrfty29269GRRW6skWJy1Il7G/5v4fW2cKeefBg+MjPQO0Xdo
	VLaQtu09Y7s8aT6kI79Kw+Wkjn5aUFjxas8TRHg1SUKlPUz4nC6V2q+4MEFtG3G9xsl34+QgSaD
	XGnpKTO1QVutyCtF4dIY3RuBZh7Sqv3trCuQ4sz+WRfYWDnKLD1GQZc/w6nH/y4I8Yw6feTUCgH
	uD0nN42zkuA2dVBaL4CaKLU35RS7Y5SrbkDaaMkEin0KoIZj1iiURn65iDiXmkQ5yzGLheiGJu6
	oH
X-Received: by 2002:a05:6a21:6da7:b0:398:b178:a53f with SMTP id adf61e73a8af0-3a3af584611mr5355588637.40.1777477030142;
        Wed, 29 Apr 2026 08:37:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da7:b0:398:b178:a53f with SMTP id adf61e73a8af0-3a3af584611mr5355561637.40.1777477029676;
        Wed, 29 Apr 2026 08:37:09 -0700 (PDT)
Received: from [10.48.22.70] ([106.192.167.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506e51sm2868800a12.26.2026.04.29.08.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:37:08 -0700 (PDT)
Message-ID: <5e2a4d55-49a2-4813-b497-367487174e64@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 21:07:03 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
 <20260429-ipq9650_boot_to_shell-v2-4-9b0dc3d1f3a8@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260429-ipq9650_boot_to_shell-v2-4-9b0dc3d1f3a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f02nc2rm9decRioRsnNDhRLybjkAqunv
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f225a7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=zcCrjwgepsyxNXemSX8evA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=LsfjrspxSUTcLO_nfy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: f02nc2rm9decRioRsnNDhRLybjkAqunv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NyBTYWx0ZWRfXzXfft5phA+Rw
 kKPjHhCcVGfdkuAuMPfjwOSnKMHqZmysWT7tUlyT9MzZmPwq/q6EbPQmd1g4GshST4UU0zXrzUE
 IMJN8bkX8/5fAVjGpgeaIa51y/1t7gSPQ0jp4IpH1XtTa3rcYgRSh/7uAk+qEl8Wu+LgQWkf7dN
 2oCphUquuWGQoVP3UII0jREP/lLQfbEFn/8vXKwbTtYGGU1PGgFOD2VltDeq1fTkhQ9PPw60IqF
 vtLrlKOpVkDzEJa0mnIBW7+eCuggQzP1onILo8xHVpDZ4QT+Cp5xYroY5sWxq01bynOFiFcM9yP
 bHtJULe6wOWEDeIRMcROVGDQlnKt4nygTTJ+nL20l5lFJPn3u/ZbQHzpgZCJwAJMG4CDFzcLT1m
 3aYgQC67wn5vvrbwz2d1pqknp0LTNpEBZKh//nuAMgDFp4hSfIz0onNGmrO/h6twn5ZjDaDtZiD
 IN9lbw6Rx/4YrIl3rBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290157


On 4/29/2026 8:54 PM, Kathiravan Thirumoorthy wrote:
> +		qupv3: geniqup@1ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x01ac0000 0x0 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
> +				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			uart1: serial@1a98000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x01a98000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH 0>;
> +				status = "disabled";

Sorry,  I was careful enough but still missed the \n. Will take care of 
this in next spin along with if any other comments. If not, can I take 
this up in the next set of series?

> +			};
> +		};
