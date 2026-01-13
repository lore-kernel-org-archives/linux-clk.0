Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB4D38945E
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295655; cv=none; b=ANhq1vcZ8PVvOVqF7axO8ru14RrUsXLv/zCJLHuWE0m/kEffrBHbwTs+W3K2eIh+cy8M+X1sAyi5ajNtK0TpI5ClYII2DIHmgQcMaA3tFsYpiesDXBZTHEdDYb8g69kIifk3pca8RjjwA+w5ic2SKMDDCmL9xbNCLQW/L2iOBBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295655; c=relaxed/simple;
	bh=xqGpVB7r89YsbJUHXZJjT54kH83zTdXiwx5zs/NAmxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJKGQp9pJD9mJxbP7fsmIrDtfLjtOahvEoI8YdfEKK5JJvPaAJjwfcUD8UH5T99ydTjZuF0AEtjobPbgo5uxPtUK+wGAGY6B+2CF7C4zxW6dcI8xkHFaroZR4X+1H/jn4qwE+IaiLShatCqv91nVUelBxZX5yNUmFn1OjWD75To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AHu5DkFt; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHu5DkFt"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so12380439a12.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 01:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768295647; x=1768900447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn5NX0zVHIadFPbViV8yMvWD/kdQPjminzNjM4/y1Bk=;
        b=AHu5DkFtrB5y5doJltu1DuEV7iX0jCJ2eB3NoH3VI3UpLMgP79e+Dwn740++a5A8RQ
         d1o3my1h5U0p2BSQRW3PWeUcPaFidmWGeYDp6Rkroo4rZI5qCH5mb/8H9ZC6cE7P3Pme
         sUwo2AS4YlXe7eVM9QkJ+/qKTcjlBt5bEtF2T6KpBFbu+cAte+fwi/e9Z3zBVIagpJHq
         ptw+j1pwH2deF4XQknX5jcX+04Qu9qNJVPsybw85UPzcrAM+w75pBJ9FW/mtazH7IYlo
         ACxzjY1pTDtMFKSP3p9tavM+fG3Q5z+vXdpDp1nFRsfFsQ7ryv/qhwZheE3n8GzOv0lx
         idNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295647; x=1768900447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bn5NX0zVHIadFPbViV8yMvWD/kdQPjminzNjM4/y1Bk=;
        b=r0wWhA8mrBhXhcTULOu4BxFnS/GxakdekV0NFMvIgaYNLh+5u5vQ2mnBNZydqlGxKT
         t2ya4JOfNMhYJgk6MRQKPIukHovy7/npeppAU8RsjLtzYLtEaOO4VV8ecAvEFb2BWpXS
         T8YTkytNDw83YMIRvfIHFqxQcpcjY9/q1RxzGxaRGpNczvL71v2qmJUTBWKCeEOz5Cpz
         GiaGaTyoqjJE4vDn8eppzDiXwG3OA647AFCPidFJpz1T86+8CUXGAyzTec3i7dAElGku
         Ykq1Kw3N+JbTb3M8rE3n0NUWtJ4K0pnafHOB1y+ul7oxlBQNoYH0G/yhBRFW2/wbBLn1
         jpVg==
X-Forwarded-Encrypted: i=1; AJvYcCXGpfiwo5VCjCSUk78dj2PGvA5O71u9z6XRSs1jwepSJtKdGVPzsE3UvD3VdfpyBQTL5YrVqj2JhOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLA7uDKJwnkavc3hE6M2Bs7cMMa9SJUTJKIWvxw4OJVJALrBZ8
	ITyOwULgxWqZxMMXEFoF2CNEfS+1UQb4jldyziAR835X9wNJ4/wd3ywDCpJ1yLmLTaE1bwW5my4
	TZ7hgi1LGdNeQGedviMNgkSieybgUlTj2U7pB0v97nQ==
X-Gm-Gg: AY/fxX7UztRQG2XeoOTH1Pm+gbBXMizXt9pj9zmxbmswzuYQkkb9asvRFMGSgsHznqo
	SeR5egMIsgWhiXi8GlStFCzwbRslX9PZ8qRdVQ8pBktBbrYgvp9/Ed6XUG7E068XEcIQ+47SpDd
	tbAhcdWVUTurlzLlRAdQUfSbbQLPeDIlXr4VY1zSGHEbrj1vdXxLfGhHM3audZnc8zGYLoj6JZs
	Wr0rZszxktaWtVP1BRG6SVVQhKLKrSQTvF1j0bDUmGE5CsP1Yc9pbvTE1c6LqJlU6T7P8XJOO2z
	1SGtNMCKvC5coB1iSJMi5UwKYoZ0pwBmSBFrKKg=
X-Google-Smtp-Source: AGHT+IF/uMz8MYijvgNH6EAmeQTRc6aRXVQ6Ac2y4GTApWuNrbNhRowJgw1xPnWbWQMx4L4kzhRYmGW628wrmJp9buE=
X-Received: by 2002:a05:6402:524c:b0:647:9380:103c with SMTP id
 4fb4d7f45d1cf-65097df5672mr20320306a12.13.1768295646934; Tue, 13 Jan 2026
 01:14:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org> <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
In-Reply-To: <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 09:13:55 +0000
X-Gm-Features: AZwV_QjDqNTFOct4T-rP7w13f_DSbKkRMZMwlRNVBJ9q5uu_3B70MKV9_itceMo
Message-ID: <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
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

On Mon, 12 Jan 2026 at 14:26, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > Fix the places that don't have correct alphanumeric ordering. This will
> > make reasoning about where to add future entries more straightforward.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 6 ++=
+---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock=
.yaml b/Documentation/devicetree/bindings/clock/google,gs101-
> > clock.yaml
> > index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae90800b9c=
256bcccebfdef2e49 100644
> > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > @@ -27,13 +27,13 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > -      - google,gs101-cmu-top
> >        - google,gs101-cmu-apm
> > -      - google,gs101-cmu-misc
> >        - google,gs101-cmu-hsi0
> >        - google,gs101-cmu-hsi2
> > +      - google,gs101-cmu-misc
> >        - google,gs101-cmu-peric0
> >        - google,gs101-cmu-peric1
> > +      - google,gs101-cmu-top
>
> If we keep 'top' at the top as one outlier, it'd reflect that it is the
> top unit and all other CMUs are children of it.

Thanks for the review. I opted to just keep it alphanumeric so it's
(hopefully) obvious what all future ordering should be.

>
> >
> >    clocks:
> >      minItems: 1
> > @@ -70,8 +70,8 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > -              - google,gs101-cmu-top
> >                - google,gs101-cmu-apm
> > +              - google,gs101-cmu-top
>
> And here.
>
> Either way, I don't mind:
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

regards,

Peter
