Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3551A13D
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166969; cv=pass; b=WKpAiFYdBHVqW+6Jt1mDaNf3uEHfEevGhjgXtaj7Fde119737MWt9z2sen2lIWA98Gm4bbXdSTQG7+CLApDJHPgAzqj7bfXtaIh3kRheVl4JJIvlsru/k1RPbs/Kbq31hE5yp6HZrkIvCPtjkDIT8qEVHhvy6SYiKErA8jikzRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166969; c=relaxed/simple;
	bh=kAPdjmKTH7eqeFmV0zKwPKmA6nvla6tA6nD4BePMtPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9xKKiCjtokHV2R7GHSHkP/f5ZDqkBMnzkJG6sQ3NJ4S1j2v+xL88EDDPwMDqCjuyZXLWJ1UoviJTS0GtFhiG6Eip+JlRkSVI61HoPM5sb1buQH7WGpeTyVfDm+kJVyv9iKnzkoFnw4z1jRuMHD+uOO1pgVzeDG8MhySvDOJlwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM1JaKye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cceZCZ7q; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM1JaKye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cceZCZ7q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBcnE73161354
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 12:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gNa92BCPlq8IXNX/OUUDOG7IciOgTK+a8rk8iMF8zE=; b=bM1JaKyea60UL0Kc
	DXuMbSUsclXr2hnJ5fU+MlsgOKh8j8cAm3Sua2LrFXdYLdH0hfeoTXlKlOp+aEf3
	b9N8oFoho2U7VqA4DjTE3qfoGIDes9XNinQaXAPn+jKkqTsKer3n3+b5/QJ2l6Af
	H42t/WiispXcsRbiEJ+G93472KD9TUHv9i6YMfssKwZ3UWcY6owbgVEPS+uQb55N
	IwEYwQIH2pn+yPZR3ZfVnTfpweDxW0+XfQcFAgLMkcZ0zpsznxUacs6hqx39iHT/
	v3XXA4T3CCignWW32iDgiYg3Twf5jwTmn51vXHXSTTP2nyU7hfQhXv26xT9GyXyR
	5FfHDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qtu97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 12:36:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so821803a91.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 05:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790166965; cv=none;
        d=google.com; s=arc-20260327;
        b=WlmCoTdhbQgQCdwW4lt+Fpuy/KpLAMrqGPM2t5SVozSr17AOcBz80byHf52gMxaIK6
         +ebtCTNPjZ9HfmWc1JjTFkZ0CHgxmzQUfsQEC4NA8YNPUEia41tX/XiPsK7aWP8TJxcc
         t2QFpWxxvw8Y4kBk3mrDXRVsmrIZZjCHHs4po/NA47IDyGmIaB4BMEUToUjvM+22UBei
         Rh4h1PblglTy8ny/v5BachGWOK2uN/vIW3meTERMKTo2rq7hvlgBCFwJwt/vLYioSjYr
         3ROalqc5N5JUrOZgfw2DOjuBuGg65jOXXYnVT5mWKGU+Ju+AttUQmYt2gO7vdmL0zfUU
         v+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3gNa92BCPlq8IXNX/OUUDOG7IciOgTK+a8rk8iMF8zE=;
        fh=GeEhtfIut6qaQwj0FLkFGIqCByYWFG1vgsbww+CN/c8=;
        b=XhYA/02B8CiyCo4fkhjYrG4jwEbzMS4RZDVwyPj+fcaunwd8OQE9UvNwgxsthUaUB3
         1ZMtZVirVc5+2d6H72++oTm2aOHiAzKQe5OigwKcdHpWaxTTCw+VrvLZkOV6Y2Jckp8z
         No7Wh3xMbYAJC77O4IWsmgeCpBW1CLZI/v2WzWu3Id1U0XMs3NfF9sWTvn1HvcVNeKcW
         VX1acKDTs2BM3xHPDxqF/KfpdXYFo6tJPdkChrmkN5IKhKdruTf7B6swA5G/YJa6x1SP
         H1vqrXV3oNVN33kyTuGcUBUMfYj6SqJYqtkkCR9Ywfj9H38ANxV6t255plhkEDc9TBoW
         gdWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166965; x=1790771765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3gNa92BCPlq8IXNX/OUUDOG7IciOgTK+a8rk8iMF8zE=;
        b=cceZCZ7qmFB4iURNoX+1dYWiLkTI+v1XRh7aGeq3ImdcA3ELnJDC6HxPGjJ9VArde4
         bevANjzf2veez7+zMYFnCNy1zdBq7lK2fB/EjRImL2bGlTJQTDj/esqZc4YwGcJU+eKb
         pQK+BNrAj9JuB9mkiDCrIBh2+mk3CTHrGWQd8QmUvFDJjTCZpCcVrDD9BKDsM3OdcFR9
         0reqCG2Zt8y4VDB1EEF049nGBqvW7wKN+u4PjAMumWxJfb9cbSQ2zruSg/qq6zOm134y
         yKlHl/d4daMfesRF1rrjOiuuEAG82Jge8L9r1LKvoOXLU9lr5F10pCKl+ne6yhDRj4OW
         MGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166965; x=1790771765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gNa92BCPlq8IXNX/OUUDOG7IciOgTK+a8rk8iMF8zE=;
        b=0hopThhguCUDuSkXCUWdpGXTKxDAT5AYaoZbPv1I/1BBkAMBLgUMgBSY3ThIn8z4LM
         IO4W135lkr9K3PdwsIiOV7D2D6MmpVkRFfJfhivjrBJEZSoKJLJzU+oW7a4SXRZm/q8Z
         hQGhT4h3OOmtuxWBFii2QzYsSmEnpbutyB9bVmKAq91Hdy79dZ7yLByTSxhATEJCInTZ
         Mjxm3y69kGozKmsSv93fGoOnsQlOCSKN6t96+EVjW4HSj4ieF/gje3TpdFYtsGds6xWy
         pUeHH0X0bczMWT1JfqQOi+s1e1JZGqQivzvboPdhWC9W5MXWvycAsHRcQ1f3yLpeHbXs
         o0yg==
