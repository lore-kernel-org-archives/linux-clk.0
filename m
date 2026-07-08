Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085043F4B5
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509543; cv=none; b=C8vfQhcI/ttkjZtLxfq3vXmELrpHnuM16NOnZfJRfujqS9anzFHjaQ9MqCoHZEp+oJiAys1mRCKXTnVQ5fpDZ7UKHFl9UOtqVT1ZQRKr9h+IRbiSuA4GKUTKSB71O4TyMYn8GfIf1YEbMMMFYCLq9X2B7jZvOU6CFGE1h+lyLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509543; c=relaxed/simple;
	bh=/Vk+NQ46cUjFH2FZV8DlE41cVIvUvSkk9Lp8tzGqWRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGZryoXeljdsOC36BCa2iLc1ypfDrpbAZYCdE4e111AOfYyGy9nXyqQ9JHrctljiksK55cefAFCv9pUfreAfNrGnUUY9uRhIHlb23sqghkBo42mRz1pO1o1GHd3pW235Hwyjox+HOb2zXL1ac4XJO5p+bHjNYszqzCUbqfBDbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1sn3FI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuiDGpuk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1sn3FI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuiDGpuk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Rsd2197377
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 11:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=; b=E1sn3FI2OQRb9Bnw
	/EJv8BM+WdswdvEwKwNBDEdq0+OvrLMBWe/nY67iCorvAt+3EFnpKOCw6e0e4z6O
	iLbcbRkWiMd+SMnllFZf89iCSGy28t0uRHrdH8L0ze1kUFlWkle2761Ztxf0GU0w
	ZrS4lTHCyZ1e+O3I9LbieDZsvDWnqPavD5ohEuYSegGSrtaGykyuKWlvHlJ1XT1m
	VVFCJzq+El8rRLgpzJE60kE4jf2HkghYtOXVWKopIJsbyZVSk5aVzor/AbeUwtCc
	LLzy02YUqJA16K8gYCgM8daWai9j16i8BQlzmo/6MD6TZ0IhsDUW0AAC9ci+D7/O
	9HySkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6aaah9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 11:19:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce02cb769so8287055ad.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509540; x=1784114340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=;
        b=fuiDGpuk609YlfU2CwUUG0YzM0p45AyQEJz8mLdCQUIrG7F46UO9ZykTv1doGuSKk7
         1MpZ3L0hKSQhaa+m9qLcs8BRHpgDXS3pGGejg0JW6CWGmOHrKuT61lQJF1kyRwd/HS2G
         VCDOOnbs033XrfuDpA3OIBeRdEL+6y9HpxQ3+RzoAYVruTmxHnSfA6WMcLl8QecGZRHo
         Tvfvten631W80H2klmjCTWUU5WxLbzqp40PqA2Vq0qby4ShRGO4ShsVcRDRywL5h3xZ+
         IELbog1nJIc6WYN0fCNE0DskLeP3hgTL/YruQuGVITTGUv1VVHo4JC9FHRExbqggSsMW
         Ng/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509540; x=1784114340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=;
        b=UG3MwOwbSkrcxX/5dd/YsnSuhyPtaBczhTXlR5JPEfKSDi08sHjoyel/J8OoIl6EOR
         ItnXIcUfJ3XYs5IcPJqephV8laXY77riRlpuXPu4X4E/YLpFNXGES9hBywYSzNSaV2At
         Xe1HdDiXugLEDLabbycJBq7o7BM52IUpwtN27Ql5u26qdSM0Xg6LP3D3dCReWsHljmJg
         6xPTVg/u5f/l4k1sfr35CpmOjsWnCpyw5O3/KHpIK/kB1wbPoSA1mbXToKyyI0eFNt5G
         epe6+Vr7QxA2eCn/kEugzNQhxOYgZh4rbP1yl2H5sepap3BdX7sVW3q8FJZm/sesAio6
         HgTQ==
X-Forwarded-Encrypted: i=1; AHgh+RonUtcUtE6rraNlShVkVIaFm5pi5wxCh/k5xw1rgj143t51+FAfAkLCjvuPfb51S3SRI9fvNMuFLxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx30RJnv8sj1H+YWLQYNgxWRupbWNkJ7sd7UAIiV2/65jC/dyEG
	d67BYlnZKdLZ661zxWwlUVNqJknwAxnl8d4Nmn4vvwS6tsS6MmrSFJ0bSH73hTW7Oc3swMNOoCh
	+LL+gKUP+M5Z3GxyR13GB6LKe9R/DUPjiwlvGWUqbKEVGlkFfMlp/bhW0O3aoz40bYlbaI58=
