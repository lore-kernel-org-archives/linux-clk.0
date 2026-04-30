Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE4E3FE64C
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538423; cv=none; b=GUHYZzi13eMGC/oqwNHf4J1PNgG2Qcr5keu9aShtJzdN98edUaZo7tQmBcooMR5MKOOpAf4nV9sh7NHtA/5vdZ/KZGtbmNTvD5Jqd8QKac32a9u6rlzgoPxUwPnQz59YpVbaMVNQn/eizWTkHmmPWTsQcZupzW9oCgOceRoaJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538423; c=relaxed/simple;
	bh=B3RTdQVdT/TQMBR9Xv91ApyqkspQ8nfdAwtAMn8Gc00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTk/0NGJCSWN7cr8QnUlWdNX4/kzpojvKcAIneA1vdqz+LeYc/NfuIP6YJfIxOnss9iy5tazvnbxFSsZ20ptgwdMzvAMkcDkB0a7fNL8bH5QLrKEgoxorWfduJW4nQTkn4hCK3Sga3rvARAM01VeVIxZxVxth2gdj9dLz6/QKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRtZSpi6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRe7ktX9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRtZSpi6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRe7ktX9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U73ieM3884903
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 08:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=; b=oRtZSpi6X51x0jtE
	lj+AGMxfn1+IqhM5nAXB8bPgIFSEspswIzjTogJUkYSoaizKsTquuKFObeiAnfp2
	vxg2hjULj5Dqcx2IWVW48oBC6fvFSOvQEuZUzX8pxfgOt9Ak1nCSk5Kb6cVH9/MW
	F9wqYoS4UF+bIkthl2X30CfmUENdi6AJ6duq2tFzyI6/VzdImvDCvGAdC4LMpa7b
	ye1EWI2QyWZ5R0xjfokwTVkaEAuInw2ixjf3kGMhzUweogGFKbWWsKcusF12MeLu
	hF83IOtr6Bn+i/mdZ+veGLesaAq/eQKOxwqOf9A6kn6IfM1F/uiOOYuoMDYZMx/X
	TqnZow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmahtmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 08:40:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24a00d12cso7373175ad.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777538420; x=1778143220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=;
        b=fRe7ktX9eZq0eP+kTH1hhVMkHXdNwX9FBu8/uPZGgLZ7cYAtZfTbv5Q9zwhvkkuPKE
         30lWr7mMILhUSdjXVuWrF15e8FBKF14DxZu2hlE79RmpfoFAlaX1RK/0vOP3n+RosYgs
         rEb5fmp62TSMNZFBBAeq++4b9dZKaHHJaH6xeB47+IeBP3b1CvRFwehoRDvJ84R7UEdX
         iNukwMpp8aCTbZfl2aWa+9BbQ3i5ayT7e6712QlWPTAhtECTz6x1WUGZx4mDtYGthrA/
         boyZigK5Ut+kOVnBfUlC3rvrl1+V1qJGFLD575Y9Ms9HvjYrHszwgXfaZ3VNP+THcVVZ
         iAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538420; x=1778143220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=;
        b=lDous69ScQDo9UxgyULGuESn1E6FPEuVd27Pod2RwqwJF3mE2+RpEekbGIvPR6pOmJ
         K14piZAYnWdUr73Kz7nAo6X5zXixlLw3DGvuIvUcyIQgYoDa9+vTTUOdXmpE2iQDDDbw
         f9LyklwdbcRZOCUQruIjCvAWkh5Bd2ETyfjdDdmujfP9p0yRgUCHrstJuBHI01nQUbXK
         Vv6evaPzxa/kSyYkKTPZXLqLwDm8jAJ7JpgNpbeIYE8g7d/EBcPfrkacIoqu7DdzIufv
         JcBl/98HyTM4/L4i+657Toh06Hs7kzpMN6O0mdznu8VW8U0e6dP4IBWIS+1lLzcNerYR
         TIiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hSJS8MENWyBKuWX8coAmMEHDXNnN2/nqganKdjNCIS+gN1msKwaSxdGwTFFYqXcuQZ97L4Pn/l6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2l/yFSJSIw0mUh0xAbKQ1I1OVcXx3m6WSPNRbhkgCpjDpwjQ0
	j04gXbdrJbZ1WCm+zMPAJsoG8MADXbp4TjwD2pfcHD3BDqsVQ2cZEn2KvOCfDenKg4+MG0KzS8y
	G2CLNNIkI5tlq+94F3Z1YVf1WqhotmooJqcphCBHxaga+irB2jBELs0WT+fyCNoA=
