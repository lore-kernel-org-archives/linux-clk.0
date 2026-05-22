Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705B8401487
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458146; cv=none; b=R9sNg8flt5E1LJHJb+g7MvflzH60V3ojQ6tO7mQqZ23eStTFa5ScXU/pIsdRhs39s9VQqZmLbqZYkOKyb6RdkceATiYU/QBkq7PjjXtODawUYaWPIm5bDkt02R7Si9OanJ1pVYA+Uy41akrKpLAo2TZa3mdatuQE3FbP8hjMbI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458146; c=relaxed/simple;
	bh=FUrrvYF1KlCYgNZMOn/2U2OmhC3p91aW8lXQejJ1EWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4Gver7kp3CCzTSmHgu0RnvmKslPEAy8DcV396tt7QiZPhrrEeKHONKbz67jotJQqQ7MBXC81oNUzzNegMAwSo+VdYdeJJs6uIaM5Y4izPmnBivdw9+9nrQf6llw86QVhvdvAq1mW0ToQ84fRaqyH5XRbXH5a7g4Uz4y8faYmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95cc1a5fe9cso2001072241.2
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 06:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779458144; x=1780062944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3tqZ3OVcBR7J9y1KxfWGi4ZaR+C0ebaX/TOYg/Itik=;
        b=X1iWMNkA+Ofv/NIKYzq/zTDVgtKRzx8DxcBwn/ZE6FZSucgmkgktbUZXUFjKEFh2+1
         bcX0psDjEbkIrirucBYMEu+WABSdaXBhT2Xh3lBnwaCenV7Remlobi0onaRRbBTsEBw2
         ZMLcWkAgwzdgKILW0xXEFoAbsXFKPusIWDr5AZHkbxojPhMWBCLu4JwlqT31pUjxqUjU
         xJMifa40G2tR1UPefl1yf5tY1vlQyqnZ45PKJYkLAsBHzDQKkmqosjeXFB/657lQ7HeU
         oPe/Y0n4oJg90brmBoWxRWsLrFmkDbXF8Wuosyf6LyOhcdEvhLhksqufOyY/m6SPMX8r
         ZZGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KUTSy7YlvTKMT6BNNgC5y2/qwlChrb961jY/OMtfqcPUME2dlzHnVbJuoWWmCymirmXyt+ALiJsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyloDGOg5kiVnDNCEDgyVoAGFwDDZVPMpfrkDXgRkpfy6m+l6Uj
	jRaqDSPfae4316r/fGTsgHz4OF52M3YwORN2hQq8ZFyj4ITUsMac1QOddNF8XPUjxOU=
X-Gm-Gg: Acq92OHehNDuJxZi+EWmO3sOai89h835A9Wjcj8e99PfrziLCBunSCySGJRpkvUdBTk
	vB6f8hbRsrSGxkHFsMqS1HxdJ4lLDxJzOY0sSd6X/LcoV9WYtPfZ7ekf9T3Ob8uZeJs2+yY2yRx
	HqbBc8QEyvpl+LUccL+7E2r1MNgj3Rlz4Usm0E2FRDrtcFD5JpqdFOapsrs1yqaZYtNlwcEEyo9
	ubT4E1dGUBE9xB53I1RVctrZsJ6PObdqu3KFit/fD9ErqbzKj6ydzjStIDczBHVnkoisMfOOLEP
	2mMadSuX7YKepNiXbRwoH2sgp7AO1crtMkJIdLJLg2JQYb2Z3PN5v+wvmFnVSuLR04NeAUbhTph
	EXkrG+toh3QlSyLH7tHisCCi6P60aErl96ejL1v9Cw0uDH9UNnDY7s2M57J7g2RZoeOdxKJfsMz
	3TpX4W4wL8utXbRVBrUNW8MZloe+0FLjoqBczFGnJJm4qGTKGDBoYBmCYBqal1
X-Received: by 2002:a05:6102:3ec4:b0:631:26f6:7009 with SMTP id ada2fe7eead31-67c84bdb16fmr1754899137.26.1779458144296;
        Fri, 22 May 2026 06:55:44 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8851f5bsm1397490137.3.2026.05.22.06.55.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:55:42 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95d439bd3a5so1815672241.3
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 06:55:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jlU9OBvPNRUl5WyQTLMcopyuYsKB3uR5xJFb3iFpoYXwoXHXykGiaoBkdTjUeCZZgKRq25lHiHO4=@vger.kernel.org
X-Received: by 2002:a05:6102:fa2:b0:639:6533:65a0 with SMTP id
 ada2fe7eead31-67c7ffecbb9mr1562113137.18.1779458141395; Fri, 22 May 2026
 06:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-11-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-11-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:55:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=jDbjoyqh1qraVSRPjTJieTEoY331zHRn3-rRvPW81w@mail.gmail.com>
X-Gm-Features: AVHnY4ISeZdPBYDF9Wtg2Sy3PVMdCCeL0WeBXF2maqndwrmCz-EByfhYArSf_hI
Message-ID: <CAMuHMdV=jDbjoyqh1qraVSRPjTJieTEoY331zHRn3-rRvPW81w@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: r9a09g087: add MTU3 support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC has an MTU3 block.
>
> Add support for it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
