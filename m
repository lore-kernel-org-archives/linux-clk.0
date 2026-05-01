Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A733803F2
	for <linux-clk@vger.kernel.org>; Fri,  1 May 2026 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627715; cv=none; b=oh8mpsbXxvbAxScPSEUK85cE4rlW53vQnF7es+sRA/MXojeV47O95m8uQRX5C0n35ms9V0SONQszDtU5uEuErgO2bq1DNvB+a5LyZ1yNEno29i4TlZ5Dk4YEUD+xR1I9cXmqjGeG9esm8fdurSeKyjoOIJ2929cZS/GMttvZYSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627715; c=relaxed/simple;
	bh=QjQ4nAyOPlb/OGkFQKngMQxQOf4WvDyR8Rp65HWH7jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Isdt404fm5HSvxGe11NzMOkJN2LdLaDOi8qFMCPGqHIErNfuS0lVYADFTlxFs2QXJXmX4Pf8Sx/5CAGDvPDwqQXBWNb69syeJvcKpfPy7n9zeEfjYh4U0JoJE0raUFgkAEWXPRu00+iJaNbAFQf1uogdqpaPEZtsyAacYMLGJcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNyQQy80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAKOHt7V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNyQQy80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAKOHt7V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ULnsdb007714
	for <linux-clk@vger.kernel.org>; Fri, 1 May 2026 09:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D56RpDqAroV4uaRrm4q0sPtgoZMAfljRMYmDNGVWHa4=; b=YNyQQy80WpnZEOwh
	J4pv8y3yOMoMdkUOb4sg43Ro/01/glsQAukKnPjz/wFlXEynGgAWUgiLBhzlrigh
	PAPtnTn5xNwb83u7sebH/1fa4T363Opq/miOyrYjZc1Vkg/G63RtXqEmY5X1U59j
	NLi/hauoMnHRutBeck+Igu/4zSXIE0fyy+cPH+ziBqAQCTpbhpQEAIMRECYYBxgH
	A05QM83377oq078FX0HzK+R6w3GuEcP+3je+a7ndc++JOWHwMh6ueIch7Z5S+bAV
	fxjHJrMxKwTlI2qwURxSutbWSi86sFSBLSvEPL7XhY2ieV2iu4iXUXCMtyi02jvL
	6rNafg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54wcjrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 01 May 2026 09:28:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so22635011cf.1
        for <linux-clk@vger.kernel.org>; Fri, 01 May 2026 02:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777627713; x=1778232513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D56RpDqAroV4uaRrm4q0sPtgoZMAfljRMYmDNGVWHa4=;
        b=PAKOHt7VZcuMcdpl512PhkfaVCsCfz86lcFxmWQN9j49/95FgUzChBEisqt6apnv5I
         NKpUvYtDJNeXPtPqDlXR8TQQlO4wngiAQBhh9c+1b2JSN+jytX8rC36aDj/q9iHzIl5X
         iX9xNAlPLKGac5ZCjzp1kPcf24zUMDQvfeyfGqavnZC4uVMvOnNREWgEupoi9ryFgJUM
         dWHV2Mh43JlD/UDlMOMQoIAOlR0STqgcxb5BPZyXLKk9f+pH3OsNbEEjAIwNtzHb7xAV
         AKC2a3by5oFio12dEuRTW4C1+wHzNiOcG5j6sObnBi3b/HEPPmQwC/6LJiUB7k7NGi+m
         nAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627713; x=1778232513;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D56RpDqAroV4uaRrm4q0sPtgoZMAfljRMYmDNGVWHa4=;
        b=DuQwrd5x+Lh8GCocpzJZVv0qGds2u2t+D1uKnfdjw2yc+Je9b820tTp2tfn97QzUr4
         nHCgjX2f1Qspt7GOjR3Oa7RA11yQPUZQlDWWMQxtvihZvWJGsgGDkwsFO5yutqD7K1BK
         AXtC0lKIQ8cPuoJZwt9sxZXd9rv9pf3TLh/EK7xFhgYa+K0E1IuSFw8siQDeVpMkIjxE
         PdfbLXGBzyuwiUuw/E4ZiVXBCjCroy7e078YffUkzZxvrQdz2nUVNxnFvCtMr+xjhXE2
         RShpsYTqRV4EfSDxwvyaTSvaKZbE/BR0NDZO8cqx8KvmkbyDGj0VUdYK5vaZQz28EvR6
         E9rA==
