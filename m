Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7496F356A08
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027183; cv=none; b=XDJaORh//XzaHKxoPgnsfWTeSvlLtNDed7H5bnK2vpA2Jl23Swqq7WEf4Lj0ei+8Ayio6F3AMolvq258/koCui2+QTfNCwwqGx80PKH8f0P5MU4JNw1P99+SDWXCBMGpPGoXt1uIbMGBZ8I1tJW4/989R8x0R7EImDyjNt0vwM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027183; c=relaxed/simple;
	bh=1jmLK14LqxG8z+7yjYgdbBHNfz60JYyrT36cz58Vb6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4nATk02yqscm5gkWZ+gehTVUqLN8WbF9iGX3xPw7HKN2RM/YYGKrbEdms9QuUKEw5hJ1W4WEZO5dIw9E9uAWePAq8L0CDl5mk9G9ntyL7mE2FhEFLhwhXfP9KIKTMxple9m/k0jVY9drQX+Zz5oY4b2d4ZRCDZSdNj8tvoP10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aotjcpyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBQsV3oT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aotjcpyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBQsV3oT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127x7E91165324
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=; b=aotjcpyM4a8MpgJ+
	cycnt1eKnB+tpLvrWvhhqGTOK2grvTyzbagbBbmBfvStkuvNviWy9O07DrjoPfNn
	lKGxVEE0uJvJXTAZxTdqHL4cvKsX6UpHclbmD4MSEDVTG9Aqg8GUmBsaqIx5z5fT
	pX0wxcMstjQXRnePOtLX0rVHPrXL1ptKY1z7geyELgRelpjcz9pPDMlLl7ZIElCk
	7TcFafuRpVw2Ckp+xPqjLpILYAnI9XXbOJwyR79G8RoYOoVkJLtUALTBLsqIPA1e
	fbu4jVTD5caGJayRSPCYY+hqr7f2U7V/rYqdYhAr/UO+gpJA+5VcbA3UxVCMFue4
	b+iJ6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0w1g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:13:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso1568686585a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027179; x=1770631979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=;
        b=KBQsV3oTSi6xU0o3O5q1TXbWnCyhwh86wFYINz4tPEIHBL9J8QvsM2Zlnfa+wq7ukV
         4hmSmFwkoUzcoVuvsny0psZdSvCfy1mvKh1elewMgLrvPchszIBQqq8N14MWs7+MRDaP
         j0HpliMAHq5s2jf2VRGEGncVAMFNQdQuQeVftb+cBQbvzPNw31Np2rNVoMKZOFGUdIL9
         iZt02kxfKXPMhCAHBGJkMEvHaYbAS3rfbXgjTBKIeP1tCXFBITT4HdOozf/PUaMUtWE/
         7+R2EXfjr2C8pyJK2OtfYm2Lzxnqh0aBdgkFjWHkona/tu5coAxzj+h1fwZUZkvQo54J
         huRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027179; x=1770631979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=;
        b=ID+itb2Y44UW7IOCqj5KTPBbpOqCyhdzomhL60rq6nJDiclzgzXX3KtSb2FUz4xoP1
         f8zUikR4D6bPD88VHcwA/oBlKiO2QPAVSXGqo4gqiUqtaddT/NDja9qFbEZ2gqY6DD2B
         dH3C2O3WRWIYw8DSjDqm9xgjCo2Giru1rV66/0Oz2TJ1ZkdPhXg/JhIABOEzg0UZ0IAY
         1p8zq3u6J2TYJc/5djC/aEVD6M1mYhCSHoTjEwCvvaxodgmPEuJgFjp9eywhbOhtO9sG
         PtPDc/bQn1pWwd1QpUNd7HTRu35ROa59HxFUnz3AdnOYFHcIdWil0vb1utvPOD8KulWd
         YY6g==
X-Forwarded-Encrypted: i=1; AJvYcCX4LUmtINCOeF/aukE1kqxuo3OTDaZCE0P/zr9NFgnbmRj69IkpTYh7uzB2+v9enaZJDmjT8q52Eoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrzZYvtf+tUbesCeVoXTK1QFDeDO1gtwXmj7/7gXTS/jbB2Tx
	zlx99rC3CLk+DVKiES4SIWet0wce2BmMQ2PDH8XcRVGw6VOjHQT6V1fJWSReipO/gfQCYZyUvi9
	31y6JqNiy0mZ6IP4Vo+b3cJ0p7vnMhRqH5BmJfpmKBhA8AHXSX/Wc/a64NIm3BA4=
