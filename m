Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4EA366052
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048776; cv=none; b=a33k9Ed9WiSwGc8kmCPC+n6FH1YJFEyiod3CIuIAfD8qN+bamSLTGWTBWpLfjjOwv7s9x+TAghPEMsMTyQHY5AIj2iloM0zSGCSjJlmu8X/p3YputsrgCEHMvTqAQ+KfhmUTkKrc0xNUbzRgY40jANu8kD524z6hvvXQm/m4Z0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048776; c=relaxed/simple;
	bh=ipa76yU2Zw2tR6ryZjmIAUocwMFzX+D5OAP1yIQC2TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QT0EWhGDazBBEFpR7vR3N8Nztc1N5ER6azXasHFV/Cn0XpQGibe1HMEKsjG0FSkA7t/AkK+4kbDl+BxoDwipvjGxGMu/pDshW+oW+zCjWNj7gJe992k9k2SqTsxnqdv5I+XVACwhbxiZ51YCPdxla0+1QRxhAQRQZnwgx6P/crk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAX3WVq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FcEYgKGc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAX3WVq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FcEYgKGc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9uLv81807494
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=; b=FAX3WVq1SoL6yjNv
	AQywfDqvT7JbCuHP/KBgkO+iAyKEtH5eNs+FS3a852P/F4jlVaOzn3oJvTuHjdnI
	614BgeK42S9XWXwt9Q4xxty240TzHc6VbbefLaJms7YWAIUTs2VVjBLZRPfaMlZY
	G5BJ7tQbqhhpEF5KVmwTtHwIp3a4ps6fCBG+qipT9fAeZSHydApbm5kJQvaCsq3T
	K3eGUzgdAy7oKH/R5NKfysI1O8LG6/ZbBjDn06uICtemjHR+Yx+H2K/u6W9YeIGM
	nx7A9hoZ7XQ9dZWP5RhazwwKwARkNEGxjpBvjOZs6lses1cNqUb3BTf4rxTB/cKI
	4Ot+IQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk8830x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:32:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso3078064a91.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048773; x=1782653573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=;
        b=FcEYgKGcXvFBl5ozOfEMTcxrzTrhkLgKAae51tab0ClLKvJvZIxiW7OTLtL6BIacp+
         cQU91kVWDA/zfO/0XZ8Xq3HAsPdQQGVCgA++mh1fx8wlAIfLLuSBpJ/A1Zph65dNIcso
         Nmi5wTsNSWHYrNVIuTwAMY/j7PHjUuWxHAqDjPKHiWk9lgib4tJbvuUcFxL62ptvsrPd
         zhtJpsfmWktCF6AMAmtmVygP/6vXE6S6X9FnPD0fh0eVQdzbcJ6jEbVdNgz8B/WEvUwF
         R+RUBPDJDY4P7uKXLPUtbhQv7rwieMMbwe+jQZoqaSs1XI4zMkfmpWH0VY43kaiyA2KE
         Uprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048773; x=1782653573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=;
        b=moMTH2sAyhAI+4s0pXA/+znxrGAKAk4NL+JArxWR1oo3G02et5RfhmNr3SxFrYPIrq
         IyipwsHmUogceYWsM2cg9MehtuGcsxUnYpFd77KjW4E/6K4zp8yQtR0sKWIMkxLcx898
         rnKepisLk2NqIORwlLAKLC+qz5RoeFgifbnZJ1td3lBSwQO41oEYlSWBr3fUtSMQEnlf
         CjWbjB0QGw54iwPESUVRs6x3Y1xYomdWKfkTDf68q6pP1n7GR2em55Iwhd8vHNg1Io+5
         2T/Wsaf1IZUk+2jfwEYvdJH3g1l45NGDJowg2zoTNufa9ipjjeGtECz6vZO1pAGbl4SS
         2weQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYiJpb4E7H4fxccp4aXmtRqikp7TcZAIwO0BwpTf3TaUkxVPW63yUC0MQI5YyZiG4BsjsXLHMXchU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyLhivVOcdj2oQ9BqdkUYIl3L+knYrvYZOq6JwSNL2fE/MkKg7
	b0Un/b48k7oLq/uNEW2/+SXIE+nSbdhRd4P4l0cHdAScOZhwgwHErjHV4h0SPCZ+LK5KxygTkAq
	25RnnSP8WssGTx6YOu3P30XqasNmVL/aGqiua2dFa7dyPeSS4loKjmfqv0cB/kFI=
