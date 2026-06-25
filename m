Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2771D3DE441
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389493; cv=none; b=M7ov/lRD9AUk0FVl3waYoUJEMrBT8t6Oqh/jbVOhMt2aJjakfRG+nVnvNkQbi7p0EQtZaGr4cqpDVZAwpncjLWa/KClp59mrJcgZaU5v4VC0MWFxJ+fWT1WC59Ulm+GnZZQG9Na2h/THVBs5JAo78BzstBHhp+5VgIAu01o2YsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389493; c=relaxed/simple;
	bh=lMD7f4VP4jQLW/JTu08gm50k0JL0LhYpkLEh26tIVN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ue0tdgHgiQ07ivGm/h2BCJpTjZ2kDIw51t5DR6ubrwIrOtjcSUwSN59W1n6wja9C6Fl9OhVEw0oPZr1vGmdoyltbH287QPJx6m75gpJvds5X3+ng4BD1eF4fqFbSv0H2KmgAzccBBdA2ASb2HYqQO4karOQ3Lxw+zsqFiJL6Pmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtoaWreo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNxT2uNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtoaWreo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNxT2uNa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jx7T1920449
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/hme8HQOiN1a4wXz/MSlNVDpRDGc/UaRP4Z30huIVI=; b=LtoaWreoR8SH5DjJ
	p8vbxZDQQqoNJdSasYgVSw5uTIW663jkyz8hYxJW47X3xGuJLNiBfafWT4gIbJQp
	cHu/Gu0KkQK2IT7+a2z5VtKUB9EXz2G3aP8Xyv6ZdzQRr+AW5wbRKxma/QbAFGoB
	50dSXxvRPvA7ArllQMpmA+z9sAQpSuIYeyBTWDSOxVKRUVM0RcJ4kdN6ZC9PSE/x
	wDqaVk/unbLfD/DuYT9RxafEmsi2XSbtCotH9qNaHrZo+Mv1gJ9ua3ySVWN6lQpw
	4/NddumiTDgEGDea7Xc1veZyJicSzmKu6Lurht0F9qU4tF/7tfsqX2NyMXH+zNHA
	90GeBA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueua3kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:11:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966d2895042so88160241.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389490; x=1782994290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/hme8HQOiN1a4wXz/MSlNVDpRDGc/UaRP4Z30huIVI=;
        b=KNxT2uNasM/45YNpDPDswggVAH+5NhcV936i+lgwtcw6tIjQRvogYykz3n71QYFdR1
         uyzDIchHWb2Ssy6jOA944aaTZs+su0Bttmk2CTvsjti93G8zJLOZ2uoSzkr0tmZZygma
         3AUKEi2S+2VXPhLmz3eo+i1XvQ6uhKkIDyZZxzgru/b2L4qhTqikEqmrEOO6uO1DGtH1
         64iJtOAU28Y1xxA6m9/XZ6TSCtFhssx51HzdAqZaCdDpB2wsl7mSyEdw/R/gi/C3Dr2q
         Idfq2bHd9Jzfe8tEYQHLrIamA4zYJmRi+KyDOm71RUB7TY2Xkn7ZvGPqStes6h/YX0hb
         +qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389490; x=1782994290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/hme8HQOiN1a4wXz/MSlNVDpRDGc/UaRP4Z30huIVI=;
        b=BlmGmvFlX7ljMvwbnBGqg/1IDmsjinxSp7Rwh5R+Pd2I/fAYf4lzeCBYf14AxO8ClG
         nwpkBpR1tvB29gSlqLbZWlz9rZ8NzSklwp17qREyo8FWv2W0+W3XvOZsjGQieafsY5Qd
         i8yK+XgaOsxpnwCdGsPXTm6KZuz1bQbP66lnAVQYCL7PBkAq/TgstC9F6SPYXuy/RyLp
         Ad11Nf4vzMj2YtdoR9vgqAlktm9GssCzkIVOwwp4RxD9iPD5Pa0SEU4WgECpisqDzn6B
         I+sleDY3eNQdf34luRg1BM8/lqpCN2uq6V2ee0NhtY5yA/iL9CE8ewBEbMlWR8Lya+JN
         VHQw==
