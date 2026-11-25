Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605296;
	b=M+LnQzhRnQyjPnkmOzN0Sef8AQa23RpCVYVSmKDxMvXn3SrdWAwhbCQ22CicS9F9ONmh
	 nxs0RM2WJWTe+y279sh9q94z1J7SXPEXDYHMz8/1Z5fhFiJWVo8bY8V/bA6WcAjifhaBT
	 NomAwr46WoQvcaNFHcr9FY0rdCqzIaz9MDeaujwYqYRuqnzMw768L4ao/yBl8hDXHw2NM
	 ArhgDc6qzyILLO3Z3vLNmP143aQgg6KHB9coeARUubNsglIA0wXR8bS7YOsSh4w98MyFK
	 CfceWQy8EAofKfpVaqZX6AaXNbEjuZMRpBRPouiT90XTk8ujfqbMh75m1QON4c0uK5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
	b=OC1BQ2IZhqADtMM1t74sM7BZ49F1wNDuwy5DSCEMEHjUXsm21dL1in1kFup6CxRT2sXM
	 nB+u2e9eENlWPgci1jstQXdCQXz5qrfwHF1/QJv+gXhOdRO3SzQxqbxYWj8FLNKl+its/
	 /okK3DGKLpjDbiZIgRvkJHXDeSvbbr2kxSGx5L5ZzWp4dZoiv1C90Iu+cjgGlZ0voswrn
	 cN9NBN49ANLCKbOd6y0PYfU8C1kmCl59cvlIkgKLKCS+7/5VMiwGc+VkyaGomWGjXnuV9
	 +aHW/vhxu5EogkzdiAxSPnGLLbAEUZ8DVX2pbbCMKwgCD8zCz75EWf1JLJsCGRj/mbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iw5L/c5L";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BongjRyo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98569606A321
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98569606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iw5L/c5L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BongjRyo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mHW13763956
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=; b=iw5L/c5LEqMKQlxs
	Kt++vdZNGXxSwIk+/wLeTfFOIwc0MYXU5ybGhgbBclLOlG8ydyNqc8EvjixXRsOV
	WpGa9R8sZUzhlzi1oGAaGPDXR2ppX/ZYjYzhqE0pfhKbBf955eJlAMRYqbWKOexN
	AX7Zaj+BMsWQgBWDnnVpueAwL9oA6YbEQaq9AgMkMSL0kKqrGeMFqV7Zp6eZ02YV
	KIPf+s9h5i0qPEg4Wson5+ERDfvMRMVoq3ZmDjeZtQopukHgsRWbA359yuwJ+O0W
	9Be2NJLJXN8XKgQ8xIfzx0TemdYfwfgbTQqn2MMJt9hvoXuZBLTWnpHsXHUgw75S
	u2pU5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rgn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94993a54a73so51359885a.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 03:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605294; x=1796210094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
        b=BongjRyoKMsyr9dR4Hw9a3/5kqY015TcMbMXkhCLD497R/v0oIKkLWBz4wakMU8fcc
         L/cerJEdtswQcsJafKbO7CBPKbnA4rRr5Hyk5GmdSPO9Qu8sGV+lLmQIoH/z2RXnjwGs
         laJn+b04uPrS1zVx6m9Lby5RRLO/r7np4vI75hUU7OFsZjheM+pXQRFhmrMSJRtR90at
         o9ApiRsZ/gXuWXFhrYN+AFt2FhoMRB1AwRlDldpVPlZOlKMC8ouIWhMW+pj9nmbB+tKn
         NFljZqLYma6IQhZ7fWO1Ly3Nzs/9awWFqf4UCGjQTtsS7NQPSUCusOSsQfIQy56F6/66
         ir6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605294; x=1796210094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
        b=GFvLau62yzcBFzJXHdaE2vAqLupAsUyMCPcTH3grMIEAXps1qIGtYWMkTRBl3z1yql
         /N/AhU82iHwSpkjw+IZXVcBplIY0Baap3YA06t+jWkceJ2J+bsxhCRHJKIFVlRaEIJ6W
         OgaZDdIGKwmu8d1LdO6bRy1HBqzC+1Q4ok5NJlAXxKdAp5aMeb1Ptu3zav4YzUACiNKQ
         F2Bsn7tfVKu5kvsqp6a7brA+tVKmm9ldBL8b3RXvtWyHpOH/33JrCIadri/im75BWVGb
         sw7o94OGczijMPYYUADwJXuOd6CfZpuuZykg9bZBhpn6eTDU/oyWpE2lny/BU2252l/f
         1arg==
