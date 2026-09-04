Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5574F30C8
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535420; cv=none; b=irz1cw7RFhtmpVLhZzwkkxtFBK4XM6Bjx8eGDdfxily8Ri2pWR+ugELsCOiWCDm1/lBZSlFjeT0i2mdiw6A5rtdM9pzmeggTEALYEEljkqdz2rc2AByve5mdXWLVA2ifovd0WgXZ7hCeBzGM2yS4tTuDmrZwHVszTUO96eQT5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535420; c=relaxed/simple;
	bh=nCrntIDhyuwP8BQpdMv2tSN81fhquB9QOVe0SeizZYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IaIpOLBw7qpUFjpvMLFzff7qldFopdgZBLxAgbL71PunZpiByrdj4+rsqK6fswor0h1r2hu6YENA8VJ/CTDTKS4lD4TGLtmWQCG5tJhK0dkedfzJkBWi6P6vOOqSjH4fTo2zY46VDzLxuuV+9Dsyf3HY4syeQlhhoCOPSiNGd30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-75e2905c09aso271486137.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535418; x=1789140218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mr7nrVkZKYZ/vaRmGYmX7E824Q9vDG1RqRG5Sn6gSeM=;
        b=gBdJb+2+T0FZmyT8QEJ/uOV+yzB1XYTFsOD4cg5J90WlCgcZx3VNxwsW7NGfBOWlza
         pZssaT06WHTPZ74SjvbrA1e4cwoWifhR58heTXkfocSk/GqDpPHmSPTYwue8Xu24AD4U
         O4EEx5z641yoQ+T/PcNNFPOScjITZoW/a/W3VkFltgX5o9fzynw/bwVLsmjTCc1HpYmI
         y+G3iblRTjNO3qGvPFeDLWVIHRE4i4BWw9mycS+s7ppyG4K0QFBSksF56tfEMz9DcxhR
         Xzad7g/rxD6ep5mCd6H6utl8dAqT3wqI4IREQdjlxOaC0xjjqDrGqR6AuQ1Nrs81ZoVK
         PW3A==
X-Forwarded-Encrypted: i=1; AKwUvBw0N0oUtrC2VOWQmSIMiv67YEnFVVg1hl8ReUuVaYb7YKnWn4fxvB9BPRWeN1j5dRPW6hUlkzV8Pws=@vger.kernel.org
X-Gm-Message-State: AFuF++lzVO6XdtkLukK+iwEtlO6KpImw/VFPScgitlPneBQBMc/AinPK
	5It0qaFYrFY69XacuYN44pxucB3ul1xd9YT1qZ0/K2MYEhwXH0HkjCITb7tX0VhT
X-Gm-Gg: AYBFou00W0R12cmlt/4HzLYIbVFCI9g1eFCNpd2JqgLkfYPU0EsiEZr7eK9uPX8UOZK
	pTi7zpZYsueAAGXIl1/XCK7F22XOnhhFY8otTl8fUsEy/pyrAjt046HGUlHSRab6RDwIzXw+1hJ
	xwIB3TFUrUv+h2LXTHRIvqYgt1QOCSaoS5+XBs+sxKlbttFTtr/hNLTPInwDpRH1X5eklhjs723
	31zTNv8w1O6V2gWAkLsQ8Z5bR8SmCED076e1/4i48hRyC3VrL+Nh3CT2PV5lWWawDhm2N+oeKa9
	WRbxpSi+JGBbcQvh2BCCT4d44UXq6MtG5RJLx0yw+rfgXSRSjSfkhBA8OpQz/jod5YZ61BqlPAB
	5ciqUNCdZb3acx9+QkuVCIPP5K0qmwl3/aWqA3S7Vn9p6B90y83wFlsvlRsLm2OKq5u8sJDdQZj
	lz/O6kAdC9ttW0XHzWZ83tW4bEh/3gBJUogz3i8Pygvxz5NyR+FmNgkXxqT3m34BUN0eoem9QP2
	Dq8c0Ri2oAO8X8FXIEa3oPe8QW5UeE6IcNV8NWh
X-Received: by 2002:a05:6102:508a:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-78a4a917628mr1890453137.8.1788535417837;
        Fri, 04 Sep 2026 08:23:37 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478ad217sm2011781137.2.2026.09.04.08.23.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:23:36 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c7afda4515so704076e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6fnhzX5axhqH6ugR1QY5C03eFVnR/2xQTptm8Wih3xzGlColQyZVVkfnau4aMNWkvcNfFjBgEa3s=@vger.kernel.org
X-Received: by 2002:a05:6122:32d6:b0:5c7:a3a3:a4bd with SMTP id
 71dfb90a1353d-5c7ed3a528fmr2695851e0c.4.1788535415032; Fri, 04 Sep 2026
 08:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:23:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyPbUEy1sPZWmosVtL9GQviEB+d8RW8Xus9wpxZREgRA@mail.gmail.com>
X-Gm-Features: AcwNN1VarzxavclKk9EMuPnWIySi6CxTEUYbBFaUC14MO-nuKk5tEQAZbU7dyfM
Message-ID: <CAMuHMdWyPbUEy1sPZWmosVtL9GQviEB+d8RW8Xus9wpxZREgRA@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

With the cosmetics pointed out by Krzysztof fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
