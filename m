Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AE437478
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973128; cv=none; b=QCovwzRBgcRnZwAYXXI2GMtfDQjdeKJVO1ucfKvYLHK+cX5d3aDZSNoLMIbfazDv5FG+t8NfopmX9WHMWSO6ostIdVu5GwBqbYB9WwufHOKq3KbDkit01gex0rgGVvShUbEwSmpyeHuAsVSCSTC4tP88ySHq8oX7f3qETFjemSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973128; c=relaxed/simple;
	bh=GXDnqv4IufDcpMPjGsoOmnbxEx1h09J0mGjA6yUpyEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3g8iXxYFQfq9bJi1C5Gt+xxhHkBqmiLzR20elZMgTJARaqFKCPCST+lJ6SZjVdvixaer9RIqM+ZZBX3TfO62B6kp/jIYNSd+Eb5Aq2rdOCpAsZVAVGgyPw9nB1Eg3t4TLCLye+/K6wqi+/x1lmr/ZlHcYaDPCR6m9R/J95D17I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMmMMqJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuCW2WWD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMmMMqJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuCW2WWD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5rHM2008354
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=; b=fMmMMqJBlYjCqfMd
	HyqpcJy5MgaoCPvIDypo2cWJ0Z350/W9xqJhAhDtiyLM7eEhOj6UQlvFA7TElTcj
	gqh9WlRQVL+6HWl4YFkxx8toHwa3JY9EX9+GHkQWeBzdv2jTvfE2EY6BXQGiFoZx
	n5DjkHjikTuOzPpfhRRLTWWov80K290qsqd4POpSctGs8awR0cenQDIu1Zufdp6u
	XfhHKnHXjYT4tC+XJ/tuQSUzDroyAfqusVYB/UNnpt9Gy19vFempvGPPZAFa2LB4
	zYOJ5s8rclBHmRuLEfjO6SAjy4SXZ0I//lH5SgpTBMul2zzHJC7RNRxSwHNXGhem
	gWrpZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8h33u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:25:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7ef17031so2413411cf.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973120; x=1787577920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=ZuCW2WWDS/ZGBmjzVt1vJ+tZTIJ0KIFwisfY1Jb9ypGK4+38xTvXmjmbvQw16mTorf
         hzFsvD7MWsvwuEjRqkN1ilBBGsyb117pj+SHxRmqk8TOtj85m6/iGJ7ZJ1Zf+Z2klwH3
         AcOjiwwIy9Kzvfl7WC1ptPgJOAlPka9Z4Di7WS1UZkQIGwwbftghFRNNiuYo6YR+nphI
         n1xelyIZRI3GLlxUp+Z0WD+dYfb2JCntlorJ1/U6vSguSxsdt6VwgXx0M3MANzpaV56O
         6RTLvFj38PHW6p6A+C0fhUDrpM06HH8LGkwgPdZ4dono0OFgHp+fPm8Klo7mjK/RdSZG
         NGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973120; x=1787577920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=b+HV2gDIBGMC0G55rmFQMXQgdJFUGY4GCwYuX5CtJkDzhYf4zWN6znPOSUCqXZkJMw
         Xl14YMZ9NJUFiQxqUrb52SCyXxNfZMky3+08zQ6Ixzk+ngcYD81eYaO11ET2xO6wIY+7
         ydzEUht2Mx4ErgkfM37AJnGdRgksw8j5drUi4dfYrpztAAXNrZx7H3Xt+fK0lis87TaE
         EEyLuqkJ0ox5vYir98ZleRar1tT22l9+Z8IJG8Oa4iQM/jY9RWlwZ/92VrdKjENkabdV
         mUuu4dI3EGXjUktKxvqlnZj864eAu7ayjWDlbmRyZrdYLvAyz1rggV/GTbaCHrWbEV8i
         6Zcg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9WVRR3zxO2Q90KGDcXQFg7IeMm4KBY18YgTkXhazG1TrBlwbrAsam0bzchn55xbLANualZNw7rZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6bAuruJ5O4m1Xg+cmTsT5zJCiLw6v44mCojRweFIPh3rxm3+T
	ITsp92mnzk6D6PNFQ+tS/ucbEx9VeMPA8Fll/lNuPEb6UPEx/IIbMFbFqlXza1WMZVg069SQ2h7
	OFW81XhZ1dj8cpmfOrhA3TYQh2+IzycUX6SnBN/RM6Y5CtsLOD58KD3T+M3i5w8M=
X-Gm-Gg: AR+sD13XbfkMNtcVMj2W73awmoIyWx4GHetiCNuQHbhz4fog1rBGa3f/QzmvxSp5xgD
	IivB/IAwevwC1N9x4GV1l36nveZ/WznKpLoo5e11tu73gXcrAq8lIx+FTbeG7Mj4LtMVEs5v3j4
	SDFNblxBUsk+m5vXBoKGx9smz8ItKLf0UAVcwaIAjbQTwteCW//1GSOAcNp1fs/GbMLkhkWe4L0
	tAbcDFFzs5FukiYxd2ZLulFvUsSiGdEfHpckg6taeT/QqPpAhx6GeCjhG09oR9PWWTNTfDj04kF
	sEnNyXd1eoHvVRGdLRIh5UolR+0VStLQcwn5L5GTA+cRZALJl7NzQ9VlwwvoCY8L00geSCSPOUT
	dwJ7UcOmk7Vz2P5Q7vCgbl7Yh
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072571cf.3.1786973120250;
        Mon, 17 Aug 2026 06:25:20 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072121cf.3.1786973119817;
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97936sm29266066b.43.2026.08.17.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Message-ID: <57af0ad2-2afb-4951-b17c-918e9ed08ef2@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d5KuB-4v4Ws74p-JQ4DhmpUDoKAH7IlS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX9HcAUWqkUrWC
 00Z6C6X37ZQtJYtP3PirUxtwFMzTO4mW6ufDXU1o0JoyMGbq3q4p3cKwVZ4hQjo0Wh2mqWimcW8
 WjYRxjak745JeW2Q2/l0VT4Downe//E=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a830bc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: d5KuB-4v4Ws74p-JQ4DhmpUDoKAH7IlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX1Nm6ilfkkct2
 o6vrXLZ5jXdYOOv/q/oj3lHpYe3DPwTOKwJjvD7sXJhxUjP5DcFSYNN8Zpayhhak6h91WQTF548
 rAqeHWyMOhKTXYZqR3jcsYOkCN/nDN+vYzj6oXgY5oqA7+pMr0mitDPOJ+U3ZFbLDYxGzGZzFeC
 Tjfra58VS6G4/A04q5LmrOs0PrDUWW6HKdg39HhSY+cqAUtFsJT2HVOqL1DoJ5DGrYJfthCMy+t
 ZaEH0v2Bg6ws0svHDsLvHNDmaBrPBbC3X1sHWjbMlILgxKfTCDJqbe8iCJFPW6aPGTDYUXAd6ql
 QUJncYgCOhn0ECizGkBJlr107+op4yvswkV7sUCRSE3Lw1B69GW+TbekOphQHcMPXbGq+WKr0eV
 C/o1FDgvvWDfEio1+yf3yeVQtMNLpgP7aJaRQPzoGk0mEgEyq+TBdW9266NJSg0tt7YFC9DaziO
 k52c2rR75BJRlNMzXSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
