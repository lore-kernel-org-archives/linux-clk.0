Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CEE44CF4E
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509570; cv=none; b=F3dEm5Djod35Yv4pLBfy0pzk7Gp4XD/G8QuHETtApxgkl7bf4uNMXX2DAvCWBzj43iS2U5rRKwfpBt1aisnlYFvfmhkyUjfO73LAAD+XROzdWyBsRyfpwQtKIfkiNMXuIPZW6l5pHtxJvIRwi3x3hKCjGAARe9jVZ/VOFuv6OJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509570; c=relaxed/simple;
	bh=Lmryp5xahhJqIfp06uw6Ni/Xws3g3QD2M6M4xTh1qsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rorMMe2rX9cBtNHjzRad3x/t9hF3jMsuaAwB370eqzAjPypaqIZjpIoUchCbwcHkxLl0wGmjf//BybnxDRHHjkeRWI6DW+6pvhD6W7XkCKM0MBO1I5ZaQYcHZEcGfjaPHiOlPaS1DYlLOekSJtPEAgkFUHdXdXOGlUUnd3Dkcy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfONenWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZDd3Rsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfONenWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZDd3Rsf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889gkK2052060
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 11:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=; b=DfONenWcqw14McpL
	J/DkqrmjBC9uVHzbFj2BzO9FRR8XDvuESRAWusGGxNq/tUsiG0SJWQRw/7RdOrwO
	RQ6M4luFVQ5NFi+VvaJv6O/5yPqHdAHc/LK9cru63xzU1wnXYn06YArhqbowOWv1
	GgN7VDQgEzua/mVo1G/X7xeszOpRbAf0FfZfYAigTekZXNK8KDVoG6JVh15Urab1
	vrUSyi9C63KyOd4noaCgKI0FBBmqlWRPnTvKYGdpchdzWipbENQrv7ejS+YRRQ/G
	fhw0XSDXEMWFmXFcdv76wJcJm1Ml6XNJAHKUWuriUIOcLVVTAzYKbwIysC0rNv9z
	xDI0/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gaf3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 11:19:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381d039b797so618441a91.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 04:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509567; x=1784114367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=;
        b=ZZDd3Rsf89T8ZVSmdNb4lZ8mKR8fmzs4NCIYfTFE6t3DbPGP5aaGYTKCzjoR8ZaoRf
         Pc7q/n1znXNblA4/yhmn04PNPckZTdkIVrvMudgETqyVNMF062ksUgLx3o2wNRbXkJG9
         EI0aNjNQL5v53vcLQ4GMC6X/tfOJFP+ZgBs/iCN+tn1x5l9IBWMsyRiTxTmSu7TYkyhD
         PNgtPRphuEAU6tK7vLLl1W0OohNGqX10MSJVxjdsBMvj7HQ9vQJGMrwaiQ1fBp9zMnre
         V1lW853UvOV4Wt2sxHueMIj7zmrzUzbBQP7nWsgRN1EA9uWOiEFwsj0pO7GCjfbaDhLD
         44yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509567; x=1784114367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=;
        b=czHTFTnEedq/cTXt5WDCsCNQf+FUMAa3LwciRe0zo7oWJT56IKcCNtK3/M5NkVlfcV
         sRqwEXkO5bIo6ZI3cWouLzd8kfvBQYpB6FAl6x2a3RPu5N0K1KGNY1hk7soneU49AW17
         cF0ghWSAp7xgkMbDvGvKF34UIZeVsq+0wWm0KbqXRAvdqjdqRDghCWYgifq7yhg1fdTe
         2F8QhBvqpHNTbOTZzcHPzlMJHh7BJb4q5vfS99pHePGGeXIwYB3UKQVkbpo4VPLvCCSQ
         0JAaMuK+M5uotPN7ZXkyTKpvGmped0sDrrXSRQquu7Itga9Xm2NguV/99hm6a+F0TFXZ
         Od8A==
X-Forwarded-Encrypted: i=1; AHgh+RqwvfpydPUtFwPffIj4guZefUg7oR5tohoTVhVTLZ4d85Z2KPP5AhicuoQyqFiLE8OO33y7SLHjmVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytTO6c3B4LWtbBHVXH51pYP+WfXm1oJU4aO3h8anGMJSQhffPF
	k9/Xtqxg2XwMVrVBpjuhOSjPWdAf4O/8hdIGGuR7r+MbjpYZsqYNpPRX9fmnx6noP1mbrcTe+AT
	Xo4i71Pd14UspenxxtRH9e2fi9xnj4wdT6Of4HJWlOUYZtSXW6nCxNv1CJu5H2MI=
