Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BEA30C34A
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254529; cv=none; b=qtkoXZOIqAN0gEvgYWwN63S5QjQrGip4mE2I/zrd38U9jVkyZdkXYJLnbMwi4aOqILU8fj8wo84igWTaU+dYofeOKOFK1CR24gVbQDa44GH6BQQhTk+xx7ldWM8gxkubjVCmRqDk31LhQ2XZMNyixg3At4GnbEZaBrPdw4yXpn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254529; c=relaxed/simple;
	bh=4SoLAHTvcPqxmv0YowTSoM31RJjfqFp9kt3MUAd2TAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLMd/sJvfwM7AEv+TDUgYruZMKGKjOLrXIcNAKBeXvqrRAF6Y+dVr+aD9FAXMTQiMzJv4E1ZhkcbB1n+kuan1paqnopmlD1x0ldDUbKG05eFv0W4g1iGF4Spyy09qJmcmW3Srn2kfecclXiT9vDkSMRIxP3PNEIViWG/tyJvPfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/DVcggG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpA5ERnb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/DVcggG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpA5ERnb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAo00V2152659
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhCX4b+SuO+iSEOO7ILdiZTUSuMVKlPQNNXw0P7RuA0=; b=I/DVcggGFuT8Qe20
	mXhYGh2IVQWR27rqQupqMXKjiXhGkscy7HYN1v4IPX0gqu4a5RlMQhXPNHT29R8u
	wy6b2tLxy3PAZIUb/3I3X1tXyfEaglN7BkIiInrdwzR8Kchh+BqnXQU95HEVJ/k2
	A2LAEptPllzf8yQ404qTbPAcNssRTalBUjTqT4/ndEsESb9sJ8ZsAzqOzu+R/T4H
	fDm56ywGDfCeqvfJv4ZNrXMsWuQjj/eN+I5UPJPnPoqx+Wa8b2cAsaOYkOkN/GOR
	ohAzVqmnmKDLbuik+o2xGxHNweQep2WdlXnrv2lKbNm2KVBdBmfYAG7FkW2CV/A/
	XOssfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caerc56ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:08:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3978cdb2so220608385a.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 07:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771254526; x=1771859326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhCX4b+SuO+iSEOO7ILdiZTUSuMVKlPQNNXw0P7RuA0=;
        b=dpA5ERnboOu6RqnJvcBc5A/w+ZIF3XYvV/+b/Chpsw6JcXwE5Z0fQSD9/iWeqhPNBq
         lSVD6DRTU92C+xHMRtwO3JCs8Wwh+StLzJmuHRD3oQilnAmyHxNwRCT2T6k7RNJ/Du5u
         UpG1D6OK4Wc72F9IhMu/FjZLGVzCf1lE0mKb8jGEV8YhLFDehKrh6MKFgBrzUUe86x/i
         PiywBChM3siX1A6dr3B7LH8N6jYxvT/SulIPWUGT8BQC9XgE2BLJRQRrkDn5Hkh9KzVI
         IG4HYc/BUqJme82pnssSW8tQhMbaE4z+lR5EGk8hRwPGzo/2G0q3gdNjr280eYAoLcxP
         Z9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771254526; x=1771859326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhCX4b+SuO+iSEOO7ILdiZTUSuMVKlPQNNXw0P7RuA0=;
        b=lct8lYRZm3vLs6RAr2aRo3rTVkHRW6R8Qvc0DAbpFwe7q9X3kJIP/XPwx+OsDTCKpx
         rthiD+yN782NkGeu+r37nTuRpIB7BPhWUEvcfiFKwuL2nvtrCcPakO3T2dqSHXT64BpS
         tMsf8eaR9zr1ZgmTxz+dy69i32fhZUrFlzBMgrPNRq+pBmLZt0/x193ZS1H/J6f4I5tM
         +mkvu5IGLx6b5mL+5D6m1SIsLmKajJg5OCMHMnjciHFjaq4jFTq+lIdDW450HfZDV8pk
         MTvbqnRF41hweFKQ7LCkZ6U7kpMr2zpb4ar9KCpMtiDvNNyPUfUGnx8hUe9inuxM8GkZ
         bt/w==
