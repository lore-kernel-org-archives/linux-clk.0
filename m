Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABF3416CFC
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008696; cv=none; b=Kky9nORy3+2ri90ceFb64ueIF5Cc9V077gf7X8ZY5VtbH2NHNDz/evZPzBWqeKmVVdjX1DBjbt+5LvIZhknG+px2CC9sJ4XnfjaztDpvlcQPRDRE60uhgR8MJQaRri4cN/DSLDuJqX5Lj9922JYIJbwcY02gzKpvcyVtlAzDAE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008696; c=relaxed/simple;
	bh=mRigYsMz/Vz1sevTe6C/YeJI+ZTCaQr7OOMfR1RkZx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twlCZuIYaNWzYPc976R9Sob9seN+8IpIcAsLwdEv5zOgDqmZHguDG4EC4WL1juDhFMzlotSSA7hXdT/jVNKtjd+W20pnRC3PAlQg4HXRErHMxoayp5pQnBg4GMfWmCwjZBnkeRhLysGYy6nTouw4YpawFpmXuwC76G7WDnEhw0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZFeaw/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ah/X19r5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZFeaw/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ah/X19r5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnC1w2119396
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 12:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=; b=YZFeaw/aOXFI6/Po
	ZJB4LKmVfB3UXxucNHCzwUlUdadVODlnA9gmYzlSIZW704lKc2MnQiqi0zXxJYuG
	a4XkTarBFqPpxYdLoU+wQeeU1djgLp6UIowZvSpew8iOK48O3sITbgmaYAwhiRDx
	U8c1cD8DGrfTT3YzzZGFdj5b+9cib4NdqmGlJwmFMEFor7nj+oH27KvBujkZUWsb
	0EETFvLwS1QBdhN3c9ksibXR7YhqqPDrj4AZuyUc9QqN0kGe1oHrzhUVhhv2wa99
	erYtxRAw6ZS4DSik9FxCHtkWIQjm/VWr6AOhG73EajrRQ8/xZdLjzFHHrHbzO/2/
	Zm9pNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wgrnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 12:38:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b12d7bbso9751211cf.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781008693; x=1781613493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=;
        b=ah/X19r5Zx+R+LlxG432xjlsZzmzixUphOXANjTrqj5/WWYAdmoEZndN2Yp1exl0ye
         b+LTj2itUXvnZFihkEshIbg5pqB0+rjduyIFdza0D273lEv0iqAqXAfx6x8XvHzeHd7v
         o3mYq/CCz5tUF9RkGIZe1NC8X4HVU1jSGZcNlcWgnN4EQGvWwRgMnkatNmFWT3ilNJbW
         Pigu8bn9k2hjpTo7EIEnRoIBs8NC8VK92UUfFetlputsa+UjU+pxfHNhnTxggy4ucO00
         cjQkIdiMnd0qbhTKihGm1hA32sVwIWZe+luT+jSjN2ZJlCoCgkw1Ezee1yxgisBStzQT
         3s5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781008693; x=1781613493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=;
        b=cNBps1T0vE2KKw8KkNibVTpOy//90l96lPyJildgBjcIz9QYNSGOajTsBonUU1pCY8
         lLBmCE2KnGeOJVW0AOouHZSYdqCx380dTJRmt1yL2J/lFNwFLa04JDOQmOfYl46iicVX
         vWcObzaOV4zBxB7FamXYyoxQEkZdrXHjlBeugTa/nxiuFkP9HhkKI+D0/TcykH4bdMzO
         KV9amDXSir/6DcB1Nr1HtHB8Jz7RZaKYg2M55DcaVJyfNQVNIBLwklJ8499ABmx7HjIB
         pRRNDUoJNkQP/WdZlNUIQWvkC3uHmJVwkEv8OZ6tJGJrvhBE+mhwUbxk/UHlk98QXcIx
         J2ng==
