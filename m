Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43F37472D
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 17:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756703; cv=none; b=Qvh+5HqUbDaTa8zzyOgZPSewHBQRn2+q0m9SBy9Tq90zuVFImtAK3Dl0sQcpWuGgnlAWQLazrtjyi8+DbjcnyuGdUfvnqwB+wBGcbzCMfbXByIRLGbW+gMjaldzUfx9RLq9rsAdNDzeOxK7JdruWKjz0AMKe+Yytl3NcTLC48QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756703; c=relaxed/simple;
	bh=u3gUqEFCqBFp1uYEWel+zQoXaVkE3Zg5KLkQo7FbJe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryf4KETRcotr7DXx6XdB5PHz21cPkLa6SAD08VG82bimygUgEuAtxfXmaUIYi24RQc45+4/wNGhbxi/2ZhZT/VSWMrkmgAxsmNhLUQ1kJSqbEu9v53ccEHypRgtNvEzhA8wH/VIg9NrdbaNsYetgybgdEpSyUU2lA0CfgQE+dgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osiu1T1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdCN/GmA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osiu1T1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdCN/GmA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Cerkn2866311
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 17:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=; b=osiu1T1so6UWTxBQ
	LaeNqQnw46yuogd9E4IY+PxqdIU2I/S/1Mhaki/D1WjyoKpVNJsbKCNQZILLj0cn
	amw1h43ICKhDkuivV1jLCYuPp99BNR2T8h8VIyOOvu/Z0X2ONrNgFK6+KP3P7y+M
	8DDvaCfGeCvv5QR7tdmybH7G5CuOWgEFlvbEdPp6Z/27n79FjCTLRSFa+uyxyrm0
	I2QuwUvodW4Imnw1ZiAaF0Tx2f/1PMCtxG/KSKnls3hwv31yqv6jFbDzIOtOfAEt
	aiNgcIAZP3vOjjMNixupCT224BWqIAbMJOCCRlBhEHzxulI4Kpj0x+e2Uo20jBlj
	3J7LCg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayh79y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 17:45:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2489af602so10796895ad.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775756700; x=1776361500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=;
        b=NdCN/GmAc7j/f3CysIJBUlgB4HoxDkgMs5HssDI/qqcmDJn1p807jCg9L0ujc7q5R/
         7J9ZF6m7nwdke3ZVfGwU5aGia6YpgPi/LeimVfIn3h81r7Tv4H5e1rdLraMHEQgUAxl0
         1f+gFhBI7XSOwvcPvjG3U0yWncw8YBr9Is/5eFUIftwOISCnhjXbfoHrualyQFiiKf62
         r4Hv03pSyDVihI5h+CdNMYnXkVliKQHEFRkQgWXxAXkvRelImRfW6EBntqbzvMn6bGLE
         aRh5rIxalO2wttwWRXwTOd25UW/NpgENtclDWofjq7PCDFbM2hD+LbP7CkhmHYfd8DRC
         Yudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756700; x=1776361500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=;
        b=e2TNpzodxNTWQDJGjQuPijYfxhInI7g5EcdpxpP5b7Qq/K1JI8m+qT4v3Nj81JQgt7
         l02r8WEqvGz0/lQjSfoadkiX5WVfPYH19zdfp6fJwucUT3SMydkbiKkHIvdqmuj4lRbr
         4YNATMZiQExovy7KVS2bMPu2UOuy0Fatekg98MDekM1xwOBEJS0w33bPlqW9993H8Zfn
         PLEVBjXAFHPcPqMNzhmWvzJmAaTNDiBbgUKErZt9FFq8oxNxr936b1KL27IFlgGNnirj
         7my6IdTlioclnT1BDgGcbelC0N8YtZ1ib4Ys7OecQONS6GQBbOs/CskZg4ov3zJ60p8i
         uiXA==
X-Forwarded-Encrypted: i=1; AJvYcCWsG0VdgSGpu8nuKAijiDATHDo+l+x7HeUiqzzd3Eaz3HKM95NPLQhNw3zDxYlPIKso6joUiGArCHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyhwbPwvEqHaRQTon6k6oDiC2chPq69/bxXa3Qm1N9ephZvTdR
	QBYCtXncRO5kxmDb4t5TneD8EW5+qc4lvR7MH7WJ6LkpNcnTUkD037HWopUWeZpnLsqCWy0uL53
	2NUpYmZQ2oAi897wenScj1yRguYfMVVQTEo1sjABKBP+U92cvSPDU3Zp3499QSts=
