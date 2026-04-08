Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A5383C92
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633818; cv=none; b=rOWlO86MBD+9ietRRzPXNR7qbBuOmenOoJNqeSG6RJ2GxfzOl93LqnAPTjsbe0R+kEgKeffFalHulT28gsZfW2ZH4uxMGHLjAGPNhonAlC369QwdwVplQmtCYZTAB+WPXKdcxc9uhQdML41IRajII/nSSCgh8ZN7NT+mlk4o260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633818; c=relaxed/simple;
	bh=LTWCfOQIzMWLox9Xzjo7jJBOkH7s4/SrN1OB8aaKQQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ukgtm4alCz8QnztdM0u4z8RBCCnNNvI+nsDdYzrSyLsZne3taIZdXLMN6xPnGfaSlu59CMeiKBTL2MVuGT5lcO/CoWIQ7voQOKbnKL/0CQx9oeqUnb4tIvBJESzrpGyGj5bpWM/nSOuDptYTyM0gMcBUVUHMyPHnVp8Iwi+VYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0K3k3cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYi9kp5Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0K3k3cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYi9kp5Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6383RwRm2411845
	for <linux-clk@vger.kernel.org>; Wed, 8 Apr 2026 07:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=; b=P0K3k3cp7IqmZJQQ
	YQ7RGgCppWOOh2CBadHhcxzE8ak7D9xM6hpjmAei1mzpJwDU+2CFLxpy/Vaiz5Y8
	PvYq+UU9TGJcg+beHTmeNxHn4eZ+nncr/zsC0ee6T54A6FCWMAb2/mJ0aF55B3OW
	Op79Hj/HtYutQ5gCYBaDs/V+t4tKv+jWM+rEecgPW1URmcGCS7cWAkjiOHFLcUKn
	mCogtT9jE7FevmbibSNRuiymAZeI/IpBhwsMl58RTYNZJxx9zGFabxhIOCuaeyf0
	A+l8hPjUMJ8WzZTNfCgBiyAEBR866j2X9nYQBZdFlZr0fzxWoDQjOjWeZGtsToAE
	euOs9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vakrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 07:36:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242f76113so69139225ad.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633815; x=1776238615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=;
        b=PYi9kp5ZZw7HzlELf+KD2bCzlSfM+9fBQAl+HWuPhiY3de+NUl8ANqUUOxodblSSAr
         qCiKyBYltb+FmyfJWNib8neQU2bVg9shFf19bMgHGTU87g2u/ayU69+1b0xCfWrlNMWX
         5ZWNdMRnsfhUaT6N8ymEkz17EYUWOqRu7ObsL9Wmoq4FmfXIHmAThkwaGQVz6fVRUhQ8
         YZsNkWhe/WhiIh9PcdFooQY2kGCcFXe1dGVawsnjDrCYikxlzmldkvqQ6mW891dfU13M
         k5xnCCT+X3yVR9/7oxmT1BQq7LFvuJS6GbQK8agHeIPg/uxryQiTthXPOrpfrySagAaM
         P0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633815; x=1776238615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=;
        b=bfshSnOr5O3Sphc9Ez0abZGpOeuU5ZcEkgd+f/PeibA6nPQnEiC4c+0GhkgrA/oQ5t
         rBc/qDr6oJx/7c+ehauUiN/cii2q9Yu+WOedlO3a5f+3StATo1+NAWtVJhFJ4pH5+dDn
         SsD3IAW6rfk58v2Ri7nOcs0f81cDWWPzKc+/PhzJL2HqB+QMA/AI7kFuJ7wXqcj/5AL9
         XfeAd2BmfNG2+d6w2IbEeeb4mcbFZg8lJHsdyzD+SE7gNGOi2qP3/mvzDNfXtTkIasik
         iXamk6Gwt8jVDzrI9MHc5o+9xJxxDs+NW9rNHNCYRwpRm2Ot30ewxthg7bVKIZ3w4k8+
         iIUg==
