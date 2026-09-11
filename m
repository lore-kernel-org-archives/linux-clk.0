Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540B3F8251
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117613; cv=none; b=JdoF2M6QHi7i68ab/1PEej8TiM4Zo0PNJelcbMZb1Rwm4gEfFloBEpZgw73UTDdMrkgzjgnzy63SJAxIWHkql+Z4DzGtnXceEjXQtIs3pI2m2Yg73/NZU/WGDy78PEzgoy/NoSprhol0L1gRQDk0VCt2+Y7kmVMl2uCZVS69Xxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117613; c=relaxed/simple;
	bh=6fq86bBfJotY3kdKrP/jl79ZjbO++6p2yGKmY5IeaZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7Jmzf2U0jNfSN0E/SFJStNgpGXJQyO2dmrNy5DwEd/QsyinmF1TAwxyQt+DRter73abCng/QCKrTX0hJo/zDP7hE55/sLhTQ7GhkwsV9UzadCzrrIENfPA3gbTLn3RxYnbr3EeKnfXm39hlgQUliNv+m43Qv99Yvy4FBTfj8Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkpMFX3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtulOOeT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkpMFX3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtulOOeT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kmYP3017045
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=; b=nkpMFX3+GuTsCuls
	NcCtq7SzSDkqzwuY9r/AS3NtQDWyAn5LftuVp4yewmbSQlB72mEurPKG2Qmhybvx
	3pb9C6iIeoEIZIotYs3C+jrcc9Sid816T5iDaGZkQnPrq3LxwxweEpTuBwV6vP1k
	RnMlAU3opZ2znXdtkWzOzZbm2hL0YnO6ARrEEafUm534LL6FhQyN2cy25/8yTV6/
	uw3LWMKcd/6nvhbHd2dZATNJ+kDc5HDdF+SxKN5KO4/X6QhGwOAenJyLB4o29C44
	Z6gwbeqprKlplDae4Ab9QRn3+CpjckkTKuPJBrWnWlg6DJ2UUs7aBwVqb4f0fOKx
	fLcUvg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx4cqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7a0e125a6so23526e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117605; x=1789722405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=;
        b=TtulOOeTHoNuBS0rauYRuRZvnflV0GZYjJsDCDNJTVq62hZWaI2TCgElcs7X3UZV2e
         LJpSxvnktB81oMZgCd0jnAmrO0Jgd++a7mQXqGUsDJ18GRoThDUVTrC4J1QG+kn95kl7
         H+wwFgVpBsN6qW4KePt1+elvZ8FmO5rMaEsOhB7WQsdT9bOC5MtX/O8nRcIFqZiYv2aD
         TJJwOuUtDtNPzE2QOgIHhj526ttVU0Oxa4wwx7BFPDkc47AB0ulwN7FJ6JmxgHJWXvO1
         Adz3MpANxT0mwnC866ks07+hdZDuaE3FlG0i7kYduSaT/hyV0u0Pv5ZLps03BGdSkPjc
         yi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117605; x=1789722405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=;
        b=IPbVXSDqve44humdwVFnmv1t2qz5AMZnscuZedr+awiflwMUYMBt6xRupnkkrUHo1Y
         4FofMTLJCdKdaa7FuO1+FpfJMHlQXXAFnVSuXnMk4EJKHClLnITm2sbxwoch4AibRSbR
         DLAW0Jkm2U7jUBWkr/YeAKcROGV3zjyVhb3VtnSXkasrYWmgXBratuJWT7iOSmLih+3k
         1SzHkBSdbfhC/z8a6SMkjaJMfbPVmX/piOxoUHqNGwbC9UlZBKmDpXz72T/5B4SBjeLP
         IULeNaXPxvE3rzXFSKvUmhAu6dfLShotyZzbC6xBq0j60BuzSvX9PZFzqFpdsk9Cn/5A
         mheQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQsZMrckT3f4OzEC0zC6yfqN8H19/5IxiRYxqeJRGaIVGQfte6D3LTu1lhUd4FgkkZ8MFeRxgGz8c=@vger.kernel.org
