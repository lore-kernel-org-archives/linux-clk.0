Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859023B63C
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763293454; cv=none; b=LUlQ5e9sHJyT1BdIn23uIepIKXy3XVBlubzWKl6AbjpzWaGJfCaDA9TuiAFIFXeKsKIb7QqvmqNNZGqxmLI/i2kB5sAn1hbJx472MpTmSZXFiSpo5CPUejtOfqtDLKz/ApRnXWb0ggPSD06To7L2DX7sjoct55yv0bPmyjZfrF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763293454; c=relaxed/simple;
	bh=Lt9xGL62WtrfxQ+0HgmFN0gM36WLFSIowVUaCGct32A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pOA2nFGrUHTVatr6fynVoy9b298GXFUKeKt2bW79988RTO0BjhsZE9BJ94Gtco6rqRe6jKWBBan8Pk4BCS9f4yU67fYBNno1/BtAYORJxdfI6QUawc0eVDhPWPBDrrkXXMbzppA7R9/KWrAkZe+tVrUvh2EFn7pFYOhInpBADeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fn9DUS0j; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fn9DUS0j"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b71397df721so476389766b.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763293450; x=1763898250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=;
        b=fn9DUS0j6GkMSIgP3aZzjs1ZI49rZWhnHZrFAhWZTA7zy/8dSjl8UEmDkZeIHoLlx0
         68lOdy9J+m5QKdCS/NZmiMbv3XXeXMWRhIGbth9xua4VCHxiiUD9243BYFLNjYkqSIYL
         W9apRgRWpBv+tPed7xocR9RlNZ+Vy8HXlmJNr7mqT/0AzjhRgXAwN8By6Yy9gwKaMG5R
         CM8GSdj535kXGExAXhwtjxNGcjcgd4MlOjOcerAHoG8uTzZ+/nqH/BKxWt3psmYZPgqO
         GiIXV/Bp0e58vDGUYxCnS035i/tTDYRNRDjeafRqGJ/ZlxVeKmx6bN+6S5IeRNnp7GQP
         euvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763293450; x=1763898250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=;
        b=YTA4T3ZbXu83/3fF+jrIlk7h93+Y6sQ98HNdvfMD80fKLIlWrsZLA2ceJ70jqwRUN3
         yBgSzNQUqmxB0xIdgM/JdVr3ht10scSPOYivyUMQpGVWZ4/Ry9ubKNiyUTa/BswBziGr
         PcJblHi/WlHFIRBUReEwWv5QApVVIj1fi3cQTQ85qC7ei2Wd06PRufLEtSQWXeVhd1vu
         ejkWHucjs0k14GpL/K40ivYu56a5GM6DH+YKuIq5C3gyuskM2K0J3/HNcXcOpxxDIqYW
         +DoJhR93Int/epQxYFwrjTNBhVVhIp0wOKSCtjfqqKkso9xS0DhFnhqUdsxe7YVbnX/W
         bi2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4FlDSmfdrT1CXUKwMCOv8e35s9pDMslR7en1o2RfcOeLSit86yUTklvVff7LVHAh2Xs59Vzrqp4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOnxufnCt6FIT4HCTuy8RjAyURXuZSNEl6DBQQqRbDa5wGwVMU
	jmhLaN9Y3LEBC3FjIlYv8Vw5NHvLYalxSh2rHqb9o60cXmvoTBHdvNo9
X-Gm-Gg: ASbGncvM9g3zpbzedGEDFThihVB/odYCEuFm70bIlHJ5+3mh34Rm0VbQQrVccPunJia
	FjB2KE3tlGPWzF3iBc0n5F8n3Ez1Gx0JUCm42OzNwG8Hl4sEQfBPpss7XeHXNEmhVuyMUY8BZhY
	8v3dISut2MeDNR/0toI0gB78Q4kp9xbHfzFViScLnUFjVB+lVZvKQFcZKfAUeRru5r9di6vQ8Kk
	1Y7qrB+j2NmgLsJe5o5KshNrbW7Xj8VdDr2UNeOfgdlpjHMn5lOX3HshDF4topxXXKY1HRUnDC+
	YC4evWEPyvqiN9EOokjZIJtacOeP47BU0I192+dfshMlgB7k1A6+fuPMANogpYD5DfqqPqUpCHc
	DUyyc9RyFkfM3ABPNUo7zTIYZ2JHa/oLKqEtK4+IcOW1Ua5pqiEYQpcMyXTSTNXDu6gFvxHkGFf
	Ae8qLgovq3CxaLv/FkUzTU8e4P5kaAdZO+19bKgDX3g/haDy9eIZmToVClNwtLVqR9qny9
X-Google-Smtp-Source: AGHT+IF71fotOguLRbTRHhdoPXFXtZCCxjXGGJnugEk1v1pjxqWMpiA2cn4S56S/ok6Kp7QddGfEdA==
X-Received: by 2002:a17:907:fdcb:b0:b73:8757:68ad with SMTP id a640c23a62f3a-b7387577ab2mr403687966b.47.1763293450183;
        Sun, 16 Nov 2025 03:44:10 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm820527166b.15.2025.11.16.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 03:44:09 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 16 Nov 2025 12:44:08 +0100
Message-ID: <4691137.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-5-jernej.skrabec@gmail.com>
 <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> > Allwinner Display Engine 3.3 contains planes, which are shared resources
> > between all mixers present in SoC. They can be assigned to specific
> > mixer by using registers which reside in display clocks MMIO.
> >=20
> > Add a binding for them.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/allwinner=
,sun50i-h616-de33-planes.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i=
=2Dh616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwin=
ner,sun50i-h616-de33-planes.yaml
> > new file mode 100644
> > index 000000000000..801e5068a6b5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-d=
e33-planes.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-=
planes.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner H616 Display Engine 3.3 planes
> > +
> > +maintainers:
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +description: |
>=20
> Do not need '|' unless you need to preserve formatting.
>=20
> > +  Display Engine 3.3 planes are independent of mixers, contrary to
> > +  previous generations of Display Engine. Planes can be assigned to
> > +  mixers independently and even dynamically during runtime.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun50i-h616-de33-planes
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  allwinner,plane-mapping:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Phandle of Display Engine clock node
>=20
> You description is almost duplicating property name. You need to explain
> here how this device uses them.

So I guess I can copy commit description here? It is needed to
access registers from different core, so it can assign (map)
planes between mixers at runtime.

>=20
> Esxpecially that clocks do not go via custom properties.

This has nothing to do with clocks per se, it's just that registers
that driver needs to access for mapping planes between mixers
are in IP core which takes care mostly for clocks and resets.

Best regards,
Jernej

>=20
> Best regards,
> Krzysztof
>=20
>=20




