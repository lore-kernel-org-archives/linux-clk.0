Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909843502AA
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104576; cv=pass; b=HxQ/bf4fFP8cCcDazTUxNvYUYc5psjHSFsm6On1iMnbLLtCo7wdmQSEB0iUnPV7ci0cVyOSzZZWTfwWIpMFdehQeOZHMJBwoJPit8VS5EpFKmApmSlY8Mgy0AFXYCfZplTrmX9zldwU+YHUs0HitT+wgge4DTI2F00lYa2XNhmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104576; c=relaxed/simple;
	bh=eJ6iS27yRakIf4dYz6C/Y0DusUAUtD+ryR5U+Q9ozcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AV1AVoXANY2IKkKzdqpJRWmIzrjRQ4v+yyxDVXJKkEb9VHr0L6T09G8KCmaBtuwB/V1W1CrsJpAq212yGCZ+y2biq97HcQok0fFt/v9CUM+QKRMJtf4WpP8NSFYaRvis2VFCNh9GQk1+6P+eqQj/RG2k2AZs6cAWBOA8biJMzaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJypSdsG; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJypSdsG"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43ab7bfaa18so310048fac.0
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 04:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779104574; cv=none;
        d=google.com; s=arc-20240605;
        b=CsVlBR5KEYsFq0LIHW3mWM7UXkr0fbhMCng/xLpUQQpMGTs6LBk/tdhKYXg1rDiU3c
         XbgoiEJ3y1OwpviMxDbRSXUyjMMpUZTWZxwi3rqtQCM68pe+Un9Vm798uPRKEicIfujI
         1xY/aR6aU2Cnv6Wk7yV/C0LTUO00e4lieDXrXJKT+Sz/m7OceDGz0kBkzObTsgMSUa/p
         X8IR+h7EE/utigQzs92j+Sbblqg20hlZuWhR9koeY7c0m1KUX+cj1limu3TTHIPePxme
         liTQLFPSnCEHZFzNBEtY+WbVqb2PfDORkuR18CJ42+iq2uNVPG/dw0M3yo8XugbsR9xC
         qiSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        fh=C8HiVsKJhcrs/cjYpixspcK1Hlgj1F74hXW/Mmp+T68=;
        b=ENAaiLzR0K3zmTIVOJp7TzwmngwgNPSL5gtJgOoCbZ4zmPp2Q1NCNGnny7rmvvQh4B
         SUA8gmwwHAPliL8lN8LlG4iKSJJpyF09UnnGKElVrRC+MvtD9QdBwdq6BZ3DeVtAJ+6g
         OtjlqoZleeX2VpXvJ0f7g79yuT6umKzqskTxt7uABVwN72OuJmb0o3Ru4n04CwqIKdfZ
         eZrJY3B0Iqy519jDCwJhSOBPFd0isVAlMygBjZxEYivnaLwRFrT0lU/Vk9nCLbwl5ybQ
         neRRk0OE/BrfE3vYGY4AAg3yy3VHXUG2q7N2bX/gn7zdeP+olMcFLJK4X0D5+NBh6GFy
         rEpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104574; x=1779709374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        b=oJypSdsGgLKt7n+LzPPxnf6laWcM6lAH+TuR15VSIhwssuo0/HtCkolSB2MmOEVgol
         FCuzxrmIQIWVYaNWR6yC1uSQ/RT2lW0sRyugmN0cNgtds7m+FcXCunlC/d5XmQ/RDwYY
         C4Rr3UXjACN3WCni3ha6RVg8to9uJ63/elvS6O8NX8up/tTu2D+T23yECCixNP5N3bTf
         tHLAutIADvjhxnix0AD9lmiaQ4VDsATOQpZnO7z+lBfcepLMvHgSMUMasRbVrbZs5kWg
         /7azJtaapX0zmZHx8MW59K1VsLaa5tG5EnrO13Fe/TARHIr1/81cxpRvvCRqC75TcGEG
         TVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104574; x=1779709374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        b=aGrO+6y6t2BqXn4RJbq/aozO3eyvFvddleagUeXGatjiRrzUzwrA5+w5Fke7eApmhJ
         Hg/DX3lJJEW/Y43WCWQmhkzMsI/lcp88cLAfuobCzg78Nf9xHqM35xzpiSYvPHW7ne+X
         WScT3SzBEzyXC+7PBsVVQAhpR2z9Rx6NbPf1/kMmbvweliXS/1WXSUVQIF7sVsa8zQ0j
         ragNFtbCHQnHq58Uw4LHbaE+PyXNd3dX2QzQ1OsbHDJyZi/sKbSbvZ+Cw8x2fRYs3T7q
         Dp9T12uXU9stPHGemBTzvdCrBI/JFNh68fjREeWtmaqtgnGp/0yZA4rhh61TQIvh+xyH
         Uw2A==
