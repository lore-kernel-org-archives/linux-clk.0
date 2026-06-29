Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2813F1AC0
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721807; cv=none; b=jXEfqKWfQYwVMgdScPyAvp/Q5NJCMHKwtvSN0z6cUN+76DjaaDXTo3fwUN11dYhhrKWv4oSIUQf8/gx7QQx9CcX9N8vqv/1UHQYil/vIMZFjnDLyL4krjrZQd9q4yqbC+CH3dKoPQXohIsCdgndn1CeaWJ1nrFvs3i9K9p98IbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721807; c=relaxed/simple;
	bh=D2MekIVdjxuVjVCs+BZYpnHPIsXNxfXk4QVxou+Zt9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJZDY1UW1MDwvXVd533jR2r1NCuR7UdkwxLapmjdV9Fxh1dTfmhUMA3u9QlGtADwQr2+PJp3VBCk/3Bf4ggX5UKt+d/JtbpdfV2NZo6xiQ7pnZBxsI8Z7Zyztn3Wsf1+Ya5yImI198fIP4IAPl3pHMSoHDy4p2fmELtmjS6URyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1G0dVSP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7WdfBLA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1G0dVSP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7WdfBLA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rILF2097149
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=; b=E1G0dVSPnSGNVJoz
	7zvsooXKU2XSxZxLDuELJtJhHfb33QR2QmEX0IAyaY3Xu+8bQZ7ynPuoRhxyt4cL
	D6Uu7ihHnM41Ea/eBstSQcp9a+KJg0AA7idZB++tkUanQPgy+D0KXMAd+SfC0O6A
	dksmw0gjonaduJzEGBDQBr6aQUnGecF9sBfkRbCPXkIJFmhkEDBmStTusokS2fIF
	0FoDUYf1afLK2rETiyvwXgoWkNeXovaNUg8RvnJpemjAlELFqO8DOadkodqfFrDV
	u3EAFFNz9ucMd9j/XhgyRXaCpBYPLynZSLKo1zJIovA2j4GZ/PQ78iLiKlecX5Yq
	2wiaQg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7wbus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:30:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so228910137.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721805; x=1783326605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=;
        b=j7WdfBLAymEV49XTLVDjFJe8CB1GEg2zBgTPSC02F0GTABbYbZt2VasFLKS+wT+nd4
         T/jYpmUma1gyo3XOinpZhlXlsiSXA8pH0ZxXJD5ah0pQuW20o302n1byIVMZ/j0d/HpK
         tNOgkAJUOvvNF4vXd6XPDaxNhcBTGs7L0x8HMwMDiLDtdZQTquKIMc+M9wub0WLasm5B
         Y2g83jBxRFWNuYfIYu2eBfasghsf5vQjAK3xJM98OG92FflddMYI3gj9jw1HB3j3J4pT
         JNf0JaxXi7qSSE0vJ31RelI4O0jlfRnZvty+aAsUW6HoNGdRT/Tyr8wp5IvuJG0LLOoT
         MKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721805; x=1783326605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=;
        b=TATZYVN/bhTz5DN86eAdJT3RQJvGSlsDb+4fBv1TLoHPTA6RQK+XR6kYCaZ4OuhL4V
         0vlig7eQ0Efa60T7rBmfycxWnwwg7fYarhkVZOputLcAyoZWB+8ccI6gikXqe6QUMfWQ
         TR+voaEwqJHcMQpeseBjZNgGbSne5+h880fedG+1nV4Dg8abs2RZ+5F7FX4UEgvLMqla
         yqd9znBqD44XXZ1TdZZIYqkm9P0ep84x7rGpJ9CI2L9C0WD82L9KryHB3DcIDgMFcTTk
         aZwMlEkzICpM/O8hFZH6ZMBqSH496TUShpFJ9hTWJOr0SLXrISbv3PuRvxXSoJ8vXfKt
         9muA==
