Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3C395DB8
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109759; cv=none; b=VTCMie1YM8rJLr00Bg2ey4rirLytbSBeSbZzLIJk/1ieA4cRzgdw667RYpxLyYMe2SPbHjEuJP7Oln6zyu8onThp5OeQYsBt0c2zPk7Zwn4hKQ3WAvYLSOkJAKZ7JrBF+sGOLWSVXrEqhYt61112VuBW1bv1N6WvQHOW0xd+2wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109759; c=relaxed/simple;
	bh=RbnNXqqnHRQty5lgihCl7aAK8zsm6/eeHNN3+SXXnnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWt7eA/lLKYoi7A5BxW+F2Z/BKj0IW6O9Z6aUyCpvYPYjt9PsSMUAj5P28gFrJ7aqtSIsnfjUJQQBYFSPSEF5CMYN+uUJJykEGSjeqP4ZET8m4In604O90cqJWSeQdOQZ6DflRboHaevA71b0dO37ArBx0MILIwgMg7ISp+ILrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtfecnF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D60oRpno; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtfecnF7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D60oRpno"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137B9H52356976
	for <linux-clk@vger.kernel.org>; Tue, 3 Feb 2026 09:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=; b=XtfecnF7b6lSPT1m
	Al4z+2S+cRWod1cTVYfLGdrIi3mjdNBnLxfJhRTY7xyoog38AUtwFfVCS4lTvzNQ
	v1Vxn9XbKF+jjOIBgGfoP4q/v8egm+tBWW+5cEPi6qexdpYczhnudkmF1NMH1Wyv
	WeejUw431yxYLAL3wPOCSPD0qForMCau2vwDCx4Y9XB3jJ7jXqmvFU8SSYwnwOQi
	5xCX5eDmgXk5EDhFoKVgVm4+knF4DfFdafZsSGEf93M9iAipt2QLnRDmw7+rq0ea
	KUmIYp5BBiiJs2zhwnjrq5DH7glBfj5zfCWiFNWoQFT+PKx5RT9GH52TAYjVSiiA
	sfJezQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0mbd95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 09:09:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88882c9b4d0so13327786d6.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 01:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109756; x=1770714556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=;
        b=D60oRpnoBnIAqHRvuEKuscbO1993nORDKwbF1EDYFrEJq2dcBkqEIKsWX3J+rhV39Q
         AWg75JrSKcOtxdsGn4I+2ZaZ26bMENP1IF2qqAwejYSEnj3py7cqr2ra8wxm2qZ7IL4X
         m4NqcrG7b3XAeTBxQVMGKEy6S1iqADe0T9T8XE6Ecp5bZo+PJv00Tun4sbj31FPfRDqZ
         NmqrMs1bUmHUl3s1O4PwhubiX6/LlEsIiCR7/OxGovpFXM7ZUharwBcFdH1kZMNZ10FI
         eNBtwXtUKE2HAp7WTDQxdzMQhpkGa64UPoSKLO3CYm5adtZ2ZWcR4R6j9T2DZCuhYEKw
         jZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109756; x=1770714556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=;
        b=lCTOWybq3hzmEb7xKdepZEAAWYr+n9hSsvM1mGhDMLc98VWovReu1pzelDdjlCs5cw
         E3m60ghhr5AKMSRs+/W5Nmvnw5Q43QKz3wUjlWzovI+9QkldcfSJq5Ec9/QuDwI1U5jk
         JuFZ/ppLS4R5N2Djr3qmmrhH9cHZnIrsbc9YSdHUQgNtK5Bf3nzEyTwj9JRpEMVtMJZA
         oCDLBOlCJzv9+NDtSie42LrsHNdv2w5jFvx+ZXZXQzineGQxijMKCtvw1CZ60JaCGyLU
         Znxm4zbTz+RUq3Qnl7c60I79nZbWhRxDktUGbBnrAF+vXYO/G+7N3vTHTwZr1Kd565ks
         DZvg==
