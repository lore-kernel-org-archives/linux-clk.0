Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9B32D0C3
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095325; cv=none; b=T6NizsDju2IIPXvpp9cLRK4XpSRas9itaKT7YV0rnhWbT4jfZN6RKTAy6KFyEzNIcFHYCqrJyijTWBlLT2gwjo20xdZzRNVqRmM0KNvImbDoPaWDX0DF3WgEqWARRfESZLU/Uo5mXQTe+ncWjBMj5ahMnGkpn7CpufDX7Q6pSXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095325; c=relaxed/simple;
	bh=BEJqSrrJEg5hT413j6xkTBCmEooKDNDDSB6VJB3xuvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brE9lnQfnzFGiLmk6aHH/b7JqFvbxiHXOBcNKr6YrYHgBoKDb/drKqkk4bieFz5RjXJPpyA7tkwbEflGzy/pGxj92qIxMb3RMAeTYRpSTD7wBuPcf0nv/AuTcbfEYOzVP9qZyKd+hsu0NFnRYazYrEpGmXWAD3E+9NQcJJkxoCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSTyYDy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2GtEgVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSTyYDy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2GtEgVg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APB5TwU3255891
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIIBkn1rH9XgNgQ1ROwLv2QKtKcUrcLo18RZkFK4D6I=; b=WSTyYDy3uO8QueFA
	3KwIsiEM4eMh25n2sjiyYzNlAkCwAuY7Z9MCyNAcVPI7lv8ZEuLawkQQCTmJdP4h
	4R4W30nf7qZtexBd5wQ6WW0FeFRMG4qDJ69CVbUvwhjYtqgX4q6W/7xPzYvtVn3A
	JCLNpzQnf5SqlausKg4bY5RoQaBQMWGuU/SHAGDl+CfWf+1dEJEDP81KAkKLOa40
	AGbcwagU36LPsSE+dJZfuw4GSgi/R/sX8KTigxFhYAY4lBq7bNvVDQxLOhdiwKv2
	Mp4RIoWEK9Oc9Uzu2HJ8PZgpwFg21UM5IJc9huu4iBShaqGY8gtqmGQOKJjrenYn
	eZCo8A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c199j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 18:28:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c240728e2aso12988699b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 10:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764095322; x=1764700122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIIBkn1rH9XgNgQ1ROwLv2QKtKcUrcLo18RZkFK4D6I=;
        b=E2GtEgVgWELqMhtDQQuzOp6Bhni2dF+lN5wAHZoAxJwd5szC+DbWugHS8+9LV5YPiE
         IQXHz9owZtM6Z2SOo+4N4HX2psk3kM7ZN4ISU3rBUXFDPMP+S7kiLv3r3mdDYP0SOZ+M
         ZHPg7bSDmy8Ekc3m1kdlt71Q9LuLkJMXOV9FyJ6uKBvgmjLdfrTcv1FKlNWATfwHc52k
         u9IWD0+z1/+SxkqX+EF2y0bwlvQr2zI3e+RaJ+7TRaOJW0z59dCjW+z73uvCrK5O9kdx
         CBiTCay4Kl/qtuir2FTVEjVX14zcwETJ50POLe1rm6E8UBJ2hIXw2Iz1o4SZB4qhLW1q
         53NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764095322; x=1764700122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIIBkn1rH9XgNgQ1ROwLv2QKtKcUrcLo18RZkFK4D6I=;
        b=EwgX7cj5D7mGBtaMdcXDn6IZ9NpyPoOSIWPc+AICzyTbqmH0v3/7KHTcGRONBlj4oZ
         lhj2+yqSoZIjctGniSVM/ONiT+x+8zoMn6nnNFzTOdXi+/ihC0E2Da5JYXOdJrbCnUHT
         RRouzrQbYWTnU5CTRBE2lrMTWVlzidNyxBRlohSAJQfhACQpL8skwiWlDX/1I5wKcTMB
         iVK6xFtb5chietiO75sJc4Q0OYbRwyHLblc155yr8as/FJmJ+8G8FX3n3xFPb50eMv2O
         g25Yae67If2mRH5o0HSYYbr4SRkDV/LKiB23/8l6Y6l+1FZLb5lCURBWyWufIey10usP
         5F+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGn10rMzvi54c8HMOLzef1xKDiVy7BPHn+A6GGHtQ7nE2yRPDhWfaxv//pVaTss/LPBAH+gnfnQxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwV+DVykVGhAmijMR1nVZsW8YlwGKGsTMPpssymFlLTUZHNMnz
	TAFWvzbjz+u9HEj67nI6CE1nbTko3+5uMcB6ksKpQsrX/CVp94j7ZtUh2X+ppNftJDBK4mX4lTo
	bO6NpqJxBZlIn3wMPjmjVD9AmQ7QFAjqxEUh7E6/7g7aO9tnW9gpi52+I1pfZGzjR0i4xuaE=
