Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA528EC64
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845864; cv=none; b=p+K9UAOoK9OF3tf0xF56iQeD937VwUt8MUEG+PEyklt6ouqNHOG0/88JMlxgA4vYbDIqhM7GNiuNW1FDlNOaI1BQwwl9/21O5rzwMQgyrxVRGvOvNwiX1kj6n1KyPUVHoIRc3dzQE2mm8Ods6BHFgNkebKFTYju+HEFE8jizHvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845864; c=relaxed/simple;
	bh=hRYADXuuMQL0WU6YweqbfVIpCJlQAKmMZXUM2sMi/uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzDojY9dnE61Rey108z41Nhj0Gxj+m7OGflsfRZ3UbmbeZrjY5Githojqa6MZiQnCH84DpEvrpYI4aOy4iLHoZCx64HoGdxgvLVxPByWMtyuNRBfR0HX2reBQU8vv8b0yMPNj34XGOkT73AlOTvNqWfPpRcuPMTvcpdfPvdohWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nj3Ui0gO; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nj3Ui0gO"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e53537d8feeso7684409276.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 01:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845861; x=1737450661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laOni/3pZswCtnZWqEbh9/nDgLWlbXlzzIl5mtJ7ij0=;
        b=nj3Ui0gOQ4eGDTtpnrBS67q9Afk/az0V1L/fRgrrDXm5Xh+SdtNW9tJTDd2FOj3YRi
         VjlWKrSh6tZi/3i4fbHM23uIyxzfPqzcvMae4h8wLkZXQqn0zmI7dAhU6RgGOiuafiK7
         X53gmR6jjZPoayWTiBFYdwQEbNLkHRQvKGm2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845861; x=1737450661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laOni/3pZswCtnZWqEbh9/nDgLWlbXlzzIl5mtJ7ij0=;
        b=NSaTBNqwHMExXi5zIsQg66Qm9bqnKGwgwNnt9ZGBDKhso1J2dnS8hG1X+dUl7jxIiw
         3TlyfQNk4lCNwQF834K3DIwY6ysjKdUmNGV7x7Z+NuHklJEt2I8M0vEgmMUt/ZCFz5QM
         Hw3qiwuRYr6E28Uzt7ZAozDJz/SbJ7iJptD7mFnfSw3d97jyTX4NGVy54Dj407dBrtsn
         rb/CZ06ewLhZEfEg2XhlyZqmgQIMPOjnl0thVSaEDThQBf+t1Nxo4ACSqvYLIUnUfQaT
         5Djk/W9TkMOcBYZ4krArHdHDg4q3DR0WcrSeVXHJdTNQvBxJOeR8U4S9Jt8rP1XXfefz
         R6Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVstsCaPzesdhAODkwGS6aB//V1ZvAytVYms6UammgGrnq3hLEdTd2Db184hkP+9oupy/E/3icy3l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztQyC+peI76z9ohLocpVYmV+jNR4/Gx21ONaUBmjn6w5Gk93bI
	QAFP/6yYNQknnwyZuOTrnTIhR1Scw+8PjbAyM8ifRJehJBHlxAsKMTim9pHTAoeIwhvq1y/b0KX
	8kybCQrlpnCjRY4FbxbZUNaGkDOKl6HVS7tOpSg==
X-Gm-Gg: ASbGncvG+1NOC2s2FRl0ljGhLDxPm5ySEFTUnuebhFPvgCo1ZtDSOXwGLSQ89iw3nhH
	1lfT3g95NEC9YtEcoEftqJjDrtyUSTq+ShUYR
X-Google-Smtp-Source: AGHT+IE9CA2Xfhzw3GHaovQ1IHfqCWAXv4doOMw3356PJ8sdDTE1sLuY9FIcA5CUBN/UDJxnGUnMXzDsrursJPWiJDo=
X-Received: by 2002:a05:6902:72a:b0:e38:af38:de3c with SMTP id
 3f1490d57ef6-e54ee138757mr17712009276.17.1736845861696; Tue, 14 Jan 2025
 01:11:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com> <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
In-Reply-To: <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 10:10:51 +0100
X-Gm-Features: AbW1kvak2sUesICzzkmsj5TX2inw2Pxvk9l2RhEMwr_4GvlhnKKbrVqsFXF8zsk
Message-ID: <CABGWkvqu10dyW6y5S7qvY4G7uh0OaUgr6k-F7BA1AU0H9bA9GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 10:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Thu, Jan 09, 2025 at 10:18:28PM +0100, Dario Binacchi wrote:
> > +maintainers:
> > +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > +
> > +description: |
> > +  The RCC IP is both a reset and a clock controller.
> > +  The reset phandle argument is the bit number within the RCC register=
s bank,
> > +  starting from RCC base address.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: st,stm32f42xx-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - enum:
> > +              - st,stm32f469-rcc
> > +          - const: st,stm32f42xx-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - const: st,stm32f746-rcc
>
> Why this isn't just part of enum with first group/list? Different
> groups/lists are for different fallbacks and I am pretty sure fallback
> is the same.

I tried running tests after applying the changes you suggested, but
the tests are failing.
Thanks and regards,
Dario

>
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - enum:
> > +              - st,stm32f769-rcc
> > +          - const: st,stm32f746-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - const: st,stm32h743-rcc
>
> Same here.
>
> Rest looks good, so with combining entries above:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
