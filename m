Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415742E6D3A
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752860253; cv=none; b=JfVcUJFeCCW850mGq6/p3Bq7qg/Oay/wYqTcWFysryWYV/XOjn87QHCyrgTTKtt/8HfnEIGZERUweMyd/XfCZbZTYiEtlBCYPSfF4Mqp0IhOXLGnJx621KARJF/LoYFBZgPRyqOc54Z3YVcTPZCn+2q99R5nk8jdRoC1XtbuSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752860253; c=relaxed/simple;
	bh=Jp1XqFkdELGuoMkw/LjGQL5oKQgMBjwV/r0rNb05WHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1FNDdudK2vwczEMyD87mjVwA6US9VaX6icIWN8dVvG3rvDooRgeo459/t/wYsRT+WBimd3yZGh3xaEe+SvLOk5R7MGCjJSJEhyEvgCnN0rI5SpooWsBHEujfWHYA0EHXylEdTwW6z/rlLQgo+Ha0OGx3SDTuojN1lUsoJVCNYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/7pbHCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/7pbHCN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFtM1S028086
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DbmW9l10evhVj/WcPjTCyWMiSSALM7/4VQmz6IFqWv0=; b=I/7pbHCNKoxqjt0d
	p9wMuOFhH2rdGi+3XLuuJLcfUwd/5RaHKxwdyXJNPFumvuRqFKKsMeG7g4r7rOMb
	CIs9AslrXszcPrdE0bKqwc+10M9bh4gH4ACiPDSNjs/ClEGKlrgznsjAmq9VlfCu
	w6tVuyZb/jcc0EYFm4WKxffWg9CHTlVOlavnyjh4iF57NUpk6gDV6Me6w11BOqCy
	Evx5A3WTTVq7koEHgj2LFUPkrUf3ACEBSGd6ljPLvS0hfM5EaASqu75m9LeYtsjd
	nbLdlR0pDSFzjrGtshLeakqx3/fxvSIsxG1CPGm9BSPHnKvsx1x0gewdK848eR51
	183yfA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh64pgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:37:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31f112c90aso1907258a12.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 10:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752860250; x=1753465050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbmW9l10evhVj/WcPjTCyWMiSSALM7/4VQmz6IFqWv0=;
        b=MiQntI3RNNCv1BgM14Mir5nNtLZFbWzvFWvRGy+2bH/sD5Ajki10N/1deuUZE8WbeU
         XdiI5uji7p8RE8BvtdeqYOvgk9jy1+GCcvrlncVHNF1tqMrTL8lbS5s3gMGK9fcvSRWJ
         B+GhIu77gNwqx0Msl1Ssxp3MvN87BdnvD+OJPotkYD0bbibO9ckYe7reAssX6WKd7kSO
         l4EbWH0jVdZnh6HbUXxh9XETpkspkfQBnqE4oyyM6U4f6IRryBltjcCiIOsbgzWi1hZ9
         P0WrYVI9VDZxLHw+Leu5ZtMHYlbVq7xZQ4tZRcOt+R959yT1tA3ofBk6YAOshGQMM3Gy
         cYAA==
X-Forwarded-Encrypted: i=1; AJvYcCV0J07vTBrgQSGisJiiODYa8MN7rlFjg1wwmju1tud0r8I8Wg9Ra3+A4JsEwkxkFRHSLmdgv8rA3HA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEkHl0fyOPYrV8wZlnjmix5/imhuKbPpoi8OLiIAVc1l1terPJ
	FkYgurhEc2YVui0w59DaixJXAKOLlHDZjxpPPhD7kSoUoXVfY17F15f+T7k+2pdHBrFvkogzpuv
	WBixeRWsrp65eZLSFxYoQHK8KoR2f7MknQ9EHjODWmhlgKYskCtCHSEnr/OGKioc=
X-Gm-Gg: ASbGnctysJm1NuONZUp4woFN+x4zUEYjGjVYw21Sf4Vt/OtqgGX71WcIXv+aOQRRJOD
	k9t8OSTG85wCeaIAjVvDD5M8ZT3J8vAgfUqVFnABW6bMZHXTgtVU9xixw1EaFVv0meK3ugsuY1E
	SBSDkO6g6HUFRCU78FHIqV9fednF7WYvSLfM6uld2N1rYTbWARl12oci4Sovo+R8NvppcbHkNU1
	Yq6FYUIQKRYLT7sTGtCGwSAcYmDFTJPsLNVX0s3lY/1uBRKotqwru2OHWlNJcpfUusP4QXJJJQ1
	JUgLWwXNWk2ZF/TrTPQC0V7J5ViEK19TxKXcxxpZsbHBNFgMutjbZ/7EevlzKw2BnFQ=
