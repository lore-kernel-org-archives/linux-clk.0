Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE822431E71
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436774; cv=none; b=bKQAMTW36aRmB51r/Ez1BuwmAkzFaLpoeWdDTkgm73AjLkTLvX4R6GTWjKu7bUw9CrgqqVcWbr1MuXmjGa8S4L9DhpsCOwdqQzAlzs5gB+2j/FXtInBcZKq+6mNwMmO2ktjk/+xsQNXIaEfywmrEB7I0F1Mo+xK4eS+2vmtPtXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436774; c=relaxed/simple;
	bh=7QmXtZAxTs7eawrjZ02CXScDt87oRJ5G/NUCVI6qPuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dr4vfcPIKiK2kRAszgLJ0qYdFJMPlIcHI16gIgn3Bd8OPHtVMmUh09+Us0WgGASpJHFsauenHU2Qbhw6cdiFk5VukgkTXQPTCdbWTH0xcFKBuGzD3158/56VlyOsZT65D1AwKpAd/JxDSm7SeHKWTDj2oGYtIed01fOWsDtFXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxmLwF5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eux9TEup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxmLwF5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eux9TEup"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH49s3720197
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 11:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=; b=gxmLwF5fBmd8f75u
	sRW6IU9ZMIG0PRXHPGElLnWFEJo4TKNXOKYuluMo14b/JlCYJvZ8EGGpOza4K1X6
	sM25jcFk4HFwdTSdvxpaUVE/aj9of/m2Dyum9SXHIaYfjkLNqma7dB5fViCFfYZj
	h8oTky5qQ9OeDJqrxRi8kYf9L1p5P5Ys25YlnNtDTbcCAsxoQXK2DUVn7Q0seEOo
	BuIKAf0U/mxQu6sNp11ie2mgSrcPXoe3HwgK5YrtkszLW7bxTkanNEGXpgCNUElU
	1p3GhJtaSdaA0WnDfBOb6IOsDMbXHyzNMsmpKWcDBXgvGbd1olhWmDMDVCEty64T
	b28Krw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjsyd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 11:59:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9392788b3f8so54763085a.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436771; x=1789041571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=;
        b=eux9TEupaydYJcau6OXsSY9Hjr9pURAILSGJ7okAOfMZFX3ApfbLc3UL/Yyy5aUUT2
         ftiZHxCHy3cqr0hZQaFNCgTfzT+BHjHc5QY3BXdqym3Ks0K/o2N1/bBYlo0OH4v7D027
         ssLYpW4Te+q9v4x1y72gVAV4aLLCRw2EbpQhO5yzz7B6t4czrkYkJd32f+RZ/WdS/c8n
         /Z/Yjeu8u0pEzp64UePDgXZq5NQMc/tZ4KhKlnJjxzXTTq5ifxUWs78vdnqLB36AwnOD
         vD3ey9U98wzJnbF6CRSbBZJumWQMZuuB5YZu28LaKXOC6EiliSbuAMI4qDZGJLnEJ85P
         X1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436771; x=1789041571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=;
        b=pmu9AAN/Btu6dqgnvloA+BOUdKasO2Yp2Qo4eVCGNLI/JoMxcVSX0At/Q+qXutnwuR
         dnOIaFQYKEvQHdLBwAtupVF49Dvba6RiS4h9Qzwce17m+2+UewdRp19H7soZ3iGbXtk0
         7mjprhHCzBALWQH9Qph3240ehkn0w1bCtofEkbOnPJ4iiQ4rehsmrO+QpCnCZNRavBB/
         NEFQla3iyUtUft81EBi3xZFP+G5fZd5n1oPaDtQA3veKi8R0SzXhRYY2WsbFVgaTIEt7
         QTQfkO/4RAJQFrfPo9Hp66ZQHRV3c0KAD9sBeIhbOefMPtEhEFissukHX/jU5uw7qx8j
         C4rA==
