Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9C929B782
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856741; cv=none; b=MzbNtphhRKHyCo7teU+Jnn8qwMT5UZxVrkxZicnLftzMPddpqs8O8Sq3zL6v5Cs6JaiRnv51lvG55ngY5UaO6eT3cnMrHAjw8sHOi8M8iMdAOtEF78tGLCgIFo+9CoIfSehgDktRHVZ7vInR5W7iXgEHc9avfXRZprfn4zxI21s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856741; c=relaxed/simple;
	bh=PKzM2OX2ycXMBs8dy8jvpWc4ZUaZPB/LY/5aZpqt0jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUxF4gy2b+04fMUIQOjl20fnTSGnLITTSAsFvGjsMQUURgy3szfNdPcnAUsYAU4DHqZG80pvVUbJpnt9lMuDzPJKPuPVQfNFEkbQcv7jpf2JX5QZT+RJBBMDd2McPuDr30hwpNRrt60M9BYaYzXAvf5RzmTj1N9MsuxoS1o7SOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkaTDaC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkaTDaC6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG2YQV015626
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaUEOpwnu6NxdO/qUIkj5n83QZNRBaNn9dV7MFSL2zs=; b=HkaTDaC6s/J/40P7
	90dDaK0citrZ2sFZ8Dh0gUceH91jRj3u85aOcQW8/9fKKsQaJtJC5LpKt4p+GjwN
	CfNshQ5eVawT7etZrQMv5r4NSqy4I6yR5YJMz7fxppoSXQmgoUoILqeHyLIlLOqC
	wr8plijnScugHjHSisURYR8D3cey3Fb15zgURWipnhdmuQiTG6txC4mJ86E/X72e
	XQXibIQFHJpXhQbg0zzwlydumlKFVg3GGnjrjEX9Bx9Zi+FJtJFOCSAjxZ7qGed2
	ELPeGtIZG0iLMhnunHLkUCUFKomYtlg243qNdheSxo61fs87Q/ywYb9NyXoaLKAK
	h/d30g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyy7k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:38:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso1761625a12.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 09:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856738; x=1753461538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XaUEOpwnu6NxdO/qUIkj5n83QZNRBaNn9dV7MFSL2zs=;
        b=FvsAXxp8Rl8jzTutkIINXE+VB9ouhgA9vb7aCMXEHgWuXmXfMptGq6X+FoOxmPPtdW
         jniS9TySAhwBiLl07ZsZuA9/FCQ0+pBdHPkPz8fAvaOBWSwPj8ralcoaUlb0Tbc8Z+n0
         davhyGYKC56d7p1TL0+9An276z//MRtFLPjtCf0IpBBHs6LeLe3dXlcsf1vDM0jKVHri
         5nSGmIiEh/WNLH+urDuX6IiJ36cYbupf3aV4/k4VOAHQ6V5EhZcMk7oCAmHak9Z5ExKE
         C2h/gyGDcz41/WS13IAaif5opxyATcAf5W+TCjBik+DM+RzCmsWyc7hI3nbWpUSAZdTq
         rZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9qp8KV7Y/jWQ53aiiBXRq0at28z22VXX2/nk6wuc7t+3OC5ZAUf3BuvhtqwSHChGmZAEjU7Hpixg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNZCrlxaGVhEeyNLKbkn/zwICdk7mFz79KdUHi8cMq0Hr6zHt
	AfGWLaAAeUwOePFDtKIcpbSZ0/C1mSm0KzvcMdzGa7xyKCmqQo6dd0X5WBVyuQonlqdZEHK+LcH
	ynZPXXfOZJqn3vXb+yRb8sJPTcG9DLQ+Lh1R1NtkG2TmF4iPyFFi365tL/DGYlrM=
X-Gm-Gg: ASbGncvHKJHnHezASzoDLiYCR9TO58hr76x0Bd70ktZ2qRvjBnDiwNOyOtAhr4Kg9+K
	eT68mWyd0Dofcg0Theanj8TaO4rW+blRhXFbjrXiTUw4xF1AMWbyRnXSvNI4L4r2yx257FOYRzf
	dtnBxdIPqWCf+jEle/NxJGgDSHvhj39CuUQdzIDJZ488JUQb9Q7mpyj3xKCWd9mUKHkwuXHjudM
	W+YWo0D+yiN02+t2OHv5eJtFX7Uo9pzoMp6SzG0dS+94AeSDm3oRkosa7u99CbjYw18mWGeYp9E
	KuSiBFgXIMHgmQlOfaCez079U2XkkV3rk0suU1UjGluLl0pCK7DkbN7nDRyJ6vAr7LUtBdlPtsj
	9jx1b49J4vjCgSqQi5bd3yw==
X-Received: by 2002:a17:90b:3c09:b0:311:ffe8:20ee with SMTP id 98e67ed59e1d1-31c9e6f7349mr16793143a91.11.1752856738036;
        Fri, 18 Jul 2025 09:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/f3rHzk4HPCgwLaXFm4dfM3m4MOQeIgsDbrovnS/sFrTTPhvP8QSgCYuhbvY+4m4y3AewIw==
X-Received: by 2002:a17:90b:3c09:b0:311:ffe8:20ee with SMTP id 98e67ed59e1d1-31c9e6f7349mr16793103a91.11.1752856737571;
        Fri, 18 Jul 2025 09:38:57 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46ffdsm1573045a91.40.2025.07.18.09.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:38:57 -0700 (PDT)
Message-ID: <5bc7cf1e-edb6-4bf4-803c-f84d51fb1534@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:38:54 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
 <b8d6edef-6809-4166-b936-fd000513df90@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <b8d6edef-6809-4166-b936-fd000513df90@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nncV7kz1ZqY3Ej4tHZJ9rPAuOtP9I90C
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a78a3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=bF9fvQb-GeUcl4pYUR4A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMCBTYWx0ZWRfX9YkT6IdhMKuc
 IFWCqT9zv90AQfsj6xVB8M5l5zpSMmqHWZs6pU9CH5AsKY2YMpStViUKtiHwYysOoPBrvJqo7lL
 JiEWzQVDwXa+iirs7FEQ9N/+7LiFD733siY92Wg4+Lj1Nupzb841xYGistH8SX9oF3BvTJ1+GJM
 teEjh3BhAW2+Zi7XlL+suQahqjK8UTTM8atutcx64l+9+DnQaGyOtbwNMOW2Qd14wiKGTDgSd8P
 ZQC/etjFwIpnE5R2C25ykf8TjOpMfAYRzrTHr2BCU9c44rlzI7KbdPvfta2sIaBuldwkfiG9uKF
 O97iHI0bL3IiVBhnJ6LFIod357vSQYFlRmMhyW+vc8M1ZDTCaPWdgq42QjOK+aXKUHO09mXl3BG
 jX2trpn56w0ls2zCvzLqpy2EzjQuE3wOmQeMBtiur70yZiR4USwO1Uaeinp10iYLhfXBFRZp
X-Proofpoint-GUID: nncV7kz1ZqY3Ej4tHZJ9rPAuOtP9I90C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=760
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180130



On 7/17/2025 11:16 PM, Krzysztof Kozlowski wrote:
> On 18/07/2025 01:28, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add x1e80100 to the dp-controller bindings, fix the
>> displayport-controller reg bindings, and drop
>> assigned-clock-parents/assigned-clocks
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> 
> 
> That's not a correct tag really - drop the quotes. If this was added by
> b4, I think you might be using an older version.

Hi Krzysztof,

Thanks for the catch -- I'll upgrade b4.

BR,

Jessica Zhang

> 
> 
> Best regards,
> Krzysztof

