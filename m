Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FF2E62D1
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149180; cv=none; b=gzaBo55ElNWwBtQBF6nVZP+gELjkS17hkRwkt5Udn01YiQN4/y5+BD5XtfzLv4WVgBzug8CrkS2U8Uhc5+23xS2eWmOEleF0oHPWYDAuDaN1yTg46Xm8I8L3Jn/2O647PdYZxEGCwtMhz2tVC1yCys8+Zy74b/xN9Qw3GiVYe0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149180; c=relaxed/simple;
	bh=tPPBnOHtxc5hH27MNG+P8XI8vzRuVC8VCoiAo0tkfzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP/BcXsEwYa1R3MJ2AwXXvS9xvPrZ3XeQ7KeYWrabMeYYcVO8eGZfhbE7dfjRudtGFmrq6TbV2FM+0KPWpD2aK1xqHJNiRKZzXXWhiZHNTfAxUhs8kLb6H485NUtvNNjENKX3aqO6ioqJGgSoQT9J6nImz1LsrpmqxWaErOG668=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBXUk5qF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdEFaUFK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBXUk5qF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdEFaUFK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8th8f1522158
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iOIKvIOcVxDrUGn/bUqrTJcQc33DTYzkdXT5RdWu/o=; b=CBXUk5qFFQ3ui2Ar
	1uDhwepgq8FRIxBRCOGCkusZiCtVCJngQzWZiBPdpzoe7zYMmHutCPdn2ssgk/cm
	en/aGJe3EcFkchHE5ztaf7kc/j9yKVEakzR7Q5hY04M6H3yEjA8dV3BkS4DA9I2u
	qCm7xmtwDs5UbdYzLu/zT59VniFw/rKGvBOXX3gmwVO2AOFO/lbFojSNcOE0hcgH
	uu0wysrYxcyKYJlO3t20XBKfJZGd1Cyz6ZPdAkUtm51iWkX+ksbdnP5Dy+5dQWx9
	mdKL9QCK9oFAuNhyaEUO/9Kw8ipDTaDHHgo1WM4c6ChsB9UP4s14gKAh3MiQHuwb
	NH9r+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anxfk03q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:26:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295952a4dd6so8858565ad.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 01:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764149178; x=1764753978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9iOIKvIOcVxDrUGn/bUqrTJcQc33DTYzkdXT5RdWu/o=;
        b=fdEFaUFKkZqw188oluoT2JAQjawRPwpFGMoGuairHqNYaH1nUNrpgNBWSYklUMHY5X
         v4bnnW0JSh3jHOt0AxljNIEl/uS+38FC4QhB7n3n3GC9NcNr1CaAQ5ohpCTwPZn1G3S3
         1Hxf1K6lSnZAprl+Mexy3uegy350+o8h8LBNgPjLIC0D+rjFbL4jPNjs4hMSrMjaWsLJ
         p5j+DzbcjI/LuMjM6lVtNdMEcsagPkp8JHC1NHSBEcsL7hVh0VVgP0nBvH+m164P5diU
         ZKpQsXWBpIXvO0jXkvaRt/R7l6ggsT3uIkazLriunwINPPZD6LTFnUQRkTY0I5QfLm/S
         QD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764149178; x=1764753978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iOIKvIOcVxDrUGn/bUqrTJcQc33DTYzkdXT5RdWu/o=;
        b=Nak+ob8z2NOvDHAgWmrqSDF9SaAXxBzuXnZW5PwokRYLposujodNRv69wWVhCfM5xr
         UHMYDPsCQ5jGklmfsYJ5vlIvfSEPFyc74p7ydomja0987zOQPTNeUiOovMiSh2SbOhwS
         QBzulXuIrtZBL7jwNjReGrCsiUqqjMURvKVsMxagd7wsSSU5p6oJFJolauEXDuLFs0iG
         FocM9/pn+8kDhzP1eIyUrbRKjxKJ+D8GlbFk1HjybFyu5Y3icD6DfJeNgUnIzMbwQ/zz
         QKks4MrlJiAuCAKBukwtHzQgWsmU5HOA7LASVoiOlWmnpsxjcvCWgCeAmVO1fVRET/FD
         YFPw==
