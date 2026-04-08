Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3102387589
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633187; cv=none; b=iQsASVVN5ibJK4MRbcPWxepVXCnR4R4mLQzxDK2OrWzdEkoPCF50ilgE7OTnYvXHc18SibEnIBXEd65juj6KvRuIe16vKx7oeMHNdVjUV7Jv+b8whm0L32OoYc2CsKUnAqbatgw6/xvLtjpNrKMLe27bv4NPb0fvoO7piVv8v4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633187; c=relaxed/simple;
	bh=Ln3oYyk9NJD1ehlAH14Q3n59O+lfb80eWJIy2aYwuFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uh/Wy58jHuffcjeQhu6sfFw3McsimCQ7sbnFhxxdVo45wRhZzFxhEQ73J763RCetDUNxKZwToT8qW9wqXYH1WFPfiE9I8womDIKiOSg9o5x6Q4sw3dX/ksTqJTbJygCvZlEGWczeuCk4N0xmPy4oTJng8Ywl7wsF+Ch8pznfXUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ao2psTjY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpMo7buP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ao2psTjY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpMo7buP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637NfXK71259200
	for <linux-clk@vger.kernel.org>; Wed, 8 Apr 2026 07:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2H3ndmymhmzrh7O0zHIVLNuQNg52ggIc09GsHqPIwgE=; b=ao2psTjYeuWNlIks
	B5Ha/DIf2FQdzBeLJtw1QsyMDquC/j2XyIYVbKXYIN7mh7YzY/zMCUHE3P8DfwW8
	2HKO31tRLLktwRrB3QMXuVigxSLZz2xGIiLiHUbLbHVyPSO+LufMCmTF6yVbf/FR
	Y2Z4cNxCZ0URB1s9Fb8fKC8GJ39wMPx6xyNi3L4YY3CDU3bpzhayeZq0jE4a6V0a
	fY7TIbaNxj1OSLpxLJZvgUjQSik99Lt7Q0NRagJDESD/pJ3NFRwGwdDo5SOPjKFe
	ML+jYsg4QS9kVVGllbGekzJfgPtOYgPCKcfh5kgLPIDUOYCvtQFbjbxOukpAeqNj
	iIweUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsbbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 07:26:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso10052789b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633184; x=1776237984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2H3ndmymhmzrh7O0zHIVLNuQNg52ggIc09GsHqPIwgE=;
        b=QpMo7buP2LpJPkUBfmhRhUDvImWxUy4q7AkyaJJbEoJhRsbYihqkxHzTi3ZsUKm2uW
         DUHqfocxSMXByxaZNfH0Ui5PLv0BcNf1N+/vXTbqu0JxL7Imm3xhJioqmZfXH/lt57w6
         DOMa0EGMMHlQ5+VJEd1tWJHZV8PQTAx9dgAkDjnOTPPzrxTAz5Z+WeNveWR14diDJjsT
         ZfhHYV37QyoWCDMdlYSL2y3IvUgMf2kLoLCn+mjPmG7lw1QYaEIXzs6WF02xjMa8qY8P
         TYUjesRBdwTg2+7hZk8GHEZ5m5QedvmgByI88NbVzIIqiImuLRoHKfECqElnwDg6WPc6
         qMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633184; x=1776237984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2H3ndmymhmzrh7O0zHIVLNuQNg52ggIc09GsHqPIwgE=;
        b=F1uxKt6lshXWomJ5PMJUFVN7g9GuovSAXPzJ37fKbq+yeaERkm+m9GcJaElGQVrrOc
         jw1+SENePTtxD2WY01e+IN8r5ie6aVRo4khHVAKC2wo05zvupr9e7o1lq+Vcev8toz7h
         ycKBQ69baq4wM0iBaN2s/VMwByzrpZZLYSQtoLmIyIA9i68Hz8/6pJq79mdKe6BifSPC
         y7HgwTXIuvI9z4Unjh+vc7MBRB9ecVUeSniufrkW1/fxAn+7g848SZ7YxPhfAres6wNg
         frdGL5+UzS5omAs0p18Nyenjqt6dbs59K+/E9ccX3AB/8Wjx2vA3ZamLCVTwc5FmN464
         gUIA==
