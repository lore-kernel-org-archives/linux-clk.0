Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78CD17A305
	for <linux-clk@vger.kernel.org>; Sat, 31 May 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748689296; cv=none; b=PI7/wS6IUfAUoZYpOMkxsYUhaVySMJ7caSPRYEgq95OZbR6PvTZ4eshOpvk2ZmhWghynEtePDG2aDpPaEgmXY+pjKNuOmHfcwtso1bXWGp2x50ADhCYuqHtwE3qmHUXsm8XmgSvJMXmIc62btfH2V86TNLitccg3c0jB7mG0asY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748689296; c=relaxed/simple;
	bh=9jUhyhtYh/WjEsg9JLIeVwHyR1TB8Sf2degZczTD/RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCHnl+pQ3w8ksKRcKtqqOb2W6EBO7MhfAEwjFv0QmPWVz5J0cmBsaIx0AYbhQceq/DwXeAAASO0L4VCPxhRUR925gcCb6Rmcf6RElBQx6X6Hpkvf2AbN8bx2Zy6wyRTXeNs3LsrZnEZZ22C1P+I4a4kiRBKywsCdjy5bA5J51Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0Wy1B28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0Wy1B28"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V6OT9x001263
	for <linux-clk@vger.kernel.org>; Sat, 31 May 2025 11:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeCiqHx1yrJeitABKFiq1doyQJ7MQ/DROi2v0A5OQEI=; b=H0Wy1B284eB/s2xw
	c+so37/X8FLl+d3vwwquG+v9bcjW5Zu9RWRlLyhhsKKp2ycgECXcRHcpk97//H9y
	qnVoCka/767PcbW2hP/X6xGLX1xqVLwwzHf4A1KhP00Yq0el9THas4gm1KdkQv7p
	dgzsqpgiXw2YMnpB7HBRictwXTLBRM9o6G5PiPG77VgaQjBxgOQ5gwSP6Z9F6fSt
	sLTSncd5RRFmCVK68P1SzuF8E3txzzDnidy6EOetycO4v76r3q8q2hjm3kAvF+kv
	W8+P200zSxjXOxI3Lhu82z0jePcpqnZ+PhefNjHrw2BwT4u9HYC5wIbfFDQIClQZ
	Gcz4Jw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytxm0few-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 31 May 2025 11:01:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso62640285a.2
        for <linux-clk@vger.kernel.org>; Sat, 31 May 2025 04:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748689285; x=1749294085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeCiqHx1yrJeitABKFiq1doyQJ7MQ/DROi2v0A5OQEI=;
        b=fV6nEuuuEQFlfIEwvYhaSy1HtaCQ/moWBmwV2/wpUeYqiG15K8eLsxZgdzBoC+6Isv
         ld1dZ6qJi8D1bPp7LooXg94HqDOtQoop0xsAGlA767Ln9nY9bzQfpRjOkVCWtvFhWYYY
         2gaUm9pYvYj6tMFtjyZPBg3BpCdTEPSNh5NTvTDVN9hZoprMBwqOZJdducknhamJ+AIV
         YnNihYFOYuiWF0/EL6ahPNYMsAuawggSdDcxZ5j8cKFnk0Y8W88m8rQ6whBzOQcgztmT
         wBCc0+lPCq/V/4PvB0NsvPtlfHChVuuREPRkg6WR3dh6f+iWA5ZtYTBjWEgX05km+thp
         kfcg==
X-Forwarded-Encrypted: i=1; AJvYcCW/RKZgnx8qWzcW79yKz1x5faHsxiTrqr6ddsbPIcP5AVx0vbUSrPfAZs8xkxGzdiHYBITuJeUdGaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjwPTxQ6DY0ctzKecoYsyup4K1D05SMeskLydXyQorYwip6WSJ
	BrYr2Oa2Vab/ShIGGspHfdyGh2uvg7DamEV3afeNiN4pH4DROQl6TUPKib6bCtdwqBVWuSmMIrJ
	yzCggLx0q3IC2R6u4HEQq5QZVLDmrQAMDULZibKcKKjBOR2yiY11XJrLOEYtrqyY=
