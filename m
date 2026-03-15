Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723D237186D
	for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773592743; cv=none; b=HdBHeKVZmcG3YiYvwhilQtEj36HZ82+wutjteS5vVowC5SmT9btkd6KFytVkgYvX55ATAN7DQdkl7hTWEL90S/zK4xugKhVqsTfnTBsBVo9rVRWCe9bu55gX8vPNDwoQFbq8afhXnaO6nTeM1zim9ErGFQuSVZyB7y2qhA8x52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773592743; c=relaxed/simple;
	bh=N6sWnPVYlkWtJGlhWSZD1h8oJ6vG9zrZFh1ZLS4cIqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p1z5mPHnPxMrmYYEUFFfL47kC6SNIWtSEyMinrCz8JSy8fsFVa9VMIr0TLuAS0o4FAtQ4y04hO24JC4/IaHvjp+wUuTV3gfNzQX14zCLnsIBal6U87Ww02YWjWjcTewpQFRvUV4WlthzET8mB3h9nkNk3MUqUmP9GJfCJTTcsjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EALUhEw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5eEspe7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EALUhEw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5eEspe7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F6TLg93431988
	for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 16:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pagjlBgHRFmM8TNjw/u+wIrjp7WABcDLI8XdmTfMjzc=; b=EALUhEw0aw/16p4Y
	EyHooyKFmsvuX1RXoAFKa98QKult33Jur6ez8ny+4ENwUi67L2XhQ0Pg7QbxvuXA
	FFS63fWdXE4wy4oG26ij5LVkXLjSWnn+H7qqz442ojxLyxceMcxVqvy0Hp5YNqyR
	UBuoDLF9Rrx6GkZmppBJBXLKBtMrZ9MBPVuX4IVzjdB9P2b1PAEURtcGnbzKkujg
	YW+JM6aqP+AdmFylE7V2Hh8ZdJK2nPLYXqCU9Uf+8fMoNXD7Wi8vUKrZmoD0XbMA
	Yq/F7RkQty9EHuHDmDcm55MeGDp7uTUQypv1vL0BEpQy1GX1uPIojhUuOrUysRhA
	zZ4YRg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00ak2af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 16:39:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0998a441so25218388a91.2
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773592740; x=1774197540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pagjlBgHRFmM8TNjw/u+wIrjp7WABcDLI8XdmTfMjzc=;
        b=W5eEspe7r6Wqm59vE4O+L6kRRf+47aC/tskJTtiVG3lYKYeZYZf/VezcTec060cc36
         wuLOtQ1Q8esuyNTiaIrxl0AQE5BNdSeaPiFTlDZTkkPzkj9KFHOdUNIZUAm8ByWBpH+9
         5MX843bjilNaGSKQy6+bWiqW9lc+N8d5Yaz+a7XQ8WhKMXQwjWnoxHjKd3TmODANDG2P
         E3G554tDYwVa9WvW+jEVzt2ezYOTXYR89f8DJOX8t9sdGbpQJdIntxsuzm8Nse11rY50
         xKpNVFGzWjtXoc/KzzfDfQIgu0Gg+vNn+oh1SfyRqJ5rO61fflwMJnIiZxAawi7o1igK
         33fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773592740; x=1774197540;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pagjlBgHRFmM8TNjw/u+wIrjp7WABcDLI8XdmTfMjzc=;
        b=akFkqkLw9YrAP1VUTP3SW0XmFUYL+je85TJBE65F/f/aSP0SN6NMcXnhdcO3e2Q3Gw
         9TkKJFnspX4Ad49nJvs+yF+9KSOIdbLboFoHsQiUkixQJ7gAaSAPQjcliRg+jmx6ZLEB
         E8CYNfynYgkZmPbRBFBDCuGXYRZTmL+YL4GWowi0XEzeL1eiuDiB0RSuCqkEpZ1IbJ/q
         jO0ARR9HGxiPa3WV7HXpkLBEf5NB+/vPiC0e8UyLUFp48jmiSocLRVyxQjfPaK0TDTpQ
         7O32eJ56uF+LvFCAAk8j2GhMX5fi3sZ4MpH19cezyCNvqRw4Y6Bpx/GKSMa5IFSk7muB
         t0FA==
X-Forwarded-Encrypted: i=1; AJvYcCUeqD+AfyV4bs6fiP229Xquh5Fk6IzVEW/14pJlj+w+U+yWFHCGk+rdNWs6mhElf2jdcVecpOKWs44=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW1Tfez/uTS4u75sKJPriwo1SsTVAI+voemQRrRe1argIdjXus
	FpY9rPeDzVIPCW3fMYlhBIgabdaiT7LpQtkVwTW4ROvx+pcXWOC4Sfehfe63lPOReUCktVDo85i
	/qRMcBt4CGF88IMu6gG6nwhipQPHe8m3HgoHeB6iuyD/lM+YI6ckHr8AzAiXnWB4=