X-Forwarded-Encrypted: i=1; AJvYcCUnamNvc8lIRKggPF5Unshd0hW64zShdrcDSu8xNyOW22mwPBgB+N/aTcoMUjcoTJTjVRD1J8zfpa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7UNx392wQHSJlZhlJaUGhBsr58JDpUsUNgJ/2oUM4GvkPIo+c
	JmimQI1rhAfNOg+6uZm0wPqWTq18zxAoUKxUj0NLEGSL0CfVvimZ8gcPsNH8VAbtEJZp3VcY7Mb
	+92FsBBwguHbigbXNsONk+RfvtXZ/3g2Z74TIoZ5jI4PBq2EO4wTqGTTLQhdZE2Q=
X-Gm-Gg: ASbGncuJC5qkP7slhDMBKp+cxVul+PvGDDGgZ0NZIZv0+FtiBEcf9Ig4LmAYi4nndSd
	UFRNyVA/TFv93lYtymerSEtifqWO/MyJi6Cx2qwF0zTOFNfQ3AOLEe8tZhvjtsU0acO4JGbZ8xU
	BAaLF3Vy7kTEtOcU+LO+v4juw4PyLn9FVpn1EzL31LY8alluSk85RQie0pLMXfl20xJjq6lF66S
	+2oSee8lWLkbg9qaCqosCUxuJ2Od1v+y0Ypad8F3pjMN2QLnfBnd9kHmjJ3yE4WBq462SEMpW93
	xM1DQepFqZa6MqswYWblz4ivMfJvtsZ05J5PbaqKwIZ78txXTaTQE3gPis309jccC6pupdsmgOK
	AF8EG2IgGvQXFx6fN3GuaF/R3zccNvOMOptOmWg==
X-Received: by 2002:a17:903:2f0f:b0:283:f19a:bffe with SMTP id d9443c01a7336-29b6bf0db2amr206246585ad.7.1764149177640;
        Wed, 26 Nov 2025 01:26:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8qzFM7CQPeyPIyM1ZH9ZWnXozvAoz5/N5dhh4bCEle4vu+aJvbhCSV8a7pDtVd/H4ZuTBqA==
X-Received: by 2002:a17:903:2f0f:b0:283:f19a:bffe with SMTP id d9443c01a7336-29b6bf0db2amr206246225ad.7.1764149177092;
        Wed, 26 Nov 2025 01:26:17 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111650sm186724155ad.8.2025.11.26.01.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:26:16 -0800 (PST)
Message-ID: <9d3e0fc0-316d-4956-9e9b-3bdd3d08a8af@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:56:11 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
 <e177d393-de17-4bdf-a0dc-002ae5b7f58e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <e177d393-de17-4bdf-a0dc-002ae5b7f58e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TRC-bewbKEpFJvuo6aqnexwligLFNslY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3NiBTYWx0ZWRfX5YR7qkQdn/oQ
 jcpuzSXKh/YpWbkmvga9l4Yn7edlMgpLhux6h/dKRF4Hb/xgChySMvx+ia1x6SYPuB66fWkX4ZA
 wKVNupYDRclQZb31VgqOVi6nAWfoMx4C9vx9m3p56toZ1X2FlzYngzl2G6Elk0gm0olxu9BoDJq
 SONzMsvpgYrMU6ZQJHk/W6huDu1X0xcoZtF3iBbVWUVTxTPHij+Ji/jRyELMRoHkbtZ8ZNEC2mf
 7RMCtA43fAx1s+SmOauzpKr9uHTXWTjSGGXVQDr2roVlNQZLCWgnb7nBsy5k3fHIUY965SHusn8
 +dpC14rvpsXI5iHwOAAwvZ9rUhaadUTkOE4UHdAdmn/oeKqC89uWCrde6wW7Tm7aR3R+ziRuygS
 OJ2xcX8oUM9T8u6c2JbhGf8r2YmC4A==
X-Authority-Analysis: v=2.4 cv=H4LWAuYi c=1 sm=1 tr=0 ts=6926c7ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6MFxvG5Tti7RlCfQ63UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: TRC-bewbKEpFJvuo6aqnexwligLFNslY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260076



On 11/22/2025 7:25 PM, Konrad Dybcio wrote:
> On 11/21/25 6:56 PM, Taniya Das wrote:
>> Add the TCSR clock controller that provides the refclks on Kaanapali
>> platform for PCIe, USB and UFS subsystems.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = 0x2f000,
> 
> 0x3d000
> 

Will be taken care in the next patch.


-- 
Thanks,
Taniya Das

