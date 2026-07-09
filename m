Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00B83F9A16
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598419; cv=none; b=rCi5UbbR6FXcwEKVeeLPAumoLizMDGNIXM16DsLjqHRfKffyhc6QfiCGcuTRuZEi/mdHbuFcOYf3f0EUaWCuYHnYlbHCcbMfrKegT+z/hd3Z4zy2kkZRuG5sz2oCvJrDuNdKjWevmVPfKL9WIZN+iNaBkWelPYlXJW7oedPPTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598419; c=relaxed/simple;
	bh=Fqy9N5XcnM5H+GhfkYovZ70jYQ2D5WnWKy7vsBFwWx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeWUqwJRg1Q37N3CxJTbEbDlsNtWlXSHLkpm0kuMmzqqUgrwcWh2pBSH+NDVCMCheFMCEnksIs70fSrxxkv4xeuh9/7QeDLoJpl6dU6fyK/HkoH87Odz7Oc0d2vqTmfNHuelnHkwc08gWV+NdOjOlGcOOq8jfklhkq1RrMHNJr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EE+m97Gc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV3E8pSQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EE+m97Gc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV3E8pSQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNqVQ1673836
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 12:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIfOtZbZMrMEoS2OviVK9Y4/CgDoqO5R7WiKMYF1faE=; b=EE+m97GccjqkrB7p
	GhDSgb/jK0FjMLAMWVpctqFk35ljik7U/l0KauDjVNxczmKjMR+xiK2/YJRltCgJ
	1xX6wN5oV9whD9Zb6g0rC34mH7uOo9ij7hlZG84M9H4cH/+5xaTcUafLmKMXZ+23
	m+FXKpBLHNzrp6JRAI0nX41JEJlYzJsu5Q7UcpnHRYXILDqjJwhfstpN+JSX3IhH
	XYpAW8IriATc3HiRc/x2ohynbiueti+E4PCvMGZC3GvJlJeWGKrqbo/RUJ7h8f2/
	KaF0TTc5Y1Njw2Ckkli0xQ0EgcII28T/iXwNf2UFqgBjOJisovBhVcnsxRGkPe2L
	+DOVEA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsc3ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 12:00:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso7815591cf.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 05:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598414; x=1784203214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIfOtZbZMrMEoS2OviVK9Y4/CgDoqO5R7WiKMYF1faE=;
        b=GV3E8pSQhHPR7zhO2QrY+q9cRVevt0L52YS53r4hqfnnwIdx2Lgh3W9l4Y419/2TkI
         G3zflpJVIMW8aWRhUQKJoZNrcWlm8M/EJpxkgZxyGQ4jsef4pYTbbWwqy1k4XnAcZKZI
         2yTdj5W9RIIopJYqVDSOLekksgnX85aKJ5JInPht0KdrdYEKd0ZIDDpGgR40dNeLjygM
         Cfk2E7GXIubBYjZSoTVQSpeToVDnT20lMA2Hf9yQ7GOfly20342SpkRK/Mbp6lA4XRu+
         zB2P5yELGb7q9IpiBeRGOIaW+iEvHSBsYwDDhFq3Tdxqx8UoBsIzE1G2bMCq97ZlLsMu
         5cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598414; x=1784203214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIfOtZbZMrMEoS2OviVK9Y4/CgDoqO5R7WiKMYF1faE=;
        b=ZdeHJWCzBEEY6vZkXwm8RK2xXPzbCCR7vF1yMJNXDliU8CmfSsFn7NTez5cFK5a5Bf
         kRvThLbKAvOrP938p73FjfLPbjujWnSBYW+h7WL/UAwBbt+kilygCHC+9z2L+LSgfkcK
         RzpKgMd03Ps6HZ1iotW9RS1mJGjvU+jzEtHfe70zK+Kc96k33PqT9pnVoaaJZpy1NFFh
         B31ayJpFD1Gw7o7xYMJjgoK8jNVsbkmug340HW5M87xQ0AxLFZIxwE5LM0jiz+2iVBne
         cErt/ifJeyKOiBe/FJ6a6rtUyUdV000dwGoOrstQ4XkAGgnAPBX9RhZR8+KBfbUshvPL
         a6ng==
