Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C65C311C05
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597160; cv=none; b=L9b43ovD+uqE5zT5PxBeN3u2Ta6/P8yA2yi28epGfMEHj7ojDOiL8mg3uxA7j6d96A/ZkcL2T2o8rzreLNC5anojL6LZIdv1XMgDWiAXgwB/BfUdAwsy10fcNLQxsAF1V0WMFRqILfTFqDGArGlt3X4TkhKqrPAs+H9Wi8p5GEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597160; c=relaxed/simple;
	bh=LJIjxIwLC2/Z7nIDj8v8nVaC/uJg9U2BzThmKdqEf7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmaoVFU1J5IJFVnh0fDcX/P8Rywj+Ik6cbIPu7ytZ8QkZBSscolGgVMWkUFZM46/ZGb6Z52izEFFZnsVTHHKqSwP1cG/nZGksIFNtHVpymyDBW1NGpiaThtJNYWnUpcyeTgZ2mj5PN6BrhtQJ6fkw49eAK/y1z30P2rPWvFG/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUxGGWty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGmK0ZcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUxGGWty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGmK0ZcR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19MCft3361771
	for <linux-clk@vger.kernel.org>; Mon, 1 Dec 2025 13:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKjoTfmK5CNT1ZxbXv4duZphnPk0sq4/C0t8cEXPU+Q=; b=WUxGGWty6vdy17gn
	NFfDSGT3YT8lS4DjT9HIbzpYLLKkqgK+TJidMYT+MAHV/7c5EnrsoUEocmD5DHOw
	2odreJDS9aDoJgH8GCXCDGPTdWOi+8iXteglDSQh5h1Hg8emrLoX4umN4HTraD9I
	K3pVEdBkM+dxrdZTpxAbD4yrcCepz19IIUFn3VmUstCNceyEgelPsr8h/YuP7Lgy
	AbxtABKcoZwhaG6EwjBdOym3Xn2F6CK2b96t55wgTlijTUEZIredQlV09015+N+M
	WCqOLuqntQXMcxjyGcvz9D9YwSMRmZFGmXVo6kQrd4l03dYZpOJMbyPfH5e3pJnP
	6IhSvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8b00qup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 13:52:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso8218001cf.2
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 05:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764597156; x=1765201956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKjoTfmK5CNT1ZxbXv4duZphnPk0sq4/C0t8cEXPU+Q=;
        b=iGmK0ZcRDUhCfrjXb8N6+WBjG0FEbNN91S8T/PGazTOBu54dwNDL/WBdOMrfiku9Xp
         caZCSBt0hyGR+l5u26odbro3jLX0FILoPLNVF12NN/ryMP80Kq805leeK0xiXHfDvkBL
         yfsJxi/S8NqPa8zH7JD1PX4NbXMjPUWjkr72/WhKdUvwq/8fH8aOhZ1TUD+OOsmiWOaW
         +AA8yoIWU5mwr8r6kaIWMnOuZE6fq6uVue4Fa9RJHwNaAXMmxatApTztfvVnUBkw+T8z
         nlYXyyCC5mMNfpKv6CmAjMkM2COm7/SV6L6nObnUo3TZj3A3KOtX7uK2xmiYlRwa9IuO
         wL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764597156; x=1765201956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKjoTfmK5CNT1ZxbXv4duZphnPk0sq4/C0t8cEXPU+Q=;
        b=L3HkW0L5mrwTBX0JEPsh4ARLbG/yrcJt9GIvxCiHBd8eqMCY022E/XA+CtGxZQ2SdB
         OLgWQvMzQIdHAJizLKh1D5Ef5WNHHLdsWU6KT3FRp74Q+rF3JOTFJ2d1uQOTXr47FD6Z
         hJB0JROgULdk90zIJODi+34lnG+Q4RVCfex3e+cJIhiCYSMcfIoVCFjAGNL891cqOus1
         JrPbd/M/J5kNhRyvbg+Vcli1wq+ZdCuYmRisWrQCwS4MfCWCwxm1n7+3Wnooo+IwIPzd
         6gIaE35RcViGeu+kliwgZLHwurGtyAnLEgSpCDe9t4MB9ihjZ+O/feqo6gaeXWW1YW5p
         hXtg==
