Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF8223316
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028403; cv=none; b=RqUL4Ff6+yqD5nQZLdGD2My51uPh7cth7csKacIXVzMEyFzSOxx7E12tg1Svulong5KNjpOWC5WleQ266PFUjLLei+DlSdfj7OKr7uvyC91pBvUg98hrs4sQgTyd626eaWlVMZ2PJP8/9DFdPZj3EmbzrwVDOap5liBKQCnX2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028403; c=relaxed/simple;
	bh=S8pyGemZgDyFrB3LbBylLdpP1liWYPzQ6w+PiYfxTUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kF5L1nVg5B/xEqgUQ7kZWDVCurE6PBkZtMDsPSs3qK+bqaH83m2Lgon/CcE9DA6X1XDu0fUUgCezCSm8cJNT/yYoTy+XuyuGBwbfeGZw4J3X9HxI6KPHwrNFwHBv55hweloe36dYCpsxbDiC4TogxwKnwYufv3/NVQs9WHZAMNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+aVZGCh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+aVZGCh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCH13DP019210
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 18:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P0lT5CU0pXRpSIELwaVuf56/lpIFAAE4uyri3Arzm0=; b=L+aVZGCh2stHV2W5
	kCKcATDhp6Ty1c0xLKj1DE0gq/wHEIxuFLwc1RShbIkg2Ht4GhxQ9oJaU9cUAejY
	d3d7iwj7HP6rF/k/dw3lM9V8l2zjB9YtTWvtcmhH3/cciOvnqu1f1jciuPD5o5/+
	H2RSroSdJfH2KSGr8l2ZQnWkf8eHGCRKRfXyfkfrDYv0NsRh8vjUMIbkmHskpB0Y
	692uc1sqjjSAypk48xkBviIPJCEcy50zjH0qKzpN8m8cMUgQ3Kmy611093taRyuh
	LSzauJ32RR5WQJ2EI0/cnXAjDVvnrO1Y/NeWyNQKy+dTUmNhoDITrBuGaq4RFfnz
	xhx6xw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ffdyugak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 18:33:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d88fe63f21so2394516d6.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 10:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028398; x=1734633198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7P0lT5CU0pXRpSIELwaVuf56/lpIFAAE4uyri3Arzm0=;
        b=xPLc6VwHPdsdM9HUfzDFXuMehuSR/5H/WSfrJS3r8+apvmRm6YkNS+WgXw3n46nP03
         y0Obpntfhhdo+p21nvVk3q8HotkpHQDlvTyxVTqVnQqZuW9yMeUv307qNdgNup2jZour
         Zyw8V/uZS20w0+LVf7vjg0k8AUTFGSbvp4LZKJqVYqns8NYFPaRxGntoZ+jwO96tz+Iv
         wiOUflSp8Jij1Ady01IJu4wBC8lz0OpByvrsuqxKIvqw7zWKfT1xQtG3A2/LYgoh7Pjn
         UizPxjVlro30ruYPkaZkCZPaPpSQdZWVN8HAO8UWdsE4BJIxuXRxTFMjPStH1iIaTJMo
         N1hw==
X-Forwarded-Encrypted: i=1; AJvYcCVZcAc57pe4DCfL40fBtYeDBDDHkFgSrjvL65Gv3z6ptw67xEbwhlibnCux3TbA0Qt1vfpfCXlK2M0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2t1n1YPVEcz512r7lnqDOTe87YfVmYEdbM8dSctcw7aQ9GI36
	nAmxJgI3seusxu67ZlnQoC/QIStPUc+2VwzSHBs7qfaSlfTAM28WSGSKGgAh3CoF4tjDT8t7nfQ
	DsFN1PjoxTDcnZQk8eVgWziA+Pvlk+Kd9EY+N1jiG+HAvW73YQgHNziEDF6c=
X-Gm-Gg: ASbGncv5DRhO5s6SWvRBagtBxMcVCDyg0CiMKgAJCN9OFNeivKE9TVV1yGw19PKFqQI
	ho/FHX/SNujJNQN1UDkewYJywsa/hIpoSoBRESjRpI+e+nhOSc3Z7vFzLbBfAokTxShTSjnCFe5
	JQL9uatD6JXJVsxYp35rMy8aBHaPXNidws9VekwFJVaBv6VLcTJpsOr2+leNaDbTe2+LbKlZd1l
	/lpyk9EfZYRZ/4WaaRoXAJ9RNs1gpb1ruLnR8oDuCR8O7XUXxojP2WKeqvBhLgRUoBF4m7tj6Ig
	ZOoA6cdFVAFELM+O9L2fJr2vf6DmRhsNRiw9ow==
X-Received: by 2002:a05:622a:c9:b0:467:5fd2:9963 with SMTP id d75a77b69052e-467a157c299mr7692991cf.6.1734028398516;
        Thu, 12 Dec 2024 10:33:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+5d8r2euOhZpYPGkl75/hl53j9+GKYqvLkelPut+0NmoKj8nha2RmqO1ELxeypwqRDcftCA==
X-Received: by 2002:a05:622a:c9:b0:467:5fd2:9963 with SMTP id d75a77b69052e-467a157c299mr7692831cf.6.1734028398169;
        Thu, 12 Dec 2024 10:33:18 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa671f1482asm744364966b.107.2024.12.12.10.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:33:17 -0800 (PST)
Message-ID: <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:33:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4anWPo6NjftyJgztCQKutUv01IHO5-LM
X-Proofpoint-GUID: 4anWPo6NjftyJgztCQKutUv01IHO5-LM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412120134

On 7.11.2024 10:50 AM, Luo Jie wrote:
> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
> block routing channel.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index 78f6a2e053d5..9a8692377176 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>  	clock-mult = <1>;
>  };
>  
> +/*
> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
> + * from WiFi output clock 48 MHZ divided by 2.
> + */
>  &xo_board_clk {
> -	clock-frequency = <24000000>;
> +	clock-div = <2>;
> +	clock-mult = <1>;
>  };
>  
>  &xo_clk {
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 8246a00a3e3e..25aed33e9358 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>  		};
>  
>  		xo_board_clk: xo-board-clk {
> -			compatible = "fixed-clock";
> +			compatible = "fixed-factor-clock";
> +			clocks = <&ref_48mhz_clk>;

This must be squashed with the previous patch, you can't introduce
code and replace it immediately afterwards.

Konrad
