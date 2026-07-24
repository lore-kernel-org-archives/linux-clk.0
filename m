Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D319A3E7179
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890825; cv=none; b=O/xU8JHw6KIrN6SHA3Lx5xZjPxCWeADENXTY53PdBtCdf2mJ7ec/7DszJE+o+VYQB53W5WIAM5+K5wXOcMQ7PQo5UcsyaaryUriETySXfil/L0RXixwqhyEcineTXIPr9YSR03KXPomk2yipmM3jyRtLTCKRvER1sLask3wYPRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890825; c=relaxed/simple;
	bh=C9VaEBw3KALFzc6fqUUVF2hgCFnr4UuiuG/YCyTZl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWtedcb6djIgsQp3/YVPXqSF5nitb/D59T808pP9alyQzr4JVFM/1I0eeMJq9IMv4XpVV+Y94zHRoIH2uwWvMd1XLlR87scfoB5nNUu3tyUpSe139cEVAavDiGLwNDIju7wITrSODUDBmqqjL8Rgo+m4Lhdc6PPZOxMoibIQIxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKU6e3lK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feekRct3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKU6e3lK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feekRct3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADZBe2720677
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=; b=mKU6e3lKz9ly3v3+
	kfneJ3aBPtfNXhFheFKsKirvBiJTQToegUolaAM+lpLDj/LeJGtgn7qtFJNc1Pex
	omSdwvMsOlPJk/BUmHyipDhResUbVzig+fYDrpZjdPB4kPiI8av3n00g0ok9Nr/v
	Q6p7l16iPus/YPyFur9ZtxvAJq7rJgxC40E9zY+WJNDSR6wxntjhK4z/n3KzwntP
	v0K3wKbuXvyFTXscPR+l2C2iN8eaWefVxeaJOun+0kF+vJjxo+r+zxFan0fT0Qyg
	kAh6+84qUJ0mo00HSRgtuCiEnPFWXLlQBrJK5T2ffvZT7Q1CGxuhAMPVnFHDZZem
	a9DUbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag6gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:00:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so506299a91.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890821; x=1785495621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=;
        b=feekRct3y8vzgHok8FtpTCav1TC5AWD6nkoBvI9/Fg/zflrnjo0qM5AWuicXZnJAGZ
         ruvFPcKf7tb/dGz0ROGji4cbmh1SpCQuOe78tNJtKT1ieyK11RnLqwBc8Hs+LJ1n9ZlJ
         W/WatTw2ucBjHi9G6+jOdIJ50OIfCSRMrp1R/rZa9qp+D45ek5raqz66u+oYFWJvlQAI
         ZbRjl2Uge4bbOhEBFRPXgw9HEAsKA0SUscTwYD7453fUvY6OHn4yYW3ZpMF41NiGZDJJ
         U3M+Tj0NupNGJ9W4NAnwef6ht6iZsMN62dJPilO4P7bdwnyCEb5luhV2ZuThbJB1Aiii
         cZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890821; x=1785495621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=;
        b=PeMMSQgHeN4mDhHfvtMO+21Y44kkZaGY7AZCcC7w7Enkr0/tirSv5J1J+pdZ7LyBSA
         cT+bVzahLKp84ZVhqGKMFdNf10bZzmRdHLCgQo/MWyqSeHkSFeVEzO4sOCj1rbEGSIWz
         +jv814xNIQCDyU9FB//lduGK//ipXil2MmRA5FrjyYzpPQ28hv2xCJBrqdQcngA7UFoy
         IHeeIHccYXcBN0GFqHEq4jnLBJOnJFmvEJanSjr2gJPBg6OFkFagYgYBmcnvGbfzb8pv
         2pV/180Vg0657RqCq5/J2/DxzVa6fRp4FLdjS9pjl0SdFWhvRUk/RVjHPd/0fQ7PppFa
         Gtrg==
X-Forwarded-Encrypted: i=1; AHgh+RpAl2gGCya7oCdEEDdAM77wn6efR1P91bipiNL6PxtvQad22zFjaBW3iLw9N3BxDAe6QQSwTR7LWFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWpCuJQuuS6VK6II67RLF3TNcoJsNks+sQvFokAxCI3l++erQS
	k3N+TrDP5ahyqAmLSTXnvA3bCMt+/eimx+0p47G+0Pog4w4AIa410I6CWkt9UMv8In97OSqybBK
	Ugk55dGenBMLA8I3q49i4fUhkUZ4BWg8I56stxBZdDmhgjM4q7GErD2ISknPJ6Q4=
X-Gm-Gg: AR+sD13KsCiZcWKoYjKsHAylTfNKGVzvYZ/tb5qqo79Dnvwv+eJEW7XmoLfznHAHxSV
	IRhd7p1mV+8JJbUsrwUHVgi9YXRKWiZxbi9GxbvQz7NgnKZnpn8dUqW2Kjc1aHQc+SCFYyJFrV7
	HI42Bc/RmQhbGHpfjbrhr6ozrQit2dyIZFJ08ZG6qjfezJnfqKv2HAU67G1dGNyVUGJlN0IvW4v
	rtiHPthTDvzJQ5rCiHaecldAkkVDz5KEH6rr4ZrNtq89fAdhwvzdqIUdcvVYuTLuuC7C7qSyy3H
	zpZPAPpVxlitR1/6+1BRxbI9DFrUcyOClfr6VtIhjdPCueCjDx/NLgxmd9Y41IiYTv6UW2ShxMW
	f8n+6e6tq9YqqiYRwysQjSwDndx8=