X-Gm-Gg: AZuq6aIofgZiuEP1QNYFb+C96JYiN7cOZf+0N+wqajQumREElh/PCDiiyuMmSdXkFd2
	O81mlAv8y0jw1TQg6PWTntzAFTIJ9fNffDxubKlikc9JPsFQJicIUPpXavv2B63s+cZwZtgUQOo
	BR/jK4D2lAVkFiRsy0k0dVGgA8q5p6AZmc1bMc+KbHUCqFj5JbQNDIRHED5va0fwRD8fz8X1JRo
	xn7e7l7qiejJuuapTGtbwsRzB1IMxKvHd91m1iVWpvpi4hdbiP4/Gq8490GNbT63DgOBdRoUtWg
	aV4O4EXAo7rXFZSInvPRvqgPB2TituSYOXlmpxMm4P1A6Vbqxct7y1Ao+gEfHbLiyILGi+pYY6G
	e154+XL3dipTRUUwPql+/Hj3pqJOGB21h/HEI0/2AWgnNbX/mvlJQmckzV00I549603Io6cex1G
	9B0KelDWmO3zeXCn6+xjmdXeBOsqQK7sZke82yJZbkwawo+pe6pP0/TBE9R9BOMbc=
X-Received: by 2002:a05:620a:9489:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8c73ff0d649mr1145392885a.15.1770027179088;
        Mon, 02 Feb 2026 02:12:59 -0800 (PST)
X-Received: by 2002:a05:620a:9489:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8c73ff0d649mr1145390285a.15.1770027178630;
        Mon, 02 Feb 2026 02:12:58 -0800 (PST)
Received: from ?IPV6:2001:14bb:15b:d5bd:79ce:863:9a22:aae2? (2001-14bb-15b-d5bd-79ce-863-9a22-aae2.rev.dnainternet.fi. [2001:14bb:15b:d5bd:79ce:863:9a22:aae2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c44cbcsm29528431fa.7.2026.02.02.02.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:12:57 -0800 (PST)
Message-ID: <ace931f9-822b-4756-8c23-f69963ffac02@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:12:54 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: iris: scale MMCX power domain on SM8250
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
 <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXxfoBp2EQV6SE
 +sfTcwCz5iW/uA7MXP0i9G6+F9m4C66FMNP/pZkBcl3XqLKLByxRSC90KgPIo8NJlCAQujp2ipB
 ZEh0GLJYTquKx0ba77OeTr6bsyXUssIzxBSrKEDTg2WZUp4zlGR3jnv11AKMU+U9IEFa4JI6XU2
 5XA2U2Dg8Znr+PVb9RNBHxx/fGoN89zr9YSGI6ciDKr9tm7kG6ZSMFHvAHo5DgM/ZTTXXYHoHVF
 XsUAFC8nso11yG6BjOHaYV+UwhP3jfqvpjw5ks2QFPZeTBICsNtk1FUkw0biSoNRJA52lcEaPev
 R3cT4zzAkGN9l9BXg8PDzX5k9193SQRFfZAO8OhqW4Kl1wU06KqjL6UmluvBZWlrxHmrXEN9YW/
 Xi6TaNiZEAc8UO+QQjsdeHbZwhTnn31XWyVgeCGRpfsYrsy7/KODLQkfq/rqzZA6aSgoIjhbtvs
 duDUYMUkpW6RKO9s8/w==
X-Proofpoint-ORIG-GUID: PDDRXmODPcgpxNHIx-n3wGnqqT6w10dY
X-Proofpoint-GUID: PDDRXmODPcgpxNHIx-n3wGnqqT6w10dY
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=698078ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dCPk7noOixveXNiBySQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085

On 02/02/2026 12:07, Konrad Dybcio wrote:
> On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>> the PLL it powered on by the MX domain. Extend the driver to support
>> scaling both power domains, while keeping compatibitility with the
>> existing DTs, which define only the MX domain.
>>
>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>   drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> index df8e6bf9430e..aa71f7f53ee3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>   
>>   static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>   
>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>   
>>   static const struct platform_clk_data sm8250_clk_table[] = {
>>   	{IRIS_AXI_CLK,  "iface"        },
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 7b612ad37e4f..74ec81e3d622 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>   		return ret;
>>   
>>   	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>> +	/* backwards compatibility for incomplete ABI SM8250 */
>> +	if (ret == -ENODEV &&
>> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>> +		iris_opp_pd_data.num_pd_names--;
> 
> You're decrementing 1 to 0 @ this point in the series

Why?

  .opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),

  .num_pd_names = core->iris_platform_data->opp_pd_tbl_size,

So here the nom_pd_names is decremented from 2 to 1



> 
> Konrad


-- 
With best wishes
Dmitry
