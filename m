Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3841D20D
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277586; cv=pass; b=D+WHvK3/gdT5ZkPx7Gos1/fGI2CYX3EcgpP8rpN3SjxC0fP2jIb8c4DMLPE/X8fMxZzdym4sbgvpqgskec67w/lQPajkCOCTBvNOg4hbelq+1W6fTphRwY7uAXNayWQBacfDWVvtxmiibwjeMO0KpdwgIFGGH9xupAKBYtkEi+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277586; c=relaxed/simple;
	bh=XFUUQpQVjHmTX/OMS23vt6bYwXDq4wDECu8gMDnXyKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3nU/4+FBmGzeuqQsFGAgUZ2pmext171BtLJd6WQIXVch40xJFYfrDifkTYBudlcsl9wOEPsa4cHLnoma8zIqkM3PXuYxMYmZIlcEQky6/G3umh3hvBcovJ7AzbQzdmZU+inta3MrtqyisoLI/xDPPnpAF31Mz8rMTPjBh+J1hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn2uc+TX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVIgAbu4; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dn2uc+TX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVIgAbu4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8Y1i3495533
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 15:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=; b=dn2uc+TXd6LM8e5N
	jnnwjWOAapq/YOWMDaEoFrFOeBIDw9qcaF15/5VAmvOmGNMj66MbYV0ewcPRKZ79
	sbGACZ3oeO1OFMEmi9OwY9D9VnLExCHrvSRQF60SHV7whqMBhb4Y3eyOMQioBlJU
	vSHKPVsbSHUJ4VBy46m1vYsEY/GbkGTrUE7U3sa2vn9UGV+gDcYeQ7Cb4k/jnxHf
	eyfwOQcrcAfhaR5Lz/d7jIZ5PNctbJ6Y4Wd0AQ3TpgrivnL8mfG2r4ANoGujlQyK
	mD52DMquVUIMMAIxdpBS200NSUd+8D3eu+OmvNfqG5CkgfzxvbfGgs+9hdfEbblP
	lMRRCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ngsrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 15:46:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1027002a12.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 08:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277584; cv=none;
        d=google.com; s=arc-20260327;
        b=BhW6pssSF92/u4BHMbEIWl7oCuFQXr8QvSmMvfHBYVcoc/+FA+znSpvsrihNbYVQvM
         NKemL7RR/j89KDlr7GLD8N0xqGjpY7hDNJklY4YhV0/0sylj7IUsZydBRR/I+CLLmu/R
         3HTKhH6gYoPs3dYI11bPIskyCGLlif3C/KZcjrrLdciaIpS6ju+cACjIYp57kbG3AIqd
         hNfC4dHiB3bHfN25yjgOhOsYQyJqJv+B09QLRJUnYmFU6wjG9tRhK1+jCHMCh/x85pwh
         4atP3ewv4y/jIKGt4Lzm3jQoTe+gXYoEfL+74aOnrSNWpxYzkwSdDBz04dO2pGW8mX4N
         scIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        fh=IAiDRGvqfXZJ4zCeMXbsnLA65d1TO4RsfzjDEgeKMqc=;
        b=TdyDbFtm/Foqp1gibN+RtovFwjCV5Ruy2YO6sJ/xRRo+Yz5r5lj70ntjqCyQKNknIl
         34N/78o5D8jLiLPxEwZpu96aV5wz9L/7frNtnwmGiOdvCVtGi5R0Bwgm7gIK+3wyyOh8
         JxC+Dj654B/MvhmnWtc5kqg4nz6nWrWJXLE7mBL6jn4pJT98EjguQcTZbi2BiqM74STR
         QeS+Z75xCekei53WVk4PIHHOrZ98VJGkUML8l6WyxYMLfysLCevnitpkJi58mqQYb7GJ
         L6aQ5DSLvIrz6+d5ez2kflN+1KDs//k3XEsuFHq6T9t5qNfyw/FGROrwHetYtGt6ibIB
         rboA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277584; x=1788882384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=eVIgAbu4HFPHFu4TAvgA7+2S2sT3XmJdp2PwB5PpI7gzaogiPEi4A9BIjMD/RnIBLs
         CrLqEbFMs9/ZDXaJdlqPE07GWJOJZmeq1XAN/X2xWPIPF598hSWsqgvmZJi6SDgB3sRJ
         F9l3ne/kItqtbKhyrq+OnTsL0erdyT8QAjc7apisErp+QFJ9pvBGt1G4FD0dRRVLU+Vo
         DVpL73yMt2e70+d4kCIu8JfCxO2rRWMdvnMIUqDbCM6jH2prYoA+1TvmvBF96YVqvJvO
         7MkjEvOfNP+LxYue/UwbnLBkWH1tMFA+MnDbQmJrZvxJRdcOXIdMGKNXGUoqCtzHC52b
         YoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277584; x=1788882384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=DfrvS8OBh4DYWzwTqChG4dM+ewOkTrmUMju4QqnvOC5PItHn4Az5C8o0thO2LWuTih
         +R6LV8FQmMRJk0YLqmmf3i/4ApN0AR5NBacOCiF27/qI9+HlbqtGXMLV/cYzxKimxZhc
         iZvASYTeBSbuDkHxixA9Of164faar35AdWdryCQs+O63TsM5mFHTcugNjDca2DmzZUN+
         F57rS+ogNppFcLmgSbpR95Zd8TN1F+WY181Ov0Uc8J0o5LqkEv58fwPp/NHRoJcflC+z
         qEW2ggEgJJoAFkejogqat1Y9JhFnjmyuTUJaQ0W/Kbj0ANNVAlkEfvj4pBrrhroiDvA+
         r6mA==