X-Forwarded-Encrypted: i=1; AJvYcCWdYPAR56ozR50x2wtIWwn+LBgEufhB9gr/deCmsd5GudA1ctPCGcxVX1tqmuYHtub8DvO1DTMwIKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYZb0Yx4dMcy9Dl3lqL83BcA0L/tKKA6J9K2/NHg3qtazIqMhy
	0SOSxpfRZ9B93J91HBmhn0DyKK5N4m7OMfZh+MvqvYQ1dGP/S4LYeEx1eP/cyh8XiHShuN/Yrlq
	Ek6xojyyN+Rw77yg/Wkz1UcZGUpdWPQgEc5EvMImIrpWFGwn1roWYW2p2mOcfv+E=
X-Gm-Gg: AZuq6aK1B83bSxIXrnzVRGQSnvMDourWP7bjVqsUwjqLx/5rGcxB8tIv3Yq7sNJgoTj
	8wdksjj88NiLoLTyc1JWOAdAakmDk+6ZzpkFXKK3d2SRIob485j60/BmN+RAjXrJNoCx6CuAlSd
	2M+IsAVbLpKFWVEPCiF9ZNdsiCXVrru7GMEXQuUmMPg/g1VgUlyqqWj8SRPgp0AhSk5XMd3QstR
	kuQHhgtj4RL/RZ2+a6as001r9O8ZAjEQF8aVfN4Aqs4oRq6n566/OkYrTdklytOnOJklnLDn2sI
	HXgqND4zEyMKyoH+WUbR5v3fp9xwuGDxDuyQYb+ztaamvrVU2QYZNJWHqZIarXBLWE9CRXlzv4w
	tp8Vadub0psY1mImGBG03fKr48iKyfxOjnaqgHO8Mk1G0xHxBiCRJHWMHuqv5TymoGh8=
X-Received: by 2002:a05:6214:808f:b0:894:e24e:5b8c with SMTP id 6a1803df08f44-894ea02a720mr145594156d6.3.1770109756595;
        Tue, 03 Feb 2026 01:09:16 -0800 (PST)
X-Received: by 2002:a05:6214:808f:b0:894:e24e:5b8c with SMTP id 6a1803df08f44-894ea02a720mr145593966d6.3.1770109756225;
        Tue, 03 Feb 2026 01:09:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d0asm9195354a12.18.2026.02.03.01.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:09:15 -0800 (PST)
Message-ID: <6bce3bc1-6833-4701-b8d9-7205cb769a4f@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6981bb3d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K8E2y3tpqAm5I2OsxKoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xYrIVkAkPaAXaQs7GKrGtk0x6QytlgbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MiBTYWx0ZWRfX4G5xE+kr1hSF
 PPwTUvc8l2lD+WWVaT8BgXeZQA/y9hQJif6rWtvQmFBYqF/Xn2WZjBWIzaFbt/iI7cLHxFcPEdO
 S2GEYuPWMAaa2jZdWzSKI0QoHD9Do83Twv6jga20MwcpRqP8OidZKXLuBCVMbZXTq4b8vzgVsSY
 z/BButjHOo9D+UezR6WjdEI/Mft4FwR7aCMDYb0MkF89/mhNpwDWHjNjBhXGsFxlbuCiwwlC0Qf
 6l9eAa8gZb/KSwhZRnqnKELlEvO1qUKdPo0yeo19FRZfbgYCmdfYU8hAv1bhLa8eWspak3UU3yG
 IRqvC1TtEvhYitGbZUuJQgnGBIeEIstp9uJgUlFcndqjU4A7PKvZKS7oOtdiyliHzQ/EiLXFkge
 cor3CINlX9rzL3voVfM2lok0JdXahEGdHotFk7S9CX7nQ0qydns7VgMwYpyvda7m+GjIzYWuljU
 e5tv0dWCB4LIErIvMDA==
X-Proofpoint-ORIG-GUID: xYrIVkAkPaAXaQs7GKrGtk0x6QytlgbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030072

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I noticed that the subject lacks an '8250'

Konrad
