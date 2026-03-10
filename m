Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B940DFAA
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149189; cv=none; b=JxtvrJ5k5F9bibk3gfjFFWhqxrXnwqRG66ugcgFMooDz/EjZcp0LhuHe7gn3UXavlqwi+yzVVDawZmSkMjv76gVanMiUVQXkgc7yVpBq3cufQXpKfuosHUUlGOt4DQ17jzFOiYxuv2w7tue0OQEJUu/RzwnWrsrxJF++6z1Tsio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149189; c=relaxed/simple;
	bh=U+HgIi4bJzREOY5i1XwMWYogQDNt8n9oOlbmK5Ejb+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOQpDW409rqKXIr61NC7inWk5X4BeNNorFCY55nIQcgyW89WmDqoII01orACpQp33D6PVNRx2OLJJNNy5h7FagcmDEXt887VheEF13oyGfNIlsRWlSadV1Zl9E5UBU1SVB9bkiQ+J7MqQbV/7LuUMTs5gEJGD1GwyKYY5QLSb84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZsN9zYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXoXl8cA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZsN9zYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXoXl8cA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUMN303861
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=; b=NZsN9zYBKfmBq6k0
	3e4yIzAYCoQJK9NRoN4/f6hpQVMIOyW9zUsz1bxf9r1hhghdEIU9Cbeyseo6RVx9
	U1Z7KpiOtZKg8px/sDrqkbBTrCmDxaaqNoUlD6ZVw7bG1yXx9QwXbN9Ra7PF4KGg
	mzxc3O6+6sND8uCtubLmoHgNtXlxlx2yajoYa70yFXhGgyMi5XNqcWn6iKFVtcMW
	p4oTG/QoXlrAplSXlfy2hGi2ekcjz85UTIrx4b0UJV6Z4qwFGO0O/7fA22hAxwsp
	6PdKXQUvL6u84lrl3G3ULp7uW9srLfHQgSWM77atv1mMlqQhD6ZEyEruyaV+i8kQ
	EhymXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0n7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:26:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50dfd542so872943185a.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149186; x=1773753986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=;
        b=hXoXl8cA1uNx3ank/bG2jzzRRl1nZa3fPtJwMGtDIvsOXg2vUMtMCgEwQ00HKuYd2Q
         VU1OCKG0nEv8w+1nd2kIYbaDvhiL0WQmO4rQSNovAKUSNjDSv8Ec4lEQmwSzRPVyw7ik
         i16OFDLQh4VKJFiU3llk4dM0ZZI5lTPVOJeNwklBlgunIHk1M48+zkxyajSVVjtLRLly
         HKpUN2y9pGc7h2sTStWIICllK582MhM4Xr/HzD8XV4bnTnQRsH7pLRNTHJuA3XKiVC6E
         d3PUjzBDgQorRwgu3vfBNq16Ahnox3ek9msO9BNix7/mw4OmeW+DsKf9aOzRB4wR4Rx4
         ZYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149186; x=1773753986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=;
        b=DaK/DHjgwqcvWshQXcxVaEQP/MfG9XdU0/movCSJ0aaJFrkCSDHi7CCU+zRwjvimIF
         5kgdbCdsWFCw0jU2lExYPzE7ejSpI5Q3ZIRTXrJWFbJFCbCHFeS5AbKWwKEN1ehH9RPq
         tWQn7SYEQrRG80jnwEhH0OwQ/9kMPbyOL37ApmA+BQCk+EbDqQ/B/C4d1chcrOQqmUbt
         OgtIU+DPr/BJH35OQ5X19q0p+s9c5u7EyhIN/SDHYs7KyTak5DNTUYaX7UHSMsZJgwq9
         zj+sTLHL16KID3KpLIlcO0YgxBzZeUKFNAwCRKtjLGXXPVhzlqP40D9cVKqmN65y3GEh
         /zyA==
