Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EA13A782C
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556334; cv=none; b=QSZ2yTDnpD/SENjM+gf8zjfl0FdpaU2Eid8ZIN1BRoNNg/8TD7+Vzcy50Z2XANq5DpjjUCkQPVz7fxMzZb922GUoSDChIeN6hCwwt/70ICMIVfMlt5+MJFEEzbX1RCHeDZHlsaL0wbW+RKB76nmM3MUGQVtBqh5mIXwyHTumoek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556334; c=relaxed/simple;
	bh=CAMD+0QiMyQXi12K0SXokqn2XIteIhoZgpCcPaIwV9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpqAN2IoROIcIAlzIUtusWsYQBhAoHlCukJTtLhBXaGmjYHEwdWNajF+rgPcmq8yxwB0CNGe+mrkwheMLXEGHmVbkRr68elxZUcyOxq6xHmG43BMnnMlXLzwYqlDtEIYT5Yqo13PKbOh8e4F+U2jt7LL9HzmwLMvOEQiKHsava8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfHU6oNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBOEUZDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfHU6oNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBOEUZDR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376aGxM3815231
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 10:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cR8Hb0685ORXdljSkvFkB7MYYy1d73ETqakcf1ykWI4=; b=cfHU6oNdMkAYMT80
	jEnXEueTbxG7cnRBPaUkOn8Z+Df/ElwWFiNqEp7dj3KmccvXMtiTw/9D5meqylcl
	uUxxPIVSfeaJs73woTokn1eyATKCCRK+D0pPFlc+bLR8DL1/8iopjDnLqmvtZ7TN
	6O/h5fxUchuxMUCwP8A/UdDQLxscWPAcL0oG2C1azZO21q02xangKMuwXBYOObip
	vNgOQLv0NaAdis1hbfzfdEXbostZlFtgbCGwER71voP9PKH3VyTCbMZrcWbHc65x
	0jad6V5sXIjb68UPywacSowGJpmdb+mb3N2XhZdFrhm/b9qOcY52FfZVnd6Ji/Mt
	e9PaoA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4t744-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 10:05:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89e9d327913so19423246d6.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556331; x=1776161131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cR8Hb0685ORXdljSkvFkB7MYYy1d73ETqakcf1ykWI4=;
        b=DBOEUZDRPCK/rTbVqz+iYQ8AhyhX2ZBcfsgVU3og9j9Lx8Om3JzSEYm6oWpc4rUOMt
         vrufMVnkZntmVmgWZ9BOyayOwyTSFsRgFmcDFzV9pm0CVehfR/ggfEjmvy14ux+rp0U8
         ymf6mCN5bLCoSRV+Qaoj1Vtyz31fCLmmW6t60wT/cGQV1vLuDbYviy2MKBfGyd55Gt56
         OlzLMNOTqhr8gCy7kQTwsFRI+OkRvyEolzX3XBu5J/5AB8JGZ3HDf0S5gnULb2Bm1pvf
         DSIn13vrAUewJGejBikB/cTG9ZvfXJPi7j6ScLui7rx4K7bfr4fSFTke9kNDFecdIdUF
         3OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556331; x=1776161131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR8Hb0685ORXdljSkvFkB7MYYy1d73ETqakcf1ykWI4=;
        b=MMWd813fTzJCeqky/UFwK0rcvDnWYTfuBlTGEG3UMmFd1xb5UwV7mpop80VYAo3Tqn
         XMdOBEBkwVohTZzt1YHPUPt4Vpek0fEgp2sWy5eZ6PvRqWZxjOy/lFXzhNkZcbhBQUf7
         POpvJjlaqU4/V3CTaOt8Q44Sd5RixeYHDIa+PEfKXzYjthgzRx7sdP6S1muHq0IUrsE0
         B5rWrqSsPbY7qF6bVOYqUzG9vw2FdwS6yJgO+87Vgs2NBn+jAGSfK9cCSQ8laUumS12y
         XT9HYk+TOjssJFK5qSmTAx/BSydZnD+GqVfQzzk9XakV7GKd0PJWygWxVjDJi1NOV2qm
         prtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX5nfZMLcs7q3VPEURvPeq4pPEhlru9ZyH2KiM6Qng8uc9fRaur/h36LrfafNN/ZYn72QdtmDHC40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf+GZp81mvWek4EoK3Cp/pBrrfwEUpSG+kgoDg2jAjMgKJu10X
	R9v4thPp3py4QVByLWSATDQva5BlBeRfj9rpTTzEc1GL6sye5dKqciXyAZ0FV0LsiT7WU6GPqL0
	fgekC9fyck0nWay1sKGD68xRszuZMNi390dK3AFy/CO4CX+iZ5fL4WzZOetGzudI=
