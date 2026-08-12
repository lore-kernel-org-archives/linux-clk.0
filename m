Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20062418A5D
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528064; cv=none; b=lpYDngthM2GYUtNcolUI6IWMH4pJbVgFpnBvOeQe6qi2AlybD6K5HdlVL4N0mgBQlLPVluHg0OlA8nvRtMBApt1dnU9QOceMEH4sUpITBgmiBnti/6mqG+GeO0gJT3O7EwCOZVlzbWLtTgn4wBtYJFcYlPQvMpkzET0wvsaJGCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528064; c=relaxed/simple;
	bh=bWURXCZrQDZ0x80rfdOSm1jqz2Xjezk3ZnaVSR44ifs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qp2WNkiFoLEwowyd7oCOuYWB48x8ZvaCz8Z3UXlH1Ux3B1kSoGfCmowKmLnLvcGe/zYel+7bif6rIu2zKOr4SF1oVcklAnPzCibDqc7aWz9rJYURc5QAu2LLhQf+xh14nDqGNbjp58zT++YK6nGLoF9nL48e0t64ie74w6kC8fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso390579e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 02:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528062; x=1787132862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/axx2TQndZ7l7LrHHfpxsCFqNyyCWsv8j2VxY85Jrxc=;
        b=YisXProPsv1jh9ktRBoBRQVgzp/DBFVvjkSIveid4/UjPltOthY/jIVYmqtJ9TSigE
         5TF5wJFS2MqhpXZxwNPl8Ll6fz6GFcGtKLSi4WaBmh3JgSwnpWn1+0fX2LLQvE02Y7Fk
         3cvkNH1QWhKZt4gk+uX6uzZ6ZAXblzkIkedsR64/c8wSfK6vDhtV7wNNH1ABXWkjlW/D
         fzs2FM7Fq5owxvX6V/5kurnaCdxXJRZE2ImSOh/+W465YsIFC4Cg3pSQ7z794bCI4yi1
         wZXXSXudqUxeBIvT/SbtijWlleoSKriazUk4CjWLmd2pGSxXQi/dz6+xs+16zzfVUOfV
         JiYw==
X-Forwarded-Encrypted: i=1; AHgh+Rra6xk3TrRn9KWBApYVENNKUUVRskWZHv0+CAbjhtbIOHeCf4xwRBJnvXIDnEnW6USSAirD0Ds982A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2Wnf7timaMOp73K5hwGhZyz1kd3RqhHX/W328XS2Dnn+Juzv
	B8o1R/pVAa01et7umIhLFch3STI5EIXySjbFWyMY9S5RQiyYBwnak/RAVZzAj4s2
X-Gm-Gg: AR+sD128Oqbbv3CwMHZzrXUd6gm3ibh3o7kNskS7y/nCvzKSpamAJISkMRTNaXhfFW2
	rInDApOCQUh0993vDBjqadtHY4NgY207cirjdXqQ/A/KPNn4eG2PSBUiHGn2qBhrkNGLnur0dnp
	AP4xhc4vb6VZdN98NHgkb78+z4UG0JvVqVHkGET3yBRO3jQ41Cg/VUw4mKMDaZJUFajKO6hHkyG
	+VW1CLeHC2AYzH5W/lFWUx+qv7imCGN2jIyYDK7t4whNHWJ3859fp8/YyG2/QCHtOO3SmBUNu0i
	GE2ZhJpVPK9YK1ETg0FFx0Ds7KwJFH67cM8iwnP2+Z884P6YEDHkbKAmzIfvqnaeJtTKIx+w32v
	m3KlKQXgc1L1xDHXLlZAdR5/9cAxg2KIv00oq41A+8I/24aOdhTyZ+AgtMbnLuKTlHkcV8GGLDn
	qrycsVKcdSIm97lD6Ky5S5btPm/d5g9A6XwR1ShUi5c2tjLCstLsayMnLQ3D8RQv6HecWVhSLiz
	VQGs9F93kx3xxjalC4cnub7ndMUwRPY/ozB
X-Received: by 2002:a05:6122:190a:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c4f84251e8mr427594e0c.1.1786528061971;
        Wed, 12 Aug 2026 02:47:41 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b4c2fe9sm980853e0c.5.2026.08.12.02.47.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:47:41 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-969524c1a63so516781241.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 02:47:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RovKl3azRmcJA4DZjS2rwVbmcb0v9q82UHTX4N7HEwMz3aCPWP2EpB3MgglN4zMSdCwqRL4O8fnhBU=@vger.kernel.org
X-Received: by 2002:a05:6102:8020:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-76c87d7044amr1040741137.1.1786528061345; Wed, 12 Aug 2026
 02:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org>
In-Reply-To: <20260811163334.GA2354701-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 11:47:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
X-Gm-Features: AUfX_mxykVa-_GVxsMsY5j-WoXLeEw0hqTlxX_hGEjk_L8dF08TYL9-2xHiMqsc
Message-ID: <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Tue, 11 Aug 2026 at 18:33, Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 03, 2026 at 02:01:18PM +0200, Geert Uytterhoeven wrote:
> > On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> > > On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > > > direct hardware access.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > v2:
> > > > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > > > >     Pulse Generator".
> > > > > > ---
> > > > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > @@ -35,6 +35,12 @@ properties:
> > > > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > > > >      const: 1
> > > > > >
> > > > > > +  firmware:
> > > > >
> > > > > RPi is doing similar, but I have doubts. It looks way too close to
> > > > > generic "syscon" which is disallowed.
> > > > >
> > > > > I think this should be vendor+purpose specific, e.g.:
> > > > > "renesas,scmi-transport" or "renesas,scmi-firmware"
> > >
> > > If you can tell me the resource that a 'firmware' provider provides then
> > > it is fine, but you can't.
> >
> > It provides a firmware API, which is not available until the firmware
> > provider is initialized.
>
> I don't know what "a firmware API" is. What does it provide? I know what

It can provide lots of things (everything we are no longer allowed to
touch directly from Linux ;-)

> a clock, GPIO, reset, interrupt, etc. provider is.

A clock is an object you can access through the clock API.
(s/clock/.../ for the other cases).
Firmware is a service (virtual object) you can access through a
firmware API.

In all cases, the consumer of the object or service needs to know
which object or service to use (there can be multiple).

In all cases you cannot access the object or service until it is
available (initialized and registered), for which we have -EPROBE_DEFER,
and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
firmware".

Thanks for your understanding ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
