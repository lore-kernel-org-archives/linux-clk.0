Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4B26E175
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351758; cv=none; b=to/QgrUELs9H3BN9tbFeamCKvrM+qVbYpbaHWqzL7qYfIIqXR5eD6aJmed5aT/LZqvnP0FqqS2jqV4JUliM/9RQ3E8ikevI1gH43y0ucNhgR4EfEIzP4uHTeNqCxANnmKPfHFtqXTvlMfzt4EbnxKa0UxGSrQIzftfAaYLJFir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351758; c=relaxed/simple;
	bh=d5W3GX0X7g3UXissjAjd6tzKPlXKQx+avpna/bRC4og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHTSbWMOu9tlqL0zFVmPKp6jvyE0ivZDiXtbJ5LR0WRLEe2VYWFkIfCgUDlgNdl5PFIiy4gbHlQBfkGtGE2LyTFoDaSrPtUFmR3dOZ2J2iQ32cJRoWlpsd/H1NPryulDC3eEZ+KyKCly29hkHRktdw65ZaC58ndRwSC67HEWtgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HucSr9AH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HucSr9AH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAeInH005807
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 13:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haI88HCttPlaimE5g5HZVq6U+tyuHSX3H7yH1gCwk+c=; b=HucSr9AHQ0oqedkk
	WQfCGc46c6oUBBd4ZTTElr9y7QkAWdeLenxWA459TAr1ezvg0CRxm1wU4VsbXL3w
	fyOkOYUSOGQfQe6UWjn3orWikMe+fCYvA/2Zjazht51JDLRxS0g66/F99meK0i6g
	L9HeEzZu1i0SkFUytu7W4iGoPbnkzPfdnkZm5tiYBm0Mei6EQRcmkqsxN/BSEt4F
	loh0XFLXeCHyzTc50e5L0tZ2rk4IJk0D+2TdDq+PyYp4CrcV/WC/7sU6j0ekDkeF
	XaV9qqDAwat9eLeJzCHbo5VnSpPlQWNZYXwidZzGXypHevOSUdcpq+pJ1WowNtCn
	22XO3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq74v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 13:15:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faa0435aa8so8918836d6.2
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 06:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351755; x=1748956555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haI88HCttPlaimE5g5HZVq6U+tyuHSX3H7yH1gCwk+c=;
        b=U7ZnD51ysEBOc1WiW9mnyv4u4Rr+r6LAAOLKyp4Kv+Zpriz/HlHLUAr9vBSlsraRzn
         Ft0PlSzsHFHN31hLELNG0UTq4U/WD8wdPliB1x/nxNBFrILbnpAYU+TQplgNdeVs2q2u
         btygQ646zVYHQ+4Fc+9J++zdXkI0Ab6RDOIftElTdyP+z3/TNG1Fzrmgo9M5hY5r6sKq
         UD26mrseNi9JpEutvDpywmO1MAr+BRBU/NRM549iAs4ddLlyBy//XHMSSGM/Lr36wjMC
         LTHkqD+aePezm66SkBhdOFTpxxBxfApScdWd3Y6v7fqodTqwRZRVAagPGsDpBBvbybai
         2xrA==
X-Forwarded-Encrypted: i=1; AJvYcCUSBYXB2WQIioMd5zxAQqnfzf8AbU4e7lfgZhSV0Sdzf+hi/1dS0+TUwimO9oobL/7l1aC6hgIaJ9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLblsXornJMcoHh0nJs13iypF1QbNgXS1Yk1G21Z2bkPMT9DW/
	NHfdKtDgIkjfYy8dZbYyJDuPHttra6SGV3x+r/1eTrNhNYnaoSExXZDWbPgEZQCWQqxgKKaVpqa
	TLN1V7GzkBHKjMpitc6Bt2zcOzDkzWCdLwPS68Vnd9tC0m3g+4X4ACTstgVa7Cmi0HAlPcTU=