X-Forwarded-Encrypted: i=1; AFNElJ/FMNUZSblUFRP+WwePaVu5nZtT7wJtnxJn8MtukX9oBgJ59NGBpuAisQS7X7l6Jhau98Al07I4pIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvLg9R7SoQL7uagfQeurHTQSRqWnZNY4ZijrVpjMFtOpmfZN1
	5v7Zx3BZ1B8qABcy6/EmzrCHxiZCYfqKlM1Xyo65mM+NRR/yhHeNSewICtrSv1dX+Sid1UvQrvQ
	8SDDjFaPM9nRD13/PCu+VRuIyPJxOslw=
X-Gm-Gg: Acq92OFlOxRaphou9E6ehxPY8cgr9EpVq9cWHdC3SzbQ85d9OtX6133No+Tv5mmvGsz
	sdJ+GvWehfceark+Iu125tBSZ679T1qbXhW9nax+i4NNeivkYoCpOT6WkLNGwp4haK603ALl1LA
	kKcbntALg12PnGOiCSPT50+LlLnH3aB0F3W7JLkM2h/4+ssHk+BIbVGPV5NHRNTNK0nAVPYNH4l
	SH0+ANAYIokbyRL7IGEq8lp0VT2XI2qc94burxPCCdmYhGaEo05m8JPejUiAm/f03L6A/8MBEQS
	WznJlPL925pmKTgraGB05H9vPA==
X-Received: by 2002:a05:6870:c233:b0:42c:711:a235 with SMTP id
 586e51a60fabf-43a2de6d4e8mr9184021fac.35.1779104574383; Mon, 18 May 2026
 04:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com> <20260517-cartoon-slather-ec5ad7605449@spud>
 <20260517-pulsate-shining-547432ab2ca0@spud>
In-Reply-To: <20260517-pulsate-shining-547432ab2ca0@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 19:42:43 +0800
X-Gm-Features: AVHnY4K5bYIE3B-YL63O3FZeaOtgyPunJ0_rHmAr8AXg2dK5L-d96T8-eA1kvlE
Message-ID: <CAJsYDV+-VprPUK_CJsEpEa8ifphmp3ztHga__H=QWLoq8Jv4yw@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for sf21-topcrm
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 4:52=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sun, May 17, 2026 at 09:47:26PM +0100, Conor Dooley wrote:
> > On Sun, May 17, 2026 at 10:12:56PM +0800, Chuanhong Guo wrote:
> > > +#define SF21_CLK_PCIE_REFP         30
> > > +#define SF21_CLK_MAX                       31
> >
> > > +#define SF21_RESET_IROM                    17
> > > +#define SF21_RESET_MAX                     18
> >
> >
> > Having _MAX is not permitted, but is also really confusing that "max"
> > appears to be max+1, so actually represents the count not the max?
>
> To be clear, if you need a define like this, put it in the driver.
> Bindings having a "_MAX" or "NUM_CLKS" doesn't make sense,

Sure. I'll move it to the driver and rename it in v2.

> and half the
> time this number ends up changing anyway.

This one will definitely change later for the two clocks I can't test yet.

> Also, squash this with the patch adding the clock binding.

OK. I'll do so in v2.

--=20
Regards,
Chuanhong Guo
