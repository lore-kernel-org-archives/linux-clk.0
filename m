Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD863227EB9
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100130; cv=none; b=SlcT//xYinecRughw6Lr6W6oUlWuc5HAYQQX8bREi95P2BFt9PQyNHj+tHQ/8ml3WXkSvxBwrxo4fwtw8XTxmu6GCCRRXjwF2ybpTrsVH4NJ1G/O9ab0ENuY4TSLB41CIoWysj2dIedUP9/zq2HHZ5++rccHJj+xI7yWizvxVTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100130; c=relaxed/simple;
	bh=4aRBrc7GMNbLZwfXxjQeKOfO0ZRIiKOr0XdQ5LIPtxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uk8/330oJ0phrcjhYdKadtcmdzkkWy8GEBM6tEY3oUL4sFVceTPeiiTkSmgwH4+NaF1w0US1y+hdOF2Ge3T82qQ987BJdSZa44keU+uBJ3gyRI2Hl9nHF98lZ1YpxMk6Solm+LaLjddSJH4m2pueAD1hWfuLhq3mFvq7Qgpsb7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONHsKdyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbhu0kpp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONHsKdyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbhu0kpp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBlXU1072711
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=; b=ONHsKdyrD90pUARE
	/25sk2508YJoj2ibC3soquTYX0XT7jbkJdCj5QPePwRX1jm25lMOc1nuLc867ZrN
	iQWTiNxcIVMFYMyUJATKI++oRfOk0LcmKLLpwlvpzwO1gXsV3Bho2pAERZYqnLi6
	p3VK9bOqraw6ns/KhZgXzyzKF2SRTf/ELxPLPYHdNC08udz7asoPeljcVcdtxXrx
	ZUlLGnqywHDSNmLoeEHHOvs8ZsxaeGafLfrh8f4o5QKZge2cKzLRacu4VHAqtSbk
	+hraoSmKLJOCET9kqVbfRnxfrFEyaFrBDhXtaCeeY3pmTabhxvpsdKnpQkrkQlQ5
	OhyOew==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjg4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:02:09 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69e4dc6d11aso139779eaf.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100128; x=1781704928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=;
        b=gbhu0kppqsd00HmQp5MPG5riniH4qWmY67k9W46roTAbkrq/Tng9tGyzNNQW9hsEzE
         nr66lmoPMpXeV0YlDLQdX/bJ4v0tWCZ+yy2zt9ahxt5RU5v650wK6FSwp46hTkCN5NDf
         cuDkXu0gqprV24b9LFkeJFok2axwpsOpxnidiyC5ybIwTtsI+SyvZTr+lhD+5K5V6xF+
         /aAnK/vyra13/6f96HpxjwlubHhlZYbfvAwnpjzf5ABU1Qd09l7p0qyJfu5bl01zMMwF
         M1LZfmT/fpaC2qYFGLjictaITH7Ei8xFSCIfh+LyR6a7tZuTAwMNJiW0dxjobSbv1nnC
         GczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100128; x=1781704928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=;
        b=r1/YJUj+nXNs88n6n6bXXAvsCC+utZ/dP4QJSRhciTZ3fFszoJw+44WIXeW4qAp9As
         BFsHv7CoZ4cs6rgyJzDfCwVrCWrh6wsbvCdpKA4J5W0KmsxS8yRsvF94U8MgwbjnU/c9
         RJRIR/J010x9/YOUvr4lB83WVaL71H6TDkUNUusnRJaPV80eiLatKUpWZN+rM2ZPvjB5
         c7i+9PAzLfhge94bhOIpS6ss8syZTzpEQM+CuG/puY5RETvgCH1wCuC7NTyvt9YgiWRl
         axfpCqWJMXwd7sWRjeIowiS4njLdidXsViGM7gxLAw2FlJZ1cr/5+67lbuCXrmGSf1SO
         zLgA==