X-Gm-Gg: AeBDievhvMqCdm6Ojmq+0ra+ppd2SGO7QpOv/oWNX6DMlgdRhwyBZShosAV6LNOjCfB
	QLkIPnowwLXwK1dCNSbIu5uw2HxGxxFy4IoDU7pVubMgNJ9oWXDCGabA5hL6gsvTfG6idXu5Now
	NIv4tT78fhVtURSyLf4K8vuNwXZEiFA3z51yUvHZfsIQ6VvI1+HyXAd4URdFjGe3ILuaaXn8/rM
	Wrr0cs9URAiLZq3XF03DD3tlIJXTK1Z6Xoy2TihCV3xFIq9G/HWkrIS9K2lzZ6v1zVPDa9OzBf8
	WNCgvN9WpYMBiFyxwwK+P9Wa6QNUMPHowls/EPoSSLG4cr/cfDw/1bJtokkBsW3zJAPsZJbjpRV
	o2EEvY4oJ62wF8P7GxxIwVsj2Ldu+XiNbJBl473SoEzKDjjaKR/D9Aigbib4j3Z5swGtJ5HLPh5
	Af/oo=
X-Received: by 2002:a05:6214:20a8:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8a704abb8d4mr199168366d6.4.1775556331224;
        Tue, 07 Apr 2026 03:05:31 -0700 (PDT)
X-Received: by 2002:a05:6214:20a8:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8a704abb8d4mr199167886d6.4.1775556330776;
        Tue, 07 Apr 2026 03:05:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c3csm552293766b.29.2026.04.07.03.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:05:29 -0700 (PDT)
Message-ID: <30ce5340-ecd1-4116-80e8-8a0bd54a3601@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: qcom: clk-rcg2: fix set_duty_cycle() integer
 overflow in boundary checks
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
 <20260406-clk-qcom-gpclk-fixes-v1-5-7a14fe64552d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-5-7a14fe64552d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4d6eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=2qqY3NsWhw8GdsO7NmsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: G1mK8MhLplSxyGx_R65tOoHbWq05CUrN
X-Proofpoint-ORIG-GUID: G1mK8MhLplSxyGx_R65tOoHbWq05CUrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5MCBTYWx0ZWRfXz3GF4ilucLHN
 GFA9cJ9UlAmEqvLM6MR8KMnSRzdPaDJQ6JJjbBNqs88bl9ujxfb8DP3etKh8JLW8XsymsD4Gtzm
 VtjfchxhlbU2zlw24IvFtwfaq8ebQu/NLpl/W1wSs4IGBBRBjcyMSoJu5j4iylGplJEGb/V9IeO
 SrLnIPzPd1sQyrvY7A6cyTvqGNH6bpk9umdzAReHpXxYVIH5prMw/nvLh7RXWkNEMgpHhYQThpw
 Q6wQYL87lCz1MhFZHurODU+YTx44pLALBtCFuNfcQpPqFn4DAHaG8igA5WQivV/p0+G5F1Ba9Zt
 TuI8rk/Y6y4FNRaOsWcaMyOE6kcY9/jq1g2E/If0uJml7KJAU6AluOTgBcIanPiespTp12oZETe
 Z7mwFRY1sGdSthNnyaBW+JvF+t6y6/GPSuPOrhxtwd9lB9HyDe8FJee+P5RXRmlCYKR5W1+dZ9B
 ov/lIjmF0Bhm2RybIyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070090

On 4/6/26 5:54 PM, Xilin Wu wrote:
> The duty cycle boundary checks in clk_rcg2_set_duty_cycle() use
> integer division to compare the 2d value against hardware limits:
> 
>     if ((d / 2) > (n - m))
>         d = (n - m) * 2;
>     else if ((d / 2) < (m / 2))
>         d = m;
> 
> When d is odd, d/2 truncates, allowing values one beyond the hardware
> maximum to pass. For example with n=7680, m=1, requesting 99.995%
> duty:
> 
>     d = 15359  (raw 2d value)
>     d / 2 = 7679  (truncated)
>     n - m = 7679
>     7679 > 7679 → false, check passes
> 
> But d=15359 exceeds the hardware limit of 2*(n-m)=15358. Writing this
> invalid value causes the RCG to fail its configuration update, the
> CMD_UPDATE bit never clears, and the clock output stops entirely.
> 
> The initial D value in __clk_rcg2_configure_mnd() correctly uses
> direct comparison without division:
> 
>     d_val = clamp_t(u32, d_val, f->m, 2 * (f->n - f->m));
> 
> Align set_duty_cycle() with the same bounds by comparing directly:
> 
>     if (d > (n - m) * 2)
>     else if (d < m)
> 
> Fixes: 7f891faf596e ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
