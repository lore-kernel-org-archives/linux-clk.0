Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6752EBB84
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 03:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420041; cv=none; b=B36F5qQSwbMr9h2rQHAp1GyCHUMpaKbmlMQflgTtjZLpQorGmXLe64CXQ//bzdcnHQHCT4hdDKbZLWWjH0QuxV2f7nRHuJ2CeE/YTMSyC8NGEigQXTs8tJQDair46a76FFw5YFjf7LIaQ6UvS3iylkwe9anBXGuug3pbHROBR3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420041; c=relaxed/simple;
	bh=edvAPZUlqdPxQvGt0zVokuNjkmj+7OzVo9zvdPz8oCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHgzInq8LQj+Dd/LTo6jZ4OBNcU4cyWR0Dj+5O4VQq71718mrkx7e5emx0853zfmbAwXmwe99wm8vYhV2jFjBXh5kCHPJv5eZONDeXMeBDsUuy77h8L4kIqsD7rcuJ84NxZqxhnqvwCmR0BCGlNjv9QijfPqphu1XmvOiMNGm8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp44ynqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwDwVWV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp44ynqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwDwVWV0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpt6h2687295
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 03:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ud9uue+eAmgOeli/UJM+eu9+5MxvNkXUbo2Xuvjg13k=; b=cp44ynqJNje5/9PP
	bOmw6YPW4iucixdbehwe3FMkrXR4aR/l3fhbCBdfmrv8FgkvuyuNna8YsfNqhYjN
	cevx8JgxvauDFNbLv7B3iy9xMBMJQsCvGZYK+iG+WGWV5cIbR3YR6B7KnGhLpI8Z
	nlCeQSg8uv5x93AoCUMFZ7m3oFb0HkXHo+y/0s0+KJIqrR2OEAhNWFkW0H3IRlKf
	7gFLRcJn+4K2GsUm9iP6/PxgfaTtC+3yKlKQ8VIuehKT13tI2zYtvbqIVWBiI4Zb
	kii4d5vWqdSyi7wilPTVNrscCHjDnbw7QLOBWgEaml/rzHiRNTfKGVDFVZheo4YW
	tfDWgg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjsj88s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 03:47:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso42389915ad.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 20:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786420038; x=1787024838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud9uue+eAmgOeli/UJM+eu9+5MxvNkXUbo2Xuvjg13k=;
        b=NwDwVWV07wJtxG0B44pINNZ4Uvuk06AGEPuBL0ey2C1WNdXi2QAAzuqAcO7TDi58WT
         IqCBQzR69Q7Zya/40h7aL5TI8LXBP4SGpEpMHlVn9Q9a8bOFHw9/tcqUV5DWNgCNsC2h
         ezCIb+cQgFoAXdGdlqK+M7fXcjljiWgBWDjGJ1GiZB1JlrAq3LediHlfHA3hi1lqnMna
         /CHGZDvNe/CmmEC9R+Jw5Y3gZ73LRwXm3IXGxlLwGvUyTbSjr7q4yLZpuay0oFaoEsWJ
         nri6dLo8hFifwQMnYOuZTQZ9qmU8x0nkAZrn3YwnJhwM8MB49ORzVzwxG2qKU+in2h4+
         GCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420038; x=1787024838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud9uue+eAmgOeli/UJM+eu9+5MxvNkXUbo2Xuvjg13k=;
        b=tXZyqDdzACYOBVPZ5DPdaGkdcSqEeFmgfFn6oHzRlQg2jO1MJ3c/m4T4+wcH2NBGCv
         LISew6FTTn3WDcnlfc6YUupGtdpaCNXzTV0Bda6kw6BPxec2WHaqD5iy0w40Aalyzw4x
         nYbQWvGVjloy0zqyFkuqsm4rIXp7YJueDjvc9IOjvFNyAgT9cRImgrUEknJgs5RXiUMg
         mXRj9fI5z0MigPDkA9dNN8+jHkxi4tpjYVANcoBv/IbEnSXpNNfP/ITqyPFCsaybgZpT
         vEwdqyZtpBvzD7ZQyy8wS1Qz7LpLh8EPUgRC5Ug8q5d71fwNvEBWUrfoxlgLwyMNpSmb
         u6rQ==
X-Forwarded-Encrypted: i=1; AHgh+RrG6jsISxbzfsPbDoYYCirnNnU5ohGUqMoOxZ9iGXNSEPWrVwbLUjsKMHeCCvF1YXEcwSiQmXrKUBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3+z/o46f+5LlLKotJq362ZL0htWEy6SD8HWoB4gb+5Khj4jl
	cByZZqF3LvneXanl+l7ZI64Ki2DWufDubCvWDhk/RCpO+y2WMZVUYl5dQfn75cNPGb87nPqyrEy
	qQHVjKqbDrrNj9j+4itiIWslddLSpbIvOFvkBMDdZtNvytA6xDOx8Ulklhbu+1tw=
