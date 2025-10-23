Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0582749CA
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202612; cv=none; b=prf0IEPmBTEH1ot1bLxPbWSejXCJBLP3ice724e39fKDeDccC5jBrcmEW89Hoq1SlNkqdyDo5mdITOgg6Yz8jBaaElHEj5TypC3U13GnFguJfMxBG4coy2O4THd8DaURfC4VKjU3+KOnB8WXzxVe0kzZyog0oNHegxtMOqR83Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202612; c=relaxed/simple;
	bh=BW+kg8htBMkugNFEx4R0pb35ItCAPtb2W8sPE7A0J6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifKbUvdFIk1jkYhANEWwr4fQa8FYlAt0wJY9MB+WWfJ89fbk6i0EyR2bCfCX0iENW1goBTapqgXIwogIy1LzfWFbZupegq7zFH1PhPiwWeexMmC0Y1P+w+7yX08+mqwhImz2WINAF0UeD8zkjWuLKc545Fje+yBIKnLqrD6mlag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khCqelEB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khCqelEB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIeoWa005790
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 06:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+efyRDA4riV9spYnZlw/APnqKUaUaN3qfqzGJ8qH2uc=; b=khCqelEBy4lVeQ7+
	FYXiHgICW1lqub4Fz526fKpkit0d1GcoHObWhLZfP4e+1w5eMhN8G9m92i8kOQbu
	pk6tdkx9zXgqdiF3kCVo2ncrZoUNjwSuwsJghNhwBdxlGuzvtFQMbfSevvJ//YN2
	xaBzoYaf1mCYqA/vu9vEJu7lwl1UdnkxeqFlr/AhRNGDBdgGOkcKltniP2j4DY89
	mSdzsn4y/O47MJJd281VFpl0ABxugU/dlhSaPBX1+UHisWZapQFH0zWSaPTvlucQ
	Z76p1tLGpXpgKa4LLIrOoNibnam0TYiW29b4eCiRWWTONiGwArDeBYkCbNgRv4e+
	axpTAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j78yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 06:56:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272b7bdf41fso6000645ad.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 23:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202608; x=1761807408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+efyRDA4riV9spYnZlw/APnqKUaUaN3qfqzGJ8qH2uc=;
        b=c2kQJN8Wd4CfJfiS5MrihwiOwBMApoLSlMiIvAMblNATVtCx7BKnpobLkGloZlKAqo
         gkkyxMX+DgE+1wYnZJpwjIFHBdz6zdktf/3F2+UGGKcTXOpZ0cSEiHLRzUGhG018wUuE
         CZvfxxnkZLjNbyrZmxLfsVue9HUVrD2tcCx9Bo22+JsgaHmf/zQNcsL9jm0qJtDkTMcz
         /9Zej0U+hMdswP2KQnF3J/5Ap7BwoVp6LLmc36nv5wYn1E1K2Zxx693Dt9JeRuz8Zj4J
         0znFDyUGIUEKWhmOOWuYvTVG8egyd90sgKBAfZPK1mr2xyLCslo5h8xwXpAYYguIfVYG
         iyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp0C1p9gL0fZ2lz3ZRU/euEsgxVavGyD5iXg6QCBWl5EGhT3k5J7keZOy9Dy+XSx1IiU5qCHX/YlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxMUL0j9csuj797/bkydMem3rFFZMZX0oBWfJQr01aJn4CsukQ
	kZGZLKttmW9aVdZJCOg08v5RDrF8XTJH6lHYrOR9fn1cSNKZSDdNFF+WupCwagC5JnsiMxOc26g
	kCc7ZoZ42J/aqT5a4n2a8F9qmZ7HD+H5NxiiO3+4xkFv/UhuVOSz3Z5tGRTG9pqw=
X-Gm-Gg: ASbGncvqAzX00yP8U9wQCgkq6qFmZeBkL//eD5yt6yMD8OuS4yvXTTN9aMWwOA0pyJZ
	yYQhrfz0Uz6xK73ntSswBbhEGF44+6SoVXiBzSwYlUQ+2KMYJehZr93YtEUidGaje7lzQCPC1GO
	OdrAB2/LS+UB0oFiHxqjriXWNfBe1+xW341R08K438BIDFOwnB89+DsJ6j4BQwtifIC81ttinFr
	CSkMQBZA6JtMh+3I9XzwESMELYaMJRxJhXblSUibRGnOpEU9byAkkoqymuiFOOgWAC1gz5Rll/N
	HjqYtnDn6FCt89gzqgskj/LNLqQCLr9uFFboO4s0UXE5lKj4VDdVsNYFcnsz93vQB0rFFL4X1iv
	VcA8xVC8ac26BFefSzEysFiQkUTI=
X-Received: by 2002:a17:902:e5ce:b0:290:af0e:1191 with SMTP id d9443c01a7336-2946dea1368mr22465235ad.21.1761202607972;
        Wed, 22 Oct 2025 23:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUW0YEaHqb+o6OIwpRYA3a26EAhwWv+kJ8gb2tFkO8g+VN+YewDwGtLNYa5D2L0rAadSuNVg==
