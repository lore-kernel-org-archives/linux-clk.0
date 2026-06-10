Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EBB3C0600
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098861; cv=none; b=tPM7bPpevdNI//y6DdqDt6znccEh1SWPYciGhb+r1A/S0qMhA+SH1L868ZphMqIRB1bnYJxeAl0C4zx/rYkuS9xJvzZUTbR/sU5BGpm48nyIai170JH0Akxjtkxj9KSnH7Q6IRUCAF+p81tS3Cc/nDGP9oXjmKaplBE+UmEXpDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098861; c=relaxed/simple;
	bh=ejqGpVngTlW4e6yqJhPVr8yHewagRkvbmYi89dpAvRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCl5tmRVQ+jjls1ONBfYUHNChSDJXkvVz0AzDIao2G37cj6shqX0mJBTUcCnbV9xWXib5es7X2D1FVrFTW2j40tosbAQQH9/mSDxgT7k2MYVKzWCrfyCf3fQcQn7AWIxiANiLwjk/H6cZd1hdwMRLOAiDGbLVluUm1M5ixp/+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdquW7El; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKnccbxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdquW7El";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKnccbxN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBeAg1137399
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=; b=UdquW7ElaHXlp1nE
	jaJe10Viaz2Z2oOme6bu2k0S+6ouGHUfm1uK50PAFo3gtt18P1QPezgZgcWRSHiu
	Z3gLbz3L8JCVqWBD2+cxqaMUWjo3JIVa7UvzI2t8cu6OF7Ls762ooDMNcQzs7ZsV
	SdihhVsYgc74AjZsru4BhhXWwvIOyJY7BPI1jnSYJynRVa7L/xf2hczScn5Z6TzY
	0Br6e2DrOBoMzvpSz+prv3uX4w4cI3DTxnS8MMYc3G+ECLpZ7i2T2Jt4mAP0ifif
	KWRt1vnJ0LKF0vdeI2O141bP+OnWF6AxQJk3KATKOeLREXuHc626DjhDxuME0VNN
	PcKIsg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2qwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:41:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c5a5133221so256777137.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098859; x=1781703659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=;
        b=DKnccbxNIStGN/aGFP1rhEmj98bIaaJNovkVof0S5PCipx23uimo6U4KIru4iNV/CX
         U6EIuBcgqYNwuFsgvBHrqWC7nvB0P9ENu0rKaxKkWUWQSuaeSQmT0VlkE+B4r9cYfoIm
         DtuHa/IDTDfNb9FTuajqHdpZppcG7Rin7NqIySoZJWK80jqHRfCltUKy777OAcIDZZR6
         ND/HTcXSg5PoP6nEPGOzMoTDs9FgxnJq9hMIY80FUwGrIej1sxhIP+fIBaNlAFkUVqNk
         1D5tNqJ3Ho65IGAr8m32CybXRPmSf54iO3SbLEeQQjKXWO894aOWqIH++DvVDjQLhw5Y
         XxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098859; x=1781703659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=;
        b=iuSFNOC0dLbkExqOArwpQZH1EKflZLfxQC3u5jX3E7cEL4Ti2yB8/Hbz+Czs/cFUGG
         tV+v61Vexf31zI00ucDRJRLHAtlHVtfT2QwnV/sFDtcLRmYQRgB4NuPTsOSxdKQg9/n2
         M14eIZnJmssWS7ZG59SXCM9cFzIINlNf7DyU0jjss+3YXDoaCP1q/2PUvBoLmmYCzxYB
         qlJbu8ChOpc63Rv53ngm5Au+gCfoOVTczy/yNUJgMK1jZNvB+kI1plA8J5kDlKynNwlB
         44C9fxjbqSwJQQHDNGBBfiXykrAS/qvuRAzVQbFsYoo1ujcTlG3hMnlKQrmzGIvrRKrc
         PFgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1LFtDYbbseHQ/+5fhk2XMqJURLvbg4cNEjUc/gleTwAAHNhEa9WHZ8z3MhkmVqsS3QnC+hsdPxq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPGwnU5yUeMbqvaUFUXNBWTbbhYexUGpTX9fYF1zM50gFIeRYB
	grHOVQPEIGEfkFqtzJTpagJjT41w3xF6F3OBlH2tHUh0QjQEc6K4svLXjqwSBiG2fEZ7yxzgQnu
	oxHN0taYD0su975Q+dFyVNDlfkI+Wf1HFm6Npb2vBIOsuk/aMRS7Q4jD+Qjq8RCU=
