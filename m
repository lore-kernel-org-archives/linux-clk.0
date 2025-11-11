Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3384342144
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857070; cv=none; b=Ym2xfpsnyHLQtCSn0VTaxzo7t12QLcMEaa01598VF3sBJLLfjgYrbAVmrdNQPZW83U/1NGvVNAtZ2zUcZhHFGCUwyxroRguGu6Z8kAYxehMOAICtPh+TsmTagh7PLRl/jOawTZ1pt3BOb4tHqU0biLNHkCLmVBN7+fYLZin9lrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857070; c=relaxed/simple;
	bh=D/ks/HjJ2UmBeeXdNzT0qyT2BCDFWFNaVq/rqrdOsjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ja/Y+pQ1FsfIvngNzTmTMTaXjHG8KmhuDlljLKUhi6GvEVR5soC0YTZK2u3cNzgLPIaSuVtFvFOuUSpe0678LbQMVzPOlLl7I0UzX4l4JFmZpmkLd98jYlVuZ+1GseJz8udSBgX1Tt8Ppkdei2CbrRjgZprINIdM6+E+/ChZQrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfu1Ayng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5QOmd02; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfu1Ayng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5QOmd02"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABAP6623985493
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 10:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HeIjk8zjDMvtq1Ei8/4B5m73Be/4tVAGo5hOoCO2INs=; b=kfu1AyngoTeYb9uT
	NJJ5mnNQ0m4jzxYcr2AcPYnq2RI2FyLVWi5uouZF48QzWX/XUZcpyozU2wYi5Lxk
	5qJQejfo5ntH1OkvSAvCSUTiwlwEpImmgnTY7/eaqEWeDy8m64H+W26OLLla9w+7
	x7HBGlQzgJqwhwI0ZOMnKznAiVZsrBNRiCeHINeZgrDOh2qIE8LXGw8GPeJZiuL9
	NJMwEojZ4GYZ0/0ZpcB3FUHkGlm+7w//Av7xL3k77Hd9i/enrlRBudxj+3tROWSh
	fB16r8+wf69n7cS9t5FfLsT0+XIPKh32/CqF/yN2HcaO8GUG+RWnlfqyf0L7wJbn
	//Z5Fw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqjw5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 10:31:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29809acd049so31961005ad.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 02:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762857066; x=1763461866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeIjk8zjDMvtq1Ei8/4B5m73Be/4tVAGo5hOoCO2INs=;
        b=I5QOmd02ExPcOE3AWp9FptYCMvn7KB6WzSMDHLMaFkbND5J0b1VbaiZbMSVE/7rTkP
         FkWN4FzJ2t+lo3VIvyU5H7E5hDV0ZIe5FV3scWoLIWFtsIPnkENdtp5xrLYIDRhPyqny
         9gTLmDi08KsN1jP5ucryTZDU+EhnAyK4hmKjkhUtHDPi0rid21RrwpHeOq3LHg4EI0kd
         OJ08aRl5f1HS+HAcN/Odab4RT3fmyDFdhm2cBv7RpRidcwCCYnm+ukYYZWwh8T3AUXP2
         gEZ+rktTCbwtCqC7Bk+RMuW9CX4AJsf4zG5wNKO9tjzsV5IuhZibMyu/Hc+U+pKnrC0I
         RmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857066; x=1763461866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeIjk8zjDMvtq1Ei8/4B5m73Be/4tVAGo5hOoCO2INs=;
        b=WnH8dpEhjb760pSp51WGpTUW4t4rGr3ie/szlT79m0+gxOj1hDhLAJZ3lsfXHTaeNJ
         s1ezOKQKo2BVeSjaZXaY2owqsPzv8lc315q+ViZBluehTYZ3WsPsg7gPO+JTpBiJ744o
         tBvo/ObQDV0tK3eidjNBEtLGuk53Bto0Cot4S50q2qgqpkqokvrnm00kBdQ6nky+/bk3
         XW+IO6UUZYD4fqsagqFAHHFH/OSYBggeyahJI2sy2NHgHH68um2872CPDH8PmefGU25X
         MkwwrE5GyngQRjiNem4CgjP0I7A7fLgzlgmmIwIHaT33/WqGJWPHyWMO5Xvxg5eH5z2R
         pJAg==
