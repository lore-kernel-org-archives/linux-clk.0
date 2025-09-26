Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDBB286D46
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870574; cv=none; b=nAinHiVdnSeSl7Q8YNqsAPW07yT3DoxZyqYn2oA2331YM5KL4Zl/FBZ30uHUmpZaBho2R8NsH7OU5gBAlhelm3CZFGuiVSJ2R6ElwHFuArzk9DQlHwU4sfZJw96fioOUa8DBVeUlcBVQ1j4n9wSizoiG9PcchcDEV+O2IB4o888=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870574; c=relaxed/simple;
	bh=TgPzTPR+Fe7zC5llvHWJQYlWmW4c4SjRxa4PU0/hZn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCXzQIoj6zDGB3h9H7dZkWHo0Xupc0vREnNAKl+UKL4nuN8qRMM6lFjeWK3vfcAyuMkNlHW3giK4mjdyaMgnb4l64eJ2vsUEOHTgyflPh/X9l8W0VuZp1z8AzaFdubfdk1eC4bjm1Mjlu9gKijIcx6PXp+7qUBr32czM1IDA88E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3qVcvXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3qVcvXY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUmLj024922
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=; b=J3qVcvXYlUuoRVqy
	lRjFU5FuKBu0X9L67bFI4kTqDbMAJtUQFL5w7b0crDrJwycWq4V0hzLQ3S3W9wFH
	UF+MnnXfmDNDWtt1o235ygNStK1U5hD42Y6fBUvampYbuMB+WtKMHWnhVhIcEzLH
	yyV3FK5FfJNfT9zGf/+7dwaaRZCHmwrF40yLxKZ1/Xppj3lCe5c5/5FtzD7mc8gr
	cW9Mex9W/kS1uvPV6aMZz/HHBqrjDBMj4qw7VRGvOvpy9FvppBLFoc9DMSkgnizo
	Ho65NtBMoHW6X8Ie8sprgpmS5ImuV9Gt9PDpYv6ccm0UNajT+6Ofmc6ALRfjQ4s7
	sOTCfw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34hscv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:09:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458345f5dso28064855ad.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 00:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870570; x=1759475370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=;
        b=no/V6cLelX/ozQdumpH/p4c6xk7M9FqSIRT19FCNP8sf+vbQAuh3TQ+1zl96Wlh0kr
         ObnP0DJMQwdZ2xPcHdcDv6JjRSV0r5Qh3aW879kH+wLDQTdX2deIfSpWtRb06Hzp5ZwZ
         9GaAzjPSSIxQV51IHP2XAg/cNgoqsh33CsdqHVT87mNLiOqr5SoWLSfB/B+tBdt2IlRG
         AM1bUVPpVNSH7oJ7i76EDEHErkA2GxYf6Oh5H7x0NoDTX7SnB0OeYAtRBGvyalN0Px2m
         NlueAUb+gw2RL3KFFiAM7w5//iMMXhC1GxXn2kGhqzXl2Onuum8I92iYJE4bwoHIudam
         5iPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlMsZaUwxDZiQd345udcDvf31bgxApU4YaHS+0gr3ySJYh9ISelifGPo2L9++srJpHCdpeeBoVtX4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ltPjVLcDD0vNCuT/fdfF3xZc4ylkBoFJaC9CpgqdTiB2GqDa
	0Uw6vhX4XuC9bDkIhn/6Vi+EqtjrDY6roxUsbkKBTXiFOEKzgX3qxrMHAuHOzGeYZy/+iBj30++
	JnnIccADEFsHl5wOEYoBBLkQn41F0uxlPycx33oyKXF4wc2MOvYHdUUPQuXkfcgI=
X-Gm-Gg: ASbGncthFYYgFFCbc0KxMzK7HDiuGtfgpVBRKjD6IPmU2/vgVouiB/DghkPkZ+PDjhf
	k7m6bS0Esqh5gUt7LKRJ1eHZBLvV9EFH7WM2Tsg8jx7TWAH1nBuEd7LQUPUaUcLoJdHioHnpIm9
	3FaLXYVSqmxxPgXn0orVuKV6sL0+Mut1yCeIyItdOIKUvj2acdJmfWI2znZ84bRU5J7pZ2X5WHE
	tabkkaAAYcz/dctUnNBkSfPyX7VdpDIJPqRXqXkRgCHNIv22j1wlbE/n/VZPZDZBE8J5HasSNf0
	srGyFvfajDBYOxH3bNJ9NHS9ws0MOM3yHSi9WtQ8oLgiS5+hM9uKbwRfrJVT/vKN6u17
X-Received: by 2002:a17:903:32ce:b0:267:c984:8d9f with SMTP id d9443c01a7336-27ed4a0dba3mr75468915ad.24.1758870570332;
        Fri, 26 Sep 2025 00:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqHGrxe8xhPkP6vuNLzQiWx+Rm84GN1CL+4+QaWX56Yg2h/x7LJeftQZFHKJ2KkwePgdl9Uw==
X-Received: by 2002:a17:903:32ce:b0:267:c984:8d9f with SMTP id d9443c01a7336-27ed4a0dba3mr75468445ad.24.1758870569854;
        Fri, 26 Sep 2025 00:09:29 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac94ffsm44250615ad.136.2025.09.26.00.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:09:29 -0700 (PDT)
Message-ID: <b0541564-3ff2-4cfb-84ff-1d3d59449f86@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:39:21 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: clock: qcom: Add support for CAMCC for
 Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
 <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
 <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
 <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX+6h+wjoyb9np
 vrMDzOcstdFnNehzMGQH5UUmOExkh7yRmV6al8pFcbqncRFj4zLPf3/P4yUDXqWE5AdaH69w6ij
 EjR4yQel/jmm06VL0QYSqiNb1S07Ah5jY2RVHoixPe9iNV8ULDd2Fy3I6POnRE5BaH+7kJWGXjr
 DGoaK3AcpDdwLAlTq0kSB6/WQ04BgYejM0n+U8C260ch9FT8GTIOWfz9HSNwRzYrmuytxGu/VmY
 dLVXwOG0KOghLG0vgfVhfPe4dW679WIdjRdwta58p1tWv5GEzxurbT+mu5UxLGEWoayM039QG2D
 DodNUynnkjmwvL7AWFb67la1eyQv/SKDFQJcyqWzveGguzUGjdwsEEJ5P6Al2WBMShWNZ52Iq15
 6YdavpJadkXPuNfAtZ8j8yC+TGK3bg==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d63c2b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=hVoh_Pt7g2FPdimnm9wA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: h6ehqsEg2fkJJUBULYOID_QWSTb5_0Nh
X-Proofpoint-GUID: h6ehqsEg2fkJJUBULYOID_QWSTb5_0Nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172



On 9/25/2025 2:31 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 09:46, Taniya Das wrote:
>>> BIST == Built In Self Test ?
>>>
>>> Can this not just be put into one camcc header ?
>> These are two different clock controllers CAMCC and CAM_BIST_MCLK they
>> should not be in the same header.
> 
> BIST means Built In Self Test ?

Yes Bryan, this refers to the self test. However, the hardware does
support functional clocks for the camera MCLK.

> 
> Is this really something to be upstreamed ?
> 

As this block supports the functional mclks we need them to be upstreamed.

-- 
Thanks,
Taniya Das

