Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9D30CD92
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688271; cv=none; b=PXQNXI2U2ZbScXen172L6hUYgzx7p+nGGptlHMKYQNkZDR7Qj3bC9urlduw+8Gu1ECRI0bpBUV/tdYXX5ACX0JcEpjqQc1YDCbNqJVrTK1wZODFi24fjFM6Niz9zGqTCqEgq7i2Gkr40hrsbA9JaFGvGVrsDn5S+VVMdbQP/rPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688271; c=relaxed/simple;
	bh=vl/IvMjHQaPAG9h0CsmqVgUy8/dTJ2JHEUpBkVfgozE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rkcx6gzoDsTb2j8oQFN29F08aT/R/EceufuNYObH23VDYNliobdjP52ukRwnpsMZKW3iJ4oCzuMkCbk1hnhbi057q1BkGiV/fGnz1NNy0ORIaBsMlZ10Oejvnju8/aqzWrfP5yco9ZjIubuQ6xQZE5maDZN/zo82jxEGXLShKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuUsyAIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YabP8PU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuUsyAIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YabP8PU+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OFQmsh870384
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 05:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=; b=WuUsyAIWUlyQijQk
	8xCNHknZt3TjwD55WSqnMX1np2l7sh+fHzt4zgIlDmxQK/fvVpOohPz6ojnzDERH
	sz8+MASuZZKwlTLiRJA1ApN2ht+aWkRUV+upRwABFYLkVFk7C/odOhX9kcxdolxO
	8TSxJHA9vAPr4qDpG5uY/kViS06gf3AcUro/OJi+zEya2nHJv1uYgO8d367JKa56
	zKKxL/2hSLus/0luPi9VUs8kLLFJ+kFIoYw9euFE+LTEj7acavFD5Y35BGbNdevE
	q3AxveC5rtonLlNfU+gq/rYoxXABihQSoxjrWoKk6ajyvjvz9fV+Itq8hlsbfCzw
	wSX1/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w4kt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 05:51:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso101568825ad.2
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 22:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779688269; x=1780293069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=;
        b=YabP8PU+vQmGuLw843AvYJRsknPKbPtbTDz8MdiatTfLU7jD7MvbGrnk/w2nk9tK0g
         8h/GbDfk0cYHRmqrI6iPOHc5TjWSsK+3WbdiVNPzeqZQdEEefoZWr2pkixR1ISgH6wFP
         8bDcGOHDj5Zxh2URrUf9W2qe+Tpmg0nXLb9R9NSURzfWvXSOe6KaWSwjrud1F4SQI+O2
         DSoSzKL58C/9TzgIVYc/11KZAWQr3tLNQuAkn9hdtAbndh8gtTuJFrHTx4hhtuOgqqbd
         KCUJyB+GWV7eidIzohPHhUhtarkcxdoGqIwCeFgCb+2wpKMzbpWivLj0F+sro2dRc9Aw
         o4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779688269; x=1780293069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=;
        b=YLRPrrMitk51P5NHnA6+aG0sTvPDwdSXbGsnA3OopVrade2AAviygJb4de75DMTZUe
         ZKuqNK6aF/hzgaRXR0mGXJLMomBJEDPbMaSw/97MkRqdkDSSriIasbfE9Lme1KqGHNcq
         P+exNGw6VGYDMWXtVftKeWaI6VC+7uwBmXdc6vJWWIF7TCJYEbkewH+vAPm0mF/arId6
         5dB9J8IqUJRyea7LY9if9FX6eDtbSfhowtqkEjcfT+k5spSwWKeoxwkQueb5eJQqNKEc
         vGq1G6OFrkUIdNb/x+TSptitcfqgkaSjsO0h2aBUp2cvSrGpEuYhu0tz/kS+DrtkDuEL
         Cerw==
