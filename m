Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC7947668B
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059660; cv=none; b=CoVEJVG0mEJ5kzC1Dv9/h+N7MQdUbhYBrTcFtO/Cwv+7aH64f63Z3MlVnu6pHjbVkHecYS9kY7haoc2WNIJJ2P+BcFUkYUiQ6ptTEkXfDIGeWu0z9s0U4tCQuQDqxzzYaADKnUI7/yeBIauHEeUpGpn7y5J+krIbCO7BadVJc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059660; c=relaxed/simple;
	bh=AfazupRWWtICoUAGH1bBSGvypUPJoxkkS6rNv9KiWsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvCoMHCDgzOiZHUm3Et9j3FnXewSHDFWNMkVWOOWqy+ddcwjDJ1EqFYluUqc0DGiFSAtzLZtq4QT3U28N4LNYYOQL5w2FZLkR73FAqyqu8yWIjFb3f4vnFEMH1ifXTnI6XoqCzUinkzEo2NFwPY3fPSUSUH5KfmP2XCa9g0HYJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBIfJRno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRO1Rpsu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBIfJRno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRO1Rpsu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTvi2809312
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=; b=oBIfJRno+sYg/ngg
	B8usJs5xu7nde6QQPE+thF8mZWDZEY2amZdl06EpXXXfedfLPFu1SimGzLbU19q/
	Epel+YfyPso27KT1Pu1BXlFWuvpLI3fbiLNOX8rLYd388DOG3aejxkJdtb68xtEr
	ZHxz/vbZl0No0lv1h5wX72IFjp1Fhr16mDE+sYSb9OvLdIPkUY+2pQhxdfKWGFKa
	/OpBuGu5FwkDGb8pcARX0IU19m4mAm/z7TE8j5RdbCZgPaPE/C8CpisaHu51wcI8
	9nLYA3bHVjlIcSm1iY6/PYUz3+T23DV+a5I3XUgurR62v/oLwR5oix7sFavB/Yuy
	SlLWmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t26q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:20:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so89229885a.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059658; x=1792664458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=;
        b=PRO1Rpsu/7GJxiSdQZ+ZuU3C7xC39jYdGmY113iG60Hs7s/VJ0cUr06VXZ8HDOZGN2
         gyfR0PL2EaMgSnKZvEOZTgFEgCEnKyrg4KbrUnBtS4qC/rts3dBBWBz0CDTDF3qvwv0C
         DMrbRqC9hQx/mKQKUfCrdmkaFEf4Xn2zb85i16kf38D84Y2CFYLZrClicFQegeHkUmt4
         M+EYIGOP1+vLA37UPGPduSMKeAlgFO2gQYWD4NzNUcANsPXPCOCLFhjRmW8ybvQM9seL
         Tjgz1owknrHku7IJmL1dFtKwq2TTmSu84X7LFbpeMUoY8SR5OwDdkMIAputWvzMUJXCv
         u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059658; x=1792664458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=;
        b=CAOF8HwFhOZlJ6GBrKnJ64q0ljZIjTUfpRe8qoJ6mLlnSkhH4347iqidVO3ChtwnLc
         Tly6oAc3EQYKoLfhTOyyJ4AUiVMdxctOQnokq9XD3GNbIjETg70QxWDapu+WK58/OlvD
         MW9g5tkY+82qvoEe/VD0oOleC2tpQ38JuYrRQt6Y4cDWqt/r8hn6AEyZtaXAH5nTvoP4
         9UZkIC9VpnnhAqTuPLTqZab9gQ+pnXbjFhPxKTWdM9n7xFpSo3RVynQy35qymuw5nzfL
         lID+Y1799ZCp7KzBcr6exMv+UKbeiYV/CePboDAojnDEAGJiZ4iRuZ0KerH+P+SzkgI7
         vZKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKwxpmMPGSYke3R9o95rpoBtM5onsrzM/zK3tm4asq6L2zFpcdFF9Q8oED7YylvKQjp5CzdYBBW78=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYPE6nOWNrpGryhU9K2583ROh/BWUH/yFyyewwT8+WrhQz2kEG
	T4OcFoc6U8ka7lilOlS7N4ceokMA7svmmZWKnI6KlUqUSpo8z9R4lrZwxx5oPPwPpq112AvEB80
	8Yuy/ngHrOUc+4eHUHKwWW7LixNWPeuSey/RD/0ZvY55es6qnIOZa6Y3nJT4YfxE=
X-Gm-Gg: AYBFou1OqP8SgAtBVhk8699evibbl0s2JqxpRSP1JlXVZbKimuHE3besKrMPEKtncyP
	TgO3nyspL8JXXW4mqgqag0wdiYow5XwCoUcx2w2Ofsm05yVtPw2XOwbj00CtMnMIOQUkYyK6Xmi
	0VvndU/zlZ8VcFYNeuOVwtQTB8ApE2ilxD3uijrDXYnaea42XwbTioiKiDgjGt7xhEh14N865Z8
	9KS23nntGaQPwRaIweDNY1KDdmwT3LCsNrhctXAtYrP7f/SkoN8LjDyNKH0jHShdnphqBQwEko+
	Et28dtXm6AfODf303MBGgliKET47NPK9iQzyqbrPxSQv6YfeVMyqlvC36QOApkodeO9FpUtG8N8
	jhScoPVn8xddx+8v+859PRQ==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3599361185a.6.1792059657873;
        Thu, 15 Oct 2026 03:20:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3599356685a.6.1792059657298;
        Thu, 15 Oct 2026 03:20:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm105704266b.70.2026.10.15.03.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:20:54 -0700 (PDT)
Message-ID: <d8c2a208-1ce0-48b9-b850-2561bd37d3f1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a90a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX4+bZfMJMfO0j
 IxVLdtwtWIyJMphHs0HA1XqjPhZV+tW6cDG1AVFjxdvUPXEVIp9mNu3IjJQ2eqcX6vzq6aYNUxx
 NiHapwyqfDIJikARCTrI09qxRXkYeH6U1zpgBVby7kOw3sk0iDhCxN3Q+9ti9mRD2XjWwgP4fGa
 n8x77z+VeF89rj7MWqeSi0bgNeErnyhwpMHzUn7VA7mlDDtpOAVxnMOhWVL3Ypf6ILmfvTLRE40
 AAF15aJ/AFEVCaxeg/lsHciJnWg1vgp88rmzmAZyjI2umgT966395Tt+LluDHNMD6tUbQMFjfE1
 ZMk+TLQfsQiD3tVB6pYQX50+znDXe+3xOiclNtH38t9zUECher+GrjIFxBhuKqCE/xb8RsrL5Xy
 k2q9zHUMrz1JMqsK2uMZyh+MuT+25d+WrRIesH6M2pwmm82+fMHPFpjlLQqaC8kO8G37nYcapQ9
 RBqz1lxHNKehdOSFckw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX5QL5Fd4LOQK0
 YU59ycWj3pWjhbBPyyT3kYRDByk26PzN23Ap+uq+1mQ+Q3+4YJqA/XUCvvUrMkfUtBWavyo29Kj
 J23ujnf68PrF6a2/xEFM0lvrE7mqkqo=
X-Proofpoint-GUID: jJCe8Hvr4zatcewVtVW61q6wikdIMHKH
X-Proofpoint-ORIG-GUID: jJCe8Hvr4zatcewVtVW61q6wikdIMHKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node passes only the first two.
> 
> Pass the board sleep clock as the third input. No functional change,
> the video sleep clock keeps the rate left by the bootloader and has no
> rate consumer.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
