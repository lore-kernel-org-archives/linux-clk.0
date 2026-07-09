Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95F4279ED
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598512; cv=none; b=D8Hg5F3YaW3H75HyUsCBeV62/SMeoJM5YMNRpJgKoBCS73Sd01ssO9dxhtxy6pGLnrwWrT/aZqFfANQCCuTi6yJydhqffAQsHKSLvrT2ZakabJZj2DDoMkdOJIN35PUkVlu/3p6Hu0Qv2OTIiEKXJutxdVdSMGD1nggb3lKAVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598512; c=relaxed/simple;
	bh=T8vWUTc/hDoiRVM9ZSQgSy0Glicx4wdpiqsdixf2nhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F35tGwhSLAyNGJ56pnbhxk5GbB8fIVoHnt9kChKyg4PDI1ylwfU3A4/Peydyk5ihkjYUkvWdqrq64rBa5MtCbr9EHj4RD7JEJg8P1W9CGezTCwVK/sC37DT9+DjoayOpr0jK4rgNEyLmD2pnj2Tr1j2mPFmiLRTZmDv7OdoFXxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bV400bX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQn32LpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bV400bX4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQn32LpX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNFxQ1716380
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 12:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=; b=bV400bX4pgrZOO1x
	SyYkxGkc532NtLElCvba+j1rxfLxEeXCwq86xr7wfB+a+NoxjVO7iQVbELle7KvM
	sOgsh/pOWPExaPbJsHnxn0L5ZbjQNDxWFILrMVcwl2al9WsbdgqLqxkbDoZTIbGk
	GQaxhPYFR9miPsPZZYnUMPUhaQsjalGl/9WgQqsEz2W1BrJbNeLNinr+lYJbr8CO
	hk6NCLMLcKWet0E6l90SJziaLvoNwIW3zQ5EafgK8tosiwMJyR6BSB4bwzjZYwM6
	UpmEsKtw1nhPXnfglk9jjsTNfHQFF8RXiRLvQu0Jcd0yAM54j1CWmxZ/qQeuRTTY
	J5qQdQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vup3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 12:01:48 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6b5a8836bso787016a34.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598508; x=1784203308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=;
        b=PQn32LpXrv5YgQigWMEyJcWqY/zqDmZ896xikr7OYl4iBFTzLcb5e26aLt1HQhhXx7
         9wgu9IoorVbHbYxqq0g7gL/yKO7lEj46dxgmvxv71jVihc41lLcq0drl0wFef8Edi2M2
         9vSSYlh8PVDR5T2IsA9ArXGfY/m4qVmM7PBvQnstDfzK0HrktuxzOY95XeN06HI1jpCA
         2g5OhC8rmhLQVT4CXI+hjHaiKe9GuXwD3/VtL3+gi5gk58n4u97mBmAHJTm4piQvahny
         4saBKVsm42yJZN4o3giDt6gF9iJF//OGJGnFutQ2d/rHpc0EE2DZiwnmUBwfq2IYtcf8
         qItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598508; x=1784203308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=;
        b=Rmbok8ypprNOgT3+fXNVLfTwGotyIDrHE9Gtee9ZKw7nmYDEq64ikTQs7EPQaLm48V
         kXfwK5YVuzGSFC8f2mJiSORlu4dsoXrG5rQiKsqwMQDtp2HPLKWdP53y5vifpcxTEpky
         43lQ+wzhQMZGR+asT/EMJ+5+TS4cRVjcI3QplqdvU2WV+CNNukVpYJltRbyZr++B7MC9
         Gx0SZvs7H6DjQzzktIWY1u+laJqgEMXEgCr6gRRbf2NcdoOic+wZXOFFbhhwEweCUIAJ
         ahSI1A7grAw3XX5Uc7Rm6tdmNpRoA9oMwcP7c7sj7sP9TPLima+bi0aahoXjtb5FBhCm
         gbSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JTtbV5bWldZ+vAH6CIl286RembZz83+x9qqxMimCN0mhoVLe3txQTxqTAhtgOt+QAk0rvy+vgjY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynEL1r7kF67pZjhsab+Ml/xiGD6Lqy9b+g8bxt3ZqTp3DMidVp
	ACKt5YUJqLV7Bwr5F1P6IIQviuCIF50dmAqUPps4IdIEl2fnvJ+20KKyibPwgrJVF81x7h8UUE7
	yqvhXwIAiMKBivubau96wWPx8JpSD91JJfBX+XrtxRf2jI+ztUhQoSbD6S+2gyfM=
