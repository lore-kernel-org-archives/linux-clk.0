Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF51E242D7C
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047491; cv=pass; b=GPmAeOIimuITm6wUKnFEye08ZXOTHBP4FBxtk7+ac13DtM4Iw/FNBnwkrGDcscuaWDmig0+preguOMrz2gAQ0LqDY1FIOTT9cH0mJdTL3czlwYPegYUHZzu3eiEJx+HQCVEDdoGpKhSA57Hpem8CpGR8KVljxW5ULH95y+w+rco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047491; c=relaxed/simple;
	bh=T4gCvEK5pOrZp04yFKhri9JQ2qyg1XBt9hVS+X7ctlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MV3Z8JRn6Nb/ULV7cZIyfr8JIKGnJtcAixQbTeFbosjvs/pwDBzYPvh/0kPq7q0QNSheC1Q67R604drWQS+WRz8SMXyFZOAGMy0j2KddU6sgelApTHNyV7nePrH7CSoj+BotU23M9MzrLTEpVrcq/rk3hdStmoHiUxtw/g1CGV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+CCQgp8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3gmAVDv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+CCQgp8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3gmAVDv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVFPH255240
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 15:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7yDh+JC7Z+2RBqZUUP8nJKY2
	Ywl628bcHYB1vTz3mFc=; b=K+CCQgp8nA15ZURa5/1084YIeiGw3MpFG3485Jyz
	OEBNk8BOLECS0x7hNAtxhic3vtEv75iaR/KvhrMCkrYAK/GxLQ9gbCMmC6XROraX
	vFuuBIW4wO2ny5k/p4ZJsnT9fIwfIwEYYHaqkVwjcC0fR4fJyN7f1iaFIjqnbdxC
	a7u35IRUu0kaAIreKB/5vf6DLyb9bE2J6clBHYkPhVMd9hsdGlUq2uAS1dnhA6Q5
	qifjSpkvSqLg2C61Ir35GSXM3dBzTdAPQx+y9wmvQ3dzeMTV3ELuthvFpiSVpQC6
	qkqyGHce17ZBpqEzWgWZ29zoYHQ6FAUvPSQKyBhKM1i64Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kgk1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 15:51:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354601967f6so1142876a91.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 07:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770047488; cv=none;
        d=google.com; s=arc-20240605;
        b=arf5NNx/ug7J4QNmkSVkXUaHT+/Ppj5hFXoZzpubWd6bS9VRpGFoi6N8whQdqZTR/5
         QxGFpS1fpui6CE6F2VQcjDkwW7u40zoKi9ZIm7hanheHhTXvM4hEpoqKmo9ReeFcs4eX
         wvldWeBFSoR4El8ciE4Uh6CWJtDc0mxZsC6SVfHgGdORDjpKTL3dq/59/iZmxBuyG3dK
         zPLE8dBAVnADkGLF4UJTuFQ6BVFgEwGPOYfDBtQivAN21iLIXy5X3PlYOqzzyCmRRlOj
         fwr6yTufqZHPm6KrrJOvSzbL2KnjhpNLCTUrQdRTrDoeoziTzcawj53DY9r3Pt9WvCYt
         xWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7yDh+JC7Z+2RBqZUUP8nJKY2Ywl628bcHYB1vTz3mFc=;
        fh=ojeVivN3wphwJg4jomd2i9FFAxxV1HDS+1hvvtM6XKc=;
        b=fHKLqNHr6+x7LIpY7Hnb5kwlSQrp3i7xHZdMk1hp1/LJ0JMJk7hlTLaF1KbhDGGaQK
         fKclz+MvjSaJVHkX3IO1do3h7jC6bkPJgllqdKSACqsdn0I+QySaEH7/kJlOC4D2s8LR
         2v9ZEBWjSA/dXrWSs/7+1EEqBR3vRTbix1kI0nSS2iYAAO3AicD7UthG5nn514MCRLH6
         B49ZIz8oV+RDIW7bTCWtaz91PXooorOIhgoyycAwRXHJjXi+6aDpfOts3wCDHrx1Cmvm
         DNcjc6sgMNCkQRYE7NK9AL25e8cORBgcDnaWWYI6gcbuy1Goaa7T6rY/XgYg++jNeC6T
         4UzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770047488; x=1770652288; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7yDh+JC7Z+2RBqZUUP8nJKY2Ywl628bcHYB1vTz3mFc=;
        b=P3gmAVDv4mm6U2080KcMNIt9HkiTYhxjF3rAWfCl0Bva5dn6SZD/1WRxTqm3DZWp7D
         xoZ70AnLX7TUVV7RiHB47i8MWrp0EG3MbNhwd2MtYOBO4zKW/5kH4Hsw4Oz4dHOR2B/s
         zgDLVdI1fsqWpa/SGsgTBwnHNHPsO0UBoZjJLDR7Ug+/PzLFTTz5vsMMVkv4tLFknTKS
         XAqV/wL+en1gYrRGmBznxJB760Wln4/ZiLgqz327tTxQBeVJShmvauaYC9DtnkdHfbiX
         BkIUSIZhexy7FXW12bpBDfcH7C5Td0dK5crGWtz2MdYM1PpJfCKrtaJ3Rbf5ASdcj0pN
         Npfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770047488; x=1770652288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yDh+JC7Z+2RBqZUUP8nJKY2Ywl628bcHYB1vTz3mFc=;
        b=BxO6yMlLPur5yJfxPD1JkTBEn1kEyWOFklhG3O69fgIj23u2kXLbJky8MFOWQtb28v
         z3xW5/Y6/BLbalOc2Pdcjv+V8OPH+yZwCy5oi2W0Tki67wn+Cw/BRvjTYE3024of4Qsl
         HEXyWn4IK+m5dc+JPkXXXtDx7TkFknI8ZZsm8LOZjymotE7GEvKFgAXO9zjvM6g84VUZ
         tv10k+noX45ct7x1x46vi+LBkWEoLliWlqZrWMu+DW5o1nrs051DF2wUswTYScjm+iM7
         Uy5oStf/ED47QZff/Ao1cwOLLjzmlcyHCU3Ob5CYPhHpxZBfMVTdifr60/RBgvETy3LM
         EMtA==