X-Forwarded-Encrypted: i=1; AJvYcCVR5SjkWJeSlRiKwWZ5TgFVp9PH+QcLWfygsxNotIVhSNUl9z9kMTnSnml+3Pk5OwUJkuLp4FDpNd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8/D4GMZw20kfM+VtFY8BX4liTYwKT7FAll53QNk8bV6kHE6G
	RL0a97qBqH03hVpNFM4NH1CWH3fPnVPckvjakrRhdg/VgR199n0w7carSXdTTcTdJiQ2glqaJof
	oi0un5UtyAjsr+VbKPso87dO8rCL2Ht1CVbJ6J4JzBQU3C4qN/VSaA6M3/Oi30bc=
X-Gm-Gg: AeBDievk+tWsUq6WHL6mUOGvC8nTBklbNhgpISsVYorTwu0UfABiqY7lgwUJsz+Z31s
	z1HIr8clYkHUG1xlZhZpcfYCdFHDqIzC/8YhyNrei5RR2hwQ4IWzKgx4QCEXu9BrC3H56xbfGSt
	TYfQin9j4sz25GQ5a/z0I51lOZsu6SOeEGcTfFql3AcE76WY1txS+faqxKir80tJlCihYqLXNQL
	9/7XRPVdHmMz4nM1mbw4QibDWnr1+9ETcxaFTD2IVyMYEPv5Lj+dzcQ7KC1aUpVYSBrjpVd55pf
	zefTJevK2AyJp4P3QcIbwxtylYuvSWUiRwse02E8YsLRD6aToobb/zT6aHvRoX0TAz4/EDg7mQ3
	8obetDx+uQfJy9iTnn/2joIOiwavtmZnSoJSuXL3msX/e0EBgAw==
X-Received: by 2002:a17:903:22c7:b0:2b2:4260:109 with SMTP id d9443c01a7336-2b2818b011emr206708535ad.23.1775633814987;
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
X-Received: by 2002:a17:903:22c7:b0:2b2:4260:109 with SMTP id d9443c01a7336-2b2818b011emr206708055ad.23.1775633814473;
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2adc8c4ecsm46328265ad.5.2026.04.08.00.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
Message-ID: <3dcd713f-dce6-401b-8c1b-194313ec5e05@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 13:06:48 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom: Add video clock controller
 on Eliza SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
 <4c4e80be-4aeb-4275-977f-b3f8c6ab26b0@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4c4e80be-4aeb-4275-977f-b3f8c6ab26b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2OCBTYWx0ZWRfX7o1h0BsFf9H2
 1XlIDpfvHwm+37LYJ5riWUYlm2sGwanJSTjuJzrnabG4PCYOcWbhx2OMvza0k6iEYqvZm7Ulu6Z
 EW5bfCOMK/kkv7h0x+Xj8iW3kZpvVVL0wMaXLnE+Bs/4d/o7vGk744uUETfbAKaIUKHJTH4FhdX
 czd2x5Fbj+udJpjxlbEEB/k4Rmq9P3+R8Py3PnWGYaSaApAuD1GzvlZf4y+0NhT49PcMAfwG1Qc
 euyplFHy+IbGJqX38XUy6FMu6JXmPBkR0L+ozddWkVXK0F8yQVDV05/BMvFzz/g4TSN7WHcbN0l
 hULgnBHcxpvZTz43cLsRWa5FSh0d2w717v+bbk1SPnRv9wsM27yh/10lCcZibsL4f2XWLx7eQ3N
 O51pPm7vSfRUg/3yIrSrnAIwZjLEWfNApOnBC4auSvN8QohFMDFCFsBUcc490kn70HGz6aVdeZU
 Qkx5RXbSvufuVBU+MFQ==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d60597 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=f9sTazImdp3HmuBAhI8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: egT2xeCzyHkLrknaYBFTOu6kG21G2FDO
X-Proofpoint-GUID: egT2xeCzyHkLrknaYBFTOu6kG21G2FDO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080068



On 4/7/2026 7:10 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Add compatible string for Eliza video clock controller and the bindings
>> for Eliza Qualcomm SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml        | 16 ++++++++++
>>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>>  2 files changed, 53 insertions(+)
>>
> 
> Although I already suggested that this was not tested (and you never
> replied where did you test it), but I also checked and this fails checks
> - constraints are mismatched now.

I will update the bindings for videocc.

-- 
Thanks,
Taniya Das

