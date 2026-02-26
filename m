Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8526CE3B
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 04:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772081152; cv=none; b=Y7Qs8qOnMbgiZ3dkbDP1BA5S81qVXZzpU2Ezqvc8TpkSW9pu/wznzW9keBDLttmBXaL8tTk1PcOj4OmTo+aNoAZ6zDdHG2ZsDJ4F1nFhvK4wkYzrtYhH81R/3REKsO+7hu/gV+yBbfSmBiUGPz4/Sysfr2kmMoWKRWNDtHU5jrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772081152; c=relaxed/simple;
	bh=0n+P4MmSpe0QWlVztj58VkuID13p7Stq1zkRVOvoaqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBQqtx1EKs/v2OYRi6sii0/VOcBq42gcna8V9/ktJrE/4+rfwkOvPRKsoR7DfU/6N1+oyxvx4siw9S2lLSGaXC5mNxolJlmvh5F1DK/S/yVU15BxhUqN3sLAxg/C2UmwdXkM8f6X6D9B0lES+1BOGaMzOTBQI6PKMhEBW2oCoXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XG341JVB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=geuKUBK7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XG341JVB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="geuKUBK7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4Uuo13776980
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 04:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Wkpa8xuDXDf7dfh9n2vR0UL0ygp88oAfJyptUfvj/o=; b=XG341JVBiu3eeVv5
	Cei99YNwUq4ZzlWL9rY6V1EDGOzpBwspNEfqkSNKTkRNNwlMioFVv3FDVzxHhXk8
	8W7uODe6hUJ7wQXHtCKvPkG1VN51F+shYxIma7LLHo9ecrOHCSWdf3Y/zepQKTgK
	+gVO9lXzuY5aydkyINIUZCxqbL2v5iKGtWTT74YfvPUebrOyyGFOYbglwH+5OvPw
	FAcXAOL/2XI7kEuvIqYC/Qra/24MTidJWZkF+LhRNeDOhM+yAoWMlETSrOvXvQ39
	VWLJnAdVGhktwb4o24MnKEC6Sr25I4jWoeeSZuMIVSRCGXK6xxEBEsbjPHQwNwy/
	ad02xg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0rs6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 04:45:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2add182f21eso4635565ad.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 20:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772081149; x=1772685949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Wkpa8xuDXDf7dfh9n2vR0UL0ygp88oAfJyptUfvj/o=;
        b=geuKUBK7C4tMszrfOH8nLGCrwEZOC0i6MlUJHSmqQjcqprOVJMOc06I7uip6BdrZCO
         6/kvX6eVi1uPKhOhMG+5M4bxfrhwXh5dPhZkYHAMkaZYsqVWAQmE1nph9GI6rVDgZ+7a
         qudscBoBXSU4pqa1CS1QyzEomNphch7iCJl0T8FoKPC5RcZRddULL6xjFdPu8Y1Jahqm
         NTIna7ZPke/hCv8+rR/ZwpDmATJ808515QH1jDVIEIFH/jgbwYwQETnX7WWiYiJVulF0
         bfAHM78Klg5ZescaCW8ddFqAL0b9bDL02ELdYz1gTzp12bK86A6DwpQZ/o2Mh90QbQUJ
         SCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081149; x=1772685949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Wkpa8xuDXDf7dfh9n2vR0UL0ygp88oAfJyptUfvj/o=;
        b=VWiTv3sTleZP2OWFt/zKga8i0FJoAWTpS89ucZAAzyYy2NAM/I1DQvG8uqUT9IWKyd
         kDeBWBuJblyUSMKksNS2MwEBK/4AzytkNvvuXLp9pewD2CWv7ORCsjjGpHQViagIbB/P
         VG0a6ur1yXT4fl0KFnK3PWOdnrKsbKtSyYvmSstwXOyFWPErHWkHtjjgsVxl9YdTQcUq
         Dm3wOH/dVBNGDywX2+30BoJ8aj+0mZFNutVTLlw0xFI/rjrXMJ1vIiPvQIvqSONSODZD
         kXG06RaE5evIU3nWzB/5Pd5u5sa2CywKMi7PRNorUbmXvzj0PNC33rR8h5s/ouWWnmVI
         qMyw==
X-Forwarded-Encrypted: i=1; AJvYcCU6t4plGnnjnbj0HuUFgY1dV0NaGPqhuqKLj2pJHJSrdMZE6JCWXXNF16Pk15K/9jPX3BMK77zya/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb85OwhrgzIKa+gZ+fPj4Jd+scOeagmSUJ1diO2PSlTzXxEyE6
	gIgw8Eb5azLYvPnAn7ak2ocnudZX9qpd7X1To6vlGOQKxW8hn5jL5qOSL9C86V0Hg8sR66hHAiv
	YxcM2Z3HVu/wVlNXhliDZsINWR7Q6V1HgBZwTYaG6PWbif7nECspSkU3pxYPpf08=
