Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB873DC4B6
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603154; cv=none; b=Qg1/iaeciQpikVh2kj/6cDIcXmxC4U4dnwSdF/tk+5EQhq60e85fB4Ab4Fr+InDYcV2muqSPQsS+AlDiUwuKD0RIDf7NA/QgyEWW4/J9X4DZDfUQVHIj5AAvvhLkO42fdd0VtzZ8BDhF/R5pmaxo02WGgGgVlR2D+kaFaUKgWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603154; c=relaxed/simple;
	bh=xXX6viTTK4rT+ZYOh0YjJH5pssE8usT9kMlI3qREXKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTpEtndql2oH8ONyQZdPDGryIKC0KVqZlA2Zcfb3yPSZjFua/GmCZ65+2lgt3M6dYKFEbn91HY0ZHKODxB28FpZLdGvL+NC4RPbF++12KzGsDgj81YMOQGhgi/hjGmw3uHOQaVH+wLKZ9obPOnlDOsj0qHyoRaixnpetJG8eviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6HT+idO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP844j74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6HT+idO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP844j74"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vqde298575
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 09:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=; b=M6HT+idORQ04IMt3
	269W5hBiYbrTuYY6bJkV7cXYBNGp4ZiLvnf1zPQ6vxmqz5MLoN2HWEw5EsbnbxqT
	oNYMPjD7dDx6+dPX0nivQixL9AMn73OvvfqE5+KvnrP1FgxRqh6LHTSGNNo5afAk
	Qth5n6YDaHTS4rwZCd+ulTL9624A45lClb0fNtSrBvLEEVgA99g4JMx/hVbBGZyR
	uof+ENbHxetLIBn/vYpI6Kdr+U/W3tnqQK1YPZg/I2Y7NzW7iHwTRXpi/PaoRZBx
	n+TqFiszV/+4BW/cJtwGZ7DTf36bG0vQoiQn4LznKcJi0/w5hH+YN5+HWHEEPcoG
	t+Ai4g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tecp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 09:19:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ccf10567dso8199726d6.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774603147; x=1775207947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=;
        b=kP844j74KQst6iVXFiTsD06A4p4+C597LHqHrHGajNC1bEJkPXBenypqsG65+Zx5KS
         p4bXxfR0S/iBC27N+IoC7E2Gfv+0pvZciatRGZSEbmz53uyOBiAaw7ba/4s7v61KnO7x
         ABkD884ZVPKE+zLV9TC6ikM/RO0+qHbvu+xTRMq6XT9tTJYKzFVZd2d4FyVNx/iW1JFN
         6HvHs2jmLalv5brt1C7LiKaI2vcKoUPrc9hvz0pRYH4PtQXpAdU6Ibf6WTT45mxLxCfO
         S1QMtxoaMBmfC4mXcCJEt5QK61McpjU7lwBATgyWkW6BkyRgkP23jN8rVViAgV2NfyGP
         w+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603147; x=1775207947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=;
        b=YMX9+3GtJtxb91OG7hSEby0xmjePw936uSAdj6xA64+gnWpRUimj1Ex5IJxxB11srJ
         PumS/llVugZNDWxIwMtlPqIARxEVhTRQ53gt3I/z+ny3s9SR1c0N+QBiK7MhwHckKWH4
         /8r5hbZ6MNTn3fQ7tXfektdGkePR99cjOsgsz9Gf5enf/CHqhayH4BvrVPyqs45/1WwK
         CJGrzwkfb/O5x9728S15GN+OOZqAXem5Go7TQTBteAemAGuJab2t4V1QGGgVzjNMnhol
         KF2xUmcN7sz9qSt8924tNH39bMs48PqO0KLMXX0ZrueoIKYd8AoNdoC+xqURgYBGKBnO
         pkAw==
X-Forwarded-Encrypted: i=1; AJvYcCVoOUAPi30tTErtdP1BeNEUYHo6Mwaai1ZTskrRBRxxBq20Hn8/KKadxBgGQ/PfGooYV+zgEHOYfas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHj2S1Mnve158TChqXej5UGUinO6RTPtj/ZV8weYpRkraFrHxU
	ksliCZMauQ2/jZTsOEcJiNqmvniREv4NXg6gqAlu2NqebxRpUHj1fi8ewqbqep82h+8kkRINUHM
	ASF0ug2fK497ESYIewpOlfU4p6lH87b6KgPMvJD3GLUMtXZ5eZ7mXSyBBRvn5B58=
