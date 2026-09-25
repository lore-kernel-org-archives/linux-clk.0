Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D44477E53
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327660; cv=none; b=VcJ9XnNcJ+w+WO7EWT13g8sl/QC1uBfZV1KQqs9UoPpE2fApb6y37FFm9FeGkmakCy7VRboW0AvCFXvmnflJgAfiOdtxrLY8rFHSwXPd68hTY12HcMkizoYNWlD5YNvh/PigiGcN8gS8egZnsfVqPVGpsfrZcn2w95Pe1uiRZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327660; c=relaxed/simple;
	bh=VQgjHcUGv3AS+aRshySRXB9Na6W07JFD8/rafiGks80=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dzi8U3DReN6PUXHhtKwmnFlL8Fw8inqnOI17dI43w4uyBfHHBo3KOLlLaQrkAlLN33XtXaQtHJ1AAoMWPIQKYlJR1Y6sKV6r1NJ3DB8/iWsDI8efjtt2EXiOBjjyiyR2MsI3GcgLJHjiL0ii964vtjHt5mYDnG/Wt+HUIW1tcu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h5GLm2dN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h5GLm2dN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so367579f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790327657; x=1790932457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUy9AG7lIgjavOAkd4pUReRQm+p1laq2n2IXc5r/9Fk=;
        b=h5GLm2dN0wA9GvipNGEoUGMf9pENNFcm+GMuT6HhQdqMzvy1qdx1O+1LjaPNB5Ipt0
         siYbLHYKRYRSNa+ZTfnN/I5yeVCRkFlVgQ0vyY6ryj2NrQBqvjW8IMJ+2WdyOGwM+4Es
         v9C2wQVzu2RmyNeHwFgVuXiKaVucM9ECvvYOYxzztsbUr5sANVLDQmH//vMmLPBiWs9b
         2s8ivlCJYWgHSXy49RmiGDJweIQYgt0Mxvpawf2+BOn6Iwd5lX6OKCwEb3JmSDFSE9ji
         OiNcD4HIO39xFqr1hkcoC2m/aBWbNbFt+OqB4jZWa/zE7o5d+SqlxECONmFOZLDCmiDq
         b1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327657; x=1790932457;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUy9AG7lIgjavOAkd4pUReRQm+p1laq2n2IXc5r/9Fk=;
        b=jwGxVYOpwVhrpUEjJIJpnck6ydnLRJB2Ng9AAY2Y0w6kchgGQrP9YL861UA//zIGpt
         RRwkSqOgwW8Y+V5eWbRlmW3ElnQ78uzza1yOuaTRHtiHhH+zkaufMGqawWK5tzDk5ZQ4
         peJgGz/tMkOZYEB1BKMgqpqd0jX/UmAXqwH1EcfVrU/jrLEuCxw1Ik32iACmvMMStLv4
         IAp2XTrt1iHl2730/I9wWVWW7I1bSv93/O+vRO/8N/tJ/VEeDSDLelqgB3TA8P+Jl6d/
         /wdXd044z3RTjnXPQ5Jw+el0G1xRC1DEO1HX9Nn2gjQape8kTTiXU6mopKi4AVyXBndh
         Sxhw==
X-Forwarded-Encrypted: i=1; AKwUvBy60JrZh3sMO9ZwCAM6WlTQFv2PzsONn1UlM/iw+6V7UDTkZiDiO1zdHNzligMnny1LEDgOSlvwXZI=@vger.kernel.org
X-Gm-Message-State: AFuF++nVkfvVbSl6hNOWDrnJllDqeFw+b7EqbHiQjbYkUW0IuNByAjDL
	4mTw9chaycQx/YjsJNVweyd9uurqWxqMB0Zfhgo91RpK+WUZNqO39x62Ia/Zo6UePiA=
