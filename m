Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90DD1B6541
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 21:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734643704; cv=none; b=iWIbQVzc3Jq5wC7E7+Cx3VsS2WwJLDKn4iXjg7cERJDvx2U+p9ilkJ2kksSvJKGvLss+xrburQLvFEIOAO518a2/kGKuaQkH8ViKsqFPk6g70ZawhhIOIWxoV1zJBeex32vbgJBc/m2P5D6IaXsDTsnkYA99JyCDvNUJS42gVZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734643704; c=relaxed/simple;
	bh=cgkCGW7F8juBfQc78upAw76Zpu/tXczi1pONS96pY0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTPmlsDFClw23JQFsD07LtsR5EwYShhHvMENe6pWC2CAP4kx3LVqypRcYr1MOy/PMMIdMSsJayTyqrmZN/yDMllQ1CwaNZkO2xf12qhxUOguQXRC/BSn/2LZuWbu2gCb1VQ4xKArCI09bBQQDkdeTZAVPRTmKxkPuUd0i+xQGW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGU3Prd7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGU3Prd7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJBk1Mn016852
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 21:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/VAUnAOqDKD/w7nsfXSvt4pC3AXzpCBYpE3jsdeI1ag=; b=KGU3Prd77RQ/ARn1
	UbzGSNkfE7ojalLZbAX2gFWUCHWV3WmJqjZ7ifLrsfNKziWEG5UHF2VTjN3QW9zi
	D0aqMvbtyK7768hr9iaQFzK7BzXBCAM+B2dKDHcspKdWSIJYVPMNDSS+Bl+evt4+
	z8sEmKCFYcbvAcpOB55tK6/iFC/y3lX7h81Cw95Tw/RynVHiF1URyFJy6ajUN3Gn
	q9S46kZiOpPk0ppJk0lIL06beV5DjLKDGTMXWaNQpOh1aBVGA6DmqbgNeN3YEHde
	Cl59q9AVJou+LilCK7sXpKanrINu4Kxi/XTPYL+50k48UXiyAVZbZxxHvf5IHOra
	Ahd8TQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjw81gcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 21:28:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d880eea0a1so3571336d6.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 13:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734643701; x=1735248501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VAUnAOqDKD/w7nsfXSvt4pC3AXzpCBYpE3jsdeI1ag=;
        b=kz+8rs/2x0HR/wjv1VvDy6Y5RwPlPeOvHcsHIprizjMuHMVIcTF29BCPzWvcHO97G9
         9w9ObdWGUK7TKz9wIl9gyRbdwo1gHBl8oJdT2cSKN4goJllPdTNR1YeyPhFJHdyiGuT2
         aOU2a97Ig/v2SY35+vQNd1wa32bK4gLqd04O0uvtLGfGcH8OPGBVSV8Smx3TGb7y3gAm
         eVLLbsrY6o+VWuaLeNFRUfv9+2v0UipwoLqh+Ax4mgPGrpWeU8x5axd76WrQ2SHUFt+k
         N0BBfZ4w2bexfBcePXEdOLEwmWGyrZ61kh+KRVr+qe2zMcr4QoeKsktpVLnXG3Mpy1jW
         onIw==
X-Forwarded-Encrypted: i=1; AJvYcCV1HkbVm2abA4u/wHc3hdzgfq3gvVWtZmYGNB2KlAE33RNfusCTSjivZnOYwyVMHPf6jAUyPxnO0E0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzljVi77U0voyPEQc5tC7WhlsxtIFYxpaYzSy8uruiKJuWtNCYV
	jsFxgbj5ZPfZzK7g+P9USGYa6vOqAgegDGasyPulmcEvpnmmKqoD2I8f0gKA6TRMvqBLxA9tjoN
	YguzbXMEcUFqFR/VuTnoEe9VTDqfYTalNPkOpm1v9sI8iWrVfU3E9N7UYECE=
