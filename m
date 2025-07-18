Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD72E5B0F
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859581; cv=none; b=FZvT8LAHVM1IviR99TI00xtpCGSXMOI8By4CdtnKkB0bk5IpbVOFvx50A0bxmlm6+dCnHjhr4osT9DfxG9noUFQPD8FAkbQ/cobSZJqMHA9/OT/Q81oA6bwB/IAyKJOrlraoJ/ZgIjxSNMHx/VPhoEx1snF7PU13xhUNXMKrA5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859581; c=relaxed/simple;
	bh=A0Hft1j6L216tZxWQlcBGOLV5bZ4wJTunGM4c9VS3mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPe3ne5bDYHZ1u7U45urPueyojS0nD4RsqEDcbielPpkbY3797HLnG6Iks05Kg7nCyhbcmvBZE41JRxEuBFirLhghyFgxYoAcImW0nWa9xgJaXAYTkK54MRPITOITm8Njhw0HchZW6LjMAV5kWUtpJG7eGjdWf4fV6Z9gqbx0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/yaTaz0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/yaTaz0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEdodw020802
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GduJ5YbGzanNXFF24/hf0EZK6UZ8V5SkZA+qLy9SUOU=; b=E/yaTaz0qmZcflgQ
	ctre4pLpfFrslHbuc7XQoHQTgHl0YNlN+IidqMkkjdpQuguWXzzE/pVa+OzPQJMU
	hYkqsYm/hZFRo15mndzXQsmVc7hdCmPVb4kgIJQFIkE3s3J7mbAyvmb/Y+HS51UY
	HnJNAV0b7q3NUlRljd6AX5NCN+14QnoWKzHHLXqlq0gViykiGAZ0TH+SGl1JUR4A
	bWx7b79CHFfXYWYozKj6PHJMrrCn0ObVKzvA/cGCYxcUwwD2TG98QdfBnlJLpKie
	W7m7f4nRdVIOuhChZGHhpG888hB6PBnc36y/y9ONTpFQyadreH9nj77l50o+iaGf
	/1Y5dA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpqgh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:26:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e1d66fa6so18352315ad.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 10:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859579; x=1753464379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GduJ5YbGzanNXFF24/hf0EZK6UZ8V5SkZA+qLy9SUOU=;
        b=K9DZwrFDH5TCpn69XH6nBoddHv6o3BlgrC3Zvv/5BZg1+F0hLAmCIm2Rl/T+s5zeg0
         PWi6FFoEtgwiZbJhUFElPgI4wrCRh2x2DML9P5WgB9UKO6Phi/6QFU3IMcSpxWe+30s6
         t9ixRsr9Mbf9+UyDRSxwVfVOzQSoouucGOC3E7g3QZqeCWFCmVm+bvIUsCZUnCKeqpoF
         JXjwwN/yW0CmL/oijBzdqhPJZob57+A+QOYlRNuh9wFu5wX5U6Fu/ymkfDpwziQzWHYn
         j03xddZR93/ibNhiUvBuiIP9CmkntZnmPkh6kJ0EV6BTDF0pHsrp3+KJ5CAWBjJ1a5Vp
         btWg==
X-Gm-Message-State: AOJu0Yx0WawsTs20rqpNhKZuPSxkfKfM6VSP1fH17E81tVtyWg9pj1yU
	2ciCUf9aRI81ut4DJLiwX5A7LiVfcZ9ItDafcoJMds35wQoy5aGly9/UaUnRfcOIoEDYSokQlsX
	zJkHodMaPujuVGrSAOoNB0Cz/vjg0FUYOFh2wZTR2PW4hFU4vcPdsJmMjTrmZG9o=
X-Gm-Gg: ASbGncvbW63bnnjx/AsqlEXMNCeJ33M9E9r1vmCq5zgkL8eCheRi3HXxCCLwF+wubRu
	/ymS84gzuXyDlV64b9fKNWdVDmcOQTYGKdb8xLRv7W/yvuXLEghnplymqZyOZZikXU7rt4w7a/U
	vrNDuxsiRIO92ai5xD3qFeRc+MHsZb+SmZCN7BTHqgvYpfpFd7itxw6azJTkB9ozPeZb59sn56+
	d1dcjMpeZY/gDqBoW7EaQ6+7dz+NlEWcGo4ajm8qrJMsX1bjyfPdl75f8D48oKpIlKDAVUqyTT4
	xpzvDFnKCdV9goa3NectaCXy4cCGItuLnoF9McBIHCJA8+FX7pUnnG2Z8NZfgXkufZI=