X-Forwarded-Encrypted: i=1; AJvYcCWFc6F3FslEyQGJuKJhrw4ztx0GL7fT6USHxKKLteOHRueSIikJr+tToDEb5+wkLzb1BpqMxN+eKFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkk312f41ynZFSlJK90tcfVt1fEtDY+esFZYzsyLL38SCQDwMG
	MYtH3dZvzjAPvOymAr37vEJLnIbHBfjlT9wNYyrneCkkYwnuAqCyNbRAksoRvIn9vd6UYN8jFF9
	JNvtPSvAtqXV4xuQ8VM4LhFQMLq/IQTFKaQPue8n0a4KlIrcJn+W8esjcXpvmCKa+Pc694bXisO
	0yGw70n20kTbL8GZlE0F23cEYfPbm1pFuhciQb5w==
X-Gm-Gg: AZuq6aK7xtt0d5ASYXzu5uxtBQZ6uWNQpmEBOSl+cngcJIGQFMvqtEsHZ30Crr6FV4Y
	alJFF7/Ulry3+b6XKzRslPW88MJtHnbtrWj48+i5x0+hyCe88q6prb6js4c00XRs5YIBDRS/eeQ
	5iim/mlO0K3Lc03wY6Y2sEMn0wcz1KSfWanjlpZUy1Aadr1lg1FDc3k4+F1DMQJg1wBIXsvYPdp
	mFd4c/ZW9MBYLk1o2rEI+6V1IE=
X-Received: by 2002:a17:90a:e708:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-3543b2e008emr10839054a91.3.1770047488063;
        Mon, 02 Feb 2026 07:51:28 -0800 (PST)
X-Received: by 2002:a17:90a:e708:b0:341:6164:c27d with SMTP id
 98e67ed59e1d1-3543b2e008emr10839011a91.3.1770047487529; Mon, 02 Feb 2026
 07:51:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
In-Reply-To: <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 17:51:16 +0200
X-Gm-Features: AZwV_Qi2e1xUlq06PRab_j4QBJgokhNft9ud38gaUZCSMyia8nonVRqW7NIgfHI
Message-ID: <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6980c800 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=2dp1CtdQIJBwMkjZU4MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyNSBTYWx0ZWRfX19qGoBph3iaP
 aeeRtLODyp4AYZo2R4f0tUGzr+sB5wULWMFtDStKli9hvuWb7uZ5yyjuFMm7zEyCvMO0t6i5l8o
 qgUrRkFUKhMUhiz75nrluRrCSrWK5NMqyPn7VRlK0bhRNedDER5KtwT55ZYbopbsAMQOr1CG5uH
 ICfEWrJBcdP72dNcP0zc58kjcxTIkhaNcbFH2y8EQwABCLzasL/7iILxZItRF26wKwDVex8HnDS
 zOD0JHE1smx1o1UeOnnDz4MRVcnmXa0Cm8gxajCVr1WuUkjh+eYTlV2Rp+xddN+9/lR8Q049uiL
 Df2rJt5r7IX/uOeEj7dMlP4Vlqxm/kBW//n3Ysxo8iQvKR4E1i+vgq/qWNln9FuXmfrkmslyug0
 eq9Wg9/4K8jiEV1XavI6HKzd48YSCZOH1W3FeCzZqo6fNlBJUzZXUjsHRFUF9tZZgKcES/rJOf2
 sA1JmAu3fjUpFVdaI/w==
X-Proofpoint-GUID: PoJMQ75uF5GvdxzGPwuN9wfBd_gJll_j
X-Proofpoint-ORIG-GUID: PoJMQ75uF5GvdxzGPwuN9wfBd_gJll_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020125

On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > patchset, Iris aka Venus description has several flows. It doesn't scale
> > MMCX, the frequencies in the OPP table are wrong, etc.
> >
> > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > stopping it from being overclocked).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> this point?

I'd prefer it if it is picked through the immutable tag/branch.

>
> Kind regards
> Uffe
>
>
> > ---
> > Changes in v2:
> > - Fixed example in the new sm8250-videocc schema
> > - Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com
> >
> > ---
> > Dmitry Baryshkov (8):
> >       dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
> >       pmdomain: de-constify fields struct dev_pm_domain_attach_data
> >       media: dt-bindings: qcom,sm8250-venus: sort out power domains
> >       media: iris: scale MMCX power domain on SM8250
> >       media: venus: scale MMCX power domain on SM8250
> >       arm64: dts: qcom: sm8250: add MX power domain to the video CC
> >       arm64: dts: qcom: sort out Iris power domains
> >       arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
> >
> >  .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
> >  .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
> >  .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++----
> >  .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
> >  drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
> >  drivers/media/platform/qcom/venus/core.c           |  7 +-
> >  drivers/media/platform/qcom/venus/core.h           |  1 +
> >  drivers/media/platform/qcom/venus/pm_helpers.c     |  8 +-
> >  include/linux/pm_domain.h                          |  4 +-
> >  10 files changed, 140 insertions(+), 46 deletions(-)
> > ---
> > base-commit: 44ef70faf71468e0ae4bdb782a6d43f0614b8ffa
> > change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
