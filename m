Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE4621D657
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192920; cv=none; b=nl7t+hYVwpiBM7KKdEZOlUQy8+b2Wm3Ocv5JFERVa+Oi6n1FmJByylx60VAwikpl+dewMzJqT2T3cS0ZkyQ92MX71rtXKdaPO2rjTCIXciklVktimZ97JvMwXwjRjp5v+QXiCDH30MuGU8dS6HffSVMnkL4A3RLHYw0xv69KPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192920; c=relaxed/simple;
	bh=4L7ZmfnqHQ4inB9Z+gpgPm0EocNmPhoPmdAappwqQLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjQ6GCo1ktwvdaW8cKSa4Xbl+XYDEqzeoXreUR7grlHUALZGuSYgPYNk4GKJJJMueIbyhR/p86Ul3r54FCpaHenQOVLvZCVRisZuHMrdzMyUWrD8gzIyQWnvYqkPV78Vb/kSh5S4Vftoc7rleeEiYdYTFqFwaLBddieFqyO8YPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJVqyaZT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJVqyaZT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HG1vRm002343
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nKRF51A7sYkC6yHPM9M+rXSCUKjxjSo4paW2jb4gpg=; b=pJVqyaZT04BALCfK
	P0i6usbi1PTwbBgmGJO3eC49KBUjh2aQmLTpP3p5pfEJi7M+V+IVkTxly93ByOve
	CVKIyCocg54yWdaOCYGDXMRrr3IvPQihqUNsVFpPiflKreFL9y9MHelmWOvxaJNB
	8qpSD9PuB8JToqOPgN9nELT11AFP0K1Ggznc1CEqflh4SKEEZNdwSazzN66kMxVR
	ZRjj4ET/+ZEK65jFP6rh5lrEYx4ktkW7j8eeXbvzm0jFTZqVxw6gy+x6StLlT7QX
	F4f6UFlv8IM+LFPx8TiA/rFLGLttpcKT84Ic0LQWPcJ4T6UnQKEXcQRXOrJ0i5bI
	meLLQw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xyp7q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:21:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbe149b1cfso3168386d6.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 12:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729192913; x=1729797713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nKRF51A7sYkC6yHPM9M+rXSCUKjxjSo4paW2jb4gpg=;
        b=R5+yKPVKgmpBNj54nKkJJzgZd6JIItPuoqPXsfTwtRVgMi15tOM7JKBnwGa44035VZ
         kpP/Wmww41cHTBfdMqOghyhR/I2+C0FwW2hjDwnrBUJY9F0GWkS1KncRjUJHjlLF4oUw
         UNrij1HoKkCBcEIoisPbxUEfEELkSnv27RkF0AqkWLeZkxNX7w60iuDMagIIHLJGHcaa
         XKjFOMCqEMGORVXCYgAf8alWIS9uh640MbXIAzW7SjY3Wh+wfXaXQt3ZDgiI8xEzMUCW
         Y+nf9u209BSiy6t+8jfDR5FT2yIhKBgM79AAO3HfafMshuYyuEogRKhUyGogBG694hM9
         BIwg==
X-Forwarded-Encrypted: i=1; AJvYcCVSAW2rVO0aA+XW/14VhpGj+XUz61HKx20quYZM7ybALWgi+lEY+RiASGiJ3QHm6lTc6hCw972G8Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypGtvwZ8njaZjfW6KBtIMHjdAy6Zv6pUghM1wEWCWLTP6prWic
	re6LpxYuP2LKu8r1IPoHreC+H5fPOYLnbnyEiEvTMYpRLvsl6zaLfqoaaZDuy0YoOMUNobT2q2Q
	Rke9KoS54NwP4kzu4w82UJ8/BlQqq3CAF+anODBM9/U9snfHOh1P6RKMGdls=
X-Received: by 2002:ad4:5743:0:b0:6c5:3338:2503 with SMTP id 6a1803df08f44-6cc91b8acacmr3543346d6.11.1729192913144;
        Thu, 17 Oct 2024 12:21:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHKkijEbj51hUF0cpr/kUmjSFIVMk5Zw0M37NQQx5G9I5J8ivHoYin+f2I9l4ksy2bbLsDqA==
X-Received: by 2002:ad4:5743:0:b0:6c5:3338:2503 with SMTP id 6a1803df08f44-6cc91b8acacmr3543216d6.11.1729192912692;
        Thu, 17 Oct 2024 12:21:52 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bf621csm1709966b.165.2024.10.17.12.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 12:21:52 -0700 (PDT)
Message-ID: <24b13e3c-5c05-4697-9a66-636a8ef46aab@oss.qualcomm.com>
Date: Thu, 17 Oct 2024 21:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] clk: qcom: add SAR2130P GPU Clock Controller
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-14-f75e740f0a8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241017-sar2130p-clocks-v1-14-f75e740f0a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4wnk2OAI7eC4HIgY6G1A37FjQhNomkFU
X-Proofpoint-ORIG-GUID: 4wnk2OAI7eC4HIgY6G1A37FjQhNomkFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170130

On 17.10.2024 6:57 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add support for the GPU Clock Controller as used on the SAR2130P and
> SAR1130P platforms.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +
> +static int gpu_cc_sar2130p_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = qcom_cc_map(pdev, &gpu_cc_sar2130p_desc);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Couldn't map GPU_CC\n");
> +
> +	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
> +
> +	ret = qcom_cc_really_probe(dev, &gpu_cc_sar2130p_desc, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register GPU_CC\n");
> +
> +	return ret;

return qcom_cc_really_probe without printing

Konrad