X-Received: by 2002:a17:902:d60b:b0:235:dd54:bce1 with SMTP id d9443c01a7336-23e24f49451mr169690515ad.15.1752859578718;
        Fri, 18 Jul 2025 10:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiuApPui+DrCZGh1uQCxP+63mJXtxF2yZeaEggDdwLKQBX3di0tn4hyxBqo1Jj6zmyDWaeg==
X-Received: by 2002:a17:902:d60b:b0:235:dd54:bce1 with SMTP id d9443c01a7336-23e24f49451mr169690055ad.15.1752859578204;
        Fri, 18 Jul 2025 10:26:18 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d19acsm16005375ad.144.2025.07.18.10.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:26:17 -0700 (PDT)
Message-ID: <e36a9e5b-f6af-4266-98f0-a82489fa5d72@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 22:56:11 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org,
        mturquette@baylibre.com, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <28ea2b11-a269-4536-8306-185bf272bd60@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <28ea2b11-a269-4536-8306-185bf272bd60@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX7R5+zYFECPO9
 ahbjWbxPFdB6byZCELH1d9+l+M56KF5ZHmBDTFgT+tl1RWn3TJONRbl+04tMmxOuWgUIlcxme9t
 nDngcu++mqX1kyONgK+OFxXqV2XCYD13Htmo/dtkqTsufA1le60FTJ1fyDc6nhHxI8FPaUWdUDA
 Ui0Jih1IjYXb6y0lS1bqHSmuxIaUr1PIrBp5tjiQkkMkaybv13Ez+1VugDjicJvs5TJjZzPtfQF
 wXnZWfPEYusRjRWBd1HXDTaNWPcD2oK3q+GVZ9XGPrHSyOU0ArUkW8JzaiU4tt1K+xWyAEHetkl
 NQnK4cwDx0YHf23zQfHyz9kBntIUGlkJgmX8NxPnQr9GD+OX/vnl2zkxQQrqXTRgEuOCoPWAHST
 GoTFH/lsScJQT30r2R7klyTxZQqPwenXs62VF71i8139C4RKvAzyUu+PoU9aUjtpJsYm27VV
X-Proofpoint-GUID: mQ7T1V0WLEQh3U5uD4ujxDXcly3868Qn
X-Proofpoint-ORIG-GUID: mQ7T1V0WLEQh3U5uD4ujxDXcly3868Qn
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687a83bb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=tMiizUMu9hGndvLFPAJAbA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IDfOk1lORozFkaJI5SoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180138



On 7/16/2025 9:58 PM, Krzysztof Kozlowski wrote:
> On 16/07/2025 17:20, Pankaj Patil wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Add support for Global clock controller for Glymur platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig      |   10 +
>>  drivers/clk/qcom/Makefile     |    1 +
>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
>>  3 files changed, 8634 insertions(+)
>>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 051301007aa6..1d9e8c6aeaed 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
>>  	  Say Y if you want to support graphics controller devices and
>>  	  functionality such as 3D graphics.
>>  
>> +config SC_GCC_GLYMUR
> 
> G > 7, please order alphanumerically.
> 

Sure, will update.

>> +	tristate "GLYMUR Global Clock Controller"
>> +	select QCOM_GDSC
>> +	depends on COMMON_CLK_QCOM
>> +	depends on ARM64 || COMPILE_TEST
>> +	help
>> +	  Support for the global clock controller on GLYMUR devices.
>> +	  Say Y if you want to use peripheral devices such as UART, SPI,
>> +	  I2C, USB, UFS, SDCC, etc.
>> +
>>  config SC_GCC_7180
>>  	tristate "SC7180 Global Clock Controller"
>>  	select QCOM_GDSC
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index bf95729678f6..cdc3d9ba9024 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -94,6 +94,7 @@ obj-$(CONFIG_SA_GPUCC_8775P) += gpucc-sa8775p.o
>>  obj-$(CONFIG_SA_VIDEOCC_8775P) += videocc-sa8775p.o
>>  obj-$(CONFIG_SAR_GCC_2130P) += gcc-sar2130p.o
>>  obj-$(CONFIG_SAR_GPUCC_2130P) += gpucc-sar2130p.o
>> +obj-$(CONFIG_SC_GCC_GLYMUR) += gcc-glymur.o
> 
> Same here

Will take care.

> 
>>  obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
>>  obj-$(CONFIG_SC_GCC_7280) += gcc-sc7280.o
>>  obj-$(CONFIG_SC_GCC_8180X) += gcc-sc8180x.o
>> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
>> new file mode 100644
>> index 000000000000..a1a6da62ed35
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-glymur.c
>> @@ -0,0 +1,8623 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Missing date.
> 

will add the date.

> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das