X-Gm-Gg: AfdE7cm/CgUxW6nVZeFgP9VG8m6dQmJLC8tpypynkmDEIBWenO//A87kLixs9HVyfVe
	pWVlJDvoVlKRL9gWAMxNbuUQR61TAtVPy6f5sSAVtZzRZJs7FqNQsTvAXWgSPu/Vagw9pTPovOL
	ymEO58ruGYYwkNFx1CDIH7h6tGiNDcAF2Bi0e1skI/9MyfYI8Um/99Qcj86gaOWACA2JIMS3LWL
	IEJk6hwq4PhFKD2B2mrTNmq9u9i3jhAlVhp4TLTwEzTbX9wZk5/iVJjOe6HO1vyY4WGa6dauR6N
	rR1BJsjdsihJoXaZkq3oklBgTLw89Hv4RuTxUN0SQ5TmYO5dPdLLbBfeUcNboRwBVwFz4QfGNXa
	Ad334qaJ2gVh/4e5NQW9Eg4ab6sCsOk9S1bn9wWLc
X-Received: by 2002:a17:90b:48:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37d160e49f9mr10095819a91.9.1782048773246;
        Sun, 21 Jun 2026 06:32:53 -0700 (PDT)
X-Received: by 2002:a17:90b:48:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37d160e49f9mr10095791a91.9.1782048772761;
        Sun, 21 Jun 2026 06:32:52 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm4527649a12.19.2026.06.21.06.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:32:52 -0700 (PDT)
Message-ID: <86441f81-05c0-4561-93df-53783e5b9674@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:02:44 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
 <xcujjo7qdgoupayq5zrddl7gii7s2ljhunvav2jjzynykg7za4@ifykyjburvea>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <xcujjo7qdgoupayq5zrddl7gii7s2ljhunvav2jjzynykg7za4@ifykyjburvea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX6Tz3pqJQytDq
 nvun56kibEnnZX0hLmkHSgq3LbnfdaU7nEhF3wPHbVUJRaX/+P2GO9DUAsUrK3UdhScH9N1Z+lF
 JlSQOHFAox1uigCs/IWv6dPUEx+SgwnBf63sZOrEa5gDrwXBUN8C0nioA92LLAuBYIoeBohjg+9
 ILgHeuKk4HVM2qfp6oW4ZypHstfnA0QxzKd5/ZTg3DNZCFwjz2OwLEKSbtdRVmzHNsZMhT3bAy7
 p8dIqOBKNgrHKXtydlssTCKAdVVEoqpWIDUkkRA45fGr26lj7kkkgajqial3wHJodoy3Ty0jNSh
 bGV7e21d7bUEAsORDEqf6XgbYVFLQfibra9SoDzhRAqDnCO52nHB5CzKXlTfnU4hAo6KgnCc363
 WFT8nopCvcpGsIMErzK9hAOAJbKD5Z65Yp8prVmMkFraqWoWWjZwlyqQBEqNXFVZyk2CFdfolaW
 ZQhcdymmgfbMUo3pVaw==
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a37e806 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=r43F9ePfV2yG36ZfAfQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: u8YtNH8-2n4c2TsMTUVhExVMLQ_z_Y7a
X-Proofpoint-ORIG-GUID: u8YtNH8-2n4c2TsMTUVhExVMLQ_z_Y7a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX6loP1Ngc2dAM
 mQ4CaYpnFxMKMG+R61HWXgXyd99y01aYaEdbNc4jVSELN4qK+FEZ24OARtKpwuFVTuRf1ZjeL0c
 xXUvchGFK9i2sHv2iqertw6ti65LAmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137



On 06-06-2026 05:01 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:16AM +0530, Imran Shaik wrote:
>> Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
>> values. Incorrect settings can cause the GDSC FSM to stuck, leading to
>> power on/off failures. And update the GPUCC GDSC flags to retain the
>> registers, and poll for the CFG GDSCR as applicable.
> 
> Separate commits, explanations, justification, etc. E.g. why are the
> flags being set only to the one of the GDSCs?
> 

Sure Dmitry, I will split the patches and update the commit text with 
justification details in the next series.

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
> 