X-Forwarded-Encrypted: i=1; AJvYcCV2WrchjVOr4WmKXiPEjNn8RYhd0zQTIyl5Ga4cXKspPuzDLQw5kghwZDSL0wW4zChRafO4Jig9q44=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQ3vrcRTdnj4be0nJWZswY+A25++ZCv4Zb4/6j9tr/Knjw2PJ
	evP6jVHTb78dMuosudW24BNyIVoDCYRVNk0PfGtgfYVr+3r478hwX/TIGgfF1O9yT9fCjPo4Y8X
	8eY5SWyRM3rz1nYXUbmn7Wt9kCUiXTZnoP0DMwR+R4pWsjLMZcOJTfZRV9DNVFkQ=
X-Gm-Gg: AZuq6aIggFqqyuhEx37Z648YPb+T6CleQS55QrdDLP9AH3WY0hhjctk7fdE2qYO77U8
	AzKry0u3i+WS2aCxI3l8aCNsyTuqAr2I09+oqtLoNnG5bgxdZ8X9g+2vwmG5O7bFow+ooVxrPWn
	w9vmxFyQGD0zAG7L/SN7VQwFYQ0gApy7XCoJnVoHIXdfgaQ+0fbdHZmVxxt9395Ind+xnD4cM2D
	nIelghRXPrFl3K+GDWRTKtkJDbsmBA6oNFBBNV1FGyV7SKnfubPkjW0ge7OUvHsLmjlH3VkOB71
	S9hpKlblIhFLeVmu5nNEp7GiwskSblP1AXEpfdJ67finVmrLFpbYG4IBf2+uPYjtMBw0Ycz4uoo
	2s7b/VI9MOpVyqxGDvGLtpFKVqlttjyvs4NXWRLCDOEOMoIaF0AjGUBY6aL9REFgNET+z664Tih
	Gq08g=
X-Received: by 2002:a05:620a:460d:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb4073e264mr1079996585a.0.1771254526560;
        Mon, 16 Feb 2026 07:08:46 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb4073e264mr1079991685a.0.1771254525954;
        Mon, 16 Feb 2026 07:08:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fcaab2e0dsm253896566b.18.2026.02.16.07.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:08:45 -0800 (PST)
Message-ID: <5edcdb06-837d-42bc-9a5d-91b87e19715d@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJraWH7b c=1 sm=1 tr=0 ts=699332ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=z393bjM37XPXZEtfGisA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IUDMVA5DF1kkfrpCpue8s5o1H2SboXuP
X-Proofpoint-GUID: IUDMVA5DF1kkfrpCpue8s5o1H2SboXuP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyOSBTYWx0ZWRfX3ZB9+CExuumf
 SIuOKmP5YSMC/+5mdH8US8thI0AmJ2VEJ5ybP//PPomoBHryzpsjYTHmJDbrtYSlOUJWI1gZb4m
 a7obFO0Arf7rUwowrPdAFyV/3TyDi/TLvxD6mjmnwkMwQMTpVkTw1SEG0ld7NpIt85+4HWiSLNH
 I2nH4yw/+U2m80aqFnZHq9aK8Wzmn0hfSWgZpG5KtaX4PGL72oUVPUoEOyECT7h+JhoLB8946Eo
 MiDNmVHnwQOtsrVTwZsSBV+q3cWqGeyT61/oDZdD8meu8TfBy36ETRZbLlmxObEoBsZS1qxeQny
 dQD/vWN3uiDjIUjHmyTmfY1CMVaMwEiTTNy+ws8n55GHwWF5eEjgkoK3DO1iiV+txvuKWvCCPgq
 FQGp7N1nc/ro42MUywUzYAaEv/26Jo5PeKheFiRcwK6BurpyZngIXpaRhZMRWFqX3yz233DSTZz
 yWrXlqRTSrH4Wx9+l7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160129

On 2/16/26 2:43 PM, Abel Vesa wrote:
> Add the TCSR clock controller that provides the refclks on Eliza
> platform for PCIe, USB and UFS subsystems.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