X-Forwarded-Encrypted: i=1; AKwUvBzk4puxFsqcjjXIklZbM1yjjISdOVfRUahDzalF8kcR321doN6VA4pOYukX0F/ri9kPx5hSA7+12Qk=@vger.kernel.org
X-Gm-Message-State: AFuF++kizXHCZSw0xpuCRYh+oWzeJJ/7jEKwK0YKQFMbVilkEuq8/6t6
	cbp83avjFTPwO6nR7sLI5gkZN0IacE2Q+PsNLZKOfCz1OziE0O8kA8fIZ3eh6JrcT1PFjyGLMdm
	iCFG256W8MNrJPoVYAwvAMT4Ytnn8zl0jPZ5juvk1JF4aC59mOd/F9PKbKl7/9CoMz7kPisJhoy
	+Q+bR7V2OCKWQzRALWcpHl0ZNBqeTmmPgyhPeEtA==
X-Gm-Gg: AYBFou2VeDN/ogS7yePd9h2tX4oLDG0zZ+/RYxV07Nkpke7XxQtS9q3Ra+gJ1khsZck
	RalsNCxe/5N+JbfhY2iiL3dQnUAeq02BPdcjueWr3hE28aglBKhju5xZ+LNaEZ9wFJmJPsTr2AH
	MKsBcpvVbFMuSbSpzblOj6SWevmaxszrKBWkwq0FjsV48Ov/v+fMzTNU5klQ==
X-Received: by 2002:a17:90b:280e:b0:3a0:4384:adff with SMTP id 98e67ed59e1d1-3a07e51cc3fmr2120253a91.23.1790166964760;
        Wed, 23 Sep 2026 05:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:280e:b0:3a0:4384:adff with SMTP id
 98e67ed59e1d1-3a07e51cc3fmr2120217a91.23.1790166964203; Wed, 23 Sep 2026
 05:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:35:53 +0200
X-Gm-Features: AcwNN1UTraLChGyH0jiZy9NpxD1dSBXWo3BNBqcJqSMmiFGJ2e9xHGPipMKPzII
Message-ID: <CAPx+jO9tx9CStEnZ0kiMEbN-XCRD+XAx96i4tJf8LZ=CHP8D7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Add support for Renesas RZ/G2M v3.0 (a.k.a
 R8A774A3) SoC
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3c7b5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8
 a=kA1v2ZBIVzPyHwuz2UcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 70HlXQgJ3mTR0Gu_apOA-foOlLS0lYXF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX3lrEroo37lKB
 cYjmVihn7bLTRLBIcPhZvKW49jciHleNWBxQlIohXsu27OsFX4z+85LrOJaEOGl7+kZvZIHRavN
 WJWd6TSG6/r9x7eFxNA8Hl1/37AMOaY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX1KgknO4zmSIj
 VKNPm5kCTIFH+qIpuSTSnwN+YIwjAJLMYlnHWYsE85KEMBsDu6lkRX29zYAE6RwASchdpe90K7L
 SE/1IUN2ifjb/on+dL264Yoj9kdg9VsCixRJeu24+m10pQqAolBlzbmG5v6uZaSY2M5BmLXyHjA
 XhyrjO7ha42hCWOyRB2fC+c/ifuFeMGex2DR4aCm99+i75SI0iQZViigVvpo2PushL9pf/ziu03
 Pmir3ubrGTeWJVCU1OdOp+DTfEnu6HjVPsc5sb79u/JkbFA9TX0JuzyLag8+QCN2G6ZesVNp5TW
 /iP7wZC5ufZOFYcf4sX5zyP7t82slADSOoiE66GTKAhiqq4t8QK9q0brzVC77ApWLd38R6utrvZ
 pkw/Txm56k7cOR4YI9sgeEZl4X73AhOzm4In2shzOjwdVapEP6ndssV3U2pLA0ML2mMKXAldYL4
 u01cqNL+kw6pm2g0z9Q==
