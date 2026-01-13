Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79BF3446AB
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298495; cv=none; b=QBFfXzAesBtm+vvo89ILApSgULvql076Oy+2bNfrFcAB+h7i+xCOuwdQHi38t9/1qB0MkcrWwY8Eno8PqMsAqt9BA5DHkiP6EVmdSs/iwPvoaX4ifiIcCGhy6v8FX3cHhUQy4IwGO3fFI0DLoRW36GgTaB9YOts7XASyBFMIoIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298495; c=relaxed/simple;
	bh=HIT8XYmUdXCfusEfdBm9oPT/gxJvg63DndHZ8y6yYfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLJ7f80KvF3VJYw/4bmYFpYLICsVyIzhdp9YhGtvh6LgKb7oCBbNj6HNS13ZdmNQmIPNJiKzRk9sqM9aBwcJLh6WzMFFllDjSp53f6vV5M6975kAVbnv8gkczKRhEM6tSV7zqOvqtUnhX8dNadVzoZ9b2/GjKxlYJXcp7ZNukOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVMm2QUX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVMm2QUX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so10712632a12.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 02:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768298492; x=1768903292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS+QiFISufJoEVeMvcd1B3yL8m8OJysDKvS+OCH/uOI=;
        b=OVMm2QUXTutvKYX7UqGRoDd19jOPnNIaXEVCU5YbTmsKcMm+nRy1M0Bx13TsixEnS3
         N4qN+Em6NkhGebU3g8GdNQEE7+MZAFF0P5sVOxEMk+6hcBXzbQCFxKGDCG5CaXMe59sT
         gvOzjwHLq1IZrsGA3c0K9jeHCe7Yn5YaydK21ydbP7Mp6nDOfknwPxFqCwyb4a8Bwsjk
         96Gbc3t0VXktvkIxmV/jGvUoDbNvzV6dOZ6qyL/1V036DiDe9hzzZty8uNL1A2ZVqqS0
         txZBBos+bYzl2MH5iyvtRjNdN5YEdXkYyL6LMUpxIJAJc4kuM2+dSAdkncfocH/USj02
         nQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298492; x=1768903292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cS+QiFISufJoEVeMvcd1B3yL8m8OJysDKvS+OCH/uOI=;
        b=qNDB/DZpa+8Yz1HrrgcUUlmbHoWym7GRuzxNp7Qeg+aDb/fAANQJSFmSXR9rYP2ov8
         +ut8MI6gl4qM+QtJlKJJOH+zgzJk/VQ4/lwcpsQSVacQjQenIx7lTpWFRrwRtbMXEnvC
         mtbXaW5IpRbQUjoxMHH4SEaUFhnf2/3g0Zr9EhnP2M+cWJMoDAJWXsa7IHEwGtBCHICu
         SPmSloPundYFS6ano0ox2Nt6OvcuUFdL48j0HuWtFvv67kRD1XN90M1Oj+nid5f//keV
         cZTq6ReMnqmQVIQgu0S0a4H9ytQ05rs4AgrGiFHwnb7Zl0R0sBGcghKhRxKSWudrXNZv
         BUnA==
X-Forwarded-Encrypted: i=1; AJvYcCWFMlgm5n18GX7uXzWCr3xEwZ6xhuysY8n8z/924/qgT16aGTIvObHhcFTbj30SwnIob6jtqcEvohk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYJyx13yHgBQuNPZocaTF8hcKURdfYljRJFvnWod7cWr96114r
	syhJchW2CjLYekvUiofwLBsZDxG37CLmtx+oyMs204HrrWUKvHMpShvdKxZTW8d2G6BvwhMlfF7
	cNDc7DHeJ3vQZGRhjdLi46zKYiSpPBoUVisceOUOPTw==
X-Gm-Gg: AY/fxX4dcDVzu9o6AZ9AIrgb7OG8+zZo2ibfu7xkL7zpVWIdLJZ2ifyZuSUyBs80aN6
	356VWktX/P2RhOyTzba1hsY4W2yjSQili9GRV59Kih4Ux44GMUHJ54ChHoXhaBkXzCYEUxNjLRX
	eCgQjLxLiU0fDA1BW6HgXYws5GLCNd8J2GY5o5aKoYAKQtHraSCtsGVebu2U5uBA7YL1Tf6BeGP
	geWCoTU1e4wb887EZte17AXlJPiL/0ozeUTZDjQtW+otIJlXCw6Cj47GzAYoiK03Z9Z/wv6XCVi
	v9DDtO9T2ZbLt813YBlOSAZ9I6ZG
X-Google-Smtp-Source: AGHT+IHhV3y7JNmOBjy5EalV3x7t4vl01JkGjwjactx2DF74xLII3ghvTLNgr5SCi2IqjH5Xtd0PLZPDzayJmM7+uno=
X-Received: by 2002:a17:907:1b1d:b0:b73:6c97:af4b with SMTP id
 a640c23a62f3a-b84453eb56amr2009555166b.45.1768298491995; Tue, 13 Jan 2026
 02:01:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org> <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
 <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com> <c1045dd2f33ed3a618381448717b0b5d5b28dcb5.camel@linaro.org>
In-Reply-To: <c1045dd2f33ed3a618381448717b0b5d5b28dcb5.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:01:20 +0000
X-Gm-Features: AZwV_QjT11z4xe6qFWAlykBYIqmvAiPSAP9U7DrT2D5x97e86Wg6r2gUNQdxGKQ
Message-ID: <CADrjBPorDM7PUwR3x--4qLj9M9-wqZhP6F1Mj1e7HTdstFDcDg@mail.gmail.com>
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

Hi Andr=C3=A9

On Tue, 13 Jan 2026 at 09:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi Peter,
>
> On Tue, 2026-01-13 at 09:13 +0000, Peter Griffin wrote:
> > Hi Andr=C3=A9,
> >
> > On Mon, 12 Jan 2026 at 14:26, Andr=C3=A9 Draszik <andre.draszik@linaro.=
org> wrote:
> > >
> > > On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > > > Fix the places that don't have correct alphanumeric ordering. This =
will
> > > > make reasoning about where to add future entries more straightforwa=
rd.
> > > >
> > > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | =
6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-c=
lock.yaml
> > > > b/Documentation/devicetree/bindings/clock/google,gs101-
> > > > clock.yaml
> > > > index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae9080=
0b9c256bcccebfdef2e49 100644
> > > > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.ya=
ml
> > > > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.ya=
ml
> > > > @@ -27,13 +27,13 @@ description: |
> > > >  properties:
> > > >    compatible:
> > > >      enum:
> > > > -      - google,gs101-cmu-top
> > > >        - google,gs101-cmu-apm
> > > > -      - google,gs101-cmu-misc
> > > >        - google,gs101-cmu-hsi0
> > > >        - google,gs101-cmu-hsi2
> > > > +      - google,gs101-cmu-misc
> > > >        - google,gs101-cmu-peric0
> > > >        - google,gs101-cmu-peric1
> > > > +      - google,gs101-cmu-top
> > >
> > > If we keep 'top' at the top as one outlier, it'd reflect that it is t=
he
> > > top unit and all other CMUs are children of it.
> >
> > Thanks for the review. I opted to just keep it alphanumeric so it's
> > (hopefully) obvious what all future ordering should be.
>
> One last comment: except that all other source files in the tree place
> cmu_top at the top. It'd be more consistent with those files if done
> similarly here.

I agree :) I just saw your other review comments in clk-gs101 and
realized what you meant here. I forgot CMU_TOP is at the top of the C
file (which makes sense when reading the driver as it feeds all the
other CMUs).

Will update.

Thanks,

Peter.
