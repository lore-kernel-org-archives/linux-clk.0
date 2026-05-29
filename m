Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5A3DC873
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056333; cv=none; b=dpET2JbbIta+VsT4yRGhhrFfTIFSqPIw6txM8EWmB3A63Ui0ka5UV0m3aoZ4OUXfzIUE0AMictl2edgJQPN62iZWAhy5EpgSQ3ke4oL7DdMvaRRWeJCALsbjB/N1CyK2NR85lStUZcZHI8/09EOpMX0RgQIggvwoEThKiOp+4qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056333; c=relaxed/simple;
	bh=r6FrM1W4SpqAjwuFPfgTdnYMQZe9dulHckvJpx/ID8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxJZDgQWJlnUCj8eUiMmWbatrRxmbBTCgmljjsNLsT71ODgwiEu2aTpgoIUOBMFpZQkSIE4LFXmbBppyinD6CiAcDjp0VB4wSSzkvwZKfvLJ00Ie4mWeJk424t6fYYmQfN3m3w9DN7lFtTCtY6/KwItcCfD/4UtjitlIiINdzrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6c28e1511adso173115137.0
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 05:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056331; x=1780661131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OX8XoUF7IFu/te1KTNA1tAU1bbe6/Z6QcoLJKS7O78=;
        b=bZZU25K4SvtGjXtwYslDxiuQI45vUszEc1cUPKlFa6ja3DMMfQXkUanIkVxiTE66ya
         dEVzzC7IxwJBJpMfDf07FxIIKbayJtTjKGr1HrK2rWgxQguFRxnzZTUF2ieTLrIRwKXm
         Qb3dCkvNHv2R77eGGIsinUHMXv8wmle8EGSSdXMgn/PAFDBBCcblb1tHDZ10FHkKvmQX
         KbOLw2q84SfSVY/DibvFDVCl2Zhh5PxlmBF8bymtrbqm6pEnAQwTWPGAtqwtJ48bvxHN
         MO9t+uCT4f6k4+9qWhg1iTjSwaR3qtUWHiN9fJVX9FKfz5PVlqWUgb7k/NpRa5lXkkW2
         4/hw==
X-Forwarded-Encrypted: i=1; AFNElJ+cIH9hV6sVIOMfESTxOYB0QT7g6cuL8S1zSTwra3TsjTRMC+30c3tAVNnk1RU9aE5vB7zfXXXcDas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwG9epQoiiI6oT4f1jVDkC4lYtTb2M+P+H09zP1vPCu61ekTWX
	FcwQ194zC1WEN1OfG5CKz/JC+f0sJuds7/+CvJR/0yX4vMjPtlViCp4tbjkLrNGErSE=
X-Gm-Gg: Acq92OHrUHaFn80BIuAamVLqJd3Ui0O9837u2xNXDFxEeUvYhFTZU5CeKLzE5Gt3lnj
	aSBVoT+d+2fMupCc6z0ZeTPtPTeNzzO5EGWA5SxVPj5jTbDAdImkH6a7viX3kSISTa13IO45TkP
	p0Gcv1L/EZitpIHobwBN9CZGIxshWiYfMIRHeTq95BgM4EkDsPIh+t30D8VT/qrSUKquA9GHalx
	s1gIUz9DPGg1XQQUY8GU2kapB2uRCypgGFnBInASBZm7WPBMvjbe4vF9Rafju9MeE3IVpxvGyEI
	6B4YrLWL/NrNJQ/7pxFBr+jPH+TE9Lmh9ec/onAxJQBg/c3AYVs+r2DVPl0VBFXwzaJdOTz/ZaM
	yYvt2R1SpAMi/1RQYwQ6BSCmTKAMST3xs+RkXQvgJzN8WfLJD4uSB9Be2Z9xoFaNQHmAIrq++xR
	1gIqf+07YaW2chETNhVSoZLptK2reu1xgeEg9+NoLl/FPoev7jA50Cl7FPZkjgL2rvLT5f6E80w
	5o=
X-Received: by 2002:a05:6102:3e19:b0:604:f155:9374 with SMTP id ada2fe7eead31-6bf39268585mr977220137.15.1780056330896;
        Fri, 29 May 2026 05:05:30 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963abac87ffsm689990241.7.2026.05.29.05.05.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:05:30 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57512b86273so9891443e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 05:05:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/FevuvQC58seQjZmR5hUF3fhnJeymHWrVbUk8jhnN0QfmcA+LOahrss39m57B5a44MwYkieWzSfcI=@vger.kernel.org
X-Received: by 2002:a05:6122:4d85:b0:56c:ca03:b668 with SMTP id
 71dfb90a1353d-599f53537c8mr819640e0c.3.1780056329661; Fri, 29 May 2026
 05:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <46547aaff3cdb8ea6e17cf1fdec699d83a1cd71b.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408113358.GE1928916@killaraus.ideasonboard.com>
In-Reply-To: <20260408113358.GE1928916@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 14:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5xfpj6_5o4Ed+KMLg5MMDuaNUjsUBucrC3nCkkG9vaw@mail.gmail.com>
X-Gm-Features: AVHnY4JwL8_eHuTqhLIZ-49xr1MV4gGX3lGZE_rNlXQ8x2vrv47pvQNALVqlDj0
Message-ID: <CAMuHMdV5xfpj6_5o4Ed+KMLg5MMDuaNUjsUBucrC3nCkkG9vaw@mail.gmail.com>
Subject: Re: [PATCH v6 19/21] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 13:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Apr 08, 2026 at 12:37:04PM +0200, Tommaso Merciai wrote:
> > Add vspd{0,1} nodes to RZ/G3E SoC DTSI.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
