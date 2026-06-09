Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8F421880
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010371; cv=none; b=SoUZnZ7tZHCZMx7Wy3mdPDHZ/vZeQaraan9TOc5mAHLt43P0IAvenZdvoLEzHKlx5EVGNrfom7DrsnIK6UBlmbJP8bTFgC+Z/7SnZ0OL5e/e2Lh2XkPtym4loCtfgPa8bHRqnA1iP4iAm5TsFJRUZBbycj+ShaqRF+IEZcJVuss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010371; c=relaxed/simple;
	bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXrmCRVkHmDab3aG9Ltlsk73gKrCMNEk1fSUqaJ7dThjtCTDDEtpVIwmBH1wR+PAi0hyDqeycOK4E/oRMWYRuusyUGVd+o96LzJAr19Gi6X01RcmSXsvvZH4wG1loFZefiyx7Jox9daWA9zEppqz0fzQtp85XyK3dudH0ivwlMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoxdPeW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgYX52c9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoxdPeW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgYX52c9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClZqu2706236
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 13:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=; b=hoxdPeW6aHqFtnaR
	l8W+0aINbVu4xZX3CM0Rq/jD8Fl0pB6R3k0Sw5ZetfRQnKFAaNrltJDzMO6DX7N4
	npHb2RgPjYBZqLrhpAa9EKoI71gGZqau/I0NcGnnDDVHibfGEMoZNa9JQ7tm1Ke1
	F3R5HvHVfbhh/oxo3ESoiPg5I7U3qK3nzaGLMR7DkDBbADZGkvuiQdO+E4QoC0Fa
	Rjh8Cl1y8DY3jkGCijmlil7QRvxGluW2pXMkxDjkOeZ2UPTdtfzhDYA9xFhBCB3+
	576bIExdKzeJBwWHKELIZc/9yq0Ozu6SaOKb9PPR4biTj3wW7vh6q55LVZ5aOAKZ
	qC4lLQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt15cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 13:06:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d19536eeso228885241.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010368; x=1781615168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
        b=HgYX52c9/9uHpwBfctvqQrVA765/KeekHEnvFKaqhexxgdrXhsUIexW82tNZhtEVOY
         /32jmQ2x67/e4y5GhG2+6ICpAilTBM+qgBn1fNm3iJj5P2FzpGkHfeSGp91secb/abLI
         HFmHbg4xxlVz4hXqjwPYPZc1cNpX+fXI3LYJe1bwCNmkqAOd9+iHFj8EX40U+0kluEn7
         LfqCB09bcCxLKMTTQMtkATgCsZhyXlS8JDlI418FzSkp9Y4DO9Ijty/FCwV5qk1sm71m
         7q0bUkgyINqyzbcgYfHOSHse8tw9KGU6SfsHXk0N2u4Dp1I2f9HmnBDhwuHq4j9IC+Gt
         Ks5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010368; x=1781615168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
        b=Q94arA39nKIhYFNpw/Gi+vdSSCj2nuvhNJ/6hJTYh9qOXfhuhFeOS2a/yWgmU/t3MU
         tyS2To7Jb8j27ECk/kkmEFzMqorNnhnDAIqnBLWvsLb8NPsAwvXZSRMQUxqrRz0GMyK6
         nnZC1YdObQYFITQS851v86TV00qMUtHfDS+alu/F0ISu77eeIAkEYcNIaNntmJcDVE7V
         uALQDtP7i7Xanfw07gT7LWRpIOAnqcZofEH5BkmD7nGwkgtCLnohjU/EuQ1Nyg5heO00
         YjaDKA3uGIxl4TPQgyoPxK+rCHbTmNKfEF+CZ/isKs060PFi6kCd8S152gKwNmsEL5RS
         lMwA==
X-Forwarded-Encrypted: i=1; AFNElJ8HD48pw/fQi8NbkXUn7qmLzOe6/RL8CSCtmS9yZWlaGvDlHnZh9WGFCmVfrLrLBTGYNDkLdY8t7p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYnvR3j4DJy0CWbMmJ2ghYbEN8JBHnesvdCpwyxGtMJhLaKtAG
	NsDNK/HGoJSbBRtLicfw6yV3IgFjrxWM6S0bGGEkbGWXNjQ2/PwkRXY1zvolO0kxQNwsrDu/Mru
	TRTIwrG+dTiNL2cutJPwYvMM3PLbuAB/ORFmlz/Z9BXuzcKch7piugN7VT4DOo1s=
