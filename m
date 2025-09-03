Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A043231A23
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882240; cv=none; b=qWr2Wqu/h1Uie+x8oQyf+XogwOpAZFoPmgp9seebc0MijRcP1hg8G9Qw5pvOA2GbWiKw2SskrZzyv9pDPu76EkLsm8Gsa8I7+aBQauL4DqNDgutk5zeuPOCnq4S7Xy6ymoXdnej/rUHVMkawajaZ/u1HEoxHu51g3Ya0s5FKvHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882240; c=relaxed/simple;
	bh=OZYvAJLqb8zNZnB+JiPiyr5fYxUP3/2uA4CPj714OP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGHGN5QjPbUyDEllF/uuM6UdXuEhSXXuK0adFwUXN9AC8L3tUDnJ4l3snrEQvFwkwpDWwe1pXhbvNrzy/gA1/JTakIbELpm7LH2uJWzg7mEeSZqeIzQ1fIGnjaLuFNgQt/KwB33V7K5uP3PdIlvBYiWxw7z1IYu6bySdKs1wgRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGbLRnAf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGbLRnAf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831ZbDZ001734
	for <linux-clk@vger.kernel.org>; Wed, 3 Sep 2025 06:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9hHMK6M77PZdvE0eh4C0zvscADxksQZEgHG4rBgto8=; b=DGbLRnAfsMgDDMb7
	cqSsjfPGazPKIOo9K5tINfJGUMJvgbnopVApApJMkdJ80koFpDpIlH84DWjmc4+r
	vInlObQABHp3Nr2u9g/oBoElHnMDIRXX+SnEk/WBbPb9ewlUBAJNeKsE19WTThkp
	l3HwmJRzwscl/f5Rnk4m5Z/GtsCXCCtqAEjt93FrIMk5WdfHl6/9vj1CY2AzSvNB
	ucoz+KCPdizVzeaSy7adUGBrBKRrqMPD60AAOBjL+4p2GwpCFK2T7S0L1xwLM3LB
	KvS3A4K1y0r/+uqnfCtuy32RhkRxZpn5BAHRbF3Jxmz73GfOtSuNnnd3cdYaqSyr
	xAq5JQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy6cm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 06:50:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32b51b26802so953874a91.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 23:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882237; x=1757487037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9hHMK6M77PZdvE0eh4C0zvscADxksQZEgHG4rBgto8=;
        b=WlstbyttjGhS8EujaUzO7rL/d+c12MvNzI7xJ9KkScMnAkoodEyYF+PqNrnuKMmrST
         MLbRwsSYJll1BGGsvONOikZpQtVVqGFBriC8AJBpWYhcdZIiSuNocUgCbx7AlQ3En2Vs
         um5lk2PErwMFnMDdXYuJJK+BJDUhKJgA7M7+hx6zjDEIUzwQURox0SE5ZaLRCuSnDPsP
         aLzJRsSiU8N6qh5C+s6ccB7pTAn9WRDOxmtu2sPxG0X+YHYQjDUYQnRCd83T4MEWdgkA
         dgLgdiDLlXZW+n0Q8lV+xyt52/drdbjuypz1TVxNPhXjCnVzvXwkKyfBLHVYUTZyTu3U
         qN/w==
X-Forwarded-Encrypted: i=1; AJvYcCWgnwt+AVeDJj+r3hqOI5omIoV/ZLev/bh5Z+wzh/2djk3oGo5wOZwgSmZp7QTA3IpaENrVoLKQ3p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXlhoEqd12cURjmJDcPTl5/Xv4mEG1ByY/Ui0v3FZA2DZMyXD
	RIFg0jeOcn2rQ9EezRKQLFHLogohWE3FaBlYcF0jF5d22hv5CyTfjvH6LBnDxhagi5Dy3Y9COFi
	LYFnlmuHBgT0wR4P0u7P0kRsb6Y/Dsg68QnaAFgyVCtM8au58ZpiNRC0GrJSufjQ=
