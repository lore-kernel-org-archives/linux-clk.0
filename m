Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601774;
	b=AJFJ8g+ivysMXfxIKWAfIT9nHnYtX3rJCj0bNOn0JvI9CN247brGxqBW6eRIqcuGLEoA
	 o8QS08dNGSPPhnbZMkPGPXikGJnkCNhrOPq0eLkuHXQwSa9/cS/ikpTmi4y9DlNY9xMFk
	 f6+vt/yeS+d113RhWoYZhwup2vKkwsVdtFXnRWQaJBi6ltFlPbfsQdEzmGM5IYWSfJxIF
	 QV8JbZ8wBzMTg0HxYyh1M7nMDH9X0IFFie4J9BbY/KXGUFvvIgaQmzfzQSeDsYLDYip+N
	 L7+5qHmqVHxT5CKF0MLfe63wdpmRMwB1IQbJqDZYuAvbQoi9Ta4fSYWI71sRd6It+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
	b=XW88bBJ2C058p6/ISYq0Wx0sH6SzyvBCNkb1D4bO1csERqyGzZVFyudXMSM9wfduy52k
	 eNtmVf3msV9FOCswk12fXWBiP8XgMppjN9UQ9lwrNlEatAFpXoo13eLqBwBredwx2njEY
	 VHcY+aIYs5hTDEunz2jNPWaB5WcF2KOwgliAxhPLD0pW0CHt8WT3ZqznC8Nzn6WCyAIct
	 m5QktkbDZWTX5PgsJUdKK+qGbXzAkaB+yjW5yX6lIsbQj8kDAuLs4fQLkRexsSXxZ2uXO
	 +YkGhm7QDOyWwnfASOhRtczlRt7d8RLIXGMuv8IiSOhhauub3gpflGeuHeC+xU07duw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbfgYAmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYuRoPmf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230AB60A4AC6
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230AB60A4AC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbfgYAmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYuRoPmf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU8B3682552
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U1odT0h545fjjEeb0UTVDvE0
	Tg7Aw5T2oDxzlxF0X4Q=; b=dbfgYAmUPR83D3MquXGFpWnp/Wrxo0tk3rIRxDpS
	ORZg7yNiKLtu40ncUtPzayfksX2qdpSYPEbC7mAtRvt6V1NguSsQD1kLwjH/54OH
	gXxeTx3s9cIzc1PVS2iED6SR2b7VyhNoc7Db1XjQde5WmmfCpFiNTdzTmHMwge45
	UDNUHFy13zGTOYJdadWx2R/o122ddPVokeWQYByBbJqzvFyVB1MxHrO3xIZ3qw+Z
	rxIFrMV00H5uz/KfE63V6Iomz2AFOvoTVhccJGK2V+EO8ZX6LyUv2o+J/wpxP4vV
	vR8uZ/PASeh2aQyYlX+1wOP4HgcX7oBIU75bgQM0EvY9+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrypu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:56:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so176931685a.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601771; x=1793206571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
        b=cYuRoPmf0X9XqOhph4XOfPKDZySeuyRhOCMvZ6glNlMBVeqd+eamYW8FTjVNSOYFC5
         lptHqWdprO7FvoiHgOvgTCAHVrpMQR480LdxEf6fr4JFdr+ze7DDccketXdvxhXTHeu9
         tpJ+VOKJ06uZTCmd2vVx+guEjwXiMLEFUttASnHlVUEhgiVsbqWEdFJjCjN7rslJZtH/
         jomUv3a+JIp98mdvJFHCilcWp1yy9ID65YRqlHiGMhIr6NXgLORXKgpFTH1fVqSLBkFA
         NKUjTtCTY24KNq1/tNfmM6U/zOTeZdz/HAt6/t8yhxmcE3/43tKGuD+X0NIdJ+cWRnrN
         w4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601771; x=1793206571;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
        b=X44SEonNdvtY+D2zTyi5T8cGoCqdXRVJSYFJzbOLojeGyCMet8J7/OqzX2jdcMHwD2
         YBU1u74+v/NvFIGzbD9c4qv7+LvULh0cKncSWC/1ftyMOozUNtxEdVXfPVH+DTHAWGdE
         Y221JGCuZPbr3eURhAMNGpMncJlBPjER6hB/X2ns66R9FxcR/x+Aac8SjH64Uq5WylgW
         RTJCWaBfFaRk+TLAfZLRQyfF+sJ1T1Zat8Dfdv81BLmkXeJey8sr2kqYHV2lGSx8FIzS
         kFwBHEihLUdN1VMaOsdasUjQiYAejE2ySQSvdj7xBzuwMkp4Exay6DwOdny7S22+m+Kt
         EhWw==
