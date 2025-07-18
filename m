Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4081DED53
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856657; cv=none; b=sEscwEBKkksZDTwxdhqDSfdxnSiijNl8DiU6pjiZ8PAf05zAANTiSlTQUyXqjhp4/Z92WcPOMxnvXbFQCPsbcij3EdRDFS7RknVT3iLKL0cRZFiHusZ9SU76/nJt01RVF1v/Gxcjmt/h3aSd9kpEhLGeDc4In0DmB9VcVQG4GAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856657; c=relaxed/simple;
	bh=twxh0YDbsy5bG2ICpRMFh+TxK2HYQr21LmR3HLWkcg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwFqAy2Xb1z1Wwsa8iJZFPMX1Hhu9QmYzX+KcX5hnNFB65DeSctaI8EXfIwmjZtjI73ukRLnb+0gPGscy/mFvgtdOTof0RidWPnjeg9HuL/wbRN25QfA6HiuvPYvvcdQ+Nk6FmMDAmcY/yWx/kElw53zHLWTY653KN0x7dbdams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jh5w+yIQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jh5w+yIQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG4PmX032398
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZegwlQ32iOxl1i+QMZet/CdzL3ki4WTCIaMhmI6DoA=; b=jh5w+yIQ/PZJavnM
	t8UNy6oanuFBNUU67lLQmR94C2gMSxvSRl8qjlSntcQePRVL8Hl2Aul5vY4n2Lhr
	34gr6hK7wj6sDUGOMm/6IlvczcwH/D5fqq+1ozSDyLXYJjqLIR17UmI6lMucjB8t
	SZi8A0yWW/oZVDhXmEvIqAmmAQoFjrQoqnyc0lghq1DSm9iOZhO2NIsN5M2iWp8A
	3MN6zqA1rRGqrWnxvhWFpx/1MnXYfzAc33p9Bn8Jc5rpvVscDsC3jYELWwVcKnE0
	2o1h7ZGy6NoqlT5UYwx2079BxL3pY3bdk0EbOVG3NJQY+xYw9Nf9vKsHkVfK8PDj
	AEsX0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug38cexb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:37:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so3190510a91.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 09:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856654; x=1753461454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZegwlQ32iOxl1i+QMZet/CdzL3ki4WTCIaMhmI6DoA=;
        b=JzSWj6/DI7EMQi/2F2LlWWsRHEXKccp9Ov/7LWVbyuEaqZiHYz+mJW1TjaPHtene4u
         TqZvkJT8mJJ7Ev+fiA7iefdQQY2u1lctkkD5TqH7nUrz+uz5UP84CiSEm1BNb0kumPXO
         S4fT0qej3N6jpsCvKy17KMLCFVtG9tAriXX2aPvaKwXexr1ahuW8B/OSDsudb5OVktCh
         YIAn1T3BUyhZIdebNig4S/GR1ULZE5TXY65cw9Ky5iQIt7HyywDT0NTnfQNCbqBOLOcZ
         w+jwNwyZXG5LI97X+YC5feD3ZPA6ABIUmzQPfTjc1yq3ujhG0EXciZRWCkR63hpcVdr6
         G9lg==
X-Forwarded-Encrypted: i=1; AJvYcCVIEw1xpv/gPYf8l+BtCH9r5n+z+YuUkhoTOEdzRb6UBQyEAIDr/8u8YevkxE/nCVqi/F/lv3YWdg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxanEgYixNAJO6lGuvD9ZFyXqtC0B6SUJzW17CHLIYJLYaOm9le
	82n6x++OukKuRfFaKb1rckoILaLxwNv1IVbtxMJkRv8oyMGAXZJ6mukiaIPfH13Ecf4IpQdoTKU
	+SNJG5Fwq1EVCV3ion6bN5mwP94hHf78RdALGTk0EUdAUUDTE8khCTpXEHjYkI4w=
