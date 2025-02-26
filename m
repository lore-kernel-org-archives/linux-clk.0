Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C493122A4E3
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592464; cv=none; b=TI5ClnqtduqNgjZ1uBhGLR8aVeFtkc3NQKFT82oHP51NsOsZeMw7mftWQu7dB42wHqS0fgjMJ7PtjMfFEfW5s1VgSNbOiGJt+Gj+Gv5SPQTQqov6sKjAhfx5Qa6Oy9btEJN91IpACY1b3cltR4Z4djkciVDYs7I6L/4SBV0/fb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592464; c=relaxed/simple;
	bh=XCF9u8Z1rw6dikTB5uUuGFpoZde8WX8im3OQZS20lBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2sc4tqtzvvPzE+tXvj4ywTkJvEV//ot+FVYOSrYurRj+6FKdArqSaI0Ilxc116ITYuK9uZWnOnnUASB43x/4gBjI34dQij4NnEM4xARWCUdxUzrJBh+OiiGoRzJhbht4arkUabt1WV9KGRcTUEp9PqurAOKVulXny4jRpZMo88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8V5yw0I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8V5yw0I"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9Ev93015904
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 17:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1UOTAeEYAiBnkyZpz44d78r5B7uBb0CODxrcfWD1kk=; b=l8V5yw0ILAnulhx6
	Udo4ZbASizJpDYsHqtpefcgGGV54J1PtaIwrnE/BaIuM4cwhH14lPz+98KiHeV3f
	4GgWcRUDnHJKtTHFPFcqz84Hve19eaxPrkmyMWQ0CAhtEkJm1C9j44V5HuGYwZzA
	ZG8wJQqYMnfpkHN+EkAoNaGnlE98wB/xnqzWpQwoM6npvGS8E9Vd7pFetyXtTl11
	/Nr9MzXO0klRoFdEDBMgwMzgbcgMF5MQiAv/offMvUwhzsSq+x1tLRm/HLMT9bxV
	WCZcekBdaiMKCZpQwwFPFFmE9zXBFNEt1EaF5ejGKAu/0wNF8HL/467F+X6Ict6W
	FT5nCg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnjutp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 17:54:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e4546f8c47so370606d6.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 09:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592460; x=1741197260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1UOTAeEYAiBnkyZpz44d78r5B7uBb0CODxrcfWD1kk=;
        b=qmWMRR+u7tyQBcd8mlz69MjJQ+eVL6ovLfErwDTgmwaP8UFaFt00tPtO4CqD94koh7
         anWDZ0+ngVCFeYp6+mosyZVKTXeG+2h1sVhW0kk0fz8ptxpUr53WFpL/vtDeFx08w22M
         khtTJEjAOhPRV/OKv3ym0MmDZTdaYbn/pNRI7Xhr0RfvV5vAqmmin9pZDaVUs7vS3U9k
         BrzTxUNL4f86YaDBOLpqdyo9en4yvuEGJ911A1vmaX73ifnlBPLlOlrlOAsiXGaqy84w
         iCnq7UrqyqHQDPhXzRWqTbJQtwejt9mcUeBoUgqYDYRNAOO9BWPdUkMggPzYzWCJiu/R
         l/8g==
X-Forwarded-Encrypted: i=1; AJvYcCVI7jkriZGVxAuRfGJntCO2rgz4O8+W4iYENg4d/RaF4YJXfzkYNCQ5w3canSTsV0XP+OBd9T34uRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6Zm2Fo9H9lP03BPcztbceEv9CBREGlPUXlGRNC0gb/7iqZcS
	KE6es0RYuPu66Q9KaD4bX0emEgMeppXObazvAE0AkYjbGpVRfofv72c1I4o9ONoU6ODdyrZ6Fsq
	r9VWtG6cSp7OsAg9n4JbpANbMqUmQ28hibJwUplH7hH6eJCH7nTUqp+a1IY0=
X-Gm-Gg: ASbGncusza/zyM9V0Sc76UkU9BXcP2mudlwsGeCXi2wO5/jR7IfVKO1UHwIPKWqkwO0
	A2kyLCUoA/l941DZs9nnyfF2MooTc2gc40vrvQ9Ts1hWDewol1ZSaDgEkuSeMA2ls67BgcGVHo9
	hiPeIcK1ZthN1IALiOtE3AXkrHR7nGeY1f6TM8crdpzPQAW9FldOtVzqIQNAKng0dqgqFT1EggB
	en+PaJY7amx4ABSoJjyqIibhi2M9zQhEOPvIvgqgYpFLP2woE3dNlQ+peQIsSxGTOOxa0fhsIPE
	dxKzq7nC2tVUoPeSz406PogjOq9zNMy9neGGExqXKqkNOSBwh9Up0gcv0JxejQYJ6yOeqw==
X-Received: by 2002:a05:6214:21ac:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6e6ae9e22a8mr111525316d6.10.1740592460281;
        Wed, 26 Feb 2025 09:54:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7syWcS42OEo1xDcdvQ08ZhO/oF+3o+Ak0wcAu1DA2U5JLIbwlLDHrfoMof7nVe568CRcIPA==
X-Received: by 2002:a05:6214:21ac:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6e6ae9e22a8mr111524966d6.10.1740592459862;
        Wed, 26 Feb 2025 09:54:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20121dcsm370471266b.100.2025.02.26.09.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:54:19 -0800 (PST)
Message-ID: <e3b2678a-9e4c-4f56-a5ea-5ae46acd5e4b@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:54:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: ipq9574: Add nsscc node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_tdas@quicinc.com, biju.das.jz@bp.renesas.com, ebiggers@google.com,
        ross.burton@arm.com, elinor.montmasson@savoirfairelinux.com,
        quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250226075449.136544-1-quic_mmanikan@quicinc.com>
 <20250226075449.136544-6-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226075449.136544-6-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d9ZZ6IqrS5z_5IdybTsJEXs1awndVJvO
X-Proofpoint-ORIG-GUID: d9ZZ6IqrS5z_5IdybTsJEXs1awndVJvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=624 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260141

On 26.02.2025 8:54 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add a node for the nss clock controller found on ipq9574 based devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
