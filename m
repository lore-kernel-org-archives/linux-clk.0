Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC83B992A
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729539; cv=none; b=jtqS5fzwFazq/vAWtEaKpiFdUgidG3Hth2Xc9bwqZy+9CDXd/AlkpEt3nJCEZAZggKrcN4JiVgwws0RCqMJKqirlW4TQbgp6RoPjqfMO1jOd+ShMXJqXWrA2XwvLjm+1ZgMKxQI18KcgfuVhNcWMlhNpTle8o5Rr1GqQ0BccKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729539; c=relaxed/simple;
	bh=LrE7fbEwnME9lt1owyrkD/f+XIylRcuGgyJYKdiDMvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWvLDFFlBYVv74b0ZYZVFjUPWqvD+SJhVPwL46Pfo3lIwlnTRmngsx5fNfY9Sem8DBhD2nmj6HfBRCkI+WExw9fI/6/MiMPu3ja7EMy/16hRV1IU76PR9g3GEe6ru5D2qJcrMOKJYXgGenlyn8nGTkzWG4JbWHH9WCr/wTpCk8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChuY1yxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQGqoUrk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChuY1yxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQGqoUrk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT2162618791
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=; b=ChuY1yxSUOvRuk29
	FEuoaA9QVruZzXPLjk6d1n/rE4QwSQQblX3J6wmDzRU9ZiKwakBmBSeIms0fUNCa
	8tSGQTIJGmJqfzSFkLkS+MxQn4HLPJYNFtCQdSo+aUkeY9gk5iwmz1gkP/jNT+3C
	Hp5P86epwvPhybfAVA6rdwsi3yGJuoABsp9Pf+UXce5B4ebEx7x5wu2DMMZ+N8cg
	6rkkaN87uDxGntGx/szi3NHsoCjJLIVi8vFEp+VfHBW04OJyTuZ+EokW1LBy7t1A
	wVKsVSUuD4eR3qJBHr13n9BrZ8HrxxP0denUU1rD5HFV3p1F59FDkb+G51G0+6v5
	IU+wsg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr5ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:38:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737c728b37fso46251137.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 03:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729536; x=1783334336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=;
        b=HQGqoUrkaxNTzGJ/V95q5AsO0uvCzyeZYPldYZl+RrzT3F2bSjtcNcuAcdyOhrIYR7
         D3meodJmFt1BCKoU/ym8olaXxUXLCZKwTcD8L0edTNKhD1XztkvrlSADmKYx9/H5Nliq
         GH47LOhXRUcN9Mkw/yraRdPjMo6fruIPQ3iBGkuNyYjB1lCrkRl/HV7XMFoF8bSH7HrZ
         bvsknIQ9biuJDD+EPNPTysvqjcUV9NQwPETR9XSmKPuk4RXftxBrs+ddsFVfohphzGy5
         pXnL4c4wPq5XG144Bxtwc/ZcSdyZYu8GycH+HdT1HXVs6ehAYz2XcYU0xCBgwe62XwSP
         TanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729536; x=1783334336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=;
        b=f2sWpw6VmtbrN154gvL39Z49j3m+OMkd7Cvnuo5a/qvLO01SyijrwEaBBWg5TuFflF
         EXeVrfZSJF1FLclBcYwUP6q2QFwN0JiTLkJqaivOYLoxhNlBQ4TERcuYgoFLTASU54mE
         AuJAeX7zUTIo3OljlpkdMHT8dlwi7iIUCDYlx7WSD41ltbsP9XeKmqC6LZNHVtwn0OHA
         3IOjFsWTEJwijGO+lh/PdQOL6y75QjE9RHUp2LDdnB31Z+liqb3M5zxnHDQNUMZJQN/y
         9czetTrclkK55llEikoOubq8LUWb3iwooCqXGA1XgzpZKz69HDviWYyEMiHEpManxyLG
         MCxA==
X-Forwarded-Encrypted: i=1; AHgh+RqD78ndoxisPZ6FAAXe0b+2PspqKHj61lT60B1wQLNXpx66ySZE1ljbKczr3+rq+wqah6Y5iVN5zdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUGMcVv/XOZw05LGeqo74N7dBsH7dGsIKSQXoeWNktNeqxoNCm
	CGSvm39JR4grYOOGxvz6DvIdN83q51M8/TkYiO4nhKWhl9gXzWRQUy9wyVsUVvINqf1COsFOmhr
	vNa0wX+53PVlINbiCCXTSLWUKFVjQHwVbTaajRLuQ24ta8sEa0D4t6EAoLysyNrI=
