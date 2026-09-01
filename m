Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7343E9DF
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277590; cv=pass; b=Q7HuGNfMUf0kO9XJmaptxfcC6pZdNi0y/k2cNJ5uOeEe0w66c1Usc+sygwF8UtsgfsBS0xXyLVDxKGd2+G6JtM5UGU3mnBzQklu/dubOYYnS0h+mbgjD3/+6XdLu/FHtA1mFA56YnQacWiaVKkgdm3TwPfB0urZH2Nl3Mxz52Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277590; c=relaxed/simple;
	bh=2hiFglIyELsVUiYPyeBzEQYmuk8ezgG0ZJ820CL46r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcLFsGmTHLRO0dJF/CYq+u0Lbwfx/dbTJGUn9En11e6/H97qLaAjj6tV6+z83DfX2TuroAR6PrMuHtrVECEi1Cm6KMVmsNlpW0fTObCh8Y5ZTTc/QRMHvPjh4Yyp2JDv7NP/5ISLgaRPB13oDfaxKEu7JkBrNW/N2xgwXKtgRqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt5M0ggt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mc8G43FP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt5M0ggt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mc8G43FP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9SeX1638693
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 15:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=; b=Bt5M0ggtxbG89sc+
	BirZoRkIMnGGCvu9cLn8DtXIJcsb4LpkHvHlb8fzIUERmgLg/QNZAbGchT/zBlta
	PrSTgamXN8kbQDu0MY00sHlSx9ejf1v1y7jUjEW4ks5UEZ2CVPglweqDJ6Ep8bta
	HZjX/gZA7COIc28EA/LeazfE0kAWNDftfjmc5qy8Hah/K2VHHg3Z/yporOq1cPa4
	8+WeM2u6qBRbjQvFUspS7xo+wQ6k+Sl5AeuVKwKAyC8Eclm6W1yzoepIgnUxYJon
	LLMaEhbhKh3SNPn7K/D/Hs+OnBBqZsp7TqsUvK3Zy5a/Th6ctxBxN0kUcZqIfhLU
	fCD67w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjqq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 15:46:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso26286a12.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 08:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277587; cv=none;
        d=google.com; s=arc-20260327;
        b=Cd5qBgn2KQuD+RTGVesEDe8+1vYV50lneco4AS66fyEQ8RgkCRX/fCxNljoftGN0bF
         9XraucIcUqHMTS4gwfFVfds+bkI+T1zTkNwEoshPWODJLn2c1zvArIEzqaoZjN6g1gDJ
         vWaGZtdBLdjZSwptuvsKROHGx2l7xGdpAKQop2M2OvsnMBYU/vSDo3hKCFWVJ1WynF+U
         7B7PB+KP8qW97Uf+JgqQCEAq3GE7pnaWzsp2r666eBPMc0XcT4MXxNSoCGJrXLbe6ZfO
         OTdti64aNOVsZtYhJlKA1fe+bfyqglxFsZkYvhEJNQpWISzqHDC96PmRTyzCmfWYdzZr
         Q0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        fh=4Bjfp89bzKAhkaXwRQX/mOPY7cZXPmVCR/MZy7zlXAg=;
        b=i9yTQ2sCO2ekZ6YwrwEj0Eb1N1/uqPnz4HmuS+0+Gn0atj1jVU4fbsQMdE4rzB6YQa
         5cbfqA6yHXOPAiUEZcFU8PZ4ukKWmTWJHevj9SqfaEAvW0cbO7Y6BawUgHxgyWcKreTC
         VX8GuIJkrKMdzkx7CWLvHBIdUm0+ZI9z2U9Danu0wXJwpYc2e9MixFgMrqTdUB27lg9k
         +Z1VLcnrfBQ3WUqR60DPKruuPNu327ucR080KU71Gx3dhwRN74eQC9pWd6moYku3mFKC
         T1CM1znKZcxhVZtLBqgz0mNrGfaStW3GSenxxJr9QguDk74tNZTC0QW4dP6W7uu5YNqh
         HQYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277587; x=1788882387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        b=Mc8G43FP4LGrtYT3+YtNrSlh4wylYrOYZGb4BZcrKVa/vt2zZPhysJW9zgr2lVmCBI
         Hu/XLkB0dJjFSMsEKWpc00o+1H2lKEhvegd3QIOMn1aHFe3rYyw6Ngu94YLOYOeRTIKU
         mSyzINRcfHZiHksJov9d4VBU55yO7itgqeWThcO/JlP+kQZHMqT1Q+/xpopyWxVfboLY
         iBhKTnylozXCCvbaYUTD9QXLSlDSSwiTU5YVnJnqYeeeD1aPxlQa+tv1KbYaQbuerbpe
         fCYJ+x+4ty1LhZtH4qCXn2MmJAQUvnjUdflXbwEyoUq7o9uQcSWEqnRqa3Ia/oOPOSkH
         By+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277587; x=1788882387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        b=s7Xadpled4BEZtDtUSCz0MQhpmW+keMp1rNNFK6D4gpazf2z4YZVlgYK/FfJbSgm9M
         qBnfseIUP5lNASHioMiyrvDzNT2L6Q5nGxCux2w7Z1otEynvbcD7hJhXaraoc5GTrt81
         C1yGYsosyxKQlfEBFkf2S2la3RcG3+0wBlodqxxCodDPRa96bXWpyHz4F5BwIpr5lGsQ
         1B/irUqBhU5egxM/0IAB08LOxHtomq+YM3pmcpHtHN4ova0+yNY9oq4s3VLsDVJdjmeu
         +ild+TIlmvMblx14UDOeMA9KjkxILMsWGbhTgDVof3jNiJQJC2shmd1jcLeurx5rX93w
         imcw==
