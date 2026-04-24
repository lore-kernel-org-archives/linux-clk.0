Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D23B95E0
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030572; cv=none; b=SLVBCAOd7sOQ5i63tqcEhX6XWnYOR1AE+UTWDT4Z22Eqk32QU2cxkZA4ObszCqclzPdrmo3nf6kOo38cOV0eykUO33Ka5qHOkt5tISjBssJKfQnE74ONh823df186jRWvZWVd8s+Ci1JUTfjmkskylwRiIkeBde32wE2y9gtmxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030572; c=relaxed/simple;
	bh=NrNB0Z4JheJ9/gWbOMPohCnZWZtAqhLPKDbrHylRWo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=go+R6WuLkmGj3/VSBm1xO05b3emtVbwFWbC8XRorCreusQHEAuGVbfjhh0CsPWaJI/K5WrEuLPVqy/83VkL25TToiDtQF+abqSJzgHH9OFyOrD8QsIWBGARR76T/RshFdB62gEURkaL70SwIYbbknTOkerOPFvZtDtq/a69KyFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-60904a76e63so4463271137.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 04:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030570; x=1777635370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTjTO3Vp0zB9Wc0GJptJYSFqlnWOG96HJNT3Sm1YIxY=;
        b=QFfYAj1nCCPSmXQJ7DBOQkiuchv8gvLjoAKvrKUcjkYoqyUDqdQ/j65ZPTgygftEkC
         4mLZJudJLOeVnPjrjat0EmTTmV6yS2rhSY+9TXda6eVUVzdXCgYLJk4ML6ZL/V/4vrmr
         8rEOZiSUa3KQRYlcWPcRxY0n+yc0nu3BRH2umGIqtVLFn+kKM5vUwTSpfGLS0/PoCSTm
         d8+LeDSONSrmp992UtAgGln/gJuQyc6l/Fcm2YKkchM2AmRjR4NNAWi5heAZgZvC30C9
         VS3Q+T8RLimiZbYbEtJDXi6SgK/bu/QvKENeYCLxViydnERuv41a27GIkBp6E7NGAp3x
         SKtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wmdZV6kz7yACw/qsjY99qhnpptE4/+Gyx2F8amb7cyCBl2Q4zT+lIo+myW1KwPjdTTjLfW/voKKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPg9VKd+4P+WCj7W7GYHJdz4TSB0jhM+ermqy77qF0ET/AEGo0
	EwrJ2ILTZ+gtjHs2OEZYd9Jw0UNAPbUNF+QtFWYuhRQYk4oPVvZtRwPjWx0sj4AWJOQ=
X-Gm-Gg: AeBDieuqqSnIAcwf6qLDrmqYXxCgIaIwKi7NJ/DlcRep6bWs9VBF6QzccU0qY/B2UBK
	4z5G2V3DjJ1tK7pHvVo2579O/MnW8JmcU94cPEdLhtNaP4QzGADoIGkhe2Hil93eTd0EgNyAJ3U
	4f2SN3USBWs4hUf6NJabbIoDJl3uQeX5AAMdjpwZ6L52V9P6Xkhq9iuEE5Mv37BHZUSdHY7ar4N
	8MZNOP8jNxIQLVysXI5BFkY5Y3PwXovX9Z4gk6LAGWuMRq+84BCXXSjyLBulvb1iV9XlXgYhAxb
	N00ogLT1fHMZvNJgbVB8pLdqsXDPw2UyfQHtCgGrPMQI/SEHqeORlueubYwc5JHh5NZtro6KQG0
	mlTKu8+e1qZWvPRqcMBAYpkdItO4HERMXH0GjrMQJ7bOD5v6BLza6x5BuOQRySjohYMyNW2msmI
	P+CADFoUO9xAnj1NIKHikhwEnTG9gQ85s3CzTxakSZM7CTWjV9staRhM8RYJBLQ+TwJUMDvy+e5
	g8=
X-Received: by 2002:a05:6102:5094:b0:608:94e3:bd8a with SMTP id ada2fe7eead31-616f4f77861mr15614253137.8.1777030569841;
        Fri, 24 Apr 2026 04:36:09 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61747cb501asm11053212137.7.2026.04.24.04.36.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:36:09 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56db1b3626bso5027576e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 04:36:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/bY6AkNh/Ay+iuiJfIZxv290pxUHTZ/gVqbfditV0vV00wOIOMqPlt2pdMpVkBT2DRhnEYN+XIreI=@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:60a:cd0e:5cee with SMTP id
 ada2fe7eead31-616f4f84fdamr16386481137.12.1777030099174; Fri, 24 Apr 2026
 04:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <7hcxzqr4qi.fsf@baylibre.com>
In-Reply-To: <7hcxzqr4qi.fsf@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 13:28:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
X-Gm-Features: AQROBzBE70P7irgYnQUYx63AIUadZqGfMGlPrac0wi4EECHihh00jV8ht_DYoMI
Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
To: Kevin Hilman <khilman@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kevin,

On Thu, 23 Apr 2026 at 00:48, Kevin Hilman <khilman@baylibre.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform the mapping to SCMI in Linux.
> >
> > The Renesas R-Car X5H-based Ironhide board is the first Renesas
> > SoC/board combination that implements the ARM System Control and
> > Management Interface (SCMI).
> >
> > This means Linux can no longer perform various system operations (e.g.
> > clock, power domain, and reset control) by accessing the hardware
> > directly.  Instead, these operations are abstracted according to various
> > SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> > firmware running on a System Control Processor (SCP).
> > More specifically, the R-Car X5H SCP FW SCMI controls access to:
> >   1. Core clocks and module clocks,
> >   2. Module resets,
> >   3. Power domains,
>
> I'm very curious how power domain hierarchy is described on this SoC,
> because one more issue to add to your list is that hierarchy cannot be
> described for power domains in SCMI.

So far I had no need for such a description. AFAIK, this is handled
inside the SCMI firmware, which does know the hierarchy.  Hence the
firmware can power up a domain when any of its children is powered up,
and power it down when the last of its children is powered down?

I think the clue lies in having a PSCI top-level domain, cfr. what
you wrote in [1]:

   "But... how do I describe the relationship of this hierarchy? In
    particular, when the SCMI-controlled PDs are actually subdomains of a
    top-level, non-SCMI PD."

Or am I missing something?

So far I have used only a few devices on R-Car X5H, and e.g. the
serial ports are in the always-on domain.  I did experiment with
a dummy UFS driver, as UFS is inside a real power domain, and that
seemed to work fine.

[1] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