X-Forwarded-Encrypted: i=1; AHgh+RpJfeQ2WKxQhOQN8BGnIco1w+g9k0wPDDEMQig/2O+LvJQqTeqV0r/1BRTUSWjKY8Hev90oZM0lq6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKjnu5ggDK4ipJe/Ybdhj18Z/mB+LCQYGhjeGDqpG25oQJ7tC1
	PpRzRBde0My8mgl+ldl5IkMYZWf4eQdC+o0moonHgJBUj76wYCD8iR/5c233ri513gVMSkVHs7p
	Vy1b+TQecDz3LjgR71FWpNz1MO46x1+10SmzjwdeuK3cJCmHFitHPaYtiI05Tr1E=
X-Gm-Gg: AfdE7cm2tTF0iKC8XIluB85DsVY8lQ6a1M2jxiTcT92Uf6nah9ZExPFLOKDUCklBB6L
	oPD2DJcgsbMiqaw9Kjyil7t98oEmJBdYhZxzQ9sRJn/qkdlH40hrUfQ6PuJlL0u6PTS70+N7jti
	fqhFDvSYASpYLFlhYdMnxKHSyAXmW2rmHld3EnK8yW63VI8QrBzPtGqbQmgzHcV5vLpitkWzVNQ
	lvODcEK07bCGqQc1rWfU5gqmDbWXQ4z2UaDCfH1DnmGe0u6ewQdID7A3+nmB7ncN14mjGQpMWJL
	PGZG2WuY1Ir4s0Kx0wPcQ11dqW//Fvchp95sHSz4s2IHSGdQWTYeyYlzWR8iyCHLpmR/kOml1Qz
	KtJK03t6wJqN0NRoMwPGgGMANSgnVAhrrm4o=
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2285279137.1.1782721804967;
        Mon, 29 Jun 2026 01:30:04 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2285276137.1.1782721804606;
        Mon, 29 Jun 2026 01:30:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3aece6dsm6526300a12.12.2026.06.29.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:30:03 -0700 (PDT)
Message-ID: <b7365b1f-6592-49c4-8230-ecd2811b4716@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:30:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NyBTYWx0ZWRfX/1yHr1+yQre9
 S3kZA2HAw08WY9NeLu7egXzRoWGHjEqZ5PeHp8FNmfMGKf3rA3P6Lim7ABXebZE6ThmKpipqTlh
 zY7IypGf9tDwK9+hJAvKO6wwyBEQRgSqiLV0N7J9qqMAqGvEEaJTsLp0TyuvM62XUfWdBVu4PyZ
 KM9Oo8CvUoHTcbusVCg+JRLQNR+QEZuIDxybxM4hOVX277z/fuxtr00FQKI4LtZ7G4GsAqX2yrJ
 2gDLJDmkzDKAoknNGMe8HlD+DfrnIn0fhov4OPBzyT4fgpdhzu3h58ul7bjcZ+90HN1EBHqH02Y
 LmG+EmaBKzN12RuGD0ZQSD54kCmwxz5tFewp69yNrBLFZ7t7A2Llf2pI1JTFvxTEbr3O33TUMkG
 w4fepAuCbrmKDTgFkS53sFAecgQwp07A3Q+X/Qc3yNDlWInRyWDBhgO8QkVHT0z5NfX3YLry/iN
 GJ+QcapqoBG8jwb+Sbw==
X-Proofpoint-GUID: LAleHTnwIVBGCQZpDhGE_Gkp123LS4_c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NyBTYWx0ZWRfXysiqF93Y0ida
 4My8W+lJnNiMegFNM9EnhjJgBin2H5S7iWy7GVCBOnsjCG90j44UTHUw7e21vhKuUrzRWTTyiuS
 Qulj0PUriXurElsWwh+DK3W0qqZxwxo=
X-Proofpoint-ORIG-GUID: LAleHTnwIVBGCQZpDhGE_Gkp123LS4_c
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a422d0d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2WSQ0cfqpqpHfD7yDKYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290067

On 6/29/26 6:38 AM, Varadarajan Narayanan wrote:
> The Application Processor Subsystem on the IPQ5210 platform sources
> its clock from the Huayra PLL. Add the configuration data necessary
> to set it up.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