X-Gm-Gg: ATEYQzx0Uprd2YO75YM2AoDnCbc5vKy59AtoFuFsbu1Hv8iGORF6n2b9qnNb+o3oUHz
	4vIfa6b5oUdpOy+HByUx3OQZbqIESAof2acnScp3MHMZ+YECJdqnjXozqkM1bSF3MAKbSelFazo
	y8hcXLxqGy8LIHu0OzxewdnjQyxQrH29TNEh9/aFeNhTB0GC8+ZskVmQhpaZWwwlBuCRRRogLLa
	mmGJM+FFCV1A+Fsiqh9ROGLEUmweTzg/0zQ6juIo9GtbAVsn1qD5sg7Mn7if8/znIR547wOSUbk
	nKO3krvUvn3NxL5CFoa5T8JvJJrguQRPxR4AWtk0R/UKaRK1CNEQBwRnmPBE0HTn8DQt53xfmCt
	AVVifu6cZQCezZ/j+JgiczxSh8rX81sCkEfV9lL65JKSq61iZnA==
X-Received: by 2002:a17:90b:390f:b0:340:d578:f2a2 with SMTP id 98e67ed59e1d1-35928a5832cmr2322848a91.6.1772081149456;
        Wed, 25 Feb 2026 20:45:49 -0800 (PST)
X-Received: by 2002:a17:90b:390f:b0:340:d578:f2a2 with SMTP id 98e67ed59e1d1-35928a5832cmr2322824a91.6.1772081148977;
        Wed, 25 Feb 2026 20:45:48 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35901883a0bsm5712868a91.6.2026.02.25.20.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 20:45:48 -0800 (PST)
Message-ID: <745022a3-ecfd-42c8-a01d-5861a9f479f1@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 10:15:42 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
 <20260220-gpucc_sm8750_v2-v3-2-6c5408564c3c@oss.qualcomm.com>
 <pis46xtmxgopk4w4kvu2qbbtcwchnbepaqaw3lbtfbon2cbjls@xjsfo65uj64l>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <pis46xtmxgopk4w4kvu2qbbtcwchnbepaqaw3lbtfbon2cbjls@xjsfo65uj64l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAzOSBTYWx0ZWRfX/B8qNdZaEOL/
 2cnoyyR5ldE9RMZfdTUNHJiB/4WkZzxGmFMEMe2065t89J+SLYs0j81CC9hn71sTvHdFfNmgj+R
 jEQJCYxPytmozt/3rnCG5drc3LUQPbQuNo94yrBiLtvrpBfKhERU+XFQVSPyYBSuJflcgILjQlb
 KgNvCo0XzfzEwnlN4xqO32bhGrO+rpbtjILSzdaF9S+tkX8wCktfqt+xP2r8LQWGh9SyvJ4rCKz
 /WS5hyw1z7PqCd4KMz3lSwdc8i8tZWInBRTcoyzB0IPZO/wc0o0H+8T7Pw96bgSH4Qpzqn7qXbO
 ZXxiNp6I3qndnHuBdR9U55E7h+m5Mk1FUtVdK2ErnEK3QuiUXNoZ3W7286CDKKEebPdc2edxQwe
 N0/y3QDZA8AWM8dx5TbwkPM8GHhvp5zKOAALBbzI3/bvi4t83T5zcRMYcj+gurcDL0McfEV9Wqv
 DYPeYHqvl7LVGOXilHw==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=699fcffe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6F_KMvjuWJjJSnLB6NgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PDO8f1lzJ8dWJqVh7LZHfKvvImDcMOFL
X-Proofpoint-GUID: PDO8f1lzJ8dWJqVh7LZHfKvvImDcMOFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260039



On 2/23/2026 3:06 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 20, 2026 at 11:24:21AM +0530, Taniya Das wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Support the graphics clock controller for SM8750 for Graphics SW
>> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
>> block dedicated to managing clocks for the GPU subsystem on GX power
>> domain. The GX clock controller driver manages only the GX GDSC and the
>> rest of the resources of the controller are managed by the firmware.
> 
> You missed patches for the gxclkctl driver.
> 

Yes, my bad :(, I missed committing the change.

>>
>> Update the compatible for Graphics GX Clock Controller for SM8750 as the
>> GX clock controller is a reuse of the Kaanapali driver.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig        |   9 +
>>  drivers/clk/qcom/Makefile       |   1 +
>>  drivers/clk/qcom/gpucc-sm8750.c | 472 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 482 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..817b13f5e78cb534e165b09d95e70cd4a58b12bd 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -180,6 +180,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
>> +obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
> 
> I think, If both drivers are built-in, this will result in the object
> file being added twice and, thus, a conflict.

I have tried compiling both kaanapali and sm8750 as built-in drivers and
I do not see any conflict. Please let me know if I am missing something
here.

> 
>>  obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
>>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
> 

-- 
Thanks,
Taniya Das