X-Gm-Gg: AfdE7cnLtON7+Gs/kC7eUfHmK3MIJXyiee4toskISLGA7Qun2Qov3sGdcIYThOT7GXt
	4DB4UQQgCr+uFo1iG/Rcs+037a0R734kJMsN1oY82PEfBSInu1TBvnCToVDo/bbWt4zCgkV2KBG
	dfOhkE6Ki+4KfwBkPjFDRbn9gZQWoRGfXCLWo/Wc793KUncYF2L0R1bnkE2NcBDHb6I60Q+4Os8
	Hr9LIJp201lyLj56CFcQjnvvM1xS64sQkhSa0TDma0F7+pu/cKxmpAuAmHV3VQY1xlmOt//MX0M
	nv4Lrh1geW5+xapCoOhJ9kszqJCGAG6aBxuU/oEk/t9mTzpHt01mJNYm3SjUG7tj1wkasfJKwOe
	8BtqzMyAY0s06WZ4UJwfqw/sjCgXJJXBtM4aylzg=
X-Received: by 2002:a17:902:ebcd:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cced5724e1mr17400755ad.32.1783509539794;
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
X-Received: by 2002:a17:902:ebcd:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cced5724e1mr17400115ad.32.1783509539361;
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccf797ebc4sm318125ad.83.2026.07.08.04.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
Message-ID: <a99edc48-d429-4523-a446-5908ce24b307@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:48:52 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
 <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX8HEzk5h3Xf77
 MdNjd3S5ljy73LC4gwILx9ihYvyX+VzW686ZN65w+zYEmEJLWWIOYLUFhFj7YdGBcetRu4h0HF5
 vNHgXBe8YzMn1trrlzTXbYnJuvGfxvG7eovjidhxSIp4sjVR7aLdQsHhPKmFtpb2giIK5J6y4Ih
 x7WfmMvUCOUeXhfqBxDohbd9h2zC8w3Pkku5zdDz73CUqaNKGyGZn3h7U8jpsV4wSCZHTFZhGiu
 5S09lRYBWE/4Oc1J2PD823ZkPysRY5ug0EVhoKGokhs+tB/EE6FU4fGZ7wEkGG+8C6tGio+hbYb
 earofBN82cvMYbGl5eehSqQ2NMcAsx7K4z0cmxjE9Lbu8oOfiuJXZLuaKAYxttu9ts4wj7G1wxX
 3FjexZ4VWHTxmr45cG6SI8q+GRjTu5n5MdYlWcm6rXfzpipQd0Yx1nr4gltu7J9GBLWey2RWxxR
 p6RKJ2nPZMw6jQT1+Sg==
X-Proofpoint-ORIG-GUID: qnkqZ_Upw7eCw6Q-ux5IcH1Ze8p3nZtK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX0O/9mvET7Jvu
 q3zCs0xrTL4WAzdybS8tP65xTG/mqh0WFAKr5XAeBgZ1T/qZmJQMOKqctewFQ0wFLlW+3h00Hdc
 Y/3vHJj5l/BXX/4bqppcpic0u5MGGNM=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e3224 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=dgSI8aGl1U6gYZos47QA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: qnkqZ_Upw7eCw6Q-ux5IcH1Ze8p3nZtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080110



On 03-07-2026 12:45 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Update the QCM2290 DISPCC driver to use the DT index based parent clock
>> lookup to align with the latest convention. While updating the parent data,
>> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
>> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
>> frequency tables, but should be corrected to match the hardware clock plan.
> 
> That change is invalid according to the agatti clock docs -
> DISP_CC_MDSS_MDP_CLK_SRC RCG leg 4 takes GPLL0_OUT_MAIN as
> an input
> 

The HW clock plan naming convention is slightly misleading. Though the 
DISPCC HW clock plan specifies the GPLL0_OUT_MAIN, it is actually 
sourced from external gcc_disp_gpll0_div_clk_src(300MHz) clock.

The above mapping is correctly handled for the mdss_ahb_clk_src already. 
But it is incorrect for the mdss_mdp_clk_src, hence fixing it now.

I will split this fix to a separate patch as Dmitry suggested in the 
other thread.

Thanks,
Imran

