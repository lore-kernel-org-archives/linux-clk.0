Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE403EFD0E
	for <linux-clk@vger.kernel.org>; Thu,  5 Feb 2026 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301923; cv=pass; b=r7UQw9bHdv3Ocq0pVBO2UMggL5wz7BF94noHj1i9x4bS7d/nBgBkQCOWSZOu994S2hU+oeOCnnoZCnAX2RuIVJNWXd3SI0d0+b2wRUIFOTRDB3lISWu8+F/K/hjri1hRlaFWSbosj+x+7eBb6nVkmM4z9+tl6SULKUMDSa6357w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301923; c=relaxed/simple;
	bh=xdjm0+lBWRkwngNnNQxKBDMh0sZIVrv9rCYoWstx89c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUlcP29/IaLs89scQKV0t5t8piErolXPREe6O2Jm/tdbehbpWl7O0eNAyKOiyGDi0OCHSr1ICNZNlLAgTa45H2k35cTW2tG3PfqhTKrPt4x/slDPC8dR7Y06ZKt65TnisQ1CK5oBbEXvyIcn1GYU1oHSn4ISZxEIbevnXFIfAl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=g82gX6sG; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="g82gX6sG"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64965ee303dso1108062d50.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 06:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770301922; cv=none;
        d=google.com; s=arc-20240605;
        b=i1qhAxEo8WJDnoqWwPjU+ep8rqIblEtzCCw6cgKrlI9tgR994EHdHVBfD22c5wTg6n
         33KllZ9G0QW7PijPW2ued/bku5pNULbrAzqdcHdkM6p0az3IhFHFmQnU2dB69OgHluuX
         MrkucrXAPQSvf5KNiuB8V1wzyjEZk8yyoOcdqrDNgo1ZR9EAiYPMdoKbo48LSPqVl5Nm
         8ZFo0lptM0/q7dzBDTCkZQ2tb0dKBOl8rMTo7RkABzPHrEKzk1qptri7go2aYK3bZWz5
         KUj0NkDvo5r9kzek/BDReZLl9RTKfVa8lah93x051h1vsViCxUTK/5J4gFJUT+KQ8KNM
         DjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5mMNeV59BxNuCmPNiqNLJdD8q5E/v+np7SsY+Ptj4Y=;
        fh=8bbRkIfpqsqoFq8PbBVY+SWpzlX6+GxDDu951YcpYNs=;
        b=B+WT7tMii+UY1xvhAjLAYW2jcen54301X5a731xVyaXjZQsH/WFI71tBfKopt+hFtJ
         RHk/xgziZPBW3aalr/AhajQ9raOKCEajydRsY33V98T9UtKELmCEaAvCFE8e00EQU7AR
         BKbJZMV8G5TLXYCOmv3fmXKRBbwwfCz08oer8le+2FiQZ98NGyHJdDR437JKXSQMrQE5
         RjQ89bU82hCY+XUhrjuYndwz6dlaxt13gGO+87SmwiOt/nRtjwBP4W1MzWNSDXAPlQNn
         hxUQXaR9gOJPzmqV/58KMsYH3gBAyvl9KHtUOzDGiQzGtU710OJqtXTaE/QJy5wOlnSM
         6eKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770301922; x=1770906722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5mMNeV59BxNuCmPNiqNLJdD8q5E/v+np7SsY+Ptj4Y=;
        b=g82gX6sG1xHwWYn+xlsR4ajirWsEg8VBcGrMAMd3zS923ZYrL+BWmHhEKDHzTYDtJB
         46Gk988JChlHKQ2A8EOA4r2eS9B0I4KJBAAJg7k/JqP2I1B/NGHL24qwXpe3fZVse7NI
         ETiEEGV/evo+kDk3uFs1FeIDlOU1zYlx0Oerfwl7GnFDVpuKVLfRGC1oPs63cmROAS9G
         pl52VnM752D99pD8T9lwOUkRDd1IKay8tOgTCKjO0H4cH4w3pjIFiyKQQjZOWkkQjxCP
         vd15AALs7loVqXs+CEPI70YkgVdjOiU+pcUn7GvfQBw+qiBQMFWwhoMjPo5+BizB+8Nb
         oaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770301922; x=1770906722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5mMNeV59BxNuCmPNiqNLJdD8q5E/v+np7SsY+Ptj4Y=;
        b=xNQ8xkO7umCcxUVW7wJJJM6CfD/NYxvYXDRmIg7kPybrjJCMnEcFe6CtqGt66VGJr4
         JrJz0/Hh49Gbq9I4sX/YfJb9vreZMMZ2IJdnhAFxlvzVvhb9dNqYiQ2KjjPqceuP0OSx
         SvocWbr7efaxQUnaC3m0JydBoA8iAlG7yTjY6t5TG7Y4sS+wnxvfXq+74XBgDcvlV9T8
         tUAbmOpTwt8OJSS7puhYD1QqVHoCB0mwfsb+JJ+5LbGQFmcfIYGN87LMQlMzZH/3CsZ4
         a+wLsZ6MjuR3XNoea4XyZH9qmbpKdOcmlyoen3IslHn0aUqlVW85R4OpH4+dyrfwVJnK
         9sJg==
