Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6DD40BCDA
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692354; cv=none; b=oM/gVeDNYIo913a/IGG3pNr2CMlircxB+9xIoF+sxLfELHRonsdHqXXTF/H00DXXnawx1E/x6Gug7fXcqRKZQaLfLvYsxPpK0WMeq1eeVtaqBNaoYjSQK4lHA8T5LBTSoBYqdQwZQ57cpdFuM4YTtvhnnZ/w0M71v/6fao53hLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692354; c=relaxed/simple;
	bh=1GrAZMcm1LPXjU+/Qsg9/1FMvUYDa+8Y1O9nxVVer9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5c+nc1VHhW58r4odKiJSaoeduP8HLMh3HDgeFP8jZ3ogx0u+vNb5cG5yc73fGa7V5ZaNijyLke1mfS7H7mAn/eAZ5yMbWXlTnVpjYHx445gs98oOAoUqF3u7vGKy8oHQ3R7XVY+q0EwIsNHX0DcuelCSyvkdarL1VEt2GisCac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBucVLV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBucVLV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E0B1F00ADE
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692353;
	bh=zjWapYZHdMgxtzEvLQ2Ffr/6FRwRhpZGjvbVIfTls9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YBucVLV8nNOmJxz6sXoRqisDNRAiPDkVfy5N5miqpCJyoRpBJ63CVWJyu0iDKRo9C
	 djj2iKNa4SHNljMpvMFxolyBrQYAfP1wJMJqFt6XRQeFifeRg7ohA/7Qy4sUWT1LvM
	 9D0QGsRGs7trv0J1di8tO+c04y6+8VAYISDsqpR6GIo2S/UmM9y1GLbl3zPV3vasGC
	 cTFj7p77B5D3phnxOXvsoZbDAzH4fffl2xDjlksD/GP+nLwpiRjvn1FRmgY+YRwmVR
	 IxJ6FhteB3dhMMzvYdzPhbtdo/SXQ39k8P3A0KHzHHugLJi+KVXRui3yNn6u1SGwR1
	 sODHmDJQNqqJA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so573256e87.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr+fjtCIrfIwZzWJvdNUk+vDj/wAniThbeu+B8Bfs6JOxjbNAPimSgu8WyyGhv+1epKFmq0lhW9hio=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCa022sNbwE1rSQMkUIXfFrW+uyvpk5YYfELdgL/txQslIebWb
	WKifvPAjPrO5sGt4nGYSZBCKvbC86t8ms1MiKfPg/1SoMbd1+MrW3ENrXhW/PS01d88IGLh/fcU
	blEd7xdfSVycK9JX4y8X3PMAF2VlbcDs=
X-Received: by 2002:a05:6512:8348:b0:5b0:2176:69f6 with SMTP id
 2adb3069b0e04-5b459184b7emr258626e87.37.1786692351807; Fri, 14 Aug 2026
 00:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785838584.git.mazziesaccount@gmail.com> <838486b443af9188410d8b802a818dc0af20ea9d.1785838585.git.mazziesaccount@gmail.com>
In-Reply-To: <838486b443af9188410d8b802a818dc0af20ea9d.1785838585.git.mazziesaccount@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:25:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=mhchM2L84Dt3myY26cx=ZA4cUr-d6qjqNrw6V=7aPug@mail.gmail.com>
X-Gm-Features: AcwNN1U780XpZGwhxDiNYxBOxKNu9WP_wvZzUmCrRyQzMpwkyf9iHdEMZlasOC4
Message-ID: <CAD++jL=mhchM2L84Dt3myY26cx=ZA4cUr-d6qjqNrw6V=7aPug@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mfd: common ROHM PMIC properties
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:20=E2=80=AFPM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> ROHM PMICs keep having similar functionalities from one generation to the
> next. Keeping the device-trees describing these functionalities similar
> helps users because:
>   1. They can re-use existing device-tree properties when switching from
>      one project, using a ROHM PMIC, to next project using newer
>      variant.
>   2. The users can find and re-use examples from old projects - even if
>      they never worked with ROHM PMICs before.
> Similarly, introducing new and different properties for same
> functionality previous variant had, will be adding confusion.
>
> Sometimes the existing properties aren't 100% what reviewers would
> prefer. When issues are minor or just cosmetic, changing the existing
> properties is not feasible. Reviewers can't be expected to know which
> properties are new, and which are existing - and this can lead to
> unnecessary review discussion wasting time and energy from everyone.
>
> Adding a common file for re-used ROHM PMIC properties should make it
> clearly visible that a property is re-used, when a new PMIC binding
> refers to this file instead of (re-)describing all the existing
> bindings. This will also help keeping the common properties identical
> across the variants.
>
> Add new file listing commonly used ROHM PMIC properties.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

DT maintainers think it's fine in two patches so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