X-Gm-Gg: ASbGncsUlwdx3pwxDzvuXyCOtr5JDPIgMMPeKj6xE0L+AogS4k09XdRWQnRQfYFIlpB
	aVDyIbJjdTu5sDybhVBrtKKomgDN1ebPoFaFaJ9+v/mXll385QZXh5Ov+gTXVYh2vrq++fk7wsB
	vmrMiU09Ni1U7XBP/eiWSq6+HGvoiD7NtV+2GGVaPzma7hr2DEf7dvqaRnl9T/SDdUbLJaPNZlh
	zOlKbfgWmSRWTjQUG/1jUnLcqYBaodZvRiXYbHwgEyzX8aLItTsqHGloNvqMXHLQsOXNhXiD4KB
	InX3TXlUSXJOc4FmhcZcHJFfxpEpRSHrVewBMN5ZuGDwQebjukLgkycRFzOtAf2T3g==
X-Received: by 2002:a05:620a:600b:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d0a3d9e14amr283127885a.7.1748689285468;
        Sat, 31 May 2025 04:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPhz34bJwNdP2FlxXdeGr04uffjVcOkUPbyMNe8pUCP22/47kesOrRkNv+OJ5Cac778GzJ5Q==
X-Received: by 2002:a05:620a:600b:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d0a3d9e14amr283126085a.7.1748689285050;
        Sat, 31 May 2025 04:01:25 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c2abb4sm3098010a12.13.2025.05.31.04.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 04:01:24 -0700 (PDT)
Message-ID: <171f207c-85dc-4610-aa1f-9c986f7004f6@oss.qualcomm.com>
Date: Sat, 31 May 2025 13:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: ipq5018: Add MDIO buses
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
 <20250528-ipq5018-ge-phy-v2-4-dd063674c71c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-4-dd063674c71c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jTaYhdKDjS5Eo37vUj_D5PCE2PHeN3nY
X-Proofpoint-ORIG-GUID: jTaYhdKDjS5Eo37vUj_D5PCE2PHeN3nY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDA5OCBTYWx0ZWRfX2KSXaQutizct
 SPw75PlywXT5QzN/n7qQWFaFSgHC4CxRTcayg1F6Qi4+KTvmKxSCaLrOphBuru//fR9IGaso54M
 Am02vYUbVRIf6lSgF+QvYfGJG7Xl+rTuVwNHq68FZTqzB4MHWmKR6+vNraCnJyHbbaZo+bLTcm1
 Y0c4+18jDp0JTWHOvI+eJoLCOfi9rZJ9EWVy6lr0XCerYaYeTBa7NsDcq413f2jbB2T7pV1xhJG
 B9m7FYXAJx7BF7eNgUMqQxYjpYqIS3y3fxtG8DrEwb5F6gM/JSWIjhUA30sHJA/8+uOVs+prlxa
 yk6i+HoFgZhROBqhXaiI9RgMGxB6fsK2jKQq56UyWeLR3m2a9PiNMsF5CfQrMeigKLDO5ej7LwM
 3S/RHXL68K/mCiwnxCJPcvnqSwtA269uu5j29+igA3+AKmAhUClGgYGhM8t1A5odvM8o7Epn
X-Authority-Analysis: v=2.4 cv=XdKJzJ55 c=1 sm=1 tr=0 ts=683ae186 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=WGRY1n-6GeFXo4cNehYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=731 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310098

On 5/28/25 4:45 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> IPQ5018 contains two mdio buses of which one bus is used to control the
> SoC's internal GE PHY, while the other bus is connected to external PHYs
> or switches.
> 
> There's already support for IPQ5018 in the mdio-ipq4019 driver, so let's
> simply add the mdio nodes for them.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
