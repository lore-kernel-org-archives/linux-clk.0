Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13901A8F97
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131623; cv=none; b=j6NCpY/r6A8rh10z+zvthjJEXCEL6w3ikGrLO4NWmtYohMcxyGv/aFbj1kUMVssqG//AEQy6ne7xrPBBVI2QGphS30KqOJkE6DDCxWorvqk+CvMqJi4QU11mKi6/w0/SMEbXrI67HOk5kggxLRjXvlo2eqipR3baJOHhFtz4skw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131623; c=relaxed/simple;
	bh=kNcygZ+QNmGPyzbzPmnz7mm29UpTUgUTox3crVZpuJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zmze5HgYNDTX+gJd44qqMqC9Dv5va8KaOXFHuu3d5PMlmEffozQXzkWD5CauaR1/g0wED3lQCQGMbV+EBzOP1X/jrlP3u0UXPABfpIcUoYUeAAYhAsMrOZzQv2NGRbg+6RSX3EZMw1j/BAR8lyxHhv7u0OVdEc+jQFGERaPApi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bT/df9H+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYW0ezEH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bT/df9H+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYW0ezEH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g2XY2257286
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=; b=bT/df9H+WNfR9ZpZ
	6tK6DO22OH/1VIlxAKi1nuOE/EYqY6cJEMOrVx+avDjnK9hgdnwZf/gPf62S2A3W
	BK27lLIoMk2V7N/jeJ8OYEWjfI+8IDVmkOAeuZSl1IaJqVYXK0zwivY+X1A/gGk4
	7z9xZbxUUWfDjQO23Bq4i1GlEmtEcOhGvIwEz/GjA1lGoM+1+Byr4vo3qgmEBQ9I
	mXhAoc0B+/BMADQ6CWELldHnTa/+e7PALvynfcqloyCtB1Zolf/OSZZINASxfv0/
	+bkAyZZILuROTU6sBXtIhPy4dfu4YOdNFxKP3XOOn+1hC2YO37x/hNCgbg5mfqPI
	bpre5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmfgvsgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:53:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so4158576a91.0
        for <linux-clk@vger.kernel.org>; Sun, 26 Jul 2026 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785131619; x=1785736419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=;
        b=QYW0ezEHwz350uNv+KsxlCd7eDoUrUJQqt7xL5i7dOGIHyjl6pbHhgJp8xVOk1T+xR
         LcPnp0lK9rzIJQEaVQudXYM4NpxZZY4EIz2js8hq9eWRFQpZS+nNga0VD09UnHczMT0I
         oGWbnt9C9c8r/bOFU69RzzAIwwoGwhg4T1+VrLp6zo3LAL7pH4tziT4T2LrIQG+qG0Hd
         VRf/3RnVu3+jm9ZiHH5WesJFbePLiPBTKxIujUM44CUHUMvbkzhWtOWZHt8nL+oeKYFX
         9QzLa5qiwoSyVKpReRyojlOishkKVIFQVH4HGBwT5sYLgznovv8dGllDwD2LDYYtVG5w
         WNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131619; x=1785736419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=;
        b=K3d4OOjRGzmi3QNztk8qWoRvYhy9PL+l/krcDUoi+WcjgDRXBb/XC0e0Ic7ZedBoS0
         Swqsh9BBEG+OfxlnZ1ey+9LogFniJLS2pkw1kUX58cZ7R/khPKJoVRlUG1pa3ait29xJ
         fdfF3v7ai14elatWkUmHfPCSnqdN+9AsirOACPJ3HJaM5QX0gNrWnYB0WX77aMfaj2sT
         kUuYlk58jcW+SSseCj9AOdIvahJFcpJiIFdT5hb38YS0Ic2i96RcTfkK+5ll4bYG8u9X
         YyGveXoRDSA0AvWtmetnCOryL1VARrrKP9C9nLJzuUvRXi+uyWZRySt6BkFRo/H2w7Ef
         /4XQ==
X-Forwarded-Encrypted: i=1; AHgh+RoR1YZp7V2rYvx5aVzASxJN+rQD/tahLURjdijN9LpH3Zo4yzuUWWzYqTVgCqRpKFTKJRSLTC51hN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8u0NODwEl7/Ize0c/EoBD4wls0+M5uW9cR0KI3ffij/iu3thD
	Hx1AosXcfMljVa0A/Kp7N8HWSIsPWl7RJa26MA0Vt2OSoB9pAPAg1UHvcpSH5cfMtEktl44tzYw
	otWxJBqbb2DOXVF7Jn5LAxNaFV9cMVgkoIMycQt9ggLcTtaVCRrlqF0xCgUUl9PI=
