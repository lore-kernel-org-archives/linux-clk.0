Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C53EA94A
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828576; cv=none; b=t3vnvJOwyZvVmMf2WRXoW3EkyZcvo1ufqLUdRM65s4shWe/lyt/0zTQOUlNSkXM+/cp5zOwLQXAKpP8vIxK0FKAeFMmyZQvXfxNDRkeNadWvHHEujMrT6yg7bKmIPZOfDeyR/9QTK6kA0F4bGTpqfOuybje2FwmUQ1FN3NAqitk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828576; c=relaxed/simple;
	bh=cB1rzD8ttt3+Pf+ZC36TaOXTRkhlR9lFs2JuBGQUUfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YK1p85ki+H014eHwprLVjlH86rAxnjSeVhbSX8ftCptSyxfXqAaqKTHhFmavPO44Z+2WZwqbZfEcEvwXuezV+cM2TYEbCLGgLpUDSH06wIXH6gozPd/MQU1y/MDJ1/J1fvIQZJkOKoPJPju4n02C7eEJbG4rbepNkVSq7NWWlog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+ZGPTR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKeF2hpb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+ZGPTR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKeF2hpb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mplI1611511
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=; b=l+ZGPTR/vmlcOdho
	OUfrMpbjEUKfVs9bvMHEcwv6H4b39fhh1wPo8Dm7jgzukwZl/PSbgsaLZaMbzy1q
	ITBLEm5XdUUIN0mCuUOTCB7l7Ud8iuA4d19qSvbcDdTySF0RHqxCfRI7LlxFCclY
	0EffM3nelQKouYnkvfVvUDP4xJQKR8H7bSwkj6FYluvSQny+v5SzX21ZTjUMPMR+
	v5XhSEA6kQ35BepHizcN307Txcn12IBPKnU7+7xsX603GaJ8XSpOCZGZSyqd5Xhh
	2RTf4hC8Emv9RIawxllPdEslvboyos5lszxELdnMOugQX3nfKgPQomvfgZ4sXLPa
	iNlckA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gu122-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:09:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso141921137.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828553; x=1783433353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
        b=fKeF2hpbt7cXhINuGgZ6DIXNpPtufTxL/sv2gumgUj0QyiAC/nPaDNBAQ6tbrtUDuJ
         HGhqXGkJRjndvHsg03y408/OAAE4AzCCJ2AU70pV89KK3BRps9bDluL/j4v44ylAk6dY
         rGgxcPl2TP447E680n8ECTXoMpt2gntL6inutUuYxz+dYLvWexxYoBr/LO8MP/KDELeM
         vp7uHasfcMWf278d4Mz1hc3ugOvR2TV/XbKnAkzYt1JPBgJCWX202uigf3VyfzOxVXWN
         tB0gCxegtPRLWvEpuEP+rn4w7l5yr5wkSmSHkcfn5DKR22F0ap8pCCrYkk19AQ8aIZ76
         xTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828553; x=1783433353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
        b=qne6AYi9xf8fflnXS/Kizn/G4yl4W7A4nDbOCFtV9DcLPabihqPwO4+lUfgvt7qIqD
         MGVgrtGNOmjQW2A1hsZut4IsJAcTXC5ZxIA+NPfbjBlqneLEbbxk9dGK8l1txGAGiXaN
         HQF6YoiVNAyqRviaz+O78zKOHD4Tx6beoAIaoQdhcGB1+8IhjKgbBgaVTgo+SZoXJuF2
         qZMZnsscXe2oJyQvN2O31cdF8Gg+aBCL3iDBIlHewc1e7uD86kMBPMpK73pUfNT7pdk/
         aKxB/9DCMQTvrUSqxgp+whxItBUDi73hw75sgUKPD/Nkm2hzQlugXIhOMURXv22+TPvx
         z6wg==
