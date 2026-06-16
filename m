Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB8F3672B4
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619132; cv=none; b=qyyvizaLIULFCKd5VL7g8e/7JsYkD0hbCDD9xBTOHraS/YkG9Znn3XSc7av0qOsr5GMb/rlSyCaKwonO8ZpgsPx8PRE5wb08v7UMr4lKIrig8a6939kDkAn4BpT8Zj1MVbAQy06hOAEht2aq8xtm3s16mGb0ki6/3Bazzedxo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619132; c=relaxed/simple;
	bh=x8yUfoFxAhFDRRTit9rI8yq1i0xp7HebowNy8+VsCYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UF4djso9AIfFhOdMhUr9aq7BMPAujKsmVVjIHgHC5ZKr4czygjpJxKZTLt3oqk9NYqd3vjZluyNQw7G8Wzdf/GSHU5I4cLwjecIrKsddAsiEA4DHBITRw71scHTwSs1wwxLFHLowGKnTB2/4F3xMDymSeUImEiIcU7IK0Ei2KwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aR8e4pR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUgaf8K1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aR8e4pR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUgaf8K1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxqlq3764767
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNKddDCUUUEc5ctuxhNZJ1Zf0qD7W5gI4Bn6S7GosKM=; b=aR8e4pR9e2/VkYxN
	4kR47l7J4EwdQ25zsKydqm2Sf32Qa1+lzPsRyA76Qaya007y8eUI58+9AFn8Qk8K
	yj1Mh3xo0nP8LLnmgpKFIa2AMam800PN2VeOobtlh5LmRGdfDWMIQ1IyD26WJR9Q
	pt5M3qGVQiTxTmBQX3lXTAns1yf2ulBDiZJ4K4GR+uU164ZqFdQhaIe82rjo3715
	p9P4XhDqGfh3ymsIY7NtQ54V5+78POHI4oaUM8QTvvP7o0KvpIN5SUk/nmajRpR/
	4EPSqxpd25YnjfuEeBNnrDDkFVQwYV9W3OXM/b1sstcLQVMt5K8w6OF5ettMDXEA
	xXlpXQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09ka7av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:12:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966d2895042so14541241.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781619130; x=1782223930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNKddDCUUUEc5ctuxhNZJ1Zf0qD7W5gI4Bn6S7GosKM=;
        b=eUgaf8K1uDckH63M9yi6YPpVLNNAWGGLRWXhj3/pjoI7nz1714Z/aYMlMi+VCtKN7L
         zTabLasRESRdOWufiu3/bOCeYUNBlzjGwQVKGhjm7bu+jagyUWQ58uVQcEJt3rw66md9
         xK00xPrfVNKI8rNZYhrGxktHcFpdZWdyc3wwdKBvE2MVB0FeFcGE1k9m1LUDB1j9HdBw
         b0ppg4b4weKhRtlH2t+c0dG8WgFZ10Au+9gz7zBre4aJ7wawQsTeertUxoeCMcGeIsBk
         ICJEuNq/+258Eq+Hi9W/oqzhUInF6WJsgiVvdNg1EEjKvvytSzWSzddZL1akQM7dxUXc
         zM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619130; x=1782223930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNKddDCUUUEc5ctuxhNZJ1Zf0qD7W5gI4Bn6S7GosKM=;
        b=qeLFtkYtgBf18HSNrYx+7b+Sy9ZnEkBVLOdT6rzU8ifk1bVhuNcRc9NdDNqUWz+Gfu
         SgjlyLbDHVkRJvR35w0fX07KZ5Mh7uWjgFdz70MjLH1eP/m3u6oRuneXW838UlVQsS8p
         43FwoxZtZxQiV2MmSKh7ZpEGkjfFDDuPyWpd49WSGtQhr17r+6y3jqFfFueTmaKFpusc
         bG2yVris/iPQ1Ler2S1XWDdvXMCpMcwfrzxoWURppkR+RuOU6khlSsALpN5K+hXXOU/R
         aHbvLt+tXFii1OlYIB/JCCNc3JMsuLV/N+xkQvrLYXWHACKVodBkSJ167mO9VFOUh3v7
         8CMw==
X-Forwarded-Encrypted: i=1; AFNElJ9PjcsEdlG8RCIkVaNA+B5vQOnMyWTWhZnyqlHpke3tXsB85YzeLiFgc3hk81pNLkD3F+N70tkT0iY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOZaA8KVylwcwDjAhAkc+br0a6yJAb8PZ226bmDwWm4JXUfjL
	XEMFI4HALTSE+m0ih07MSt6LabU5/JOdUrYJlTBhNG/S5upjH+4Py/+EqnVCRp7iKCtKgtfYh+O
	E0lB2TVbbnvt/9DlhcSaJI/PEkngziAtMISnvj6Vtj30coBTpc2IkxoWBvSTVjXU=