X-Gm-Message-State: AFuF++leEqWoLHmztvFSeF5Mp3tULF5gy3U/D32RMrahLCrXiY8HwJ0t
	E87UiHVZU302LPYNJ586/56nV9Zic1Od74IOYzFUw8EJoOCTVGl648yD2KFJR7yWWkawxkZnuHn
	AleZ3ghDAuzzQ6DHwa5YYX9U30cnl7X6mTHHdPjYNGhuOF/sK7Q18Izvf+zVfvcE=
X-Gm-Gg: AYBFou3IQf1461Pi6wOI9pZx6AcsVQdqA972Qsupbag79ulT2+RELpZzJsWJMrwu1Ho
	fdoz0yUKEwGbMI16ybpFmgWh81L78mQn8l65dUWqoQIpcXgs3PQizVLJ9Dj/bSoYD446tTfmTiy
	6Xgh9/99cVnqiH4d9EAWqZ9qPb11VHgoRLlh/phb4TN1B5C4c7GeEYnLVIyVFaOc/yYiubrhz2d
	uxmBlA/Wtj/+PKCqlaS35Qhk4g0pQKmBDZbTicJlmEvDpnbCCAkbPabI1IkO8rN5b7WY71Ya5me
	ZTWjdQjLphHXNIoGYHl9GapW9gAHJC+pMa/jcUDtoFv5jHtshWP3V7ca3Xw5VOiV9QsyHYYBtQ1
	5FGPMo6AxS3QSXchQQX4GcA==
X-Received: by 2002:a05:6122:6c16:b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5c845d87bd9mr1381801e0c.0.1789117605273;
        Fri, 11 Sep 2026 02:06:45 -0700 (PDT)
X-Received: by 2002:a05:6122:6c16:b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5c845d87bd9mr1381789e0c.0.1789117604909;
        Fri, 11 Sep 2026 02:06:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm446603e87.80.2026.09.11.02.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:06:44 -0700 (PDT)
Message-ID: <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:06:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX/bQkFN/vaXQX
 Xsy3PBF38qo+bdnizkxpcLzR2v8iOXOwcOF2ZoiWuJLQgg5Udgj8wj2K6Ipur1gbKr/mfiLiYqD
 GkL8EAJ5yquCHDXLOZ3wehP3ON4VONqSE+Lw9t77ZVLcUsAbECoVxExOoPk6jN55ZZmB9FIxNw/
 G9AkwoCZMFElNjFUCOtWvuyd8j3kRDgKBkg6AflThy2X7efkQCxE799wf2KzN7zIbGcJO9IKye8
 nQQ2rYdiQ6RnSgl7CBMtZHz98a3bghh0l01ersXxfCdn4FEVO0ynBpQpT4AAZ698VYp0gqs8+sT
 pLSaw7C5K18ABQpp9S9+QoVMaJjFuSu0Ai7lx4vlzMXWeuKNgx/lQBJE97NvUvjDadc+zBco0Ki
 vMIdGie6/CYhW4SKDnHGMJ1b2uXJEhTX8rdfEkO3KPMy6LI4UTmPb3iIO5KBVzvu7kzwqQ+vHfU
 2UA8NVnidZJRJ2PkAXg==
X-Proofpoint-ORIG-GUID: IOrcANK4dV2-nCi0lWP4JREZRQ8929YV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX1UOcr14s3iiE
 10fhE9BMbJISDOP6/a8FJCfWMrysmEIQSD75VSdDBwAGwsMzhyEVMH6QtiVoxqAGxTxuLMMIOcx
 MSw9uG0DiHY88phiZFgvFK1VbQQ3PmU=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3c4ab cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WZiSlqQC4IXfQuhb2KwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: IOrcANK4dV2-nCi0lWP4JREZRQ8929YV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110127

On 9/10/26 3:44 PM, Imran Shaik wrote:
> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
> every clock, keeping them non-zero until a consumer takes over. If there
> is no consumer, those clocks will remain active in the idle scenario as
> well, and the sleep vote is never cleared, blocking XO shutdown.
> 
> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
> keeping other targets unaffected.
> 
> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Are you booting with clk_ignore_unused?

Konrad
