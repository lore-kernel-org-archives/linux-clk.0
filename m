Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1BE30568B
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205699; cv=none; b=Lfrs6WZVDYxK3LV/AgZOHqiIDHeYhsZegJSIMAPggLb1ke0Zk5cBaFBwVZpGc7SrCAfepd1fvF/61js0ECSnf75wcWZwp4QTSVjj4CW6nj2bNHDpPuLlmXVVI2flX0GixCbhU0blM0bDa4yY6LZemdu5M93qv/nwN2fT1Hi6mO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205699; c=relaxed/simple;
	bh=zM5ygIRfr6T5q2HjenYVrxQr2Py/9mOvTlWDJRoNssE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxZIjLLKJtXYdNFr8wXBUy/iFWfkR3S7L2cWj1bMC8a4T9GDiX+vRX/5DW6njkxqfQ0+r0ognyRstO6blJUXs4gIohZw+Ni288oF70EXz5DiSeyciqafuw08m5aKTHDdmnxC25inEsqFY/xxL95Vqb6K6BQij4LSVK7Q1GHH+L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1q6wAHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGFQ8JJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1q6wAHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGFQ8JJC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6dN6T3631260
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=; b=X1q6wAHgchGik5br
	XriuufvYcwN3RP2fs0QMtgkyW+O4x3A+0ud7XboJ+OuiJ1YiBW4dd0bRYNIVwyIb
	7T4d5UBjCdnJgmxTPb0HMzjgyTgulP4zKgqnxSl9Z7x5SrB8y3RwTdXk2s9VALMB
	5aYuszB0tuptQLcI3YHhHFHVwpVoOpwIlYUC/qxkPYfqGalptoZTvLN5gkzamSF4
	30FZulovzajYMq5r6LjL2eQmyYetESF0SzuNfphYwxCNfXEkcM6b3sXpe8ylopAK
	lFET7VZpVvHxVmGnro+BJGoKPtuNxL+06Q3bo7TadGzZ9MzE1PrFXjQhY5E8dlsz
	9Kffyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvrnev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:08:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845317fa7e6so7689918b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 02:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205695; x=1782810495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=;
        b=QGFQ8JJClogMN/d5OjeHxjqku0HivEmqIa++Ccr+rGnsODlA04JdxgNKM0dOTTFQ3J
         aQTeaWP7pLSy+RH2s4VRZd5SECkzHyZdRf85KAOUFY+XhvoJnKHXTKsp4CvRAEJxEja+
         BicCZxMxq8HH/ZqAXpF6csG3f7wyM0HK8n5P1Y8eRooCl4JhE9sEAr4hUHqLUXrSmd2/
         fosrgTbg4cd/iNFgO8YZ2pUvDBoXVTrio4xZReND1/smlrpwuexMLbaqNbNtZXioFY48
         jpetOrI1ujxobS2yvdxWdYDhRBw9P17Sf9/MaJRaSGl86QjRmsuxcQxj/myj9uuTs3Bd
         DCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205695; x=1782810495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=;
        b=DvscNNaVdbgpjyTyRo6ajtGwQrtdVSF2z9c2C8jajH41nV2W2IxcAkjjIxHcCUWic6
         0ogDXjiDp23Bl8IxKsIPBvNIeBIbRD1mefkLiZBaX0JXhNenhVPIKvbuQ7SMiT9Gxsop
         tKc3uPk2Ic111h4XEsxMtKiEfmNm+lAi1YTINK+00ulJZjImgfY1Dgh9N56gsb+Ikr/D
         7Sawx2Hhqju7KVfaKeaiA302+QHYFdGMTHplZfUYEiwiaTfnQX4btc+46sEYxCv4RyIP
         WfEVc5AgqMGbqhALNkQAjeHErJVbFN0PTOXZEkn9NRyiAMjx65Nc7QtJNou3gKWe5QZz
         pipg==
X-Forwarded-Encrypted: i=1; AFNElJ8eaYXHGdSxbDt9gHTHoGO51Mgu+s8Vmej7WMsaW6LuZ/K1u2P26VxBk0cfuC4corQguTWs5W35rXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJ6S8FzQw/p+/nV7hUFhq7ZbeO3beoIkRKnn0s2zLakI+NzI0
	GjeKlLt6NvcrG7MUL2aRMtRXKk1/DJVeCAOM/azVNw3sVJFCt0OBuUKww+fCZMTPebOB/LxSSAF
	guC+lJebHUKr2mnxzPtklSmeTL4cPs8waS61qQ3sr8k5SZyuHiC9oQCoF5C6G35w=
