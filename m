Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9D396D08
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431764; cv=pass; b=TJg/J6hEkZz4ECbG4RxW629QDTE2ArHrFjW/XZBmBQyp9P3QiwGBVRUSH7HEWzCy1FWWFbJz8Y2LO64f2xxUmuBuT9jH3sMK1yaMHtdNQceoTqi/moCmv1yFzJm6NUjqR99cqqZt1Dgqah0Gqxm+IzVdN1uX+3Zx+Gyy2tQNZ9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431764; c=relaxed/simple;
	bh=iB1MpeIq1U/rE6xcz0FTAu5KFzbYanQ/voAFz7+KWP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1wygOtprp/xqTioRuLpieH6WqDIT6VUs3qi7p4zptQANwaDfKmm9yLhCyvw8qknex8xOO+gSTzQa2dwO/ZENfwzhX6KdRvty5rhfWbMDCoq3G7J4HLzfVrbqzVPRTlmWZjsaOUymo6giT2qTufIDAaTNrxmqP+noSTd2HAHbqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ouup2Y++; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ouup2Y++"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fb14227cso23543395e9.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 02:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431761; cv=none;
        d=google.com; s=arc-20240605;
        b=UeLk6x1XpWkDBczJRJjhY8CTIODo3LRzWrExqOK3rBt6GyYUMrZLbqLiskKqihM3wf
         q51QqCe0y/XrGeZRmDaaI4bk9U6fagyNWqCXy8IVM48cEg2oV/JmFJCw86MiM5LOFYrO
         ymt0qLIZSMhp5jR4K5nB6oV1zsicpH3RBCTOqX3+qtFNFWSVPCrZwys4XEa9cJTtUgnQ
         O2XqLKPDj82ujFj3CRy8ViiXORBcLnComh6Tas6cYr1IGyp5Q4Enr1V3oyp1hxEpptFa
         1G5aDrmoYLAN+8rTMAForR6E10NEvHwednV/CM67o5a/vQINKqePViEubzFbP3wCGpcl
         NwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        fh=AyndUctxU7bIxCOXaQgIegOBcwzXsR5mFPMF6kUTVkU=;
        b=dE2msqi5dX8xPW7rcmN2ur/XjZUfP4MrDlRZYMEfHnGfHfT4upzBlIOMxIjLPMcVy4
         ZVUrw4O72cOr8v/Glc4+3mUs5Q5DxuI76vKjMQ6eW58P15E12KdmsbgRNDsQ3jMw2BnH
         sGLRFzUHAuwNv+Q8JVc7bmpBkqvgzPzVMKuUg6OAiDgeUcR3jvTvqcyFkANfE60FbsNH
         FxAY98f1W4QjDsi09vIxSuzDFSbIM9GZTkjK5YY1Pl6omPvFm6yx7gC2k+bDN+NeXuxe
         Smga+joPxj7vxWWzg3r9fNqTZd7FyeryM4AI5EV449NYmkPtaEs7OG/qNw882Zohpdw/
         0gDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431761; x=1775036561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        b=Ouup2Y++zGVJMKgkzqqkJVTiBroGJXZGaRx1oacMlnc1DUD+duQt4UkUtwnnheeGSz
         wNLmXJaRlfHDr9+3uPL33CUUkqyjYoZ7JJ14FH+SX7JocpFZ57nbknZe3tuKaxSmW+w3
         IlP4ysevRxc8K5ZsrjYA0n63ZaSKKGVW0okqOt4hVVxSFHsGmFiNRpGbPYE+RvB1fVDQ
         72/KCClSaQbWBB0II3difRnlxz8RX8g8tg3LzqynJ9CwnIbknADgVwLPT5vwiPGQuUpk
         vqTjNDeYJjjAncQ9E4KKEI7vfr1tB1hV4RM337KCEwdYanObrbNrZDHNKErcvlqVnyNw
         vN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431761; x=1775036561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        b=kJJhc7T7jw6hOROJasDvb7iBBH61y1cM/0rBfmsiRdHqhphJZhLZXxJCWomXrSPYBo
         7he0fGK9V5JPxp8cf5rC0WElE4ucyh2IpBCOrscUwuPKEqIFrvgTpJwuBXzc1xj0vwBI
         uHXoDIPUSjhkJREcD2UYyHT4owtA0c3ijfpvkj/e65Pj4LDJYxapp0jBCGmPXSKu4O7e
         hwZnx5Q9dtBjFR6tNOHbB7w5R+cAIQnKPshZpaufwDBf/wlA8UJYLO87vecgcQARCxu+
         aIkLUS1jUDEyHN7AweJH8ZYXOKkyQnhvjH9HpoRbXwncepep03XfhMJmnle5ZtKrtRuD
         5wCQ==
