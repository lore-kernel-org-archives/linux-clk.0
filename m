Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F442DFF28
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761800837; cv=none; b=AymdrkWsr5uODtzcBcxMrhetil+hnsMy8uxSUHtAcAFZSgQWZ8G3IPKCsfl5QudIO05srApjMB4IVnuhU+rrpNh7RYnk841mn9IZw4Vg3uIpix5M+whsdT9GK5nY9QGImdGmOTVaWLFJY5XI6H9fa60Ad527P36Ze1Ue267zc9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761800837; c=relaxed/simple;
	bh=2lp1dpBpdb+VIBhALkPgOJTcU6kbV3cHuAM06I08Z5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMzJZbSrInvGSVlsAS0WtxnE9aiG9sefRyBEKjn2psGZQn23zdcd2Ycs75g1nsuiKpF42dxe3kbP2wcQ0mMvCzObIHgX2W+oNwC3j97XnVGqZztNRUkvpTAMgN//SCjaxBcn034Bo/K5C8dJIhRZGdJD4SKft4I3+thbtY8tvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFdXuMa+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfjhIbD8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFdXuMa+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfjhIbD8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U4xfoj2622811
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 05:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBRGR3fYkDhVv3wALMPkIO3OdzVQ9GPRP/byh44YZiA=; b=CFdXuMa+S+r9kCC1
	EashrTEWQ9vGzmUE9Lolf7Mu8fnPHiY8jnJ1hcUWjEst2fmZP64kDMXZSFU0nuT7
	Qh6h5RZM4F7TIIbMcuuWTcHgjkP1QAo/lmkwWPwOuG4SkXZUhqSr2c7FBVoxuslm
	xuQOVFyRhaV9uqZZcGKfQmPAizZx0qKsrJYNfMhad2LR/x5FTdcdC+cuAK1j5efd
	kEyVMg9geBqaUXpVflAvgl15YAsIETZGR1BSOiyHakIPZzcR2KuOK+K9SLLl7EH3
	4ugH8pqH33SKYPdkTB6IBDkVknxvN10ukWlvdinAdrllAx5PbkUDqgdpe3sziWoZ
	0W2p5g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxg0hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 05:07:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5533921eb2so337289a12.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761800834; x=1762405634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBRGR3fYkDhVv3wALMPkIO3OdzVQ9GPRP/byh44YZiA=;
        b=FfjhIbD8yBNpCtzux6X28P7W5SvT8SzUbGDxLRmzIb74iwIAz7E3bjYcqvb8TGxtG4
         P9q3w96+gOIMV6nFxmYvBcRYP0+FkX5ZhLMBH6aF6cM9A1pBVXytvoooeBCD2x4s94ag
         1j2+ObATOf44eYlGDo/hDNK29P5jRoOIpXNeL9LAkUntn6fGUfbth34XmLMsEBp72u8T
         6lGxJq7OGi1WYRKsAjT/ziYIc8vl4jf5W6NvSFDK6y6MSprd6noVANgyO9vnZ+SiKlSe
         Y1DFjndTgflTc3xihDqBVmCK0B7KK/YyrC/+nBkRuVjBz6Z6wU2JeAabjStW7GE3CzdR
         o/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761800834; x=1762405634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBRGR3fYkDhVv3wALMPkIO3OdzVQ9GPRP/byh44YZiA=;
        b=OMJuaJmiFOw/6VyqZivyfbirazH8I0Rj/xdIZqyptMeGg9o/wlnF699gvbw0s+mkFt
         tocLGmUnYFqCthlkidar4v5DY138ekycqOGzk7IfEeEI5NcOZPYiHQ0Bxb+ow0rM9L9H
         i4X8PkWJ5dOrDygVF3ARBtzu57j/fZnkzgRHUKIttQJixtH9aDss3LqMcCFyqMzefWLj
         GP1DwYTOtFHGEh12M4USKffCTxBXCCDNINjcYAtR286eIvjsnsBAtBOVgZLD393E42cV
         MurWGBGB3/Oekp2q1mu3jwPclgG5BMoMHuXFo2pk+YDI8VXspve68xBmGstzqqThzeTN
         1FUg==
X-Forwarded-Encrypted: i=1; AJvYcCVOzVsGUBsnHlhJUMEZdO2T3LH9Fjf72KPa0O7jkgVOiKT11IKGLEztimBez5OvXE6J78xrbaIGYV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZoMmGww737YeBVKJcf1KvQXOCNmcsAsTTs/OL9OKWAw6yynKF
	CIYui38g1Fs7pDplVKXrCWJz+vhntcnsCOMqbfPBhjbrBt0jgShsann8RANb4/+jqdryL9jF2P6
	izW8RX/J10HDe3RIVnlc4hH6fK70BglnP+h5WvVLqB0X1aqDJhOcQ3fheeXRgLZk=