X-Forwarded-Encrypted: i=1; AFNElJ+RhFv0xT6V/wh5D6FuThXcvtHBx0jtOaPJCw3Pecw+xaP/J17ISVVK9/oLHdNoqf0Jc0rCNvHQ1EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/hScy1giFKefKj6m+1jNiJBHzaqg1dwR/L968FULHl/Gtsch
	GfqBni7VjVtPJoYxL2EAhUFEis/qpTLepRNZ5jIFhVoQsGv7DTbfVWFhyzNj99lRfmxbiuUDRV4
	oB5sM43WJs0Uqg9wrprj/PyXh0E9z5E9UGIrAMk2NXj7OJZhjEOpVRX7ZqbOVK+Y=
X-Gm-Gg: Acq92OF8kTOVcujuyh3N8I59gZ4Mj0eCuniiyOZouN1mNjvRHFemAkwFB4Q6FRN/OoP
	r/CkEcK15vLgy8G9IBEElZKwGy4PwBAO6gcpqpDh2xlwNVZyrEH2PG+tl8I11Pkifx52czszTRC
	JuTJWPXc/x8foyvckbfvAHv1AmHivRA9/oE4IzMuoEcsLHCV9lKTrI92lTel2ZI7wOdJ30cImeS
	GriE80y5ao2NQEQ74qbhWhrflPi4fQ0SM97AQoK1B7DfINzzNnCkA0PhXZrdsnM+bxVbhJQgK9O
	tSLO/bFQ+dGbZrmGMddii1uJVFAM2r/TXLQiLYFvfmmgW3kylU6ouIwSSNVoL2aMJksXMr9XX/S
	g4XyS5SDGdG5whriRlQe8L5yvB3mpLrO8V979mDaAkg6DpVxLz0pBqlJU
X-Received: by 2002:a05:6820:a20a:b0:69d:6026:2fc5 with SMTP id 006d021491bc7-69eac971679mr1794663eaf.1.1781100128007;
        Wed, 10 Jun 2026 07:02:08 -0700 (PDT)
X-Received: by 2002:a05:6820:a20a:b0:69d:6026:2fc5 with SMTP id 006d021491bc7-69eac971679mr1794612eaf.1.1781100126676;
        Wed, 10 Jun 2026 07:02:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055309368sm1176605866b.49.2026.06.10.07.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:02:05 -0700 (PDT)
Message-ID: <88bdbde3-ac7b-4c40-a8c9-7ffc58a180b2@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o6mb1xlpK15BxxmQm3jBUOaDwT-HQxvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfX/bOb6f3bYO5S
 e9YI5ItFuh1M2AivlJPN0rL1FkFnpSO4Kj8iExrwc/znNsyl/1lDp383ZC/7HeCKbwzF6MrgoxQ
 ldl5hA94G+2bJTJ+PWNqVYlYA5gg8DKZ8H+gX1EEzSEUFOgnLUsqZnvYExc0mmQkAb5wUrEP0Pn
 5Tfgvp3CONYC9acVuy5TsLHtDtp1e0AVME9yulaiLn8x3FXpqqPNgxRshwGTlI1YiQXxtvTcdOC
 08UT8Zjt6lLsCHPBdIod029tSzNdC5H/9pE1euRqM4YYWvdDpJdO4vcg/YFyTPw2CjK3252l8XJ
 HDM79TniyBQr6OiCHpS1XIqgxITFzVAR6JEmhER3AltstfxukgGZDHnkr04nytJxrPPBdOM1HWB
 6S+AaBosDF33Uf6AML2PfYjnhfcz4iLysNn5/PtZB/37Wid23KQDhpgtLc+G2eScfpUhmGUXCN9
 CNYokNtRGiKZQ/Kxghg==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a296e61 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4TAmcUqLxasSw5w_aJMA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: o6mb1xlpK15BxxmQm3jBUOaDwT-HQxvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100134

On 6/4/26 7:26 AM, Imran Shaik wrote:
> Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
> bindings changes, which adds support for the DSI1 PHY and sleep clocks.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

The Agatti MDSS doc suggests there's only a single DSI controller
and PHY. There are registers to support a secondary PHY, but
are those just leftovers?

Konrad