X-Forwarded-Encrypted: i=1; AJvYcCURiGXVlRJQjZQmazMm54kfs74z4Uqgq2q+0cupoA0IHyWFvK6TUstbul1f4Bp68gLMrPC1eTZfv5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5X0Pj7ykAGY3g1OLgVMNBHwLhNCWdG3nHGcT9gNSjlePGXxBn
	k8ND9Ff+sy8k0HkwaItRWyscgw0iMIA27DhorlFUL2yXTy8vzHJWfESSI/Mw1V+nPRtakI9EstF
	GaKwlKqhXK3+dcvNVLC4yLfdNZTPJt9s=
X-Gm-Gg: ATEYQzx0NoUReLtcmnQj+I9lqMSt43WWhctOJyzszKzbf9SZ8QLis3FJlsUn9DZJtKS
	vJXfsvMqRNBT93QRI4ZKimhwkD7XS3N9fIY0XZBxjLmo6zy7f0mLWNWDBZOTQ6FXUfMnEOpl9nI
	EKth+skic9SMDR5MwQ830eUsvw7mqzxC5xYpnUsgXWY21iyyDt+P0xxux5vTdUniF++j0cjNwJC
	aGuY1B8tH4dMyepmd+1bvTHK4IWfzggzailO1Woy4l8iF1FA2mo7frYd0uAgatSE+MSfkyJMOW9
	4Xqbp28BBcaZMEv5V9VkhbdTfkvSnIVmNR8dBHP93EvO1aD+sg+JlT4=
X-Received: by 2002:a05:600c:1394:b0:485:4388:348b with SMTP id
 5b1f17b1804b1-48715f0389dmr43148945e9.0.1774431760449; Wed, 25 Mar 2026
 02:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 09:42:14 +0000
X-Gm-Features: AQROBzAT47VIcwfqTpzGpASCq2Db9bAff5rSwNiFG5slkBrcAGVZoDPbA5Eb1t0
Message-ID: <CA+V-a8tDhStdSCkrvG7Bmrqci2CHscyd645B--XZaF_g4GsUuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 11:00=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 CA55
> cores and 1 CM33 core.
>
> While the user manual doesn't explicitly specify which cores
> should have access to particular watchdogs, it turns out that
> (similarly to the Renesas RZ/V2H(P)) it only makes sense for
> Linux to use WDT1.
>
> Remove DT nodes wdt{0,2,3} from the RZ/V2N SoC specific dtsi
> to make it compliant with the original design intent.
>
> This change is harmless as there are no users for the nodes
> being stripped out of this device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 30 ----------------------
>  1 file changed, 30 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g056.dtsi
> index 9192c5bf7e59..40525470194e 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -599,16 +599,6 @@ ostm7: timer@12c03000 {
>                         status =3D "disabled";
>                 };
>
> -               wdt0: watchdog@11c00400 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x11c00400 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4=
c>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x75>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
>                 wdt1: watchdog@14400000 {
>                         compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
>                         reg =3D <0 0x14400000 0 0x400>;
> @@ -619,26 +609,6 @@ wdt1: watchdog@14400000 {
>                         status =3D "disabled";
>                 };
>
> -               wdt2: watchdog@13000000 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x13000000 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x4f>, <&cpg CPG_MOD 0x5=
0>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x77>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
> -               wdt3: watchdog@13000400 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x13000400 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x51>, <&cpg CPG_MOD 0x5=
2>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x78>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
>                 rtc: rtc@11c00800 {
>                         compatible =3D "renesas,r9a09g056-rtca3", "renesa=
s,rz-rtca3";
>                         reg =3D <0 0x11c00800 0 0x400>;
> --
> 2.43.0
>
>