X-Gm-Gg: ATEYQzxlWkUe+D6VJbutfZ3BkO0L+4pipweoZGsnBghEXZZiMxnQI24dhR3CmZdmJro
	0XqYrZdj2wW1l+d5Cf9hNajUnzMkgxUJHgEK2H50I+H0TMeWWsKlYeHaDpYArgM0uXyfXvFbeRu
	tL4gV8tniPvJtvuhVcl5wv+0BNRh8Ki4SUpZNfqnChqX2TSdlwF33jFa34Lyl6yng2RISwQKt2d
	feCGtHX4UWWcZKzxFT6H0zG1dJWnNOfUkL2QEtgXkdZcEnMDLjFRIGw3XUoiUunqaDabpgCGYye
	F1glF5n1jnPAmzuQBhFNxEauBAXMDMJS+OzirmgNSMZx6r16VOW9Fm1y12bT20tBK+Ieg4NuWUS
	lBGaqoxLclz2q4yi28ji31PDVesVHxz8HAdZXgrnE4hl0y2igNHzzOgPNQgQnLgCogIIs0SsEOc
	r3CY0=
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr15161796d6.5.1774603146751;
        Fri, 27 Mar 2026 02:19:06 -0700 (PDT)
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr15161476d6.5.1774603146205;
        Fri, 27 Mar 2026 02:19:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663a3sm217738266b.25.2026.03.27.02.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:19:04 -0700 (PDT)
Message-ID: <5f054c57-edec-4847-84d8-f0c769f917cf@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260326184126.9280-1-nathbappai@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326184126.9280-1-nathbappai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2OCBTYWx0ZWRfXwgHSAKTrSuS6
 eXU8nWmu+QygOpSTbqI5LgQSFF1xwAZEYRj59DqfYPFkNypHjx2DkleQufoUAm1d9ZMwMiGPDgy
 CXtejyYpWkH1LrgWEoJRN9mEv6FGQPKz/7rSoASQvsCFWDa4YEKMroQ7+N5Baix9HoTBTK4ABX5
 AWtp1flN0pBVMR4LFeR5DMVZWXZLmNs9IBrGpMn/pv/ADqwvNA3TPCwUhmQWZJvnQfxTfNZBG6/
 M/xdAACGttg330p7mQljbp76m3G2VTz7Pv/CcbL2ih2FHaGhPhqv9rPsUWVnpdmO9RhY9AsD33K
 uMDmkVoO1x69Bd7TAARBJZ5B7sAsNXCaCg1WfMmZQKUcjkElki16p4Yopg2dVXlxis9RODsN6AG
 GfiLLR0qdEpPqN9c45ao5NX7zzpTTxXSHR/e7q5yn3JmgqovteZBN1s8u0jSmmFiEUtcXtTA/xK
 Pnp4wiTMv+xNSoAoDpg==
X-Proofpoint-ORIG-GUID: khQfXXPVIKvQw4i3buBHM9h9swi2CplG
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c64b8b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PhFLAuRYng8QIqNMAF0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: khQfXXPVIKvQw4i3buBHM9h9swi2CplG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270068

On 3/26/26 7:41 PM, Biswapriyo Nath wrote:
> On Thu, 26 Mar 2026 10:29:49 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> The IR transmitting LED is connected to SPI8 controller.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&spi8 {
>>> +	status = "okay";
>>> +
>>> +	irled@1 {
>>> +		compatible = "ir-spi-led";
>>> +		reg = <1>;
>>> +
>>> +		duty-cycle = /bits/ 8 <30>;
>>> +		spi-max-frequency = <1000000>;
>>
>> I see the binding allows a power-supply handle - do you need one?
>>
>> Konrad
>>
> 
> I have tested the IR transmitter with my TV and set-top box both.
> power-supply is not required and not mentioned in Android devicetree.

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
