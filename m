Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B816366049
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139877; cv=none; b=KN768rfI9tCghrUclmbQd92bWpS7c/HrXgzwz7bV/uKBxeds3iyqROzn1dWtpJ0lvs8bEp/Yi1Xvom3Iran+9CvpMHrh905562zYH1WMV2LdGcjRzpDU+7PfwQ8eoDr9wN3xNDbrX7NBh3NjokZTJZTJJtku6EPOI+336E4nk+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139877; c=relaxed/simple;
	bh=BCBnzIbovSj6nZkSdLu43I/N8uho8yIG58ObXHwQhSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Msg3YvrYvRnvuWuIf9ZhqXwaP5mLop484ruW2YiPG2ghqv0WYCqC3a9xbRpYtyLySwWqElyr3FdiRhjuJb5WJCaHIQvhvBnOXnwNrYraryl/xkBiimOQhUFE/C5kxzKFecZhwLkg6NhQR51C/WfhA4G/fKeDOKxR0smjMZ9DAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-835c98b659eso327626b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 00:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139875; x=1778744675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egy2nC9k2RFpcPzSIv9jZ/VwU1PCVKckuVqW7m7bXrc=;
        b=BHjWRl/3WGeHpOsmfAkAu4UZMSPgItpWp4fH2+ihX7skJhQNVpbzOgZ26gRz3qm/MP
         6rNhyLv8Cmv8iS+7AsnV1AwOZjze+PMNBimjm8RMlSMkZIGkGcn87EWrlD2UpLDGbQND
         Pl4dt3sXC8IinPu7JEZ0x3oXrp8/bLg4QkZZM9zr5vSiFj0gpfDm3cTSyN/A3NFekaUk
         9ORSnBIQNXgOJZfdbaCpD7ytiMCZZA5nUR8VDU6KSKBIzBvLBIsM9xUAT7EMjmJHLoCj
         NmaWA0xbUQo6RZaWOygeUaTWNGFx4N1gwWU7S3a6iRP+uCtHf5kYnCaXEMMnZA+UQxLy
         JdSA==
X-Forwarded-Encrypted: i=1; AFNElJ+rNT/vPVbmNwehofVgCqMx75BsanUrTjFIcasShkvQ2TqihiPBNol2FzbeEZld+cP+DktJDjwKm6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCnT92Cq1GjZM01KRIx/1lTNZj4mihH3aMI2gamnaj3kuwdCkj
	kEEnzsaFm+o9nB5SB6GJSO7GIE2GbdFXnR0VPKALX7g5NblyrpTmU6epzvEb5zwYLXE=
X-Gm-Gg: AeBDievpxWktF+2RK3AP/YGhoWMXdw4ryTy1zxcFZmgH6XEM5GpjPLLUGNdHNPULxNj
	BWuwggI7BA+0OzRM3fqGCtJHvGUc+RETzZnuJ0aIMBCNKhX4VTW7c8ijiwwgmhM6tzMqAFCuqXp
	cLraeVT+ItrUElbUGaNV3PtCsVvFYhIwfzP0D2cZLhEyIpx+lnJHsXk6FZnWp1LYoDQL+/8+el4
	PYiJB+O3uaeAAEAOkUqwTFUJqTz4XYIbOzvpQllAY5PAV0CChbhKGUq7GnY9w90mrZgNdl3/HLE
	Uut0FJZCj5rT42y2pjlDYmSlRMi0bB478QYJdXDVCunSDNGv0LWr8Wqas10/xBTSbE4rMA9nWBO
	3Md7rHYOZyYrVr4KFpT2785Wem94HqethBiH48FvyznihJeFEwJELNskfOZl5w0RmmdsYOHW62Q
	7vcs5Rz1O9irURNC5RiFnMY52w5630ICINHJ+r/bQDzb4d+UsYajADdj/rcxuf7fiC4cs73f/xg
	bU=
X-Received: by 2002:a05:6a00:4b05:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-83a5dd5c926mr6925894b3a.32.1778139875450;
        Thu, 07 May 2026 00:44:35 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f381sm9913149b3a.6.2026.05.07.00.44.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:44:35 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8025f1c227so365864a12.2
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 00:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/fC+i9F9zS1RRht0nWbOMrd/4lXMCyOBGedj8YPdj+zz/g/bobakP25uvHvEkqWDXto2n/IX5Ht1g=@vger.kernel.org
X-Received: by 2002:a05:6102:38d3:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-630f8e752e6mr3312584137.4.1778139466906; Thu, 07 May 2026
 00:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
