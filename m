Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398B3207DE2
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 05:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767331235; cv=none; b=V7aft7JiyvtER6tt4uinkDPHJCEhj1qPmbYWc43eyAn6ZdG+ES3jJEjXNW6YonNku/C0mfaQG4G70/e35CuVXqtF6H2/rSkzDbCO1ERkn7GVUHvgAcj1P1zRfRdsXNlkg0keIrNfs9M2lT44YNI3lyMPfQZRDyG0NafOGe3JAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767331235; c=relaxed/simple;
	bh=f4hGQ47UpNJq5F5Lcn1P1xKWfbTaBDpbZetC/k8f/do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUT1ovm7YGf+gOmFmn7BLX0z7J6Nf8KYhxX/IOSNvqjQTeFmGUw+ktFUptfIB0pvlwqBjJtVFQDULSMZB5I4OOhBipbsj8HYtnky4kz2gPjtb34Mj+qMt/XdN22ewtKDd4pWFkVzNXBacAi3KG7/2fOPfpbvkCgvum5LAXmPgH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUlkaP85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TV4rjwHS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUlkaP85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TV4rjwHS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6020kYxj3645938
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 05:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CwrietwBCd6XILGZbnZOo72+nAmcihmp8D+VVMCOEfQ=; b=DUlkaP85etFhuAIk
	PKvOwFUnaNdCRqzb34PRElHJMVDtr2rTSoTrUCmuoCSf6I1hcbZBP7ErnVdh1BPj
	sRX3dwRuHfUpIsuqU1oeBvcdS81fmLyuz/nkdgMT0LmlGk8p49MQBfzUXuDFJwC0
	mR2eydY8GgCXRDtsLh9nBzUolExXAAmvHHpmb/cCGqWbTWtfTNxYWHE5/gsS929/
	IbfoeK39SVDisFSVkbElIXgStJTlxN20n12CNgezRaN9hRQZbmt3jJbILVIkjYqU
	BaeP6PcGkAdrOYyME82ACSpT6+DuPBzpIWDZJJRrw9Zv6gPjXecm0wYiCPhp0KYE
	0J1y0A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcv4akwj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 05:20:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so20026984b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 21:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767331233; x=1767936033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwrietwBCd6XILGZbnZOo72+nAmcihmp8D+VVMCOEfQ=;
        b=TV4rjwHSRhOGghanRS564pffgzbL2vKYVFOmGj5vbvTj20CLyreZKXQBUeDXoqiqlV
         Mc6WEFsgv/lrIVdZ7zwr2hPQ7mDA/Ceg+QvT611dmqatuO+fRmREsc48P50tTX9uzstW
         dXD5OydQIfLRmS2EOm031KCUrotNFa86HBd1B69p98u1r0GlS6CR3uLB46KTIp2F6FDX
         JeL7Iw3i1dpjdx7jeiYS5KnDm23P+03s+SQ5wDfSMhXz0aEQeMUh6nn1Xt7qTIfiTK/W
         15g+cNKdzkeS/v68j+FpPIHm69Q3tp6sC4+X1TQbOTgP5FmIKSiw+G7t+/pXueQy0Tzf
         /NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767331233; x=1767936033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwrietwBCd6XILGZbnZOo72+nAmcihmp8D+VVMCOEfQ=;
        b=ESlCnTdXzI9tCuaedA1BWCZGoWZh5SLxGKn2VENt5fydmDjA0xa0kRNMZoU5ddRUNT
         I9n8kQPbKN1qsC+YIs+EIulGv5CzTr5BsTrgKPAWbkZz5OPlSE3/OggDOrklCri8C04L
         GEVm7L3NY1AGvUdU5NdVP5OB3LhXL4U+ULc/g/cUB0kBBu7MEg3MqeAcWtm1q1+9kacg
         lqCkh4ODNh5Y8bXRIvkKo/3gHlnQFA0kxrQrcIvQLhD46Hr7UA7XN6GWfu99Izoix5Y8
         tBi0UtW0x6Ws4mw/5eV0BdWTfurnBZO1JRPJf3pECi2zBaCSmZaMCJzr2ncOyQEleMFn
         uSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjXvzenlS96WfkJZZSmJOMMy2Guc++ebwEKSDBJxmvQT7G3fGwqQ2Tj4RXKrEQQ0PKlOAbLlTzg4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJK3e1zWtSCkOP03+sNA3JYSqyCer4DVlNETGpIvY841cj71B3
	OB/fAQwdIBeRWEt++Exv415RsB8VEWZaEEhczNH4mgPKHPMEPpIh8mbjADlsTcly6mrLxubZFIO
	Ui1PAtsNts+NicyfSd97necDh3d+HverC0hgcyn3kwbiVw0p+0x+x9PdDSD7Sm7I=