X-Gm-Gg: ASbGncs49cU3yLHAnXBeIOlfn3UU5Prx94aTPZo5ZBcQKn/7y2OqcNhc113rVuJMgnK
	rI8n5RKCt4Nr0TQ9KX1alGUHNw8n33aDpPn23WOLkxbdae2rgn4DnaR7tcoN/b416qzGkjZSaIt
	/vV3tjgjTv2dOLQsNKmg+CjOdxzufKPPz+Nf8hXyNWcLB5hnbTud4TDBC++am6bBeUz+HqjBpZE
	xMNvhhRmz7B3s2tmQ7oHna40glmQUS9xZODelb97QkUIq5jkjq409MuSU8LkLaqx4KNib6hQnSy
	rBw4BR5jlAFfLZQWoXKZ8/kIeS2V8WhfT95Zhw1vYPl8NfPZZP4ZZmTV0e3fkErkAWIvPPf/jm0
	B4jzYrt+kqPtYD9qebyavJA==
X-Received: by 2002:a17:90b:2d81:b0:313:bf67:b354 with SMTP id 98e67ed59e1d1-31c9f2a0103mr18430769a91.0.1752856653709;
        Fri, 18 Jul 2025 09:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJSpYJWt9gcJBSv5M7yM4Tjn3hnjTMDiyr0xa8abdyvUZWBHlraaApCwJghcG7Ye9/EcQihg==
X-Received: by 2002:a17:90b:2d81:b0:313:bf67:b354 with SMTP id 98e67ed59e1d1-31c9f2a0103mr18430722a91.0.1752856653333;
        Fri, 18 Jul 2025 09:37:33 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cb5c5da0csm3170530a91.25.2025.07.18.09.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:37:32 -0700 (PDT)
Message-ID: <0261da76-a1fa-42ff-9941-4ce235a449d0@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:37:29 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
 <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMCBTYWx0ZWRfX7hTKb2ENoZry
 +NS4aLXR8aOda4kqDqPtCsw9q0kBuxJg93Kt3pxes37na9B54zAlmmNFWQPfC16OxbI+i2ObPq3
 wEt29B29odxHg0jhjFNukC0Wd3+UG0oR3Z+SNy31xRh9c5O7gTWmpwd4eTtzuTjpsktJBP2HiW0
 AF8nEu2rlxLm7nHefmYlMQOIaixnaolKuVy4zwEXzz8E79GXN3RRj45f60Ljkb51T3YLOTm6jQc
 r5KA+qCK6klDwPc5zMwBZ2vao9a5AmWgrZsVPF2QyAP1pjA2C69Gip6blHfFPgbf2SxvrwLPYqd
 GtQkLj1edJHvjr1tp7G+Ejt01fC2blWLT9DzxrtmHedQV4JA6vtpkNAXWyQsu5RhDxafpSr9fIf
 oJzXgyNQIiJTJz3R3gUx3187AnPyJH53C+zwgiDkEyp1rBmA8G1/qY7yBc1y7A6tgnqYgXrx
X-Proofpoint-GUID: WsFJpNQpSC7eLOfwv4I3zZKFTMVEs4Cq
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687a784e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Q06rUcgQto-sQqt8d9IA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: WsFJpNQpSC7eLOfwv4I3zZKFTMVEs4Cq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=687 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180130



On 7/18/2025 2:23 AM, Konrad Dybcio wrote:
> On 7/18/25 1:28 AM, Jessica Zhang wrote:
>> The following chipsets support 2 total pixel streams:
>>    - sa8775p (on mdss_dp1)
>>    - sc8180x
>>    - sc8280xp (mdss_dp0-2 only)
>>    - sm8150
>>    - sm8350
> 
> I think 8250 can do 2 streams too, no?

Hi Konrad,

Yes, 8250 supports 2x MST. I will include it in the commit message.

Thanks,

Jessica Zhang

> 
> sdm845/sm7150 also have the clocks for it FWIW, but that doesn't
> necessarily mean they're consumed
> 
> Konrad

