Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF4437B02D
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371514; cv=pass; b=uFdhcp8v/1flrZ8Eq460ouewXU4MOaQXagf3tjA5Fx4Mxdgn2rBOKuO6KCtEzYjtY07rnGDUnekkdMmWT4NFDSG9oH76fh0wDBapcWQm0DaMx/bM+AFAa+lSBmWwtnKeYh1VBoEAbmWGVdHB52GNelhWSfbM0wI7AN5lUqjPxPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371514; c=relaxed/simple;
	bh=N7XTeoAtVgCjUbyUhH6HLUqT7VK7d+dE1+VQTCpWBb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apz3994npTzmNUCLkrVefu2m1Oxl9sELrt9ga0jrOTjnqKa6TLlN8NFloMlAyea5GneDbNW9LYgna1dYEqnCvXkjh8s62yVhJFsu7TFIF2AQrhw4B6B7ING1nsj7GJm49UH/mqjyaujPEcqieSZd1WbfYqVo1V7RTMKcwp2Ck84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsMXW/8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tsbm7O7q; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsMXW/8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tsbm7O7q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjAZ41367877
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=; b=OsMXW/8KgmMjHbZe
	AoyvJSO+/JhnfbuDbQ3oyZaLWo0zwkbPAE92jJ3Gcl2Z4Lyh1s71hM5J2MK86gxl
	yQ5J968Sy6B8pvKwAkUzmCImTUoyzjD8uc/RFc2yMqmMEGzxJ73unFlywxF3s35j
	fm6D112FbvpstBUAzFhOqwGrZGbwu6N/dcYRlqDNM2Rn/LI72bCvWOEJ65FlpXru
	umj1WBkHDQauhGpT7E3QmSzO2M+xDGp2mPW4jFuEtSvQuTBUJNcB+0xHks1HwLYU
	IUI7CPLh+giwbX8KwYlr1Pb5szWOTEstMLKUvKQrNiw2AFC2yImIgtvZqkZlGltt
	ltiA1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v49wxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:18:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so11484606d6.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 07:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786371510; cv=none;
        d=google.com; s=arc-20260327;
        b=aoASmREHHY6lPL27IvzSmoI0gMYGjE2kh08mtHuWm1YWaVCdYfQ3MDJ6zhrv22sMwV
         NLYKZyExEV9we35mNYE/BUqKWFhQ+TrVLXlwrupdXm+5K1Vg4i+6RQNncPR9fPGTdVpE
         xEtdHXxFOj8iDQn5NiI/tGvvqDaCYZ8Jx+pPOJO9Ajn9jyso21nQXl7+5K+OqijgMvv2
         O5r9T5jxbv/nX/NSAtM9Q3iWb39+XE/LOAnsnkNUyowC3tRa2nZzDmFkebJKGTgMiYKM
         a7KdiAU5V2UHtwymHsENnU4AJBDltULJrPU6fNyYx/QwdzjOW6Z5nu2AkS5hjJLyrnIY
         BR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        fh=HUWa/BCZND2s0BFp2jRgsSivFUagA4iDmuxmXPMtl70=;
        b=r2IPDVLbN/eFDR1XgQuyIEjaGtKgmUMw8yN1ym9NgWjKuT6K4Py/Op2/M6mAZpfQeZ
         qwoH+l/bdCCmDnJbj1/e8vxUuXimbw+q4BXgCgLcxBU0yD0HdXR76T+4Xlr3lOmHL+15
         S8TdbmOYpA12pDo3QN8jiB5CaXpfb45EabPIGKvyNPzAqm+S5YarsIJyj203jtKJrlFw
         //CakVgOe8o35fKUHxTOVX3y/IgiOLDj/PZHlRSHFGqOfMGLKaFMUPkzo1EkoUGv2cpC
         SPyZBD0gze73u/f3EwX5RmNLhT8YzoM8nEOlWFh/O8QGX8vGRmkZldX9v59rEY3+RmUt
         2j6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786371510; x=1786976310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        b=Tsbm7O7qLBKUQbZI8wcGSgMuSOg4QFgN64WS6DnBSYe41SdKCPE6dXYprJ4yJAH9D4
         zI4WBizjdOxAhs0hzvhbNrMaTUPLiuCd1yHBclvm9p0ZJrYnUVc/+dqqDiSDvfjXrP2h
         wClc2AewpDR/j1Xu4JV+Spf8HjHbJBx7uZR1TSmUMa+zo/vnQuUd0wcDZRFEPkPkIrUJ
         fYsqicGSz3DKLjSiEQa4mLuq+htg23e2eENkd4cXUGtYhvEnsRh5vh+IQyHjkNBw8R/S
         9nrnhZs/+TB7IFCX8dKqjUSvZi4AT8MlsTWWAYLWBUKov162YcHKoaQ97k792skMTuvB
         r3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371510; x=1786976310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        b=Ddda7PUkHi1KnyVXIij7nArB3GVKCysmxnZwA/20hFCAjprqnJeR5UzrPfxrvkz1Xf
         z0KwnbK/KtWbKWbGImBBSWNgZrSzm7kj1RMOOa0JfmOZ7XuSMMczURak276TxbgIBpR/
         RpXtubDwZtFIo/XtgClpuqe3cvebDeZE4Z6y5fVexdr22vRIqfjrpGZ/tj8lSkTRFUWx
         La/wYLQjh8v6HTj/s2nKpB5sEtmMN6RjQANUPyGXWAylXrXKMmlWQ76Stos6gdNoMkNG
         ZFGgmF3XfZY8dGPoYhwbUatZeT3nhVsGabYY3wvs+0T7kCvys4H+cL3wpCHE4BnKtZV3
         PkdA==