X-Gm-Gg: AYBFou0/xA90pOTRsfPE0018cax3lsuyhX2o9/2hX86n+xsjwhneJHN1sZ/ZPO7uybB
	AjQRDOOGvzoaiay1y7mKB0IUlUS4r969RF2p4Tigbi3hP3y6vjpFGqO7wYB8550/MImOVrhiMnI
	Ucy5O68yzOX1CB0ywTKMnQhsvo7YDjX5sLYysnhxe5qZ6w/NAUmh7d8sQuZzfAQ+Zr08d4iojQS
	+n1Es0W9KhqTpkpxR8jBZbEIYQotg3Ej7M4OuXEUlxVCDM3Towac00zRc/zpIxDiFEJvxPKfcbN
	O6dN7NU5jBOIF0xtUvv3a8D5rPgC5CbiyFQzbRqpe504Q6q0kpY/vat19nQ74kez76+eKW8aHU1
	jP9v/12ALPQL4Dv+hbe+IWNF1f2uV5ayZzCDnFsUJJIrhy44YLfhwJLkMkTinTKJPHVJob3ooMG
	Ue+ANze9QooxyH0ZD9y+hHhypiIvLn7xOCOAChujnMn2KSIS14p94Arzg7+LLEKm6oRhYbHxdyr
	XWaPYjKzIeDSPlXX7jQy9S8KSlL
X-Received: by 2002:a05:6000:18a3:b0:487:732:9964 with SMTP id ffacd0b85a97d-488716befa6mr10307474f8f.13.1790327656987;
        Fri, 25 Sep 2026 02:14:16 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5295892f8f.9.2026.09.25.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:14:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
 <bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
 <jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
 "afaerber@suse.com"
 <afaerber@suse.com>, =?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?=
 <jyanchou@realtek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>, =?utf-8?B?SmFtZXMgVGFpIFvmiLQ=?=
 =?utf-8?B?5b+X5bOwXQ==?=
 <james.tai@realtek.com>, =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
 <cy.huang@realtek.com>, =?utf-8?Q?Stanley_Chang=5B=E6=98=8C=E8=82=B2?=
 =?utf-8?Q?=E5=BE=B7=5D?= <stanley_chang@realtek.com>, Brian Masney
 <bmasney@redhat.com>
Subject: RE: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
In-Reply-To: <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-10-eleanor.lin@realtek.com>
 <178947735404.448573.10061486937030065064.b4-reply@b4>
 <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
Date: Fri, 25 Sep 2026 11:14:15 +0200
Message-ID: <1jjyo98zh4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 23 sept. 2026 at 05:43, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=9B] <=
eleanor.lin@realtek.com> wrote:

> Hi Jerome,
>
>> > +
>> > +static const char * const clk_gpu_parents[] =3D {"pll_gpu", "clk_sys"=
};
>> > +static RTK_CLK_REGMAP_MUX(clk_gpu, clk_gpu_parents,
>> CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> > +                       0x28, 12, 0x1); static const char * const
>> > +clk_ve_parents[] =3D {"pll_vo", "clk_sysh", "pll_ve1", "pll_ve2"};
>> > +static RTK_CLK_REGMAP_MUX(clk_ve1, clk_ve_parents,
>> CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 0, 0x3); static
>> > +RTK_CLK_REGMAP_MUX(clk_ve2, clk_ve_parents, CLK_SET_RATE_PARENT |
>> CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 3, 0x3); static
>> > +RTK_CLK_REGMAP_MUX(clk_ve4, clk_ve_parents, CLK_SET_RATE_PARENT |
>> CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 6, 0x3); static
>> > +RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_misc, CLK_IS_CRITICAL, 0x50,
>> 0,
>> > +1); clk_en_pcie0, 0, 0x50, 2,
>> > +1); clk_en_gspi, 0, 0x50, 6, 1);
>> > +clk_en_iso_misc, 0, 0x50, 10,
>> > +1); clk_en_sds, 0, 0x50, 12, 1);
>> > +clk_en_hdmi, 0, 0x50, 14, 1);
>>=20
>> This is a lot of clock with no parents which is a bit suspicious especia=
lly for
>> gates.
>> What is really feeding those ?
>>=20
>
> In v15, we will do our best to reduce the number of gate clocks without a=
 parent.
>
> However, after discussing with our colleague, we confirmed that for some =
of
> these NO_PARENT gate clocks, their actual upstream clocks (like PLLs and
> Muxes) are located in separate, independent hardware subsystems. The regi=
sters
> controlling those upstream clocks are physically inaccessible from the Li=
nux
> CPU domain.

Control and input are different things. It feels like your DT (binding)
description is not complete as it stands which will eventually be a problem.

A clock with no input is something that does generate the clock by
itself, like an osciallator. Pretending it has no parent because you
don't know how describe it yet is wrong.

>
> Best Regards,
> Yu-Chun

--=20
Jerome