X-Gm-Gg: AfdE7ckMwRcU3tnVbrUgYuadFCt3cWPaQZ6mT3ZKTN0I7/i1Ogz3cs6whGyoCi6ga+L
	w506/W392eVmSBvzDBG7MdroRL4GQCICx6jZKXYbwffnC3Q8wCc0UO49sk8rXiTcVnkQGvn+Mzk
	PW4TvPnLGsUiN3XZIvyS4155i4PiSF5VMSzsM+wJCMfFBR/7iuBJ6aIqgj7T/y+IU53tnyGO9oW
	il7YL+x3EzvNyNeBfKRGp4xrTwa+cmZZp6Lz1lUFOZ+GmmALRqx0P6b8MR6FSqjpKYP2Csbqdtr
	i7csYqPHfQvu/JaR8wzyql7FlumugkkSSVL3YrJTfBCj2wud+8zKZF273HYr73qUkYWnyUHbozw
	Fwki07BnlVnmHouhRSn1acii9IO1kPJM2m+/wZt44I5xXI4FwWUEL2gGZZXKY59PxWNxpQCXAl8
	nu
X-Received: by 2002:a05:6a00:6017:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-8459700a9a3mr1902365b3a.9.1782205695092;
        Tue, 23 Jun 2026 02:08:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:6017:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-8459700a9a3mr1902324b3a.9.1782205694644;
        Tue, 23 Jun 2026 02:08:14 -0700 (PDT)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm9431287b3a.47.2026.06.23.02.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:08:14 -0700 (PDT)
Message-ID: <7c75dc89-f62b-47f2-b5ba-63b9e91c9394@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:08:06 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a4d00 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=L7gb0O4lDvObzA7K1y4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfXykAMS0f9A1QO
 tOthatGGKYTixQXIGlzWY1XT11nsQnyI5zTA/vYMIAMIIg90W0C9piPB85bU1winx9PdmFqPPmD
 fc7Ns5GaNK+Hvalaa7bHB5B8Z20f6tk=
X-Proofpoint-ORIG-GUID: yWgVfcK8Eq7s3foIY3bp7O2LbTJbMg3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfXy8cyZppYgO7z
 hINpwacydzTYqrid4YJvZ+FJHWYzMbShq37rAdpLggSGM3x/u8uwLPLuxtqJ6JALxAoHtmczbUs
 nvIDAmWNuU/7Dkv5WjScivUZIQap93lD6oncmNrEUxYY2mEPegYpTTh3DVE0rmR/XSVh1ThMz9b
 5RjqSHTMAUjXKmQdjHbOtRkdB6j6gv6bjx4/jN2iQAQHoPzDC5mpp0ojsaDK3HewGQtdoJO8RP+
 dt4swvNV9SuBZVYYOB1j+YWeFpegXUsAlT2f4+hEFlsc7eVMyYo4+nLCdM37DuxjRwwq8hbHq0S
 vY7m0rPGK2YeY2BhspbFQrXjtLs2uXPv8M1IL4fXWlNPAhDzQSO96hq9XBLdlNrdnJzI9vU+Uf5
 EXVsQx83C64FUzQ2GH4tdJWn2AqFMWRzNeaSI6uJlNtQY6CHumNOrUeeXiQRmcElGIek7GZseHO
 T6Ut25DhGpuZjnlJ9oQ==
X-Proofpoint-GUID: yWgVfcK8Eq7s3foIY3bp7O2LbTJbMg3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230072



On 6/23/2026 4:10 PM, Andrew Lunn wrote:
> Emails to the maintainer of Qualcomm PPE Ethernet driver (Luo Jie
> <quic_luoj@quicinc.com>) bounce permanently (full mailbox), because the
> "quicinc.com" addresses were deprecated for public work.  All Qualcomm
> contributors are aware of that and were asked to fix their addresses.
> 
> Driver is not supported - in terms of how netdev understands supported
> commitment - if maintainer does not care to receive the patches for its
> code, so demote it to "maintained" to reflect true status.
> 
> Fix all occurences of Luo Jie email address to preferred and working
> domain.

Thanks a lot for fixing my email address and for the help!
Acked-by: Luo Jie <jie.luo@oss.qualcomm.com>