X-Gm-Gg: ASbGncsIjBwLNLowtWSVSEnbebjUTLX+eLBFt26B/7pOK9nvvw8joL5Sv70q4FmQZhU
	+E/V1N9HfC0Eo7dZbp3WSAkwAN4DXMo0xDf/frBoDWnZQZB7v7zuCpUTEbFRkoAToDLp3pKh68n
	06w5AHPUllpMeHP1Uk1MFb1x4jlNemW6yXn+YN1nMOaUM7SK65JcE0GjcUiDBbMEL2OsynktazW
	g0bsFItB1bK7omorltr3ZA2lwsG73P96Xn7m5bCI5rwEcZw+9GISSsBsy5SkBoE4CtwmrxFYPs7
	HlDLMHqa4MQxSGSbq6jw+rpVRvlqfqBvDWkL03hcdzGqOAt8090zrkiw8IJr7tkimQ==
X-Received: by 2002:ad4:5ecf:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6fa9cfea442mr81664846d6.2.1748351755258;
        Tue, 27 May 2025 06:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyBKkeXUxc/NTG8gSl5izgYWO1GVIxceH278WuDF/J5QwQZVTgHu/6Sllwpaohx59JNw9hoQ==
X-Received: by 2002:ad4:5ecf:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6fa9cfea442mr81664516d6.2.1748351754721;
        Tue, 27 May 2025 06:15:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8888dc22fsm155534966b.101.2025.05.27.06.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:15:54 -0700 (PDT)
Message-ID: <061032a4-5774-482e-ba2e-96c3c81c0e3a@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:15:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Andrew Lunn <andrew@lunn.ch>,
        George Moussalem <george.moussalem@outlook.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Heiner Kallweit
 <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
 <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <0c57cff8-c730-49cd-b056-ce8fd17c5253@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c57cff8-c730-49cd-b056-ce8fd17c5253@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: asmpe65_7ObO8mDA_RgwDvZEwXHL-JfQ
X-Proofpoint-ORIG-GUID: asmpe65_7ObO8mDA_RgwDvZEwXHL-JfQ
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6835bb0c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=c7V_mG7Cw8Ydp4GSWmcA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEwNyBTYWx0ZWRfX4f7w7lvxZlv+
 6b5HROwhqHZZLo3flebhjU3uxb7G/3VzlXwyEQIqzVPEEFHKR3tNQUccuLk+tLiER1FMpmkJAr8
 Ryf01cKZ4+r0LVg8ogI2IEvcboy3gUD9BCv0GHdAHzo6xoV9m+CG8nwglZLLLDKzoY4BdZzOsvb
 at1jN2J1Wouvpsz/ijfrgILXrkVvXgig+yVWySWpRkpXWyTp51NyAswReEVditbdpLZrntaBbUK
 Y0amc4gBK6YrAXlja4Wy7tluhrQDCQxBjqs/PmcLA/NEdeObt9xP2lDngbjEfvzXYCr1jQzcCwo
 RmBjvpv4PSBZJyHWqPkg3S+JYUO9ZwrClxGETAsTj8FPKgejx7PYBcCmfLSc3sl8FS52qEWSVys
 tjjkQNOPObhF/WXDIRYyWjtsEarPpCFo0tIJe7Qp88WVwOOHQVaw77PVmyBz2ZSdX09rF9GA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=941
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270107

On 5/27/25 3:08 PM, Andrew Lunn wrote:
>>>>>>> Would qcom,phy-to-phy-dac (boolean) do?
>>>>>>
>>>>>> Seems fine to me.
>>>>>
>>>>> Can the driver instead check for a phy reference?
>>>>
>>>> Do you mean using the existing phy-handle DT property or create a new DT property called 'qcom,phy-reference'? Either way, can add it for v2.
>>>
>>> I'm not sure how this is all wired up. Do you have an example of a DT
>>> with both configurations you described in your reply to Andrew?
> 
> When a SoC interface is connected to a switch, the SoC interface has
> no real knowledge it is actually connected to a switch. All it knows
> is it has a link peer, and it does not know if that peer is 1cm away
> or 100m. It does nothing different.
> 
> The switch has a phandle to the SoC interface, so it knows a bit more,
> but it would be a bit around about for the SoC interface to search the
> whole device tree to see if there is a switch with a phandle pointing
> to it. So for me, a bool property indicating a short 'cable' is the
> better solution.

OK

does this sound like a generic enough problem to contemplate something
common, or should we go with something like qcom,dac-preset-short-cable

Konrad
