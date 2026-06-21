Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9425B2F4
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048662; cv=none; b=HPqCnBqJoHanc1LH0kqQujgH6lR+znb+jdy51XMeOfzpgaE6iW8qy0Bjex6DvNrQ2DzqBfgUK8AfMLZRsVhoKpQNYo+dLtNV5GM+MvuMTq9iqpR94iZDFGlAP76ROFN7VxdP3xJtIAQOJL7McdB/UDrBH4G54wYhaf769cTrDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048662; c=relaxed/simple;
	bh=N2uIoOfZZ0ySePD8q6EsZbcf1vvpAdfb+cBUcJki7gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWj9bAesBglnQ3AzmECjn3f+a+mG6dwz4ad9bWX1OK4AdjxQudlEi8suNDqMFopvYW4l29PDVW5jUcbsXE3llN6a3C51sKt2UX7yfjQM7ewn8DepDjBUIJ+w4kzP25yaH7c31fDuDaCzbsJhbM5h/le08CufcsMn3UEvhmLJdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdHrPjjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzGL8Ryf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdHrPjjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzGL8Ryf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9tj9C081655
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=; b=GdHrPjjlEym2VB6W
	8tqAhEU3KW5oXDhJH/ufQnpyNhRt2YLaMpr5UrU49tYqq/bMzI/67eSK1NyB07A7
	1qFX7unv55e7h9pPFij6HsGO8tJIL01u+4iSrSy7WuPF/wYuyNO8zOWizTcwwsQv
	MR22V2Ll0YeVVQehalLxtfkxo3ppAhwHJqoKYAztfyOcVv25akEhlez1HH4oNeYC
	In32SPyKv2CCiTKnzN1iDLp6ZYygt+zYcTvGIN+IirCXWRTPNsnxfSFRvkWtCBi5
	rcA5dXL3qvL6tDJZmCdmLhr0H5VjjsJXF0R/cGklP+9ADtG84j+QRDlMZW0eBOhQ
	M90qLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtsb6sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:31:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7403e80b0so22265175ad.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048660; x=1782653460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=;
        b=CzGL8Ryfd6vdmubXqEZOkU28kUJjF/raVnPkDiKSfHYh5NwaYK9d14qteZV8BB/aKz
         ymGcZjwXNKwtd81m8RD2gv/LRNDEYMeuXPOGBjn246hFsUg6TFZasdx4tq5v5jvy+cFm
         NP1UEl4OPtrf6/kCo12BQ+rxcL640L71atdlw7qgxkZP9mP+BBJv9dWzFQOhGf21r9MO
         ZwRVlAumhLLy7OYM7SaP2Hpwdko/u4EcIQX9YbX8qlM2KBliFy6wNefpSW932BD6o+xE
         d8loV6pDqqkdJrHFQ7vySa3ZpWhpXPP5r9rzw4MwXb0t5eS5zesSeC91johjJUusHCVQ
         b2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048660; x=1782653460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=;
        b=CNvqnq2qf6X6NaUJmIU8Y09Lz8jWo5apB9wYR1pxUSTPdRjuTIdkoo17n7TzQsdP+9
         zIn2f0Gug+y6EXatkMuoKvSHAotOz7CX1eSZzZlWsNIfZ5yjp2cy2/Bm95G9wpwAsScv
         vQZE6ZQXlKmfeLKZ0uZ7MQ1340RWRxInCib+h/nEDoRHc7pz71ghMePP6I0UEGnqXlE6
         /4fUT4lfAjKA3O6BFxfogU4ZLFyLRlQ02dv5gkKRh/5hPVHuVFfliN5+CW623xK79CDd
         Kt0WH67NmJ4Xw8Onyv9opqAp8uHsLklHLDIxiHkrdpOAOWZTlqoKHmo5xyNuyTCr7X2X
         Ww/w==
X-Forwarded-Encrypted: i=1; AHgh+RoTWPMx1Qb+C8Gd6N6h2mS+0PnzJeyLOzwM4f10il5wBd1RZ0fKkxqhqaSO3juwo3XRZmmLzIT74MY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53w9nYASgEUMBo3PS1/itvvl5FfPpp2eh+xvqX6WvYPOilOGj
	LhPXpy3EE48WKiXRSNvb1cHh3ucUmLzyc2Enb3gFkAEXazrUlZsG7wQW0PVtS5j717qno8NY2du
	TYhbOU5IZcis6GabOE995/YGw6JTVYfLmI9t7qeUWpWiwPfqXgERwP4LtfO7EvN8=