X-Forwarded-Encrypted: i=1; AJvYcCUAMjGHj8uTHtoQU3t2qLNquy4vibOTlsyacJGqoHVnFd4aRIODVu7m1fdn9AsnJy/pNAW0HTmYk0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL9RGNcq8IlJeugv9ZgVYqXXeNZeBwfMS/9LA0z3F36vECog97
	OgXwHRuHIJqCXBlh8yOJypQElsBw6hGlKGKnE28EtvI+2AdjlXtYZ7h/Pzyy8yY2GKgY6+I3zkc
	u22UiR63Em7+mr9hujdSczoX37tFkLX/yC6VvVxljgURBcLhpD0muAbdfOFiHu4s=
X-Gm-Gg: ATEYQzwRzQ//HrWIBSZVrzeIJ7T1P+KVVqNvwGxUpB/p0aX/ehw6RlUYiY3JTbW/75F
	/wiWEr1Qrh6VfISMRq4iP7dFmF6lmNR93yac9wvRpPjAqZn8XUgIT2PCUywKcB0wPvOgk9z4USg
	CxaVSys155Hxc3f8GgsaSA91kk74dDYbSN1qLHSDvvok011SImQGIvoC8u15B/SPS4MNn452ttH
	boQU5TnK+uKbS44r56JTeZirztuMo5kGh1R+PKtWjPyjIjISzHPmLsjwknS7rSCRya0s8Z9BNCn
	f6fhrtne66DQytTY7phHtySj4BLEGEkmfW4+FDxpFbiviHiNKu8dyQa+0j9Uoz3xT5ZiJT0HaUf
	ondildNGL8cCMdnrsUv1qb7TSi2s6KRNOqGwn8iSq28C+Sm7K8kGdaIehqtRUdGwlNBGDFOAeqd
	6fN4U=
X-Received: by 2002:a05:620a:2955:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cd8411a9c3mr799713985a.3.1773149185705;
        Tue, 10 Mar 2026 06:26:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cd8411a9c3mr799710685a.3.1773149185155;
        Tue, 10 Mar 2026 06:26:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3f5ed41sm4208787a12.14.2026.03.10.06.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:26:23 -0700 (PDT)
Message-ID: <d6609992-e319-4758-a24b-688259b473b4@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:26:20 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: Add support for Fillmore rpmh clocks
To: Aelin Reidel <aelin@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@mainlining.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-4-976d9a6bebe7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-fillmore-clks-v1-4-976d9a6bebe7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n7pcq8c0XpOOutK6UFPVLhkgnE3aFWa0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfX1OHzdfSwIUXg
 LJ36ZjMsXsQdvyZiIdafLJGm3Bfhl9amVXr8B8oqmfmz5qfsbB9zqA2lYpi7mErGN9/Z29InvQP
 YjbpBBsryB6fcN4ZPNJvBv67QztT9JS7rzGh7clkXZxrciYjh56RjF3bOFTDRE8QmencPcHyr2L
 oO28W2gpIFEO+yhuqA5PphawWvU8scdg9b+60h1OYjSeq/XLFt983XG616v4y8gJFE/auurHgFd
 S1oxziH1fAKIvdL0e8knrr0bFlLau/vPfppEoiTezW2gtcdPoq6M50/Tuh7yGKlouVGw9M7sgz7
 mQL3qgm9NnNw1B49DB+0kqVMY0le+0jbEnGs+0kmjFIz1NJxu9JDVxuuUVHYNwnaLYPwBqQqrPa
 +lufFt0S6Axatb7HU4WVCiq+i2PZcd9vF+gXcT4Dz/AIRxldnTGIhna8i/bmPg7ujlIbBaoaf/+
 oIlCWMCp8s1Ja79GK9A==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b01c02 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=PNJmjveSQSdRINGQNJ8A:9 a=QEXdDO2ut3YA:10
 a=KpimXkPlJ-4A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: n7pcq8c0XpOOutK6UFPVLhkgnE3aFWa0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117

On 3/8/26 1:39 AM, Aelin Reidel wrote:
> Add RPMH clock support for the Fillmore SoC to allow enabling/disabling of
> clocks.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
