Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681402;
	b=TQMjt4zcL9Ef1qiSySK9DnXSjHErpTfk+Z9ljy13sYdw21HqonAMHaxrNuSwU3/vz2Wc
	 3pVyiDKexcESUtWkbpHK+/2ShOBjAtIvUDUA3QZ2/7I8URgAb5WkynmiybPcWzYV4l9Z8
	 9TJI5GFaZidEjy32n7ljiYNg3ct552T9GPp4we04CKj0aLYv1Jo3N2Q2GanXWavBEATDQ
	 JxPVG/BnG24dh9fDIyPUDylpdSNrNBFH/lD8MBF7YkbTDdLoU0TofW94BftRglcoUxK34
	 iZ85wBG9hDU+osQMkbBKv9n4r+s1Z0HMgtxrbxZ1McHGvFLSzeU0cnrksk4Zc/t0J0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681402;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tH/+MBhuiw3D5Zdz3N6jBPXU8WuEvVNekZN6NdyzH8c=;
	b=5TM3FfBMm+AzQZXYIqQ1UmrA3ZgRgeyOym7ZejTR31z4VNde+QXBKP4OERATwgwravLN
	 HU2AbgH6lStVIFUhRqVxoLLJpW1al84DtyYi6MeH1AKJkrsHxL8xCCuI0L+aRc34lCgTV
	 0p4LJcvksOuSK0eUuaAbi1EiNXFV3zPHijwJ8P9KILC5568wgOkBZVD1gufFWRqpR/JU5
	 knR0RCCaM4Nwg2tRdxbcXTDHMWhypIP1SYk6plDxvPEGHhvINI4NfMhAXeFUu3OK/mQWc
	 0r6BYbLO9MfAXC9Q6ZbHeuSuGqmtgyc+zL3W6zbQ39wKMGe9KBzxjQtOGQSd8l2MAcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3bUK+6t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UJBjv32C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06B4606A33A
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06B4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3bUK+6t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UJBjv32C
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2YU2335130
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH/+MBhuiw3D5Zdz3N6jBPXU8WuEvVNekZN6NdyzH8c=; b=i3bUK+6t+/04AVPC
	QXv4ld8lL2RRmNgo3KqbiYvGOKN+58FXuQvpv5l+UA5BOVvzwJalJXnDw9Zx2bdJ
	Kkr1xH6Kg6L4fZzWpdKaZ6X1Qxih++ADebX9ngAGhopG3kQURXvGnZVaxh1Pr4yE
	WMSjeXcy7YSLHjX4H+64CT0eZrChkz/lf6NUs4eEPRY1QgV4vl/xKTaGncClAYfO
	I03axZQAhR2afs4BgcWU30Xb37frvfW3XLR5V46EOmXV5mIP5FU2KwzduQjCYYqY
	1OLmmaOrr05gBt4rqPizXUdycvkpPSMdGJ2pI9zO7dy+yl7Y46+JgvPvXOgp1V0A
	07wLqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak01b02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:23:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso55878585a.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 00:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681400; x=1796286200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH/+MBhuiw3D5Zdz3N6jBPXU8WuEvVNekZN6NdyzH8c=;
        b=UJBjv32CwW+vE50WrXVLjnURVzzuCT71ok2XW64NaJcq9de+PtxKPdLOIhpqBDPgRq
         wg0gTGY7ZfKtZ9afpp+XELQFcpN2Y+kQE9JwSPZWyVBR9qQoTbEoJmvIVuF6ZQ6XNuOm
         ulWWJc8O+n0dcuYpOqiKQaTUn+x0ng237TidNpgWC12VslWL+wSMMrISl5qy3ghRQh1z
         o1/pn16venOnZYPDXrfN6ZfuO5urYDfgXyfqASeyxQ+18HomQFLsG5io+0KNQwqmlizN
         rmljcgqU2QI+4SJK0+oQMo+yajULP4CtfFOQgvhmU19HpMiTPkeUsU+trT6ixjhetuoD
         zmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681400; x=1796286200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH/+MBhuiw3D5Zdz3N6jBPXU8WuEvVNekZN6NdyzH8c=;
        b=w4oyVez2PI3UQyQCIM55F33+TbxX81FHqLjXwNfzTnPuyz++KUogdRjn7Nz/F4wKi4
         3fPH78xHdoRwq6D2BYN9H3yqRbUr+RsXlreJhg4Qae9gEkDCk5d1V9KqwGJ0ChNbs2rg
         drZZeg6p6HqiSPZcBUUI5PCDFueH0SOZPerQG/kdxyCh3kEBQw/JwJfByXJNISy43PvK
         Q8OWK+JxhovF3j45Nk41m5aWVlN6uyL46kmp7WHBTKjnZKXd80X45fFuZ+OxY5x10a6D
         3qPNdRlnvxCm6oZw7belWWAArmUITvDG0b0DVFuEOwK94LLOMKKcJ/2jo7eA+kgrrB7V
         UBrg==