X-Forwarded-Encrypted: i=1; AHgh+RrZQKkdXRKogkglAhRcc5bIUJiYnKvbDWMkEznkBH9eYw70vdMWrRQZ1sAH7QBDUhnWPemUDnHKRDc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+scJZbDt0UYpv2WrwKbqahMaOxSFKSRpBgLginyrJi6ZqfFPk
	6hJ5/6gHbhmadhpWtsomubYSt3XZuMhFbHcqggiJCYdu0cON/C4mdGgd7r20BiNrsEMiKsDpOo3
	hbah/JkPph1WPBtvPc/J/tuMoAXOTS5HqC2jIDocsk8Ya8Jlijj2kZoFehutdL2Q=
X-Gm-Gg: AfdE7ckNjW2X+iiBRAM21VeXAuD8vFsjLYHbl79Hbq2XJgI8N1xUImyve23oybeyglH
	YTFcxadL/sXr88IwKNlnxjrqTEUo01iUFyZVeHIST4lcxhEHfmy33QqsVfj/9ruSPyWWA3J7NBw
	cmXWnZqSg2k8fOk7Pf+zcS+75fnWK8JFMHpORfpaw0k2U01FF1cnQ3riig63hR3+4A1BCpQFA5e
	t7DEp9y4eBwkDQa7fCsG70B4XxkPyO/PxowZLUDABphoPXv6YxJx1MQgs0Ot2igFOmxu25pjC9v
	1DImDqNgoWGwRYhKCZQXrd6TxXWZ38vyFEAuyVAPsgahnMhd2Junoa5PNHiLf4TZPS12DqUnXva
	D11kZ5igLdTCPUbS5zfFxlRoDZO5jsAkaRtA=
X-Received: by 2002:a05:6102:2910:b0:71f:856f:536f with SMTP id ada2fe7eead31-73431288931mr258314137.0.1782389490452;
        Thu, 25 Jun 2026 05:11:30 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:71f:856f:536f with SMTP id ada2fe7eead31-73431288931mr258306137.0.1782389490037;
        Thu, 25 Jun 2026 05:11:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbec482csm168053166b.59.2026.06.25.05.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:11:29 -0700 (PDT)
Message-ID: <357ea0a8-7a88-41a1-a75c-1ffece98806f@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:11:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WxKPySPO5SOpRtC7g3y5Oxy2FIgtgDOa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX06vIA0zKuyMr
 p/bwwrPgHh4A/f1ogncvRIJZd1nHH0AApBDuxgfPjdBzmzXfPgp19UbMZTttmcRPE2TCnO2TYwT
 TZFWg/rd2zHGs9H0C+OO/am7Xxs3fpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX73idDkOBFfkY
 ov5jPqvGpF/4ml2PnYlZPV1Pk9P4hqbvO4AKfodyH/jcieN0MDyli/tfvyVCMgmxY+LtD4PakmP
 EzdSfT1Zx06O64Vie+x6qzlaxHsdZCyS2JNZAq0hjxPGkzivGFQ9a3vVqJmdRVOw8YIDTe8YaoL
 rtdXOXlvMsJh2JdsBW4BGIkcc4wPL1sRiNBV125Do1py02lPBsTyTA24WuFwfO3IhWzK4kNPr4W
 QDRttyffWSsiodeQgZQfw4lwm0wL5lurtUSlDeIRb8hRuXF2n32r8KBr7VqwQ/+Zk2LPqDwP3Hi
 RNx07+W0l5RKoCub4Pjg1Eh4cIj5aOs/KRjzvrKP2R08RW0rT/O1gfAAjnPU33dWmdJkzQlkWfv
 tsPpDCAXclqB8k621zGhA7JIX6HPNGaKat5/+wsfVxFgEtwm2JUQf9ZMiZBtyym4wFxZ/XWzu75
 bQXvj8UJ2PZGwTPt/iQ==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d1af3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NLju79vw_jn_z0NdLzsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: WxKPySPO5SOpRtC7g3y5Oxy2FIgtgDOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250104

On 6/23/26 1:56 PM, Krzysztof Kozlowski wrote:
> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
> Display Clock Controller is enabled and references parent clocks from
> DSI PHYs, which causes clock reparenting issues during probe (init) and
> warning on Eliza EVK:
> 
>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>   ...
>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>     platform_probe (drivers/base/platform.c:1432)
> 
> Fixes: 0e66f10942b5 ("clk: qcom: dispcc-eliza: Add Eliza display clock controller support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