X-Gm-Gg: AfdE7cmMv7RPU+fYaGlCWOd+GlLjrJAGztbtI+4EeFRxsh4tNxUjvGKgDYGSKSqvZhk
	P6B8vM/huWNxV499+uTGjtI1MTG98Pc5fSXwe5d3rOymOcOVO1meqFayPTW6TFxr+55fuPyPzEt
	qHNgy94c4OxGDOQ6avzWHT5XDJnwoa4tWTw1ONdRBU519mSRODzHyU6xtXn4VTVIotG3QTDm9yZ
	nVRFLUZEcqVfFeYfZxWmpD1owCCqlaxsBqsiJSxWgWGQQ7zkPJ0rozYzkm7nds+uxXWZTB2aeJb
	ijZFDi75S8t367aYT7DpdKGTG910XYYvJ6971kuqkjmgDY+y/pWMkLNpTSkltL4UVf5sehFuRno
	6EHU+g35iXkRM91KEGL9IYTvpbVKbXIRCM0Y=
X-Received: by 2002:a05:6820:c44f:20b0:6a3:6bb0:e58d with SMTP id 006d021491bc7-6a3790d0157mr1184959eaf.0.1783598507691;
        Thu, 09 Jul 2026 05:01:47 -0700 (PDT)
X-Received: by 2002:a05:6820:c44f:20b0:6a3:6bb0:e58d with SMTP id 006d021491bc7-6a3790d0157mr1184929eaf.0.1783598507195;
        Thu, 09 Jul 2026 05:01:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821ae3sm464361766b.5.2026.07.09.05.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:01:46 -0700 (PDT)
Message-ID: <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PUCvD7m0BIKxE9x4TNyQ44Ks4ocd3y-W
X-Proofpoint-ORIG-GUID: PUCvD7m0BIKxE9x4TNyQ44Ks4ocd3y-W
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f8dac cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xaeihZ6KTXLYonzE1EUA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfXzD3bA80FP1Gz
 9cRod1d0R1fVfQ0cg4sRlgcr/oUDrPTseLzg4yPOH1+p7tp5E/XxBkZen/kAcYInTRGYH6kNCFZ
 afyIbZm7ptrdRU/UxswbVdhCdX8BoUPzNFhj4vqGbXWhCMy9wIbUO/v428kOk/nCOLE+5eDkvlN
 nNOhBG1JtSZu0W3h55+cRNuAt34Fzk4RkynGyLSdiyhMvg+MhdssX6ra1G2fKE13AVcUY33ZjhI
 50pS9gbbhXpoqXRDT+/lrcigH3LJqfyFxiF+vWD2GRfIimOdcRHbwf+6toJwhkNl7EVR70XvpD9
 xw2Cww1sZIqPD9OhcqLMXkYEAnOx2cRNLSiCRvH1HNYdZ/iSFmqI6MjMHod6bi6GS/I3eR1DY00
 Cb6wLVQBcdA6i6mxQvkCVs4bbPFuw4jXoSJe12/XcEBjI8QvRyXm803L0JOecFJItpZ3D01R9Uw
 6fzoBjnf84c9hPicybQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX6lifoeSKveOs
 ftLH3guAUWVv/rt4z9hycKUIp+1gK/D5ZRp/P+OOgn0ry0PJCHL7Nh57EapYMkihinqjbmHb2gn
 P+20t15V7tXHq3j5HBeiWqyyX7brE/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090115

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]


> +		audiocorecc: clock-controller@a0a0000 {
> +			compatible = "qcom,shikra-audiocorecc";
> +			reg = <0x0 0x0a0a0000 0x0 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			status = "disabled";

/* Owned by [name of the DSP] firmware */
status = "reserved";

Konrad
