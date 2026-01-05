Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD832470A
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 04:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767588906; cv=none; b=p5+GG8tpV94/y2cVPWE7LyKiDWgdCQtSL2rsgCC2BaqcpeUT8KnSOJ5UgybMwRazNzWMVgSwWe0kmEbpkrZS33Kcej8O1JA+6Qo2YZ9oQETan7rYuUHdtHL9/kYxI2ZBmM1GwIEfreLt0OsHjjf3+MZGBNZRgEBw3vevcgKx/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767588906; c=relaxed/simple;
	bh=D5+wsa8d6AKmE8SYNa401J10zc1Opslrw81zmIM508M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHkQUofzdNqTy2CdSPl/7ct0unYubgX4CmimjbzvMyarj9eub1YSxJScgzLXP8jbfK6Pa4dlb/zMeAgMKeS28IEhQ+Yca6VlgFHBycHwRUHyB6sS0Si4bLw3KYSYMTCfO1Mbs4bmE+zCFxzcH1MDJp8WSt6ftQS8PEuXqFEZQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BK0alOoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFC8KSRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BK0alOoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFC8KSRa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6052oNRr091780
	for <linux-clk@vger.kernel.org>; Mon, 5 Jan 2026 04:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nm45HE0wSttWHB4PgGIZB5I7jtkr8Gbc6fC1XCjkHhA=; b=BK0alOoOWdTxtjPl
	kW2eYUTSx4H7NwY1htIeUjYYNE3XumbtgSNp1SSOM6TLc4u5OTOeKy+IIRx3wLGy
	BOPVQpzZQBCgX80WccgDNhqFVhz1B3wApbBipa3xYEXKhJZbqgdVa5BJXS4ZslyI
	3PPfe4JBv3N4S80oW3gEICDKENMcMT2WOaZ4t6wi2+a5KmryAndsB/5011Snd4a0
	qLHBT8B0TWbQ23aGkTudioiBcyGxYuxfWDigs3jN6ccK37RBCqy3SXos781yMvPf
	4jyxJ4RnebYY+zGmHKnZwBJHaHVN6UdQlq7ePEDxQ3NeXSySWnB4JS/O+VRFqYkY
	tLU9Fw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v608bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 04:55:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so15292165ad.0
        for <linux-clk@vger.kernel.org>; Sun, 04 Jan 2026 20:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767588903; x=1768193703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nm45HE0wSttWHB4PgGIZB5I7jtkr8Gbc6fC1XCjkHhA=;
        b=gFC8KSRa6QOxLNCr1OaToNrPKCyQboUkDZ8TBgJLG9s9JZAdYW/PTNl5KQWCb0X+4+
         NieJXJnP9u3GjtEN/ofZI07qslUhCKEwGa2dACFzR5Sc9weyicS/KvQSiFCLLW4VMnoP
         /zsO+MVnomMsKgTw22As79N+A5YYq9vNuxWzzM7JWABVZBcwGZCOQeTTM0JChWctle0R
         5cuyHBdIDJpinwRUN1xFkCAeCfsma26U7R0MFGMToahwmoYj+yT7WeOUM0H6sZkMY5MR
         Npref23+OH4d9ausNyP7YeN6cHt5Z8zVq+B6baxaoNDmNA2HfS7JZdVVcP5cEszzb/Cy
         M/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767588903; x=1768193703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nm45HE0wSttWHB4PgGIZB5I7jtkr8Gbc6fC1XCjkHhA=;
        b=cEu0BJTvGl3yiIUdP4ISUjPpW5y8+0ayQDA7k9gnhAKMOCn3hFbvPzYNfJx5Ig6n3K
         YjovSBpCxlVhBtRWnT43W7z3+odwIGAqW97Hr2hLmjF2ePrfN1ETm8koqMexX5TFmUd7
         t+cJd1d4pWzhW1wl4VO/sMw4SVPGQyFSLbQi18z9uhkkMkefISVEe7vQagYcjUagefsX
         T5lZjTUL9QUO9gcrP7ZcsqHAbAxlVTZgMXA/oCstdoBhum4BHc7Fyw4pbvD6e8PPMo6+
         Fe4qsRtEjXghir36uF8H38XZaUjKEoLdICZfI6esW0nR1ga6fVH3HnCChDD9mC9utrv+
         J6+w==
X-Forwarded-Encrypted: i=1; AJvYcCVrEZjAIGgg1gVyHfT1Ok7O8yROufyxbibVFuu5L0NuVxyz3vNkXzgT1u6MedrN9kWGiDpoWuWfqrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvJ3KF3dmlxe+1Yr7+l4lEKImWOxgQrygTiVKpWBGcNfUnanD
	pUQtosLPk1+cbROfExjqAZknPSINveQywlRM64JvL2t0ajK8DNXkk0iqPB9gIpCgNQqYZNc7QZF
	dRQRrM3IrMT6mBZkbZyKAGWA3Kv/FQwbs7evwjMck4LxYqhY7LGY5pLqLssj2tYQ=