X-Gm-Gg: Acq92OEXSVXlgcRJLhizINdt8ebs3NLCx5ODJnVT+C8YU15hQSO2Bv7ZynQ7pcHN219
	k0n0ABqx+BJI2ji78CqtxEgcDIwcmOUl4srmC3hzEZb/FIqNtMBpgmI5UJ3a4H+4pRsDkMNrrvE
	NRUhfUiBEZID/XG8idoTEy1xUuAob5V8BNsDWeFwR0qgZSFb9WZzTL7oUjDcJt9lh3nJW/pahBf
	a0LZEykqnhDrdS0x5sEGf0PtjGpDPf2f6P7ShYhJNt3U3OcajOtoWxNRy4GpD1k0ECC7LJMdzob
	IbCnEaoBSq3bMF5qy1b2T/kxM+ZU/Y0VQbWO9l4vVKgo8Yutd1vZss+MhNw7EAIwVxkwbMUkEcx
	tTKoc/wYwBYQHjaQ7ObrPMPBZaCa78RYY+NadZ57q+4IRGz/eEMh880Tb
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr1528733137.5.1781098859031;
        Wed, 10 Jun 2026 06:40:59 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr1528730137.5.1781098858612;
        Wed, 10 Jun 2026 06:40:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac0958b5sm63677961fa.18.2026.06.10.06.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:40:57 -0700 (PDT)
Message-ID: <70afc705-9d95-4c44-905b-a471064bcde3@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:40:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] clk: qcom: gcc-msm8939: Fix enable_reg for
 gcc_blsp1_sleep_clk
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-2-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-2-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX8IkuffF66Olq
 ePfWJlIJOe93zcUrHswseVCFpozV1ypUmZAWECqFNunTenj/TrwSTba0h3nttU/5L4k4NzkjPkz
 5lBS5yhTkRqVb/qV5AJypa3OWDmzOFFAGASXqivH66IPVK6InXtSVhsbuUG2M0R5iDDyWrLECxh
 JsXO24B/pKbIO9NeygOPOGXQlzHW5wT0DhkGCS8kKj+d6+hWnx78aibD/PifwgbaiAszBMAY9LS
 98i9A2DeZxleKVvinMQC6pXlBw5k1JC+pc0FEKhU0Y/j0uCLryPMulWUHBSxCK9PxzMJ66Ec8Kw
 K9NIv8c/N5AqY/S/b7NYyTmTmbOdV7WkhVt/anXQ2+u2paG5IF2SXblCOQWwO8EmaoBDKMX4AB+
 NrSE8Swl9d1rh0nlqYTxmKytb1TVqfnGlIuV5t2kXQBg+1oKE4eW6wbaaXwnh6ZL4cRCyFVgtNA
 cpj4G/W9ZkPSI9X4z5A==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29696c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=94LYJJSoxN27RZodj4oA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: M4sPO8kIq4ZyOXEz_VRND6BnlEmuGfY1
X-Proofpoint-GUID: M4sPO8kIq4ZyOXEz_VRND6BnlEmuGfY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> MSM8939 is similar to MSM8916, where the GCC_BLSP1_SLEEP_CBCR register is
> read-only and only has the CLK_OFF bit to check if the clock is running.
> This is a shared vote clock, the correct way to enable it is to vote for
> BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).
> 
> Cc: stable@vger.kernel.org
> Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
