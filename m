Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207C358D00
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 23:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469054; cv=none; b=TJYgg0HB65+2zaesqvYYezoCxJM85MvaneXtKsxTw4ubRyRMqNoXtyL72oX81fnwaTVYU/5BaAQn4FADHyzKhqzUceVgNqnKJvxEZ2nPz/Le/PlmOlaMceXYOS22Mo1jrUZBWLSJyPNgK12TGvQJT5Ws3Ru7FGbLxZIKiDYwwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469054; c=relaxed/simple;
	bh=eczYf2dkFvlA2exsS3bVLjKh+H5ACB1fIdd/wBEUUFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmWzQ/LvyPHdNioQepAFRDC9BSoUZR03U55OqZ5PU1z2AczV9d9FOwwTYw3+O5AXMzv9LMEYJ6SU/mjKHf/pZm4PBIJr+4n5s4PxYPaACSuxbOmMpXUb6wLR/bUqp7stP8cNu+6HeAAlx2t7M2COev+UIjH/656MGsTECoOOuAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCAdYq2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqs+s4gh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCAdYq2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqs+s4gh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG443J1889557
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 23:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lq9o0MXBvHnGDIaaG0otXZUtvnMWwrMQbTMngwp/WXA=; b=dCAdYq2dW7CivrhQ
	QAkhTE8NrtNFSMWzEeU5mUmStmRgKzikwKnH0//dimMveH8o+BgnZSTLG+iwUFPg
	vr3hBKkRokvoICsQ8DvTNK/8/vQj54AgC7UhEGkMlgQRItJpn0PLaDt/9PKQIVfc
	b1OpGT9kmNqh1oj+C3EeWvHSEitMsyuR8XhSBii6IR0Gv2ih6la09ceWrX21dNLx
	oLlDXWUesif0ToBjO8O2ixpFM2bPnlaJwDAj2b3Evv6R44m0ydR2wacswDbzA6na
	3bTjh6bdTS3VH2oE4uZuFr/cBkeC7/WQUBVU2WHCMcYhy5FMMxCrD2J9N5SPjq4M
	tLTzxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkjhdtdy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 23:37:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9d52ad9aso24926911cf.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 16:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776469050; x=1777073850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lq9o0MXBvHnGDIaaG0otXZUtvnMWwrMQbTMngwp/WXA=;
        b=eqs+s4ghLFaY2vVnxL4T0ngp7XQumICgxZTQk6Ak1+ubxjTZoEsIubAbbydLj9lDyt
         f9O0wyomBv6jQT56et6YCjL/9lKgzDH3VMwLiRSsJrE2z1d/xU0yrY8JazHAQrbNS0Mg
         znbFJJuXcfOE80t9O9dqd8TV03pi2vdzaEIhV4/8RMgdWLdQ0UpLSFxkDPubXZ3JBrMJ
         1Pi8CgH5+lG5qR2LumOKnsARtW/cbuiq7QC5zOHzVZHokv8qEv6MQrmfwfIeXooHT107
         4mGXdK7/GeNKCooy2h+FRNFMRz2PWpcX3sadWv83ja3Rb45J77yLeKDzMx6F+utaCcEG
         JC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776469050; x=1777073850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lq9o0MXBvHnGDIaaG0otXZUtvnMWwrMQbTMngwp/WXA=;
        b=kn7Fmt1vy9OYEmuwa4c4U2cuKOgPDNssTC14VaTdDB3LnqU9a5z1vLOSoM5g0gm5gF
         9uGIQfGN+M4IYc3JfxyNaIiLMT5rIyQOshRQydYvjXSQJbbrzmFFEz67pay/WHmfzwIl
         L8O/GgVIIawwoJDCxv+i447J3xHAByJf5qwdMt3cVOCibCpfxvXci+BOIykAA1ZwFYLd
         i4fRoYLDsD7HjuuXfwNCd0YOJ9PXK4So/C7Be/OGKXE7NY/htldKHHAc3pdju8FaJbNE
         kN4XowtCWVBlrfmq84cBt02IOhEVqeymAEiFO3ec9X5Qp474POVjqzXTyAJAnfxgyMhK
         RJAA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZgTrhaEcpPCJ86WcHs1NzMxSiJEjrADzitJTKh+WoUw6tHmCPZVU4Sfr0DWO7EL5Rrr95MiFZ9hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeV3WFg9kQHnDAUQXGNzB228RHQMIY44tOSEyDmOwYm6XUFD1S
	O9omr2x0cXVgB4dh26wsFnBgY4QEtuVbYTr0LEX2e3Qt4uno64o06a8Xo0+IXyVLHjw5rG0FWAg
	ngX2tIhs5MuE6l7jNrNj7Gh3GwiIXUj2xOwceXLQ92Pq1VyQ4EHf7JKGa33+d80k=
X-Gm-Gg: AeBDiet/rU3TRR7JGRMa3F6Xecg0n4l2e+jFc8vJ6iAyNu83s75iBwQ36e2JcQdp2C9
	kOMUpO450+CL4jDtU6OtMETPs6rZSR8JQhE7xEshx+D8HoksjwwXaMWnERoWwzqEh9gwl8GEgQH
	1Dx/eK0EgII1fb1Lm6Z5zFo1Q/Nxae4Gbmrdw6G/npuMPucX8pcn5IwXCUn3+hHIzcvgPdRu0Ss
	VTuciW9TdKnURFrxL4vjt4+rMdozHOOdlDM9IXu38CM7DNI9A13au18MTry3vs+bS9ijKcR8eyN
	vtcGHeUKshLeLk7fsnevcW6xwc547s8VD/ehdzL4ScvmXGWNyxOmPAJqazlp5+lxEqpP0+oFVLk
	5sDIfgUfrqMIvSneVQcWO5NH38kQTlFi9RPD9FYkoN93YUCp14Y9F4I4Akpp2CXT9bCrp1HTxpa
	nFYxZm7mdvNxpOexpSwOt3XF/tCwdkTME06YDyx/mNWePplw==