X-Forwarded-Encrypted: i=1; AKwUvBw/nXRnvP/bSKP084Pwh0KC6jbn8Hnexxy0SUfOBODic8f4v+8pPlnpX7XITO8+TyneTptE/LPUx+U=@vger.kernel.org
X-Gm-Message-State: AFuF++mr0NkEvY6vJwSe/7lS8uLZvPW03F7Ez5lvQ1WfdxdXcsO/hgvE
	8j7Bxs5i155uJnRG/s86XjaItLhQYIi1z/l6vo8iw9+UHeAUatPhNwCJhvkPkezNb8IbShK8bZj
	qGVpcu/O/ImwvakWmfPiU6FRt+ZJv4tkiqe9TUTLyMuLHx5LDUv4CiOSnYfTkLtv98Dtg/tSS8v
	0JOLoElESNf7YSS18taGCXgu5QaXOQN312CMMyoQ==
X-Gm-Gg: AYBFou0m6TmY9XicHNzcIiglRyCeOFhLffKNwLfmYJq/eGQO+dPlB/nBsjIByLAK8GD
	IzbopH7Iw8QtVKo1zHFEWawYLxuMQQIQugm6JTphIfD7T7rBH8jza3BYu49GkQB0173SzCib/Sq
	lL2Q2rc7UTLEjCxSstrWkold5H0aGY+kZpN2MxungIXhWanKgEE3P874HLiA==
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr56207759a91.13.1788277587269;
        Tue, 01 Sep 2026 08:46:27 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id
 98e67ed59e1d1-396d0fccf78mr56207640a91.13.1788277586732; Tue, 01 Sep 2026
 08:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:15 +0200
X-Gm-Features: AcwNN1WvPfOmS-pECGpZIzaJnQAiHHylSoHG1ZWEkcxRplBgBJFHgfUmrIeCkM8
Message-ID: <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, abel.vesa@oss.qualcomm.com,
        taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX4qj8vaRiWXg3
 BhBKjNUp8WM0M1GxF8dQbkQp65O5vugl3WzyojA2Wn4hYHHvvQX56VuLj5dpxo96jR4OlnzpKig
 jcCc8WZ9QaT84y3R5KDejCSDcFLAF60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX/Z6/i62dl5Uh
 KyV71UPS3FU1kiHoiBKce7S/B8UrTC1cys/zkNjYyboUUjKYjkXuZ4CSfTmpqZsmm7ijOVvW+mL
 q64UtJeS0xxrqCeR92bshAWwHKQlJYB8++EdBe9k7dao7OUIH0Bsq64RCTUzd5kDHFidOrZx3+x
 fSl2H34ClgzkVqCGEBvGugogcQCrlPyTBUZ5pGbn9Gt4TIOiXU9Ntz+QyFvq3cEwYxRU9kgwvi8
 iWDhLRLk/DggF4FAN//453jARBepEd2ybAUeSX07nwdobRajAlKChewUVdqlxsnaSgBdlxDr1Qp
 C6e0pWX9OmFeEPcFfmE1d/ALme5hhMd8oSLHN5DECnNv9sRuH4+teQGFfwdswo3qi7g4p28cJMA
 ifOxX27E19WCGC1oNTCJtWreomLuxbnCRl2g13tcducpwrf5Is7sy2uxuGbPUlJ/16qbp5/uSGY
 9FmovXSuAwv2Y7K6UBA==
X-Proofpoint-GUID: CQb3pPxuMwpFLeT02GCP9ZyYvWR3q-MX
X-Proofpoint-ORIG-GUID: CQb3pPxuMwpFLeT02GCP9ZyYvWR3q-MX
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96f353 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=Z-QAWnQ1IDuNMEsj6QcA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139

On Tue, Sep 1, 2026 at 11:25=E2=80=AFAM Sreeshankar K <sreeshankar0910@gmai=
l.com> wrote:
>
> This patchset introduces foundational upstream support for the Qualcomm S=
M7250
> SoC (internally codenamed Lito).
>
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring =
an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex=
-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
>
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC=
,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memor=
y.
>
> Dependencies:
> This patchset depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzy=
sztof.kozlowski@oss.qualcomm.com/T/#t
>
> Changelog [v9]:
> > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver f=
or SM7250
>   Make all clk_init_data instances const across the driver.
>

[...]

Patch 7 and 8 applied for next, thanks!

Kind regards
Uffe
