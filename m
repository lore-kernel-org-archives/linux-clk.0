Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911772772D
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781111603; cv=none; b=g1QSR23KnFYU0wRC8CEh4ATpr0CsT9z7RSSWjamEN9Ch7IwAkNzuQMkZVCzHPLDxKugfn06nbDqBiwEoXRnFRDYjkbEhhYF0xHSEcV5Sc/b1g5Zci0OJJDdHitXYJzDNl5Bj4NhCnwnJdkzd9R2vWpx++Z96eFto6t0+cC3i7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781111603; c=relaxed/simple;
	bh=ouVsz+gFgeFDCZi4BmF8DuQczY/q65vCgfhjidAPCtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpmbNDU12lGOG02wIvOsH7wBY6Xg4S7S8wH5+6AOo+VY/MpdbieMx7kMHN7AOS+IaZuQkQBbJmfZov8phpMtvljLDw0UEd9geVuhqtdlnohx6uP4wS8zS8zYOSgZ4Ppja6U9+NsIXQah942Hjye99sYVG+jiiin07CQresNnFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmuOQpDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZMpVnb9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmuOQpDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZMpVnb9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFx4E22082863
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=; b=QmuOQpDZyR8bRzGM
	ly0MH2zuD80wFMi2Gp7y4JSaoRThlYrbhr+W/pipWCSpGxw7yvABqFohzSqR12/Z
	+OBrzTlaljKB4hlJuhGC3DgrwVBk9EfIT81DYyBSPr89hJDEaSIQyvl8CQYhXlOq
	rxgpwE6fuguNIQOpx5nkynSWIL0uZ+D9GeM+8vdtRQDOWE6fMX1bJoaw/QCWS6n+
	X3vZzXKrzZjvRFCmRuIuV23uhPJmrSzonBAu4BkTBnOCQBOlyETD/ytgrp1GR3qy
	BYLRlQLAZ4+6C+Ob4aVw9bSqB6AKVno9i9kRZF0E2K9WWDmzLfVbn3sq46TfzjiK
	9fa8Xw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnusg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 17:13:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf3636d6c0so72925215ad.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781111600; x=1781716400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=;
        b=MZMpVnb9P9DrGWmDB1W1cVG1KxnHet7ldux4FCdckGD7IKbaHt86iQ6UHFHlusSp/B
         SH/bbHw8rubpHHYrc6Iu0KsVoIql2WCnA+iDm7l5TMbd7ZkoXSrdejWPJGoB7NzcvKaA
         GGDFfCkysb/H716kybA0PvQOLWwI/cZedcRhcCwS1lrPNhz4/rR/RObGUk5BatgWUcd5
         PMO4DIPSZ0vKZA8AcGJUGZRkmIIcHsDe1Y/S2wQMFrhbFInKn+It3b3411oXM+Run7Wl
         xA24IAXdX5ljd6yIdyzK1iiIOL3F3cjaZsKZJiUNT+QFe76qzLyDTdsfMBArXW7etslm
         9qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111600; x=1781716400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=;
        b=bjFCOR8CuWxzYWukdWX85p3n299EfD1wH1/hdYt3lEP+QfH0D8b5Bw9F/eb++R8HyZ
         QVm2S/4UWtqR0N6DcKwtYWWSI+1rrTApMGqIvHxlqYCZn18ktmZcnkEgPEV1h0EVjk1k
         MOsvJXH0ArJnrGZl3e9lQ7f3eX12SudvNUGSWGINpvZ9sYkMHi5MRxH4m6MhGKqHykaV
         TKMHebeO9OnPWtW8l8ob2MIZfrmVaFOiS7p4v52und15NegOcRZs100UWwNEHs7yRhsT
         XsACY7wBnSgOBInXJuyEtSpYzASdhIU0iOUJsltVXCT51a7U7IOx0QwQq0gfIVpsjwjX
         jYBg==
