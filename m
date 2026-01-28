Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964A2D0635
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594905; cv=none; b=LvD3NWVJ09Kb/N0oQQEnVANAUfWFShlwah5wl3L+Dd8MIrGgCLJkMMZQAlqJI4nIJGsWW6/bdzA5wft15KStY30DSin+IoJ5Yq7leaXXqwAkVz4wlVqMO6zcgoExhjaUvOw2p2GzDpiHIMbBLhGVKWVt6/2NlvwfKb0rqbx/lQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594905; c=relaxed/simple;
	bh=6JQiF0AakGIzqbdZT0eSTXiuqz8ceNI8FjSAg1XACkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgYE0dTZIIA5vMd6oeoua71rr3GS8lnFej/E5d2dF7CguaTNecpnIxpO1e4XPZa8CZzm7f5xB+NLEeo70YT3zdQEr8RfYHLEWdN365rsCjOuYpULX6LTUt15XYDYoHtczWek5iU6ftr3Rrmw1mjYNR1JXl6bvJmJUJggqS4HQyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhUwlHLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrohMtSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhUwlHLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrohMtSP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91pYh3879105
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pOB9Mc1t05G3vlFbXQsDmBPybhMHNKbNriOahysDpaQ=; b=JhUwlHLJ2rf3WpSv
	xj+CqCJujQTZpRwlnJWMpL4v8S9hcbyXuLc9LIK4VOphYikmOO+j+M1u9RMEkMi6
	WY5f9Zr3+oVOaPwRhzainRtzfBrnwAT6kAnNXcD0KvtMl5ndzNlaCpsTHvlpPGaZ
	n4YAWJ4KdIMTNGqvcbJry+BHrvj6iWjXR3IwY62mgEYMKsccl4HIRaZ9agNlPO8F
	O6QvtfrkXw1DDYSQh1jfO2Ao7S14ngKO3/GUxlBLfIqCompxv4WBjySZYJ5+vpav
	LdTQdarn83249vtWTHMxRoMrhoPsUBVAoKNzW3FDvthZPuEc4O4JEeW+zEz1LjTa
	TlRGcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv0ykf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:08:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6de73fab8so209875885a.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769594902; x=1770199702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pOB9Mc1t05G3vlFbXQsDmBPybhMHNKbNriOahysDpaQ=;
        b=SrohMtSPwhL+YahF0UxhuTXneW4CKeVcI39rAcawk/7ORhJTIDHwwpWSXou5e+YyVP
         OaxLS/2pqnwFmQRP1kh5U1D6KBk1XaPxB+cr6LV7dYQzM5vUsQ0MUOFKjppB+XEdlJhO
         ePg+Q4g7oe+LTFkmPCq9E6RjbzUTZBu3zffxKA/LCgNRJo0PgqU7TIDNMywQTHhD4e6p
         07WDTRoAZcUmnIwgGIfWdKtFHiogE2B7HT1muaNQNP+mWAhcuMmNSQOttMRPRvGLz5gz
         8byvH6o0JMg+Qcn84dCtVaYilTBoBzuhkbFtj+wku4gzZEhWX1RObKnJLJGEr97i20zp
         zTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594902; x=1770199702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOB9Mc1t05G3vlFbXQsDmBPybhMHNKbNriOahysDpaQ=;
        b=lx+VN4wiroxmK2OMhthXWKxh49NYIsgzX/AU3xF7tFhxQXdF154DDac18g5fLuC+OP
         3FXTU2bxMTbpcvaOMfwTLt4SbV5s7BK3Ym3b95sQwG5awUV+wn0XiEmYhM1JSnHj2G12
         Kvu/ayY/7hKGdx5cxrwLxdvww/vRVo/5e1l2YN+fHBhke+8yHrxBMB71Q4cnL19cZW4Q
         56QNzSB00FmVELL6b1Iduc0Car0dlMytIvPSNo0JULJ1+QUpqXS46rbt9MiumXJSdtOe
         ixPl16twXsPRlylMNMvZUIcKQc0dK4drYuqev6aUmr7P2JXo74bwhTHrRyKD6kvTnp5H
         bkHw==
