Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741963B27C6
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307691; cv=none; b=j4YrklOTpzJoh7+rbYggolMQf/KP7wuPE/NLXynFp6PMELyvyL1nxL0+hOTUnC9xFZpJ3h5EiNmui2O6ZL9u6fabqX+0DJrUqBEOjUlem+GL3mhP0/E5DQWCMZw8bvk09pw7jUkyr7Wb6bHoa4jtK/nPVgKznEcheM9ZRi61xI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307691; c=relaxed/simple;
	bh=IYaiqSwkKhKq2oKq6noG5azMdI22xDjR53P6dIK4/TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwK4ZVpyPs8yDltrOvv7HD/Evd2xW1wYk/EH43/N8lzTx4/WRT6XXZZQN702sVW30PUuvAf/Atzc7iXjYofTxxckFLMo07v5imvpgfzEC0GyPdyL1keHqDk4Oo6grNpSp8ZYy/CQvfsHoxZamBexkwMk+ex2kxoAJ6/mkssa2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBbDXkoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RVt0ix+O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBbDXkoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RVt0ix+O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANcls1148196
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 13:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=; b=iBbDXkocA62hP9V7
	NbHB4LoFdsZiL2otz5aw3jzwrXx36qQLZWf7/vqCY2x8+EXDDjspyiW0lzLq2L01
	qNSr85lYtheKTlkoJtUG+w3EzA7m6cfsmzulBKT2E5LmCqdrgH4An3LKSyP66mtT
	WkyAzW5uyKBlbeXGzIG6s9lljBO168d4nYdQOPT65UjWBoExCYDVOmj3ZzJXjhd5
	o6uAbLx74k8Zt872yfh+XavqcKECFWsHcbWTw9awIb+E/jWYgjAkEXzTbBTiHBiy
	Yv5LyOxJqzMm5kaod/XTqQrkm+Wd06p4uZVB3OIIR+FZ9zfT6edBhphdVHYrb0ZF
	1VP3hA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r3280b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 13:28:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a07295d67so3472181cf.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 06:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307688; x=1782912488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=;
        b=RVt0ix+OZcWaCe3fXWaieRkbjo2UHON1EfwV62nv8hj6ZipnGqHd4n3qhdEDtjLn9U
         Z6mz1BITfVI7PZCNDddL58TzjNKmS6jAHceA81QXiNIaP5nBwP+yfLinEKvnTvnRl0Yx
         tK8BfCNFhgq8noHnoLKrZkqeTs+GCtmKgUYvCQU3vo5oS2cSoX+65CTwjh4A26PSB2h/
         L9TPM1Hi8dFt18CpnKKkwmt/CDVuNz6txXakbegpfCYQPzhBHaw4FeWFs5kELD+ZQEc+
         QCEm6hggOeimdRQCPac/+mAxpevCu/Y04brosC0iMIUCJQVWMIg88yWUfZkktRBpnZA3
         m+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307688; x=1782912488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=;
        b=GIMTsHZH9CvGAfAOoqmi6TtMP4/6J3ILFzfBBWX+Dc7DhFvqKJ/VcDli/qFxxbRzKb
         /zSQC5/VXfy+9dTbdsMiCLRksrdyshhpuUez6ofLKb4dgxWtmCZC6bbr8QCMCbHLgsDa
         xAVeOu6O/ick8j9AFIC/a6ewbMNHWUw9BkAIO7FzBDCbsivOEdqhHQZwuSpjhE+vvkug
         Os423LtuhnQyGWpz6cc97hld1c3+YxTIUW7RQ4z6JdV1JIGrtls8H3yeg5uWkIeVq3Df
         4xe6baTUNxWIV0YFkjXNraINZ9KY1NAqd15Ij/l2ytioOrj5RcOEyH11XjyX+V1+B9Cg
         xDbA==
