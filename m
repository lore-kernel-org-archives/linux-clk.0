Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312C440A24
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661296; cv=none; b=jbPxb0rTKKaff64dfb1iCKIwRJJuF/r2SkHWoZIje/fnf8pJPVLHw3DAZR7+fkywbo30u3rJ1lQmmswjKTXt0R113rGlGtehDY6DwxRMtKyM9o3jscPv7uaYkbPR/StrMlCcfgf04MclPS7+IDUsTUd11//k8C2rPltYmtJwrGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661296; c=relaxed/simple;
	bh=BcysfHHMDstXivbjZE4dC1w6FzsNC+WZrmqLRhvz6SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cF/axjLaWkNkG0bKfs6nb2R5PS0dm9Rmjy9ARuetNMKyD7xNToRDFkJ0/APPWpC2UlddNu3C2bx6nzCaTwF6z/kpb88TSdXOOlnxVlHb/hiFxRdrmJbCHzDpncCbr//jBbHFKtjypn/gC0fnMSlH+OC/XvfMtaxceQM0qZLVOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73b909fbb6bso2884075137.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661287; x=1788266087;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FAuCi43bXWigOjfK7f2CuiM69Vlx8oB8xWxV6AGHKlM=;
        b=Bv56TjlpaUnrXyOz3tFpz/hVgg5QxZaJuDS7zfEIhqiKyUQVPcZ4c3JpMJ+XDjZET9
         2SP/DrQGPDTdzmS41cso5lHgdSmeb+8xmkn6bgjBsY5eiIbBAIAZq1w/3TNiQtU8puAf
         GxHxO4l7RquGGsv3OhB9OziRDMKeP45+l9Q6lrd5EBwLD/kQoEQmbTuU9uO/2VzEl/SE
         m8MnzWgigjgVwWBibCgCGn8hPVOZq5EPK6VTn5HDGwocXybqLh6yCwa8FXDIkQ0SFM5N
         CYoEX1v+mlHw8djbTT3FwcVD2WghYJuMhPVvePaPYAXmN6Woz3h00YL9VADPU/T7uF3o
         yWBA==
X-Forwarded-Encrypted: i=1; AHgh+RoYGQGs58vFEYTs/sUTT23Xy5+CUJD++BAZc37sG/z2MXUQZfQo4KQQumv0uABC2iSKRshYPdVc3ZY=@vger.kernel.org
X-Gm-Message-State: AFuF++nop9PzbMx5lq1jR6sXzFmTR67i+0wPYRBpjiwVgMNNOgEvCwxD
	7KVAh4hSw2JdbJnRF1Hq3HmdtFqhY7TaDubaj+cXJ2M5nM0OARA7DYscnojlcLJ2Ed0=
X-Gm-Gg: AR+sD10ZR5HF2OdAWH/iZmGyYo/jN8G+zt6k5K2HqVdmYU6IYYjPZAjFWY0NvnVRtPh
	m3jSU9fLBGAlgYXfdzRuv4DqeztpZlnQDj+PQ9l6gqmYczN1sq4rVfO1SoA1O8coy2POOsonss0
	xGy0wQN8HZUvDyElr0Ox79tXWF4YBrLDEqGYRlJzS3J6IREWcaReABqJ2rxyR9VLdZQnxUui3ob
	nRzKQYl93TV5OpivOyVXQlDGbbOO5M/lOYa4iknGgJr9BKpCNRS2KWcidwweFBpcx/2wGeB18OE
	JaIx2r/WtN+oU0a7UD36qd6bEyjf7QogyaXpN0MgRiWZPZBai0MPN/vgeVUC9lgHQLm4ZesuzWH
	Ahp89wG1oH1jUzzMBBNIXcv1ZL5XT3TuLxathB5UBAQV3OQhP2aocr1pKRu0vQ8IKJ8WSxbOytb
	qzV8GRJ+mqaEJ8bFt1WvfxHN6p7z6gd1Pfdqy02wH5yuf2IaUC819KJV07+flIahf8ioSpjT0eM
	cL5z5KFHxTqh675keuRSbMUg5MhKzHu/sC3
X-Received: by 2002:a05:6102:41a5:b0:737:bfe6:3b03 with SMTP id ada2fe7eead31-77a637411b1mr12240621137.7.1787661287592;
        Tue, 25 Aug 2026 05:34:47 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d85bed310sm5508741137.12.2026.08.25.05.34.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:34:46 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so2614810241.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rok+dHInchMC0+Qxbw67Nnr9W957hH0iEI41/tlZ0jX2nNBjuWHkg6JoUlASxy+IEwBYAiYSYLJu7s=@vger.kernel.org
X-Received: by 2002:a05:6102:3c9d:b0:77b:b14e:b6c5 with SMTP id
 ada2fe7eead31-77bb14ec487mr9899299137.9.1787661286517; Tue, 25 Aug 2026
 05:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:34:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWL1xCSQn4RxL0ZMbu-AK0LiYqE6auPte=JMjW7V9-Arw@mail.gmail.com>
X-Gm-Features: AcwNN1UVUdruDxPmpux1ubwC61QQoEBBzyg7nu52qu_lQAz246VJGDaKtvYgKE0
Message-ID: <CAMuHMdWL1xCSQn4RxL0ZMbu-AK0LiYqE6auPte=JMjW7V9-Arw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) resides
> in the second register region of the CPG/MSSR block. Since this
> multi-function block is shared with other peripherals, it is exposed via a
> syscon regmap interface.
>
> Look up the SYSC regmap using the optional "renesas,sysc" property and
> derive the WDTDCR offset from the watchdog instance index.
>
> Retain the existing MMIO-based access method when the "renesas,sysc"
> property is absent to preserve compatibility with existing DT's.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
