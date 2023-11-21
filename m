Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6B7F4
	for <linux-clk@vger.kernel.org>; Tue, 21 Nov 2023 02:08:04 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6bd9:a79:1d00:5285])
	by michel.telenet-ops.be with bizsmtp
	id Cy7x2B0090Wid3g06y7xZm; Tue, 21 Nov 2023 11:08:02 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5Nfh-009uy3-7v;
	Tue, 21 Nov 2023 11:07:57 +0100
Date: Tue, 21 Nov 2023 11:07:57 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
    conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
    mturquette@baylibre.com, sboyd@kernel.org, 
    prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
    linux-clk@vger.kernel.org, 
    Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 2/9] irqchip/renesas-rzg2l: Use tabs instead of
 spaces
In-Reply-To: <20231120111820.87398-3-claudiu.beznea.uj@bp.renesas.com>
Message-ID: <5238e955-2af6-3d8d-7376-1e904ec14828@linux-m68k.org>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com> <20231120111820.87398-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 20 Nov 2023, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use tabs instead of spaces in definition of TINT_EXTRACT_HWIRQ()
> and TINT_EXTRACT_GPIOINT() macros to align with coding style
> requirements described in Documentation/process/coding-style.rst,
> "Indentation" chapter.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
