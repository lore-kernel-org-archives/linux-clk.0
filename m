Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F272E2850
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515931; cv=none; b=gGEqNNsGRoIwg23P1EmlL5ID/lKtud/YzF6S+SbWdInesAsac2BOAc3Ic3VZ3PekiM4u0KB5COCIChlgPtbDzIWuMG2Ffh5rMkKc6wwUdLpVXXjOGl5WPW+SsTpEJnbW7SeAnpniXbHfabcxdPARK/BA9DwLz+hMmOlw8ENRzPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515931; c=relaxed/simple;
	bh=cokh81Cx7W15QrHxXBRjalQp7kxTMzsuksUx0kqLiGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMqNNLNH7Tze3E+KpRAx0PYEsNi2VXyYKio/vpPI3ba8Q8jVffklcpRNoApKVdjnXS+9tPKaYjoTcfiPnfvNlORA4Hj41JXzsiTV1+3JjtRMvBCVcoGjGEwfptFB6DHvISKEKbEjki+Gi5KvhWi2kKta9T4PGowwbtMDlBkgaDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccea53f35cso39968666d6.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 02:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781515929; x=1782120729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekHktY4/Tubvm6BgE1BfS1UNgz1F/icrKZN3pNx8f0Y=;
        b=LEQTCN0YlfEdqYufr2aBK1RjNO6Eu0VYEa7m8meQ3pLVtrJf/VjHvDtbcIdodNanhi
         w+e/Uz3ySNyU/MdOwm+BpvQ83++4K9NHAdPOdFqXZKFnNdmRVEh6/vmMS/6kUMDphhGx
         xCyQZtNk+yxveOhi2GPl4bF8WBu4k6avkDB9Jk1GKyFHKyXa3kg5WFSDuHfmObnaSEKi
         NlUNf2BKCvFyWZOFb608UcQro7UwodKRlQ2+UMw9yrhI3XqOqIaRVaiWN5jzs8k8A3OT
         blKjjm8CEdGk8M5O+DWcFnPRZuxQM/68kJuBWWayEA3/U1MJgq9Csh9sMCEvnJwUgOg3
         1mPw==
X-Forwarded-Encrypted: i=1; AFNElJ+8fZUBV/K4/97FbA2AbbPB0Q7APDRlU8xOtlJG4X357LucUAOD8Ar77C1U87CUx3nUJ35L1vLijuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHOVQZojAGkbQhkfS5/i5JniolIMQ3LWnmRZf/hrPNftpJKDqn
	EdSies/7Y/8qhCwD2IRgCpjn8BnZZCVRnxURE5TRKMmrqYiWu+Nw+B5RWb1U2alH
X-Gm-Gg: Acq92OHEUQhMIFH6HNqN6fhnazQqzPaVomvdy2evHYFO3Af8VrnVuUOcSlDnYw5GFdi
	xr7qpiuPIz7YjHkMyxFEBftdFRTyJHyvgo57Yg2EOTw9bP2ZKzH0zdZ7dMPesVUTf0CABW1PiWZ
	Cwd3ds4AcLboqCka0qG1b4qvZiQ3zRpD4qH4n9LosoUgh6VwF1sOFqZMVwDx+qq2NdYNC42KNgJ
	cGJnuNG7/Saxc8bOmDAbw1RylCOE7nCOEo22Gxx1PQ3HkHEmxYdL9dMJO2gRswgE12B+tOXmZyG
	Sl5HyCNOelbfWhKGEnJe/Qg+ZkEoGUHeQAMOXiWysgWDd9rPubXVgdWs8VWr2k0I9XRQGXKCH4t
	1mKDsoL+rf/I/p/OQkVDgwQlH/5gypEsTCe1bVcW6MNUfFBK2uksKWZs/RFXBZHRSlpaNGrX5jY
	WcbMq7rmuH0od18AyS0ftWGQMDyxNoJ+s6txNrdrTdGpJRAplfvtewW8qZ4d6uejo6LwNFnqblW
	Qc=
X-Received: by 2002:a05:6214:451a:b0:8ca:25d3:bf41 with SMTP id 6a1803df08f44-8d44d04fe38mr163309566d6.8.1781515929189;
        Mon, 15 Jun 2026 02:32:09 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d300f6b1c5sm110066016d6.3.2026.06.15.02.32.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:32:08 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5176096116fso38069991cf.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 02:32:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/dqrL+qJ8MTows5PFv0orOAfAM9BUNPuvJbXkHqYRvy0bzDLFgha7b/1giZVl2VQxYvzLjQvr7lXw=@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:6c2:e290:cc69 with SMTP id
 ada2fe7eead31-71f60e0fc5bmr5388435137.23.1781515508903; Mon, 15 Jun 2026
 02:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com> <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jun 2026 11:24:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxwvDmRqsdbA_ReCnnaDWbzzTKGCXw-64U-bSJfgiy7g@mail.gmail.com>
X-Gm-Features: AVVi8Ceq73VEJddOjmb1j9jjrYgT5rbGI4-mYSdD7C_MYewqPqxZACymjTcgJ3U
Message-ID: <CAMuHMdVxwvDmRqsdbA_ReCnnaDWbzzTKGCXw-64U-bSJfgiy7g@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Mon, 15 Jun 2026 at 08:28, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car DSC Display Stream Compression
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +description: |
> +  This binding describes the VESA DSC Display Stream Compression encoder
> +  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
> +  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779g0-dsc
> +      - const: renesas,rcar-dsc

Please do not introduce new "renesas,rcar" fallback compatible values,
unless you are adding new support for a hardware block that is present
in SoCs belonging to multiple (nowadays I would say at least three)
R-Car generations.  The DSC is only found in R-Car Gen4 SoCs, so
"renesas,rcar-gen4-dsc" sounds more appropriate.
However, so far R-Car V4H is the only R-Car Gen4 SoC that has a DSC.
Even the very similar R-Car V4M does not seem to have it.
R-Car X5H has DSC-functionality integrated in its DisplayPort TX
controller, so that seems to be a different implementation?
Hence that rules out any family-specific compatible value for now.

The rest of the (system/core) SoC integration LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
