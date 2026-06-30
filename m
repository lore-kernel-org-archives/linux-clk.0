Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE23405C55
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818220; cv=none; b=LhQuxwbSiTBTqThrBuptMeZpjeTPPSKpDUIVJi1GGWVgHLHizA1khnP6IbVi/0k+Ha1D6rK9UZLfILS7zhYD3IS4birQykJQ0QRu0wASthZ6LDWDcrT+ZjX5VXgcGRUuj2sRVTHRwmakK4PUwGb9LyMdnBRf3WGnHxFWLAd7+KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818220; c=relaxed/simple;
	bh=OwoxQFMmClVp/FKnrr986wU7zxRGgnUkDUDrvAla+tA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FAOFvmeE3Ux/VzD9kVdlZ3gZ5MRvG4Nay90TriAQjwj260ZFtmoCVIh9bS7lyXK9XlxVz6mni1S4bY+7wvEB+YG2aE4sVImsoyc/5yM0PksofoZ68O/PfjHRzr3h8EAll/lsH281bMLGAdkSTAy0fRm7W6m2pe4wOyW6RlOyqrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnritBkM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZzorpN8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnritBkM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZzorpN8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnK31542036
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 11:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdXz9hXxswV0OTamUlM5tpOj2E+z/eG6vCXO9g5umPA=; b=GnritBkMMjF25Sog
	oGHudo5jn6aCGkjjEQhuhcvdJ9EYUFShicyiT+7vBTyKY1ITR1PGCK2avYzJPiys
	TzAR0pOTUG1uTpD4fdC0cFGCymuivBn1uEJZAzjUee9fD/F48eQCczSiEWXzP6ZH
	kNKscBEJeOKV0L1HI2AaCXERflaRRotlVEx3KJ1XgnglzY4E9ye3FZv6ze0uDAds
	twPeRMJYiESW5h54l51PEcwephVCqMEblCLOZyvxQtA3c8A+XGXOScyi/rjvjh9O
	rS8sBqtRaaBC2U8IbiWICLp3koRG9wObz9IvOA9QGeNJULpufqImlSwKptAYc01N
	AbHyfA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4j4na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 11:16:57 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139f02b1fbeso13618443c88.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 04:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782818217; x=1783423017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YdXz9hXxswV0OTamUlM5tpOj2E+z/eG6vCXO9g5umPA=;
        b=RZzorpN8cemwFBJymzSbr1UiaJC/D/awM81DFPVakXFGHd8beoiZAkUt1P4IaYbSM/
         o/3pqFyf/iIrIQfvKM+YSzBVIlrBR6TTi+1SnzQDZMcFEOATe9sTx6zczO0QggF0QGRS
         oU6D3eHCZR/7d/BjePSxnqZ4YlAecXxDZlDYITq1YdX6T8N04JUEuIlRvmI2UMqO9N2d
         yk92Pz4thfhqYQkf9FDwMuz7qDH+nCNVsgNs4QaTQqJOA3V8fW7jTL4khFX6Fd18YyKX
         3m+D0Hzg06QO9AfY5E1J3Zpf7KFrT9rTDnzVrcvqqa1lZnvo/RhyQ5VSYrDqK/DyNRMz
         ueRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818217; x=1783423017;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdXz9hXxswV0OTamUlM5tpOj2E+z/eG6vCXO9g5umPA=;
        b=TaU0nzvBstt3lOAVO0Wv9tN4dNFiBvW2UU1vChl1JL6MSdJ5G7WAVbEmAsyH+QXV8V
         NJjuzQ3cEoHzX28sWLtyMN83RBb1InnxyweOxgZcdK1YGpyPkNgu7UXP/F0ZugR1V684
         UypDnv8IqCgBB3j7obF9CjZchboh48pzqpmvFIQJ6TtfSw0xYMBn1oyQb+zb4ya0Z1Uv
         ptI+PjPoAD8Hw2uI/5woN0kf9bYPLrgrsyG5vpTlT6O13a2e3LhcmrRrKXlCaMOe2Hef
         06iQX5eZIlH8VkN0UZCQYcXOPyvWDg5j7l4815Gv0goDzJ4uIiBJ/D/vDQkXrbSZmyDn
         EUtg==
X-Forwarded-Encrypted: i=1; AFNElJ+IHwfWGMRMWwcpwhPg9DKioyn0R4nJnrcYOjlXv0VVlFt2pF+qYg9AMUNy6qsHHJHHSHQBt2D/Ff4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2j7jAPyvBv+nmyMlkrE2VJ4IsctdMxaQCo3G+H/enG9edt9T
	d9BYrDiReIcZpCEbreHshmBG+TnycN15kseRlUrjEADjU0PvfROmgnsOP/Eh4PokWVpp1lZHYrM
	HNN9pdCV8S3LZ5Zx/C0CAUHrdXHM4RC9sTo7VrQ6QH+EXhlx6oKlV7yaK9LlSiU4=
