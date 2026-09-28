Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389D54D0CEC
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603873; cv=pass; b=PQTiqOjfqAdJCqqID5XpSp3ntsJNIgLvYT5flK2IuvRX7+rtYi1aRBpqle38wfNpmiaS+tEZYvn5PyLzPzGRZmyl3Uo8XkBtPFPjW+/Dguoi8ESjDp+ugqqQTtGaRWzvT0OXxGbTR3pMPpIWhGaLS3+2i+B3T+H59KWao0bOOmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603873; c=relaxed/simple;
	bh=N0apPBi5a5rdeR6XkE9u3uUSLlm4uI9nB9Kynheh+l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9dEDmZ2ijC8Zu5WfaKo2v0EUhIQh3TEnSS9H4WgXMFWWrn05lsIH7845QgYMaub9AAu5j2kqw503xVkoGrzt6Dq8QJYGANztDeKpvgdO2dvAqhIwVy/LkgYHMebjNave1DCdBnoLDkS4EcnEAXaFCrhjtySMSmUm/kUMblj5bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4tRZgHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZm+5Tke; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4tRZgHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZm+5Tke"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAHSi1189565
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 13:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=; b=Z4tRZgHZskb8ptT5
	TWLgXlXd5ZEfOMXoSIMOXv3xiSCfmZPrN/BXEN2Jx/EI7xgxsl/mhtg23qiOqhBr
	lotZeIr931hrlSEd5cQ/+wfndIUB7MMIEPhy0N4qQaoL3vx0QDP3gKzGCBMkjA4K
	qZEViEARpzKBw/bZJdJ6k6fM60UXmpX36/eFY3dIVjAN/AFSwPSLBAOzinZyFOZG
	8mAxM8Svcg16uWsn2JDQlVfu7pS1jD7EKG1O73xL6IcpK9DHPvN80Fj2n8ZkDcIH
	gzgCPX/52m/fh2UgSttxIDJ4qB8q8S1LQf9euuiVEAdLjZcrqYl5RVZOicTCxXKu
	X1l8WA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc10d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 13:57:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86261e66700so2235443b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 06:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603868; cv=none;
        d=google.com; s=arc-20260327;
        b=NJn293XWIw+wdNvM9oiKLQ3C5KS7KdWSMMzR5egKycm2gKYga18SYkoItBqH91R+3z
         z2SAwtxHAKJatzha6jGyMBQbd/YVstWTOHYm1IWj94c2F0PdqJs5FJvbcs5UVEjmSEHt
         i77Ic1fNxEq2jA9VaGPYsZJ5mZEydw1q7n5mbQqAda+MoypnzJ9BmLiEKYKU1kIJ0VoC
         0dbhPTj1jjgCWnG6yhEX0KSDz2J69RsgFw5SnDl53DneVpwXW124La+5GaQj6TZLh3bT
         9TdmKjdSAgzPrUP5e+Dh8SB8q+QQBQ5JDybo/GYim4l5gkj0Csh+XSn8fQ9z9qQCH9AD
         pkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        fh=N3jcFPjbULo6Nh8JaPipYshH+rijKSsrSNCdsiHB4Kg=;
        b=iZbNS1cqnBBdSzJCsvFuUKqtwwrJc8sRdzU0JgO6+1TzfRwwxaE6xSlvMg54XKg5+m
         bKmy5wm/3CMVZTUdloNsK0F2gqavPHU0P4fwO4Hl6cixanmvbA2IWLn6VpLPUKL+mr8A
         3xb0aqaWE7IIY26g0CATurdgpvZfvYrHQDEp6r5NgU81gvfELWraI5doPVGy1VehRNx7
         ntDHD1lZvRkmxe7aH+cRfafsnQbsDH/TYBWUxVOUYlZQoGliV9cIvjclCxcMo5oq1mmN
         y2xG/rmAJX5XvyiE5VubYhilJEfuyuFOfxdyWleG07780hX53/KGU/8/1BR029fQ8VHC
         YJDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790603868; x=1791208668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=gZm+5TkeNiuNCWoMFmByiGuXPWyeZfYVqr2uIkJNz73oKjT5kMP3a1/PLCH20oeLe0
         xcvk9SuiHU33LZ55Fbzpfxo1NFE/GBDg/vuoWelGhue22jmQ8AZDU0QRjzBVyuk62/HK
         pohM2L7obX8b66ghXXB9PSYRPQlEfxawvn88RDeEYywCxhFFV4rkCqwxuRdiC8P5I24e
         wA+SBuii5pGi4MhJHWIoXYSph59G0Q0iayJbv5z+vVNVBDBVkY21N9yu1IDSzYOFOi1j
         XrXt2aO9RGNzSTW5/ek7Wg9xq+o+xZaDAI6G3NrmZIDngCZvK9zlDMcXh3IiziXH73n2
         ybxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603868; x=1791208668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=ZzZAYEx12VGD1aCkob77OvOO0QwAKZNEwtxHxi9G+JcII7iDlHQz+IRahCt6ekBQ+M
         P/dRfWiVTDuRp7F28BrYxkNDY4zQ04awGkhPud3pDDC7XuetvzpcQpzJrQ3e6tw7PLw4
         jT43jl4hrSrNpm2Ii7aT1+xoWpynVX92puKJsTQyZBR2u7ru7L8R6TT+YUVrQUAC9x5Z
         EC76spveSwj70I9cnE8kS3bMBjqdrmBzSprJN3p+JU+D6WW5Jz1H4Dr0da62d9q+JMOk
         aNimXbtejMGWEOWsAAtLI5mQVAORJxc+X1WVGmEyMgwT5fBRqRoAns1OlnkGSsd/7nIl
         Fg8g==
