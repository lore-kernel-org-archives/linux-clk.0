Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6892B483BE3
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668941; cv=none; b=o9o4D5z1eTquwlh+oeC7orYSctDspUCly5qIlqJ3f60DlvgGPrWGl86/9xx7133BIUkQQYWMLRek/R0zQ7srEFZm/MfFtqQOObYI/PxW0rUcFeXfsrGjvWzbweZjdA2Sk6BL4PMtg3W5jcfmHvbsLAHqnunCRTvCWIMoGsqxD9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668941; c=relaxed/simple;
	bh=nPKshbbUtBrFg12ZGrFb6hUqHzYltdvYyLHCNt5+v8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9v3AX4vB03XrVtiue2KvKm9ydvreDJC6T5kAOTWZpyKwbJOVOYo0t9V7J0Memp/r0sgTmItlWPaJenp0sV+Yi7lwDZNY29+YCsQPVkhxkzuiGXp1OSMd5dzl4vVnLayxlzgBrM7BzKIEdVbjnmVsIO8FgOGNUKsGOBep7c3o4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso3815665e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668937; x=1788273737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6P/zDMrNIG/rjy54fcEEocHk6BsN+YxdD3SIYMCYNM=;
        b=svSMLx/+SshZMLxmMpyEWsoijAnPJ6wJ1ul8onEV4tugMt9UPI+SgYA/xBF1wPUY/4
         Wu+XZrmDDR8kbAA0CW9JrTViIKbxBnfEHai8kT3lWGg+1QByl9Zq99AgNTCwJCGjRi8K
         0cK/raLNYd0n/f61uyL2xcdXtO+AjSrnhBWCVoTHcSVuHy1u1vbr7Raq++D+IGDx16K6
         O0MoMTW8RqrktSrlq4jlrzbDBbvBltH8n+37FQK8QwPfAfsgUB9bFJkkVzHd5wXURZ+D
         Fe6KP57I9nicxlR4Bx6AWHihamLzUmuWzwPvnCvY2lHx6PCO6XzlXJedpW8AzqCHc1tI
         Y0EQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7MumwuCctpG4Pvr+YtFAc0gsPi1C0XWhcyoG1csrFHvj7La8DhJxrRMqQGwTpSNvDl1lfpCVAIIk=@vger.kernel.org
X-Gm-Message-State: AFuF++mxl2ND7KSNtcTKpbF9xybXfEXuQTz8tKy3E0/6oeAl32lYJKVF
	7oCNAAJsOmOiIhm+jDXuZH5pdsulhYtYxCZJPd7zdy6PoPse8yUnBIUPjW0qEW4gziU=
X-Gm-Gg: AR+sD126BFRuLrI2FaJTAYOy0s31yJuoZjUi4ZUWO0jmPSXr27FO3LlzzSrLJXZxn9j
	LzquCbbIpMEWk+IIYibshFHT9D6dCKYm1kZHYl5dtsTa9TtzqXjwuuAZwcgM6ETd3h/cWF/xziH
	5AgmKqpDIRtsae/n5XIkS8vMaJo2KKs3qseC6CLc3mcEooiYjvR0Ejarg3OnacwDulBoIAdLmLt
	stf17zCyZVuYpfp/G6zACsP5VoL7VNGEeED1EahWHdMZqtNhp6ItRPVQzKWZ5stnAAU7O7fYLLD
	HduIBkhRB6uNDjQerbuaymQEkBjnAnmedDEGoUYZXeaVxrFjLo5PP3bqtUE5g8sOXBZew6U6v1A
	UPrnM5k6zhmxDDvDHzJsJ/7nt6EodZ7D/Ufq5MYg9wL1+e80fQ84KktcdzWUKWsQr7hOSv1jIBI
	mrV6cJeONY3beNdla6Gf8Vc52Zb92mIiwdwAB1hKWpx9TlZos9e+TxcfYU4r8pjuZVrb8VTaFkX
	bvHYmQ62B6+LVNEDBjT45XpwBiZ8Q==
X-Received: by 2002:a05:6102:8682:20b0:77b:b38:6f44 with SMTP id ada2fe7eead31-77b0b3874afmr7018915137.5.1787668937092;
        Tue, 25 Aug 2026 07:42:17 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c832ab30asm10540123241.0.2026.08.25.07.42.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:42:16 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c652293bcdso282175e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:42:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp8NsUa9jD0+d45dujlebg9Ahya5JvpKOpfZMplyR38Aquijy9gW5qJqMs+EHtzO00GzU3RwPgaJUI=@vger.kernel.org
X-Received: by 2002:a05:6102:8682:20b0:77b:b38:6f44 with SMTP id
 ada2fe7eead31-77b0b3874afmr7018842137.5.1787668934683; Tue, 25 Aug 2026
 07:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-8-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-8-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:42:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2BBChjGXf1LqR68EE6LfJXv+uwPm1AhB=NaasL17-WA@mail.gmail.com>
X-Gm-Features: AcwNN1XNGYc2CQ2kaWgxF0GmyyU43AxSZu87qBHq6lGDVbEDpy4b3DvqBrFpSMs
Message-ID: <CAMuHMdW2BBChjGXf1LqR68EE6LfJXv+uwPm1AhB=NaasL17-WA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: renesas: r9a08g045: Add CAN-FD node
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC includes a CAN-FD controller with two channels.
> Add the corresponding device tree node.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel, pending acceptance of the bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
