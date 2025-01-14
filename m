Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4097E22962E
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736853927; cv=none; b=FTrFOPfYmlQY95O769fsLwq0pCKPNlB1fetkKLHovhvG8tHSWhW5+Fc1+QuIIagicxdNpJAoTr8SFUfKxYB57nXRLsb2J8V8AfYeV+pyjgCRgVOAW6HQXnztQBy9l0trMrEXhHIEj5Kcw67tizOq73snPafNnmeM1BXbDhB/rAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736853927; c=relaxed/simple;
	bh=hJ+djB3d/zAzbtQIrH3vQ1RhorhbA7PXwlkOtnRzC24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFmCwsoL4muNRUH2rI7oJbRs4EdwrRIjEhflGHWL5eeFhe9GYWkn/7OVz5FWdJBBS8X25WTm4kvh6jUC4Plg5aCsS2AYazIUZaD5w57dYfiJPBHR3JyzW9D5o5JxlmiHaNwCM9erUADH2rWMheUzrUDFqYqSpphpKrNoRDlm4jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Hai0nwT8; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Hai0nwT8"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e3983f8ff40so7747777276.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 03:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736853925; x=1737458725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNeWxGrE8uIS0WDqmIGcYolBV0o+ZDhi6egQ4fiiws8=;
        b=Hai0nwT8lbb/tSW2tqWGbJerhP2ItnHL7ClWxAQ4RS7bFHlQ4xSMKgHHJg3g7pUNPW
         2mxBFNzi8TPt18cknmoPV7iiPMuML+7n79fzb/NpWwOHdOEM1yLbURAEr5lR/uqMaeo3
         9OhZgbtKeyoEB9obeVdeO4yQ7sLF7Vw+xg4Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853925; x=1737458725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNeWxGrE8uIS0WDqmIGcYolBV0o+ZDhi6egQ4fiiws8=;
        b=FmGERJgnFflzOsZ4f5uCSytqqkzywdMyzB4WiafuQe0WFywFwQLCt/Np9TyMLjTSuS
         QWZ1BTKwUyeOuiO4wTWRlPPaaYHqQMlgrybROJgSBlnfr5fYffHWv/qImPzthkzrv93q
         18HMeyz3wlgKilMpQgUuI9+fwfMUkp0UT7MsrC4Jaf1RFPmMcIp+MhUgU27gjQAc0wR7
         W/3NNSRHmkMi2n7cNfYhFjN0+lpNSQBOdCsHgf0B/htnurmQrkvpUVgyqNW3zaE9h9yT
         DAd5AGVbpV3ozOo+X0E4t7wZ8uUbLPOCOrPMZNMIkXq8Av+2d7V+gAwLzR5WfqaUS+gg
         RKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX+FoZ81zjCju4dDVM0M1hhcrBE2vUkSaa+VpO9RpPVafarOokiDJGkx+TAmpThHlB1Y2T85hyqN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeueUKRJju12vSMBK3xc8Ju/k8I7WBeO2ARslntH6ZLvBI2YzU
	A366L3/fVSTuU69nmjP2HT+yMQ9F8J5X3agQ+JKjTuI4S2FJwT2iGT7w3IEJVPMoPE+OHLMy8LY
	F08tjrpmKkLYqsLKUJiZrr8ZSduH+O2+lCJIH1A==
X-Gm-Gg: ASbGnctH51iA9ApaGpMwKsPCegPzyduz0zctQDmTGDs/FQPLpGbf3LyuRYEfycU3ryQ
	lYZjAmdPBwTC4AG158ElsjG38D7igpdTvj9a7
X-Google-Smtp-Source: AGHT+IE5ADFy4Rcdxdx8eIWS6qutMEezXMUhyeb5SIbQjo2wdqwdsiAVueYpuLW3T5twpKf4mq41MGduOKyevWn0ZOQ=
X-Received: by 2002:a05:6902:988:b0:e57:3a77:99b6 with SMTP id
 3f1490d57ef6-e573a779d1bmr8361818276.19.1736853925209; Tue, 14 Jan 2025
 03:25:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org> <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org> <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
 <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
In-Reply-To: <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 12:25:14 +0100
X-Gm-Features: AbW1kvaNobnTd2MQAHzRF4uGLRR152GowylzO20cIOWKbfYsbQamDcVMjctIi7w
Message-ID: <CABGWkvpGGdjJVTHppOohGPq3yi_Y20t9b0WWkPOriFU9=CHQMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 11:13=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/01/2025 11:00, Dario Binacchi wrote:
> > On Tue, Jan 14, 2025 at 10:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 14/01/2025 10:36, Dario Binacchi wrote:
> >>>> Nothing improved here.
> >>>
> >>> In my humble opinion, there is nothing to improve. Any modification
> >>> made causes the tests to fail.
> >>>
> >>> $ git grep st,stm32f746-rcc arch/
> >>> arch/arm/boot/dts/st/stm32f746.dtsi:                    compatible =
=3D
> >>> "st,stm32f746-rcc", "st,stm32-rcc";
> >>> arch/arm/boot/dts/st/stm32f769-disco.dts:       compatible =3D
> >>> "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
> >>>
> >>> Or am I missing something?
> >>
> >> How can I know what you are missing if you do not show the code?
> >
> > Sorry, but I still can't understand. I run multiple tests, trying to
>
> You don't understand that I cannot improve your code if I do not see the
> code? So let me rephrase: In order to tell what is wrong with some sort
> of code, I need to see it. I cannot tell what is wrong with code without
> seeing it.

You told me that this code was not exactly correct for the parts
marked with *********:

properties:
  compatible:
    oneOf:
      - items:
          - const: st,stm32f42xx-rcc
          - const: st,stm32-rcc
      - items:
          - enum:
              - st,stm32f469-rcc
          - const: st,stm32f42xx-rcc
          - const: st,stm32-rcc
      - items:
          - const: st,stm32f746-rcc ********
          - const: st,stm32-rcc
      - items:
          - enum:
              - st,stm32f769-rcc
          - const: st,stm32f746-rcc
          - const: st,stm32-rcc
      - items:
          - const: st,stm32h743-rcc *********
          - const: st,stm32-rcc

I haven't found a way to make changes to those elements without causing the
tests to fail. Could you kindly provide more explicit guidance on the kind =
of
modification you're expecting?

Thanks and regards,
Dario

>
> > modify things
> > based on what I understood of your suggestions, but the tests failed
> > every time.
> >
> > Could you kindly provide an example of what you'd like me to do?
> Any qcom binding? Any other SoC binding with multiple devices?
>
> Best regards,
> Krzysztof
--

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
