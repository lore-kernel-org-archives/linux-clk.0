Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E438A33A70F
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935523; cv=none; b=UXdTHaswWJcEQuW1n/dfAbCqAhjNv8RTi3jBmcDTxTdAHW1mEuHY2S5TeMSCYbJxWbBc82nEJHtoBqPZv6iS9/5sHrc6T9heqEnACL6Fv1hWSGDI48X0UOan8q7nXAc5NflwQgotfzrpDtdRiQHbAHaCb5VyPFEAb+4k5/yvaXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935523; c=relaxed/simple;
	bh=e8pZf8plrZyej9TnlAyDOk5VBoL31Gl/oUv8+6Ry5A0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQvm7MQVYm3MY5Rhd92r1AEB6ToYTtmtcdfoB3aigqs0eqchNLLHQgMWNrl3JrO4ATqDwtCgjgAQaLIUTbywMcoPWLHLG02Z0DM7HRzbWFOneAg2DX3IFHRAZza+E92+LaIlJD8HkOZXi+OX4o8kIohhCQDy9knfi+JsEnWdzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDYXo+nd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AucteB65; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDYXo+nd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AucteB65"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFVHU4017274
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 16:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=; b=hDYXo+ndaCgs7v2x
	6w/SG6Cpd9D0RozsU4fQBBkpBclLm50JjDibbtZyh6WMRQLukT/Iif5eQZj4raCu
	kSghrhSOnK6q6x4a2X/GTf9AuyEfrhy5cqpW05s6Zm3YKT4ihKRaRJ/UQCr9wIJw
	e3n3VF+2do8u22f5Rz3SGpFIT5ujuTp/g1j8nrSQz7zrRA/DmDnUm5JEI2dlNJIR
	Q9Fff856ERovsvuSlrT75kh8K/i9vPbdQDirKCEVJfMU++bNeAKVXuG2smhD+sH7
	aj9+Jtx0YIPP0db3xCqwKwCR1dmviZNR0JT/zoMuf3wrLQcbgs7+J6FJIKtOGQpU
	jt+rRg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8hrss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 16:18:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84233efcaadso3055290b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780935520; x=1781540320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=;
        b=AucteB65OFN/h7aWf+U8wFb9nENv6pvkNx9D3lvQ0777CBK/csyT1FWVR1moyyRpT7
         +4Mv3QYov4DZAmZ1vb60vILIUVXeR5H0knZwc1hOZc7Kza5CxGJbPPLR/X4rfL42lt4m
         sbQVSO/ELeCanJ1o9PBJtBjDCn4bkvRRdsYzw8RAn1JaLu5O3gvtZIT3kINuflwlM/cl
         TqZygBhKUd6Bi0hyYRjzSVOLLkAI1gcHMrNHkwuwsqCADB33372cgRZW2zbfssbQMLDf
         b5OU+lVLAIPdzNB0Z9xomun0AFiu1JrjTG/Mzyg59qwur01ZUIGJJuHTeiFw5XkAXqMa
         XPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935520; x=1781540320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=;
        b=O+KbSegZlbyy4DkYc+cbAdfCOiTKQkmdr5Eiz+gqUHpjKfJxK8A25LH2UMacB0e6jx
         5ytC3CXSldIvN+etzl3zH8L1i+y7841K+Er6uuxf48JjHfLjwEog6ue9eOk6Rkg3eF0O
         tg2ZE07Y6KXC/BsN5RkQ5AeDzINmL9/0nqEN8op1/Xk86td4/NlxeF8hx36KoWHhRUaB
         3n/fpJIzESAXIx9SnKwXXfpLzUmJG49Jq8hz7d3TVaEnNuEf+SHOJEzGWePJ6z9jMRet
         0RvTJ8E748sMTFl7w6hP7Z51EQDmKhfkx7N8p7KPwvfstf8wq7KDqMbFvLOunFdpeUG9
         6XiA==
X-Forwarded-Encrypted: i=1; AFNElJ8tuLL1zXS5jsLz9EX88wQ5MN/QzAV72ba0Vl8sZe3y8kXQj9lDaYhT0Qom3aXlhgXI9VMdUzpDQHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrct3lHQKeGkSOJRVEcHVIbdQeRjs48Rur25HAGmL9rclEZ5w7
	tIC2Bymwonb4I0rbFjGEE9z4S+aD1CEaXR68+bSiceaW+Oe1kF2X3xexfhDwyaJk3HNMeZYOzDN
	QOVcSqqPBAiiIqob+VAZlVMuZM5goGuJ8A8tLX6bq8tRB6bwYIPcznssIo4N00wE=
X-Gm-Gg: Acq92OFjCDjHKgbEm68f/Fwkl2q0nc99/dlXcPKN+0P+vGvADUPu4rJtilkxi/Q+b0S
	2MyJbpOKJ8ajIY2bcxoOflem+oLBREpGg+tav7w781CBJdPpsG7I9m+YCZTb+wL12Gtgp53v0Yu
	oY7fPsD+tO+M54dC2Zt6gSEYnTcYuDxI7ntrbEKcvUne+EZDI3ukQXEhTu2trKCSTXZh2IFsI52
	0SlEqZYsYlWZEV6vDBNK7zsAy7+sSw68vRYtZBg12UThuc3+MoKdQQ8NOa285nNVKFgu3ANu2Uq
	oy6XyEZynunDQPV8e7WB0UbhW/6xNkUh4ccu9z7MxtR9llVjkhWsZPxmcJkXLHYFfF7t/WMixZq
	iznx2fmaPXOIO+5K/G01cnLuZgcSe3mM+87xIUzoQ1jTnkggoWd1x8H3j3x7REkbC
X-Received: by 2002:a05:6a00:2351:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-842b1102db0mr16141983b3a.46.1780935519942;
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:2351:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-842b1102db0mr16141951b3a.46.1780935519489;
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.240.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm18865716b3a.51.2026.06.08.09.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
Message-ID: <d046aa40-3dd7-4fbc-b99a-be8076ef46f9@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 21:48:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NSBTYWx0ZWRfXyxkfHpicHglM
 ZW50UudHu3o491x8S3PjJsZFJegtBtVElSkycFBsYtWrLfmoX5mQ/nVdqRKrrCp0XjUm/RNF3RY
 +JHWyp5jazi/M9yj+IFMsQ4COm6JdtBDSwlr9F29W/chPm6IAY9Pxvextyu1A3+wV7hVyoPR1c0
 h6u6uj5px7PufdmMmxJxlFpD0S9VU23cT98Av+O20j+Q7stW7OJDvZmFkhBLlFb1bFs5VQE0u7s
 xAsFC4oTQKqKppPklP4mUa03kqv23xi7BK3ulWcwIDm7S4qCT0LY4gOni11/di3uq+eoHCa9mb7
 aETEVALiT0/755P2DsyrdNnMjlkiIEHOj1XMYwYql/xLoKZKxf6J23zJj4dDkdQ99/5nGZMg+1w
 +TB9v2EGrUuY/xFeYgUcmB83MsEfki8xfP/ObsyBndZwAI/wdiOoPFKBH/6Eiblh6wAe3Ss+cqC
 qhD7nj6zUWrg4vwA9DA==
X-Proofpoint-ORIG-GUID: EO7LLofNY3n67RmvWfyjDDrmhsfMnj1Z
X-Proofpoint-GUID: EO7LLofNY3n67RmvWfyjDDrmhsfMnj1Z
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26eb60 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=dTFYtdXiv3wnlml4cWrohQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=G-4fGFNKO6kq0i09DNwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080155



On 6/8/2026 5:51 PM, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com> 

