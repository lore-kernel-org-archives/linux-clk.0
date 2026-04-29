Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7906212CDBE
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434343; cv=none; b=icbGxIjJKe2+5+1ui6qi/2PyEOWqNpmkLCp98UJgjktbTOpOOGFzu2SQyWUtzpUBeJwhzjUT36RsgUsb7zmvDISjesUvYLMqgVmWqD+KqwuYtSheWNLWwyEUllpNQACnlx2fmIE8nA6IjKWv74WVOa9KNfQaRWuV48N4wyiok78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434343; c=relaxed/simple;
	bh=wbTQJeDm0ersU6wMu6P47zsx+mFfkeoRq8XwtWhXcNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0SMiM6eJkKkGMllHErYZ6n6GbhK6AMxG5QqBt3e8AmeoJmjIQWFVFWjUlM19hOvXcxLbx1TTTrYFNLxBXSNkEipNVwHdQb7isEsLPPqtm2kSdFP6UV+lOtr7Ns3GGMhpPWMW9n6T7rqS6BvBSjRxsmroV/zpmnjLrUKVO6Sofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxD+YDod; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8DquPV+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxD+YDod";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8DquPV+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T0o2EB2007701
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=; b=JxD+YDodv9t/5pZw
	deuztASi8PevLk+eqPKsItdDx7So2bzcKvkOElD2Zu/hBG0OZmDF5prFkpOMHCGw
	pPTyiQztylcvqEJkLIlQbo8ooEcOy1e/QFsCxOg9ThmDicZdmBy3bOPrHgUTlR2B
	apbF0SgLKqX4f3Ggmbapt2o2Mh1bCHSG2LGnY4+d0mxW5aUQkE6Rla/gLSGIdSTc
	z8hU1VLDzbbxVjKTBS+uK2mP0pwR60Ds5V8txoWP5bhHQmBkl8i85TisWAwxnc/+
	9TqzVY0wiY3jqEmtvWhrdAvPAc1yDS5f8zZeo3hKGayjIV6tOcnPW792zdG/0gcX
	4iukog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx8fur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:45:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so236042945ad.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 20:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777434340; x=1778039140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=;
        b=g8DquPV+1WuN6ajJt8hdV0KWVfEXnNeHU5AvDZzzr+RR0cl7/Iop9MNnH30l+ZpvbF
         sy+whxkhZ3BABwrjc0TUNC4cyv8Q9D+EKLnqetsbiiD5LVCGv4q/hI8Q1/Pl3CEXeMHL
         T/jZbFsWiQiuBmexe1yOpY2mLmN28n0zjIvO09XL8T08AB2zgF8w7mMdSEIOYIzGATDo
         5Q+cviURhRqGfXnAQ3yJmR07evIkZLg+Y5H8Y8w6xU2W4v9gTyS0xoruWWLXn+RviUEv
         EBLkn76kGMpi//S209NQjzzZ2bwrxWxhosbmsoBRusYMOnu+a/6UFfGDv6e1BMyTnr0+
         g88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434340; x=1778039140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=;
        b=JAvSP4jyCRp8fay3OsQj+vbk6iPaeg3eejbRM3zTMh6TzdwzvFJRWCoIw3C+nXUung
         fO7WR2IM0d4ai88DY8/xLPTdooSNyFzCbQyGYciSkv6lc5vIqSbqMXS3bLpDYMYJap0y
         vlB/SbEmUGAaVA2kan4zvmEAk8Qu/3xsJWuEJkPg/d+zRZZ5DmYdskh6KhOb9pzZF6zN
         KTOjuydHatZr2j4aDVlYeiAMyz0hT5DkQcEk2/EBA5iz2WmkTmhg+3mm6y7HzPPxX4ZX
         KYngTjQFsgHTdSOXdvuqTHNgh4GhK0WmVrDpsp4BfUgthCdqybQ5ygcj9ziaJp4wSjkk
         tB6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Vp8haIdRIYd2h7RAWu1xIixrgaW1QPZe/M3n31Y1+Y79KDckFGP7uuJw6vEPoRtZYd4FFAgNGccc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCTV5nsSSASqcB1CCaJsUtqq0smFDxFNMAd1Ez7G+RT2zE21y
	0PH51RQ/jTbHbPhDILtYKq928roMl85+e5vMwWlSdFoXHfLmqhjItPWj8cPDkl/KYBQDDb7Ltr1
	SuHEWJMTfD69KVzM9RT4evHAhfoBea419ljZSZnnRY+jSmDxaKjyX6ds10EyAhBg=