X-Gm-Gg: AeBDievFR8Ai/O2zM1pw9p4IiHjV3UEC2+WAB3Dz2NwtS9Qcem8ozAKoU37/REXwdoC
	A/X9IF4dtn88hWcobyv5V4yS8WQrLrXRG+i0FxpBkPv+hodvQSZ4b4u3rIxI3NQxzyx8/1/ll0p
	UJWmtDV08QF1a004v0r+/NWNnvUL/3mMP40fHmlCHtyrHfhgn/bVW0iYDIzD1xL6u4VBd2bXtGf
	eRqaVx5qyxgabR3h/NN6aPu/s7gTQbiVXi0dxvlzaptFOrTUcvD+/VDWO71sVCWcmwK5ymbsMyF
	h+wWc1PG1n0fKFXnqs2g1wiO9W79BO7QdAR+GjWW+Te1aCTtpBt7DeKIqXZlJUZuj+ryZ8zFSJq
	2ZDqut/zClwLRQvNJNBVLmG+2dm7GhLOVFL7h/33LGZNtlJJUOw==
X-Received: by 2002:a17:902:ffd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b2c73474b0mr38712725ad.16.1775756700537;
        Thu, 09 Apr 2026 10:45:00 -0700 (PDT)
X-Received: by 2002:a17:902:ffd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b2c73474b0mr38712455ad.16.1775756699932;
        Thu, 09 Apr 2026 10:44:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2ec20sm1392665ad.66.2026.04.09.10.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 10:44:59 -0700 (PDT)
Message-ID: <1b17af8a-91c8-4ea4-ac8a-d8e24951a9b5@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 23:14:51 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver for
 Eliza
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Akhil P Oommen <akhilpo@qti.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
 <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d7e59d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=oNSZD+MgFY+5WZUJqYhveg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=CmEREM0NDXUXjFKD81IA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2MiBTYWx0ZWRfX3OoSXLI/kE86
 OAw+/suH+LoNkS0/Uq3zbvN6XQMkAZMfBywF5gYNRr3y0vJacsMqGkThb7TkUyBzvwOI9Ped9xG
 +qIo60KwyjHqwPK99EIi6YPDs+bSuZ3SrQKdO9rx786fVRLN4Sa+Da1fy3Vv/pJopljW1/X/YUC
 eQDGjzG5tzkLdFfcat2Ac7bqnDY4WvE3TgnLJaTATfK3nASQ/nr2ldxtOJe7F6BclpXBjX3jF2S
 7WfutVC4+dcQ4amui3wTwCDrXHFAJ5fqKxYQKIOGYusjJVNCoQVqb+s81NCMBnCKb6NGf3DfSfs
 CPwdjL7RavDvpHQhDACLqoMLN4QebCzY6t2RJHPQujKyBWKYUDiGQzO+z4+ziYLYvsHN4wd0aGG
 +wQQ6CVqbvMRtVo5xGZODEs+nfwmAQvIBypBa9oBqmh+O8EwcA9Eznvuz6DMMe8CCkkJNyKyOyJ
 R1ZBRk+srwREFXwbLPA==
X-Proofpoint-GUID: lOmIzVr2nlBBx4WqFGInd-IVR3CaARVN
X-Proofpoint-ORIG-GUID: lOmIzVr2nlBBx4WqFGInd-IVR3CaARVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090162



On 3/19/2026 6:25 PM, Konrad Dybcio wrote:
>> +//	[GPU_CC_FREQUENCY_LIMITER_IRQ_CLEAR] = { 0x9538 },
> dead code
> 
> +Akhil is that useful?
> 
> [...]

I will remove the code in the next patch. It is not required.

> 
>> +static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/* Enable frequency limiter irq */
>> +	regmap_clear_bits(regmap, 0x9534, BIT(0));
>> +}
> ..sounds like it

I missed to clean it up.

-- 
Thanks,
Taniya Das