X-Forwarded-Encrypted: i=1; AFNElJ/SnSq4L9Uk9o4p0Xntp/e9uuOiKEFqxrqYyfIvxXHWZrK42B1ph2jM0V+p1AIVRCO4tw5UOk8yK5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlFoMWlsAEWUGSeM7ILkin8UD//1bZ7w3tsKbqgD2k7rpQ7cYu
	2AOm80tiCCQeVqRqy/7L0UiK+l7y9aO0iOnCgvHxkrQJoJuhrmZPPr81H5y+dVOthaTVHHdWNqP
	zbm6CRTmYbQIYybpxjsYtcHTW9aVf6PR+v/r85JyxK+HHgTHGN9JDWzYxP/CiSp8=
X-Gm-Gg: Acq92OEhWOnjUQOQX9gWRavkp08WY3KLhcb8C/f9q6ovemy2XlmmUGGk/+8Xc/8xL8s
	Z+qIEqdx+izl2XESWxBMEdj7+Jrl4Q6uqNslaGAPtEzRmKSY6pkjSFyMH84Z1x15aoDDkG8vutZ
	LlS6CX+IPN7vDz3B/T+JMUDxy6PBs86RVeAV3yJOVWz+QAgg2L79r0BFOGAKxLJzY03DgAw32FC
	m6mpzTR6XPss1mfPEJXavFAohPYapIDHPAyUF0tomhri8G+QPwURcGz/2oacD91LN1mgmXtE98Q
	W81tLXl/ey3JUZoxnFX2UvSPlH+JvJdBPWHwWE3+5GoXMbDgdejxftb7tz03d9XvND38DGXf3zp
	hioAG3vFvI6+Wg2Vx+dnmXPZkQOaEI73XitDc16wP29KZGbHoC2qite/qiqCD
X-Received: by 2002:a17:902:c40e:b0:2c2:5446:30dd with SMTP id d9443c01a7336-2c2da73c13dmr2053385ad.7.1781111600453;
        Wed, 10 Jun 2026 10:13:20 -0700 (PDT)
X-Received: by 2002:a17:902:c40e:b0:2c2:5446:30dd with SMTP id d9443c01a7336-2c2da73c13dmr2053055ad.7.1781111600028;
        Wed, 10 Jun 2026 10:13:20 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e096sm256509955ad.44.2026.06.10.10.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 10:13:19 -0700 (PDT)
Message-ID: <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 22:43:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p-onfB-r2NtMO6tcQ93dUb-VaFkbZmL8
X-Proofpoint-ORIG-GUID: p-onfB-r2NtMO6tcQ93dUb-VaFkbZmL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2MiBTYWx0ZWRfX2J24fvk7fpE8
 L1Q9cUAMsW4H2uvgz/6Sqr8oARRCtR2EQft+6ddegV6mQ8wAW8rp8MgNUEE4Q/0JNqCwbCpMkhA
 bvO/wqhZDRLrKjddFLiKOMDpnB+Z+Az8aBItuQhXdvsGub+Yhe2iW79xVxsymuMrx0pevYTmS9R
 oOJCfldP8DXUk5FLk59ePx1psmAbAM0eZ1+a3qlpdLjNRFCCEBBzyIpmMVlHfBzkosiBAlZi3Ac
 GWELiD+AsbNamPc8TdTA9pRzlO/m+mheM6hwXhlFvpxGmoHN6e9PJY/kcFDvokwFQZ5+99c3IPf
 21zuuwoEvN/krQbvoYQgdASeGbzeOLV+TSy35lDyrBffzZ6X1CBVZhInVP4IFZI27GLYR1WWD5k
 U/h+a0B4JVtisE8dBG/V38aaTVfga5069UFKgIBRUaAtIMR1RDKB6IzzzjmupD6GJQ7Mhyo7Gy2
 hh6m8co62F6t71mC+0A==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a299b31 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wot0Jldcyx0dIQi3j0aq2Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=WmjVd0U74ipakLrIZZEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100162



On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> match nowadays is gcc-msm8909. Looking at the differences between
> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> definitions for the BIMC PLL.
> 
> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> used for GPLL2.

BIMC PLL is never controlled from High Level OS (APSS). These are
controlled by other subsystems and voting should be via the ICC for BW
requirements.

-- 
Thanks,
Taniya Das

