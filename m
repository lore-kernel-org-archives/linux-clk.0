Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702094204B
	for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 20:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727640042; cv=none; b=tbRBTkijcoA1CY3iNQ4qEKnLUATLeZQavMF3EZyGBL/nOq26fpeD9HdxScy9gIt1EqVqPkf3i4lLzZC0EbSrHqaU8WmhV0BNUMlrlBt4/D84+m4LQrKExQdxsBxBtkkM5l0f/k0ow6OUUbJCu4bFD7AnRRwas783fXvoxfkNXmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727640042; c=relaxed/simple;
	bh=C+HE48UOVNh3S8JegzOeS1KV251zvl3uafKiq4ay2XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mma9XUaWKnUuGgdl9Jw/gWTx/WU6MYAQfij846cK4q0EAgEVKI2/rDnROiJj0YKJsTMj1yBAeNgF3NG83Yx6NYMJ8K5TubdDmdxE3W9IiUPi7dIzYj3CjE7qcr/Qwju+ulNLqIL+O2baYaWBLkJo5IMr5fQ3XjglBZHWvib3tEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nZT54Qu6; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nZT54Qu6"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e1f48e7c18so30966827b3.3
        for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 13:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727640038; x=1728244838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THVSoogwNns4Otfo36VQb2ocrUo2155C0xuop1kKVhc=;
        b=nZT54Qu6xaErcF99YP+U9KayN5bVBE45YeMalKC0Hb/cxsUC8k7majIS86BSpwv1Tg
         3hW7X0xB/JXn8Wzg2iF2IGvaBzUoreCUq6UAka6nifxlR0yJgCik1vrLIUi/O7kmdYJh
         fvKDPRY5VNqHmsCcjdysoMDLDEYXpq/edrZSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727640038; x=1728244838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THVSoogwNns4Otfo36VQb2ocrUo2155C0xuop1kKVhc=;
        b=rej0M7buBQf57RKXTKVT5hfuhwQTQ9WZmcd5SX7NdeeeLJ7HUz6R8EcR1hBDZHaveV
         mVXOt996sMz3VJ6XIy0vBW7/RicCdbENthx7WUpus0k0Bde1bqbLhBE4GdtKD+zhNeHB
         T7pZmCHRtoLIWCFA8dv/Q0ie6U4dR4+FqUWt7QCPaAMZj2LS1JfdWpOE901Tow2l0xXk
         6/Wo9vSvzCvZoObHuB1SLHYM0j6fZSJq+pOvlX7o5lRKNRuYkQblB2GqSypUjlnc/dMN
         0GHpnq4HuWyA28+fqhhpbUKR+LOWfCUa3IlYDIpb26e6z6NHu5c6k/Nokj3a708yxAmL
         8U1w==
X-Forwarded-Encrypted: i=1; AJvYcCXna2iFFBLsz0c/uJHmR7Zi0RdXM38/HKwF9OnUNIEhWs/DE0fp4eHypk0kM9x/4ty/BA+t9tNewaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTi2LB2AYlNzmMYKEBxhHdDlII6PUiB2y6lrPxHQTFuOfcsy3
	6Qi6LIgFi99+jFJ0xTSgzFa0Jfu7nsJIbs1GZmH0IpCt5BXA1DYxxEOqinp8d7/T6NVBykpRGaN
	Sdqm3cmbSDIBMgImk+948YS+JuSqZMJDD6xUnUssCiPLLpZfLjI/roA==
X-Google-Smtp-Source: AGHT+IHIOE3+c2mX/UsbrIe1XO7FQZ+whU+SXEoKWNXBu9Vk5hhOQ7qtm4cjBU4dpR9jmUzCwLswFX+y7Pi2oOlEcv8=
X-Received: by 2002:a05:690c:4488:b0:6db:2604:ea6b with SMTP id
 00721157ae682-6e24759414bmr55679827b3.25.1727640038489; Sun, 29 Sep 2024
 13:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
 <20240928083804.1073942-2-dario.binacchi@amarulasolutions.com> <566859c1-a397-4465-987e-0682b07a703e@kernel.org>
In-Reply-To: <566859c1-a397-4465-987e-0682b07a703e@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 29 Sep 2024 22:00:27 +0200
Message-ID: <CABGWkvqqg-PGAZTCz=MMLRx5F93jaN_=z8zJt1sDd3PHXd80PQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m-anatop: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2024 at 2:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/09/2024 10:37, Dario Binacchi wrote:
> > The patch adds the DT bindings for enabling and tuning spread spectrum
> > clocking generation.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../bindings/clock/fsl,imx8m-anatop.yaml      | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.y=
aml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> > index bbd22e95b319..c91eb4229ed3 100644
> > --- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> > +++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> > @@ -32,6 +32,47 @@ properties:
> >
> >    '#clock-cells':
> >      const: 1
> > +if:
>
> This should be allOf: and placed after required: block, like in example
> schema.
>
>
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - fsl,imx8mm-anatop
> > +
> > +then:
> > +  properties:
> > +    fsl,ssc-clocks:
>
> Nope. Properties must be defined in top-level.
>
> > +      $ref: /schemas/types.yaml#/definitions/phandle-array
> > +      description:
> > +        The phandles to the PLLs with spread spectrum clock generation
> > +        hardware capability.
>
> These should be clocks.

Sorry, but I can't understand what you're asking me.
Could you kindly explain it to me in more detail?

>
> > +      maxItems: 4
> > +
> > +    fsl,ssc-modfreq-hz:
> > +      $ref: /schemas/types.yaml#/definitions/uint32-array
>
> This should fail. I don't think you tested this patch.

I executed the command

make dt_binding_check DT_SCHEMA_FILES=3Dfsl,imx8m-anatop.yaml

and it did not raise any errors.

Thanks and regards,
Dario

>
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pr=
operty-units.yaml
>
> > +      description:
> > +        The values of modulation frequency (Hz unit) of spread spectru=
m
> > +        clocking for each PLL.
> > +      maxItems: 4
> > +
> > +    fsl,ssc-modrate-percent:
>
> Same problems
>
>
>
> Best regards,
> Krzysztof
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
