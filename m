Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3E434C821
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763745907; cv=none; b=hdymlNes4VDXXOX5R7BQVwWUHyS/q6NzVjaVEvT6ZZ+ShlA52csMmpB383Rm26UyF0edlb/2BQdolMqLOOektv1U73dwj3Q/ZJT1zDe8d+CWMyYXJSuubBnkqpRkMH6rwjZyCciOTcpUqXAfY79XXKjzzLxaSEU5I89I4NHwbdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763745907; c=relaxed/simple;
	bh=8c1/bEcyP8yhG6CKZxPLYATSjeuF+KNzmpdbDZa8a9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxXMeainszH5/HHTxwNSooGJ5QKnUKuYkFsdxLrqb6N/lFZLZ/7i9UsUhd7V+KNnAN6cYkTlgBdMRFCQP8mRk3wlZdaqBlBxEEOehdT7RkmssuqrrcK1kGE955HJ6YchPcPqcp5Xq2dL5aEBwKBgirDYJ1ON8uJIiludmYLiGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apz7gHg/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExWqQHBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apz7gHg/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExWqQHBR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALDYEdB1638465
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 17:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cy4rp9dVZphWluUO7liWO+PJgOF9A+36SCG9zUcIBJ8=; b=apz7gHg/Ez07d+T7
	6pwnL4tqmjPZy2O3Qz4+Ne9qPTqtwt0JxOIEe0xYpwOYN6m88XNGuMQaOZMQtmyo
	kVfjQ3MAwWDyZh4lDcn96GFeKlfyO4rI8QmRNxBaakyG5HxQ+J0t9qGHc0hta9gA
	U22bjDeThReshOvMTf76U+osKS9vtwFPPMuLkv9gTZ9NYEBeWSh1Ca5moQg1uwqz
	jgzIf71T/0+HME3mW2LVw40ab+2y+/eplayRpuF1mRTJS/Uo4yDCSayxEEDeszoq
	sdpOBstf+1nHRupuRh0Kx/cAvQSGtqpjPsVn8+mWK2PEqLk3p/zJH5/bUjL4G5r5
	Qm41dQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagauj5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 17:25:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso2147263b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 09:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763745902; x=1764350702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cy4rp9dVZphWluUO7liWO+PJgOF9A+36SCG9zUcIBJ8=;
        b=ExWqQHBRH3OwKBWgZY7rxMQ/bmk87d9abn7NtO28+vNZ/wgzXlEWjrRx9+FLfjYP62
         5pQxLSRNG5O82Mcd5lA6UEZ8PxDBY5GK6ZlgYyitoGj4aZ73yQNpNBcdYAN7bIL6OdLS
         s8moksjVNWHIcVDITZr6m9MBcVmygfC8pz08Zkbq4hxP1cluReIIHsVcDtgqma9aY1pp
         pusNJAF/OEu4HdoW3kTcLpWx1Sg9m49xDkc8fhjbRIiAXzO6LJSpXpBeldCroKD9LvJR
         Awx6N3r18kHcGx9pueM3Y2hEM0yQE1XkvtTbPrDPJAN7NDCu5MWyv4bAzlwp4piOoTsT
         /spQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763745902; x=1764350702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cy4rp9dVZphWluUO7liWO+PJgOF9A+36SCG9zUcIBJ8=;
        b=Nj3dUMI+UU6o+dBJWR3F7XnWHcWLQZD8EQZ/RAdBZNXFfIVXnnHNBJpAdr25QzEG2H
         I9EOd1Df6WQELuo4th7vDIqWHovSbBHaB+FWDcwKu3RFjyu0rue8Z1WilPh01haXsqQA
         XBeHFxrldpHmu8QQP/ariPHiYb66wuhlrJN9/jVq8FxPTQiLYIGlxH99aFZpiOt/aaIX
         DyQDVipkqT07muZopdFhSJ4PWKnbSt4RZQgCNRR68cCRf4VJTzTNAFMM03RwQFqEgu9n
         WjuTq+YngROBipzXjmo653xlg9lB6doQJ0ouV3mABL/wuBed4vdNOPqduo+yyonvHuST
         tV2A==
X-Forwarded-Encrypted: i=1; AJvYcCXQuhFxoRrtAirrrVuybsLUSLwkvv/sZj9FA/CJE7O95pJ+5zlT70ZxOfmCPlm19DMjvY8CXCC3Hr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7dMAM+IHOTqgF78GNA9q9ZTing8NhNtBVmrYHuJFkCacAOZh/
	90t88bqET+2WrB+Imn4uuCDGkKgKHj60izZM9m23NmSnsU95fdjV5Un8cqHy7p13TG1rAAoxXzO
	0syik1nw6OrkQ3ZWD7TtWRN/tloKg7upcb5eI6Ku51m/LtZ0owJKKZPPkvwwJuJU=