X-Gm-Gg: Acq92OGNzmyXKUtG5RsT1uGCClJZHLoveXTpsZ9AJd1r4hia37Hp+thI2W7R42SzZtB
	fEzB0ReA7jaLKu6QxQEisYJ81IlxTXlFmpRbWAEJMvT1N9Y7Jsr8CemzH+feQZ1qLS7iBCCjquS
	zMQT/MXrJOtQocMx9jKQnlILxI1UaJsWOmRw1L/Lp8CYhJVIlyhHhNgsgk3LwiHBnB+1PKq5KfP
	d+h1oVLi8u+t8bnMFR9oNqOdzrQHZ2RH/ypKm29fWxFy2A2lLrC87c0A6LGhIweFAF2tmifIXuR
	KnTYjPD8JDnadjV/r4arlhoVZS1qEi1dBMcV8A8HrKlw2tlIiuFS2ZFGB9+EYmQZ4Xn6rc2w/Ej
	Vz896Jl0MEYXWWMEZp41wiJT9yeIUsbmh2U7lIYkBItkYMm3tsYEhL57z
X-Received: by 2002:a05:6102:5490:b0:65a:fee5:ceac with SMTP id ada2fe7eead31-6feffb06cb0mr2878507137.8.1781010366646;
        Tue, 09 Jun 2026 06:06:06 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:65a:fee5:ceac with SMTP id ada2fe7eead31-6feffb06cb0mr2878459137.8.1781010366181;
        Tue, 09 Jun 2026 06:06:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbc9esm4578992e87.22.2026.06.09.06.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:06:05 -0700 (PDT)
Message-ID: <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:06:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DFKrkbbthF7EArpv_GwTOpWKl0X3nmHL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNCBTYWx0ZWRfXwMKNwHIQanKS
 xU6b74g1U8GntyYHWBFXfJdXDUv+HFllmKmKfYa9OeTQrok23WuNgUc7zggu2Av+JPlmBrlA6TB
 1VH8KXrVzn9jTIXWM8675AjW1EFcBlzePoX93cffep3VMBLiD41dyX3rmT0Dezuy4lqmRWl2wPh
 QrwLWjuZak/HY4flRRBeRbHTLHf087+LV20QZI/nR8PQhU4mpjFgYrVU6NVUrr6/uYGiV2FmUwT
 edBB+3ZIPmxc+fg3M27gD1N7C+SnLybVXDhhg9FS5UjsL4IE+KuAHFSmAL+zwNUTlVJsbNdHRQi
 CK4t5rfeM7ANlVA60X5wD+AwtvgCvheb2kHi/4yXgbZwFXQh6cHyCwWwHs7KOBkYWlHlzgS5jk1
 0gztuE3Fowz0XO2fQkTf8GgNHecJFLMaAf5x8B26kISTSF+j/axYPQFfk5uA8tg0SUed7VexqQV
 jqD7LiQsVHToNG6j7ow==
X-Proofpoint-GUID: DFKrkbbthF7EArpv_GwTOpWKl0X3nmHL
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a280fc0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VaM7kzH05nLpQn4dOD8A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090124

On 5/28/26 4:29 AM, Qiang Yu wrote:
> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> directly instead.

This is the last piece of the puzzle that this series is missing.
There's no QREF clkref_en, but there is a refgen that needs to be
powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
(1p2).

I think the easiest (laziest?) solution would be to add dummy clocks
in the clkref driver and only toggle the required regulators. Another
option is to defer back to individual drivers (such as PCIe QMPPHY).

I kinda like the "one central node to drive power" approach, but I'm
not sure others agree, since it stretches truth just a tiny bit
(although not as much as one would think since there are *some*
controls for the transparent-to-the-OS hw pieces in these paths still
in TCSR).. Dmitry, Krzysztof, would you object to that?

Konrad
