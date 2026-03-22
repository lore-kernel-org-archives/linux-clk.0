Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF123643F
	for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774157510; cv=pass; b=Qw5Hk0qu7mrx1QVG/D5weZoJka0ptzqU9CVCpvtRanYpxfOHxiCeUX7F3r9HCVZCo8WFxfOdGe0gZ0m/ZsgcgZLaurcAdahy9tGEVWhK6W77MRxNSnrxgX+V/HzOu0/7jd82RDyShyLw8Z59gvk+lGFFRaJdu4qcSUJUsqSP/Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774157510; c=relaxed/simple;
	bh=KXSs/HcXhWiOOPMswor3shOWBLzA140o6i+GUpk9QS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QsB/Q6CSDH7Y31PD/U3Yx4ak6f7RCbSe8Wd/j2pmVRKaVWAhmlc9q+OKBpD2zGY1yjH4FEtEWKVPHF7L8cgTToQI+wsaJcnKssAOzWJwlpKpm7mt0fVhNpg+4lMdzd4k1ujd9jZ5WqACrwaoBRIPslLPPPVZKIfs02QxsNyQpOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYnzp/4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzCRtYqp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYnzp/4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzCRtYqp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LKjB9h1249074
	for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 05:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=; b=JYnzp/4XVMdkbgnC
	Ue3e7Q2azYQ0ehRD3mX08BeSOxwqD+1iepTPeyBtcRg23ixOXAXzcPRoRZAkkNvS
	oRJGyQxtbvBkHwLZ6HMA/YU8Oszb1H7GxOmY8S4ldynUEZvg94dqX35fn0LrBWsz
	bj05Duhp86cl5zD745UMyTBj2sovnfu7rQDJhrcvUCVDTLNmXYLwX5IMmB4gCHaH
	+SH56gHLzBLk6nR0F09zX8n3Zh7FhmlEeiYTa0xi8tAmL6NL5E8s90hNFAHF9W8+
	Wxviw1cTk6QjC2oRoa8XGBTlSiQsxKGXCBSeSnSNfg407zDIqGOsdCq1HYEYIERM
	zv4IDw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk22r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 05:31:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0ffce2570so72969919eec.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 22:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774157506; cv=none;
        d=google.com; s=arc-20240605;
        b=gKjyj7IzjtD85mg7WYlQo45goB9NeRkZWUVMeAiXESj4x95BiKAWivZWjnB8n5NyLp
         uRdWu87OoHzuim5yeOo8UsliInkgJt2d2lbFOquHclsi/OgaPaxPVypoR7td8xL/tjcT
         i42zifhQTxPiD5jiYKVDEB4EWVoo+jNz1GoOz4x7gVVrOB8ta4Cip8N4/HWM5KK/x93N
         bbwGy7KS6P1b6wpwwi9bCzt0bOkaTSn+oLbaxKtlQqWmEx51mLCdIXKXBI8KQqT+a7Tf
         narkMLeMigIvOOOhC8wC1TC8SF0lz0aipOJJ/8dpuoyvdFUxxy+11RS/yzJuooxfaTWg
         OmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        fh=MPYrx7iHgtxNwfc3GuuIMtKvc+woAvN3e7IUbw9tsyk=;
        b=B7lCfquTeksQ4vUiVB4CFt1oU7QtJyjBJj4kYAq0Hl/PbgT31H3tQfyWaFLhcYGOu1
         Ewbih06q7u13R98oyx4rQNrimD3wrsORfaDDK1yGLGPzS2dCPgSHoTgVDarvPWpJTLJd
         9/Jd+13slUzEL2Q2bYuXEkR5TDXqBCXgNr7+WlEDisY66Tuia3JowvQ+tvLfdL8QncBr
         dbCXOF2wLCUZEakxVCzDfEr6IxTEfT50wdFJfwYKqDmWN1RAK+5F1vz2IiyzUoH56tYl
         NPgBMvnjeb0LRYPPEUXEVhqvxAHYuqffgra17Ss694klAf8Ggphb9ORjoaJIBqvTOgmn
         V37g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774157506; x=1774762306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        b=BzCRtYqpHUdteTQMrH8UiEJEpGCys5keMQz4Yy55lDlUR3K2EnatCXSznyjDf5lb+o
         4h0yiyZ+36luAZqV/HHBBpva0kIVyC2t76qIndodohaVAgH18udQl5kHffGHlhb97Wnm
         mjT15aqB5Ouqz2O38GGPYPBrM4o4MV+SwAPxyqnmbPAAlvH4Of8/97VXVdMi4d2/C6Fq
         OvqQdjlyQ/Ljzl4xytEf6TZRb694Ne8hqRnItCM+vAlk3jFw2QOkAlQUCsjjXWPwLVkD
         roQL6/3xXWHStp3td0kbrAuuViOSQPvdMoPGwXmqF33F22CRPUOCaX1Ue2dxtsboAXo3
         127A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774157506; x=1774762306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        b=CEvtsZZombdc7vU8jyVXhRj0cNn3Tv1BVma4QBXoDTE5v04gGpa8hkpy4ivkDkc22S
         E/PWkPy/YtiuuhP5nmIxLk8ssR7BFC9/QeSCu8fKeruMJgM3gR/rvlLDOSu+RY2RrCrR
         /9ZUzKmb03ai0EE0ig02mbGA8k7smxD4CLr2Bpfo16KvXXzZUdCwk2ABsL3AmNVv1n5V
         JYwic8HlLsIpLMPfG+XOZZBMmtV6lLWovJYCP/bYu87oGEnvZMSHgl+WS0gIHCW1hsDb
         U/tUOxIukoVgLuwiQfBO6pBHPU9Nz6axaGbdYilUg9eLjvAKCwFutZokwKXL26QkyeIo
         6vEA==