X-Gm-Gg: ASbGncvrm/v6OCP3KhDOrpKCOVvvqfoYoVfzfU/aRQseNdrs1fl0hf34hx1rERNkJ2d
	isQ6pTglm3LwLo/If4cTrEmIC6xjMqUX9f8v+yeCzL0xozINhTQ36l6nnfpwIB6TknipIGYaY2Y
	C/ZXOQNzPqnTtDMijshe5FHVRW4NEyFxy+3e1B8SETarByAJtExM61lIYRbkSyBQcCRWkZLT/lN
	W7/IEG170+0fJfsGdx5dI74A221xlJ+PKwQ6hL6v/Gx1499CE6exR1rk3Q2Rn6YtEfEC8B6Q6rK
	zpQ1zUNLcTjhH+ziI6gVinyE6HsdseO8cZGaVTnrXM+nQttVt87iqt2vLHLrfzfydTP4mu4Q8nw
	VQ+mDzmMBe2UbN5ki2DQh5WCO8Sgfl6adIHgTzw==
X-Received: by 2002:a05:6a20:3d06:b0:35f:fafa:a198 with SMTP id adf61e73a8af0-3614eb3a094mr4593723637.10.1763745901587;
        Fri, 21 Nov 2025 09:25:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSqOSAg2bp+ltWxvM/VuhIwUQjlal1yRK2gw86abl64MdwTVzYBtgZK+Z5ah7FKPCKX+lBbA==
X-Received: by 2002:a05:6a20:3d06:b0:35f:fafa:a198 with SMTP id adf61e73a8af0-3614eb3a094mr4593695637.10.1763745901019;
        Fri, 21 Nov 2025 09:25:01 -0800 (PST)
Received: from [192.168.0.195] ([49.204.24.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b69e1dsm6611980b3a.51.2025.11.21.09.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 09:25:00 -0800 (PST)
Message-ID: <7be502dd-1627-4a9c-a860-bab622ce1e07@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 22:54:54 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] clk: qcom: Add support for Global clock controller
 on Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
 <vomgxeiqctbnezwunxovwznbepmhxbmixkcpi7qkmic4xhhm3t@fwc3rp7r7ylm>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <vomgxeiqctbnezwunxovwznbepmhxbmixkcpi7qkmic4xhhm3t@fwc3rp7r7ylm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=6920a06e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JNCjnJIMGS+pfmg2DM0HVg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V3eG9db71aL9wJGKIsUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyOSBTYWx0ZWRfX2F0kdqeHNhx0
 wjWCcWOD2d6ocRdiXENOdIl4Tr05SvSXkRqS/sLY/Jt9FSAgsM86jmtFNM6TQHol/K7qr52L1qx
 35AJ/3+GMkkOGbheLAzOLmJGYeXPVtvKZj2lzRDyXDfNb4db2UVdhuZZyRteLs/7h95Fd69PVGl
 yiQolufSVMu3+1YS104+9rI77L5ov8tzo9M8CGKEt+n0AFnbE/E9kd6gxxVPndLs5pPr1r66AwO
 TcGjJTN7orzDdF2eAZ3XBl5VdgwtIVal8shbUcWvmukAj+qsRguFq8Mg+HW5cqtogPKvHeZQmQL
 Brs3TWdOjaaR968s0iGuysiGvAJq1Y126oQOsQfS4J0F/3/Rh+3mvSYQIf26QdQ68dJPzpXmxOK
 SijByBYp/WvLrXYtOklCLR8hdbXPWQ==
X-Proofpoint-ORIG-GUID: ljF-l1OuVAW0GjNczPLeiJZW6pvgFcXh
X-Proofpoint-GUID: ljF-l1OuVAW0GjNczPLeiJZW6pvgFcXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210129



On 11/11/2025 4:18 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 30, 2025 at 04:39:09PM +0530, Taniya Das wrote:
>> Add support for Global clock controller for Kaanapali Qualcomm SoC.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig         |    9 +
>>  drivers/clk/qcom/Makefile        |    1 +
>>  drivers/clk/qcom/gcc-kaanapali.c | 3541 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 3551 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 8ec1803af76cb87da59ca3ef28127c06f3e26d2b..5289a3f07379f3cea6f6192bcb0d73117fe51a5b 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -46,6 +46,15 @@ config CLK_GLYMUR_TCSRCC
>>  	  Support for the TCSR clock controller on GLYMUR devices.
>>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>>  
>> +config CLK_KAANAPALI_GCC
>> +	tristate "KAANAPALI Global Clock Controller"
> 
> Kaanapali?
> 

Will update in the next patch.

>> +
>> +MODULE_DESCRIPTION("QTI GCC KAANAPALI Driver");
> 
> Kaanapali?
> 
> Is there a reason for keeping it in CAPITAL LETTERS?

As we use to keep the SoC name "SM...", "SC..." so was following it, but
I will move to lower case.

> 
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Thanks,
Taniya Das