X-Gm-Gg: AeBDievZM0p93p2369yS4jvHBUBvbBERJka4cgSuzKaa7QQNN1z553fLnnBYbGkpYYk
	jaUan0X+tbeEevRMFtfRf0re1POw7waQZxuQ880JyN+U368V50N6EjvOP4QB22oOgVtLPsvqzHU
	jtBqgZeaM8Hir48qHxkEVcYIOO62imqPHEtB8fxwYRYzEHdiilCJE2HydOTPBn0Qtbv6SFWPsk+
	rvhAlPT9dfKgggtnnnmtffitZXSTRbJKdiuNBmws5w+SqRrpcq85wr63iQaS6bjSRtujcQE5KTZ
	9dyzp81zt2qihgsv8M3SeAC61fzu4LL1V1nhrcMJ04bCRPJSGPSFrFlBlwbeXfFltri+kKc/Orh
	9FJbtBwWK1Bi8DVPMUBy0tIsHeuUBZQ7STWuZFDCCzkjRVdwqdUu1qxHDRc2ocAt8
X-Received: by 2002:a17:903:1b67:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b987359abamr20791295ad.2.1777434340388;
        Tue, 28 Apr 2026 20:45:40 -0700 (PDT)
X-Received: by 2002:a17:903:1b67:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b987359abamr20791055ad.2.1777434339943;
        Tue, 28 Apr 2026 20:45:39 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887734d6sm7084525ad.1.2026.04.28.20.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:45:39 -0700 (PDT)
Message-ID: <3217c494-aa6b-4060-9487-2d5b57c2db18@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:15:33 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: glymur: Add camera clock controller
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-3-e8da05a21da7@oss.qualcomm.com>
 <6eeb24a9-e2ee-4727-af25-5dfbb95bad59@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <6eeb24a9-e2ee-4727-af25-5dfbb95bad59@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dai_BpmY_oeJbFk2bKuTKez8RiBVu9WQ
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f17ee5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VcKEMVW0aYsEEJBu7dsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzMiBTYWx0ZWRfX070aQZeBYtwE
 hnA1Ug2sx5GmCaOvOEVdl3Qm0fH3HvV6D/Z8+mXyPVvAIyie4kx5e241epaf3eBRjAD5Zebh2x6
 bkVjueRWrFh0UbMy2id/M7oc44FqP8OWaf964Ox0CEqaFVxJjkMyq0g7TsFqw7kWsh92fmiRcj5
 dC8Tn2zY02mIxJe0J++1A89l7nPT6crSBztHMxFnBwUN6ea0YzuF6JBxKnpgXb8ghV1PKMGO6hR
 LMEDE9FG8XOHMkV9BqB21YrxjCcf0vSQxpPViaeCzBic06R3uiyMAeeVuhT4Y7+JopXTcKGDolm
 zOCU3YktyhMV3jUlhoyYUFSfUUGYVDKRaAlTiQXZEbm76HnEKliCbhvgk07cvBzdDDLE9n3ZiUW
 iskBYB8mRyEQMJRbWCZVOS/l34ujRIO6B0xosq/TCIYZE/PZMiKqU9zaT6tqjEGSuGe5dS+kyjO
 +8dTlk4LpMoHUb10t/w==
X-Proofpoint-ORIG-GUID: dai_BpmY_oeJbFk2bKuTKez8RiBVu9WQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290032



On 4/2/2026 11:48 PM, Krzysztof Kozlowski wrote:
> On 02/04/2026 08:15, Jagadeesh Kona wrote:
>> Add support for camera clock controller for camera clients to
>> be able to request for camera clocks on Glymur SoC's.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c32f0b84db2f38ec567485e36e8e50529e886775 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,glymur-camcc";
>> +			reg = <0 0x0ade0000 0 0x20000>;
> 
> Please use hex, also for '0'.
> 

Yes, will fix this in v2.

Thanks,
Jagadeesh