X-Forwarded-Encrypted: i=1; AJvYcCVzSqXtELFOMGJqfk2TB5RjdK3HdnTSUF58HboA3JQP++ybqezzQ0bKRnOEg94TkCuhQZnpT/rkJ1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgH5gKFfo7EEgoKZU01zxp/WNwvbuEnWWaDHJumLML22kRwRQ
	zZqWxh8f8wp8K84E8GIRXHBiXjth8TsLkkEvm590YoVC1fsoj8AmidgTCRrexeZCDW4J3tEFDfw
	qtYXK6zElP3gJ2a2ZYZ7pi6ECjQ4tFzwCLG5T0aQBTC2z0DRs9qY3omxqv7qfjlI6nzY/vrEkLq
	48Cn/uVrwLT6959bKQ8TbQuIh/gTC0Z7ptGCgMrA==
X-Gm-Gg: ATEYQzwqQ6a0zN4V1YHzbZUZXszIzzz6YAbWMW2L3ks7fD49UhIi07upoOh77hp+vyb
	86JqGdPyIiTOdZSDfwiAYhDk23nJKkREHR/mPgVJ0WiYGAr2x6sIDC9Dij06FnAJehVMPALxjiT
	ZkZi/TDbJL28By63kw8RFXZxo3ZX8SFcrl5IOyWDBpMTyAOFhQG4d7YSI+4DydJKjLqMl4lezEs
	NGiNF4=
X-Received: by 2002:a05:7300:5b88:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c10962a891mr4064921eec.13.1774157505614;
        Sat, 21 Mar 2026 22:31:45 -0700 (PDT)
X-Received: by 2002:a05:7300:5b88:b0:2b7:32a6:82d1 with SMTP id
 5a478bee46e88-2c10962a891mr4064899eec.13.1774157505124; Sat, 21 Mar 2026
 22:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
 <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com> <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
 <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
In-Reply-To: <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 11:01:34 +0530
X-Gm-Features: AQROBzCzhjx0vKHwbPAUpiSfar1k4cq_wVtxI0SjsuisfOaHCCYWgZ9iiMzXYhU
Message-ID: <CAGptzHNyV=cFRyk=K=uXt+Jf5e-ONec8ih=h-Mr2x-xo_bmbGg@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: KKltuEbeao4aD0xzTIjmSvbRLrCFf6Yo
X-Proofpoint-GUID: KKltuEbeao4aD0xzTIjmSvbRLrCFf6Yo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDA0NCBTYWx0ZWRfX7eczImpg/VJd
 B0zSpvynHMFSxcX6WdGKuyD9RoFwSrLugcKN7zl0l3pKNSeNqPgwjB5704GVMB83q8waiJgXJ+7
 lWHggIdyxTct3PFuZfwzSlKhw2bP9oAGtsfh8+huNGFnZ1oKVOHEUxGKecwP9M40sKyq5CAIKNo
 bquk3DYHpXGjGIeVLgqYyQAzAXXggYS/DZX8wK96L2Be2/rjO5u3UGxyJU7cZViIHLJ+E5kLokP
 TeBIVKk1R8kPeOa985vtU7lMlTDodfcIkX8pMRtj1gKiPWZ9dopc8PqYAXOQlao+tuHNSxnXLrx
 WI0RpGV5KchWLQyCirldVu9jyyE5nnnaVqfnI/4B6H3jh8femZxsE+eY9Lke7InC4foAzKsnlfN
 HIDjlzqSS0vwnfZCztS968gkiFeSz/xfLaS1rXbsLckAZnN5SGGSDcV8ATT8GS5J3TXTbTsu1+r
 FN77E++C294B83aRhkQ==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69bf7ec2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=CIsBWlCQImJ4_lLhEykA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220044

Hey Konrad,

On Mon, Mar 16, 2026 at 3:05=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/16/26 10:03 AM, Kathiravan Thirumoorthy wrote:
> >
> > On 3/13/2026 6:18 PM, Konrad Dybcio wrote:
> >> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
> >>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> >>> rdp504 board.
> >>>
> >>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.q=
ualcomm.com>
> >>> ---
>
> [...]
>
> >>> +    firmware {
> >>> +        optee {
> >>> +            compatible =3D "linaro,optee-tz";
> >>> +            method =3D "smc";
> >>> +        };
> >>> +
> >>> +        scm {
> >>> +            compatible =3D "qcom,scm-ipq5210", "qcom,scm";
> >>> +        };
> >> OP-TEE *and* SCM? What does the former do?
> >
> > For OP-TEE, we have use cases like getting the random numbers, remotepr=
oc PAS and few others.
> >
> > For SCM, setting the download mode is one typical example where OP-TEE =
doesn't come into picture.
> >
> > Please let me know if this helps.
>
> I think it does, but it's odd that OPTEE wouldn't handle both
>

The SCM calls are the ones handled by TF-A which are usually referred
to as SiP SMC calls. OP-TEE doesn't handle those SiP calls but only
the SMC calls in trusted OS range. So yeah both nodes have to be
there.

> fwiw +Sumit is poking at OSS firmware for other platforms and may be
> interested
>

I think this is a WIN family chipset which only supports OP-TEE by
default. In the IoT chipsets there can either be QTEE or OP-TEE and
the bootloader (U-Boot) apply a DT fixup for OP-TEE in case it's
present.

-Sumit