X-Gm-Gg: AfdE7ckIj+vBBOtjQWbvZNtW/v/NskAod1UEyPr86RiYPNlWVC+TuntaPy7QFXbvYJV
	gcjmXGLnTIu/+aSM5yd6GjUO6tzgq0KHXt3LPj+h25anf2aj0ev5G1aNDX8nUl0jJ4xlGpC9n50
	j88KWBkTMAp+qM1+8Ylj8tq/oelWGwFhRXdziYFNmeX8obxS3V5k5vJiQrPmyctZhVb1Tr5Hd+G
	etnzE0Z7whKH0BV/pQHVneyaUjngTku/uPqdEczB3nHYdGMaJquVM6ONNYOLDPaQmDBclVwUjYZ
	3yRABhySlpcCB1igHpvvDOVrMrsXl/FtnhimuT3eQOmoENcEx/ad7LNKZUxFI38Eje1eTb1Pncf
	PGYq9JFOnvwIAKtPUo4fc0nxftLMYBnoJpz/CXVK4
X-Received: by 2002:a17:902:e881:b0:2c6:e1f7:b4ce with SMTP id d9443c01a7336-2c718f3f09amr126472905ad.28.1782048659584;
        Sun, 21 Jun 2026 06:30:59 -0700 (PDT)
X-Received: by 2002:a17:902:e881:b0:2c6:e1f7:b4ce with SMTP id d9443c01a7336-2c718f3f09amr126472395ad.28.1782048659143;
        Sun, 21 Jun 2026 06:30:59 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f9026sm48007125ad.53.2026.06.21.06.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:30:56 -0700 (PDT)
Message-ID: <9f89a2d4-e29e-4dea-832e-622bed566bc3@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:00:49 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] clk: qcom: dispcc-qcm2290: Update GDSC *wait_val
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
 <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
 <66iobdkznpqqy7twf4fhu33m7mclnndlrjc4urt2em6tfe6gp4@r7wd2gnzsjoa>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <66iobdkznpqqy7twf4fhu33m7mclnndlrjc4urt2em6tfe6gp4@r7wd2gnzsjoa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uivP_-tknCWdhlfSthQtBsoMszA-pihC
X-Proofpoint-ORIG-GUID: uivP_-tknCWdhlfSthQtBsoMszA-pihC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfXwBynKd1fJP7O
 bnnGDIR+36O520SBFwIRExQOyCCd90UU+kgiHIFPghD+HbrV2O8BZfgzQGOW4N3+Gg5vA2ee+l9
 GxSUGntgswLCSB6ztZIg4+KeqM8OgmTk++TC5UWHqUBRCBVMIvTWzvDbmh2spFBDowaAgBb9hH8
 GNCjbSlyU2opMsAUBR+GSADHiYTOK91GPJ/VRukdCR26Eak11JKsgDG9mBncyAgGccqC41lyWNp
 dYpo03qSavHTBrT29FENI2In5WCR6TdKBlwN8hSH84rwf/6Wt4kGGqc7JBHA7i1fGwqy706I5u/
 Oaj6GkDYz6dykyPOgzAEhNBNlPFSj5y9ctJ8udO/vjwQ99ELGIEhpytVZdULzjQLW1BoQwPnWn8
 KD8wy7FySgyOqtY5EB09tm7Rv2vQR9GSeiLA+7cafWF9XYzuz9mYPlMC5h7MEun87SSb4r1wEzP
 eHcHTmrJaaNzVAsDVuw==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a37e794 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-FpPnIJ-wZmyQQF_TeYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX2/cR3aTWyw1b
 NaHIWeFcWQcjEj4EOJNsJ9DcNq4lzL4qj1YcgbIMpwbROqUMI21rKb4TrX/zrgQ6fHj8lRLEaZM
 ar0dowz1aTHzSncNnsvxC8/dxPpISfM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137



On 06-06-2026 04:57 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:13AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
>> default values. Incorrect settings can cause the GDSC FSM to stuck,
>> leading to power on/off failures. And update GDSC flags to retain the
>> registers, and poll for the CFG GDSCR, and switch between HW/SW mode
>> dynamically as per the latest convention.
> 
> Too many ands for one patch. Zero explanation (other than 'latest
> convention'. Which convention? The flags describe hardware behaviour,
> not conventions).
> 

Sure, I will split the patches and update the commit text with the 
justification details.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>>   
>>   static struct gdsc mdss_gdsc = {
>>   	.gdscr = 0x3000,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>>   	.pd = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>>   static struct gdsc *disp_cc_qcm2290_gdscs[] = {
>>
>> -- 
>> 2.34.1
>>
> 

