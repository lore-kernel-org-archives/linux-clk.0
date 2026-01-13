Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7189C387344
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768297569; cv=none; b=mLEsE/lhlMcwrelMKEUmGlIFyq5LrMHhtT3xY7SDRzdG/L0TTVWJ8pxneJgGkk25n57Uckea4Ffw7wYosqCxQ5JgfnZflQ7064eSdtJR29Bl0sPhLIKNML24jRKP5/WVcRLL8nv/F3Ikk4QbwAMNNL7EJYsPpvjwNaoEPELQVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768297569; c=relaxed/simple;
	bh=k/v2sHmLKvt5TKVX3IuC/AqiQrd5G3slPmFrDNQcw10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7y7VBp/TUIKzvpqaZL4VKg1h3UlqEtAw1w2R9QS3tKyzSNtBfNWgk1wgDI1P15lewEGWvzPFVMZYzRff6NfuLm/MOJ3xryFyq5QTB6HrzeSx42K82YQg/oTHVgGwm32Q2hxbOKwXjTxMR+nO+x4PXhO5WL4n3ABN/R/LAqmoJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahYk/0Ig; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahYk/0Ig"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so11911490a12.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768297566; x=1768902366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOUzZNLG++BOpSvrwpgxq2EsKiP34h5YqbSCpa3qsnM=;
        b=ahYk/0IgSAMyHpVho+k73SeV7tSAND0WyGgqTw63lH8IKXqOcC0S4DhPTdaDuX/goK
         b8fhLiMd+GMEqj0NORQ7f5NjE0n4IOmfpOb9sgMb0FqbnwAS5fJQAg7NO2KeHlBJJy2Q
         w+yIyE1Jd4IM21juKkvHgMe/GBYaN8f/YqUW5nraBIj7/KUfmv0bKHsLKO9jgtqtm64Q
         VmwpZcSH0e2ED4chpak7C//DNlR9s6jBEnFMA+ghdGuInRlis9ld1QcG3R1WWm/OaTCz
         IAT32/RLRSzJc4cs6KlfjJuAMZJqP4k0QAF112n2gA29B8wTzc8P03VGsGjsoJ5G1QRX
         8GRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768297566; x=1768902366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOUzZNLG++BOpSvrwpgxq2EsKiP34h5YqbSCpa3qsnM=;
        b=o9BRUrgYm4c3d67u5UrWgB0sfgiF71YlK9znPQ4Jr+bJBiLKAtRfiZ6GYrK67PhGlU
         sIjGX4G0gc2JHBdzwbP1L9fNnpctd2ko5F8/QBLrmNnbQulw7j5FCIKXq3ZSTy/S1XwM
         aZc0pCvCBK9VVjbVElWEY4o4aIgWhqzZM2qk1sC4+Qy6uHCMqMS5C1V1pb3L9GBNLgMp
         1lwz6+u61IyjJQ7vO/qg1k82fsWo+kI1cACPiZtvNZcYfq5qnpKNBXr0vj0/91dxcOgB
         p35esqVDH9lis20z7c70wIRZ0OUI5phcj/mV9agtFEMMpjP/GLrlzFki+5RZSJyYy/QW
         qpwA==
X-Forwarded-Encrypted: i=1; AJvYcCXkETv4Tzzj2BPVIbLG7m6NPnWIZKXZRjQeXHhYzHoVpl5yz3D/zkvDTq0zvOll406LPA7IsdZqGmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOOZOOQ0VtE3rNTuMLSSl6uFmBhL/mNX0oQqD8dinCrDbaO1sA
	BcrnwLiHUUXVFaxxLLuAKxv7g54jvBpEWDbW7jiwrPRdebHrpUD59HJCExkpbmCHwcIqfb79NUe
	yi001LLF+/TBon3SC3IUvs3f/0qZ8S09fermXqruCbA==
X-Gm-Gg: AY/fxX7N01fO5FZrQ8xr8HG1vp+nqQOOQ0ja5DBRl7E7pVrc7N2j1Kn1y+nPqrM74Od
	+JK6GlMAA2dTZy4nyFZf/VmojA3MBdtYttCO/99J2vEOSyzoLwnFYUOC/cDNM4SSRJq4bd2KSVU
	A/57alLL9x71J7fDOVkmm3q7wy6K7yj+jXxfjRhQ3ZcmOz4fTC21yCxiGjtit8bkNdujskEaqEp
	U9chxZ+c8otl9GLEIB0YLGWvpbdc79FylEcyjIQ1evkUAncP9yjiqS2a7roCxeLx9t4HQ+u4wp+
	eT1yz2YUcN1QJh5D72yvwx/Hf0y8
X-Google-Smtp-Source: AGHT+IE4ppyO6TNCEJ1MRxCWBiqYIPJmnwgMy07s6owsGKz/BEfqAuqNb/3sIyiNm3JkP0ej35Yf3DJuBcAcOZOJhOg=
X-Received: by 2002:a05:6402:1469:b0:641:8a92:9334 with SMTP id
 4fb4d7f45d1cf-65097dceb25mr19588758a12.6.1768297565698; Tue, 13 Jan 2026
 01:46:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-2-bd00903fdeb9@linaro.org> <0076e60fb5a4d3a6970d93b4768d4f083baa7a83.camel@linaro.org>
In-Reply-To: <0076e60fb5a4d3a6970d93b4768d4f083baa7a83.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 09:45:54 +0000
X-Gm-Features: AZwV_QhpR9BCCbo7U_TZArIDQIupa5HO8DwIuO1eb58xNI24g4aNmHsPIkfpRwA
Message-ID: <CADrjBPqUv7o+9Tc2buDcLtwCocNdwy=gXz+hBqXC0EGsoMq4Pw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 12 Jan 2026 at 14:32, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > Add dt schema documentation and clock IDs for the Display Process Unit
> > (DPU) clock management unit (CMU). This CMU feeds IPs such as image sca=
ler,
> > enhancer and compressor.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v2
> >  - alphanumeric placement (Krzysztof)
> > ---
> >  .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
> >  include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++=
++++++++
> >  2 files changed, 55 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock=
.yaml b/Documentation/devicetree/bindings/clock/google,gs101-
> > clock.yaml
> > index a8176687bb773ae90800b9c256bcccebfdef2e49..00620ab1872db0489dce182=
3ab500c0062b651f0 100644
> > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > @@ -28,6 +28,7 @@ properties:
> >    compatible:
> >      enum:
> >        - google,gs101-cmu-apm
> > +      - google,gs101-cmu-dpu
> >        - google,gs101-cmu-hsi0
> >        - google,gs101-cmu-hsi2
> >        - google,gs101-cmu-misc
> > @@ -82,6 +83,24 @@ allOf:
> >            items:
> >              - const: oscclk
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: google,gs101-cmu-dpu
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (24.576 MHz)
> > +            - description: DPU bus clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: bus
> > +
> >    - if:
> >        properties:
> >          compatible:
> > diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bind=
ings/clock/google,gs101.h
> > index 442f9e9037dc33198a1cee20af62fc70bbd96605..4ee46503663c1f8d9463536=
c347de5d991474145 100644
> > --- a/include/dt-bindings/clock/google,gs101.h
> > +++ b/include/dt-bindings/clock/google,gs101.h
> > @@ -634,4 +634,40 @@
> >  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK              45
> >  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK           46
> >
> > +/* CMU_DPU */
>
> Maybe add this block before hsi0 and after apm to keep alphabetic orderin=
g
> of CMU blocks in this file.

Thanks for the review. Good point, I'll fix that and send a v3.

Peter
