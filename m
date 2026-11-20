Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165958;
	b=BjZaODerRddL6iNUUlrg0Vy4X+cdzO7hM9qE/4Z20qi1B5i4cXbOLGteRWE6FKLzBekh
	 Lb/8GuwmrOk0lhSrkxO+ON11SvL5RDOp3r73Cim9GWHNMrpJyENxYe1TOeFl/J05yjja6
	 W/3NpeNgn3y8Q5SVgxryjBkYEg/ffqXtUJYxpGK3XpspbH9vLnO2shMxi0mKzbD9P3jvz
	 FxoNOa1IAw1h2eSFRdNL5tREt600/ImXbpAUg5vbSV/ZoKf1gu2nTZkjiBY2wuab5oXxc
	 i+IQVSIgdzfyqT3sh8b88LVWX7F+J8XElQVTXNMxo1q3eXfXr0tQ2p2yFpkK6mCPvTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
	b=ISkFtxV27uItHF1sf2piHmgddhlGe+0mw2VyqRmT5vEX1oCF26F3I7uRkeiDs6IluHhs
	 JuLN1mX4Cd7Z+z3QYJjf0QJU3vWiqifA9n1KRGtsOvlqvzVtEbZZDKjK/vR9Qurf8TfeQ
	 zapjTZkbEYrI11rNoRXadn9pGkWqUKNN1sz8NbAwxuBz2c104A061CWzlt5uN6zsbdRBk
	 Kn3o0FFlQFKh+h8IbOt8ZUlduPcjtT3E23Vi4mDmFkHzsuuLRwKchDWLq1SWH3562GZL7
	 1mYugi8eerYOxY/UWvHud7T0Az+oQlCae+rBZEqfeoT3Dn1b4ORwSdF9xv9Z5USrkkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D04606A32A
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D04606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eq2T144509
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=; b=gVmAKGJ+bahJTHDM
	2Q5EMVxlNljNWHr5+3+5k0Kj/AS+2b+xDCkX7V3JNA26pZfiwl5qg+zSYgbuzCra
	T5F+/FhO2o1HuwI8Q3VQh7Ygj6v9U9rg+x5DYySeRj2ocL+oA/ddxmYQfAeDPrI0
	fI6zq2cvljcn1ONBrR1dCE8bhD4Et8tjGNVpLcfJkEkodMvxaju+ct3EXu5FkY6U
	ZtRsgNtZE352+kkE8H534/8c8XW3HgBC2CA6YdqWHCtZ3vTKzLPBKRbBaQ0DyCg4
	nQcZXCbuZqSFHMMq5IdXJI08/e4decKvfpkDYEBhfC3E4Y4SVBSfyjtgqQN6aiMk
	Y4QjDg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbgynu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b42ebf632cso243089a91.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165957; x=1795770757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=eW3Qo8uiqxjMDKgH/wEW7yBPXsyMvciW2yMkJJ2z3R8UVdyrNa3aIZZs9vop/LfnSL
         9GKwYGY5TjrVDuer5mP3X+CefYs5IFtfVPM78GxBLAbFjBhIKoXrtj9NbnI3nGLxsiV1
         F2H4Ihy8rDlId0G0LmQ4itX8sOEIjSFw2QVXEHQk2rjgzW9iRQiqInMx/4hWsYtQlX1x
         yxQKzwlypTvCtiZTC8BsalFv7YO1+rzJ8YNvF7Np2dPvJnNzNIwSdtyhW/dP90Hc8DsM
         4EZYg5JOKGm9UM1GU3WqugNBhnQD0Q2Aoq7ENWlwhNqhYvIw+jp6ueOqnbqw+lJjoRv8
         /+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165957; x=1795770757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=gt/JkKPO89lJPySp0vM7s+jppoU11hbDxzyVN5pKozjqtovRxgCbr6ZZ8gwcLvD0MX
         oabO3nl/R2e78NyULRnKWrYINFvP71kTQ6YXR4gKz14BkBuBf7X5UZYaGzGAdaEib+MF
         Eq90c9LRF8ZoL+AIso284LHVIWY/MzDoMvJ2FTnEZlrDLXEXTjrryMEaScxWhVzXcjF+
         Az8FWUzb0eDmU1+F89yB24tQOYO6Up/EDoXEuRoBLweRNwFf4YZTFUvrM7utROMR771g
         VAoQVPKRiNdbOeOFcT3Z0rubSenOUlXueUGfzwLJJwNxZzr8KpVy+3zpa5fwf2AgW53e
         wPlw==