X-Forwarded-Encrypted: i=1; AJvYcCVimt+KmAYLMkayFpp483Dq/bKk1fX7v7HHlyG6s2Agoz8JR8Z3oB99Oybdpyqv3EshoAecre/k38k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4NSHYGYU2FXI15/1sWNMu42BeA2MbIzvcLJE2Ska+btPM3lDV
	gaCL0dJ0dPzGr5zoMhbXn+6ex5B6ROVm5K8W3+ySarhDTtkVIfZbmJ523H164rNdhL3wvebwZ8t
	dzzcABmnCLt2O9Mdsi26itjw41yGk6XFvX+zDN4HcMdZmx6Hay641xhiBJnbVMcM=
X-Gm-Gg: AeBDieuuHt0TDHAABHq1xRa5h7kRHoecQ7zBIiMntXKM03CiJtMYyBkYafvooU3JIw+
	xXs+kMBUcttZ6D37Q1/qekL04gWA7r7gWPRnCS7+bAqG6YZg0I+uIJbqj+1URTtkE37LrtjiCw2
	lw2cjITjiq7rbHGHx+eV209qk+4lSH2qVwZOpjWwNegeRrB/WquDWKTbXHb8JEA5KHDu3TcXggu
	7ZJ+nTDOu+pzh88BGkDiNlHuO/F8l+BEtBFtzJtfKpeDSDB/93g0lfyTvctSW+sn1vA32UolJZh
	eOwxxd1ay1lR9IAG+v6qqZHstqTz641JmD0Aq9CzjzblGuT1WDlnL+eUmD1aKi8ZA7HNWLRCB0V
	WhMAyGc2slJuioYRKpVwUoJq9oYwL/vbbmh2Z+6BOiCcl1dfffg==
X-Received: by 2002:a05:6a00:800a:b0:82a:6d9d:3f85 with SMTP id d2e1a72fcca58-82d0dbbca07mr20585723b3a.48.1775633183760;
        Wed, 08 Apr 2026 00:26:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:800a:b0:82a:6d9d:3f85 with SMTP id d2e1a72fcca58-82d0dbbca07mr20585685b3a.48.1775633183348;
        Wed, 08 Apr 2026 00:26:23 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm24431255b3a.41.2026.04.08.00.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:26:23 -0700 (PDT)
Message-ID: <38aa8c0b-fb29-44c9-a346-363220264c7c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:56:15 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
 <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8wfH9rApazzPwCOMPHJmk9FdMUcsz0tO
X-Proofpoint-GUID: 8wfH9rApazzPwCOMPHJmk9FdMUcsz0tO
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d60320 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ej0lypjitWEjAblOXOAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NiBTYWx0ZWRfX2rQw65aDMW7l
 rOoNtwZp4fD3W+r1Eo7Bm8qU2l41uy/a0lzyP9hW00ZcvzzYdEl+uW9a4hx7+5hdJyu8mqQcK/o
 r2sIloNObFOCx5RHuGXtjbMsYTEYka/g3P0QtNT3FE2gVSKwM1DIQYxCpt2QHkMMlbDJsjOru/L
 8/LVmYisH9fnrP7SmOLfS3C1Aki2cTMUUAWG1kqUfu16Kfkxs3vOt6OmFETkD8o062Kj1ryLqRq
 pBpDmxtl4kSrzYrcexZ+fhfvOfiJeDyHENS3+lUsAQ+BdpLoxkDBvFmDVCRG/xRaxmdiFZ6jC45
 KtcfjGs4hhw5ibxVMcw8OUd4y6vyUev8tr5tIY+OVcq0V3d/WH9icREBLgs8W7z86MfEYdZKKID
 Ff5xRiKzDGSnA4na2QPeIRtFwJnGg2FKLXyaw8i7nyOub+4S6CZzE+VDSK1awUxBHYbLWEcksau
 zDfAJRbmVJ0TEkGX6Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080066



On 4/7/2026 4:28 PM, Konrad Dybcio wrote:
> On 4/7/26 11:30 AM, Taniya Das wrote:
>> When the clock controller is probed with 'use_rpm' enabled, the
>> runtime PM reference is currently released using pm_runtime_put(),
>> which may return before the runtime suspend has completed. This
>> can leave the power domain transition in progress while the probe
>> path continues or returns.
>>
>> Use pm_runtime_put_sync() instead to ensure the runtime PM “put”
>> completes synchronously during probe, guaranteeing the device is
>> fully runtime‑suspended before returning.
> 
> It's not immediately obvious why that's an issue, is there an
> observable problem when the transition doesn't complete in time?
> 
> Konrad


Calling pm_runtime_disable() immediately after pm_runtime_put() prevents
the runtime suspend from completing, leaving the clock controller active
and the HW rails in the ON state.


-- 
Thanks,
Taniya Das

