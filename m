Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34998258EDA
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 00:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791332851; cv=pass; b=dAo+RXYbb39lqCa3a6HwTxZ4P7Gp+xs48QCCUkX8VY5lNxR5x7MHFsumAYrrBkhfqxLdvNhqSBO0C6A/frpxQXZmAyNKo7MKmHSS1fKveuczp9e1U5n3GXYuOJKc2m0me8pT4NIHeEwHoxffCt/gld6s8LoKyav3cwCyZGb4z1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791332851; c=relaxed/simple;
	bh=Iyuwm3dHCbREroT6zoAZHUTDwbJXCt9kSli+dnbxdL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmK51xqII8ogQHIB4a0zvly3jgOpBTvO0szuR7f2hxYhJhA3KFRLQv8sTNDA9/qUaTUASXWqGNBk9KmCAe5VncID334gldN4LNV7QjfdO2YHykK2R0+1Y8xiKezRa4KEd8cH1aVxRyJnCKzV1a+CVDnX+eYvPb5N9kvzpLQuCo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWyA3keN; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWyA3keN"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ac9d666d4eso35546887b3.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 17:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791332848; cv=none;
        d=google.com; s=arc-20260327;
        b=R6mOxomfOkkjTfELe/XIy2/uAjKWZrRcGeMcEKQcLBIM09NkJFlyYWpj4F7pxteqKa
         WAirVwS4RTtU2TGLnOyzGuOXdaC8QsThVimNfl78aPOxGGPA5/UWfKGNQesfud3U1HiU
         wjK/VwKjCNWrDaD4ztHQgsP3HLxGCAunGP939ue6TbVmcP9RDOQFN7QozY7z7c6Ls2ny
         6Oap/jSkecw1vfDW/R7ARyiXDXspcG4HwwB+/Bdqo26Cayxi9tK+0iSPXGA0b7633opt
         uQZIKGaMRqjRIIgs9XwPeMuzbtlzOOdQSggihDVTjWWdKaeo79gVJS6Chty0i8K/A1VO
         yhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        fh=WlT9OazJZqToTs3qKfM/xzb2kiqyzuc90Vv+mXKPCPY=;
        b=UJVf98/BWusFuvy+x6Z+zyWTrzqI0vNC03dEEZp0cGTqGa1wQ6ab4UxjbzeV7Lps3J
         /nRCHDQuf4bojGpUzK6o8XyWKtpEuL5rHMIsGsURKGxOE0QHAhKveaInwsk0VStcg5Eu
         ztsBMoIsCzW5AXndoAy32JZlSmBo+HvFnUB0uoiZKl9OS6ErVxQnh89yECkwCCLUSp9s
         wA4aKB5S1KYda6v4KhO2+Ld5WCpydeZK4SRUX+VBb6macjk+ekYH/95OoAig18UtppGQ
         suOPfzhNSMxVOVDBluESXIvHs3UNoOKiTq0fhTZ/dmS75DTTGOFL6Xcssa5mQVnjiHdJ
         xlhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791332848; x=1791937648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        b=RWyA3keNYcFZ0fLg6GNdljYNcmn4EIZyqsEJkXNLxb3U6VIWZTTSzT/ori3qQF4Wcg
         neFyVcZ6IuTgbpxON+9IJLplHtzila2+LpVhgAZ11pZLL7yGcVhnaekgp7FHVo4iLz7i
         FdJU0ZQ2J544jgtgy9TVGygU1YOoBGK2RFDelHSFcZmbf146Le92btzZWR0bKv7PpPH3
         I0ro5biYBNDZZo1S5j8zftTmJM5zQ8JsNF7DKwMfYsxX0Zt9f9wdCSboV6FDYdA23mVR
         xfrtxIECsJspouA4735WNm5yu2MAER/jAfzmkRxi6eue3ddI4FkwQI0QOYSJD8KgG56E
         /NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791332848; x=1791937648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        b=G1UmhZTMbZrk3Cs51mX8EUsHCH51IZOaZq2zRck6Qmxeazu3XXAktR8uZSrIi4co6a
         rNh2ZvT9wBK6/j428pMWDwT8mL/vkcn20WjB7H69OnoK2/BPUPoFMfHZqzZGneHsp5rq
         uN5O3/hOeEu3rZR78MvyAbiPRXxi+ZCBGFYcNJX9jgGflBmaxsj/lEnTXi6UoUlA2tcg
         nxXYzETFGuiejgMtVSiy5HMvIOhRf7p761iXhsLF9+gayoDWeBKBYLBm2pagfrmHZkkU
         5ZhXsPQRcXZ4QVjXlWMEKl3pcX5N+UiDFIqYhvj7iTG2M7p6PdW8mv2qC3WqymC/SrkZ
         KbqA==
