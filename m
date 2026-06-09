Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8626F2B0
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011667; cv=none; b=ns0tBxndHouurYwtde1GpgFHyYrpbr0wHQOCpbZd6ZwKAXAyL8hBGjFSraPS8L06zHjCai1zlGb3WLkoNHz/t+eNwDNDM0PHqNwVZ964uuvEwyRfx8F59yet0rKgUb1pgsPyq+rThFhEJ0iso/tIzgrAMyWA/US7jkpqPe5Ouz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011667; c=relaxed/simple;
	bh=nhc7KCz+OiYOb+UWgD3CZUOWb1ZWdh52MnddLfgT8QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHRApScvtfZV3+69BlubZyi8Qu8HDe2Q1cS1lQZ89lbCAlnSACBWRK7uAF4J9ZLFJ/nIti8AtGu3ztODLzHUkoCDraln0CWvgNNXRaEfmxtC1VQRZSs9gO7k4VObaklmrd9nWe4KdB+0AHZ4lryJsG0mOMIXhKXFkRSmqdc5NMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMFXdbLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTePdh9t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMFXdbLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTePdh9t"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClV0N2706182
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 13:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=; b=kMFXdbLtYgXrT8sa
	NNtgbEqztvNikKrbSGT4KgTpkyEE377r12AZdx4Q4gsQ9HCCXamDs/AG84QjJu4V
	6xFT0nHSDSUy+vLhhmbsAaqM59S6nPCvKzPpxEqBObgMAtQmIxBs6CYwVTy9+f5C
	wAo/JWM0xpQkpr4C7y0l++x+aBadls/np1Uy3PWugi1p1IM9APCulfnJScl8VXyc
	Tpp4Zrvv2xXlXlu7RZ92dZScnEzC0Yvc1BUkPrFIbIhqt9X9c8GRw1zn+yDFDLvU
	ZHwg9QaVcws50w/cW1x2iH5rCiJIPJB5vcEDMfwwWKVR0HQoCQGJMf+rHbT/uBlO
	CU74GA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt195r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 13:27:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176891d0a9so14203301cf.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011664; x=1781616464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=;
        b=iTePdh9tlDtOHRYalu3pLZSDBKWbOqAiWVAc2XCvx7zaKbEIoRoMG3QpsMVYgNNYKL
         wUIYXmT68mINlil9dJOR4/Nn1OljEuv478z8RMj63sG/PmEC1ZTiySNvVuVzotVX5bBY
         0M0pMwZAbYUReEgT3Kcj2595liYE6YhtpsiVcmiiApdXlwvn6a5rxYFYZKyFPO+VfWbj
         WgrTdZ3Z4tzTtxDjXecWUMstVqH4YNPaq1ONCf+JsTSvTTiP9gZuno3p7Q0y7DbZGqUx
         136kvnonI76QVefg+mrufGeYnNCfY+GGkltsMXl2zo9Vio4ZNkdnhWUK1voA/0sEIGes
         hTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011664; x=1781616464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=;
        b=tP22y9nLFLlVF+basxO0dAZ7i6zdvGLwJOzgycjVMX7eWEnIKI/x+Pc2fUzS4+DKwO
         yY24vFUE1/XKZG3tfZDMWY8P0CZAlPFIyKa3jkjED8ugJVnus8Ceo4SGRJCDwHlMqUdF
         bpSdsEtd+W8nuVE+EPocytBZakF0dumsdNgA6diLrKNBoG9+lqpvSpG19/5wZYnu+nsP
         uH9a2tPvNlwLidLUJcLCgqsOan5M4JOsWkvJgqUP4bcvzHdaU82B5UHob+/F0cP8c77S
         OMkqOhL5yDS6tByoVCJ0rZ5PatZ4qPGI6+KVASdOb/uMrbjQrN/2RF5FxHQeFiGAiYqs
         Y/qg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZrNA80wYba/5SXijEL4oJHI45XEYJkLjow2xLU+G0OHrIucL6wg7rqH07FbP9dIKthzx7qJRhw9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyshJQE80KCDIeS3G0noOEfbP6tu+Lyq9ANUF7SfN5665X0YBj7
	aTebnn5G1ZJ0iZ4xNbvxLfjisVK9CYpjkP7b9eweyk2F0GHK4Z2JTae7spzNQbveuw5f8LuwYzx
	Eo8eDBO5+NzWuioPQHhxMtOUJQ3AFOx6NGDEaG2vjYoKe9VEzvfnbq25dhNsNoPgnaN/2bc4=
X-Gm-Gg: Acq92OGo2cxiYhlD1l4vi6uw4Ltfd4rjdLHNlhYeGdHl7b6HFR9MNZgWkKFmqZgI4pV
	oFNVqWIB74jSBHuobh1igKr72XVSvhS99zUscyDeyUylk53V74QwisMVNVrPCYiyFUoR/Lvgf4o
	G8PiS8/Z4lYazyQvo9KqgXXYzNg1FFLDz8OMHT0K5a+sFw0IXVGHy1Od3ekW7CRg4HaFTHxaoT0
	f140TG7lacnK/++6G2qZ2OFmwI+QLAvWlPqtBCLtOFghhoDyXXxaR8nDcinw5/CcFpiSAq/Cjy2
	tT1kjYDC7quYnc3ep3spTp5hOqcQq44tU0xGRvUKJqMzl6YZOWIFCqc2kyOzG2bRc+TvJEHxQxH
	MqIG356sWTljijUwfv1tvsBRqdTT7sWN+xxo85Sxsx8NuGiJA+BQzsT2k
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr190603721cf.6.1781011663642;
        Tue, 09 Jun 2026 06:27:43 -0700 (PDT)
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr190602771cf.6.1781011662748;
        Tue, 09 Jun 2026 06:27:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1058581866b.55.2026.06.09.06.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:27:41 -0700 (PDT)
Message-ID: <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9tvm4M9Dge8lndLIhasvTKKJC8wreAF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX2UpP3IpdMf0X
 J373/Gxu3NFVnfh0tTPAKLAS3vxs8GbbPdWP0lHvobVt+xqJTJnIh1Fa6ANcJneFgYCzJq6Okxx
 bh0Mcm7zx4RezqN3UXDpBw97+7Dpg/MqYyP1xllGkQfbLnbZ0Vsq0DpBPH+XvjDUPqrPVrolzy+
 H+BbER2oqmL6FEfqyHR180U90vxGxvIEwAm9m5p5/YHoTww4lEA9jfmLsBrrO/uPBzvQlkj43TA
 oKaG4tAuu1VZiQPfJjJZxrK/KPcz0ribiALGyeHHbhXFnh0NFoHz5BmbVLfOFBhEZ/ehLvZ11Lr
 +ITFK/q9rLhLirOgDw66zmwAG3sotvsUMCOs5az8Rzt0oZF9P37sQ6DPJchsYSnekkM13KHw7i6
 vz7SzT367IKW9nyQXCQUCkAPfvopMymBwtbDPZSj2skgjqjTEK4YPdeCxfgPbsah4Wu4qiTgcJd
 /CvHUKW51L2OUkdC32A==
X-Proofpoint-GUID: 9tvm4M9Dge8lndLIhasvTKKJC8wreAF_
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a2814d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZVpGCM6XPQlVWg26268A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add the gp_mn pin mux function to the TLMM pin controllers for the
> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
> divider clock output on a dedicated GPIO pin, allowing the clock signal
> to be routed externally.
> 
> - QCS8300: gpio32
> - SA8775P: gpio35
> - SC7280:  gpio60

With the changes split into separate commits for each platform:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
