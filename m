Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26962116F6
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763294453; cv=none; b=fLoWKXJO3dHw/ppG9ijQewF4NGdQmTZYWueBi5IFWm9ey2Ob5Y6vnWRYtrKVOVF+1/ddEd/rGgtOB+bdNpG80uN/w3hH9nwwnry2iTZcbziewSdViG4dAF5PHSaG8FNVGgKnNr1YPq1Mko+3KpNvbS2o52Zf4+ykP8WFMpNs5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763294453; c=relaxed/simple;
	bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EOBgnxyv2b1qUmeZzx15SqEGn4iq6s2H4UWw4w4dbHPxn+5JqheV97dVwcL3+QxANxO2neH+meQDJxOZ9BpNopYnXPUl96HVNhQf5oL/tRM2jQZhyk80iYfS3STfzKl5y+vWs0+2sYyzoQgd6o9mm0Qf2OIjwLJ1Gk22salDFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVmDcesl; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVmDcesl"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so6107729a12.3
        for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 04:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763294449; x=1763899249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
        b=CVmDceslEFS5KH+2GMFa/SQodalsWRgxo5DoQiqFkYiKfg3wDkKlgYqkZ4Ag5M5BiT
         r2tlKSmhLSaiyvmFXGNGNJUDHQy3mG2JGCnAvodh9Uza2AQjtIQtAvXXk3q0W/iaPr7G
         EN0x/s/hspGBtclwuMWueiewiJwlr64aD45bcWc2P5Tyb2ikTWFSGlMtwOQKBZzcaKSW
         JOdhKg8GpXOrPsDbsjG4EmCmHKIyUyZQtCVDXVjzU1SJTSLUGMA1EAdD5JOkKIW54tQa
         pT7CtXDbCEohoS5svEiPPwSb+JcImTj+xHKChMdL4fzXvuoBUivz82p3AFKRZQQbYYrG
         fZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763294449; x=1763899249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
        b=M41HnDiOlrCBuIpJBcoCOb0wk3TsghBcXJ/p47F94YlMSP5f97/Cr76NZmiaP4bcD4
         OwzRurLfEWeyZwuvi4ZivbukJJq6Ld4SqYac4jW1u69hdokTLUmi+Czr+xYpw2be0DGa
         g8q5qbxgcBGkBdkBB+lnWhzNdtcEcC3zO3NXqoiN2Ai+T6EK+yEEKKos4eh5sCxlp9xG
         y0vtflYOs3Zy86tj0UUa92kjSzo6/4Gh1HHQXt6P54zv9gUEifLs4IYeGMuzSpPGmNYc
         D7yQBuL5MZFXjMMrF2R5r1AmPd6qi58NUYd4x35L7C9k1KX2gCY5c+hjY5tJb+lde/dN
         opqg==
X-Forwarded-Encrypted: i=1; AJvYcCV0ENwJLLqQZfbFiPbbPA6Zd/DBIE583S55AW+zQsf2FIs1CFV9Pv6u3Agf6E3Fuv1ln7clSF+Ku34=@vger.kernel.org
X-Gm-Message-State: AOJu0YytR0DOZLRan/GcZKfmvHPDR8Moli6VxGxFp982DJcnxZVvRTIt
	hXTo3qKcw2QKV/0/80l7mJh71qdQNjsz6Vnt7MqscZC7sVegitEoXnXe
X-Gm-Gg: ASbGnctYnRlJt2ns58GY65rySI0LPxO6JXCYK01k2BEnAPwXzJ1R/RjpeZgwR/vqXOU
	jpC87WYBpaPSdvyQ70V5yHWQT0yv6HBCASmQ6fF8zCGiQ6PwDj8nZiMFpJCJiqotiUGO8kUPDon
	/uPL+b9P8qMUrhadyoJUij5ikC4OrEgU8bPCrIlBLlaXjawWaUZASt6NFnzCdq/yFocO5rVq7rz
	0XgDJzoUq3irpjEXc5A1n76G/TjthjFdm4/GvrWnvKmm0rwZs1dOQL3dckHUCWBcZpiRyDH4fg8
	GwC53gw00BICism5QRliTOIZ617n5y0OWhEdvdBIL1R+P2+xloZY7Av8bgpDkNcRdPy51ywS+2N
	tAd3pD8r/zkKDYxqJwoRFb9YiXjSWULltQz5ZsbX+Cy8fLT7nKKl097yLyjR7VL9WDJbv3v2ccF
	eTNjpqnmuNbC2AccKdIyslA0khJBkAU/ZiW9hQ0aFBtzTr1l6qIvHINvqQs8DceywGi/d4KHG+6
	gnuvS98yezZN9do
X-Google-Smtp-Source: AGHT+IFWFubjCIweyb9YCoKzVFcXXsXAAvddERhRBpi3vJIG1VQ4HjCz6c3ATn4RBI8dMcQCX4ffyw==
X-Received: by 2002:a17:907:96a8:b0:b73:989d:3a86 with SMTP id a640c23a62f3a-b73989d3e2bmr79438866b.40.1763294448767;
        Sun, 16 Nov 2025 04:00:48 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad48dcsm826174066b.25.2025.11.16.04.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 04:00:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject:
 Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
Date: Sun, 16 Nov 2025 13:00:47 +0100
Message-ID: <10753322.nUPlyArG6x@jernej-laptop>
In-Reply-To: <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka>
 <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne nedelja, 16. november 2025 ob 12:33:55 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On 16/11/2025 12:33, Krzysztof Kozlowski wrote:
> > On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> >> As it turns out, current H616 DE33 binding was written based on
> >> incomplete understanding of DE33 design. Namely, planes are shared
> >> resource and not tied to specific mixer, which was the case for previo=
us
> >> generations of Display Engine (DE3 and earlier).
> >>
> >> This means that current DE33 binding doesn't properly reflect HW and
> >> using it would mean that second mixer (used for second display output)
> >> can't be supported.
> >>
> >> Update DE33 mixer binding so instead of referencing planes register
> >> space, it contains phandle to newly introduced DE33 planes node.
> >>
> >> There is no user of this binding yet, so changes can be made safely,
> >> without breaking any backward compatibility.
> >=20
> > And why would you configure statically - per soc - always the same plane
> > as per mixer? If you do that, it means it is really fixed and internal
> > to display engine thus should not be exposed in DT.

Not sure I understand what you mean. H616 SoC has 6 planes which are
represented with single DE33 planes node (see previous DT binding).=20
Driver has to decide initial allocation. For example, 3 planes for each
mixer. However, nothing prevents to allocate 1 plane to first mixer and
5 to other. You can even allocate all 6 planes to one mixer and none to
the other, if board has only one output enabled.

In any case, plane allocation is runtime decision and has nothing to do
with DT. Since planes are shared resource, their register space can't be
assigned to only one mixer.

See [1] for example how this would look like.

> >=20
> > Describing each IP block resource in DT is way too granular.
> >=20
>=20
> BTW, everything is update, thus subject is really non-informative.

I guess "fix" would be more descriptive.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/blob/d93d56d92db52c7ff228c0532a1045=
de02e0662c/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L181-L235



