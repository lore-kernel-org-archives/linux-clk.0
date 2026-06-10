Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0DB348C42
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082024; cv=none; b=MeDyxvznlh7twzZrO49VsQBIqDzOOkZ+SRWgnevKKad47QIGYGNrP4xx0+HZQBCcfNiCgrLDWRBCs+FfdjFjl4A9ZZZdebjT2caaw6Xic64K1IxdkL+X3BW2s62ijFL1OamgTmD0CfAbdmqS9MVZQ1H0hB/kpY2x6B6lNEdwsSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082024; c=relaxed/simple;
	bh=ICycYelyTZi3nY+V78Gg4m3GSErxZvhFzcb8ogzQ1lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXTZkSU7qSc1HnMNuln0yN5me2G5O03Nr8e8AUVUKZSkWGDyhTG7dCXlnc846uD1hJKoX0TJ4z3p0g9R0rRDYEGJD52QSqu+cLyGxo17XbM4I3WKutRsf+hb55TyrntFqt9LZVmWFYR0m4mVMeYFhz4pOxEOmzE3ZxdDdMEB5xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BF1hBfsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBzqMZLL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BF1hBfsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBzqMZLL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hrFf3151716
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=; b=BF1hBfslueaXt0VY
	P4FQx4bIcXcd4lhaSHSSNccxcX3o+h/Q30BWmOslrYYPt+4jLDpt8OfDJZEi8qK1
	Ou8uAobmtK/HlPDfcgqmZr6rL5fDwO9V9E+jPOheC742mVY957qhhUZxBFNr0/MN
	WfLcjLb8nykIg41joc1zFaFfl87dkF15WhrywqPQgBs44Yyp6c5/PYTpd+dLFKhD
	UduxC4onLnnsLDnFEOzpCBBtO50xZ+T0U0iNgw8SpQ7M8u70fjOHY62mWA4DBW9T
	fl6U+tjbn3JN1rtZueQjOaFufSWhGfRG1q/2LZnoQEjKgnCgMWQAqdpCvxc823CC
	EVwzOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesmsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:00:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915737aaf0bso148582685a.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082020; x=1781686820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=;
        b=CBzqMZLLpx4XYrFH0JIYcP+A9wiOlGTNbz/87sbCbNZri17tTWo0aRxCZtiJySynSf
         JnD8FSDkzz/F1awX1C33RzJX5UuMKNMfmg4/kWiDhNb6sAGtFHVcAtkSOn3XuakQED0t
         Y6tKpcrjvj0Bq6A/4ZbJt+DRckkdAwCaSKI5x4JPnMQQLqjeDkK5tnnejpFF9gvGUqRl
         nbrsQRlvUcSgqYQaWpTsXURYqT2+O4Eo+kfdFrw5iqGiBt4JDmbMBnM8GQWjhHqid4Z2
         iodm1HihOko69Y2jN1KVDTUiy67cNvj+BHQhi9kEcEtrPuuVvd3lT91gWAzJ4t35eFRA
         bM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082020; x=1781686820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=;
        b=GCf/3Aths4n9rpLdHq6uXd3la/Qh/+k2rq5WJ+qYMC4SD34m7fsg5ozpK36rSMAz2Y
         xUkTvWNLFmhHTOXBd89FJmqM375cGTb+5PLN6+uGFVeiVohl2hk+CJ1Kn46SsWoq0lxB
         h1XM75krbLu0yl7INzvf66rKXyGN2ML/bNJ7XfnG90Za8xGTWO11U6FwAE38l7X85r+q
         lWJMX/Y9IYfcSlgqN2Yr9wuFKjTkvPLacKqNT1MyRo6Om/DBmKD9oZeAZb51/i0spjgF
         k2PmX3OSswErCiQ0qDztBpEfxBpCyzaOu3rw9BB8tRVM+6T6cgNkndQ87Od7m6wByS8r
         uUDg==
X-Forwarded-Encrypted: i=1; AFNElJ9lnQqXk/aQNJBgaH6O7i0dnnghRus97UKhtrZibNvZDkSUWgdbGm6343qv5SmjzmKCW0RZWC7ND9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLYSPC0pInlK8zAhXXrK9y33XpzikEzHsWS3kvROgmhFKOYXy
	UmWrKkEc0Qea/O+QccocQLrCvNyfuivAB03W1dBrkiCYXlOFp/fj/9pPovYA1i6/mbIxDa2xrcR
	JgGMo856wGI5/Wjrk8SsAZGFfYJBnFFBHj299S7wO6EAC8FGKGW3bwgSCDrv7TD2yGBnKAT4=
X-Gm-Gg: Acq92OG4l3JSa03MD+87chcEBspFN2fnCpDZte0az21Os0Onr1rHS8VPWq1dB/DqZJ3
	+/lzIId0HQAUKKNOcKSVG7q1VONAdKA0GrSQi7vherv3Bfyc3EVzHsG2E/tgAEJpZHfuS9DfXp0
	hzrCm9bfw4Pgg7ELzdeiF9hwBEWBTnVh7i65cSoUHbwoATpLQZriLiS1SuTIO5m4EgSyAZWs3SD
	tEldkXU/OSnxcWmGRGqi1KzeRFSBehs3yjgP3b3pMPSbP9qR+v/NCqY4shSkiNRKNEPAVbseV5g
	UmcttbSzKztTLfsVJT6ncC3cEfDfRE+gigyrr+dDLpMEWHK+ZapexvzBw9HebTy2+ywMjkx2XWj
	lTooB+sjEPw3FJvZqxzq0URSvWzTF+UJfcH3RyfVgsQ3Lo6JzYGeK2XZ0
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr618046285a.8.1781082020181;
        Wed, 10 Jun 2026 02:00:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr618036285a.8.1781082019481;
        Wed, 10 Jun 2026 02:00:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf41f05041esm750681666b.62.2026.06.10.02.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:00:18 -0700 (PDT)
Message-ID: <0717e0b5-b252-4d55-a426-2cdb81b1ddb0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3gtRPoMeiCW7FTZcnxaQO6khc2_vHfkB
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2927a5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_Y7Jz4vysGH1ZB7Bx6UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3gtRPoMeiCW7FTZcnxaQO6khc2_vHfkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX0NNIM3i6LfCs
 KaGNNhB5IPxty6PNMZKqfJedvZ0f5NWXcGirad9w19T+iD/YM4y5XMWjvtI30Gxg/5VPGTw78wk
 tTuWYE7Bi/m4FYT6RWpEzeTIfMyx5xztFuxzGDMhIWltiKosBrS4O2L3Jx83ucKDED/H2jUNZEX
 cRfQDbPSi+vCkejjBG2xPv0i2koPjp+CtR8NClr8Lz6eJUoP1t8ndv+n3COx79hLKFeNog4UOuX
 awRz2aa0E+Dus5Ittdc6YyDfFm+ymlun+IuDwQ6y4s94NTh+9vx/TS1+1LVYXUqS0cWH1iXy4X4
 V9J2uCv03Ahtg6evVTBnw4SSV7zRV9ze2e3wMC23jh+DxgHiwwvpOCo/7q8OjVW+DkQ++/XgF1M
 wlnhTfo8CtLTsf058SNcBckbQ5IeT6Ue+XOcmnYcYKRHTWsZrSxW6W2t8ofH0mjtF3xAhrE0/QQ
 SZMoYBVjdF3t6bPF/dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
> SDX65, which are 32-bit as well.
> 
> Do not allow building them for ARM64 to make built kernels smaller and
> user choices easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
