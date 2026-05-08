Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710F1355F42
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238645; cv=none; b=DKNVGyBWmaEzaTDNRVlr1mB79Y897hro1iVyU73Q/wk9JI2DUM3BumrJZ6DG3esOy99RkARlOwaf7nMi8uNfyVJCsd4IC+UzXr6KRXdaW0gvT1FdENm0ruNRCfY9LY9b/28/N/DHxCViiUKB+qhDxD1e65P9b3mefJjWais8mlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238645; c=relaxed/simple;
	bh=eDeswBy3kVQ1hC4y2p4RYl4HS+G9UG3EGp3csnqRyko=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TTiWsv+SI7hVjJnSUeR9LzcDK670OvcGlrgzWpVEKuWO3cbfUjskk9iLKmG65hhK56BD5lprHcqzNp7vJMvFvTCJbd4tReLkXj+cf6Cs6aD+h7CYmQR3GqADRkCWSMpphgKOmMJtWOXqx8R51xDczCwoK3wJd8I6LINKBR4LPl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+ecELfT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnZGZSLF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+ecELfT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnZGZSLF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489hXoO1417690
	for <linux-clk@vger.kernel.org>; Fri, 8 May 2026 11:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45GkX2zQJ5wcTLHOqlJdrhMLCKR0ClrSuRBtygDbg48=; b=j+ecELfT5+YRfp1b
	HkmITfvsoGcZhF2apBjIvgzcZCafwDa9l+rIrxBCBmDUKDrKY3I+YzVi2r7x81ra
	aRicmlfIimFCokiNmfQGd4Ba8AWKI2bftKkXvM8TFx0oxXK8pd2fW7scNxvBK0lK
	lXgJuQtEj07PSvvKrV9hMCPlJXnAHe0v1+s9+EhE/DzsOxLR2YffaiqngoSsgfKO
	kfyosSJJNzQXFPb7wzVgUDyywRAkPqhbacf2F5/9SVhwwua7uVpbGocaibQVpe+W
	8sQn5lKU7kC731Hb3SItXgUm4VfbwTXsUCjn+TKb/LDe+tiF7DjPwo0+HimzsEOd
	VnyU/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhkab1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 11:10:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faec938fcso3164861cf.3
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778238643; x=1778843443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45GkX2zQJ5wcTLHOqlJdrhMLCKR0ClrSuRBtygDbg48=;
        b=FnZGZSLFjOrdy6g6EVbTjscZpM6U2HldRysepnQIWzXTXeV6dafGWAtmGXnupTjWhz
         eJj/DYsYT15qY5a6PiJ27PQ7hTQS8AvJNy1Z4Z22YHS2oXGyZePj3TNEytg5BLaS9vT6
         /XiskTO5KkKFQ9mtThriCDx8KDJutxmG5lmLB1kOR9H5oI62WF/RbXC2L/fccLMhawa5
         DpXiFIRKY+3DpTfetph59cr0gMzeSQuECMrLOUKVUMjKBPH6x+xHENqnymSlLfhyflba
         /6JNrhAKCgfU0GuVRwH0bK9PHbX2ToHxTz/LJWhfrmXEEqRDHlzNyWPDbX7lN/iKHbYu
         9biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778238643; x=1778843443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45GkX2zQJ5wcTLHOqlJdrhMLCKR0ClrSuRBtygDbg48=;
        b=IaL3JRl6lfpt3b9N1iA2etuFTaDlU2n2tjnc31eibF+zhnQfstweBYcUpBVckJ5g3B
         PjjMqwue0n+nybuqhCmcNq5aEE1T4Dp38LW9HXLs58CD+61PZL6MgnPBJ7ikcBttocuR
         o3TfGnFAsI8AYq4dudLwcS38E9USWCq/tCdz7hjLcK1T46//R2vB8ts6aWEOOosPanc3
         fzebnQ+T47GXK1FLaxSPrHGzvzunksCx+wZUSvyI27LqHYND2qXek9lO9D3dSWdq4RbB
         UWQVn1UGG6GtGyC+71F72uXrwJAubyCOTxO66+SMv+dYS4rRyRFM9NBvULdsog66Jia8
         H9Cw==
