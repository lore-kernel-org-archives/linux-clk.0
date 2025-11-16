Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872462D238F
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763295045; cv=none; b=EYRkBpfZjt5th+yUoR5lsMzaopeVZ405JYho0D5sz4Z2lxEn1EwOZmahIfaeXIM1n80aLgB58sFAwDqQTGNhDSNlFgx9DhNuwBIhNEnKYGG5wSuGXnQA05OTfqD+i0tDzt/H1LBDWHozMIXDkG32vDbEy18qeD31YxaYwJ4P/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763295045; c=relaxed/simple;
	bh=Cm+2lfk8XlHB46YTwhqwQK4u+14C2DUuWYsaApKyO9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P0p3m8xXRzosVfitZTNcOU+FcxMNgNvyKgJCOSobO9upSsi1ndfwvee6vrrJ5N7rqU6rn25WMcRKfILQ3V7Ra0zHtQUxzi85PArVJD9WTuorhY2dgO9YC29O1wxcXs03CFxOs6Du+XSGPNAKXJER+DIq9xNaA0HieT+cxLoAOGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3c8FQN0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3c8FQN0"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso5780475a12.2
        for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763295038; x=1763899838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=;
        b=j3c8FQN0ncchc6l+tqvngXqcYtM2tWD2in4oTaXIabc5BSM80A7fIFxllhCcFSZgQz
         ERnN9Vl5gZt9EzP3qJxHsK754HZPoXtD+rCTl0WLfdzgGFGVA6Qu3Pc1iydumGZ52Ik/
         pYPvG16oK5nBJPUlhZ77uniT2ZDLcLJYUgTCHvFFtPEbs+FlkfeRHjPQVb/WgZASy28b
         9fbQhLxgwCKKMxfz3BnzrjaxP6IlQr7nnSU/Kj2JkCRpAcFSqtkUlcWfYbpqsy/io3o0
         HfA8gGK3mrFyesS7BXCeWxMo/RIhOJ6+k1ACP9SFi4hJAvpS4IfA6QSh6C8cs1T/KO0Q
         /Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763295038; x=1763899838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=;
        b=W20vaiZzdnb387vMIMx18Ci8K3XFxpVofJ4s4l2e8eYbMGfxYUWmNGDJeZKEPybYff
         0uLD/Rq6CU/AjmzOCMyicEaTFN+nb3eLHoLyE9XK1ddUht9AbYQ7+F/ps8oe7O4iFBI8
         NVxs96dmXmm0IaPdNUAIroV+iUfqn2VhgeOKlzXmVK5myl16nef+eHBD87P3grPJv6lc
         bNICOVnt7rw8p14ctESNiGBSBjJM9KiT5OvdPbU1Unf61llUt8qGSBGYBEjzOSEKZAFI
         LpFxLlxQCrSdWuWErC3YMLHWzGFeW9TQGc1yrb7dHfxv8hVRo08Y9CPdxOweZ0WQfo5M
         xWGA==
X-Forwarded-Encrypted: i=1; AJvYcCXkq37Wyv4kuN+FDOSHu9z22vjxeth/4n54Vti187ayv9box/DAQTrbwfY+P0GspSVOn1QIfKbSKMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Vf8e/w4cYtaZKMltc+cKB1cfhiIJlGsCDxrgJ7bP4XlIroze
	LGDQ66p/e1JQzy7xvLR5h22IVEsalZfCpwJP32ne9jTHPegVgaYB/0VS