X-Forwarded-Encrypted: i=1; AFNElJ91rg/RSNtyVpQxJRbIBiALssoP70DCs2gBN2yg2hQ3Jm1qg5/x1bUUVgMuUfxTrXCGWydFAsdUxjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4NbYcOu40SL01yHSqebuaTPIdcQDINvmKKfkGTpbXcaDJNsQd
	ddrCmRjJMeXtlxYEzADZLah5o3vALw8L1lkyHLJ7v59Px7/fICs2ltaTEofvor460F+ynu7t+9L
	bhMhiBxjOUiAyVOkVmHx+I2s2QfU0r1fBYv+RbzqIfkJ5G9CmMp2s0aS6D5Del1w=
X-Gm-Gg: AfdE7clwexmYLd2bE5lzea93wcTxJb13w8UWz37kl3OsLLBQsUJsWYkLr6KjLntKGvA
	27da8mgHTbful1CFcbPJ51ZdOKuXyjhA2KnrqrXIYqCeiLPsoD4w9AbMF7StU7R1g6HtPtfoPip
	jwTg23SrrZ8yv2omGRMLDzmMpJ4kOO6jfxCjw1owDGYjOchyfdabSKFMNxhXnbJcBkuepuYue4c
	JF2+T5BksW0PIuJVZbaospRVKdx97a+u/vnKVY4H7JUehr+Kv1jOHfF7/BqDh4qlgFDFYRn5KWj
	3126VioGNOhd3f9lgiGx18XIrC2XiB1Lp+pBUAyNTdv2HvRxpo4EbC/znDWaqExIg5SgqkvqTGL
	BU2BhdO/bMmH9/1oc0eB1t9mwQTzMyFx+2RU=
X-Received: by 2002:a05:620a:3185:b0:915:8197:4490 with SMTP id af79cd13be357-925c95b2466mr942762385a.4.1782307687812;
        Wed, 24 Jun 2026 06:28:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:915:8197:4490 with SMTP id af79cd13be357-925c95b2466mr942759185a.4.1782307687275;
        Wed, 24 Jun 2026 06:28:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac7c1bsm661168166b.33.2026.06.24.06.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:28:06 -0700 (PDT)
Message-ID: <53cade89-1fc4-4ba7-aa7b-815b9e26d88b@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:28:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMiBTYWx0ZWRfX4d0fpGJjrLcq
 FwScO+2h1ll0l0C9G0kgbhU0oblT0RxYK536XeocBh+y2GW4GwO7NBKWLAX2XmoVUo2sJKtZRe7
 iHz3UFNLsf3yCzYnAjardOMtfeN46BLybDPJ3LqWVYsc3OvixZW7HsbX3l1OMq28tYco37GLZI9
 C0zmWmQ4Pjvn8KtGLsTGIfNddOZq+rZ2KBISaG2poMzMV2r6ryl11hMVAfTLZb53WQSdwBJDfYL
 idfQ2cm6AEU21RdjcU9BXuXPJjJJenQ3CLuLVDSFEbhZ2nZvamqW4Jpfcyo5J6bLDvF79WZIUb9
 F1CF/31VfXmVnq9ktsO6ADn9bb0B3GedY/7JleAqln5nulXsVEjfflwgdrYbjPxmklUf/nayw3D
 5pTzzqGXsIcdCDJKCxs3qkmWfKTZzg==
X-Proofpoint-ORIG-GUID: ESQg7bhw7fH29w7UM9ciGhBDuI_bEJA8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMiBTYWx0ZWRfX4XjBteGKmTdA
 a+W6QgRSeFBAzKZgkFR0uuWVeJc3XYB6heNVqXpAITlJsHrYYhmBWnbGdYC/KeBnwyZSBvyRGGk
 4/LzfmlqquUWNoHJyUSNDoCK0fpJ9yU=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3bdb68 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=oK1bmnR47wnCuWhRGskA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ESQg7bhw7fH29w7UM9ciGhBDuI_bEJA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240112

On 6/24/26 3:26 PM, Esteban Urrutia wrote:
> 
> 
> On 6/23/26 7:03 AM, Konrad Dybcio wrote:
>>> This is mentioned in the memory map description, but is not part
>>> of it.
>>>
>>> I booted up a 8450 HDK and it doesn't even have MTE, so it's
>>> probably valid
>>
>> i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
>> trapping it.
> Then, should device trees delete these memory regions on a case-by-case
> basis, or be left as is?

I'd delete it and reintroduce as necessary

Konrad