X-Forwarded-Encrypted: i=1; AKwUvBydU+NiFYCDLdGCSPBItUPv1hsAbkdtGHSS33jyzHJsUlzxxiw1pk3yi1X7Uu/6SEIV1JCeR2az61U=@vger.kernel.org
X-Gm-Message-State: AFuF++mHTkv0LdNVeHmT8WNRMcVTRUcWPhDtZf9lQMUzmOAU82YHFD6i
	kcrOEDFXqCVDTbkYQFo+g/F0V0V9yn4cVfCjGsZRaJF71cXAskRuvWWo271Cw+BWJIOuhIodV6I
	SBCRwO3MQKgFiMPswbIliUyJLdXzrddC0GKPp/7i8Arhfv8WFcKuqSIMPiwX44SnNAsnDPmeNNr
	g6Pomdj1wJSJhVdF+ElahtzCAjk9kYF7G2v3UEyA==
X-Gm-Gg: AYBFou1VpM9CONY1IMxFUoLMRGezSUtQgFRvW7XdpbURlLZaok0guQHvByzfewwrajL
	ZBenV6K1J5/uXmuWWRhoayKZrPGmR7lEyWehdUipsSEbV9EXXV9DRgCFJa+rWju4NxYftYyKHxX
	ofQAe1NH5QMvKJrKwTwbxo7bYJCsqZeoanWBGz6ZECRXE9+GTsUF8ex2uqpg==
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-3990f79ddfcmr3891969a91.5.1788277583822;
        Tue, 01 Sep 2026 08:46:23 -0700 (PDT)
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id
 98e67ed59e1d1-3990f79ddfcmr3891921a91.5.1788277583296; Tue, 01 Sep 2026
 08:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:11 +0200
X-Gm-Features: AcwNN1UOgtX_S0RX4JszYubxSoHCtUSFoVM1QL-GMxkUwhBphaMhOq7ZdQsciOw
Message-ID: <CAPx+jO8u_w417z-z_2fkQcody_sYbijHWTowZ-RsKH4Yw3xW5g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXxBzQFBApD2KN
 2Kfl1lrwbpjunkvvnZKglluUtqUn5t1wVj/ShugBzD1TyNaMMIx7ra9SmvWntNiAI9qnoRjOV//
 aKg9/6zoKeVvD3Xn5vNHoYkAtqhvjdY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXyqHakFdinUdU
 GrIe3Kzfc4wCwKTeDEUhFvoMGe5DNBfsj2GwyOY2dUBo9kObampWAj2qoBIcKUmKUQ4RK8oh7lk
 oRb2f+/SuX7Qa58FIjkCLV6WTu1N7Cv+66QvqEUC1kMgWZ9PxhxU3+1jbvnZ76pWOQXG4MEy2W+
 NQNoQj28DXDNtmP+XUAzXUikx27cKs+Ipwkp/fE+vwpaqfxQJ7sEqYQvr2B7tmX4dLvpPJaMQiC
 EjVDXl7VFVYO1wOGDJd7xQLClX7LDaXieb8t7OgMMHTLzB0y8nQfVUUDNSFW5Vsg27Tg/XGSt+Q
 MX2M6pPUNt3zg7W+TLGIQ+fkgM9dFya6kXNtUH8DWzhH863aOsof9WMu84BgEW40WY5vW+DnAt0
 WKtsCaRetTk+UMDqGGjtnn2IL4TV0X4QuZO/xQ0L2FPXV/Nhz83i8GiaGntVf1XWJeVrn+fKSqQ
 tpN6DAp37i0DVQeSw7A==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96f350 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_uS-18hJZPm8K8KRSTQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ZyZys0aot1I71d9pqoXNjmBX1VHWviE_
X-Proofpoint-GUID: ZyZys0aot1I71d9pqoXNjmBX1VHWviE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140

On Thu, Aug 27, 2026 at 7:51=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:
>
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
>
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
>
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>   (added in v4), so like the other Qualcomm GCC drivers it must select
>   QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>   (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() retur=
ns
>   -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-=
dd34f235fc1a@oss.qualcomm.com/
>

Patch 2 and 3 applied for next, thanks!

[...]

Kind regards
Uffe