X-Forwarded-Encrypted: i=1; AKwUvBzvTEt5bHPnrChfcBcmdOSDEaomHMZ6QKN7o9Dk4aKIdw4iIKiJoWfgR5W8x+tT2p1dmmIBcd1XXHg=@vger.kernel.org
X-Gm-Message-State: AFuF++k+JwixaSzi4zNM42ws+zrQW9jwXGx6R8PGHHVN5mkLkww1V4Mr
	1AaRX2Dgh4VrQOdORT1GKMtRtKGaSl3qFQ5PqkDscsptN9Kj0uM8CjyZizIbbe5rLs4ceDSqlFp
	TzC4fwREIsbszHS6oEFskt1tsCUJG343MsJzyWpmwPfloPE7NmVBCQ2Dso1GDmhg=
X-Gm-Gg: AYBFou0pffb1ovABIVWkKEsouh58FU1UWPmxbNVq/Aip4iCWm1LdCd58Y9ncb+KscfM
	uW81K8tTCKQ5MG+bEQUoZboTav+B7OPIQ2LQT/lyrOb/+Fs5VVqfXYwETsrXRvisP/pIIEnG7s+
	5W0Q4uCEvJ47NK8W1selXSjSlrLc/Nct/jSO7MAebSA08t8bl3iDxVnAY2J9YBxpSVTcgcbPNIa
	lhwoDDyt4fVxrxcjOLy8XdJsoE3vhE/Oe/VRUdeegXKOa/zUELwnRCkMsmqMM5qucySRLahfc3W
	lo30Ra5pBlX7QIQMFpBbyvI9sunIaaqxC0Xhio5cL6fQN0nPKhfY2j8s/PLnyBC43VNIUsJA+Lj
	U2bcxvjxsdHlVf5UAFQ410w==
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr798650985a.1.1788436770765;
        Thu, 03 Sep 2026 04:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr798646085a.1.1788436770236;
        Thu, 03 Sep 2026 04:59:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42307e6sm88905266b.55.2026.09.03.04.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:59:29 -0700 (PDT)
Message-ID: <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:59:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXx9PCYVrEeySM
 RJZ49HpJDkNoMx8cl468VdehBwG+R/S7rRCn4SL4QuasBJjGxo50/kLGjQ9pd36FChQ3EPtF8KD
 Sb/Z9mWNEs3SgbANHNQZEiLJAvwVhN7q3CV0qV5e7mcTvRWuLIK1/hUWHNykjJ8LRZVn+vuy3vy
 Mz4pdSasus8f6I+CoVl2bVkcDbJH1LXWx/vRtxt9ucZNHLZtH57M+MLpXK0hfguXorM+Q0nVVo4
 y92w7eV93sgHR07/N2beCP0yrE62hfXbyBei7cG5X0R07iRBgXe6/U4E9sRp7jqGn3ZzuUynD4d
 0KPjGM2v3vLkl0HCyRq1zaMdYOqdMDTbJynymZwI/EQERYS2TZaop0sOXHfDZLb2apBnF0k/hwt
 BUCyChDyILA6m06wnTEOhHdpIL5AstXCx8trE7Yl9JPHIgHGnXOOjUaE4CTjr1SVcKeaeNYX+XF
 Q+CTrax97hJD9FvRfCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX+hZBdQkfk6lx
 WB4ske8b4wYTCysMYUqNSOU2GRkZRg+V4B5CuQgWvPShi25pLr547SIn853hQnTlWH39BSXeFEy
 E0pS24r17UKDZwkEipBlNnsa7OWYxIg=
X-Proofpoint-GUID: 86aPkDJCKIEkkkaWVb1Cq2pcBKKtRu-4
X-Proofpoint-ORIG-GUID: 86aPkDJCKIEkkkaWVb1Cq2pcBKKtRu-4
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a996123 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=lXqaDxtV36Dhfzo6gJMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> Some CMN PLL output clocks require a hardware gate in addition to a
> fixed rate. The gate control bits reside in the register
> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
> new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
> rate with enable/disable/is_enabled gate control through the shared
> regmap for CMN_PLL_OUTPUT_RELATED_1.

[...]

> +static int clk_fixed_gate_enable(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +			       BIT(gate_clk->enable_bit));
> +}
> +
> +static void clk_fixed_gate_disable(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +			  BIT(gate_clk->enable_bit));
> +}
> +
> +static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +				BIT(gate_clk->enable_bit));
> +}

This is also all just clk_regmap / clk_branch

Konrad