X-Gm-Gg: ASbGncuuWKPWziEgo3MsHzRwZRVyzr4Af2HFxYkfHRhDqFqWZvxv9Pd14ctDorfLjY+
	1KHnCGWlu+F1ht9qtvjBrnBELeX6sM+JZ0Tw017WCzpi/UNxLKFPUbsVQk5NialgD/4EgJqFGcE
	b2My18IIvf6Jb8dN9sVfq9mtZ8oCpzuYgz81IpBlYzivMo5TQB2atXQiZOLGUxkFZNro7+L8WyD
	vx/br+LT1wC9Mw6n4QUOQLMSHbxcOoFRgB2u6Xd+OHt5ieXRaxuWI69W2LPkbfb5j/0cnSnWEmu
	5QTt89YvsSlV7HD1CcXdgmEYULPCPKSwxGA=
X-Received: by 2002:a05:6214:2a89:b0:6d8:8cb0:b403 with SMTP id 6a1803df08f44-6dd233acd65mr2590416d6.11.1734643700666;
        Thu, 19 Dec 2024 13:28:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJnIn0G4+Wnlxs6LmziXnXITZL4O7KHJ/pJ3YBrBe8olWnjoRqJWPN5SOL8KlIfXyMXzRSAA==
X-Received: by 2002:a05:6214:2a89:b0:6d8:8cb0:b403 with SMTP id 6a1803df08f44-6dd233acd65mr2590216d6.11.1734643700234;
        Thu, 19 Dec 2024 13:28:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed718sm1056008a12.62.2024.12.19.13.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 13:28:19 -0800 (PST)
Message-ID: <fb9d117e-77bd-4a01-a738-f72d07f6b84c@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 22:28:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
To: Jie Luo <quic_luoj@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
 <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
 <8063460d-18ad-4e54-8232-716bad9d37c3@quicinc.com>
 <2456ab36-f48e-4aa3-88e1-aeb7895c9816@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2456ab36-f48e-4aa3-88e1-aeb7895c9816@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D0yO4mNf-GCpzh1tdFGXd4P1H41aOzoJ
X-Proofpoint-ORIG-GUID: D0yO4mNf-GCpzh1tdFGXd4P1H41aOzoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190170

On 18.12.2024 12:17 PM, Jie Luo wrote:
> 
> 
> On 12/13/2024 6:30 PM, Jie Luo wrote:
>>
>>
>> On 12/13/2024 2:33 AM, Konrad Dybcio wrote:
>>> On 7.11.2024 10:50 AM, Luo Jie wrote:
>>>> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
>>>> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
>>>> block routing channel.
>>>>
>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>>>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>>>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/ arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> index 78f6a2e053d5..9a8692377176 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>>>>       clock-mult = <1>;
>>>>   };
>>>> +/*
>>>> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
>>>> + * from WiFi output clock 48 MHZ divided by 2.
>>>> + */
>>>>   &xo_board_clk {
>>>> -    clock-frequency = <24000000>;
>>>> +    clock-div = <2>;
>>>> +    clock-mult = <1>;
>>>>   };
>>>>   &xo_clk {
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/ dts/qcom/ipq9574.dtsi
>>>> index 8246a00a3e3e..25aed33e9358 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>>>>           };
>>>>           xo_board_clk: xo-board-clk {
>>>> -            compatible = "fixed-clock";
>>>> +            compatible = "fixed-factor-clock";
>>>> +            clocks = <&ref_48mhz_clk>;
>>>
>>> This must be squashed with the previous patch, you can't introduce
>>> code and replace it immediately afterwards.
>>>
>>> Konrad
> 
> Hi Konrad,
> 
> Looking at this comment again, there may have been some
> misunderstanding. We are not introducing xo_board_clk in patch 4 of this
> series. xo_board_clk is a pre-existing node.
> 
> As part of this additional patch 5, we wanted to address Dmitry's
> comment earlier in v5 (reference to comment below), by converting the
> xo_board_clk as well to a fixed-factor clock. So it is better to keep
> this change as a separate patch in my view. Hope this is OK.

Oh okay..

What's the difference between xo_board_clk and xo_clk then, if the
divider is accounted for in xo_board_clk?

Konrad