X-Forwarded-Encrypted: i=1; AHgh+RotNrFUbAQCyrcMsnGNunl35MdhsgpLszarl7EI7D1LZWK78zq1Y1c/eR+csUaKJzi7YeE70gcHgFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr3kRjbTLRZYNoY1IfV4erNGyE+IkeNsO0kmSE3J9LvRsLstTO
	ZD/t+ITbC73RYF0Mi5F9Tp5M7K7tyKmfGr8Ifz67X0mDoK9JDVukqDzqiZWz8Ajphq6HpbT+1My
	TCCgdh7FTgCTFIT1hYOs9ZvC/CGaqqN3ufSwNnDyPRzzKPl+PwGGEMpXqA8XGIRQ=
X-Gm-Gg: AfdE7cmVTib7JACqZwbLxNgY9YNnGb631X0gwIpqcz2VVnX/W1vOxvrua9EhQzNYI7a
	8igJVF/0BvY4U5reGkmbykYt5KuVzwcU5Lf4yXH9Qnh4tD/meZ0EqfUy1j2CP8I+w2WG1D+iphI
	RI1PruzUbg1ubHl/9k86Dh/K+c7oM9YRwgwkPDxJn/VwphtxAqjEv4yhpqjMURyA4pbvnnhXaqp
	yx4xgKDTxgrSCf6hmkkbCSx0adqDT5p3EK4UL/73YHzRxxKUHCQO+8YWcDywtA7T2/RSIs8O57R
	kUvYzfnm3ZnQZO6wzsEsg/o7bidxZojmOsRK35NZw6hQVfWjXVrlpHdNOlB8z5Pa7wuYZxS47lR
	UCtcY6MF3aaBQTfZrW/3GJoLrbfHC3YTyVCU=
X-Received: by 2002:ac8:5a4e:0:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c967b4132mr30171311cf.6.1783598413726;
        Thu, 09 Jul 2026 05:00:13 -0700 (PDT)
X-Received: by 2002:ac8:5a4e:0:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c967b4132mr30170781cf.6.1783598413095;
        Thu, 09 Jul 2026 05:00:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821ae3sm464086766b.5.2026.07.09.05.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:00:12 -0700 (PDT)
Message-ID: <8db91103-fda4-4b24-a88d-a2901968e0d9@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX15p7LWpS8lhT
 oEqpqvJi2ywD85KhQmPeptwlLPksYGtDYIcn4PTDItRyWziZAw5jqYkT4aPBhVscN861/sUqX4S
 IlW9eF2PWbynKiEJ1yq35C08CVkGGhI=
X-Proofpoint-GUID: 3I3Tj2HNHtMBw8_Mp29gROlN7CM3x9uz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfXyjqIdCxQFnLI
 DUrfzgHl2bOArwjqEFNeLDLvvhHCVz/IOB5W+Iq6nG0JNeoCT9ZKq1ZeYIArklsq1qC/qNWXyvN
 5Ejbb1TNjnqEgSkKBiGQc4YHaO2MGmJ4BMJ1Vs1QT1m6mVAPRKQgPBQEDgKodVqEpy62OA3L3rs
 BzW0aO2fJNg0fTHhY7tCm7ZRSp1FHTq4WDD5SWF34AzUqVAqXMM1G+r0N4bhyRQLqrmzFZBCg7M
 z5kMnGJg+cd3+ff9n8PGR8DK4xHWjEyyoKhPOOhImwP3ver5F4XNw3vugknlwmy6rPRg5sl+D7N
 ucOGeVDHdcY8vNb+lxr1GZivOnleudHnj87ZquN7Qmv6tw+9Zh1u7cfbyHfxdr73+v5YI3GuzHb
 HLM59W2IMylk00SqxtP8OvvvvtJOVbYbI1hgeSYsnVJU1gHDpCbHygW7qHX4NxKoyKMebWqhFjg
 4XiC4vkKBOaSnImWNVA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f8d4e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TegkrtGQps0JBSonG1sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3I3Tj2HNHtMBw8_Mp29gROlN7CM3x9uz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090115

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) and Audio Core
> CSR resets on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