X-Gm-Gg: AR+sD11UgoQtAyUmtbAKBfuIXxUQsgYKEGKKveGB2S1+4YMpltVrfcBnRqQG1NKL2hx
	OpyWR8cNJVMtUZE43PTAinmRPf46WAnXMC3/jFvyFx2y/MUMSHvESiKVrFsyu/TqQISs35E4Xvk
	yYAhur+VZ9ORMUBQodEIAnhsBAJrbH4Da+mME5vbF4R66MQ5Blr2PsdO7VDbWP9azpok/V2idC1
	qGyedDMmN+mdPSInN/JGyBAvLOBoXvOXBCCe2KqT6VFOY+LRdyk5vSiSNQcCYz3mc29QU8qwrlB
	dEHWbM8ydQGSUAd+blAtyByqyUI2JvU6JUOJEj7Zqg6CRKIO/4EC15zSwCDWJakOnS0W297/Td4
	nP0jdtpfcZDiAF6A1JwkZpVYD7Phb
X-Received: by 2002:a17:903:388d:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2cfde880cacmr67725205ad.40.1785131618822;
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
X-Received: by 2002:a17:903:388d:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2cfde880cacmr67725045ad.40.1785131618442;
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5cd46bsm28828555ad.21.2026.07.26.22.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
Message-ID: <511dfd42-f0e8-48e5-b02c-8429db1a74b1@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:23:33 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for Hawi GPUCC
To: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>, sboyd@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, mturquette@baylibre.com
Cc: mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
 <20260726-gpucc-hawi-v1-2-224e7884cf9a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260726-gpucc-hawi-v1-2-224e7884cf9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PsoN36qVHojATg7kd2VLuWX8Z2i6co08
X-Proofpoint-ORIG-GUID: PsoN36qVHojATg7kd2VLuWX8Z2i6co08
X-Authority-Analysis: v=2.4 cv=GdYnWwXL c=1 sm=1 tr=0 ts=6a66f263 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=I350RTvX4N0ih4XrwsEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1NiBTYWx0ZWRfX1OailkbHST9l
 JrUsnhqxk0luqdzdIKOhjLBcwXPI0J6BEkzTZZ/Ugtu5aqmcAk9Wvog5K9UA1Oq7EBzhCJ0tBy7
 qJrXhAwJlTCdFxJgKJyd/AzMx40peE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1NiBTYWx0ZWRfXw9pHGM87qg7X
 HqUw3orymYRcZHu3WbhkXdciifB4kVPJmNA1bdun3OPnkM8N6FM24plXTkT5/ykYN5BHhh3tdCJ
 /BWx2el0kBb8LChWI2++Y31Gc6KQEz8K3i61XvVcj7okj8T8mIES1qE5Gj0rcj4n4rZNcJBP0rH
 DGZ0MDCR4sWO/6QoIRfqPAlHLdJvAmF3q14TtT5PwXvj2qJwIcJz1j/AytEZ6Lc/KzK91Rtg8r8
 Wkti4b1scLnMfT2vpZQrPcGbENlRVX7GUKpfsXGhA8UkhMTDA1yGHfG9L1bp9FQVYup+5Hfwnuh
 7dDfbNaflQucWKhJ8zrshhdTq6BbU1Q7Jnzj8g4BNTRR9zMEzMhp8kI6GUQQQspUIjgd7z/+ft9
 tRTq5e27opqOX0F8Mu7nl/5woVUX/dRSBXLHu1jTyzTj9SVl6CB2TTPHOuao52bJow+eJpKM5KM
 SY3Ur8gitkBH3c29SWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270056



On 7/27/2026 11:19 AM, Dongfang Zhao wrote:
> Add the graphics clock controller driver for Hawi. This provides the
> clocks, resets and power domains required by the GPU driver to enable the
> graphics subsystem.
> 
> Reuse the existing gxclkctl-kaanapali driver for GX clock controller
> support and build it with the Hawi GPUCC driver.
> 
> Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |  12 ++
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/gpucc-hawi.c | 461 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 474 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