X-Gm-Gg: AfdE7clPjE2d8xJh0wqOXLWm6fOZ4vYwJg4XdspkYx2fJ8Y7XanxyoFlXjgvaVLGS9k
	MiDqlmKqNFXgiI/49GsE+EuxsATHmWANcWalhFpF/ty03So27zNZ7XH6y9Oc0T84wPQSR/tdRcK
	mVnJjGk3KRSLhdweciENxv1Lg16+bmUqiQyN6aQzh4T47a8e9vOIKwv4TgMHGNHz63KVusgVPJF
	Eje4anFNmHLcO8lDx8MWo/89U3MmOyyU1Co0cYMz47vty7hDy7KsoftEPbXcOxKa5HEr+ClVva/
	Pk8yX2KBGc1rhg/1ysUZ5w0Ht9qpSlI81/bUwYpFtJBFlVB4oZlQu94/cGNn3wmLzwOC/lbCT6w
	Hd7Y9E/a8eFyPzah2WSN1xYMhL5at8vGRNX4=
X-Received: by 2002:a05:6102:8099:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-7381ef65da6mr557579137.5.1782729536378;
        Mon, 29 Jun 2026 03:38:56 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-7381ef65da6mr557574137.5.1782729535994;
        Mon, 29 Jun 2026 03:38:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69870eac1f5sm621852a12.2.2026.06.29.03.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:38:55 -0700 (PDT)
Message-ID: <b8e0711b-1e02-4860-b80c-bc99757181cf@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:38:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
 <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
 <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a424b41 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kbzcBev-Ug5g7ovxFVgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: UAVnhMJSX5ORkaghaxrsts0SmgaqT6-W
X-Proofpoint-ORIG-GUID: UAVnhMJSX5ORkaghaxrsts0SmgaqT6-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX1gsyyZpmZSSA
 dxfO59PgbTcud1/mXA8beSD2BMUBkhshdnHkWjR2lvlm/KN0sptPKFJKfVC+QBsdHF0GJzUTqR5
 bIx/f6+2quT9NWPO6aPTwzLfkDGdTIIxXgtCvxuIApGhqVzJU1OAKh9OuHB7D3PP+SjjMG/bGi1
 JdUEfYewT4F/Z8YxGD2jhyV/Gjz8lNVsVC9Xn2XWiRbwMHwrMdIPLtnz7G4Hq8XsU6hLxrdVk2K
 9W/uwzqaaiFXOhB9i+FQK+h8HIJOhjDDTpoxMAJ5XlA6V10r+lxi4qAWKP5W9cLviZ43zdB1Jjz
 dFNtkE/wNuEwgHrbPOGNwez8N1cDrfwCvu3pMeYnXKDC6+Xc0Vp91ltY6ySjbWwga62y9JRK2Fh
 ew+QjYH5C8+3TTVqUpFgK17Tc2tw+eP7qr+pJbzucB+/dggtAq9wJa3Gmipd1UlRy+21VwjOOv+
 YUB7YENu3ZrdEpFMbZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfXzzo3qLQ6GSzS
 F1YRmjVO9KCEhvcYpxj5JxlfeYQjjpbBm5GHaww28i6CIepMcvc6BP/UrsGuSFAS5GkWstNHLRh
 ClaVzL/hn2n4p4FO0P56llLrWSRMi/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290086

On 6/22/26 3:24 PM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 02:16:45PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>> The TCSR clkref_en clocks gate the QREF block which provides reference
>>> clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
>>> and refgen blocks on the CRD board.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index c98dfb3941fa..92b929ee3448 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
>>>  	vdd3-supply = <&vreg_l7b_e0_2p79>;
>>>  };
>>>  
>>> +&tcsr {
>>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
>>
>> l2c_e0
> 
> For COB, it is l2h_e0. L2c_e0 is used in SIP.

Right, ipcat fails to make a distinction, but schematics agree..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