X-Forwarded-Encrypted: i=1; AHgh+Rosxcy6jiNsKA5MXG8kPtH0FBwT2pJ+qvZ5nZBKeU5yt/oB1hR5JpeLF7ijgXvGmeHVfo5VfcmhTAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHqK2yzbCRKfMORHbNHVpM21VVx5BIQSPF2q/dhJAI4xl3jtH
	siTEyyrqo1exkPQdsEtPzqALg1zxZNlvWs8U0gKm0lqMKtVTQPwAWeuQecnp1ThTINDuddPEcTy
	PpdQmEk4opK9KY6VN1OodBC63TlBDOJJ0Y49m5T3nYVwsRPfmc9QVp+EpjiP/pFsY029nHZzX3R
	V+2hC1ssZ3WOHIrMpeRAyU0rduBBivj3mAU444+g==
X-Gm-Gg: AR+sD13Lc0ZvB8zOURaacNhTfbRALalSYMO2TKMILRvL/Flg15Us2AQc5oWAoeTsyVA
	Nv3sOhfxSNbl9l91D34fhYF9lRjp2ZWcIVlF/iOIgmxbF3YNTEyFRU89AeOvTyj+YfKWWTmS6rE
	wTwZ4+TRvlPapB6+LVE23ZVjayVAoJHNcNXLvADW9LXfJodHQ0fqcT7GSCrQ==
X-Received: by 2002:ad4:5c8b:0:b0:8f7:40b8:e8ab with SMTP id 6a1803df08f44-9088108f7dfmr495729026d6.3.1786371509573;
        Mon, 10 Aug 2026 07:18:29 -0700 (PDT)
X-Received: by 2002:ad4:5c8b:0:b0:8f7:40b8:e8ab with SMTP id
 6a1803df08f44-9088108f7dfmr495727846d6.3.1786371508926; Mon, 10 Aug 2026
 07:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be>