X-Forwarded-Encrypted: i=1; AJvYcCV65MQ5IPwbpBkR76xVlM79itJk4LWFQmIx29i6n5zEekyIQ9tqsFo/CmEBeG7e6mr3X37Yno9z6Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzirYVfeY05pBBU+SsyN0aCs0aNILaQGycSnRFdS8rT1dLGzJJu
	YDsURm+PhmnsYcAyx0QxNgzuRUzjzuE4i0clQRiZwcFLgLKxn6fCGHdMPuIveNYkAio8qJNAE7t
	odGaZ2SYyjIfzF5aeMxB6M0qOajaRWy38+uk0NrPKSQN9yjFVgXyXY1jq2wjj2ps=
X-Gm-Gg: ASbGncuCnvk2wdzupHs/VuGo+m2gcky1IFvZVOkZW2XdiXTVZ6MTv766JqfQk2uY/uU
	mGMcZmerHTVs6ReLxg9T2Bf1uKZ17pDMWbHnDxwanMGAVj4uTluJG2ZSPrrBXOfAAccW9k/k3Qk
	RSJdko3tb/X5CKa7AniVicHvcpgKU7LZn6j8sQBCimTEFvfeJfK4fiNVwCSOdiqtJnCZA6ANPWR
	gTuA03kQQUq/VpXJmJVsz/gyZHC5oFDb49d62vHiDv3adWIccGuITIvrgpLaN5gWevMkYxgDCQ3
	No8utKip1Dqv/OMc+phcOPcn6uA8TUzGiLs4PziAWvyOwT0pBdEbXAkyKfb41o5m5OF6rEJV1y+
	IpaqQ5GQZZshWF8836he2MQiY6rh8
X-Received: by 2002:a17:903:40cf:b0:294:cc1d:e2b6 with SMTP id d9443c01a7336-297e56f995fmr165404295ad.59.1762857066562;
        Tue, 11 Nov 2025 02:31:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEewwTQbqnUSdI6gBxX6IS/CzZ1xkFA7zvK6fqr4+b+3SthTOX4KV5cdskV3QmORTNpTCngvQ==
X-Received: by 2002:a17:903:40cf:b0:294:cc1d:e2b6 with SMTP id d9443c01a7336-297e56f995fmr165403695ad.59.1762857065992;
        Tue, 11 Nov 2025 02:31:05 -0800 (PST)
Received: from [10.218.50.9] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5e5bdsm175441995ad.39.2025.11.11.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 02:31:05 -0800 (PST)
Message-ID: <e8cbc5e1-4159-4d22-b7d7-5b9b6887dae1@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 16:00:57 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4MiBTYWx0ZWRfX7yFqfxeaHrPo
 A7rx7S+y2IRuaH/0g2619vsHscnstaX5SMw5mdJwDZN1Fo7nsDSIOxHyJxlVm8Ev66aymCUQ8P+
 j85V5e2p+H+ucDzu+r6kgePuBBOvVG9RUM7zAcTanHJQcCCInV1jxvKYgcia1qPxEJlmGgL22Rw
 cLcr2Uo2dvZF5D2L2fhS4MN9BeHHe+27Xy8ZK9YxIdKJFFQGyNlyJTW+mTy8UDoTyIjzFTkcm1O
 Gurr9m8Av2Bn5iaG8CrIMwTTdJOQnL6qozZKHQmV5/8Zm2JSHObACbJdN9k0nvZhsYdbVXEgmOC
 njnH3WdgBumxcrddWrEg9p9tP2RG6pKUH0i2eVblQm8pdsvDMl94YrDEgUPqxuOsjwdTEtkjp0y
 HaM+CFRP+0NDRgt0AhwbVSndUQEC8w==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=6913106b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qUnW8hDDCxEGPathPCkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: NxqUphi9OPlcmWuJf_7f_ZtIBAnCobxw
X-Proofpoint-GUID: NxqUphi9OPlcmWuJf_7f_ZtIBAnCobxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110082



On 10/30/2025 4:39 PM, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh
