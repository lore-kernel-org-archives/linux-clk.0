Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C7222D7D
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028257; cv=none; b=ank07DjlD6mcYppC6IoB4Qbrv9236Jhijb4h8KEC6ccD3TZqzhV3r3zfV52U+mshE85EeR6XaDjJ5qsZo9r6AMndwXD6qPvofwttsuqw8CvTvv0gh/yqposrab2fDiY4bfvNhyUGzlHbSFffy9kpAWdr6J4/iDIiouqYmvokiDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028257; c=relaxed/simple;
	bh=LAImW8keKIcsYczLYvrP823eM09hnL8gURaaiPO6pkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T52UfB3GyBgEGgVYr9t1eLyna1zUh+b2GSNd0zjq7V2XAiEbJ3KtncqMkxCjtrXpv0vMtj6i91tvv3O5b1AceE4tQi0b4IdJXi5rN7Cp1cCKm0I+GDpIv4mzsGJGCf2LDyUvwK59aoL6/gUWMO12kRRA5XQ6SdXjzlQwSOqLoZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUBY+IGe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUBY+IGe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC9kdmn030156
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 18:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZJ2HdatxlZ4xVf47i0ZPAbi74LzeVefsJXaq3wgFRc=; b=YUBY+IGec3ZLOvQ1
	G/SZkp/2D3R6MR/lDdlYxFypRBUZS52XJ6f+9fUTkYMPUiNTDGTXZVmPXXSj3YAc
	26M531FE2jJhkt5rizqmdPjW4MxL4ps/pseCVBfC9PZ/DpuN7kiAsn/FfgvLBStQ
	VGg9o8jnZEv0u2iEU/th9mBMH1sWniV5TFOLraIRtLn5aMYadzIB9V2jnYHUq/T7
	vo3mZHbRo8FNX5okey5ZtO54agIocUSy1ZskorpFdIyXBMpexeKnXHXakqUpgYt4
	1o4t6E3Src3plWSxGfJFdsDE1QcE/5m8BiPfh/UcjkpKQTnifeiVf4vuFQp2a9J/
	FqNuXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgehdk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 18:30:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46745a07381so1828221cf.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 10:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028253; x=1734633053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZJ2HdatxlZ4xVf47i0ZPAbi74LzeVefsJXaq3wgFRc=;
        b=lAyB9pY8qDSg5mpBzWmhCvD8ot+LIOwoA4a362sdXb/t4BEWDAE/jh6rJDsfK0V3Xq
         yANBK1TyRyiVBkd4XXoz3fjIcproCslVD+wF0QvD6vJ61zFVFQ+nak5WD4HlmNC/WCh8
         LaDb7m69cC+3j5ES+JAdCa3xnEskN5SfvbziTbaHUAszlI9XfqUWDanmtq1Vlf6oP2IZ
         vYuZrIIzoy7hNLxygsbx5N1T4HlvGeeq7dkySXEksvY1fQCM0OzED0yzCVD/sGL3ePZ4
         dCghTIr/5U3Ells+wkpxGiAVYFtICi0PFk6O9RJmh0dNVTiYJbxfOt13JRgYgIZpEm2H
         reIA==
X-Forwarded-Encrypted: i=1; AJvYcCX8J2W4/BzNG8jrNJHT0/WWZ2RfnZ98+/ubUjqU5hAMivHjqLMIuZ0yenPs8IQyOLVBQ+XxQV/fHTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbyykDIC/TF5n4SEhS9W27TeoGuFyk/C6GcBx0cyZsXhOAYe6
	+/mxwKoUAQ50ZO52X+XlrSQoPjA0ZvBXyZWflpYtz9aHhd6okQoejsAUotgVhfMYQ4MxC2yh1Wz
	oSwoWlEVvjWkG114+RA1k3PVWxy5wqVReQFwLlqErgmTpj8VbPvNli8oeZg3TyvqT3gA=
