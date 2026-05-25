Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB65D2FF147
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729570; cv=none; b=AHDitCyGIiLm5gS9tdGzFSmUVcBGLXS3esds0MZJtddV3owZdyg7heVmEEOPCvPoWwQ1L29YfsY3rwxikWDLKTfA/BfZ2k5MWwmUDuYNvc3DniPh5aTX1aCqs0uanFwftd0aohH1+quDc64UdSaIswd358eNOkhaWijsyOeUTCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729570; c=relaxed/simple;
	bh=zkiXMJywtjomH4ExA3n9dnkhW7Al5fabmbNNmU6ozYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7zk23G4IIBLyFv5s1TblQ+mAIiSP2RDOCdQzSDxVehbqgyUOlpL5uIjRQ1xidRmh55krXOJ1Z//PTJ4ZrZ/39CKa+XuXRHPSMXEmWBlHDSF3B73OF5jstLIQWbW8PIofHxpQ7H1wILSYOf3x5z8h/VDcyvnVr7D+KqrNiAW100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9LzIX3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQCCLneE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9LzIX3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQCCLneE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PEHLAg3063497
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 17:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUOvn3MZp/wvYfz05jfdn7SBbQ984RFb/LCTbznHnzs=; b=H9LzIX3lQ6ZM9Mkf
	BO71saemv1DolZfqttLvgjY5Wlr36zPWYk7fR2jjsjQy2DNFU22czPFlygWhBlCi
	xs37o3MICpASRq0bma/0zeCFFMXeuUNitzX24vsEHpGm+tuDkXl8kPi2u8FynyDq
	LWQV6CkEDW7w0tvdxzMN7gxEfYDUSf/sA8/ufgTdv0G6QMiwQ03maFMpNhdmeA3g
	mJIBzNw5UIxlPiJubERRK7LUDqFKdeROatQ2CM6kmkIR5COb1IQ90dgkWkMGpCDR
	/1Rl5dQdK2V9/fNrMdf1wuHXIeYOQZcF7AoVkbNTYJyWC2ofThXkr0KqLm4rLXS8
	B4aPJQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1ghyth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 17:19:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83836443305so4717163b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779729567; x=1780334367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUOvn3MZp/wvYfz05jfdn7SBbQ984RFb/LCTbznHnzs=;
        b=RQCCLneELZ4gKaQ495slG4BRL3NDQBXmwfFdoyv94ZnClPd0GZ+N/NWH6sO0zBV0aK
         dfIlidfDc0Ptz1m1LnRUcAd8TxiWrq/HVm1jyTvhMZPhveEj6QkJ0gQaX6AL2ABXwXvr
         GI7CuQD+XWPfNoWonfTksGPgEvxs+/W21OBE3C9OGJAgwaSlYliSa3nwy4Ny4+iwFpW/
         zIp/adEiwuOW3pglhAyaSrYO3zp1iNjM29NdDfyl8FR6YV53JtswBCFHU6V2LNeJH57d
         gklLAPQDzvVjQNdhVh9Q0jYMPNYdXw7TF2cNVuu2axPYah/FGlc/VqMOdx0ZTxJ9xQDT
         Y0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779729567; x=1780334367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUOvn3MZp/wvYfz05jfdn7SBbQ984RFb/LCTbznHnzs=;
        b=bJaySdVS6CVHRjjGZXKw+VrAJbkFsI/KccGzO8pTzQlq+aSUhYS5+j2QQGEoZtrscQ
         xu6yu4CFHWz/CEXCfhWzeBfvzePBFQItE30/oS1jh9pAMlHCtAiNpfrbfrorsrodaO7G
         OcTx+D4LYgvRnAQA3az+jCio3awuSglXmSBCpCZvsaZm7jJYInsONJFFXviNYh0yS2vT
         xEdaiy/srqYaIi/Jg3s9VhMziZEsJVgnNZbYzB0tcruBthDrsf9sMGdiszaGFGVfZBN5
         f9xl8A0yDJ0D+tdd19OicMvfwSoAXfjxP2z7hqYapmCoZugboT+xkwaiNrZt+nRtg1Pg
         a0cw==
X-Forwarded-Encrypted: i=1; AFNElJ82yfZrCb5htaRPCaPicoccz/ZDaUgQUHUCIaA9WuSSDgF8mvvGk+W1JLvflyLl9XdF3sD8gXwr3mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyinUljoACpSwoigtMGnh9RiMu4FEFSbezFkds70w1Tz1uZRU6
	GkwV7tuVW5V8qgYf5HRe2kRAE9eVsDj8kR+y5KOpWwnikfuQsvynvhNW0+WCYHCBCIhcyIdxKeo
	Bx0B5QEpVEUq3UAX3xmLebLawhDQtd1xgM+9vANPnLBQY8Po8QyB+zlhOFc4wiVM=
