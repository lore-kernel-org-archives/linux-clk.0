Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8623BBA02
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145056; cv=none; b=m9JiJFofEW2dFKQLS+Pysp1jaPP1+2ooHxYDAhiXJmTBZaTIDa8L0h9dAAi3TyXcSfDRMQSEfj5U/BT3w5IL6xK0XrBOgAfq1rrYuTK6235CMXQcbIIoGmjTnbT3TAx2Tnls3pd7TVFc0/BH3KI+d4OvyJVCwDRnkDAgl9N9Zw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145056; c=relaxed/simple;
	bh=6Z54xXZ7O0OzD2fbFV8YHjsC5EErhrlwiIX1BVElLfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDI79TL+8gZhQvfCdklrYDkALYNzuwce3LIHagwKtVg+ovXn0qVlE+MB1k822ZTLBBcGdXdY0gokmoAiXn/Tyj4V8YzQ9Pp3xk39sKXi9CgYsbSyc5gbead5COo+1j+/TX0sUi7+oGDLFGvs11LjzOYsUlz3nA9lcLkLuVyYnDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kRQINKIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxSrktwS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kRQINKIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxSrktwS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8pbII3690649
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 12:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8u4ZSwVx2s2Y7OGu3dsf9f3SyrRt6Q7IiSU+i76KfL4=; b=kRQINKIfnn57uQSW
	afw6N3tAvqxxOXPdB7L7ktVRL9EWfww1h2LBbxh7ua+6N0L1267qkefvWefMByw0
	p8N+5Vl1qYpvDHd+/SsVtFoJvsoNYN/KEHdneDBG/lUaVNK+BdKN1dBTMC4lYLsf
	v4WidzrTxVEv6mXUIN7fXH+7VBuuf01ev/y4oxJx2/9ck+K7gHGgdRn9DUKYlJW/
	iwvabEE3RO5geY/Q+CVO4tlfACpuyaHwzjyUylcSDBJCsGDDRitRCNrbksvnMwAY
	TdhgAGc09deQMq3KxTH4nUqQMuRZ09t4fAF4+OLFoTFq7hU4kKr7C3I/47N7qVHb
	D2cuhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngt8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 12:17:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7604c6a8so222984485a.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145053; x=1773749853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8u4ZSwVx2s2Y7OGu3dsf9f3SyrRt6Q7IiSU+i76KfL4=;
        b=fxSrktwS+2adngO3Mnxhc4mqTipfGvHbyRD3cyMixiwrwJsh+9SG5cxmFv7ihySkdl
         3LW7yNjdGRspWDgo9c6roojzy3NT/NPQYBJ53ui10x8Z8xHw/cQUCOiN/Ylm1qEmNVT6
         xt63tAtnzGGL/lUszaykdt14d4zAb+TEeftOlCAJHBN7GGu9J0ORjXfYU/T0XS0ST/hF
         pXC5I0cbqMLa5T6xMl+7Jfv+CFRnvedxcfxcdWYzAAOFreZxLRBuv3ddpMGsjGEKSfFu
         76djStC+cVKn9+RvqrKKdDaHUJRmPxyl1jZ7DbyMXuS1cBpHHB3IpKyw+2pqRO4zkFEf
         TJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145053; x=1773749853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8u4ZSwVx2s2Y7OGu3dsf9f3SyrRt6Q7IiSU+i76KfL4=;
        b=N2uGwJqHtLWzggMXc4F5HKYv5N8+ODVocBRVHvjlCb6YYo1fdejEfcQPsSfqyK9AXA
         FwrDhf4COiP+vE5vLGqPRjMUPchqmT9KaOYtLFsSgciWn3LX+YW6d4FWwa3w192PaRMO
         D5N8PVUTGZjOA1PhIGV04p6qmQBw4OhxyOtxUNMt8tKTbymLmbPtfgL3tNFDFiOagXpV
         44TA4+Z4ygocGpPu8Pc1Ke/T/CmCXg5hUgz46t4nPsDCJ/t/c8Hn+JkRFnJndoKutaWm
         FAQbVpWuHvaFJjioHCIPQQpCRVmFDsQgAMJxodChTjewYkaHyPC6rYLSiwH+Gk6bWv5w
         jl+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxHLhSooRgAG5S/jv6Te7DehYb9LOOgFl7v4QG6uIo7X7IjPacYxBsLJt0YCt2AjvTYKVL+7U+ry0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXzI0RGfNdJw4E86c1EHEVSBYYd3gr3xiQTwPP8Z7SjQx/Wnr
	mUq9xZvnT9vQC2zlK9fAvT3TaI3MdNGrkHwNrcYebzqrC5U6AK5i8GyZiZVH9vf/x6faoVvlLh8
	7ctNKxzAS4dXQ2Mr1AEzbKjad9ab7WJYpi2XRyHSUbWYGkV0AdkjNPhFsbbNmROBa7cygk+k=
X-Gm-Gg: ATEYQzzmjbFp6wjx1rM25c2sBG18nMXJ0GS4F9XoFo1GUlUh5ei/qbAjDd3vL90IVCW
	A1gMQLU+AmNbH9ZXHbjmmv2E0z/OCmm9i+vcKHG8TTwCTSNr9C0I6V405D/hWdCUOz6fjSxyJUM
	zDMG90Iwwo7KLfyogZ3YS8DJTbQKa45Fv7lDbvyyzSEhAR5o11wZBYXcMMcEoJeSYMrl4RSWNDl
	Uavsq9muzRafRkudDxvhMU2KLv9UIKqsacsUNE0bDypDsbKa5slqf2upViCnyOaTC+KNZjqYh8+
	F7B0QDcPB6cc13XvtxlO5BuZGzkEOeUgcg9JaEMJsUK5XI92Ja+oblOfBzm/ObyNfID/sNl8n/f
	nYjn4HRS/DIZqt7AoKW3869ZD93qgEp9bvXpymJS+ekGcZQIoCNFWb81YQ4uYqEZvZpDPJt99Lv
	QQm/0=