X-Gm-Gg: ASbGncunljEvk82P+IWSg/v3KuLevmL8fOqaRzh/SEhwHwFJ44shY5Vc5bWjP6pALHu
	Y057KqEJ98wmokq8vdQz/PdZdEJ7/OpBHI7xZxrZhJZ/osvSB+yrygeZQmfr7FvAuzFIDk1JGjK
	rcpctpk8d9O3UXRGUIlH81BUF7zglXmL582by004YHlSvb2kS3oIFYhHS1Nl35hMk7uN73iyhts
	9H0B+Nm25owuUcn5yt+vxb6jGkVt0eLwSGbwY5URwiv6p/i8ri159+K5LzPRtfzuYdGiingP85C
	FI1BFpGW4CqFONtUCVUvAx8bMvyP5Jd8D7YEGg==
X-Received: by 2002:a05:622a:a:b0:464:9faf:664b with SMTP id d75a77b69052e-467a14cfd41mr6750051cf.2.1734028253380;
        Thu, 12 Dec 2024 10:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBmWYzkqDM9wVygpP6+khZ5CMjiaMqbQrDeOxY/wvNHDdoJFd31XJ/C25DP1Iw/uEBcEYMXA==
X-Received: by 2002:a05:622a:a:b0:464:9faf:664b with SMTP id d75a77b69052e-467a14cfd41mr6749831cf.2.1734028253012;
        Thu, 12 Dec 2024 10:30:53 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69c3512f4sm480672266b.2.2024.12.12.10.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:30:52 -0800 (PST)
Message-ID: <7f0f2ad6-7895-46f8-8f80-0375dde2e763@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-2-a5cfe09de485@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-2-a5cfe09de485@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h-wlOB4ndJzcuqMoPxzCKrVqOP4ZeicY
X-Proofpoint-ORIG-GUID: h-wlOB4ndJzcuqMoPxzCKrVqOP4ZeicY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120133

On 7.11.2024 10:50 AM, Luo Jie wrote:
> The CMN PLL clock controller supplies clocks to the hardware
> blocks that together make up the Ethernet function on Qualcomm
> IPQ SoCs and to GCC. The driver is initially supported for
> IPQ9574 SoC.
> 
> The CMN PLL clock controller expects a reference input clock
> from the on-board Wi-Fi block acting as clock source. The input
> reference clock needs to be configured to one of the supported
> clock rates.
> 
> The controller supplies a number of fixed-rate output clocks.
> For the IPQ9574, there is one output clock of 353 MHZ to PPE
> (Packet Process Engine) hardware block, three 50 MHZ output
> clocks and an additional 25 MHZ output clock supplied to the
> connected Ethernet devices. The PLL also supplies a 24 MHZ
> clock as XO and a 32 KHZ sleep clock to GCC, and one 31.25
> MHZ clock to PCS.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

[...]

> +	/* Enable PLL locked detect. */
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_CTRL,
> +				 CMN_PLL_CTRL_LOCK_DETECT_EN,
> +				 CMN_PLL_CTRL_LOCK_DETECT_EN);
> +	if (ret)

you can streamline these with regmap_set/clear_bits

> +		return ret;
> +
> +	/*
> +	 * Reset the CMN PLL block to ensure the updated configurations
> +	 * take effect.
> +	 */
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
> +				 CMN_ANA_EN_SW_RSTN, 0);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(1000, 1200);
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
> +				 CMN_ANA_EN_SW_RSTN, CMN_ANA_EN_SW_RSTN);
> +	if (ret)
> +		return ret;
> +
> +	/* Stability check of CMN PLL output clocks. */
> +	return regmap_read_poll_timeout(cmn_pll->regmap, CMN_PLL_LOCKED, val,
> +					(val & CMN_PLL_CLKS_LOCKED),
> +					100, 100 * USEC_PER_MSEC);
> +}

[...]

> +static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * To access the CMN PLL registers, the GCC AHB & SYSY clocks

SYS?

Konrad