X-Forwarded-Encrypted: i=1; AHgh+RqODDaEtR/O2xmtVxEl9c6m5q9gT1o66EYAlYj+W6Ju7gQWiOUAoDfShVVs8WkqyVzdzmKFO+rQG9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJcZ8aGX2jFW4QoCc2/S9+PNXdDth0AA0xPw5v6yy1sBrwDKTB
	b0MQ337Tl4CIMF59z6hL6XyVMiNi3AU7cnYciXyOxTIk2PsI5Rm3adI7oRyT44iz7LYKetvedW6
	dkF54PYBqMqxkazHCBlGbBMFacxZQM7fWFqFG80FhD5QN+xmE5BF/jE6VjG+DnKg=
X-Gm-Gg: AfdE7cnLz60vww2XRBNrWA12D8nmgdit1psButpFJCDitfeWqZN3390zqsFOwf2ASno
	6xa4qXLgHNLjCdf0/4tm/4s6G8zjVCzr4KD0m7JI2+M29SDF969RLXuCSWMujXfELOdU/H/rCXr
	uEdEr1D6wHqiwZy3PBFF189BJXRzaqqKmGlTdmbZ5R+Mtuhk8va4kC+YKjsw+TvQE5+8DhytjJu
	OyUDo701Vjarfgl5fiQWoz2YrtpZrO2d67k62c/AnIYhUej7pXLVZDbaQYObSZbNghIFq26jBY3
	R1e6MULhA2O8hFXiOSsOXB3EF88wvR6oJZEHmV2SvWeqz7ELhQuK2eb9HH0JWyk3Lh29u4Tlrp0
	L1oBXAj3Td6lUrn7+4jSYYRPUDq7GGC6Qbf0=
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id ada2fe7eead31-73a363e653fmr674934137.2.1782828553179;
        Tue, 30 Jun 2026 07:09:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id ada2fe7eead31-73a363e653fmr674926137.2.1782828552777;
        Tue, 30 Jun 2026 07:09:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc1esm135860766b.41.2026.06.30.07.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:09:11 -0700 (PDT)
Message-ID: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
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
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfXya5MoBlqWNky
 R/xFAeZB2DdV640TG+wYlbEHigBDhLvkCfEqz8AxpzwMIwzkHdzDAxb1vUd1rM/UUCZRVyxWIMn
 jfg86ijxLTDk7MWsbYSxTLbKFd6xPrY=
X-Proofpoint-ORIG-GUID: mg9JxTDBXv2OegsfLL4qFaWb6aL7WWyl
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43ce1d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6vCOFkJVGQXElGg4amEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX+8GBB+woRuvG
 n2KrFG54BB81lguGQ/j+6Z53r3DJO2F1qvOmaoB2wrcTaJc+6u/0omzXj3a2hCW5vvEA3WVFio2
 Lhv5foaLl6TVB75gK/E7L3yXDipokKNOU0VH6xLSHa+vd8ioH8CtVjfNt7wehb9Q2FSXCFOjFxl
 PBye22RRnCqGA3V1FJD0Re1w2qvrP9Ev5x0+OdUM4odyfusHpvXr6xrLYj4sP7tdkT0hFqEuEnU
 xEuA0bLoZZkxqIjEhpE9ywEtXQyK1qFJWcMddrGZyuPfjNGIdEW8AOIcvMU8STwcILwzeV2USGL
 xXJBFfeAe8qbQApPE6hpjvSorGkkphlkEAMYtMaJB324PiJBQ9VAmnqpx88bfqV5BHfd3Bg+/mW
 MOczZX9Rk05smHpxerZAQsFlM4ZwwgQnfEyjUN06aFqCNdaGZpHszr6qSDgSNcv6stw7r7Q+nrb
 qMBZu0Vzql3f8F0Sawg==
X-Proofpoint-GUID: mg9JxTDBXv2OegsfLL4qFaWb6aL7WWyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300132

On 6/9/26 5:02 PM, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Almost all of these nodes lack power-domains, meaning the
aggregated performance state requests will not be translated
into RPMH requests

Konrad