X-Gm-Gg: Acq92OGXXmnS0AFBA9MaROMIxWbihWxy1F+7UujC1ZllocJLbYH0yieTV2REEAe39iv
	48gs5pSW0RmfcVB2mWfJFKQSejF3d1nbBt3gbSgafnu2p9Tra8IYPTcnNmQNwcf1AOClp+k+3YA
	uqAFxklxnsgNhv75YAi2UFq3/QPe34lV5e4LKnbhx4rBtsi32zu0eBVJOvUnFtWhvD63QaUC6Sc
	cx5ZW4Tfao2N9eeb6W5abR0ZhXo/AXLrq8S8TbVxsdewdtHeRKKZA9lRjqyOmMfLpkZ+050/wHf
	G4D7F7dW8txub/e6mqA1JrMPjBEjTfpmJcsjGvXWzzP5TiDnnx9P8TOrQmUhzwum3qSFs62Wo84
	sfAt+JA6XmKgJCtnSH2GyPZkPM4F0qWDEBs/x0XCHUpIwhvx502wsCgnioqMikXrz
X-Received: by 2002:a05:6a00:2d8c:b0:838:9e25:f128 with SMTP id d2e1a72fcca58-8415f32f29dmr14561535b3a.26.1779729566590;
        Mon, 25 May 2026 10:19:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8c:b0:838:9e25:f128 with SMTP id d2e1a72fcca58-8415f32f29dmr14561519b3a.26.1779729566092;
        Mon, 25 May 2026 10:19:26 -0700 (PDT)
Received: from [192.168.1.6] ([122.164.82.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm11481158b3a.31.2026.05.25.10.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 10:19:25 -0700 (PDT)
Message-ID: <4358d0b5-48ae-49f2-a50c-115a54958505@oss.qualcomm.com>
Date: Mon, 25 May 2026 22:49:21 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
 <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
 <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
 <sv6sja7rdwz6ke525e46zpfmtp4wht2vboxwwpyjnmiezibhhm@pbuvqlpkjpb7>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <sv6sja7rdwz6ke525e46zpfmtp4wht2vboxwwpyjnmiezibhhm@pbuvqlpkjpb7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1nL8XDi9a5U4kZkTW_5JCGQFJ16maRgH
X-Proofpoint-GUID: 1nL8XDi9a5U4kZkTW_5JCGQFJ16maRgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE3NCBTYWx0ZWRfX+I8LU9Iorcky
 rUoec2DJEz4/x6Ejlb1aJ558ebFBVn4hRIPnCBl6Nk6O3qMPhk+9MlGrWv0KhvGI6gFyT2vYO5P
 Erk9uRUeDQOp76Bd3AY6DCqhrTwzK/h8298dlAFVNNVyYartFA2G0uJgAC1bjmGTnoRJIruKDjo
 jtBKdUZd3gr/r63JeRNLZsiHFDd7eaPas6+N4zYHMOFFNijn8TaYpH37mjFXvA1sw1VfTNzdPLR
 sLn778Ysh14UcAiPs/YQQkS58yUWC5RTf4sGc5/63tBcPDy74HkInoRBca2LdxvDchAMFH4F0sx
 VmqLxybTWjqIgxBGDSExYUu6da1T0iTArrYYqdP5KgbPwniMxlOfkM56kbqA6VEw3woGJ1CGD6F
 LiZSB5cCmFNKgOAjQr6WZmfNetWUCCzF1o9eSpwkrW7QVM60eAMFMLg4ZBPJv8e2/JO8rcsY33N
 qLF7KkKznPg7rX2VgtA==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a14849f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=oxN+qIFH97EF7WOLwtTw/A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3oT0bc5pQZFKanLxOPEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250174


On 5/25/2026 8:55 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 08:35:16PM +0530, Kathiravan Thirumoorthy wrote:
>> On 5/25/2026 3:39 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy wrote:
>>>> Now that Linux has the consumer for the GPLL4, drop the
>>> what is the consumer? When was it added?
>> PCIe and USB are the major consumers, which got added with the below commits
>> and landed in v6.16 and v6.14 respectively.
>>
>> ab7f31a3830d ("arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller
>> nodes")
>>
>> 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
>>
>> While I was revisiting the code found that this flag is not removed. Hence I
>> sent this.
>>
>> Shall I reword the commit message as below for the next spin?
>>
>> --
>>
>> Since PCIe and USB are enabled and consume GPLL4, there is no need to
>> keep the CLK_IGNORE_UNUSED flag. Drop it.
> Yes, it would be perfect. BTW: what happens if both are disabled (or not
> probed at the boot time)?

Until all the drivers probed, icc_sync_state() will not disable the ICC 
clocks which will in turn keep GPLL4 in ON state. If we disable the 
nodes, then system will go for the reboot without much information.

>
>