X-Forwarded-Encrypted: i=1; AJvYcCWFCc7Dhwn5sRKhSiC5z2XNB8Ek+3a+bIvAcunzk6vK03Ywg1SGuO6AYihifYN/Y13JQNm09lxM+KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA7uvNfehHGb6pVNtoOQQN5rZboi9A8HDrNUm0PxcR8q4XlOvh
	t0iyOkwKHESmvXojkTu8u/c1akrn7u0o3swdFV2V7LDBD+uwCBgDlAQnvIR3eBBvcfk6uzkfVUk
	YNbIJcXUhzQEOCD5mRa6gdLZ/ikurTbczy0ICL5N7OeEBsXefwMCuk4ekWv5P6Sc=
X-Gm-Gg: ASbGncu/TfhC2dxGkmWgVRLK0gqG54PvU5LUirrNTQrHXPVvyzB43J56Ie7tho+FAZY
	IiYYOCYP7CchexOtK+auTl/9NgnE3JjUqJ4wRKOirMyW86FJLMLJ9N9iehADkOl4OAkKtfnd1hI
	syWdK862XDXdLQBG75BGVE31jBi6x2oeGPLyBemzp21EeuSZ+TVZ4bEtRczhUuuA5mnEtDB0Mmx
	KRE/zau+9sqXrOFrKKjHncrznygYgHoOHK0oQ63AJGe7x1Li3oSbCvgP1viIxjZTjWaapNZs0cY
	z58+f1nn3NuRwZzMYbZ2/yakRNlIAYU+Zr/c9d7ugYfxwxaTOffZV7oYKu5LnHETHb3nkf/MPrY
	7QcIxjJb33teGY3bYIaf/nVN1zCwk5wxnIWrpjY5CgBRAO6xhF0KcvYWHX0OCVzZxKvM=
X-Received: by 2002:a05:622a:144d:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ee58930d72mr408054891cf.9.1764597156467;
        Mon, 01 Dec 2025 05:52:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZHK7kWIJ2QSOGzFsqFDmFbZyxcExJNrXPc3ZJA23eiE3fEzbc0O3NQFEGjJy6sHtib7FH6Q==
X-Received: by 2002:a05:622a:144d:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ee58930d72mr408054481cf.9.1764597156020;
        Mon, 01 Dec 2025 05:52:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a21cc9sm1218462566b.58.2025.12.01.05.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:52:35 -0800 (PST)
Message-ID: <11056c3c-452c-444e-84f2-318f9dec6831@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:52:32 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: ipq5332: Add CMN PLL node for networking
 hardware
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-4-55127ba85613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-4-55127ba85613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcKbdBQh c=1 sm=1 tr=0 ts=692d9da5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rMzbURfg88p6aAaFaPgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 6207mwr2Lfu-O9TdC3vGRXUJSxYNDmoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMyBTYWx0ZWRfXyaAwkTwx+rd9
 C4eEVaA38+C67L3CW11W9PD84QX0C90Ja6ev7RngZHrU7MlZPj/7lA+eo1hNvWlx5w4YMV0lngi
 zPi87mhd1ArxqaPW81lpSutTKZKoIUyFkj5jTkXEj4ooU8dDY6gTGLMGHqmZX0zX2uIgUwtgehA
 jHeDkm1RHgePvrUbzfOyU0Oqw0XnS6ujZnzF+NZAMi2Z2jCdarP5hzpeJq3c0XLWlJe4oMS+eSa
 WVFLs8c+9oYDNEwDHAYBL3X7/1TaKxsYfkeN1gNrk94WSxrBojuEvNCEIDK1cgnO2/d0xduMBXZ
 9AMOfamaVeA+CnxpSCEJvuKel63nwv/etJpf5mR9qL12mCKys7sdZ1rBtMyaQGiIAmiZcL/lpTI
 D47LeZctpqeO1fZWBKQFvwvOcXqvXQ==
X-Proofpoint-GUID: 6207mwr2Lfu-O9TdC3vGRXUJSxYNDmoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010113

On 11/28/25 9:40 AM, Luo Jie wrote:
> Add the CMN PLL node required for networking hardware operation on IPQ5332.
> The CMN PLL core runs at 6 GHz on this platform, differing from others like
> IPQ9574.
> 
> Configure the reference clock path where XO (48 MHz or 96 MHz) routes
> through the WiFi block's multiplier/divider to provide a stable 48 MHz
> reference to the CMN PLL.
> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)--> 48 MHZ to CMN PLL.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

[...]

> +		cmn_pll: clock-controller@9b000 {
> +			compatible = "qcom,ipq5332-cmn-pll";
> +			reg = <0x0009b000 0x800>;
> +			clocks = <&ref_48mhz_clk>,
> +				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
> +				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
> +			clock-names = "ref", "ahb", "sys";

1 a line, please

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