X-Gm-Gg: ASbGncsB6VhTUlitdrGP3O+DqZ71wOWXtlyNVJnB9WvYD/y4oyUzlWWzIh0tclwqpK0
	JJVYyUrFegtiUhd31s2Z34r5Nysle5+PlsL0hmxhp7WoYEC7L9i0ur99PJYTpPYLnIB8ZE20yed
	sJg0CuHUTDftUprOwrSY4i+WS2XvcY1OoXOOwQ7JAmTsVEKMRi4JWo4CRorLzke2Z1sjGDwBzrA
	6toHEqY1Jm4G9ThlCxZb3C2oVpYA257q2eydhwtPcqWIgix3nI86gdGwSf5fhVZoeNvO5GaJVVk
	X1MNNnNT+DG/yfCixYTrLJD+343Hv48FBbb2gD/tj/DZU/wKTIXYpmN03tLkjoVMu+cm
X-Received: by 2002:a17:903:2302:b0:24a:aca0:7cfd with SMTP id d9443c01a7336-24aaca081f9mr170262615ad.18.1756882236688;
        Tue, 02 Sep 2025 23:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyFdo9cEWjCOC0ZpT9gc5RWF3uY6Cc1QxsgEsFMAs1ei1aEnR+j4ANyXrofAMXnY7o6hOvdg==
X-Received: by 2002:a17:903:2302:b0:24a:aca0:7cfd with SMTP id d9443c01a7336-24aaca081f9mr170262325ad.18.1756882236220;
        Tue, 02 Sep 2025 23:50:36 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8e94b34esm10185985ad.94.2025.09.02.23.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 23:50:35 -0700 (PDT)
Message-ID: <6b8d52f7-8c97-4aa1-9674-02aa13fba18c@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:20:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
 <484eccde-bcab-42f8-bf6f-b370fc777626@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <484eccde-bcab-42f8-bf6f-b370fc777626@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b7e53e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PZ7RaY4/qyhr7oYTfvPPhg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W923pDGaHg0UEdA9CysA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: BKYRL7LL5MyQ4ENEPuAlmg0bKybss2XG
X-Proofpoint-ORIG-GUID: BKYRL7LL5MyQ4ENEPuAlmg0bKybss2XG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX+k5L/gsIN1D6
 3pHB2vmCy51orKNUDh74P4JOEOvnvJENKfEFRPNi6atbrd3MMbqZnznoaTChLRNNwoYaKdi1GrO
 htjJtmeUdRiOEfQavtVhvxPWPwjT965MbtZZ3DwnoT6z6I/dcT9I1uEEz/7Hrs5Qkmf2ecKNrLZ
 1nk/C+0Pryn1EkXqUXkCyzyxb+3lsP6RIMDCLQRCUFfUxAA+pI82dV4FzbufqKYhgu7rJLG9ifz
 IA6IoVle1/11m05o831dw/BIqEW1jHmSI97gw+N9DrwRIyJiRGWFfYjPQdNmqACupyYrd29TiIm
 x7p8YkAHT2brQ0/b8FmPBcP7hgytz5VQLJiiSJDidDTl9qckVebk7uYnYdhCeKFyfdnIWHieXbh
 pRSloR5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101



On 9/2/2025 5:27 PM, Konrad Dybcio wrote:
> On 8/29/25 12:15 PM, Taniya Das wrote:
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
>>  drivers/clk/qcom/clk-branch.c | 14 +++++++++++---
>>  drivers/clk/qcom/clk-branch.h |  4 ++++
>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
>> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..90da1c94b4736f65c87aec92303d511c4aa9a173 100644
>> --- a/drivers/clk/qcom/clk-branch.c
>> +++ b/drivers/clk/qcom/clk-branch.c
>> @@ -142,8 +142,12 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>>  	u32 val;
>>  	int ret;
>>  
>> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
>> +	if (mem_br->mem_enable_invert)
>> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> +				  mem_br->mem_enable_mask, 0);
>> +	else
>> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> +				  mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
> 
> regmap_assign_bits() is your friend
> 

Thanks, Konrad, will use this API.

> Konrad

-- 
Thanks,
Taniya Das