X-Gm-Gg: ATEYQzzTbsI/3uQbfX2kb2LLul6wQh/AAqZ6+FXuLaqGmST0/uaC8vrx4VBYY3re1AF
	JokbKdZIejlI4ib4GKZEiWnymePrrfEI3b8NygkQhy0bgG4VAbzC+5D+4TZPIpN4X33PMc7A/aJ
	lAjWmN3FEXnTBJ6Mwi+tI8m2eIaS2Jv2r/2jc6v++exYZ+E6NP1cysBZPGuCu9lIj8IIgtfG+Lk
	JPyVEWijuv9wGO/fUYJaWmLagxUdju29vFj5XR6RZqcTiwnYPm7gQJGkx/ZfcH9u/R3fiIJdIM1
	R2BBSJhRsH9tjrdK+XadOSDQ90ZpUoThQ2irzzPEk/C7/nUK7mVB87+Si68Amduyj7CfJUGan11
	64rZXWMLHKyqImYSOvA==
X-Received: by 2002:a17:90b:1350:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-35a220032bbmr8989364a91.21.1773592740302;
        Sun, 15 Mar 2026 09:39:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1350:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-35a220032bbmr8989342a91.21.1773592739685;
        Sun, 15 Mar 2026 09:38:59 -0700 (PDT)
Received: from [172.20.2.66] ([103.69.90.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b92ab7bb7sm2822373a91.16.2026.03.15.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 09:38:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
        kwilczynski@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org,
        John Madieu <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
        magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
        linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        john.madieu@gmail.com
In-Reply-To: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
Subject: Re: (subset) [PATCH v8 00/15] PCI: renesas: Add RZ/G3E PCIe
 controller support
Message-Id: <177359273448.15703.17598535780042580130.b4-ty@kernel.org>
Date: Sun, 15 Mar 2026 22:08:54 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: v69KQeKksFbJf4-ILQ7u4A3CncM_AM7O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE1MDEzMSBTYWx0ZWRfXxxmZPUpI2ccT
 9AY3mJD76qgnGvKtLI2LOA+pgrq5qbzvtoBfxCpbyRqnt6R1wquxlbobTv6IvUJn4vnhaQllVOI
 h16vdK2N8yRSxlSICAVyio5OU750ebwQzKu/GY5X+wgWeNHjCz3quoO2N8g1eIrgrVbGXfuhhIu
 fPKdTOtYwZZ8Vn2scaB0mxSNFnQbxALExaCDWVU4uJbB/xLcsatA9/rTU7ESpgwjGvBl1bzySNM
 V8E+wWH8HMehKnEa1DkSPQwGHvusPjyhin6XM+exC+7mmXWZlxzmMdWsvYbbkkW8Y4foj6b6DP2
 QJxJghDxj5p7wKTFVb+OfSvgxqKpt/T86j+aT09qJKxNzhH0N40XeMGBXfyX8xO9dxpgZtIqG97
 LFWAQ3IVF9AjDfzSmmWz0xJymdtmKYMdJ4CAxxiwntBMC4tyWC4WfzFzuCCTZcDJUbhwVJOgCqU
 p+P8SCSJwcNZa7hDEmg==
X-Proofpoint-ORIG-GUID: v69KQeKksFbJf4-ILQ7u4A3CncM_AM7O
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b6e0a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=u/vbNR3bhf5HEmanzZPI/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=rhLZDS0-Uv6zKdmvx-IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-15_06,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603150131


On Fri, 06 Mar 2026 15:34:07 +0100, John Madieu wrote:
> The Renesas RZ/G3E SoC features a PCIe controller that shares similarities with
> the existing RZ/G3S PCIe controller, but with several key differences.
> This series adds support for the RZ/G3E PCIe controller by extending the existing
> RZ/G3S driver and device tree bindings.
> 
> Key differences between RZ/G3E and RZ/G3S PCIe controllers:
> 
> [...]

Applied, thanks!

[01/15] PCI: rzg3s-host: Fix reset handling in probe error path
        commit: d284389d4576e7c8040dc4cbb66876e539c6d064
[02/15] PCI: rzg3s-host: Reorder reset assertion during suspend
        commit: 34735f63748daa2ea27544259c3042b4948376bf
[03/15] PCI: rzg3s-host: Rework inbound window algorithm for multi-SoC support
        commit: d17a200a747b01e05bb0fc14d62fbb5ad6653869
[05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix naming properties
        commit: bb1b0f47f6822864c1689f46348efa42c5d4074c
[06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC
        commit: fabce18494e5a4f388c70a40fa8351c911790d8d
[07/15] PCI: rzg3s-host: Make SYSC register offsets SoC-specific
        commit: 346dd3422ed9ff56f033726a50fad2da5677eb12
[08/15] PCI: rzg3s-host: Make configuration reset lines optional
        commit: 4ec4ccdaace40397638c305c0a36b423d2142a93
[09/15] PCI: rzg3s-host: Add SoC-specific configuration and initialization callbacks
        commit: 5f2c4de717786150f8d6cdbdbffb986cd3c59edb
[10/15] PCI: rzg3s-host: Explicitly set class code for RZ/G3E compatibility
        commit: 1e75d2e9a0e018b53f06dcc2e9345ac10f1aa174
[11/15] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link speed support
        commit: 5e9a5af5c9a2797a5e41e8ee565ce8108588f956
[12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe controller
        commit: 8197ec49a2062185f6bd432a19969ce0b3752e94

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