X-Gm-Gg: AY/fxX5QMAqk1FuOYbHSoDdNiRGeyqe3tAUG7xoBieYQM4eniIwtYO/wDL4pW844ej7
	FqX/18mGEWJmD20XWsJ6nWj/OUkSnwwotN4c5QuPZ9VKgeEd6sHSpOCoxFjg8Tw3UN93YpESWE/
	m+GCfiePZ2rlXYUiZhq3xYNW6q6oXHZEy80RuVOpF+hju9MIBLDAq4c7u8v9zzd+QZklWTQJ4u6
	4PHNWnL3ogOoaXkTzKKFxALCJx2oQUiCJL8gM1HeVADEWdUbWrb3b7V58m3mILaMbVcLim6rRu/
	adHk0f/r260jzFAUlUVwKY9wHQPazeTThBoSxPRRdl3Mc7TtWrmNkmiuPGmuvdfYG72/gKAecAJ
	wNVROVIFLPG/uUImi6zYuZSSxM729SsWTp3S9t5V9Kg==
X-Received: by 2002:a05:6a20:a104:b0:366:14b0:4b18 with SMTP id adf61e73a8af0-389593bda2fmr5948211637.35.1767588902903;
        Sun, 04 Jan 2026 20:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFacj7culxX1WSh1Rq5jfZxcULqvVOrEjZIp8JekHVlP7djaScfvXdTMwv9fW0VLbjINJOlHQ==
X-Received: by 2002:a05:6a20:a104:b0:366:14b0:4b18 with SMTP id adf61e73a8af0-389593bda2fmr5948184637.35.1767588902398;
        Sun, 04 Jan 2026 20:55:02 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476f8f3fsm4806409a91.5.2026.01.04.20.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 20:55:01 -0800 (PST)
Message-ID: <32f1b476-c3b5-4912-bf60-b24ff67a4320@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 10:24:54 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
 <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
 <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0MyBTYWx0ZWRfX1SumDTXuVAJC
 baNCgdyOwbe/umr3tyygsFxCdI7Lce1tt6PWKLuzDuGvby6QLZn9RY92Ic0MXw4M52VXUzAcuJX
 RAGx4WVlmxV13RpV4OGaOcunsJV1HhvmkmXO+frMiq8jg589PtkWt+1Z4DZBE/6dUwk5iN53UOY
 pN9dTk1dPe9PayXW16mrdS/FsDClSnggk6CgRHyKl2RRE/TX7Id7CBpYkHaYsfdZbt00vZMacEH
 rTpVQt2mIXdxiMEu+KEE932n8+7oQz/o/1CPVUlDoODRxkzd+WDl8lITWQaHLnGNvkBjlwC9ZjX
 7PNJ3hCHmtRwaSzfYoeGyp3gMKA9hg4r4SX78WJL6m125+O2Es/O7Qr2Xdbv7gRR684FAutYHJY
 5bWmI1ZkBT4++xoKPf8Nmp8wPNPqsIL/H0HuXwy1cgW8ti/Kh/06zTy4crEf17/SUQgsY1sBNIh
 pySFcB+PzxSwqMSzx2g==
X-Proofpoint-ORIG-GUID: 5lG-wTEulYoFieMEsYKCrsV6hwCDJf1F
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695b4427 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7th-FYyNm21myA_937sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 5lG-wTEulYoFieMEsYKCrsV6hwCDJf1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050043



On 1/2/2026 7:27 PM, Konrad Dybcio wrote:
> On 1/2/26 2:19 PM, Krishna Chaitanya Chundru wrote:
>>
>> On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
>>> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
>>>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>>>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>>>>> can happen during scenarios such as system suspend and breaks the resume
>>>>>> of PCIe controllers from suspend.
>>>>> Isn't turning the GDSCs off what we want though? At least during system
>>>>> suspend?
>>>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
>>>> so we don't expect them to get off.
>>> Since we seem to be tackling that in parallel, it seems to make sense
>>> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
>>> "off" could be useful for us
>> At least I am not aware of such API where we can tell genpd not to turn off gdsc
>> at runtime if we are keeping the device in D3cold state.
>> But anyway the PCIe gdsc supports Retention, in that case adding this flag here makes
>> more sense as it represents HW.
>> sm8450,sm8650 also had similar problem which are fixed by mani[1].
> Perhaps I should ask for a clarification - is retention superior to
> powering the GDSC off? Does it have any power costs?
>
>>> FWIW I recall I could turn off the GDSCs on at least makena with the old
>>> suspend patches and the controllers would come back to life afterwards
>> In the suspend patches, we are keeping link in D3cold, so turning off gdsc will not have any effect.
> What do you mean by it won't have any effect?
I meant to say that in this case we can turn off the gdsc and it won't 
have any effect in SW. But in non D3cold
case the link will be broken and will become non functional.

- Krishna Chaitanya.
>> But if some reason we skipped D3cold like in S2idle case then gdsc should not be off, in that case
>> in resume PCIe link will be broken.
> Right, obviously
>
> Konrad