X-Forwarded-Encrypted: i=1; AKwUvBzuho8Yq8kFOGfXInq941Z0BYiaNI8nEJm7S6/5V6w7eJetajydHAjsdG+Ew2iK6EuW4RIQCr3IABM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOH2XHvAy99lKbN2Ksb69lA/Yq59Jzq3IydIupyiyNl6CDKW6w
	B/MquPgqlENN3CdPLmGK/HhOFDAUW97KGVCVOV03bKtA5XnY3jHGN4WDOr+wgf4RtkGOiOR/F1a
	WnOkqIImwN5zAm91JQTMfNUC4C7tXwK17Cf3EL6GF8CUn5xN3hs/b+C76X8BrOLNS3aBvf4nJiH
	KOaW+DfZQNi9ldbKQPbcQW88i8VtHRoWnl0ZFXfQ==
X-Gm-Gg: AYBFou1rzcRfLgDLuJSq/QJT2ijn/evJxH7apQ/LOyePidTxmeZCkzFDEHsVgbP5MF9
	Wo58DtJBEeKBzB0wtEfinAFnscjlWEMp8QbsHPtFg2EDbFWyqZkR4m5MiKExeOpyvXDMN8EeI7O
	UFjoQ6G9qeWOrWBQB/j8LKdbVn+fc3AWJXTym3ZfYKvwE2qf/SRnGKNQ9u0Q==
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-881c8819a45mr4006784b3a.23.1790603868383;
        Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id
 d2e1a72fcca58-881c8819a45mr4006707b3a.23.1790603867726; Mon, 28 Sep 2026
 06:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:57:35 +0200
X-Gm-Features: AclHuK-nE9h16BssbY-0V-0Lcqrz78yNjoqqCVRnCD5BWpC1wzqbo2Hd-T05VXY
Message-ID: <CAPx+jO9Vj=42dHEwLzTHe1b+nrvip+ibVv4iPquxwJKbFAkm=A@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] dt-bindings: power: rpmpd: Add MSM8952 power domains
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba725d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=xo1k5ONJVskqAlz3UKAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: qM9y5xnFVOB61myDsfPNrGqCcNhYOIDA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX/kaDuHhVNoJp
 GsXv3ssghIUbABytUMPLidQgnjWkjTskbVYAOYrWx++bDbAZoji+fcCn7+MIwxbdJIW7WX3cIlI
 15hR60+mPYG2KGhtLqgs3QfNfggNs1O+msxrhRCZCOLsvVNSzwFaNhuiGgXg1moEqErpvorh+dP
 AqEAhso2rKvRZCO5IsKc+ZINDzovjdjGzpeUYRlFfAVfKcU1QGSeE4lSftxeaNZctdve5dfvavP
 vIOkrGqvlMVSJrsgVABlNvLcojj+Rp+p8h98+5OUWKH/A0XFSgsP/My67Y8beSvYMIkZgAGGoOU
 KY7ziLJcG2uoEx+q1jb18iUQrf4++f9bqxSBVxF5wpqbAdO3rHbFEQJwC1uYnLM3OHo7GbhPMOu
 s0K30wCrcu0UFH9lY/xa5ulF91FFR2bY7awFXvhCfqSg8lF8ZOyYlSe/kBb5iakLMg+odszvGop
 1vdTWd76giOZ2K96oiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX+b2C38PwDgRu
 9k3TEKy0BkP+3OAhI/q9mXNQ07Djp+iBmUbHUh/x1lSvHYkcElAL7dmsZEJMBpPk4TKDVWjUAPr
 C0r1VMjtS8KTcN7AadV+dkIpeODvS24=
X-Proofpoint-ORIG-GUID: qM9y5xnFVOB61myDsfPNrGqCcNhYOIDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280055

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible for the rpmpd found on MSM8952.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index a70bfacbc5d1..8ee1c25a7c9d 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -76,6 +76,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,msm8937-rpmpd
> +              - qcom,msm8952-rpmpd
>            - const: qcom,msm8917-rpmpd
>        - items:
>            - enum:
>
> --
> 2.55.0
>
>
