Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D12330649
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244917; cv=none; b=l6bu8b191hW80/d2u/bpDj9aae7UwPuDtOIiHcDZq3bN/mHkJ1n8Wt/K7vNEXR44uHnrkGuwlB47Ck+nSCDsy7sXdcF7n4xUkgE3wes+Xot7tr38RBVzaG2S52962nbT5hP+vw0IHPfvErVRoAzn6rlF5KTazqMToWW3N33+qMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244917; c=relaxed/simple;
	bh=m1j5RrINyAPI/P/EuKGdbzHcBA/T6Nxv92BUQnlb+9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIsPz13zUlc347ekNZhSXdOiCfU8wZWqPJUNiuICU1js+ux/gaA2Rguj5UHMdiRZN9tOGZPsOEUYtLw240j7Oncexu/IPNdhgk3CVM9vJiRFHgBHheeT+B6C+TeE5AtLp29YCP3SS3XG7eOZ7fneMfmQ9UenR2dT+jM2zK1CarI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSkYBCz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4/1Tj2o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSkYBCz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4/1Tj2o"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9IC7T1566846
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 09:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=; b=nSkYBCz0PI4jpuLI
	03NG+lpyK94vsqez/9XUytSqMGZyAkrFBU5+j4baDy7CcrSNZCUUjEvmqRs5HcEj
	KSTy9aXUti2mIThk7KvCND61IzBmZsdNXvK3P5u5SOuPSL7GCoQriUNQe6NVJt5c
	y4ScnSy2epRuacXe5D5f3+SzoYeD4JD5E4f9i80BnHQPaGKbk3uDR0un8FbxOfLJ
	IAajn33dG9irrwwHQDnBUVUMx/iEWw1pxiKI1XlV6OM439A81f5KtEEyYJ0G5Cn/
	JEzd1hOcqqUR6QEUu0X6zO9hPRBa4+487jlaxK/sJ09TqVfLsHo2pibAod/2m5pM
	yoj5NA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv00ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 09:21:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b27636835so12972511cf.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244914; x=1776849714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=;
        b=F4/1Tj2objA/eNd8dodnFf4IL/mpYNtw/GU+LoLeJr5QMRP+RqhuVdbOI8YA0lzFKA
         MwxH3wLJ4cCe+9+nEerPszV89JFkKZobJ8HLg4NLLQiYqCXZJueMKpZm1Yj/Ir78c084
         gS58BUowCvoG3UNyxAjuGLfMdWcA4X5n8Zx73d5Tm0fBhgc0eFgihYqmHboEIhHVDHCP
         3mOzhvmcl7mmYYwgNn9LhvFIwi0SeZSHefONdDWzifK4/SZnHr17liBPsknBO4IyBJr6
         smdf3O2jDdSFiWe9ZDSMbvQdwQxAYvnzYrk07wAbm9wgO3u/r/8rCz8JEZw0E/EJJLGS
         V/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244914; x=1776849714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=;
        b=rS3Ajvc1Iid7rDJXuREgxk7f0e59LQe6FMm/O9dPUQIEPyEjphgGrOL8WUOv7TmnQ/
         4NstOnSYpUy4Q8qzhnoCFLZpahKJaXckDJINVkrgtknGODiL0qt1JlpcdCXZqyU3SP5G
         RZHdSDZaH3UwMgze1k7vNEL/7m5Uig2qKDNr5nrTzd/SGgM5qmoQp71VkLW4VsbJ5vsE
         PCRwLVFExpQbJhISf4cMCMgY/056DesbMkQxNHu2edFb0KgGfvTP+cpO1KJMdn7M11GL
         uws46wlFQn3kXcQZ5AHv4ipzi4bzVsBPEA4wmkuCurC9pAlU8DUXwy1gB6XL85fqFKHa
         YnGg==
X-Forwarded-Encrypted: i=1; AFNElJ85D9C1E2vRUpoh21TJhHFiTj7+FVYSpMfiyItAPewphbiKvBRT3C0zziZT2UJ+OCRnU1W2f38lLns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AL1jh1/8+Et6Ktv+MQkXeDyJrIQam5528D98HCP7HNI9WKM0
	HgRsLIMY+vtvG18dODl0O5efqxX/xQwP8pzu/BWKp7HemLHuYsQDqnAB9WSUZmh15WEfVJpLiXT
	49jG9trAWSeLnA4C2LezeHe13bdbe7bN6Ny+2p2+umQkufKG0Ts+2ck/97+OQPtg=
X-Gm-Gg: AeBDiesLd4VS9nqW80szOj91zayXHZ8ZIe3XYi8w+4IBHWibr+sV0x+7eu+eOLNa1DI
	KzTHV3ZyQUTolM8HoW69jg5XpSF1g/glf5cArNwWzJoH+lApnPN2PAWc+GF67lApSXamExhtsVQ
	UreZA+dLDv2CZVbn1naV4ehLwArScwMC+ryNMP6+bL2LlDUBZEgbkDhyyoqvEm++GjmzFoOk8M8
	3+K3al6OnWeQw+i218Tl8C7pqsr1CXCaw/6K7YSk9F6XBCHNO9OcYpNa3ECCafV5e2sIOIX64KA
	WvJ8XYjj2okn1rpWSG3FVJ03CijMEGZsd4mckDb+4ImVp0D56hcjbGL+TWw2UHvSc3LWWf1uSpK
	WXqKjj473NUNxIDKUrYhEmPJpXPFCv/qLr02qWTpiuilarceWqI+ldNV01jtQI8N6gcOWLagLB+
	pgcH8aNzbWbQiFqQ==
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14926061cf.4.1776244913827;
        Wed, 15 Apr 2026 02:21:53 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14925871cf.4.1776244913330;
        Wed, 15 Apr 2026 02:21:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c351fsm36204566b.30.2026.04.15.02.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:21:52 -0700 (PDT)
Message-ID: <228866a3-ce00-431b-8408-95309033bb41@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] ARM: dts: qcom: msm8960: add SMSM & SPS
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6Tvqx2d9Ik0B1kJB5dlOm-GhYqQ9spNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4NSBTYWx0ZWRfX0TdAPkcaVmLf
 Y4ZfOA3WrU8t82icatxLjaiwKh+MUfMlHnTvvQz5hgA6g+PZr968pWjj3WkzGTErTFdh8/IEt7v
 5uVsJheoxQCTOSbT2U1RezKrfPXmjPbueRuFUhJSkZGvhPIgH/Rns8GUBuV6C2Jo4gU0RlX8aZx
 kMj2Lgt4E9IulYDLerBbq5HtPSDc4hnAFkibfSJ5WfxnX+voKfX/qNcvxpjIZxuG/GDNSNLyr7T
 WMPniIwbhoDlHmC9jzIJrr8Q9jxEK2q6yuWfSr8G7+8tI1M1VsthgWgxiMU5si1jj1CkxXJ8jjh
 alaKb234U2ujsFuNLzCP74YtRw4TBCrZftmsPB2obHCA/29w2jTXRZVYtYr2fCMyTt8cHlBoDAt
 C/OcYXI7kuxki2zPZaI0MBtPpjSAcTerf5N9lzlXEV8CQElz8mul+sF39IRGNyq2/BchucijMgV
 0n8FksWiJlBFu4ibgvA==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69df58b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=he1q09Cc-XUdRE8H9dQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: 6Tvqx2d9Ik0B1kJB5dlOm-GhYqQ9spNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150085

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Shared Memory State Machine node to coordinate state transitions
> between the Applications processor and the Riva subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