X-Forwarded-Encrypted: i=1; AL+hErFYnoEAeyjwMWY588HgiRbLKdzNb95VVbYq/12MA1QKtMDI1a83qAfqm0pxrT5QlUJ2f8F+FsTjkhc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pTWZ/NpoIrbKW2bnsZA67siR/8bbtf5GU296L41YPuDQB/3Hq
	R4D/dRvNQ9YC15efy0+e/BiP0hIGQG4STxM7R+dhJ0pfmj9YyjIaVYVaBbc8lSwWn/QVoqw7ap9
	+4UgYghad2Y3r4xWpcMFZH/b6F7feSS0+GGdCbFBzwu25wpegMKEJ7HnVhwB4XdI=
X-Gm-Gg: AZFdTZf57DSzhzbpF2nGp9xgWTEKLwS/w8M/mm4rZXFtPGA5uvVsTUck+87rwWoPXjT
	BgQWQpOzh/kv8BHLZZ2/EI0Lil+B2foKJTAXJ534uvTWa6BAHtd3JuVRGyrSoD9CW97OscTSWss
	/J1/Lhdsu53QeX9rgfEi9BGLNJpPF6Jj0p0MvfbPIkuZRNsNHbnmKR9+qKzqKBqvpLMzQvyNeSF
	tIG/RdhOmnAK44QhHpG/EyX1ZMJfhcfSoQk8WexBvgwebns7ziizkFgP/PaGtuHZtHwSbY5wmpE
	EKly3Qxzq+wEVrRZUNgQx3Xaab5k+aHV47gTqrmg1mjwrC6Fh8JWeizSq0Nr4v3aiq1muOYOsZN
	ZgCpyOmHEEOT8XbSQakqRycnNY8+pcEc3QvCEfQERASWZu7IIAQSxky89LXUXM6Y/iW7IJgpL+2
	c/WdcvVA==
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980982a91.7.1795165956830;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980952a91.7.1795165956350;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm3483495a91.13.2026.11.20.01.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Message-ID: <8d7db2dd-6338-43d2-8eca-fd6db3e7c512@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:42:29 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfXyPpyWtBzO3tU
 GwzABdCQyVmWugcnUI2VpgAhsxabDI/CyHSH+5kE3RvYp1/SkfvajdN+eMIkbVieZN8Oq8/xpn/
 3XHi9slzT00gMutp9W2jKXuJvEODR2U+bmtkIawIDYxZCgxNzUQNLwjJrZz3oyQ3P0alVJeJ1yQ
 lVCum/XrURly14GoCkAsKdB+88ozsdGuoqpQ/63jZW34WqUIfg8yUA+MyCCOnEiIEdjGQkyZJ+k
 5u4riPi7l2KS7V2xfXissT/yXNJKjfbjCBfo6lnXc+BjMSDlaX3VfnLjtluk4J2ekkJ1U+cWA+h
 iF60g0s9IIIDLjH65P/UUT3rEe0ydhjo8Pu+jjP6mkB2oaNdoZz//8viG/JAPuYh/j9pv7ekPET
 JUh/PxmprG8+JDURnYWQ6LeXyQddph0KEkt513lehH62Gasab5Q2l2/v/Pm+OvRlPwZgOvA6bCE
 +n+7NeLCiyRM8vFGsiQ==
X-Proofpoint-GUID: p0G7Ffzk1v2DR2BbUatignWMLMJU_7-r
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b000f05 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: p0G7Ffzk1v2DR2BbUatignWMLMJU_7-r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX0JKIkRzqLTwL
 zzph57I/JRJlpPKqVjSendmQIK22ctNYxBeuj3RzTTy92LTV3kq8A07QbIG94jo/S7ofqG5INNb
 7iiaXKEmiiUUU3pZ2cYdHOVyprUYlx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200036



On 11/19/2026 10:34 PM, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh
