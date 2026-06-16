Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8763FC5A1
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781596316; cv=none; b=QWEJq7v+FRDvNEFjJEmkmJt2nIN4XKe/xytho45tU1f4qjrM/HUnX3N6Qf+rb797dB1UFdcbwRVU3ZGtICo4p694eXeh954SXBs1RZVRdokdY53Ul9DQVHbDMTYiLZ98Sg31iEKMAPheCkQ5N1Fuqf6WDsOmw+UkT1Xc7swloC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781596316; c=relaxed/simple;
	bh=l0OjWrZ0BE9WcD5kr2mtCjZUpgtvkrbCT2yX0mivnT4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DbPCGc5r/8lEMsvG856PMgJCXiFNQ90KfQHHVu3aRcUr0lT8xBLSH9bB9xg6YMukIB4UU/g4itfkldSzPmVTTmPsHJlqgOA0UWW2cUJUqa2W08489EtozDYFPWahrKSx2gw6w7ueg241ulLyhD/Mj64+CptSO4xFpkJq4bOtgIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MX6tdVmp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MX6tdVmp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490a76757e5so30211785e9.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781596313; x=1782201113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0OjWrZ0BE9WcD5kr2mtCjZUpgtvkrbCT2yX0mivnT4=;
        b=MX6tdVmpfvfHF038X9q5VyKHo6NP5nUDqlpy5drhNtytzeOXvUuSk8VYlaITP6WM4f
         m/4uuQWTs+4Ui8Vv2Mv0o7KDbNzIxjzjWdbUmDXRdf6OuYVBlqZlGyuq6rQSPPpqlTN7
         NiNXiqnyaFLSmKDRcDZdDBlS7iMM9VRNu86DeHnHiRUIYqnZ+dzEQipdpBHba1wvSVPU
         ikd8XAflbtBbto197u9imgioU8NNd/SxDFuerf4jr7fvwJdP8FdPbwaMOGdJuPJJy2U1
         vCeEw3cVLBnylJlxwZsVoBDDWZ4FEeLaGUwyIfxuyBdJMUsmKfm5EzzY/O+oWA7kn7bI
         iSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596313; x=1782201113;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0OjWrZ0BE9WcD5kr2mtCjZUpgtvkrbCT2yX0mivnT4=;
        b=YW9sPz3fyAF706KEaz4/ymNtWFNgp2QfgGD9LG49jzOm50cnEZo3KG/T6c0iL2RuDi
         CwSJKvirXOUt7XaRRND+GmVqZwFOCcUNIIMZ+DQ4dsEHpXSX51tCe1GqZ1VibvNpWGlJ
         cnfy40Jx4/njr5HvuCxSDNrZK1MzJH6XQYC7ZNVS8fvHKSQmeUwtrt92KSbr82PIddUa
         eP92ZPWGXww3qs67+oESeXT99zLOZdapz56oF1BQ0WL5LqQaIBttiVBIJ06SclWViaIu
         wGwv7vNO2Lh4Y6JStvRX5TRCmiqU/RqtUIPXG2wNuWJ3FH5QdXZVUeR731mtW35ViB33
         d/qQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QFXR3RwvGkcdUurzihweMUZhS2X9Q/vlvA2iJF2TNUWqY/k1S1JhO6LgCd8buJdwvXxuwGmCBib4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+d6rrzsZkf8xadFhxe7YcvD50NyhdPasK+ygqFtwl/uf81yS
	eREEtnTUbkeGGEHnqRMy8eJKqUS/f0UuSKy2Gqj+Ue1XuJKSiT0BrQxjKfyjCwN7C6Q=
X-Gm-Gg: Acq92OHeRpoAPmPInbKw4L2lm8X0NgO0AKGGBKxrQaPXcJ65BWdCqTZ5yg+0fv9h5M7
	1ZidbG9yIdLaf4rXbaG8Zl6LlNSULDO1PLaz5f9nhpifV34LEp3O/JYIE718jqnbxhqGsFZZrov
	Gy1udIHi5atfMC4ZK5pssVFdjr2btSp18Atev1i67ZPfRM8GwXblyAt4WqgxNrFrqu7wdWURxhr
	JB62rxMYoqfkmDxjT6uWmlvbQWFmi4ZJCsi4a2K6L/7TjaeLLIuTQtV3wORWfwSr6H5RG0yQw6b
	y/GOdUQTQ81SOijQan7KHAHRVpSgjkBxdLb6zBpSkyUCVFAHd1oJ6bdv197+fgfcJMU3ax14Ksr
	oGg8rS9af6JqQWGVFLxfysjT/0G0AwIRDBqQfnFHm9ADHNhCWkxjcD1xd3VhhSCxUHmoah0qvss
	NkceTbMVfF4HepTVmlebMubg==
X-Received: by 2002:a05:600c:e547:20b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-49220061ff2mr123752675e9.12.1781596313269;
        Tue, 16 Jun 2026 00:51:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9756:c1bb:8271:9937])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49230a8ebe3sm30950255e9.11.2026.06.16.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:51:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
In-Reply-To: <5601fe65-777b-4db0-a6e5-8d2cdcde7e53@amlogic.com> (Jian Hu's
	message of "Tue, 16 Jun 2026 14:12:20 +0800")
References: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
	<20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
	<1jecieftme.fsf@starbuckisacylon.baylibre.com>
	<bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com>
	<1j7bo0dm0z.fsf@starbuckisacylon.baylibre.com>
	<5601fe65-777b-4db0-a6e5-8d2cdcde7e53@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 16 Jun 2026 09:51:50 +0200
Message-ID: <1jpl1qdisp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mar. 16 juin 2026 at 14:12, Jian Hu <jian.hu@amlogic.com> wrote:


>>>
>>> If you think splitting it further into separate helper macros would imp=
rove
>>> readability.
>> One clock per macro please. Hidding 2 declaration is recipe for
>> disaster. For ex, here the first one is static, the 2nd is not
>
>
> I'll split it into separate helper macros so that each macro expands to a
> single clock definition.
>
> They are defined as follows: (Excluding struct clk_regmap)
>
> #define A9_VCLK_GATE(_name, _reg, _bit,=C2=A0 _parent) =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &(struct clk_regmap_gate_data){ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D _reg,=
 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bit_idx =3D _bit=
, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hw.init =3D &(struct clk_init_data) { =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D #_name =
"_en", =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =3D &clk_reg=
map_gate_ops, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent_hws =3D (=
const struct clk_hw *[]) { _parent },=C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_parents =3D =
1, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D CLK_SE=
T_RATE_PARENT, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>
> #define A9_VCLK_DIV(_name, _reg, _div) =C2=A0 =C2=A0 =C2=A0 \
>
> =C2=A0 =C2=A0 ....
>
> static struct clk_regmap a9_vclk_div2_en =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 A9_VCLK_GATE(vclk_div2, VID_CLK_CTRL, 1, &a9_=
vclk.hw),
> };
>
>
> static struct clk_regmap a9_vclk_div2 =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 A9_VCLK_DIV(vclk_div2, VID_CLK_CTRL, 2),
> };
>
> My understanding is that you would prefer helper macros to cover only the
> repeated initializer fields,
> while keeping the actual clock declarations explicit.

I do not have a definitive preference over this but I do want things to be
consistent, at least within the driver, globaly whenever possible.

Look at the other macros you have already defined in your driver and do
the same thing, including the way you declare the variable. Apart from
this, it seems fine.

>
> If that's not what you had in mind, please let me know.
>>> I can do that as well.
>>>

--=20
Jerome