X-Received: by 2002:a05:622a:d18:b0:50e:428c:4f41 with SMTP id d75a77b69052e-50e428c5169mr18470291cf.60.1776469050208;
        Fri, 17 Apr 2026 16:37:30 -0700 (PDT)
X-Received: by 2002:a05:622a:d18:b0:50e:428c:4f41 with SMTP id d75a77b69052e-50e428c5169mr18469971cf.60.1776469049764;
        Fri, 17 Apr 2026 16:37:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm824544e87.7.2026.04.17.16.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:37:28 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:37:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
Message-ID: <zki3ozehtlw3g6lhsdg6tjbr7ysk4ka7wn2erc2ignkbj4todn@ovchixjotspo>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
X-Proofpoint-GUID: WkFPAnCFDPIvHcqTXDBeWYGSLyySDw-0
X-Authority-Analysis: v=2.4 cv=YpQ/gYYX c=1 sm=1 tr=0 ts=69e2c43b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=UVpfOe0Sm4tf6V5tHx4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMiBTYWx0ZWRfX5MMwqscRyqWQ
 h1OWiJRyhdZQllLvfVEHcdKTfORt/HOktupBHZpECO4jHUiSIM0qb+kf3Ra4aO250djtTevkRhu
 z7Ok0DUTS48ZJj8VOSfAHssBRpQowuUQ0mRTjxIdmwY2q3fX/lK94Fvs3WaL5zMTex3eNsuLd9N
 3S38r3wnj2DevOU/Pj8SueaD5n4mjcnGZunC2iABzHVvT1WOdeZ7VqMzeJXF2K9ZE0UZ6kbug9d
 3UWQA4Lz0DtK9Tw8f55PcAb5IMJ74JY/i5+g16Qe1xRJUzsJaz//LFEA+HNlPDHJGyFFFOLfIij
 SMBQhpKQWIMvj+5wt7PoWAecCcGRqENr+OCP54olD4Mu6nN5I5Y3BvGdy0fpE0upSy33wEESty7
 +GS7wb2wF0gDaGWlVvYoe4U0VS+z1j9r7Uvy8XQGU5hfNIi06O3p1moasbY8R6oT7nGL30i6+EE
 d/kTEzGqjxXZRNJBdMA==
X-Proofpoint-ORIG-GUID: WkFPAnCFDPIvHcqTXDBeWYGSLyySDw-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170232

On Thu, Apr 16, 2026 at 04:43:47PM +0300, Erikas Bitovtas wrote:
> This patch series adds support for Venus on MSM8939. It is mostly
> similar to MSM8916 Venus, except it needs two additional cores to be
> powered on before it can start decoding.
> 
> This patch series is marked as an RFC. Before submitting a non-RFC
> series, I would like to have some details clarified regarding how Venus
> works in order to improve and eventually upstream support for MSM8939.
> 
> 1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
>    for vcodec0 cores have only decoding bits enabled, as depicted
>    by qcom,bus-configs property of qcom,msm-bus-clients children
>    in qcom,vidc node. Do I understand correctly that these cores
>    are only needed for decoding, and not for encoding?
> 2. Currently in device tree there is a video-decoder subnode for Venus
>    node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
>    subnodes. Does this mean it should be dropped for MSM8939 as well?
> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>    now, it does not work. It can be enabled, however, it will result in
>    breakage of Venus for faulty MSM8916 firmwares, because the code
>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>    this would break support for some MSM8916 devices. What could be the
>    best way to work around this?
> 4. To attach vcodec0 power domain list to dev_{dec,enc}, I had to move
>    vdec_get and venc_get later in the probe. Should this be avoided, and
>    is there a better way to attach vcodec power domains?
> 
> There may be some other issues with this patchset - this is WIP code, so
> feedback is very appreciated. Thank you!

for the next iteration, could you please also include fluster results
for the codecs supported by it (VP8, H.264) and also v4l2-compliance
results?

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> André Apitzsch (4):
>       media: dt-bindings: venus: Add qcom,msm8939 schema
>       media: venus: core: Add msm8939 resource struct
>       arm64: dts: qcom: msm8939: Add venus node
>       arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node
> 
> Erikas Bitovtas (6):
>       media: venus: add pmdomains to the struct based on the purpose of cores
>       arm64: dts: qcom: msm8939-asus-z00t: add Venus
>       clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
>       media: venus: move getting vdec and venc for later
>       media: qcom: venus: Move HFI v3 venc and vdec methods to HFI v1
>       media: venus: add power domain enable logic for Venus cores
> 
>  .../bindings/media/qcom,msm8939-venus.yaml         | 104 ++++++++++++
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 +
>  .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 +
>  arch/arm64/boot/dts/qcom/msm8939.dtsi              |  24 +++
>  drivers/clk/qcom/gcc-msm8939.c                     |   4 +
>  drivers/media/platform/qcom/venus/core.c           |  39 +++++
>  drivers/media/platform/qcom/venus/core.h           |   8 +
>  drivers/media/platform/qcom/venus/pm_helpers.c     | 187 ++++++++++++++++++---
>  drivers/media/platform/qcom/venus/vdec.c           |  12 +-
>  drivers/media/platform/qcom/venus/venc.c           |  12 +-
>  10 files changed, 374 insertions(+), 32 deletions(-)
> ---
> base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
> change-id: 20260416-msm8939-venus-rfc-c025c4c74fae
> 
> Best regards,
> --  
> Erikas Bitovtas <xerikasxx@gmail.com>
> 

-- 
With best wishes
Dmitry
