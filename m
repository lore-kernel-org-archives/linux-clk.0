Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8ED3A9D91
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809192; cv=none; b=Yi/E/Zm6fM2Dkj5PzbD6JS3gLGHnkCc0YVQpqGanml3fcmPpIDDQWgw8fudvS/FBhX5OhpLSTMNqN3FCgLk4QamZlZMlrx+JV7gn/UCWL7taDq2uMHBBqmWWUKba8xjVNHuqCCXCPFs9pmSdiSZXTd1G1W1RgJVvg4BvfXoKV08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809192; c=relaxed/simple;
	bh=Jdnkgn4TzM9FmMI4HNPLlzFfbmreK2eV70pDyocbis0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siLI6kzRU9PZuQctIKfae0rAAMIHSRA7KmbzlWU3xWFdB2eieSBbyaPWHOqzeErsDbv/jHRsTdZSfpzpl5dYwOZMgOodrBXEoJCuc+fO6jEhxEGxIY+LzC2b8ANZDKRJb+0iuYhlVQ0RP3hovq1qgy5gSkA7UhaZyqJHSIJPXms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCHDtMh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+tNAXvp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCHDtMh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+tNAXvp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbHCO2022741
	for <linux-clk@vger.kernel.org>; Fri, 6 Mar 2026 14:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i6f1COXjYeremRBrKM7FlVp1/afp7FpybumgeuDEdSw=; b=WCHDtMh6w13y4pb7
	juxCuUiLQTLu0QFKNgeo/e6JQhRW1WzJ3m/oEF+LNJWowihVh0hta2MuvFcdxpDy
	wG5P9nRzPiu8C0s6WCtdGvXDRE2820iDUmj63SawUgoiNRQxbwRq1TTsb6kdVXKe
	L7Y0dunTtbdGHcT2cKlLGZjZNcu8p6GSFTiA6i2NyMp1qlUsQAGnHlrl8jj7Ww4K
	YKf4nvOgXn4d4ugfHvLUZHHFc/c7Fh3QuD4dIQ8T9rgQebV5rGzae/UHrt3+TGDk
	p7rmEJwPFSOPdfFwG/wKaggH/MqWmGXnCLBlielSrz/0I2mltMsFr73SiCTCM8p8
	9aLQmQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6bjb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 14:59:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7396634bb4so4316847a12.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 06:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772809190; x=1773413990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6f1COXjYeremRBrKM7FlVp1/afp7FpybumgeuDEdSw=;
        b=E+tNAXvp8TXZbs7/y0qFhG1m7Royf++pegLHoDGeKiHiUrWmtIu7ggklPwIf9GVeko
         r+3s0wg/PHjC6JHSdA6a2G7zCrmMZtbsuKLgB+G4yNiWe6Ei8j92P8FLMkr/WIJDyPpa
         dGfRvmyA8SYxewKsAhlWMwt8CtSBqlGr7Zmety19LeHQCtKn9AqQIvwZ3H7G1Y+JA4Pp
         95oA9vA0BD5xiipZXulqfvECQA3HT4BQUwTlUZTH6iurYEvh1fJM7UuQPMKgvgmxSjzL
         ejamVhl60yMnZp+BEfC/WYfCLLwrULeQ155BMi5sG+98gUPy59p5GCjQkeewTwpqFhxE
         49DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809190; x=1773413990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6f1COXjYeremRBrKM7FlVp1/afp7FpybumgeuDEdSw=;
        b=rmJnyadHkb36WaCXfPcwRtBxgUfzqjZOdh2JUYPTVDvCKs712t+k5oMkpnursHGUog
         houKHjo7UdfzbbFys2d363jQWTKC+JBtqv+T1gWk9rkrCQSE2dkwMkE1i+T8DDIDKIHB
         CrnoG3Is4W0nICHSci92jRW8C0Vg5uu6X/YqHcMl3Ug9bRBkT0Emoztx4T1lJk9w5mQL
         fzS4I0Xr88nkPXs58z+SoMev9NsYjLSkUcbBcWvLNeeUeM2SUJ5CdwQDbdlOmHNhLNeS
         rxpmVpoy5s8E2gHRUGDhhyKwDmgk9o3MqOCY1/4X9WKUtabRCLIXazaTpBBno3fi2jUb
         s8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXHqiYsGzWOm8juyHoZP3pKPJE4KsFr3O8frF2mfgKR/VoZRbSsh0OpxJ9DjuA2QVY+Gm7Lgfhk9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAmiiKaG8sSdsQZuiaSrZNSgyyPzWgb1SE7KM/OI7wWPih2OiW
	c/gVMlqn+rYbw0yGFMflK3Q9HsgvsyKzMjWqLRpFoZc3ycMQHQAy6oZ1wIhdhBrXOEPAUtZCO5z
	sV0Y8OcAIGgqXCUcQqYmevVPp9z9xQXSyuL7KwPb1TddKQ7zEIbSkgnF/EP8ruzo=