X-Forwarded-Encrypted: i=1; AFNElJ/U0F+X5b4h/vmTeSBWx7VZowBAtf74y3P2NtkINZb9XRHAw/4Gqa258U0smDU2Z3rZ5BFimCrLt1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx60+Tc4qkS54tGTRzOLmH5tgdxdVaqYqDb1WOqpgbmSiR4jNQG
	7PfAPFVn7y5bSSCLBkYiMEMHxb/eQuxBej9ARlWKVlEQ6+qAnf0dBrglrFlQbh98Fdl29CF3AKi
	qKsv2NiPEMjCO7LYdZE8/sZNG0h5jcJVW85GEkSJEapgQDLCquY6CcxVnSEzkU38=
X-Gm-Gg: AeBDietIkTXdWdu40/EfxJPBcy7bOzHhxbF9x4fTWwPFC7njWGx0T+Y+Yp8RUHYwt5x
	z6eXWXQV1/0D4Jq9S+ixWCkJ55BNllOUmVRH4NuRhaHQqpzWAtwFglgiCI75OO6N4lWDuN5ct3l
	71G1A/O0lB8oPYr9XIkWz9WouptqAiwvnbwXNt1rvtbJEojlCDhgbO7txS5ermK4i17MHiXpsAE
	1D6CMJOD4gWiQAGHhE0bzGdo7T+nk4ZhZhQSSr+3ER/zDIJjjh35/f4Fz7zXzr6Q44pq9Gc4qQj
	dL2Dv4makJr7RchgfP2XyuMeqlNXQsWJDD9WUdZpmkzdk6jrt93t9eNQBJm1F+5RTcmUG4cU5K4
	b5rcUWgQJQaKGcS7FUO0VHKuGBjFT1YGI6RHO0hN0eHXNCxUofCG8EWjg/jE=
X-Received: by 2002:a05:622a:a15:b0:50f:b821:9c3f with SMTP id d75a77b69052e-5102ae7f6a3mr97062051cf.60.1777627712742;
        Fri, 01 May 2026 02:28:32 -0700 (PDT)
X-Received: by 2002:a05:622a:a15:b0:50f:b821:9c3f with SMTP id d75a77b69052e-5102ae7f6a3mr97061801cf.60.1777627712316;
        Fri, 01 May 2026 02:28:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm119482415e9.1.2026.05.01.02.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 02:28:31 -0700 (PDT)
Message-ID: <35a1764d-7328-45d2-8240-6f83eae1f1a9@oss.qualcomm.com>
Date: Fri, 1 May 2026 11:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: spacemit: k3: Add PCIe DBI clock
To: Yixun Lan <dlan@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-2-32fdc77c02ab@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260430-06-pci-clk-fix-v1-2-32fdc77c02ab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iKoVS0DY-lDaJgNptu9YPd0W7u3GsgP5
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f47241 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=iAxtvuIsaXa42ajRdEgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: iKoVS0DY-lDaJgNptu9YPd0W7u3GsgP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA4OSBTYWx0ZWRfXzTwtQrFSzUvC
 RH5JY0MYQeniL7VloxVKdGSctA/tw2FsB0qUFP2olH5xjanypMH5lSiuLQoQ2WIybkgIHsWaqo3
 kk66/rxqzthTR8eMCBQgzFXxousQpXEtKoZtVtN7EL5YoFdUJXuXqryCQ2qn31iG6nQVuXA1/cu
 QBzwguRternIwlXjUxQjbpFbfEllLL4PBnmTiTSdy4iHCApBIghJyvMjzLGSD+2EtHCP3SnmDNY
 9cHHu7jDXocJDvXGFldUamBcL9tgAN0DF6Oq4fBcJxq3Diei1lOdcJkldwk4S0/pSXKb36xpxLR
 VqVpHGTLVKETVmK6qCNo823cDYKzs3gD05xCTq4KKUaQszi3cg1gra7ixeRR4rcPb22UpOOm3Q8
 jSpild0WyI5ORfo+I72hF0Dje1VbDmxbM0zWE5lujEPqUFVWdQl85uxYrMhI531dGoOsjn27K/1
 lUHNv5K3oiOb07IUKSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010089

On 30/04/2026 12:30, Yixun Lan wrote:
> Add PCIe DBI (Data Bus Interface) clock which was missing.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")

Describe what the bug is in your commit msg.

Best regards,
Krzysztof