X-Gm-Gg: AeBDiety8wN4diY8lDmWQ3UvbsAWClwoCx8n8CQ0VdBmNlIIy4SjYJUOdXPlytVIv8i
	vQsfkizTLyeyTMlh53KhjzdUGT9OEiZuZcUTWCpzQYv84To74xiAC0PwCa4BeZL+QEFO4iSxok8
	jlMNN2U+OXEMb2oSMreaDZR8JBPNY8Qq/066PM/5m/aZf3XfUsY0FaUX07voo59EttXyS/WmxMs
	K6eJeqFr/rmCZCKlm9m545HlHUt3lgF1zIAb53YjkPuovuRFNy/ovaeM6ISkZ/Qzh5iYuz1SBCs
	iqEaE03LBOblKWcponvJl2OO58N+/xnA0QC2JI8F2zuF+CKi/TlYXwAaayBcgHYfPnGA88ChW/L
	nKw4fQHpN6v4x/TMtMNa19vYr+3L2sE5s73g6LtBahGvuzM02/dJFWlSgyo0=
X-Received: by 2002:a17:902:c949:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b9a231ad36mr19136855ad.9.1777538420037;
        Thu, 30 Apr 2026 01:40:20 -0700 (PDT)
X-Received: by 2002:a17:902:c949:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b9a231ad36mr19136485ad.9.1777538419530;
        Thu, 30 Apr 2026 01:40:19 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f132sm46236635ad.49.2026.04.30.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 01:40:19 -0700 (PDT)
Message-ID: <2efc6a84-cbae-4460-a0f9-3712da8c33a7@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:10:13 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable Qualcomm Shikra SoC Global
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-5-c3cd77558b7a@oss.qualcomm.com>
 <6f76dd8a-2007-4012-980f-268076fff5ad@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <6f76dd8a-2007-4012-980f-268076fff5ad@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qRwv1rlW9grd1UZF3IGKX43_WHDbQilx
X-Proofpoint-GUID: qRwv1rlW9grd1UZF3IGKX43_WHDbQilx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4NCBTYWx0ZWRfX7OYZAE1OXNQC
 Xggvp4aJeMPykdszCXS4YFU5wYe54aIkyUikSCq0Ehet5bdB2T9fW4vJTEb0ZN4tJy1oBkveRir
 jeoAf3a8VM7pZTgS6O5NyZL26rEJizNdpHQp63PYLwNBhkqGbO7cWdcCY5JoGzxP+QL0sMlp3f4
 fFUtkrEE/JJSJICOD7x1EW1MB48fq+FXY5bE3qSxbfPLzrQAJ428om1tJ/F4J1RZamwkmf3coco
 A7Bw2rRS1qK6eSDUrM3YLAq/HnNyP2l1rQdXsf5v5NuV8LZIMujJXiXUedXIupawI04Dq3f2V/6
 EeXt/VZGCK6nQmOZPmiSBSgAWta/htRNWUaH88C9HlRKhJYKafPpEIuHvNE8Gjt8Ed1xBKne5A+
 MaKPRnJPTbU48avBnUZGGHzLFr6IA3zdpw9UbF4pEPs+QtuonOK9Y5gyVCLF7SJJNBN+vhY0ezP
 cpb4iFd6odj9czxUe9A==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f31574 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FE2aYY5kXyuWuzusOicA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300084



On 29-04-2026 08:02 pm, Krzysztof Kozlowski wrote:
> On 29/04/2026 12:51, Imran Shaik wrote:
>> Enable the Global clock controller driver on Qualcomm Shikra EVK board.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..13e04080b37160129ccd47b0148a64277b8e0e4c 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1461,6 +1461,7 @@ CONFIG_CLK_IMX8QXP=y
>>   CONFIG_CLK_IMX8ULP=y
>>   CONFIG_CLK_IMX93=y
>>   CONFIG_CLK_IMX95_BLK_CTL=y
>> +CONFIG_CLK_SHIKRA_GCC=y
> 
> Beside some really odd order, this patch should not be needed.
> 

Sure, will drop this change, and update Kconfig accordingly.

Thanks,
Imran