X-Forwarded-Encrypted: i=1; AL+hErEGkxDZH8xaQftsbu7El23akbnexqY3C1hzBPMn0TjWfrChE9G0aUjoU7EemNPERRg+6i2GsTPO95w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pDSydepT/Ez7pttZ/NW7DEjw9wEgxNnJDAAuh2r5qvr3KcITt
	dGSjPgUs1sk75nsZ2U7VGGlvC7uXs2+c9Q1eU2qt0TaQgKkNZXGUHQFqTpEx8Ztq4LkK5pDxLlZ
	4xOO27x06ZHsF27+thvKdS+u+lipl0HuAsFgQUQgsu8udRPyzIDq2BwKMjOohXu0=
X-Gm-Gg: AZFdTZdQxwcXw8+3uEHR5LzRltzKkEKF+5xq7f8xFibt7RulC3ABqCfrHTDjsRcTh4F
	Xnuje3Hn3QdZK2bcwQjnvuKtpBE4uWKzz8yCRzUb+ChndBFC4xfljBx9cfAReV+e8ZK+Khu2aRo
	ZGTW3P+NAgloQpaAO2+aeisaq/DJTRV7SMuPrP5EkfVkMFLQsstTXyCNHBiG7H2HS8veiDdkjiW
	9oSZ07DUzQykZQkZilVt6PZQnfTw+wStpbKsHzvvnhW9usmkR6itKgs5Fh0xX6I1YrggGlHkGWp
	21dvWNUhow8HGMCjpVUMmw0AcnK9lBZbw45ng846Jnb+3UBrtmokQio3GFgwON7fTulASOhxZcs
	tjLV5+HGgAQhMvoHOUdwoXGlAySMTTwrS0CjC2vMMJkHQxOSAqWG0P+WvrlndtW6dS1bXUZQ=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3892377885a.2.1795681399734;
        Thu, 26 Nov 2026 00:23:19 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3892374385a.2.1795681399308;
        Thu, 26 Nov 2026 00:23:19 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b030ed9sm743269766b.86.2026.11.26.00.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:23:18 -0800 (PST)
Message-ID: <4c1cf9bf-cd96-489c-b8bc-41acd85a85da@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:23:17 +0100
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
Subject: Re: [PATCH 2/2] clk: qcom: camcc-sc8280xp: Remove unused PLL2 AUX
 parent of MCLK RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
 <20261126074024.1440367-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126074024.1440367-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07ec78 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-U_1VXsQQ6ybOVNsTXcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l3wM3wfbJlJWB9wk5ivWHu1nRj1uIBSA
X-Proofpoint-GUID: l3wM3wfbJlJWB9wk5ivWHu1nRj1uIBSA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX2UE9WnISvqvE
 ORyNKHMOoVHmXf4OcQeUTZ7nAu7VfgrTqSmr8V/HxtsuN7FhaxWK+onh3gOUIDdklVCtsa6NZwf
 DF8BrvH8TjJ4ULwh26QKfiqV2alDA0hV1gu4ssUJ059YYj8JAfOn2rpTzJGGDkcMA5+Bd5lOPSl
 fGDY8nOt9mfuxr936gE7QXUshuUm2qCB7En/CVcH+xvdZs3dHyYNOYwD3gsHndPBsDkSDt/UFiH
 ZenqddQUfY/C0Kinpp0JobXzSgJ9/eqnKIgkp7c9soeoEOrbkDyoWrh86UunkPyr71uBbXtID4H
 nBALTI+oIcRN4J3IKGn4SF7n+FF7fXV6FKL02jKfux33NHAWhCmIac3TREN25x2sMyp/ZcDHM9z
 hOXAdu5paC4T6EamRDyEjW+VjKZmrVRxEizhOGHsx6NuQ/VPOfxWCQXapQHQZeAMPQ0zL1R1np3
 enFAo0D/zIYpVDpfdzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX06bCnzTOiy+g
 rooSo32SddfB62hVoi1CtlLYOFURZeTNVzQUh3DXSRz+faKrLd4cpiWOFNWxfUGQsm2KKGq3G91
 VgLXWSm6RCCcXmjMwgoZsM5kPv3C8P8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

On 11/26/26 8:40 AM, Vladimir Zapolskiy wrote:
> The parent data of camera MCLK RCGs has two entries of the same
> camcc_pll2 clock, one is for the PLL2 AUX output at mux input 2 and
> another one is for the PLL2 early output at mux input 5. The PLL2 AUX
> output is not used in any MCLK RCG frequency table.
> 
> Remove the unused PLL2 AUX parent, like it is done in camcc-sm8150 and
> camcc-sm8250 drivers for the same MCLK RCGs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
