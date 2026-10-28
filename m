Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192520;
	b=Nvdx9syg7v5YJpLhDyK7pfoRdgItxIi9DxQ80TKfbsObzKeeYDvjzjxw9UNttZqbdR+M
	 AGJ5iKgqM3l9ZVNFGAeoYDvaO7gzy+hK01MtagZznp9DSx9Gd4u8wz2Wf4X+dlo8sJtrY
	 B52J0JfuTBYEA3qSLJdHWBL0gbP2Wk7RRImtuZmIPS1yhddHO+xUko0RBUqUoJ6ymVSsb
	 9UCrqWiz5NTDpaL1ZWwHOr4fScxI8fO8euDDYI3OEL2z0TmvRaFINIVD5FrpsyHomIxzG
	 fcHCXlrL2xIlT2UGMImTXPS+WKm8/ryiwn0Tc9268aCVsPvmoxzXxO5G0z5KBU02S1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
	b=m1mOINM4GDGOQ3Vxier3OAHSYhbtU81hrtCuZq2r5Upcl69irnwnqvvPEnCEHoR1160R
	 RmdrGcVOSjAfOSFPIVVL9Aj0vyBAhu6aG6hg80VS+UwmN9EqnAIpAIFjjFIFNgFvMm+Cu
	 /V5jafD/9oonepOhFWMFoEGXQSaXrOnzJe8RiKyLzElJzLzEt5c2sJko3HrXpdV0FwUM7
	 5bMPbLX7Tlg+Fpy3dLhhgHANxE7dYiG71CPqfjp9HtknAAkFm4iGPHh6necGD4y5yOfD3
	 N1MouRTOPbIS8Q2PoceLVo1GfkXfzfsFhg1zMthEBySEvVwMASu0UQeQfMrSWrQDJ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+FumsiE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRJl1SXw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3B606A32F
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 13:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B3B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+FumsiE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRJl1SXw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe1tG4154726
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 13:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=; b=V+FumsiE/zr12OpI
	DFvA1swVDcmHoCFSMeuxf6gR1hYAK3aJg97AZw2yDP8OeufhK62kJmBEp+gboxx1
	Xi8hsGiR7zyDrktr8xN1m+uBKHMwOk0wsVM4aOMATdrICf0ZBxCkne7RMXAuFAel
	1VqbuFP5so8wBEgNwGEGTT62Ja/jZflNjlLHbbs3hzqsW1EnUosHDzGsRCRCTegy
	lQEJAimnmTgBR3b3cY61BBkHS69zt7vwihB1XmsBSxJ5+ZO2Il1k5qFEQFIBDRU6
	FV9pQGaazuPUkMWvLM4kNU+rv1EWa0FWnbLxg1cUjm4II6mvSE8yAjrkmjcsi5yH
	96TlTQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0w09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 13:01:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso92244e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192518; x=1793797318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
        b=QRJl1SXwTC+/ycdHpnyfytE2F5CpRqYoOGkIGcN2a4cr2Ha3VgdWTPUto9uQ7Yvv9x
         vhvMHBeck42b19kdVRpjlGBm9j/XpfYVX4t2Xmsxicy2eTen5kbovrW61KzFM+RjUcXy
         hinmG5Ds78vcGID3RvHE/zTso4oIz861xipNiAYtI+twPbdpltfBMAo8pfQUlTPFYaqR
         k0oVf1KMJUf2sLpEm9uCBk4898I0yrFCwIBagjmgt4Upm5E2vMfjRylps5Mp7BT/1uGJ
         4sMmgzr7PLEUW+hf92dlT+2F+1G+F9E/pyqS3jB0YJCSeetf+I/dGKS7FMcRbD22gpmI
         3wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192518; x=1793797318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
        b=wAVfqsMf7Wlt3T0ge2DAiGsHtV1+R0IZZZGGpZlMcRUBF8W9Mt8BvoiPMr8RRiGua6
         OaOQoVQKpCgNDy88hXjgb6W62OrHywKrZKQyiiQvvmKS+SOIVKIpTdldnjkiYiquGDef
         uBpgOXYesRVq/z373PzCulBFBUjVEQg2UsccZtZl/EFF0PpcGbXPyWmd0/GAyy/Vr7dl
         A8icYCtyn8OLSuhKDfVqj6oZq4q1bkIUDXuvQ0Tgpk2XmdlhVqPAw5kfUpeQGmhXfOBp
         +JVvow+qPe0RKvqpUJ2RH1/ye/r9f6AhcUNBZgiUij/LGB9sHqcHQvayDq4O+DLi8L3W
         GAcQ==
