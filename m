Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A742C42122A
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888481; cv=none; b=pcbI39n0UmcEEfM1AccR8wMt3UteNNYpL39Eog2itInGbzZ/RBFX48dhYQBA/Ta75uCMRBfJCBRYTjeYxjo31iBoUCQdnTphq3GxzbU0va5foJFPSvgXglC8nxb5LaBMd2axnEqg8wbUwtep5pavOwbkFAJ9XtYSRNM2L068Q5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888481; c=relaxed/simple;
	bh=RajtyGnvqSZANrMBnJyOPLjvBP7Bm9/LvSNzKUVqiCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pq1h/PwpSG2gUEr6vCGU3kVV+LBmisdI9dL2qZ/QZ2vuJw/V0SlYzXBF/Vovp3Tp/NLOspV9uPua+VF3nJKhjCUgpTQFduWOjpj6c6wobDS0r1VAAIuepp2d0ouFSWckiCmQM3/BpYOANLvSD7Rfq7zbFNZdqYJrK3mDGqlOMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRzELO4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXq2hZn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRzELO4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXq2hZn3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE0u02917066
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=; b=ZRzELO4zyihGjziS
	72Nlcb3z3s0+7l5QxHhHql8T64UTRRfr1tJSs5oO4pvzdqFpnt0Q0lSz1yZCJ1Rk
	zPoFELxhAyJHMfDzMoWWYVGS19pSgrr1AucfANF9QRSXjew499/Kjhdy/8+WRkXS
	VyJmFHZe+EE72oXZMUjURfNlPTnMjJ9wev1IGseM0595zRpY4m/6a40E3neQGXiX
	C/qCPH4AQGM6lcR3PpoRLJwHYa0/V/7rE1ChdCFBWCj7UNWP57rV10MMBTxlyKlN
	ELS441cdSCt5nL6YxPCa7G+Isc0y9CTYr0wcf4P0qmng5npxp/IjnLE8UooRoeuu
	kgqN2A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vkq2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:21:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so502963a12.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888478; x=1785493278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=;
        b=VXq2hZn3ygLz2+6SnjffKGSj/nNH8bSEUST0Ulb96xW1bfA821cESnLpzJa2hn7PlA
         BGhnWndmahZ7czVP6FIyvfruQul61HQ5oa+L5ZP1qw66hVxR1NTwWbFuEWwELXGXiSLm
         QuYF7XSvaesGrCDGBAD1VCMFyLZLhOwd4agEEuRgOvaRk368yt2Oj/bOWQgbwoIDqz8I
         L94a9gahC9xE1fb/FS6O27O6wFZwxr8ZWUboQ5mzM9SSNLSVhPBqr1V6ERe/q4Q4l4KC
         7gNbD9Zh45wYJEe0HqtsBShOB2v7KgvtW/K4i/Imrl9ZEeZFPjmI7wpovvNCyjoACFtb
         1nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888478; x=1785493278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=;
        b=BsxQFdcdfZSZWVbOrGi9Mz8yrj1Sogl9d6NTUIwfuNmSoC4+c5vR/hNHd5Sd7ak5K9
         qH3KEfZAcTXSYzamZKkUQ9Euk7w+l5SDDw7cBrTmOC3RPLzJShpId1miwAHxkY1Pk80w
         0weAyu/lLsyqmvX9dB4PAaQxapcyDjL3j+f1INBN5MVvdE7kXuagGOfo+Avn+HUEe0qd
         8fhCs2+pNAe0wWewi8h56MqB7UoExJHDLp+1xhHbAfAp2x+1IpnqEmG+bBuoTviEIQ63
         xb7lYxU7iP05ImON39mjEigOizXRM/gzm8hbBssObfsVo0du4egUbYy9Wff527sNAazy
         0+3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpBwXXvlA2lhO5jiXktYXiRmiOvxr+Lx366V0Nr2bnBbc1i8nTUFiEyoOcWmdZ9T+JM3U3HNKfjM/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUL+LsUdAVEuSgrwE8WAkFYKknFj5UU9xalcdXTUIWaKbpFSzN
	NTm2BFOkfQVTcBhQWthAbWzwR80Eb81Xj6yhSe0EFMd9GocYTSw8EZQLbKoeH74oyGBe/St3vyD
	fAikft4T7yZlzwQXnr3LWSHz4e8gA2aKflYltuBK6Pn3lbepocj7Scftp91qBixQ=
X-Gm-Gg: AR+sD10E3mAjeqXs5yRT+CO+8QyTsIW5hBJ/3iZDIVZ1cGqegvOCWMztzIyLXFamslm
	jXMTggBVVyh1SMNqaEmsyJv+9897tIptJGwyBfZRDJH8PzJTWjKztYS+NBc73Kjn5NJw5uaLQBn
	X9eAiUMu8q2lGU5uKX9896QgVzDNjkUBcVNR9keMAvIsSEjeENMo7px6ozC3zhX4x+tcmZNE0wf
	i4hti1gHDcENQ6VeztyrI6u2A1fDjpM7sJMru5JUpqpBz2BmMPUtHZhFLyyhcNcnYOXR6Gpxd3v
	Epi0HKt2qwEmpd/I0CAmcYDHwn0m6PX6+hqSwLQUdb2NJuZ9Nm4dDIL0wIeoeRPkDXFEXMRKO5b
	24ShGAdbPjGDSXID9vd7Zp+CgQcv4lm8=
X-Received: by 2002:a05:6a00:12da:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84e2bba3617mr7265051b3a.71.1784888477633;
        Fri, 24 Jul 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:12da:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84e2bba3617mr7265010b3a.71.1784888477145;
        Fri, 24 Jul 2026 03:21:17 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm4451448b3a.48.2026.07.24.03.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:21:16 -0700 (PDT)
Message-ID: <950e7499-fc8b-44fd-999b-d3197bc92308@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:51:07 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX9aUpCjURtnHz
 jnlbsiyfxocY7iN2gu+rUct8jGe+0rHXfohVv3PHjL6M4aRTSFBQ0BBEgzcsW8Fgxm+zd+sVVbz
 /Za0pmpQKDMWzkjBSbbWDpiQ9wT1GKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX5C57AiUDd0Ie
 LUzwCBZpsgamh+tAGPaMnbpRTCADvH4JygKmYoP1EjKwOnclHlid5MwL7etce9NdElWVEFsaN9y
 Kgi+oD/1+zajuOcD4TcV/fESZQNQRJixWi41mJtIRdoKPr4uINMSGNTcQVBKKUCAOypq5BBh1iz
 hOD05GiFjR5yJ01zhR6Gtj0UY0Bawem0KkuC25xp11PSkckdDShIPXwx1D6TkunwTy8AKJRK2Ru
 Ff6NjfxYREN8KgfCJgi3gTyUu1nFXtPjot8LeZK3AEIL15u+FTr8BBdL+gQE5Aj5WGn+xBw+LeX
 8dgURCqBGwuUVBfXOWkvHlt8efTUHcQzEv1CqdAF2N9zkGGTbIxcUu72D1EaIJDndPwfS6bekxp
 7DC/GEZitASFQn7Dh5UTiJ8VK5XdB9mKEBjWGDTV9H2PsOWJHMwX8HcrmsVK4Is7Fb2wKg0itLt
 g+1vC/0g7IbTA8AGasg==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a633c9e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vyOKmKYE018VkNFVGwIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: csg-MLg80W_HA98MXuEcIVaxsrz-w3CV
X-Proofpoint-ORIG-GUID: csg-MLg80W_HA98MXuEcIVaxsrz-w3CV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093



On 7/17/2026 1:01 PM, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