X-Forwarded-Encrypted: i=1; AFNElJ8knKN6VUSHe2gcQFLuCXEDtJsimstGuXTEhP7SpEXe4CoRobH0CaUjF+hW2Z+Ad9ihnTsgOp85LLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/5jeUQ/MCorNwST62zdhC5dFepE8lFuQHwZes2kAYRRdv712
	cdRTzsd+D4jfk92ZOp8B6dcVk3YsG6OshnldC6sH/fjloWfRV3+g0amy/oNU4uqZ9hqgyEMZt6M
	oR3kWot7Bg/zUeWiyCiGpF3GI5TY/QLMu2odn0BXqvAyqramUpiZowzrIzQuUzR4=
X-Gm-Gg: Acq92OGCuM4CfevoY07HWnBk8UxpeH3vMfHzjbKuCmzbLIlvwUVu6Iqg3EapvuxU4Pf
	F7VQ47oc8DY0bsFjTaSLTiH7Ay2kFHkC2aI6M1urCH/78wsnfMcK0fKxnEPWnimttUVGvYXonZv
	RM+UrX1iLNeWkqFuQGkdSU7fHkWoEZXkFS1sIHQ5nWKROp0JWQ2tASgWRT+CBbEcz27qqHaf8cf
	bZpoptP4VN2etzq7SbEX0UVlIG3SgjShzpSGlt8L3PRZnRdCS2uWTa5KxWA7FC1uEQQVQMn/H6E
	eEvA+/+XQWXDXaBvT4jrR3Grs7fJMgbQMjjX+mGAoLppPdVWajsT+jbq80htDNF6AWu7O81UEbS
	xSkwJujnxh+ymxXP6XgnvnlznSSOsuKxOPVDweBDvScjjHJ/2
X-Received: by 2002:a17:903:350d:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2beb05d2054mr152233505ad.12.1779688268663;
        Sun, 24 May 2026 22:51:08 -0700 (PDT)
X-Received: by 2002:a17:903:350d:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2beb05d2054mr152233085ad.12.1779688268163;
        Sun, 24 May 2026 22:51:08 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dba7bsm80743675ad.66.2026.05.24.22.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 22:51:07 -0700 (PDT)
Message-ID: <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:21:00 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a13e34d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4fXVvXKQPWswVA94wWgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1NSBTYWx0ZWRfX9Tgh/Nn9sfQK
 PlaqVPn5kumvR8fDm1S8epj35PdFPlELPIG+vIyo2mrfPl2xHL2FvfluT9m4/f8t9Htuyx+NU9S
 PoakhSnEGtVLQE6u6brwPttNndokcMbk8+NRX8+3iZGY4G4W+0SesekHLvLlbss0JzCJY6rGKae
 5i3gyXrtuMud/4HOuD6LqsNn+LlCeB1wetdYd8tG+EVBtv+B1v6qADNKZjrGt846Bul5zKvZMyw
 ddBVr1YHV7QMGuOX0RU07QYnX4Fspn/GHrpiRsMXfHKT/bY8pWOFSpaWhfGsQbdxyrGvBTfWCS3
 fEbxCcyguJO0Obz8ftThZTWLDnAhNh2eWSwqCy5aHgGIpYlljESfZsune7jTE0wBfqyj0SCZQBy
 dqHtM7IPHpNyJLTmABMcNAqCGCXyeTmVKeXWdDjto6lrTT0guUT/2y1JTdq0RwOWM4QasHI841M
 A/+qyWocgAoCq6GTnGw==
X-Proofpoint-ORIG-GUID: M8NIxbQlEJq4Hqu7yqetqTs9_e97yf4m
X-Proofpoint-GUID: M8NIxbQlEJq4Hqu7yqetqTs9_e97yf4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250055



On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>       .halt_reg = 0x4c02c,
>>>> +    .halt_check = BRANCH_HALT_SKIP,
>> please use .halt_check = BRANCH_HALT
>>
> If I do that, the clock fails to power on on boot.
> [   20.324488] ------------[ cut here ]------------
> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at


I am hoping the Venus driver has enabled the GDSC before requesting the
clock enable.

-- 
Thanks,
Taniya Das

