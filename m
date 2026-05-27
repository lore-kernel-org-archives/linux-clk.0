Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD073D1CDB
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886319; cv=none; b=TLYcILjtoefDONQD7aNj/6IpngmmQ4F5BNWkeQkMCBw7ZIDfU/XJd0NDVt6SyZNxeOKmQEGUWbXQ7T4at2VZ+aoHrqtSy9SxJtS6QR7Cthk11pN+hCC7Ao6Q3UvcH7RQy7uW2olcVByI7y/C0wXvvJXTsQdliP9ouxyMPC60uSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886319; c=relaxed/simple;
	bh=kqktGqpqwvczwM0VR2SPhNu80C/+HjpMr/FFlTiSoeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvHUtGb3Z5CcpGTkS6Ym1A3mgJRz8FwVKEOLk9Symg3GhdvIKJPZQDQ/FLcWOajVmd+vg5/DkeKxCGFUyLEeXrsYQj++kSSLAyDwhm/SKgi+psu2bFpRrvCS5+TSJXEW07oExDJEr3QfP9oiy0SB0Em7kDQFsurhMpZRd7O4YJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e615efd7d7so3839998a34.2
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 05:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779886317; x=1780491117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxoZNqOSzYfBwMiwQrf9ojD/Y5NqNn7W22JpIB2VCXQ=;
        b=TC6NbTBbvwn9/TYcxNx/c04IfceFyHSyIFnMT+12tsyLN010YLmXCQvCFbLxIO248f
         WRhOEU1KSJREgofMeJ+O5KlGebY8DGE+kEVnBdV802bPdq5NoSurosJAlxp956TLtCGd
         PP+kitWnEfEtWU6YLObDwSp9HqX4Kkx0d58RFurC1uHAr6SPAMZ2C5aVKQZOOkZjM+nB
         4/iddOlMzQBdoRM1s9e4ib9lcgCr90lmDvNA6o8RRfgTBPKG7d4zOFcx4qFAV/Ei4fM2
         +yz5jZ821942mLDYBy0LSZoEKgIDfa8h/L8jQhHh/av1IDdS4qm4cOmCweor/AHzfjnM
         Facw==
X-Forwarded-Encrypted: i=1; AFNElJ+YVuVSS0fnIyfJfLye7dbnJ2f6UnkJvpz8huLPS67KVmuaXEz/D3/79u5sREGMsSwbkG8WDMEdmFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hsyZYWTpkO3nlNae2oI27E0QubxuAxqvyRIfsdtylE6Hr1K6
	h9lOA4jzMf/4o6c/6MW95rjXBr1kfBnnw19OG9Zm7AWeSSfUdfqL0fAHfKg6SU/sCk4=
X-Gm-Gg: Acq92OH0rkmSI5J2gnJ6XeSpipcmICmCvwUQkOI4feuG55deEj/rGtbS/8EtrwAM46D
	hdRLahadTJi+UD1gC/Os/t/FZKuKCRDrBCmHVLdP35kwax1dec8CfJ2Em1LrrXpu3qgy6M6u8OF
	h8e5s8yQ7kDta1UJbboTVBZ7VKASoufJV2lps91XJCZRtdh6Ri+azqEHtyalR2hWqoRGO6ppmFA
	oW6tCXRg1DJz8zJY6Dwc2p0MpteeD8efBCKopV1sznyOxqdKHCAzzlsUA40riqzHVzKjZgjT+nV
	fvQGrtHpTLu4Wki+NhWrsTOlH9CluAv0cLwsOXpX/ltQoKXGVICm6AGswhdS4FmgEjWESjRTrs5
	5ovZWQPKdOvcGaVvQFc1j2FveM/7OifeIcRrW3d4+GPhJ6JIvOL1W6iK53bUf8ea7TSgtuJh5Np
	jmaBlZcmPIuFexN96vblWfijbKSMlWKPWYHBWl2Ej66395fPBeMT6dVvwm5jbVYlut2hp/B2k=
X-Received: by 2002:a05:6830:6007:b0:7dc:d0e3:5bc1 with SMTP id 46e09a7af769-7e5feeb9b5bmr13646342a34.13.1779886317080;
        Wed, 27 May 2026 05:51:57 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e60648257csm11513158a34.9.2026.05.27.05.51.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 05:51:56 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-439acb393f7so12937742fac.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 05:51:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9tr3WQm2JBaqifYATFmBQ0oz7/agl+VaK3bmPbAXEAju+X0xwZNF8hLHHJxob9l5PBU28prcTgllM=@vger.kernel.org
X-Received: by 2002:a05:6122:2203:b0:56e:e80c:bb25 with SMTP id
 71dfb90a1353d-586649efacfmr12944471e0c.13.1779885965769; Wed, 27 May 2026
 05:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 14:45:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqiHE06_pw3dJ00f30ohSuT_Hv_k7SoK9bACeDqE6i0A@mail.gmail.com>
X-Gm-Features: AVHnY4LUPp8GTEwUz2koHfZTdHXj-kQ8ZH0SWOlUn5c1woQCDpOdaxSIe2lwISM
Message-ID: <CAMuHMdUqiHE06_pw3dJ00f30ohSuT_Hv_k7SoK9bACeDqE6i0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/V2H, RZ/V2N, and RZ/G3E support two optional external audio clock
> inputs (AUDIO_CLKB and AUDIO_CLKC) that can be used by the Audio Clock
> Generator (ADG) to derive internal audio clocks. The third ADG input
> (AUDIO_CLKA) is fed internally by the AUDIO_EXTAL pin and does not need
> a separate binding entry.
>
> Update the bindings to allow these optional clocks for all RZ/V2H family
> SoCs.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