X-Gm-Gg: Acq92OG/MYAt0WGPeonKW1HEhCGi5QZOoNEu1J4Czur3JwdovSdbd7j0iayhe51wJZx
	74x87Rot28gPHB56wHGXCyHMr1KmFKpg3TPnImUf85Fx3HpUcr6/Co3x0R0ZvIReKiQ6339ZvQo
	MT50NbRMh1haDKlRP99j1zukrsN8thNbWZCIKkrhqwSqZmin57ZYxBgsMYT++RdaLYD9RoXkj0X
	fFiO90hsIue+ENPLE+ZhUMfR/lEC8URrAjXFP2gWcBK6cHEfQNatzIWxTf23vA4q6bya+kYFUzK
	OSJ3V0DmFHVRww+tgKDwDoeUEYgfD3lbemPb+kjKz+0Ozs0sevTOHKGge5k44+utmz+nh7vHg5j
	o4ga3uKnJklMAMe+iBBqNqQPXL+gt4DqEit2wseOq9jVPDQ==
X-Received: by 2002:a05:6102:3913:b0:634:11ac:12ca with SMTP id ada2fe7eead31-71e88f90c91mr3142972137.5.1781619130021;
        Tue, 16 Jun 2026 07:12:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3913:b0:634:11ac:12ca with SMTP id ada2fe7eead31-71e88f90c91mr3142950137.5.1781619129480;
        Tue, 16 Jun 2026 07:12:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5103710sm656788966b.22.2026.06.16.07.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:12:08 -0700 (PDT)
Message-ID: <9b66d6f8-7eda-4eca-ac3d-e1dc8306c677@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, usb4-upstream@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
 <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
 <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0NCBTYWx0ZWRfX3QGCxNC4iiY3
 18DVS52VeRJcqooUZmnupzwRxwZf4/d3oAMqaL07f+N4WP5qf8Kz6Ei9M1ZjvkiMuAMv47XO41N
 vKduCNwFOO/l/E/og3hlkmwYC81ahQo=
X-Proofpoint-GUID: UbJanrm5CikLUfYlQbe9_RjR-aM7IFq3
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a3159ba cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=jjNbzz9fy_0zEZUIXogA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: UbJanrm5CikLUfYlQbe9_RjR-aM7IFq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0NCBTYWx0ZWRfX03OG/vyferHv
 SjfwEH5xKAhNW6r+04zriNuXmE+EsAl+/NYUIuUJlsAJurD/Pao8IcDUzLRNf8l0UI6EX+AbxnY
 XsNwaBqZLniSEsJS5qJKxCCZXVEiToa1MFDghnao8Jga9QVzGko6RgzzyFvH9ONS+0vpNZnI/nU
 Zjo8N8X/V7neg2UVHdkV+bKr2VUfvfuScNmgEc8z8/pn6F7T6b69r55eCU22pBomrV7xAeBmWA+
 FJtNfDGW/KZZez+HsPJCh3nk1nUZGSfdWGLDMgNjw3yIZucRVG6ggJM0FDTuRjxZNhYV6dbCyDM
 /IeYLR1MIco/bC3kCUZjYI7YIHhonG7iNXaAD+tLYbBIAr5Og+aL5VBjj5bgKO1Iu4dGBKfmM8i
 BfURAMcDbXP9hGci0SeeFkVd5iC3qT75SY5Veip3BvnbN1I3h542l+u3o52AJs3SpqZe7TTqs6c
 yyQyr3GvhgP7Cwo4n4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160144

On 6/11/26 9:38 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 10:09:55AM -0500, Bjorn Andersson wrote:
>>
>> On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
>>> The sole reason this hw exists is to let the branch clock downstream of
>>> it keep running, with the PHY disengaged. This is not possible with the
>>> current implementation, as the enabled status is hijacked to mean
>>> "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
>>>
>>> This is an issue, since the mux enable state follows that of the child
>>> branch, making the desired "child enabled, MUX @ XO" combination
>>> impossible.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] clk: qcom: regmap-phy-mux: Rework the implementation
>>       commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c
> 
> This breaks at PCIe at least on SM8350. The attached WiFi card is
> not detected anymore. Rewerting the patch makes it work again.

Hm, that's anticlimactic. Can you please dump:

gcc_pcie_0_pipe_clk_src: gcc+0x6b054
gcc_pcie_0_pipe_clk: gcc+0x52008

gcc_pcie_1_pipe_clk_src: gcc+0x8d054
gcc_pcie_1_pipe_clk: gcc+0x52000

Konrad