X-Gm-Gg: ASbGncu3b51YM49vB7MLTOf09xvIm3xfhPJy6DtlqHOiZc4ewiHYhEJ2LFoQ+W2LAbU
	OFWXnNHb+Q72kIeCvSjiOdxuqSEbuZgF1sDWHLZ+GG/pbq2tS4tAOOMjEiyJf3XqX+mxz1tW7Qn
	NX8q4cGXWQVzXxxhMx6HRptg3/0th/+xZd9lQTgiuKjS3Un4kRVUR2e9LCAFlv82hp4LZanh67X
	tP8d6sRGlI4PN+vvfB7MohVm9vztoPhCjIhTt65QRAS6Sy4y7WpPqHGXL1hB8MUPUY0IcrkneFD
	vhB2WxTh5uUQ0xg5ZqfhHhHf7ZE+GBMHJ9TjRROsulxN2C9RVqhy4qWOB6WW+OBXLsG05VOqcEN
	udmefFWyFEjZ2t/E0VIIhRodV0Q==
X-Received: by 2002:a05:6a20:7d8b:b0:344:a607:5548 with SMTP id adf61e73a8af0-346558e31a1mr7679732637.58.1761800833647;
        Wed, 29 Oct 2025 22:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIAPrNETa0XpbAVLslde0fVNWgcT16R6XsCvHpD0bc5qutcP0FWjIL3nluvW3altB5Ks3mPw==
X-Received: by 2002:a05:6a20:7d8b:b0:344:a607:5548 with SMTP id adf61e73a8af0-346558e31a1mr7679690637.58.1761800833131;
        Wed, 29 Oct 2025 22:07:13 -0700 (PDT)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050992e91sm995306a91.7.2025.10.29.22.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 22:07:12 -0700 (PDT)
Message-ID: <eeaa5b62-c4c7-4a30-ab88-729e0d17b027@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:37:07 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-1-6286bbda3c8e@oss.qualcomm.com>
 <fbab492a-e279-4ab1-91ad-2b4000f7229a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <fbab492a-e279-4ab1-91ad-2b4000f7229a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hMo4YqDLdtT35v7En0yvPMBvyv-YnbC-
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=6902f282 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hXX6ih-wtv-b7etiIDcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: hMo4YqDLdtT35v7En0yvPMBvyv-YnbC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAzOCBTYWx0ZWRfXx3t2JSrAPsjV
 n9bdQo4e6H53V7YNQ1KkGtUkCfkWW5TEu5gGptR72bolydrQTHinFfi+UBpj7QIA8QpixqA8Ebj
 +4bfn9tabJtPr+r0oFBhYW0FgccRRsGjBke4thrMGvrlrOO4NWgLJOD7q0VCorQ9radXN4ETfpY
 Pu8PEF6BlT9Yh+PqxtgeJE53aHRvBjZsaZMbu9i3/88aYypxtkwKS1bmNw72mXuio0zniTu10HT
 z6fqPvs8YAfKVvURKe0OIb5rT5OrUSPQaYA9eEGv/BWktQRLqaJBkhL4HU5ehSZO+Xkn5eXrryJ
 fIVQ11E3Sw0tqT0il72GMzYFAAVmVvQruQiWlbRyl5hF7nqr2+4pTYqCRfMJVUO+klLZ5xzsC7A
 TtYKTKHsAbRHX26jp0MCq/m/6qdAMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300038



On 10/24/2025 2:09 PM, Konrad Dybcio wrote:
> On 10/24/25 6:24 AM, Taniya Das wrote:
>> Some clock branches require inverted logic for memory gating, where
>> disabling the memory involves setting a bit and enabling it involves
>> clearing the same bit. This behavior differs from the standard approach
>> memory branch clocks ops where enabling typically sets the bit.
>>
>> Introducing the mem_enable_invert to allow conditional handling of
>> these sequences of the inverted control logic for memory operations
>> required on those memory clock branches.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-branch.c | 10 ++++++----
>>  drivers/clk/qcom/clk-branch.h |  4 ++++
>>  2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
>> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..4094ffc53d0c91dfa9e4263134c3a996100ad078 100644
>> --- a/drivers/clk/qcom/clk-branch.c
>> +++ b/drivers/clk/qcom/clk-branch.c
>> @@ -141,9 +141,10 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>>  	struct clk_branch branch = mem_br->branch;
>>  	u32 val;
>>  	int ret;
>> +	bool en_val = (mem_br->mem_enable_invert ? false : true);
> 
> " = !mem_br->mem_enable_invert"

will take care in the next patch set.

>>  
>> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
>> +	regmap_assign_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> +						mem_br->mem_enable_mask, en_val);
>>  
>>  	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
>>  				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
>> @@ -158,9 +159,10 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>>  static void clk_branch2_mem_disable(struct clk_hw *hw)
>>  {
>>  	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
>> +	bool en_val = (mem_br->mem_enable_invert ? true : false);
> 
> This value is a boolean already, you can inline it below
> 

Will fix this in the next patch.

-- 
Thanks,
Taniya Das