X-Forwarded-Encrypted: i=1; AKwUvByA4rBOtllSo0WJLVMNBkMKwY24MGdgQ0OUFMctGwXm/FaNXNhhEDgysyrYp/o2EyKUIuIGfsCUnjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIT3ox8tVptT9cNPTbXONqwQbLTX+jNyXQDsEw11y0DnQ8CSf4
	6K3ST6JpZ3alUyuUodOWoS/+pL5HTTMHpWN/IVCOCr6m5C93xNO7RbD2IHIzCY+vvl8nw4NLy1e
	mlwkg663chvDYBK6LqXB/4oigBpDdabz9RuAAcX8hs72HeyzJFyrCgklfA8XGFXc=
X-Gm-Gg: AYBFou2r/N03uVQo5w9ADMstcllbc9XnDHqSEC2N5mzMmj/cAYonuINAm2Msl3lJSE4
	NK+MMiepnRWbIuOmuyKul/548SA3Q7ollP+MJARILICPCqxBs+FEAtp/B+BogUS7HZtxhU0NM2k
	5J0oJzADBJNSl0UvrHHZowZO7SxQOpZnnHBPr6OR564PBhaoD10vIy2uX83UqRjx4lVEwVvJtUj
	3rKt4xGMDm/2CiKT9PGh14zoVo5UHU3ZnRn2xgWny3I5IzWwZqIzM5ebBR1JxGbLyz6Lvvwxr2z
	ghVrs+Ve02VY1oW4so7/rH2Ox010NQxzD3u8YFyiRmzaMpeR9kZfUzQ1s/YWNneBohCt283cZam
	n8mVh74E+6SWK8b3k3OFCfW1pL8sUOcZrtX2Z3NZfBCq38JCcWs72GoF+Y5R8YL8M1S491Z0=
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr883489e0c.4.1793192517412;
        Wed, 28 Oct 2026 06:01:57 -0700 (PDT)
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr883211e0c.4.1793192515300;
        Wed, 28 Oct 2026 06:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4eabadsm610575566b.14.2026.10.28.06.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:01:54 -0700 (PDT)
Message-ID: <4b373217-d4ee-494d-a5a0-244fc9181b75@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:01:50 +0100
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
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RqWAMGTBFfEGLXIR1cPJvMQhxbtmuuEu
X-Proofpoint-ORIG-GUID: RqWAMGTBFfEGLXIR1cPJvMQhxbtmuuEu
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f247 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IYGMUUFy9tKC-wNfIDcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX3DSN+7ICbxcM
 vIv9xSncnCPmf85gdwrvIqIJcfOtJnDVHdeALBgskNMAokkqn6MqswumaFspwECOcbajve1J447
 d+ADILB2IEJzL8CwzMUlsEDL7H57f6F/ggv1VrQGgynqpKD0oT9zKbg/XWrzakGmlhnJd7+xH49
 IrD/2uabex4g6ueLYDUrcnseTSxuK29kZMAocAMgWdxtyHGKeN9lxBmQAluqdQS6jl8zKlXYxy0
 hQXFd+0iL+93A0GplQe5fhcmhBy4NUJKuieypehVT0iiv/V+3ug0wkIyzaPeV1yiY4Q4BbmIO+R
 4BirO04N+J7YjNKSFd8qgyIxSoDMAfrAi4lddcYqZAdUlSR7XwG+SEWgs859PgJfwH/J78w2k4M
 kZ31h00ZQaoqrpUZFUNLjNIoTB5QmbeG52A9Q/G+N8ytAo4FJC5odGm3iyNwnshnQJI746Bsju0
 aKYQFEN6LDvVYwszVyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX6X7wTo+64xX7
 2u0SUydHXYGFIl9TBgiHivWN7FwqlkjFE37ziSygAroN+koBs85QaW+QP6LJPDGmt5ZwFrI+ni3
 J0JLm1sptnJ8T74p2AKT95tg3cIhC5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280051

On 10/27/26 7:08 PM, Taniya Das wrote:
> zonda_pll_adjust_l_val() obtains the integer quotient of the requested
> rate and parent rate in quotient, but writes the requested rate to L_VAL
> when the fractional alpha value requires rounding.  This programs a
> nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
> parent requires L = 63, but programs L = 1200000001.
> 
> Use quotient when calculating the rounded L value.
> 
> A GPT-assisted review reported this issue.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