X-Gm-Gg: ATEYQzxJZSHoMHj7sEVDDfSM7K4R5rU5q/RAQGb8i3vYKzz138VfCLcx2BMRoUVxm0x
	zBRa0aNmYv0en0bZ2YUv5v5lFpSRqmCdrEP7Lnoo4QwysZ1eT+efrK1+OLV/WzgX/DwRcSeu7M6
	+pjOKsxxQApMt+Z0XMcUT8nUBdhVIQr+1be/UBgQ/6LF01R8C7GXb36HSmoEJvD8s/u4O4E4dt6
	p3MWXrejbGpXoXUdDQ0EMFYdX9ASQrLySjREpvhxPiDRs5uXnq2XaemodS7x0UyTczVO17+8M7V
	PVX2jFpdTZeX5DMgPxqs0Rt8y8uJkGYJZJAbMOTECiS2+DHjQyvL9QS/iRFOV3MEkbN9TBtvV7F
	nHn0wCQ6RrH6VOnNHF4c6zgTAhMtg5tAFV9vLfKmd8L80ec7grCnTIjzF/bewY7h61BrbBuT/U8
	N/rTkmkPhJUW4=
X-Received: by 2002:a05:6a00:27a7:b0:81b:1a87:9eb9 with SMTP id d2e1a72fcca58-829a2dca08bmr2370408b3a.25.1772809190243;
        Fri, 06 Mar 2026 06:59:50 -0800 (PST)
X-Received: by 2002:a05:6a00:27a7:b0:81b:1a87:9eb9 with SMTP id d2e1a72fcca58-829a2dca08bmr2370387b3a.25.1772809189723;
        Fri, 06 Mar 2026 06:59:49 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829aeea8644sm117824b3a.33.2026.03.06.06.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:59:49 -0800 (PST)
Message-ID: <cb5e05fd-f83f-40e3-bdf2-66bed449b6f0@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:29:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-4-dbbd2d258bd6@oss.qualcomm.com>
 <1d92329d-139d-49aa-8fc4-515e7c574774@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <1d92329d-139d-49aa-8fc4-515e7c574774@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JWu09eLfoU04NPa12xVZ0kkrO6jcVZE4
X-Proofpoint-ORIG-GUID: JWu09eLfoU04NPa12xVZ0kkrO6jcVZE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NCBTYWx0ZWRfXzYfc0wYY0+4Q
 jb7xacDNEf1SftU9Hw5XUmFklfSjKSfnN8ETiJ+19rXXR2illNJMl1PsFxCif/Mn+bY6K4/41Q7
 NUcPEQnnKoakzabR8kG6nnbfNRuxRoRsS6ZstfcCgjX0uuca1KxD0+WwlxgPiL3htC/yCBFGnzs
 LP5PPrOUI+FcIn8/NqxrcrRGAk2433dHLcDn+URqRMHzt8aGgTzvSh7nEfKqzTguJGwEf0ENRF9
 CJ9xO6IeCFecWBNF5qi6DbjTmf1RV4OWZthcFe+adczgqP2TWjaiGceG02PMFPF+5owol4CUufO
 1bO1HGDPb9pQLHGteu2Am2cShvSMQNwbg1FIgfyqCX6/O15MlAoy9pzwpTQmhPjP1eqJjHKSJye
 cieMLMofZYdIeJC7qqxSok/A9fch9jygnrdn6miW6hHt1k/iyHYZxDUjJalA745ARKUz9xucxQE
 dNF7vDJMydwqyVTe6mQ==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaebe7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=y2yTRUwKQ5IGBUayTIQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060144



On 3/5/2026 1:23 PM, Krzysztof Kozlowski wrote:
> On 04/03/2026 18:40, Jagadeesh Kona wrote:
>>  static struct clk_branch cam_cc_sfe_0_clk = {
>>  	.halt_reg = 0x133c0,
>>  	.halt_check = BRANCH_HALT,
>> @@ -2398,6 +2459,9 @@ static struct clk_regmap *cam_cc_x1e80100_clocks[] = {
>>  	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
>>  	[CAM_CC_PLL8] = &cam_cc_pll8.clkr,
>>  	[CAM_CC_PLL8_OUT_EVEN] = &cam_cc_pll8_out_even.clkr,
>> +	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
>> +	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
>> +	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
>>  	[CAM_CC_SFE_0_CLK] = &cam_cc_sfe_0_clk.clkr,
> 
> Continuing review form bindings:
> So indeed the this ABI is used by X1E, but commit msg completely missed
> that - just said you are adding X1P clocks.
> 

I will update the cover letter that both header & this change needs to be picked
together to avoid ABI diff.

Thanks,
Jagadeesh