X-Forwarded-Encrypted: i=1; AFNElJ+Np8g1uFu9GV6ySYmXo8ylklf1fhed70Zxz8jrs99wl0X7zi9wqrCO9nyRkCZqWhoBzmHCv5OALMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAUHI1+N0NuAS7zXcTBwfId4xQVPc5ULarLGCteT9T2C7o709T
	lB6HMURVY8xCVmTn21xWHTaVyw6WuGjessxnTYH5dQnZLPBXsu8sLmX/w/DPkGsLuvnvaG0KWly
	/kcu0fHLcnzzrxHXNMZhSGP9HzRMM5TEUqqKCc8K80+DEay0UrVd3G3yDdLDjg4KjHdj+CRY=
X-Gm-Gg: Acq92OGPnDxefmIUVNAj8T3CtMPoZNOSUwLVKV5WKK1wduQe6isNL5BQW45Rd2824sW
	Vi8RSLR0VLV66pf7S8Vvf15Ho9kbizxEiD5oj5YshfLHVc3upCBP/cn1pYP6mYWsQ0y9RDl4bBE
	WRk8uL+X3Lapum5nROInDLBJzCySA1jx+PhAO3mxLMGfyorInRptl03Cvtfdrf4uZZTlmwuUqTu
	6aHpXjEWYLRg6iBecCVbshkgwrqsc4dcjUZPlr3HZFJHzWm4xxsydE2RWXEOQPLKZdYSS+d+/NJ
	YgzlaC92ctPlswtSmakjTGvumPei/wak8K2ciNKpChPp7Koji1bGa8QQ+0O+7b174SxazrKg32P
	u/CAGnVdIN32a9spSsmDya+0f70FzD9001MRnLtDDuoRISQzXKMcmDHg1
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr167158851cf.1.1781008692647;
        Tue, 09 Jun 2026 05:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr167158511cf.1.1781008692089;
        Tue, 09 Jun 2026 05:38:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c85e76sm1053734866b.15.2026.06.09.05.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:38:11 -0700 (PDT)
Message-ID: <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMCBTYWx0ZWRfXwZ0qbuvOCa0t
 3nXY1fD24mhZwYCy1XKxHni6fuyhAYuhUM/l3D6Nbre4io7KLzv9bsHIBsMi1PwWKI1WHZ4XfcY
 l97NJ2DrPBbH2OoL5OHxSK/wpB9cgvyiJ/9jkBvgkR8jXKZ/iG89gpG2jVwiDkyP8rFGMky9gfk
 bRylcCBA0nHly6um4k1tKy+Sud5Awxa2duMrQgD55js7WWL6u4Lk/zTFtvsy21Qy/E59JvIVmgw
 7zEdJkbrsHH1CSUHBmqEm+BRscpWunu05BsHSnWVW+NqLja4EV/Kt/JYQjTlg3UNyA25mDem466
 II9aZaMmm1SXHQMQsJ/0omUFWHp1Wg3OwaE92ARZeu6R93AKxTiLWvzHlirTsL2hGGmOKsKpFOO
 2OqcKCWY4GqDjFgmwpxubDSUQxunFNpV18qFkNOhKtBRIwwDkN0P1fuPNayp8drMRJIsbl2/OM9
 7Ed8qSo6EZLA1ge2ttg==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a280935 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4hBvweVN3K0BpMZFuekA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: U1VZDJ3ZbCgzNf4cqFpE2grRwFPcR95O
X-Proofpoint-ORIG-GUID: U1VZDJ3ZbCgzNf4cqFpE2grRwFPcR95O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090120

On 5/28/26 4:29 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +struct qcom_clk_ref {
> +	struct clk_hw hw;
> +	struct clk_init_data init_data;

We don't need init_data for each one of these, we can construct it in
probe scope:

struct clk_init_data init_data = { };

init_data.name = clk_ref->desc.name;
init_data.parent_data = &qcom_clk_ref_parent_data;
init_data.num_parents = 1;
init_data.ops = &qcom_clk_ref_ops;
clk_ref->hw.init = &init_data;

ret = devm_clk_hw_register(dev, hw);
// not needed past that point, __clk_register zeroes hw->init internally

Konrad