X-Forwarded-Encrypted: i=1; AKwUvBzPoV1MKDMelQ3yqAdQLutbVS2Q22EILZTH3H4UpnmnfBCBXET1jrgNUkYZOqLKQgu7hB62mHbXfu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4pVtVZBKBOFWtGi63VUrGS2aI5Crhj7VlV8Cd+Ut9tpyj9Vj3
	SSzZZGlnjJTV4WTsjSvUJLMswkHtlfvRAEbBxrg3vBO97fHOsiSdQjAtXOh7XFuycz4DbqVY03Q
	piBI59SBXdBHCjGbuF6FKOyn3fm/nenP+uQp3fepaQA==
X-Gm-Gg: AYBFou0wzGfrtlmVoAuKVtYTdB5hs3i0NbFIWdgkMOyZKoMUTNYMp0dMvu7Abl1QgM/
	vVEp56tc9QwDd+yrt4KDMgR3gSra1eZb/fFZ6RUiNiuvXabjmA9Uism1jl/8iDeer9m9NbCfU8g
	HtWk/XJXoLLBR9IsB01pABxJ30XP661yIdHalyslRJhiy2dIX4pTLsPLQejM6me9Ya4d+6qW1db
	v+ONI9pPQW2/0PiUDb4A0iIZZUlI8p5pLueGMNbvlgnZta7yF3WuB5/pnw66cPzyFWA3KpN41w+
	YnX223Jaif+/BnIIRNyu49Td/rEzfKRkmleBX/KKYFJzfEONIISrAiJYiWe6o1ZoIJ5CUJeG100
	YF5FXYGAaKpKAyA==
X-Received: by 2002:a05:690c:a798:b0:8a8:4cd6:b366 with SMTP id
 00721157ae682-8b05b0baadfmr4463097b3.34.1791332847977; Tue, 06 Oct 2026
 17:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org> <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
In-Reply-To: <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 19:27:16 -0500
X-Gm-Features: AclHuK-gTMHxeLVbqLEEqthoe_YhAWKRzmo3ENLwqbF0WuTbIQb_K4cpIVT21tE
Message-ID: <CAPLW+4=gpnHSSdZ1SWaYz4L_U12vo-OTwUvEYCt=SOSexJw+Gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 6:47=E2=80=AFPM Sam Protsenko <semen.protsenko@linar=
o.org> wrote:
>
> On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
> >
> > The Exynos850 SoC incorporates an APM co-processor. Communication with =
this
> > hardware block is done using the ACPM protocol, which handles IPC messa=
ges
> > for clocks, power, thermal management and PMIC control. In this
> > architecture, the ACPM firmware running on the APM acts as the central
> > supervisor or arbiter for shared system resources, handling requests fr=
om
> > clients or agents such as an OSPM. In this design, the OSPM is one of
> > several clients or agents communicating with APM.
> >
> > Dedicated compatible string is required for the Exynos850 because
> > its firmware utilizes a different initialisation data base offset
> > (0x7000) compared to the existing GS101 implementation (0xa000).
> >
> > Additionally, the ACPM firmware implementation on Exynos850 does not co=
ver
> > all clock management operations (such as clock rate reads over ACPM IPC=
).
> > To allow the OSPM to resolve rates for these ACPM clock IDs or sometime=
s
> > called domains, add 'clocks' and 'clock-names' properties to reference =
the
> > underlying physical clocks.
> >
> > Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines=
 for