X-Forwarded-Encrypted: i=1; AKwUvBxsReIVo4Vk5+uAvClkAzJAp8JnW2oAnQlBQbspX3nlFgswsNjrwUCvSoU41JFClIxSRijYU6wZ+6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqFohOwzOPhSTAk77X001eCcGfKPBbwfMB+rRgn6QD+305sjZY
	rnLClxc8PZ0uacDIlFyiFKHg1b33lKoeAIBMyeyeHnXQuGAu7KJu9WzrXBXmSLITbIq/7DPccaq
	4XzSdHcq8cQ9M3jrP6lypa+PR4lao54km25QIoypQ/kVbMUWIgKmWvcyTEMJnH2Y=
X-Gm-Gg: AYBFou0/NCfEzxMcZS7FCoguerOOm5s7qsLYvbIFAX5/wpiG6gXaRAL9LEzyQniipQV
	6cA1SmWzVUUCtgQPFIFlaWhFcd3KPiSgPaoKHKFgZNflN7zOssfnM6De/Vwevu7Lk3fwLmxn4aq
	CkzY7wuuXSPhXP8dyx2ec2nR+DsCwp53BXym+hd5iVu3+pYfF64QdjDh69rEyAVI0Q+V9f35FZE
	o4edvEyCPaf2+hEsqEoTi8zyLW8ijFZ/CJY1zp97BbZuavsAhlPk9g22cVTkX8/6KdmX/OGont9
	HERploBksakGjpQy+8iyBPseeGrKoV8fxMU+1aExneaGNuzg4tDLsS9EbnI7OHNZr1CS7qDeUiz
	LInoC6e2Q6CBO1U2C0MvcfPuN/bwACglYsaZM62GKNTfmNeIxYaZs/XKAUb5eM3x8am37H0dB6m
	Y1UQHphHHM4Yle
X-Received: by 2002:a05:620a:31a9:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f57f7a432mr536573085a.79.1792601771277;
        Wed, 21 Oct 2026 09:56:11 -0700 (PDT)
X-Received: by 2002:a05:620a:31a9:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f57f7a432mr536568985a.79.1792601770867;
        Wed, 21 Oct 2026 09:56:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa124187fsm640279e87.78.2026.10.21.09.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:56:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:56:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] Add Qualcomm's IPQ9650 APSS Clock Driver Support
Message-ID: <3v5ul4b2qddghhwdyzbjh5uqwo6bvghrabr4nzs3ttvxpcwfne@tyepx5pz3tqv>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Fx8m-eAiHfiPrIpw6RPuauC0K5eRPyUJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX93PCIaMpkimH
 hIKOyTrExbmrxxzCNRx8rGIT4JBz+xcVs0RD3/VS4Ecj/50J1f6nS7Qbadu3yaD+jdQIHxaFFrZ
 MxvxCp0XEsXEprWLJ89xgLnVrty57Uo=
X-Proofpoint-GUID: Fx8m-eAiHfiPrIpw6RPuauC0K5eRPyUJ
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8eeab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=slmPpXlptjOQBmdJfhgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX4Zq/pj0h/EO1
 AOOIArIm8lfMntWQZ7E6QNMD8GTmJDpigdSBF19iRaUIELHazmDb6U8b8XFy+a5v/T9v6suKokb
 t1U/XnfQvm0LgCBSfZOQtWNC7yvfvaRG2wcCrTC5icwlHI05woJW633M63jyWZFo/fujeHfeaCe
 9DwibX6fFQDQdvPj3FNjuFbw3GjtaOgGdhHgIoCcngFiavLMMhsB3ics0D4GqQBlYIlTOssI+TU
 6uYazIJJMvp2KEdt3e1j6NioZfqtESHWlgw8jFaLoRlBOaZesnrjBrCuWPheaWue/A3xuBhihXe
 PSvWEoBQXi4Ml6CKNKAqu8/u/I2jhTGa7j0mtXAkFB48YovNuhaKrl7QKSby9/TD6XIf+zi7epi
 HZuBvrib78fo9ZiACngiYXhBgWSkmuzpfFiMTZzT9+Vn8w9R24ZAf+S9POqeiCcjRuSECKYAJ21
 scQlOudRSVbKUHlryGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210067

On Wed, Oct 07, 2026 at 12:20:43PM +0530, Kathiravan Thirumoorthy wrote:
> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks. The
> four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the L3
> are each clocked by their own Zonda PLL, selected through a glitch-free mux
> whose parents are XO, GPLL0 and the corresponding PLL. Since the L3 has
> to scale along with the CPUs, the controller also registers an icc-clk
> provider in which both CPU clusters vote on the L3 clock.

Is there a complete picture somewhere? Do you have a DT implementing
CPUfreq somewhere? It might be worth including it in the next iteration
of the series.

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (4):
>       interconnect: icc-clk: support N:1 master-to-slave topology
>       clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration if already enabled
>       dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss clock controller
>       clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock controller driver
> 

-- 
With best wishes
Dmitry
