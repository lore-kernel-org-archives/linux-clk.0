Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF08435950
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876044; cv=none; b=qWSbaUcG+PBQXS/1jWseAJCrzOZfrjqnHgxxpifIJoYUVSB21ZgVX7zHO1GSQR1lFazZH1dfSTQDDih1qUEeMKZcOpNajaQEqW8BAnzM3zB4mb0Pl9Llbg6ekz0TCJVo/xIzaZ+Li/7A1aIBA02nOqAD65wxkK4qjL2L70QWO/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876044; c=relaxed/simple;
	bh=BF6fj45ETbF2JTxivH96fy19F1Zq2v8s40/BNLfEbsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrvvmrKBfacJvpuY5uZqAQQAdR44ByahZndGwIlD0cW2WJeFt39Ed6nbqO8dBpc6T7HYFM/mdBo0UJgM260HVKOlkGKvf0gJTmIlEjaZ/UsATMnby69AECNWD3Rvwv4lRq7Gg8HPy8aFj+iroBqRuRSHPJpLQ7pKYhtAwOpr5ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TW6ltXRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TW6ltXRz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6p6Ht014879
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=; b=TW6ltXRzQyf5A7om
	E18NnxeB03KQyW2HIqMhNtSSpsj8daU4M3DoSJiF+CN8Ob3AOMMvzlM4mN2ls++K
	lrOthPpxhzyxOQbPvBVEBVA0rzWNe2lUaLCuItVXgdQ0/nGr/H9nWkPMR7rmrckJ
	rU+AvuwfmzVhlD/iI39A6TtD2ZIepde1jdDt74ujELry+hgSe/qOnh00kayYDXTb
	prbcPCRSvg8qYjZiAZdnt/stB8QpyxDTHB45bEICq106dailIXO/si7EGsO0SwQa
	r2r70ePAFVD08PQVJW7G6ZCaDH5QvaSakNtEFVKtydxUDFyql70//cVqyXW0NM13
	8PL0pw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0ta5hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 08:40:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27356178876so15515275ad.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 01:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758876040; x=1759480840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=;
        b=QB7G24gYq9m4Eau6qiSbqBxO6DSU0hQRPAE/zOoIZk44+lIfJTNkzML2vwlMag4ASh
         8LJMGJf23JBCEgi043AopDeTuQNr+B/5yyNFKBkm22f4Sb8iRYqRAp5/7Q0wBOshFRTH
         QTnHqzMlnabgiM1Sr8nI1D3V4/k2CrNO0aeCgCbGstoxuM/H0S4dGIKZM3SmrX0ToX8I
         33fgDJRjFQ4YrelFHbCOLJNkiA7p2/SEnH25/WGjVljlXp0ANuGUOUJluhIxT/G2d3Ap
         VpT5eqkq1L5zwz7tioctJJ86mzRu9DGXIGYcASfapt0Xswh0JKroPErtu0p1UqQK1d5t
         NdJA==
X-Forwarded-Encrypted: i=1; AJvYcCXBJ1tK6BBiB9aJ1RPtcuoIGrTG3ehwRkNBtacPZ8+Co3g5r4xmLTSIgsWRv5L+2TFaQllD/zODoaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4eV997aRKx/BWKpFLSJ3y8EQ+synA0BV/BBG/DVjTyNb6GtsD
	e4uvQTWhvaFUSN8vNUJiR/zmV0X3SI5WccBeH3sMYtxokoxbTGsRqRp85YjYcNEw1SV+h1tpCR9
	Ocn6dBT2N28GbP03+IxiC9x0m0nebjkacPNEZgzeJ6N1DHU4M7szr2RZlsDcTMCg=
X-Gm-Gg: ASbGncuphRd+sugJaPMHxscSdtoCMiTZFuQrdws6hmnca+GUgb6ujt3scro9zgEiB85
	qjlzzEbqiUi6awMyFwKItz2vTZoOmDIGH1Z445lYzseLQBsqSPFuKvxMMznX/sGoaiAuKCXkwcV
	1bX1uLyZyHD6L/YoGsU7dW3MUMVGMCgisinBkOQn5RnXsWiHk1L/meOC4LEnFGxOCVSx6FfolKA
	cxIVfcdLa9obdheoBMyz5RKREk8xD1E1RGw3TYb8vGwcMbLRXDCxhwoKAL0/jDJobU764JMHxOP
	6UEs0uDL8UlpmH8c3jSGEKqlBiKKfJmstUO90kogA0dkjfmJ3w/nlY7ycoHXnrbGLYoi
X-Received: by 2002:a17:902:e787:b0:266:e8c3:4731 with SMTP id d9443c01a7336-27ed4a4e69fmr57199395ad.23.1758876040419;
        Fri, 26 Sep 2025 01:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSYjbgxz3ZpRa0D00ZVNPgHg9O0ctAAj1epWv0U96tMdUGtuWmJ8IJY2bgSO3VYP/MfK11Rw==
X-Received: by 2002:a17:902:e787:b0:266:e8c3:4731 with SMTP id d9443c01a7336-27ed4a4e69fmr57199205ad.23.1758876039860;
        Fri, 26 Sep 2025 01:40:39 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6733a63sm47601845ad.64.2025.09.26.01.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:40:39 -0700 (PDT)
Message-ID: <d55b42b6-1b2b-4a52-8eaf-78c4ed78958c@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 14:10:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] clk: qcom: camcc: Add support for camera clock
 controller for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
 <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -5GpNnez1FRlwgfyl1OCbhPM_5nBCePS
X-Proofpoint-GUID: -5GpNnez1FRlwgfyl1OCbhPM_5nBCePS
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d65189 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=txcd_wJ1IAhHlW4x_IwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4sdV1Xg+/Dsf
 SGQvfEOLUCIeKHAwNQDk3JDQqvHL12Rk3vvgbi+x+0CFeKNa7sszL9O+mNYGPFz/BYmEAD0LW7h
 pDUlY0kGzJBA6c32GnWvHsQoTziI7pVbevBMoNhaEc1jNcMhQNE8dy4nT9xXbbFP6lGrVq2igtf
 ynQBNTsLGkaFFn/VAh87afwwL1nGoV4f0lhwdigs+3ALPtaWAaN+cDfAPq4BenNJPG5/nWjcHO8
 ggsVo6sZVGuO3l1924RasiHcngyNO3x9DtxUcl5aZEI7O706ivxyY/udDLUrmbX/YoFd4Wm6SLD
 mexM2mDmj3AodnBtJ0yp9wELesReNBfDb6B2qQN6F8z1Om+8b98Ej2mPj1a0aNfDZWHsu5ypdkg
 SEsaP8+6rQUhvORzloO/Fe4BNuf1+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 2:40 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:56, Jingyi Wang wrote:
>> +static u32 cam_cc_kaanapali_critical_cbcrs[] = {
>> +    0x21398, /* CAM_CC_DRV_AHB_CLK */
>> +    0x21390, /* CAM_CC_DRV_XO_CLK */
>> +    0x21364, /* CAM_CC_GDSC_CLK */
>> +    0x21368, /* CAM_CC_SLEEP_CLK */
>> +};
> 
> How is this critical list decided ?
> 

Bryan, these are list based on design recommendations.

> For example why is the AHB clock critical but the CAMNOC and AXI clocks
> not critical ?
> 

AHB clock is required for access and NOC & AXI needs to be managed by
the client SW driver.

> ---
> bod

-- 
Thanks,
Taniya Das

