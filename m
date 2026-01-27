Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1DA244692
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769494329; cv=none; b=BBBkAhZOvqSYtXPS4ps0d0HYPYQ86k5KJ3xpRe6aPYaV/c4JLQ/+S5pbKs8g+C8UYFV6fTiVune1SAPmmpbBR6SrtzqXJW/2cedPZ0iRBI+i7km/vZDG3HvPlvySwtCknp7iL5tZXQOofkRry1JTceijrWlK5QtZXDHYTu7nUYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769494329; c=relaxed/simple;
	bh=cJTtKHdavxmzXsgCYPEa0JmZDtdBVQcCxIpGRpBzASc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKX0+6kpaEmyPDf4mk5D0MafBheW6ioyI2UiYuF+kb6e54hVB15aH2GJw14nOb8sGrBR4D4l2VZawqqqK3vQphY1swLOW+/R9btBKyaskWcwJ1x6UiuzTvA71v7x42rzx5mCgq8SvA1QJ0dyAR4DSIgXB7uytUwRQiz3buXl2eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+uGxUXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5VBf3pN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+uGxUXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5VBf3pN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U1Jm3857584
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gmev3uvCguIZxvsHqRmRj2OkGS4cXvr16nK23VjL4g0=; b=U+uGxUXcRqmCDNZH
	I6/GdR3OvQFg2RTo3mU5sBJrabaqQ3ac+wBWsyP35sdcXldyFx2IhuOijN9UKQfY
	vEVJW2zG5lq7qsU07si0k/9aOXDdJQgcn5ZWPd6F/wuhzqPl2LZW3cu98OLR+ocB
	5VfEAc1A8XVWCfOuSHMJh9cnRboxF8hi11KEjepbRH9OmDog2PrV/UxYChLEv3c1
	kN5AgkqOqIspi3LDNSIpmuTfWKWfiXSeU0xILuI7Xe2StKhFru1qARSpWjrDBqO+
	jfVqM0cxXTEhdLLiapv0HL1TqvsVYepT9SPAhKO9JddUlpmWpaqHLvYBOq0WHVdz
	a0Qi1A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs1d3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:12:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6124a9fb86so8311399a12.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 22:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769494325; x=1770099125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gmev3uvCguIZxvsHqRmRj2OkGS4cXvr16nK23VjL4g0=;
        b=B5VBf3pNdoBz6cW0lKJEoSBDi6JtFoP8qK+3/VvDv0p0n++8+5bMEPuUvm2z1eGNSu
         eD1HbArFQMHmsZ1Xqov1qZFDgBQzt9PETnQMhC2g1JmT0xOw4n3CJ10odtZKrCa5uRIJ
         h7LRE9XCnU36oNqiIL/6aGCJYdrhZ2D2fm5xiHl2EtpYEwdthb8hieYpOFN3cilxrojw
         5PwI7fWbf1CG2sqg5hhK65DZgEYKYtHXxGHdhGrYaQ5nVXOOWPusxXMEalth+FZtRgcs
         xyCkPMsWB2KgLzBYJOqqVm0N+0k9VTZY31bQxgmXdqT1Kr8PZRyz1Fa6WBQcIkX3ZSJP
         nlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769494325; x=1770099125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gmev3uvCguIZxvsHqRmRj2OkGS4cXvr16nK23VjL4g0=;
        b=AHLB7Pwg4neweYcUkgoCrJckJCsmejVDUXizI541X6KP2ZbjGMwXZ9uYkzyHpg6asi
         bcacyxNHSplU/ZvWtxaxmdQ1c082NUTaws0xWGsm3d9koHjGC4HZKbARLNETtQCnZI10
         ab7dV0yFK789M8IX+4PfxHovPc0Q8mFo6kNAN+HJlLou8QKPT9IzzMiqFu6VjUjU4P3R
         bY1HuFJAUZj6l6CDKlhncHYNqb9SXf5yJiRkmkFqP7esqij80MBAUz78p59uke2Q4WjD
         O27XHGKuaghfZrTM7aCMqNybrHC0RgXOpNQtv7OOoc4nE5buikczaZ8e4YrFBYaE64yV
         ms+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5zuGWrS2h3v4Kz/LO/gSIdy2dEToQOhDL9Dhc0dUL9zNQ95xRcYbY5MYoq6FVQAD6Amao2Vv5rk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsFqOCLOvGfESpFJ8Xjb8BOAvp2zUjxEYPLdvq21JMxPo5+xV4
	L8XN4IFzA6XYO37w+E3y7WceWzEw59otNg1KUDrf6SQ4R61GaTKw1hHNJMwH0tD3Vid9xMEPBLw
	XHF5zskcG+nFCMw287A6cwB/oWO79Pq3lPC9NeNrIZxNTVBIlTLirsFRNDRwUqaY=
X-Gm-Gg: AZuq6aK+7njopdD55oqRh7Gwh2L1PMhPrEhxbjgkAQye7N9PJdoPxoiAdPhwcXAvv4A
	8wC4clJ5a+6WzCQnYbQKBiWFfMeY9LpmBJm5cVWWJJFpBqbyIlg231xAoJ6ozaVNs/nIee7+kHd
	uQG/TNjBvpNaPj32p9syeG+s5Eahq7PXPmucIhYGHRxGBwfqVLRDJHzxeUxubrfkObqCXYzuChq
	CBr7Lp6huKXUN5kehVFHZANvDihhMIRDtk5TNzZAWE1o21aq1PPiQmREzUJJy29pMJgpm36+jhG
	tddy14iMKOgI2AbyjIvbpz99ZItuhkKAN+el1/5SLXLjn8hPdegmtDkLOVw/wTVwLq4iV3vrZlm
	F0YwSocfaYC1m4bzLvUA2ttjzma963LGpMFujTw==