X-Gm-Gg: AY/fxX5jA8H4UbvMzYNaWcJitAtodS6CJ9MYlKDxxLuvDlLvHIFtm7Boe1j1gUuC5aw
	x4hMup9fhaOC3iE67/cFRUwWwo+aJq0VuUs8a4ZO5WJnxIHZnduHxNWYf40DCbZFH/NRkWVefIh
	U8L0ODI0sngqpP1+mR/D2YdTNuPBjhGJMxzt+STT9QSORoln5tww3HUPuyDqZ9PyiOAWDPJ2o1Q
	JvYmGTrgedePSNCkx3Fs+4ExPGYYLxwvkSdYSipSq5Nq7wBkIJEQwqN28ALjm2D1NOIqD4td9ea
	82oZfi4xg3gIb+ysc882IEHUXs+KGiQVvK2Hwjy3RaOvUuV9Ro8IeYHNX0JLGjt8iI7X8Q8nHng
	MPuF2GXULBQOUlTk8AfPwR+UdO6xx5CjYgHsT+g==
X-Received: by 2002:a05:6a00:e17:b0:7e8:43f5:bd10 with SMTP id d2e1a72fcca58-7ff66f56e6bmr36361936b3a.37.1767331232702;
        Thu, 01 Jan 2026 21:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHly042OPH62DQ7IOKOg1h08XaygrNSYVqJrBUKru2ednBgpEw3G/r7nv3uLUyM1eLyYp388g==
X-Received: by 2002:a05:6a00:e17:b0:7e8:43f5:bd10 with SMTP id d2e1a72fcca58-7ff66f56e6bmr36361917b3a.37.1767331232213;
        Thu, 01 Jan 2026 21:20:32 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423b9asm39686179b3a.28.2026.01.01.21.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 21:20:31 -0800 (PST)
Message-ID: <d9a8dc0a-c0ee-4295-a4bc-ac19cc393a43@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 10:50:25 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol mux
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
 <o3jixtcjqbk3i756vy7umb45euu5ofpg4yv2za452xcje5shfa@qgzqnqslxctj>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <o3jixtcjqbk3i756vy7umb45euu5ofpg4yv2za452xcje5shfa@qgzqnqslxctj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zg-eLgS9engwOkohzXaH9CQBtTpzlFBj
X-Authority-Analysis: v=2.4 cv=Ps6ergM3 c=1 sm=1 tr=0 ts=695755a1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ftnYuWSyrbdvrsdxi-EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA0NyBTYWx0ZWRfX5v1jr4YuD8vJ
 QoD9/mmgvwmGRIgAsyaskyXLyIEkByt7VAtVpjyOgA9ExfTsT5XlGf+TFfJWobnlVfauSJ8Fjt2
 n0yf2iMi0z+HyXYApTiOjGMK1OzRFNemLZ+gUiXVUSnInQEe3OlneguJ5vJR1C643SB3MKQjvFe
 /KJDE7UDEAdFZZnOBgzsPUBLGWwsIE/jzOe2eIykjjD0ROe2xPzHObIxr1CNl75uH3vra73y9SO
 l48E3gXa3i7U+pomQBAKOEDAQYjTGSAkXNIskKtnkuvtBCga/tIGz1QA5Z+3pTtNEawWxjuPp9p
 D4Z41c7FyYbbyQGYEp//wJj+1pQMLIuKMfu5Lzndaun4abD3BZNwVtAchQ9z7Xf10st+Bw5k1ss
 Gy1VbkaVRVZmqrzqZW8nz387X7ZQEZAl7jMnNcJxBMz+pT3WLV+NyJtMhXiZQEi8/iP+oVzqkdg
 MplZDE6C9YHm6Td/Z9A==
X-Proofpoint-GUID: zg-eLgS9engwOkohzXaH9CQBtTpzlFBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020047



On 12/30/2025 11:39 PM, Dmitry Baryshkov wrote:
>>  };
>>  
>> +static const struct parent_map gcc_parent_map_37[] = {
>> +	{ P_UFS_PHY_RX_SYMBOL_0_CLK, 0 },
>> +	{ P_BI_TCXO, 2 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_37[] = {
>> +	{ .index = DT_UFS_PHY_RX_SYMBOL_0_CLK },
>> +	{ .index = DT_BI_TCXO },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_38[] = {
>> +	{ P_UFS_PHY_RX_SYMBOL_1_CLK, 0 },
>> +	{ P_BI_TCXO, 2 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_38[] = {
>> +	{ .index = DT_UFS_PHY_RX_SYMBOL_1_CLK },
>> +	{ .index = DT_BI_TCXO },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_39[] = {
>> +	{ P_UFS_PHY_TX_SYMBOL_0_CLK, 0 },
>> +	{ P_BI_TCXO, 2 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_39[] = {
>> +	{ .index = DT_UFS_PHY_TX_SYMBOL_0_CLK },
>> +	{ .index = DT_BI_TCXO },
>> +};
> And all of these parent maps and parent data are unused.

Sure, I will remove them in the next patch.

-- 
Thanks,
Taniya Das