X-Received: by 2002:a05:620a:a28f:b0:8cd:86d4:648a with SMTP id af79cd13be357-8cd86d4668cmr574299585a.4.1773145053153;
        Tue, 10 Mar 2026 05:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a28f:b0:8cd:86d4:648a with SMTP id af79cd13be357-8cd86d4668cmr574297685a.4.1773145052751;
        Tue, 10 Mar 2026 05:17:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a2b801a3sm4288761a12.0.2026.03.10.05.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:17:31 -0700 (PDT)
Message-ID: <4ccf78a1-2a96-4d32-995f-834d37e9cd0b@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:17:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: gcc-sc8180x: Add runtime PM
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010653.4266-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010653.4266-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LaT68rpoyk9OXMh3g5VwZVgeonDqHuqb
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b00bdd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=t7adyPguPgru3dqzU18A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LaT68rpoyk9OXMh3g5VwZVgeonDqHuqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwNyBTYWx0ZWRfX1LUTET8CIZpl
 EJ8y55pJcJCkMbCFptY6SMHdzfxbFcUurSc2LlYAPUEe4t7XVecLzahR12M86NUKUeZpt3fChfQ
 a1jjqwueHEZpARxwpo/416nVR8u2zz13W3zoYuVyzGHcGkJGQF53GPN2lnDvRRzSv0HhEKIruy5
 5TUNyBZY4W7y5tDMucTs3LNg3MgbNaf1h5CElSbLvVFtAOnijVIyRKRKvIIBszRqFgjz6wvIqhD
 MHbeu1H9eKwBI2zZriKk/IbBtEjHAfXFRSa4XAMlbMKjvV2vTtnX41NN50EBBfsVtVbtkbbtmhE
 1K9NYAif361MHDCC5CG+6oMT4GSYug4yWF7fWXj2vB/4MhI992Xi6fhor2IYV1UvOOuuqEj4CAe
 YphwGN64H6v/gLvrlwSnH9e/d4OeTFCdzzciOj7P4K/9WirIzkYQD5be2OyPhBv+qeCQdaDVq96
 MLJo3EER8KM4cGILGPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100107

On 3/9/26 2:06 AM, Val Packett wrote:
> The GCC block on SC8180X is powered by the CX rail. We need to ensure
> that it's enabled to prevent unwanted power collapse.
> 
> Enable runtime PM to keep the power flowing only when necessary.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

I was always skeptical whether this is useful for GCC - here's an
excerpt from /sys/kernel/debug/pm_genpd/pm_genpd_summary:

cx                              on                              256
                                                gcc_pcie_0_tunnel_gdsc, gcc_pcie_1_tunnel_gdsc, gcc_pcie_2_tunnel_gdsc, gcc_pcie_3_gdsc, gcc_pcie_3_phy_gdsc, gcc_pcie_4_gdsc, gcc_pcie_4_phy_gdsc, gcc_pcie_5_gdsc, gcc_pcie_5_phy_gdsc, gcc_pcie_6_phy_gdsc, gcc_pcie_6a_gdsc, gcc_pcie_6b_gdsc, gcc_ufs_mem_phy_gdsc, gcc_ufs_phy_gdsc, gcc_usb20_prim_gdsc, gcc_usb30_mp_gdsc, gcc_usb30_prim_gdsc, gcc_usb30_sec_gdsc, gcc_usb30_tert_gdsc, gcc_usb3_mp_ss0_phy_gdsc, gcc_usb3_mp_ss1_phy_gdsc, gcc_usb4_0_gdsc, gcc_usb4_1_gdsc, gcc_usb4_2_gdsc, gcc_usb_0_phy_gdsc, gcc_usb_1_phy_gdsc, gcc_usb_2_phy_gdsc
    100000.clock-controller         unsupported                 0           SW
    genpd:0:32300000.remoteproc     suspended                   0           SW
    894000.serial                   active                      64          SW
    a80000.i2c                      suspended                   0           SW
    b80000.i2c                      suspended                   0           SW
    b84000.i2c                      suspended                   0           SW
    b8c000.i2c                      suspended                   0           SW
    b94000.i2c                      suspended                   0           SW
    b9c000.i2c                      suspended                   0           SW

(this is on Hamoa but it's not much different)

You'll notice that the GDSCs are counter-intuitively **not** children
of the clock controller (perhaps "anymore"? maybe that used to be a thing
in the past? IDR)

This means that the GDSCs (and therefore their consumers) have their own
impact on the enable state. IIRC (which may be wrong), the clock controller
would be runtime-active if any of the clocks it provides is, but for that
case, we already (should) have clients voting through OPP.

GCC also has no 'required-opps' (which would make it hold a permanent
nonzero vote like some multimedia clock controllers do, for PLL stability)

I was curious whether 'unsupported' (i.e. not RunPM-enabled) causes the power
to be kept on, and it certainly seems that way:

gcc_pcie_6_phy_gdsc             on                              0
    1bfc000.phy                     unsupported                 0           SW

(note this is *without* pd_ignore_unused)

A zero-but-on vote will be translated into "lowest active state" by the
RPMHPD driver


So perhaps we should do that after all, as even with an aggregated vote of
0, CX may be kept on, but as Dmitry mentioned, .use_rpm is the correct tool
to achieve this. I would appreciate if someone could (n)ack my thoughts..

Konrad