X-Gm-Gg: AfdE7ckW0rjnKZsvl9kjcXV8vkZh3B49/pZk9hZuWcvQFRH5/9UIYUxVd4bnQkPUDms
	FkF/QR35LYY2sB4PIL+oaVEo4Iv0dF1rIVpm+RPaejLaJnstO/cYuUEJQECiDyH9glBNVZVeLSA
	gLNNDL8QTYVeRsqMGN+mo1L0/ZLd7ZLfQMDaqQn7VUJsgkZ1UM2+ScrAni5YY+UZ61cKX+TUYP1
	zFM5dENAQqZrgWhHQdLklzwmu1X3fZp3b7kKqnV+DuK0SXU7QEk3eLml8eN+tUIHkdBypwstirg
	yGrsWmSI/H7v8FWG/+SfSDhckcA57GhLx17b1ntFiVXRRoJW5R7FeiX4h91hBQIm3NUe12Pq9hc
	ZK8G4z+xGaWc4j8QTM5hrtcsQSKgS1+OEFOAnx7U=
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr2290733a91.5.1783509567016;
        Wed, 08 Jul 2026 04:19:27 -0700 (PDT)
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr2290700a91.5.1783509566602;
        Wed, 08 Jul 2026 04:19:26 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d17ec015sm2578846a91.9.2026.07.08.04.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:19:26 -0700 (PDT)
Message-ID: <ca92af9b-2cf0-48a0-82a8-3c48b4ff5357@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:49:19 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/19] clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER
 flag for GDSC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
 <94abf47a-0fdd-4dcc-b56f-963ba80ba33e@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <94abf47a-0fdd-4dcc-b56f-963ba80ba33e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXwToY0c8FNzts
 E4QnyhRNeLp0zvrItvEn0Ndwgt+T/phhbmGKOwzsx01y1prZrtrNoZKlB7XiPSHFrBFCjDquZjf
 oLCaBJIGfyB+dp11cRVpBuW/EwLFLHI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX90utIuavwIuy
 vPyhOuaXWkWKLSLNwhKCTrNT1GAZBA0bE+hScHBZV8r08phHMWbF/3wpR+dhO/NivTXX3cluptZ
 4/ksMPHKNc6d9qHhidticH1nBrTC2gkZ6q63YGVqkE+BMJzC9H9V3ZGG5jL7en2824BvbOhAjqA
 YnguuEOYZoPF9uhmwVxxhJIrirlG/xF3eS5vMvgImOFr+HFEzuOv1v9gZ8zzUFmsfzTAmRu++if
 X7NIgHVJjAxiFbNKI9VpOhBktlwf6g8XQ+Gh+uIzPmMJx/jzXJcVVAQZEKUDjxP96mIQIn21KUV
 dXmRRjoUKwet1OPMcIMVbiN3DeeBVE8oZ+7ZXOD6YjCN+HY237dbx0eYA7X1AOtYtzaPdrqBY15
 lzC2pHCpmd/ulwy7mDR6MTaNoquSRwhoRm/b+5F5JLVcEnLMBy6YmwvtHWLiAzVjwtkN354EEWo
 KUMrAC0VGvgpeYvcxBQ==
X-Proofpoint-ORIG-GUID: AVg7_cGd0TF5osu_Tzij78ISiOqGzmoA
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e3240 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aR6tUbKHR8Lh8TkzPOEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: AVg7_cGd0TF5osu_Tzij78ISiOqGzmoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 03-07-2026 12:54 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Set HW_CTRL_TRIGGER flag for the MDSS GDSC to provide dynamic control to
>> switch the GDSC HW and SW modes at runtime.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 6f8c21f05ba4536d45c2a609d152f871cb875bbb..89a6cdd26217381cd44a515766363cf94d0aaeeb 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER,
> 
> No other dispcc driver sets this (other than kaanapali). Downstream uses
> this for when DISP RSC (which agatti doesn't have [1]) is supposed to
> idle
> 
> Konrad
> 
> [1] (well maybe it does but there's no RPMH so essentially it's not there)

Sure, will drop this change in the next series.

Thanks,
Imran