X-Received: by 2002:a17:90b:52cd:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38ec6661b73mr7464216a91.34.1784890820584;
        Fri, 24 Jul 2026 04:00:20 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38ec6661b73mr7464179a91.34.1784890820045;
        Fri, 24 Jul 2026 04:00:20 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af892bsm1290553a91.9.2026.07.24.04.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:00:19 -0700 (PDT)
Message-ID: <abd6cd95-1e27-4eff-809a-2d97f2f71fd5@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
 <1eca6815953b50fe3f276b64d74be2795b8382aa.camel@pengutronix.de>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <1eca6815953b50fe3f276b64d74be2795b8382aa.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX8+tQ5PI97o29
 tJn0wdo5yDUHegcfWh83qlH96DXwlmT5/q5PJ4BG9yumdomI+AtCmAVzyiadtFCgTCoTYJ1Lzhk
 YKH8P4xMsbxMS2Aba0w3zswfDO4PMH8=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a6345c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CcRILfWLW4tHOLBHFjEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kRRWZFnloa1YithR51QQVppp0xADO9wI
X-Proofpoint-ORIG-GUID: kRRWZFnloa1YithR51QQVppp0xADO9wI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX9Iw+Z7iMNwMd
 X1vM+W+GhgtsPQkj63/8WWPZF2As7nws8gRlAdHiuUQDIQODhLSbQb5mEL3x/AhvyEGBoipCMfP
 ndXkwOnVBQpczqttd4ZNdfAPivoWsLIf8OW4o675iyPv1frxFjpWWDBVHw4h2Cx6IDr0z3GpxO7
 z/jaSguowog5rJoeDzOzBPWwvByHrewvcmKNqcubyZIBwKE/5QxBOtdRX2hp+LNqbzoP3VYSydC
 UEoHSFeeB/IOVFO4WulqWzgW0TicUZ+5Zm/yuxYq5kXbCdad3/syXk6R1mpwSl3Hoc33ef+vfDM
 tnZom8HT8uPHvubtRbQV0MVCr388heBG0258wAxBZqE8HglrVJke2EpCgbA5RHV/yCYUD+76jRZ
 xW8urn/yJXJu2H6x6apC3Ci7gxjhMcyyAiQKl0wxOjsIM/p/ul0Nn6d+GC25kUOMrblf1o+/nvY
 h06iKwG0axouy4olncg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240099



On 24-07-2026 04:19 pm, Philipp Zabel wrote:
> On Do, 2026-07-23 at 21:15 +0530, Imran Shaik wrote:
>> Some clock controller descriptors do not define resets. Avoid registering
>> a reset controller in such cases by checking desc->num_resets.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/common.c | 24 +++++++++++++-----------
>>   1 file changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 2c09abaf1d2a15b7fbbbfeb67c03075381185a00..d6ff83045da8f308dcb9c5836af48090323248de 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
>>   		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
>>   	}
>>   
>> -	reset = &cc->reset;
>> -	reset->rcdev.of_node = dev->of_node;
>> -	reset->rcdev.ops = &qcom_reset_ops;
>> -	reset->rcdev.owner = dev->driver->owner;
>> -	reset->rcdev.nr_resets = desc->num_resets;
>> -	reset->regmap = regmap;
>> -	reset->reset_map = desc->resets;
>> -
>> -	ret = devm_reset_controller_register(dev, &reset->rcdev);
>> -	if (ret)
>> -		goto put_rpm;
>> +	if (desc->num_resets) {
>> +		reset = &cc->reset;
>> +		reset->rcdev.of_node = dev->of_node;
>> +		reset->rcdev.ops = &qcom_reset_ops;
>> +		reset->rcdev.owner = dev->driver->owner;
>> +		reset->rcdev.nr_resets = desc->num_resets;
>> +		reset->regmap = regmap;
>> +		reset->reset_map = desc->resets;
>> +
>> +		ret = devm_reset_controller_register(dev, &reset->rcdev);
>> +		if (ret)
>> +			goto put_rpm;
>> +	}
>>   
>>   	if (desc->gdscs && desc->num_gdscs) {
>>   		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> 
> Is it possible to have num_resets == 0 but num_gdscs > 0?
> If so, the now uninitialized reset variable will be dereferenced and
> passed into gdsc_register() a few lines below:
> 
> 		ret = gdsc_register(scd, &reset->rcdev, regmap);
> 
> The whole gdsc reset handling looks very spooky, with
> gdsc_(de)assert_reset() calling directly into the rcdev->ops with no
> regard for reset control state.
> 

Yes, sashiko also pointed [1] the same issue. I will check further on
this and submit the updated change in a separate patch. For now, I'll
drop this patch from this series, as it is no longer required after
separating AudioCoreCC clocks and resets into different devices.

[1] https://lore.kernel.org/all/20260723155515.68A0E1F00A3A@smtp.kernel.org/

Thanks,
Imran