X-Received: by 2002:a05:6a20:430c:b0:224:46a0:25ef with SMTP id adf61e73a8af0-2390c7f698cmr13397779637.16.1752860250370;
        Fri, 18 Jul 2025 10:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS+WhE3jQDC0YVjY/4E/XNzovaX5vUwzvI27UOQtAKYgfzXmsNsUeiIAZoMDUSIbvOYGM/sQ==
X-Received: by 2002:a05:6a20:430c:b0:224:46a0:25ef with SMTP id adf61e73a8af0-2390c7f698cmr13397740637.16.1752860249913;
        Fri, 18 Jul 2025 10:37:29 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2b48sm1581307b3a.19.2025.07.18.10.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:37:29 -0700 (PDT)
Message-ID: <2f5b5e6e-5041-453e-b3f7-b10b40bc6f57@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 23:07:23 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <aHjJG2nrJJZvqxSu@linaro.org>
 <40534488-24f6-4958-b032-d45a177dfd80@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <40534488-24f6-4958-b032-d45a177dfd80@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a865b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=tMiizUMu9hGndvLFPAJAbA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZEZnheZsc53CzuolOOIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: x9HxjBcZutJsL53aXaeSeMfr6PMyIAVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOSBTYWx0ZWRfX8sTkrrTzUot8
 gurDZ3tMNS0TFPxqVckJA+6S+46yK80skamMW/c8YNfOSlgIviJlsa1h2pqzSHau/EgK3Q4odVK
 +3W5jbiGvABeB649fiezUHdVFRYHlXra+uaddND5p5gV8gBhVQs6jXcj/xcCE4Ke/KpKTofitwk
 tGOhGXtrkianIViNvgB11Ven/tkwk30mXrRBTIjyGUOpyNZ7zyB8aBOEefxAsoBdYVp4uqGMlpi
 GrFOD+yFvxU/sva6lfZKkcktV6sEHEGWt9QhUuwRbUwP1jpX8RafpE6vVgkxUmWqN/m1ah7xM+1
 iGrEWGaZ6oK/hf94djTVRSD54zwi4kNaAcQk4JTxdWMcAwhWTyCUoUgje+2e2hq38sWp8kER3Xt
 FSmtjuXRPYATWs79EJu2vDDemyCoqqTxYYpdk5GgWP9zXpt+HhUuSvFrKwL5tPTfFmYAGHlF
X-Proofpoint-ORIG-GUID: x9HxjBcZutJsL53aXaeSeMfr6PMyIAVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180139



On 7/17/2025 3:38 PM, Krzysztof Kozlowski wrote:
> On 17/07/2025 11:57, Abel Vesa wrote:
>> On 25-07-16 20:50:17, Pankaj Patil wrote:
>>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>>
>>> Add support for Global clock controller for Glymur platform.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/Kconfig      |   10 +
>>>  drivers/clk/qcom/Makefile     |    1 +
>>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
>>>  3 files changed, 8634 insertions(+)
>>>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
>>>
>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>> index 051301007aa6..1d9e8c6aeaed 100644
>>> --- a/drivers/clk/qcom/Kconfig
>>> +++ b/drivers/clk/qcom/Kconfig
>>> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
>>>  	  Say Y if you want to support graphics controller devices and
>>>  	  functionality such as 3D graphics.
>>>  
>>> +config SC_GCC_GLYMUR
>>
>> Wait, are we going back to this now?
>>
>> X Elite had CLK_X1E80100_GCC, so maybe this should be CLK_GLYMUR_GCC
>> then.
> 
> 
> Yeah, the SC is meaningless here, unless you call it CLK_SC8480XP_GCC,
> so the authors need to decide on one naming. Not mixtures..
> 
> 
Glymur follows the "SC" naming convention, and historically we've
adhered to the format: "SC/SM/SDX/SA_<Clock Controller>_<Target Name or
Chipset>". This structure has helped maintain consistency and clarity
across platforms.

The case of X1E80100 appears to be an exception—likely influenced by its
unique naming convention at the time.

That said, I’d prefer to stay aligned with the established convention
used for earlier chipsets to preserve continuity. I’d appreciate hearing
your thoughts on this as well.

-- 
Thanks,
Taniya Das