X-Received: by 2002:a05:6a21:b85:b0:364:1361:a8a7 with SMTP id adf61e73a8af0-38ec6246ebemr509940637.10.1769494325501;
        Mon, 26 Jan 2026 22:12:05 -0800 (PST)
X-Received: by 2002:a05:6a21:b85:b0:364:1361:a8a7 with SMTP id adf61e73a8af0-38ec6246ebemr509918637.10.1769494325054;
        Mon, 26 Jan 2026 22:12:05 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a13080bsm9674559a12.2.2026.01.26.22.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 22:12:04 -0800 (PST)
Message-ID: <3e381303-da09-4224-8929-8f47793d6bae@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:41:59 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: videocc-glymur: Add video clock controller
 driver for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
 <20260124-glymur_videocc-v1-2-668f8b9c63be@oss.qualcomm.com>
 <j3jj2mg4sdm2n4d6nedpnev5tvusvizpvodfzazil6nuvwrsqa@upcpbdzv6uie>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <j3jj2mg4sdm2n4d6nedpnev5tvusvizpvodfzazil6nuvwrsqa@upcpbdzv6uie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XjmuWr13kkFgpF2IWg20jLrMOrvET3Ab
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=69785736 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-SW487GPSND6qsctmCwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: XjmuWr13kkFgpF2IWg20jLrMOrvET3Ab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0OCBTYWx0ZWRfX1NmegsVV3pAG
 Y0IGWToyjDV7PCz75BvEtE8AHnMZkqTd9J9EUcdBOmvyk7zT/xIJ1h5VuX2XMy41oj0xMzEk10P
 at6jhN7+Bx6eagU4EcXwPnfZ+QSf33nns5WA8e4b1UlGEWqqVVw58MV90etjuoWy+1MlH3W1we4
 HJdg0XsK0t4ieQ5WjbEuata6Dtn68V3HmszF54yINwJIp6xSvKJG5o55FJ7wj7POX6ZjhhNf9a0
 hDo/ER4WptZvtKq1I4Vaor8W1JFRsdXSFmQ3WbyQo0Kom3fmwQifUDhtCGQ7zC3qo0wnUJjb2o3
 hhe4nAsZFFV49FJstfAIX7LVW2vDh09xeOHCowWx3YKCiCtyiEDBj+NbgIAb+6+i8GP4oT4JXce
 BxVa1MaldyYLnC+DShjYrzbw/Z9VxtQs8ugw+hLP5ZB0R98yDA5OHuw0ZLZdXzuQ/4Nh75v+tnG
 SdP0jbpeqBjVlQmqe0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270048



On 1/25/2026 1:52 AM, Dmitry Baryshkov wrote:
> On Sat, Jan 24, 2026 at 11:05:03PM +0530, Taniya Das wrote:
>> Add support for the video clock controller for video clients to be able
>> to request for videocc clocks on Glymur platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig          |   9 +
>>  drivers/clk/qcom/Makefile         |   1 +
>>  drivers/clk/qcom/gcc-glymur.c     |   1 +
>>  drivers/clk/qcom/videocc-glymur.c | 526 ++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 537 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index a8a86ea6bb7445e396048a5bba23fce8d719281f..20af4340b08f98773eadcc4a97b1669f51277eb8 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -46,6 +46,15 @@ config CLK_GLYMUR_TCSRCC
>>  	  Support for the TCSR clock controller on GLYMUR devices.
>>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>>  
>> +config CLK_GLYMUR_VIDEOCC
>> +	tristate "Glymur Video Clock Controller"
>> +	depends on ARM64 || COMPILE_TEST
>> +	select CLK_GLYMUR_GCC
>> +	help
>> +	  Support for the video clock controller on Glymur devices.
>> +	  Say Y if you want to support video devices and functionality such as
>> +	  video encode and decode.
>> +
>>  config CLK_KAANAPALI_CAMCC
>>  	tristate "Kaanapali Camera Clock Controller"
>>  	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..a71dfd0ddf5122d91b5ab4427a9e36cdd57f7bbd 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>>  obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>>  obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
>> +obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
>>  obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
>>  obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
>>  obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
>> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
>> index 238e205735ed594618b8526651968a4f73b1104e..cd11470a75f3fec67c1c0cb7fb2b54a814cfaf65 100644
>> --- a/drivers/clk/qcom/gcc-glymur.c
>> +++ b/drivers/clk/qcom/gcc-glymur.c
>> @@ -8507,6 +8507,7 @@ static const struct qcom_reset_map gcc_glymur_resets[] = {
>>  	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x3201c, 2 },
>>  	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32044, 2 },
>>  	[GCC_VIDEO_BCR] = { 0x32000 },
>> +	[GCC_VIDEO_AXI0C_CLK_ARES] = { 0x32030, 2 },
> 
> Separate commit, description, Fixes, etc.
> 

Sure, will split and add the fixes tag as required in the next patch.


>>  };
>>  
>>  static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
>> diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a5045866982554ea46a9d75033537e7771df8fd9
>> --- /dev/null
>> +++ b/drivers/clk/qcom/videocc-glymur.c
> 
> This one LGTM.
> 

-- 
Thanks,
Taniya Das