X-Gm-Gg: AR+sD13dsKTClgIyFhJtKG6ESyKg6QsvQ0tiCm/g+WGYaDN6aPCpneAW0fYuo6GlUqC
	EFBHpxqibKWFKf+IU/UZipdwFG+qjCYgaUsFH2Mpeajo+aNYNlvZyvhLFqb02al/9xHex+ItXhc
	Fz6O4ln268mUR7J8WUxZ3ZEdSW11JIY8mL4T7S2rKhdSh3Hx/PF29MaBGc2mjEWbRX8HQVOMKT+
	g1N1m1ee8S7XjiGydjf1n8h7D8i/yORkO9LCcHMBXWDwXWlbFUA50uKIlcBeJ2tdEQDUGBSegpn
	maLFEuOKethcQbh5+HrZ7tOWy3EqskfXPzZpQbU4mJRuK7EDEfORlwnK0BrscoSS3+gduWtbGgs
	RR8bEqSOmcX1S2GHJl1WmGyG6Hyll2/J3rwBre3bhDUFiykhAiBn9D0OTcTrGuhmBRiQ9AXHFSL
	5QHJrXBRuVQewtUmRN/FI=
X-Received: by 2002:a17:903:2c0e:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3178f4e77mr6309785ad.16.1786420038255;
        Mon, 10 Aug 2026 20:47:18 -0700 (PDT)
X-Received: by 2002:a17:903:2c0e:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3178f4e77mr6309465ad.16.1786420037844;
        Mon, 10 Aug 2026 20:47:17 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm50674040eec.16.2026.08.10.20.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 20:47:17 -0700 (PDT)
Message-ID: <f7a76790-0e7f-4c4c-bb33-36134a0f3e29@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 09:17:08 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAyOSBTYWx0ZWRfX9Wjaoul5Xmn4
 WyFpL4Q4+FXr4Dny1nyytpP1iXIz9ABT0/qDdC41rnSfVQKvd8v8SEd1wBimzYzU8z9WNmeE3hI
 NXQG/4BZ82Ounv1TSJML0Win0Ixsu6o=
X-Proofpoint-GUID: Ln_tH-9tmLiHEMLKAFpSPpl1Ptr2eHxM
X-Proofpoint-ORIG-GUID: Ln_tH-9tmLiHEMLKAFpSPpl1Ptr2eHxM
X-Authority-Analysis: v=2.4 cv=cfDiaHDM c=1 sm=1 tr=0 ts=6a7a9b47 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=58NiY7KAgNsMs7qA__gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAyOSBTYWx0ZWRfXxFWuznWoRxl3
 X5Wx5wors/8xPixpfUck2UVXVWOeYkuUuX5DUitfUNbDLEBjNN9/gYEvM+prxyF9B4xG5TFGS5w
 mk0/pmitGdNjO5qxseIb+WoZDnfYcONTStsf/+cUR+BRaq1S5tJG0NiOqI+X4MpLrjJuITNR/Tm
 DHm8+/KDP9O02dlhf65uaHUVtVWpm9CZmqWtHLI8ZkbxWi28svNNqsPoqy87LGrztmZO4WpOWDf
 VVBUujS8I+wbcxlp/RyRvxOz7XSafKFnNW8JYRIrVs/pxG/2l3p7A4OB8ni4RPfqYNwULhCUk3m
 VZ3VtyG4KLkJYUSjEZBx/JqS6chtRZowPLOzLxeMFfGRu4SKGHPpRdLd/ntJpryJn6aojhrGP++
 TP4vpfT+BWsx0YGRR4cVZEhUQqJ9IxW14beE6mXg7T1nSJBOmwRcOyIY2EJ091tuCsSEHc6cPyz
 yYGOVe87BqU73dxCWlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110029


On 8/11/2026 6:30 AM, Dmitry Baryshkov wrote:
> On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
>> Add the interconnect provider driver for the Qualcomm Kuno SoC to
>> enable bus bandwidth voting on the platform. This includes the
>> aggre-noc and cnoc-main NoC instances with their associated BCM
>> nodes.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/interconnect/qcom/Kconfig  |  13 +
>>   drivers/interconnect/qcom/Makefile |   2 +
>>   drivers/interconnect/qcom/kuno.c   | 978 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 993 insertions(+)
> Please add QoS settings.
>
Thanks for review.

Kuno's NoC QoS is provisioned by RPMh/boot firmware, the same as its 
SDX75 baseline.

The upstream sdx75 interconnect driver programs no AP-side QoS and only 
issues BCM bandwidth votes; Kuno follows that precedent.

Hence no qcom_icc_qosbox settings and no QoS clocks in the binding — 
matching qcom,sdx75-*.