In-Reply-To: <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 09:37:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
X-Gm-Features: AVHnY4KGlUYo0uuTDH3tynnil_8H5d8OEIYrlJIco2kr0W3O9LQYd8HP5vniIEg
Message-ID: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 7 May 2026 at 00:58, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet,
>
> I agree with this part.
>
> > or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>
> I do not understand this part, please see end of this email ...
>
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
>
> I am unsure about this part.
>
> There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC
> block contains multiple Module Power Domain Gating registers (MPDGn) and
> multiple Module System RESet register (MSRES) .
>
> I do understand and agree that the first power-domains-cells cell must
> be the identifier of power domain within the MDLC block.
>
> However, I do not understand the second cell. The MDLC bindings already
> contain reset-cells, which should be used to refer to a reset within the
> MDLC block. Resets within the MDLC block are operated using the MSRES
> registers. Why are resets conflated into power-domain-cells ?

The Module Reset Destination bitfields in the MSRES registers are
2-bit wide, and control both Reset and Module Standby.  Hence the
same register bitfields are referred to in the power-domains and
resets properties, through the module number.

Module Standby controls the clock(s) going into the module,
and is modelled as an SCMI clock (SCP_CLOCK_ID_MDLC_*) by the SCP
firmware. This is very similar to how MSTP (Module Stop) clocks are
handled on earlier R-Car SoCs (except that the SCP_CLOCK_ID_MDLC_*
clocks have a zero rate :-(.

Summarized, the first cell is the power domain part, and the second
cell is the clock domain part.

So perhaps I will clarify like this:

      - The first power domain specifier cell is the power domain part, and
        must be either the Module Power Domain Gating (MPDG) register index
        (0x00-0x3f) from the datasheet, or a Power Domain number, as defined in
        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
      - The second power domain specifier cell is the clock domain part, and
        must be the module number (0x00-0xff), composed of the Module System
        Reset (MSRES) register index in the high nibble, and the Module Reset
        Destination bitfield index in the low nibble.

> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
>
> [...]
>
> > +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> > +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> > +
> > +/* R-Car X5H MDLC Power Domains */
> > +
> > +#define R8A78000_MDLC_PD_AON                 0x40
> > +#define R8A78000_MDLC_PD_SCP                 0x41
> > +#define R8A78000_MDLC_PD_APL                 0x42
> > +#define R8A78000_MDLC_PD_CMN                 0x43
> > +#define R8A78000_MDLC_PD_ACL                 0x44
> ... what do these numbers represent ? Shouldn't those be register
> offsets from MDLC MPDG00 according to power-domain-cells ?

These are Power Domains that are not backed by any of the 64 Module
Power Domain Gating (MPDG) registers in MDLC blocks.
It is not clear to me if they can be controlled manually, probably
they are just always sequenced automatically on power-up.  As the
documentation does treat them as separate domains (see e.g. Table 14.1
Power Supply Voltage Monitor Functions), I figured they would better be
exposed as separate domains, instead of as a single always-on domain,
like on earlier R-Car SoCs (cfr. R8A779*_PD_ALWAYS_ON domains number
32 or 64).

See also the X5H_Power_domain_structure.xlsx attachment in the R-Car
X5H documentation.

> If those are power domain IDs, then I am unsure why e.g. for SCIF the
> domain ID is R8A78000_MDLC_PD_APL in [PATCH/RFC 13/14] arm64: dts:
> renesas: r8a78000: Add CPG/MDLC nodes . Could you please expand on that ?

See the "Module Standby" attachment X5H_MS.xlsx in the R-Car X5H
documentation. The "PERW" tab shows that all PERW devices are located
in the PD_APL power domain, which is always-on.
This is different from e.g. the UFS controllers: they are located in
their own PD_UFS0 and PD_UFS1 power domains, which are controlled
through the Module Power Domain Gating registers (MPDGn) (cfr. the
"PERE" tab).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