X-Gm-Gg: ASbGncvsQeKbIw+cR2iBAT5NBZ7cZVM8jzjHS8+ThE8XHSB0c9ee/l1BFckpYTcP12v
	KjKl78EHB70DD4jtNL0auAUr1vExZBN/toEv+qIBMvxGN9x5AwItVAN8VLlIXzIMgJ12orNRuYJ
	mJRrPZVyeDtxzxvkPuq/n+8GPtNvKfxNAcTPpjhVLZPqBQz2jqOno9v+oGfYmOCoRGmb2bST949
	2irBZmLEsvei92jnz2nfheEhPnAqdSU+lnp/zfnCdwUNQ9XeSYpZ8neJK1u1fFHUmGenmfl8q+H
	qIK//k4gf00V3ZGPDJEuHs38pwMO0JxJK9qtEjFUB40qURo5p+KoXW05Kg1p8oCi1Z8VOX21N9B
	tix6Atvzd8/0DZh+PPuuD4/cUGYVgyWcbIw2PhU4kMrr1A19VkL/kjOMDrmHH+Anz8R5HCoXlbz
	uTQCAjDJQuKqqnGEIG2jYl4KhDzerV+QMavJ1FFTT94UlWoldGroTzDW7tEg==
X-Google-Smtp-Source: AGHT+IG5Pb4oZTy+N/ijhNzo5h6b+rv9IQmhgKS6Icb7AJg8wd0rdoZ0YkfWkZADk7dGg/KIAneikA==
X-Received: by 2002:a05:6402:5112:b0:641:9aac:e4bd with SMTP id 4fb4d7f45d1cf-64350e9ed21mr8531044a12.26.1763295037690;
        Sun, 16 Nov 2025 04:10:37 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1fadsm8008375a12.31.2025.11.16.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 04:10:37 -0800 (PST)
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
Date: Sun, 16 Nov 2025 13:10:35 +0100
Message-ID: <3659815.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <4691137.LvFx2qVVIh@jernej-laptop>
 <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. november 2025 ob 12:49:45 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On 16/11/2025 12:44, Jernej =C5=A0krabec wrote:
> > Hi!
> >=20
> > Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni =
=C4=8Das je Krzysztof Kozlowski napisal(a):
> >> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> >>> Allwinner Display Engine 3.3 contains planes, which are shared resour=
ces
> >>> between all mixers present in SoC. They can be assigned to specific
> >>> mixer by using registers which reside in display clocks MMIO.
> >>>
> >>> Add a binding for them.
> >>>
> >>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>> ---
> >>>  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++=
++
> >>>  1 file changed, 44 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/allwinn=
er,sun50i-h616-de33-planes.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun5=
0i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwin=
ner,sun50i-h616-de33-planes.yaml
> >>> new file mode 100644
> >>> index 000000000000..801e5068a6b5
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616=
=2Dde33-planes.yaml
> >>> @@ -0,0 +1,44 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de3=
3-planes.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Allwinner H616 Display Engine 3.3 planes
> >>> +
> >>> +maintainers:
> >>> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> >>> +
> >>> +description: |
> >>
> >> Do not need '|' unless you need to preserve formatting.
> >>
> >>> +  Display Engine 3.3 planes are independent of mixers, contrary to
> >>> +  previous generations of Display Engine. Planes can be assigned to
> >>> +  mixers independently and even dynamically during runtime.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - allwinner,sun50i-h616-de33-planes
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  allwinner,plane-mapping:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: Phandle of Display Engine clock node
> >>
> >> You description is almost duplicating property name. You need to expla=
in
> >> here how this device uses them.
> >=20
> > So I guess I can copy commit description here? It is needed to
> > access registers from different core, so it can assign (map)
> > planes between mixers at runtime.
>=20
>=20
> "to assign (map) planes between mixers." is enough.
>=20
> But it looks unfortunately like a spaghetti.
>=20
> Your mixer binding references via phandle this planes. These planes
> reference via phandle some other region to configure planes between mixer=
s.
>=20
> Isn't this the job of this device?

It is a bit confusing, yes. There is no clean split in register space
for some functionality. Register space for this node on H616 SoC
represents 6 planes (each plane consist of framebuffer management, CSC
unit, scaler, etc.) but not actual registers which tell to which mixer
they are currently assigned.

Best regards,
Jernej