X-Forwarded-Encrypted: i=1; AL+hErEPq37EuQj+bgT9PVMwUa22WqpynG+6BPj/zY46kuD9mf6vcIDQfN5Ieb4SrOw04qvj3lkmKaExfUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jYTIwDH7DZEMnZhzKLFYefbkgpnaq75gCP3CIsi9N+rTZH3hF
	C/8HqWbOAHfxD82eJ5CHIoyCSjspGRWQJ5DLby8ZtfbxDVabvJ5TX0Toe/UI+Vi7T+/czWc4K8Y
	bZ7aA8psWxB5kCC9VpbKTS6F4F2zlwUbtupo8Ohw0jMVeJ0cOsWEbULlj/bpYkbc=
X-Gm-Gg: AZFdTZcez+QvPYKZKPG7RFVfXKYXAMpz8sj8QevxM2Y4V2sePp/nhfcH9XkIytVtJZz
	5HfbQo8ZGopN0Tm/hM9bbC4uBgqwwzSk0bp7FsPILXdxv5Xo1xuCNEkcpzKFB4cavlXMq7vDqGp
	GbvlRgQIkWbZTaSTW1bFRhoXAy56sRV3/8hUqKX+2tN/xzAiJNzp6UBR75B4jrVM24ZdS0afJa9
	Z3faj9mE3l+iLtldL/2HOshXI/lNc4eblZYUkXlzuOahb5DV64VRY1juz4Yg8F1mi58AZhQz8Ww
	4xZ75/k/xhN1hWu2j5LxmScJqquLjUQTDhcU/uoc6pJp4QqlXVRzY97th6OvHOo0JmxAlMdqXF1
	N13DDELrBuf1st3ijH98X3A9PkGXo4PH+Ok66BkYQ62JqPMnnL+S+hqtxCQhod9ggUqsVLg8=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3334183785a.2.1795605293897;
        Wed, 25 Nov 2026 03:14:53 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3334179885a.2.1795605293467;
        Wed, 25 Nov 2026 03:14:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm617344866b.37.2026.11.25.03.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:14:52 -0800 (PST)
Message-ID: <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:14:49 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
 <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX8f5+ajycgV7m
 OB/WiwlYptpPwEsSw85zpQW/ANnWwglt5NL6m/eo/AWx3X11eoa1q0yuG38LBKtAcUZF7GMsTE6
 OsgP4RvFSm/YIp6l1zatkml2d3tnews=
X-Proofpoint-GUID: 3fml_DVV0mlMO3RKTtsqhDYLMyCZ9xjp
X-Proofpoint-ORIG-GUID: 3fml_DVV0mlMO3RKTtsqhDYLMyCZ9xjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX8GeFE2TAyjEb
 yBRTC/OB+bPn1mo1Oh9OqxOO+ZljbTzX3JO+YWLgTyghwiMs62otX2WL8sPzUjmwX7fAKvm99RQ
 kTzlarzZzFhIeheO5JaGn2hDFDkZxmjh35A+k7+zWsxAaQmJGRbEttIA+ZD87hzvMB0MFFLwlrb
 5YJlnrQytUj/iaUJ2m7FI9x30WlxAq6NqhIelxcSC1dkMMkv+Nw9A9ezczZey0J/3EeV2/7jf/Q
 1LQ60OhV07iJOH8YxJLeWN8ZLTqY3xcddyVZNHB0euU3M9Z72J/u6spl8fW3zmu8zf3YJuwk4Tw
 ZQfxhzQkV5NrkcQQfcVchWQHcBVdtmwgqM3g8R4nfwal1hGyJvlUfHQMPpFEKa/I8f5K0F3Vo1f
 hVFPQ3RSw639ag4oyVhn0krmGXmqdw0Tt0yltkq+vA0GB1dRhb+/63R7kZi6ur0JSHmo50CCWsY
 8JjCzeicxS+fgJtugBw==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06c32e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NWOE7OTWcffpa4NYhI8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250044

On 11/25/26 12:05 PM, Krzysztof Kozlowski wrote:
> On 25/11/2026 12:03, Konrad Dybcio wrote:
>>>
>>> True, not ABI in meaning something agreed between DTS and driver, but
>>> the values are used by bootloader, DTS and the driver, so I would just
>>> leave them as is. I rather care about not growing this for newer platforms.
>>
>> Right, but they are compared against a hardware readout of a
>> well-defined value, not against made-up indices (i.e. these are
>> not bindings). I really don't like this ending up with 2 files
>> doing the same thing.
> 
> Not two files doing the same, but one for legacy and one for new.
> 
> OK, let's drop the bindings, but then what do you put into the drivers?
> Hard-coded values duplicating another hard-coded values from DTS header?

Or we can have the defines live in include/soc/?

Konrad