X-Forwarded-Encrypted: i=1; AJvYcCUNReSIx+3Vwuds37W9RPy27urAoHG8teBffzWtC/ViaK6RJ30GQKsNMAH05ksL8GQ+uG4ISGu0rcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1GMg0+IrEGpFKcFwfhrxaRPYAXQiroLNCshMeBmpbftlUe8q
	LsVijAXJQh87sZr5O99xn14Sa5uOHvl+ju0Pl0D2Y51LgBhH6xgq/zLWRHcu2v7VWDIcBTVmFka
	H/2JU1OAze/GKw7F198dbqKDWIHweq2tzuw8sBKz+zg==
X-Gm-Gg: AZuq6aItfv4V0Y7tkLTWNgX4tgKD+E99mh61BT0HufMNoQ05JbBOczCKWmYBVp9ZO+3
	mxS0M+tPeCEJu00S9kObGhXQ5ciK4z30MU/RD6Mm7S1FfHcu56lzsCqV3JLuRmadDr7kZg5r5aA
	YF8r3ck/ynZ+zJ6sS5XFndRUZXSSMOn2wlwGIOlqT0FTR+Fr3Z/46AY56HPOf2sdO1cUwvn4vYo
	xOkBFOZJUWpSb9Se2wB5NLwIbmVQzTC8BPTI43puQMB5SpgICMLyR4djc1OW1w1DfRw1mkGWsdK
	hRJC32+SwTROtPg1LIRtV8+N373PaZntlfUwtd6HU5hhXPcTC0OAUJGFA0YyIo080kpot98=
X-Received: by 2002:a05:690e:e88:b0:649:e501:21b2 with SMTP id
 956f58d0204a3-649e501241cmr3675188d50.12.1770301921673; Thu, 05 Feb 2026
 06:32:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com> <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
In-Reply-To: <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 5 Feb 2026 08:31:50 -0600
X-Gm-Features: AZwV_Qh-ae-dWwwvtEXuKahrL02iNou0eQ7ZulAZRSirBJyrvo1tifhCxLYVs9s
Message-ID: <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Feb 5, 2026 at 3:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Mon, Feb 02, 2026 at 01:46:49PM -0600, Anirudh Srinivasan wrote:
> > Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> > and resets. This block is instantiated multiple times in the SoC.
> > This commit documents the clocks from the RCPU PRCM block.
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  54 +++++++++++
> >  MAINTAINERS                                        |   2 +
> >  .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++=
++++++++
> >  3 files changed, 159 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlant=
is-prcm.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis=
-prcm.yaml
> > new file mode 100644
> > index 000000000000..0f3e18f5ea1a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm=
.yaml
>
> Still wrong name. Look how is your compatible called.

>
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/tenstorrent,atlantis-prcm.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Tenstorrent Atlantis PRCM (Power, Reset, Clock Management) Modu=
le
> > +
> > +maintainers:
> > +  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > +
> > +description:
> > +  Multifunctional register block found in Tenstorrent Atlantis SoC who=
se main
> > +  function is to control clocks and resets. This block is instantiated=
 multiple
> > +  times in the SoC, each block controls clock and resets for a differe=
nt
> > +  subsystem. RCPU prcm serves low speed IO interfaces.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - tenstorrent,atlantis-prcm-rcpu
>
> Nothing in the changelog explained why 2 other compatibles were dropped.

I have mentioned in the changelog in the cover letter that these will
be added back when the driver for them is added (based on my
discussion with Conor).

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +    description:
> > +      See <dt-bindings/clock/tenstorrent,atlantis-prcm.h> for valid in=
dices.
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - "#clock-cells"
> > +  - "#reset-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    clock-controller@a8000000 {
> > +      compatible =3D "tenstorrent,atlantis-prcm-rcpu";
> > +      reg =3D <0xa8000000 0x10000>;
> > +      clocks =3D <&osc_24m>;
> > +      #clock-cells =3D <1>;
> > +      #reset-cells =3D <1>;
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index dc731d37c8fe..0fc7bc6d0458 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22534,8 +22534,10 @@ M:   Joel Stanley <jms@oss.tenstorrent.com>
> >  L:   linux-riscv@lists.infradead.org
> >  S:   Maintained
> >  T:   git https://github.com/tenstorrent/linux.git
> > +F:   Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm=
.yaml
> >  F:   Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> >  F:   arch/riscv/boot/dts/tenstorrent/
> > +F:   include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> >
> >  RISC-V THEAD SoC SUPPORT
> >  M:   Drew Fustini <fustini@kernel.org>
> > diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h b/in=
clude/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> > new file mode 100644
> > index 000000000000..3820781127c3
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
>
> Still wrong name... Look at your compatible.
>
> Please read writing bindings doc in DT dir.

We will have multiple compatibles in the future (I dropped these in
this version and I have mentioned this in the changelog in the cover
letter) named "tenstorrent,atlantis-prcm-xyz". The bindings document
suggests picking a more generic name in this case, so isn't
"tenstorrent,atlantis-prcm" okay for that?

>
> Best regards,
> Krzysztof
>