> > Exynos850 ACPM clock IDs, clock property constraints, and disallow GS10=
1-
> > specific PMIC child nodes for Exynos850.
> >
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>

By the way, we discussed earlier the reason for ACPM clocks:

    "PMIC might be controlled by different masters (cores), e.g. when
Linux is asleep and doesn't control PMIC via CPU, audio co-processor
can still be up playing audio, thus it needs to control PMIC via ACPM,
which in turn means some clocks have to be controlled over ACPM, so
that power supervisor (APM) can decide how to handle/arbiter those
requests from different IP-cores."

FWIW, I think it may be valuable to have this explanation added either
in the bindings doc or in the commit message. Otherwise one might
question why this whole ACPM thing is needed at all, as we already can
control those clocks via the regular clock driver. It's just a
thought, and can be done in a separate patch later.

> >  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 ++++++++++++++=
+++++++-
> >  include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
> >  2 files changed, 76 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-ac=
pm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-=
ipc.yaml
> > index e68f9c3ca5e2..0eaa9c881f6f 100644
> > --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml
> > +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml
> > @@ -22,7 +22,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: google,gs101-acpm-ipc
> > +    enum:
> > +      - google,gs101-acpm-ipc
> > +      - samsung,exynos850-acpm-ipc
> >
> >    "#clock-cells":
> >      const: 1
> > @@ -33,6 +35,20 @@ properties:
> >        appropriately with the clock scaling. The argument is the ID of =
the
> >        clock contained by the firmware messages.
> >
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 9
> > +    description:
> > +      List of the underlying clocks associated with each ACPM clock do=
main.
> > +      This property relates to ACPM firmware variants where not all cl=
ock
> > +      operations are implemented.
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 9
> > +    description:
> > +      Names of the ACPM clock domains corresponding to entries in 'clo=
cks'.
> > +
> >    mboxes:
> >      maxItems: 1
> >
> > @@ -77,6 +93,44 @@ required:
> >    - mboxes
> >    - shmem
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: google,gs101-acpm-ipc
> > +    then:
> > +      properties:
> > +        clocks: false
> > +        clock-names: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynos850-acpm-ipc
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          items:
> > +            enum:
> > +              - mif
> > +              - int
> > +              - cpucl0
> > +              - cpucl1
> > +              - g3d
> > +              - aud
> > +              - cam
> > +              - disp
> > +              - cp
> > +          uniqueItems: true
> > +        pmic: false
> > +        pmic-1: false
> > +        pmic-2: false
> > +      required:
> > +        - clocks
> > +        - clock-names
> > +
> >  additionalProperties: false
> >
> >  examples:
> > diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/inclu=
de/dt-bindings/clock/samsung,exynos850-acpm.h
> > new file mode 100644
> > index 000000000000..87fc6ccc1d99
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright 2026 Linaro Ltd.
> > + *
> > + * Device Tree binding constants for Exynos850 ACPM clock controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> > +#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> > +
> > +#define EXYNOS850_CLK_ACPM_DVFS_MIF                    0
> > +#define EXYNOS850_CLK_ACPM_DVFS_INT                    1
> > +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0                 2
> > +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1                 3
> > +#define EXYNOS850_CLK_ACPM_DVFS_G3D                    4
> > +#define EXYNOS850_CLK_ACPM_DVFS_AUD                    5
> > +#define EXYNOS850_CLK_ACPM_DVFS_CAM                    6
> > +#define EXYNOS850_CLK_ACPM_DVFS_DISP                   7
> > +#define EXYNOS850_CLK_ACPM_DVFS_CP                     8
> > +
> > +#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */
> >
> > --
> > 2.51.0
> >