In-Reply-To: <cover.1785941595.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 16:18:17 +0200
X-Gm-Features: AUfX_mzXC69ugD711wUFTUYf8_epBYn0SrqMBsnLPgmbzyeuCwMrcI960ZDYq8Q
Message-ID: <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Af2I7xI_M7quYXxsKJBEiWGaXddWjRwc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX7lAT2sxojeCB
 BuMgRtMw7zyy6TE8DhnHQAhDWMn0P1/rnuDwUVjqy1YUiPCz1/YPOr9BE4rNxmmTS00urHQ1AYl
 FtohrXDL6tkVRE69wdrLyTKQby+j6O8=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79ddb7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=HDY4BLWKCFmduH3Fo1AA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX/jr6AhPITG/6
 Dw4h22PeWowRVZxZb1/UFtTckZGNpnoAmloFx3yX21+2x/2PygrSBB21F3++vohtdDSv2d1fJLR
 6V4xBd6qM6dB1lGU3IPBQEDh0vWy0Ok6jnl28dXEfH+2qeGSehcNzJghktL2OWpxPCWG/r4JZgU
 5yK6nkTXN5bEcaidaVZqtse1rn0GX00GdxCql5rVS2XEB+Orj/Qk9wJERCvlLkCgdFNAgE3nVTg
 o/fhefQLarM0lJGc2/D8iZPD+sEs7hHfsWsHUjOqS/LI3ZC8Y+v09IDSQ50EvGlxkmrA4QYifcA
 LdjgC/nMgN6IYuWj75jiHM7IIM6K9nwI6rsgZKQyvgf/wVaY/rZuvMNdn6v1lPEdWCoe+3L6SMr
 H0+dS0vBBRG8XHPtHO/7WobOS+hDRH3oX9RskhGCtTlWur2yvOdyH6A5qGCw3czd7seDH5N4oPs
 z3b14pgFnVxah2ufLFw==
X-Proofpoint-GUID: Af2I7xI_M7quYXxsKJBEiWGaXddWjRwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100123

On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series adds minimal support for the Renesas R-Car X5H Clock
> Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacing
> the dummy clocks in r8a78000.dtsi with proper hardware description.
> These two components are closely related, in the sense that they are
> both supposed to be accessed through the ARM System Control and
> Management Interface (SCMI) on the Ironhide development board.
>
> This series consists of three parts:
>   1. Patches 1-2 add DT bindings and DT binding definitions,
>   2. Patches 3-4 add minimal CPG and MDLC drivers,
>   3. Patches 5-6 update the DTS.
> Note that this series depends on v7.2-rc2, due to the use of
> <linux/device-id/of.h>.
>
> Changes compared to v2[1]:
>   - Add Acked-by, Reviewed-by,
>   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
>   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks(),
>   - Drop fill_clk_map(), as it is not really needed until SCMI remapping
>     support is added later,
>   - Replace <linux/mod_devicetable.h> by more specific
>     <linux/device-id/of.h> in v7.2-rc2,
>   - Add a comment to document only always-on domains are supported,
>   - Consistently use /* sentinel */ for zero sentinels,
>   - Drop trailing commas from sentinels,
>   - Sort MDLC nodes (alphabetically, by label).
>
> Major changes compared to v1[2] (more detail in the individual patches):
>   - Add default support not using SCMI,
>   - Drop everything related to SCMI.
>
> Note that this series does not use or rely on SCMI in any way.
> SCMI remapping support will be added in a subsequent series (old version
> at [3]).
> Full hardware support without using SCMI could be added, too, if anyone
> would care about that use case.
>
> For testing, I have pushed this series plus additional work (including
> a rebased and updated version of [3]) to [4].
>
> While I know it is getting late in the cycle, this work (especially the
> DT bindings) are a dependency for about any R-Car X5H progress, so it
> would be good to have it included in v7.3.
> Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.3
> (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> Ulf: It would be great if you could take the pmdomain patches (2, 4).

Patch 2 applied for next, but I left patch4 for now as it didn't apply
cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!

> The DTS changes (5-6) can wait for v7.4; they have a hard dependency on
> the presence of both drivers anyway.
>

[...]

Kind regards
Uffe
