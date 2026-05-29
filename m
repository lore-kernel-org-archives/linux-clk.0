Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDD768EA
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055525; cv=none; b=ThWlTuQ9+JkTxdS+iISHzMWtQTySNnXQ+L3gp7nRE8OKMHizRJD56gMxzloUu+56GEwOBj0kPn6aY4iwzwJgN8kwx3B0z+JklIECCykeqg8nPXzzjHavHX7F0nXDQOwB552yI4AS4tGvzKtjDnIIvJ/Fn38Y20ZNxVdchHeqjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055525; c=relaxed/simple;
	bh=uQ4PvHJVfbTOZrFWm2Q/Py0yYq70+Va6RDcoUzVbHXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ss9TP2rWveUzy48vulHMrIHhgUvzkFz6qyybIu+1Rs7tLQ713sD2L9t9+uZTTVfNSKZJ7PRZ5DyCNEnUVOsjTiOu1EdAjX+r40jU8e9ajUGy8a+UcPsuGxrNo16rw02mHWqy4RUiEGMOJ3zpZh+o4+X2Kakd4o1Hx4rOkjexWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-69d96e2d14eso2193133eaf.1
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 04:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780055523; x=1780660323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI1s7RBWZ86LPvUzgArfAozo8RX0QfMdUCXZm64P2Is=;
        b=E7D8VL6eYa+y1BfQp4UtvAKMg+UFteRyYCYX69ffpl5dsC46C4NSW3dFFHrd9USwIr
         b6ZEuaTOl1OqUyK/lXsQDtg5GH+99gxzi/v7VINi02umNBfIQmhJ+RNoEy/fvX+nPo4M
         JOOqaoDR7BVPSYx5RF5RP8DBdDTqhyJnyqJeDzAFfb1GvicUDmHeb8W6ODknzlh4aMqq
         Ny8tAqz62zyaObMg76qCTaxd8bVJ0zaz8Z7gA6kHz6RSf1uft1MKwtEAub6wK9rM6LL6
         wSMM7mDLHdi8qoUSLz7ocneycq41QgTm0TnfETUIfqidB46koSql41mRq/wTGTdRpbSx
         5pMA==
X-Forwarded-Encrypted: i=1; AFNElJ+iKap7aQqnAmEsItj887dNvuFawW5si9fn7vTMmLYben0OMVL0kAhuWOeAV92rKs3Dz4C6XU/x/OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQCOzuliW6ecRwykoyIz7CV8sOmbIrBXpaen2D03XSsaq8tRj5
	Di3AZOTrxZCfQ1yQIE29dT+4jD1PINpMC8PGFpfyZ63wlGpHC8XmLLq4eYJHbqNo6AE=
X-Gm-Gg: Acq92OG1TwSEN7mxJVLBT+lx0V0lSmTYUVZpPaqqHkEeF5LP5PyQX55vqUgJWIw01EU
	Fqgk613db/tLIoekm8PZTSxLLHkJPU/7MJRdH4IxqyaHjcHqjoR1iAibJnsce+UnKTtM+ddGtv9
	Xh9gAH6Y9nNFhudCh28vI6tsj3OiIvM/OuH3y96nPaFtmodaDrOJk52ZC9YMUpjoQsoRmcQHXEC
	osXv/8dRKnIkhdLVodFA5Br/xDVRpX7V2+NxhEMUXmzOeDYqhgvt0/xlVNYtQLi0eZC31Iap8mR
	+fzIGmNzw0FYLVnEtu99M1tZ7OBVCCRrfwHDsi/yVExB1rc9oL9p/yEvy4M2FUSm62B5tgtloDd
	jFvkvv0OoKGIx4T5rUIjhmlbZtN5pOLImjB6wycPySQCYSbTSggmnid5tPTRlXbL6bEmnFd+fzu
	SASNEqOkeTycxu/CBWBTmRiy7t0IaWqD18JtaT+rGyfCvwX36+lpMFFC6KhhLlF70dRtkOfkI=
X-Received: by 2002:a05:6820:4df4:b0:69d:c9d4:58d6 with SMTP id 006d021491bc7-69e03eff92cmr1266915eaf.13.1780055522849;
        Fri, 29 May 2026 04:52:02 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e069fc279sm911405eaf.15.2026.05.29.04.52.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 04:52:02 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6128bd9b3so3806666a34.1
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 04:52:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/RFBWk1dQalVFFZnGwVq2K0R1jye5kqZGrTCVJ/Fnr10KmLMe9LmG6G2XcH+W3S8yoPJ2D6I7mNW0=@vger.kernel.org
X-Received: by 2002:a05:6102:1591:b0:650:aa33:5dd7 with SMTP id
 ada2fe7eead31-6bf2d2f8f9amr796853137.2.1780055139478; Fri, 29 May 2026
 04:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <1ba6a98ace4ad9525d054cbaa308d3aeeecfa22a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408113217.GD1928916@killaraus.ideasonboard.com>
In-Reply-To: <20260408113217.GD1928916@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 13:45:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZqJw=T7voOnJjsh-Y1e79Mr9wK6zoGxwojzidDxMycw@mail.gmail.com>
X-Gm-Features: AVHnY4KloFUS2B9LQzF4TBeNYZgidRaM7YLq9hAhtI_KcqQjkDOZSbYAGjwtGrU
Message-ID: <CAMuHMdXZqJw=T7voOnJjsh-Y1e79Mr9wK6zoGxwojzidDxMycw@mail.gmail.com>
Subject: Re: [PATCH v6 18/21] arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
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

On Wed, 8 Apr 2026 at 13:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Apr 08, 2026 at 12:37:03PM +0200, Tommaso Merciai wrote:
> > Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.
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