X-Forwarded-Encrypted: i=1; AFNElJ8AGz0gmhnHrZnZ2arqwrnHgNFFGQPWELIcBGUwtD1SH224+WSg7fq6i0xtq8/ZBDMHCNW/0TuOiKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS9986J7FkswluYcjRFUYh6eSfUBYVuPvi3UsVkhA8y4Lo9ydM
	3k+lEvLtXU+0Fjb4jP/40zdvkYx64m3jCPGPChWnZfzHtiEcY6GJgWM9gLjLfT0InM+rU55cejt
	mFeI0FopD7LhEpt0RCzzOMlx8xdyJJJM0QpAvqVobjrOGgKJOgHDXmK7iLSJ9o9c=
X-Gm-Gg: AeBDieu0MIo+ZLZ/RQuLwEUVhT9jN7XMu1RXxt8xVU42SJSLE94wi6tq3UK+0y5YFPt
	hMP0L45M16mbqxogafYyF2oSzGkzVoeyADsEgNwToXzUmUy9KeXTDZASToQBtZhwqZaxGYkeyWi
	nvDjAjjyFXaVGkYgldGkMiuIdJ9GeN5SOC3jp/0DSlwDr0YMKzV2qCFpTcmCRuC0xVB2uWODon0
	c0Gjiong0QfLao/sE74hOs7lRAP0DnCwYX4o4MdAmekHcB+/N0e/OoSBDcUsIxmUJ1qWJcTap1R
	dPL3nyvuPB+5EZ8ASLGw7w/t6UuxwdmUZjUsxINy4bm2hZOSSl/x9rj3H35N9vdjZMrjhYWLUfl
	ZQFoJE5RAFLgslskxymnYDfYTwSveW2oYogFAZZK66eOoKH+UbrNXgFU4U/oHaqeVONCPb8MGZe
	4sRz0=
X-Received: by 2002:a05:622a:1e92:b0:509:d76:fe73 with SMTP id d75a77b69052e-5146288fc59mr116475521cf.3.1778238642593;
        Fri, 08 May 2026 04:10:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1e92:b0:509:d76:fe73 with SMTP id d75a77b69052e-5146288fc59mr116475291cf.3.1778238642129;
        Fri, 08 May 2026 04:10:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a534sm567288a12.9.2026.05.08.04.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:10:40 -0700 (PDT)
Message-ID: <2d3a515e-d8d4-4cc1-985e-89d4fe31e618@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:10:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] clk: qcom: dispcc-glymur: Fix (possibly) dumping
 regmap
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505153717.303414-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505153717.303414-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fdc4b3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GZO67VJtuFZV25e5ZKUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 4YLtfO2PwqJrMRiceJzDibKD4bfwmQ05
X-Proofpoint-ORIG-GUID: 4YLtfO2PwqJrMRiceJzDibKD4bfwmQ05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExNiBTYWx0ZWRfX/ZRXLqrKiKYu
 AxG4mNiPlEe7RiZkrKJSfHEmTnEGRSYp92xwyBYv7yfgXVrPhhGpkQFCqKjF9WA4wyxfrR+OM+C
 ipBBArD6iDRVvTtmhnhfZrnEbJT7vRNFhOKekDnDaynX/h+U8jQ1aUc378IbXJxPhrSi7AXlyCq
 1VCzUUAwxymn1tVtK0X8M1W2YD8AxO5lRBB1z0TqrAmR6W0mj8SbdROVOft0tkZq9WDUfH5S2GH
 S4t2ZMskj+RmnW0s+QVaeLjUkuGs30HPN+jcCaNQQQWtQsxMhIHwn2Sm/dv4DlHUU93Lz55gTbO
 Ea8+0AS0kvoWIEDBiIQD8Ioo8s5cKSCEtyq7e5hB/L7UfDShO1tSH4yy/8XyOQsi4WlsGFG/IoB
 1dB6wGmBsXmmc7l6j+ZT/1b81ajOmmFSbHvvxFPGiWATDXK/AfRDCQ81OsWfnhHI2iCQd1s/x1P
 6CoxVPSOvYfSdhhx1wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080116

On 5/5/26 5:37 PM, Krzysztof Kozlowski wrote:
> Reading few registers at the end of the block (e.g. 0x10000) might
> result in synchronous external abort, so limit the regmap to the last
> readable register which allows dumping the regs for debugging.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Register map is the same as for x1e80100 and sm8750, so I am guessing
> same problem.
> ---

This is not necessary on Glymur, possibly in relation to lack of Gunyah

Konrad