X-Forwarded-Encrypted: i=1; AJvYcCU5TvOPoY3KL24cMgFJLMC76v1I4ptDyYAqmVfcjBwJRhUZkIVCZrQYAHCcFlfsle8jXHIHU4pjlvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/SsjyACsdodqNrqTNfnWy2G3efrtZ2+ozTBvQ/ezDOU512/d1
	liQtb0bijjE6O1q4UxjooCSz73TP6hNgR1fyJv6IRqf+AjrY2SSsIgj5nKeBQbNMT5Y+nPaUm4D
	aepZCKXjb1bNUNxbFKHMvNV89xqL0FNxu+ZgO/9k2Ss1WjdRN6l/Bk+eCN5X0yao=
X-Gm-Gg: AZuq6aL/fzFxiB+l86FGgtBebVSUPfHnfrTPhUf4TwLp/gKWkf7wdn4pmp28nyzXjnv
	wCjnvQrZDObhi3D01Qi09y8xEELl6oUiuqImd2zZJjYTLvroJWiQzvhZx1rDeJSqdaodx0FU08p
	3an7Ng12enjiy5otRs6wfeUQ4bVIn49E5yDp2jmJxD1tjiaQ/oNvkOa5lq2QtRv84uf1Dhkf2OW
	jHkUGQlRe1zIBtJxV8PhljXOeX8ZX5lL274SS71gVIEhhfWTcvESA3Dk5Dq4Y9bBKTf1WoGtu29
	ZaocHjKWPX0rXClQ2jELqHIFy3yfEf4P1rtD4w+RYdkW4iEwG7RiJR+r8noA2R5JKmwavpdPDOD
	xBihfnfCm0ZUQt/R4YrODNZz0rAcBq/Gjx0FSOKNkRQcW1Ah3GgE+EHhac047cFQMGVE=
X-Received: by 2002:a05:620a:191f:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c714b9360fmr107859685a.2.1769594902497;
        Wed, 28 Jan 2026 02:08:22 -0800 (PST)
X-Received: by 2002:a05:620a:191f:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c714b9360fmr107857285a.2.1769594902050;
        Wed, 28 Jan 2026 02:08:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183cbesm104851466b.38.2026.01.28.02.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:08:21 -0800 (PST)
Message-ID: <82c6750d-8fa7-4837-b537-8fc6df9841a2@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:08:18 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yz5tFyNixaCVIcRsuOMh47P3Q6LxhbQi
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979e017 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vr16hO-9cjX6QiRLJ9kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4MyBTYWx0ZWRfX5t97ZP6Xc8g3
 U0O06HBt6dMgkttv28sP1wGGCrItdu9+4/HCsToumPOCLnhj4spoUJfmOYIcK0cv46ydGV01lbt
 TchmyKOylVoGWNoQfhqJyesr866blYUpNLePlNo2YJDzFl8RrzU/wC4fBjMwU452zuPjOrsHVzV
 nA7yRsfab8xPH+1ZqtUiYr64d0/hbTTMO0qNqOixb5K61c+oa9hrWZRho6nSonLgTkGKVDtZsOg
 K98lmqGfI64aWCas85PrTkcm6gwqCJevShcgVcdyO90NLECRLrixg/k+CD1COUjUUDXz9QFH9ce
 PykDHTSjFFnut58oLgyLWF1JjwiiFrqENSOwL+bblcGV6TZ8ZoDLygHeAMfbaWYPMaBUaJp5RGC
 S+1sLU1cGD7FXS4AjCW+lZAxK0LnSOMXHRu3/LambscwJ7xgOY/4+aftpscaEZC96Ya+r8AeyRE
 Khw/tTP8/MbMisfIhpQ==
X-Proofpoint-ORIG-GUID: yz5tFyNixaCVIcRsuOMh47P3Q6LxhbQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280083

On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
> X1P42100 video clock controller has most clocks same as SM8650,
> but it also has few additional clocks and resets. Add device
> tree bindings for the video clock controller on Qualcomm
> X1P42100 platform by defining these additional clocks and resets
> on top of SM8650.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

[...]

> +#include "qcom,sm8650-videocc.h"
> +
> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */
> +
> +/* VIDEO_CC clocks */
> +#define VIDEO_CC_MVS0_BSE_CLK					17
> +#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
> +#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19

I checked a number of platforms and the _BSE clocks are only present on
Purwa, without any explanation in the corresponding docs.

What are they used for?

Konrad