X-Proofpoint-ORIG-GUID: 70HlXQgJ3mTR0Gu_apOA-foOlLS0lYXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050

On Mon, Sep 21, 2026 at 3:45=E2=80=AFPM Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
>
> Hi All,
>
> This patch series adds initial support for the Renesas RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC, which is similar to the Renesas RZ/G2M v1.3
> (a.k.a. R8A774A1) SoC but does have hardware differences, for example
> the System Controller lacks the A2VC0 power area, and CPG lacks modules
> like FCPCI.
>
> v1->v2:
> - Dropped patch 01/10 ("soc: renesas: Identify RZ/G2M v3.0 SoC") as it
>   has already been mainlined.
> - Dropped patch 05/10 ("soc: renesas: rcar-rst: Add support for RZ/G2M
>   v3.0") as it has already been mainlined.
> - PATCH 01/09: New patch.
> - Renamed SYSC and CPG dt-bindings to include vendor prefix and updated
>   all references accordingly.
> - Added vendor prefix to include guards for SYSC and CPG dt-bindings.
> - Updated commit message for patch #2.
> - Added space before closing brace for `ca57-cpu1` area.
> - Replaced underscores of node names with hyphens in DTSI.
> - Updated patch #7 to not use odd sizes for the sizes of registers and
>   also removed the leading 0 for the system-controller node.
> - Added soc: label to soc node.
> - Dropped bootargs from chosen.
> - Corrected indentation for patch #9.
> - Updated licensing to use "GPL-2.0-only OR BSD-2-Clause".
> - Added Reviewed-by tag to patches #2-7.
>
> v1: https://lore.kernel.org/all/20260821150408.73829-1-ayman.chaudhry.kc@=
renesas.com/
>
> Thanks,
> Ayman
>
> Ayman Chaudhry (9):
>   dt-bindings: power: renesas,rcar-sysc: Document vendor-prefixed header
>     paths
>   dt-bindings: power: Add r8a774a3 SYSC power domain definitions
>   pmdomain: renesas: rcar-sys: Add r8a774a3 support
>   soc: renesas: Enable SYSC driver for r8a774a3
>   dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
>   clk: renesas: Add support for RZ/G2M v3.0
>   arm64: dts: renesas: Add initial SoC DTSI for RZ/G2M v3.0
>   arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC main board support
>   arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub board support
>
>  .../bindings/power/renesas,rcar-sysc.yaml     |   7 +-
>  arch/arm64/boot/dts/renesas/Makefile          |   3 +
>  .../dts/renesas/r8a774a3-hihope-rzg2m-ex.dts  |  14 +
>  .../dts/renesas/r8a774a3-hihope-rzg2m.dts     |  49 +++
>  arch/arm64/boot/dts/renesas/r8a774a3.dtsi     | 302 ++++++++++++++++++
>  drivers/clk/renesas/Kconfig                   |   5 +
>  drivers/clk/renesas/Makefile                  |   1 +
>  drivers/clk/renesas/r8a774a3-cpg-mssr.c       | 168 ++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
>  drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
>  drivers/pmdomain/renesas/Kconfig              |   4 +
>  drivers/pmdomain/renesas/Makefile             |   1 +
>  drivers/pmdomain/renesas/r8a774a3-sysc.c      |  45 +++
>  drivers/pmdomain/renesas/rcar-sysc.c          |   3 +
>  drivers/pmdomain/renesas/rcar-sysc.h          |   1 +
>  drivers/soc/renesas/Kconfig                   |   1 +
>  .../clock/renesas,r8a774a3-cpg-mssr.h         |  59 ++++
>  .../dt-bindings/power/renesas,r8a774a3-sysc.h |  30 ++
>  18 files changed, 698 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.=
dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3.dtsi
>  create mode 100644 drivers/clk/renesas/r8a774a3-cpg-mssr.c
>  create mode 100644 drivers/pmdomain/renesas/r8a774a3-sysc.c
>  create mode 100644 include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h
>  create mode 100644 include/dt-bindings/power/renesas,r8a774a3-sysc.h
>
> --
> 2.34.1
>

Patch 1 -> 3 applied for next, thanks!

Note that patch1 and patch2 are also available on the immutable dt branch.

Kind regards
Uffe