X-Gm-Gg: ASbGnctcRs4r2J+che/Q/rLK2S6giywtqo7+pAodDYb2ldohEPVsZZlelSlqCncDHSr
	PKMpH4TIfOgGgUJcJ+6RgeRMYduOg2vpts6s/wZaGMcmJfwYE+ez8Qh1dK4mXoh7t0jTTS4yREv
	r7ujeqxyywWefmkSQyzlrs/K5EeD77raTsO9zzZcEWFHVLP9399OouDB/3A7uuHPwpa7jMn0nOl
	YqylM0DzMVbAaxEVYJ621V1RluZncZ+F3BK67qR3C7e4Cpl/+9YQk/sqCJ26ajkOxHBIi9vS+Nr
	y8zP2LoSKDhAxY9D+12Zm6pNHM8yv2mzc2VPOsCFVvUJI351jC1nigmBkFET0RlN7nxNOlVw7KW
	JzD6sfqJ+0/ubbGm8k9LnP43wNN1xa6SutMo=
X-Received: by 2002:a05:6a20:7348:b0:35e:c55b:9203 with SMTP id adf61e73a8af0-3614ed3e1bfmr18906193637.33.1764095321584;
        Tue, 25 Nov 2025 10:28:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqDWgBoQTkiXCafNqlJoapcb4EY4bPXiIiKN1E2uYZt1ppYLGTFGrgMN4HGrGw6LPosFuIbQ==
X-Received: by 2002:a05:6a20:7348:b0:35e:c55b:9203 with SMTP id adf61e73a8af0-3614ed3e1bfmr18906155637.33.1764095321023;
        Tue, 25 Nov 2025 10:28:41 -0800 (PST)
Received: from [192.168.0.195] ([49.204.29.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0d65682sm18984611b3a.56.2025.11.25.10.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 10:28:40 -0800 (PST)
Message-ID: <81b6e9d2-209a-4f8d-8644-3a0dc77dd94d@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:58:35 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
 <pkcwprrzpvbe6sxuuzanaqquhezz2ftoxtdt2fuufrjpmnyeqx@e3oodiuwhy4p>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <pkcwprrzpvbe6sxuuzanaqquhezz2ftoxtdt2fuufrjpmnyeqx@e3oodiuwhy4p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l815S3wvowxES-5Z1KGneGpBJ7tKx53P
X-Proofpoint-ORIG-GUID: l815S3wvowxES-5Z1KGneGpBJ7tKx53P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1NCBTYWx0ZWRfX28n/IYLkIEVK
 24APApFXmT6xqczzSaDmbuvWnvZKWWNFii6w3xz2bnaCOLbcuvKki6L2o0UxzV6HG0ApSmo+Pea
 pCNOGMCkoKg3pgDs3l75HYZTgmnqPM8MJf6lAahRsmFmZqeRzr+VK/DMpFxyR7grxiRmsa72i3p
 aumVmXSnnXfjF5ffGZOiUEIez2WjK603zbWUnm5wJzkSV38AsSeps1Oiczz8G5sIaB/hzbbyKoN
 qrW3Sgg/IG+YpY/VWLnjZT1u8+p5BilRYrWpK1YvjODtthzz1rwWThpARfUPV2yEbeXXbo7wc2k
 fVI1fN0zZW68WkUhKAUoW0UIp5pPnY7ak3oHCVB4Q6sAD6PW7/RexAepVYzqtcBrVn83eCoZPcd
 AxGIFbGD5NTY7GkFx4EcjT8NuKNWUw==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6925f55a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=kQyaedCKNfhe0S+2KTiflQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7FCxoOzHdSGtnioyBxAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250154



On 11/25/2025 11:56 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 11:42:39PM +0530, Taniya Das wrote:
>> Update the RPMh VRM clock definitions for Glymur to add the suffix to
>> indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
>> C8A_E0 clock resources.
>>
>> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> 
> It's not a bug, there is nothing to fix.
> 

Will remove the fixes tag.

>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-rpmh.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a370ab2d96c34fa8e7a090e8427b11008318c02f 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
>>  
>>  DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
>>  
>> -DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
>> -DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>> -DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>> -DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>> +DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
>> +DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
>> +DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
>> +DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
>>  
>>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>>
>> ---
>> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
>> change-id: 20251125-glymur_rpmhcc_fix-5daa36a1e8ff
>>
>> Best regards,
>> -- 
>> Taniya Das <taniya.das@oss.qualcomm.com>
>>
> 

-- 
Thanks,
Taniya Das