X-Gm-Gg: AfdE7cldH6Iyj3M9e8WEDQcaFGal/G5u7SB/Qu9HTwjWSL5gIOJzeNMvREuwPmfcLOY
	g30x7728D49xdtPp4CBJJc8jk/TeOfML+nsUcNoVKLZHMJ56r9LrBsN6vIs05CV6S6u7NE39P99
	ZxKFybrfGm+lHHsMktM3sCJVASXV+JP2taq/n0lY3NFH8iodm7z7cDBo/PeLHUIFlGOyoP7y0E4
	Ah59MwL3/HeBw2gaOOVpo1pjOPLZvgUK+z6Mia5aPz+bqJandLN4OeVwusQcjAAQZMUcaAHffpR
	U+AXW2apDdxN3t5EHgqnlpoRQExbhUaI3HuKhxzf88sHvyTXA3hgkdCLM3daaf/NoMhE6iMsxBj
	7LeolkTosvPGypl7gLR8oSyQQHp17mc+RZQU5jrUntgN6Z4QwxdgYa34=
X-Received: by 2002:a05:7022:239d:b0:137:eb21:eafb with SMTP id a92af1059eb24-13b2a1762edmr2044175c88.13.1782818217288;
        Tue, 30 Jun 2026 04:16:57 -0700 (PDT)
X-Received: by 2002:a05:7022:239d:b0:137:eb21:eafb with SMTP id a92af1059eb24-13b2a1762edmr2044152c88.13.1782818216728;
        Tue, 30 Jun 2026 04:16:56 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b309476e9sm968932c88.8.2026.06.30.04.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:16:56 -0700 (PDT)
Message-ID: <1d54d968-abb1-4fda-9faf-fddda7d318c7@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:46:48 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable icc-clk support for Qualcomm IPQ9650
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
 <e9d687f4-0280-469c-8729-cb4ded09dd84@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e9d687f4-0280-469c-8729-cb4ded09dd84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HAAvJtIpDxyTifOon4093am_o3U4mYWQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfX12VTdaxufvGJ
 QfOKBAVZIl97adjdo3U1H99W8XQffUtfzY/L8xsFIy9wwlDFesfQRG7xMQhs4u9G+hG9wPB+D95
 +1Gqy8HoY9Y6o33KOBsV6GLSUGZqfKI=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43a5aa cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0RSEAuWrFl8F25onPCMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: HAAvJtIpDxyTifOon4093am_o3U4mYWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfX9SeRo4tmRBou
 /bKxo8BIfhJnsVWSRVsWvQ7gWFb2xj3CiIpE0M35FL+phlbWiDY7ell3pOM3buMujXt3Lwtugta
 69OfyU6+8eFlQH/tLrV7fcJymBIjziVC0NjEfHqZ/S8N4ko+2FovrSgi87lev/wKDiBy9g+I29A
 LyHC9G0/L5rzdpyOkQ7MoNs4T6yIL9LEf89CuDWdFL8Sg2SsODeXrfWfTw2TcMeO10GlKEzzNPj
 NS9cVlNbzhRgyiHmvRTq5bMLtXbbxSgAA6LnpvHwc4mshL0w0iO71j7GavWjQcLOUAxzu3YYnCP
 LHJ3RTBLssZccAnvB0LBKzfnjqFPH0sHOVhL8zsHWspB0wKvFA7F7jYTiotYziwA7IStwVsT6Lt
 ZDpre9Ef4jhJdA+Jxx6rDIcgYTZVj2dD5ssYgDaWpu0SgtTLfvuQMXqwFE3x5MexiNwKkSfAMtl
 JztZpES2rqBpYqycUPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300103


On 6/2/2026 10:38 AM, Kathiravan Thirumoorthy wrote:
>
> On 5/19/2026 2:17 PM, Kathiravan Thirumoorthy wrote:
>> Add the master and slave interconnect IDs for the PCIe and USB
>> peripherals and enable them in the GCC driver for the peripheral
>> enablement.
>>
>> Signed-off-by: Kathiravan Thirumoorthy 
>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Kathiravan Thirumoorthy (3):
>>        dt-bindings: interconnect: Add Qualcomm IPQ9650 support
>>        clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks
>>        arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node
>
> Bjorn, Gentle ping... Can this be picked up for v7.2?

Bjorn, Gentle ping... (applies cleanly on next-20260629).