X-Received: by 2002:a17:902:e5ce:b0:290:af0e:1191 with SMTP id d9443c01a7336-2946dea1368mr22464925ad.21.1761202607483;
        Wed, 22 Oct 2025 23:56:47 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de02357sm13016435ad.41.2025.10.22.23.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 23:56:47 -0700 (PDT)
Message-ID: <c2429e35-7d33-4500-8e0d-a992cad99f63@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:26:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] clk: qcom: Update TCSR clock driver for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-5-29b02b818782@oss.qualcomm.com>
 <jr6qz23acm2ipspsvyxjpabg3b4bspapia2pqd7b2grrtvnct5@v7mjwnr5o6qa>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <jr6qz23acm2ipspsvyxjpabg3b4bspapia2pqd7b2grrtvnct5@v7mjwnr5o6qa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX9vbLehteAlEG
 +IA3Q9FRIgAdusNd58ReKgZVoOTwDAiyKT9vPbCZiA+vlyog/yC/1oQaG7/nlMqOcruwg4iRt/C
 dcBI2yxtE6rxL2erS1MhtaB55obD0gcbTYEkLPJ6kwa8K2f3LAGmqk8DsSCCMCTg6+FZ+X+1YGi
 DpeGjN3IJAylQPNjwGsyV+RzhUzwznodLBbXaeWnkHpHwTnLA+D9O6RXsy3wNXXujr6dgvLcwPn
 ybKMWcdzsCEipD6jPlnTjoUjumSCfBYUVcVzPdAqc4v65/vgtB2eFI8sY/O7TLV9nKBhtThY5Ld
 DIyOe7OqUJiXg/OdwEhNEWenhciXcho0GhHPT38LMbi+abM2eO7sAGJ6Ml9kSlki9RlMKA37yu/
 KmzgrqMyQ9OwSnjn76Vj4FpbsVXaVQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f9d1b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=peCUsVMnvPp5iizJ5UwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6GJ9GT14kqCPYX5D7OMc7RWzspRYv_aZ
X-Proofpoint-ORIG-GUID: 6GJ9GT14kqCPYX5D7OMc7RWzspRYv_aZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018



On 10/20/2025 4:33 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 03:58:57PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> The TCSR clock controller found on Kaanapali provides refclks for PCIE, USB
>> and UFS. Update the SM8750 driver to fix the offsets for the clocks.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/tcsrcc-sm8750.c | 34 ++++++++++++++++++++++++++++++++--
>>  1 file changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
>> index 242e320986ef..f905f3824d7e 100644
>> --- a/drivers/clk/qcom/tcsrcc-sm8750.c
>> +++ b/drivers/clk/qcom/tcsrcc-sm8750.c
>> @@ -100,21 +100,51 @@ static const struct regmap_config tcsr_cc_sm8750_regmap_config = {
>>  	.fast_io = true,
>>  };
>>  
>> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = 0x18,
>> +	.fast_io = true,
>> +};
>> +
>>  static const struct qcom_cc_desc tcsr_cc_sm8750_desc = {
>>  	.config = &tcsr_cc_sm8750_regmap_config,
>>  	.clks = tcsr_cc_sm8750_clocks,
>>  	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
>>  };
>>  
>> +static const struct qcom_cc_desc tcsr_cc_kaanapali_desc = {
>> +	.config = &tcsr_cc_kaanapali_regmap_config,
>> +	.clks = tcsr_cc_sm8750_clocks,
>> +	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
>> +};
>> +
>>  static const struct of_device_id tcsr_cc_sm8750_match_table[] = {
>> -	{ .compatible = "qcom,sm8750-tcsr" },
>> +	{ .compatible = "qcom,kaanapali-tcsr", .data = &tcsr_cc_kaanapali_desc},
>> +	{ .compatible = "qcom,sm8750-tcsr", .data = &tcsr_cc_sm8750_desc},
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, tcsr_cc_sm8750_match_table);
>>  
>>  static int tcsr_cc_sm8750_probe(struct platform_device *pdev)
>>  {
>> -	return qcom_cc_probe(pdev, &tcsr_cc_sm8750_desc);
>> +	const struct qcom_cc_desc *desc;
>> +
>> +	desc = device_get_match_data(&pdev->dev);
>> +
>> +	if (device_is_compatible(&pdev->dev, "qcom,kaanapali-tcsr")) {
>> +		tcsr_ufs_clkref_en.halt_reg = 0x10;
>> +		tcsr_ufs_clkref_en.clkr.enable_reg = 0x10;
>> +
>> +		tcsr_usb2_clkref_en.halt_reg = 0x18;
>> +		tcsr_usb2_clkref_en.clkr.enable_reg = 0x18;
>> +
>> +		tcsr_usb3_clkref_en.halt_reg = 0x8;
>> +		tcsr_usb3_clkref_en.clkr.enable_reg = 0x8;
>> +	}
> 
> Granted the size of the driver, it doesn't feel like these two entries
> belong to the same driver. Please split it to a separate one.
> 

Sure Dmitry, I was looking for re-usability, but if it improves
readability and clarity, I can split it in a separate driver.

>> +
>> +	return qcom_cc_probe(pdev, desc);
>>  }
>>  
>>  static struct platform_driver tcsr_cc_sm8750_driver = {
>>
>> -- 
>> 2.25.1
>>
> 

-- 
Thanks,
Taniya Das

