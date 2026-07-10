Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42981405C47
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681377; cv=none; b=C802Qa0oO6xJG9TjrNU+KB6LSQgw1fFImInatJeX/jtncCmNrFkfm6p9utz2wLelLxvorO8I/Hr6fSAIquLulr0SpisjQdW4gJnHFuj23Ag2CLNjDkR18k7MgkFNyf8rxIJRpDVK+It4Oiig5MhtHMahfZaY4cI3oogLaaR/pvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681377; c=relaxed/simple;
	bh=TAoC8AtqfvyrcOiH125Z48ckCbhqCjSDAUjYBMGFx+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujuL1Q2Q4b0pGIPLktXAKZOikIRA4D33IiZ1p12GbOAYFFkJ5SgS3EWRoqdDoAYzLhPYse78HIu8RzeAjbiU3JK/tRX+Whwl3YoeMEndTXmKHPWcPWp+VRUFwvD/JSMRxp+rINQUpfYrCVezb9LJBH9cjdTcLpvRiLXoaAbkUJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bdd0779366so203407e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 04:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681372; x=1784286172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MuUmGqSSA58rP0nRidv37IIoymAVqS6FDOb1XQHbyds=;
        b=TBhfmT2RiTihDHOXIcHBylRJ9zt67vOTVJ3JJLegcNoeQYfSM2J85JeuK1vZ6C1CVI
         KbFdG1bQuoepcXrHUKw9iy6OYJJBavlC0LFqYJMU3FHp3EYufS8OJd2fyveQ/lvSBRe8
         eZYjEQZEKzPwDO9Jz2msQthEADsM+zDa5SfalZK3WMc5vwx4U3Md03ZyTc342Co9XTtX
         5DDvB8kUkMHV0CqMNmlm0eDRjmhjHfGFKJFa+UvvnfrWfjTyirhiw1bbkGh4S+GyT8s+
         X5ZjCW3o1unEty2aCOj/14eGCJc6DhLtUEXH0GsHChS0apBut1lz68s4lw6JlPsvSUc1
         fPYA==
X-Forwarded-Encrypted: i=1; AHgh+RohnA2z/JNER7lsyLh2Wm7NzNllGtwquRs0Z3YwQ5k1+RxQ3IS62HeYtD2vEhzh3Wao61qaDJbAcvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HRDzuuXCDub8SNpYb0SqU4vREjKbicxrjytsNk1qIRUk1jby
	4OlPDmeypM0KEtZPT5w9dztQRHlgwfYXEfNhm8asJ+sTyiIUfm4XCzKEw3DPAkkT6MU=
X-Gm-Gg: AfdE7clXEMTUgqKsNL0r4kF6fUhrZyWLNOZHC2RhTk0s6TmHIOysPm7lWUgaP66Cfe2
	iVRm7aCDGxN6dGgIdW34TB1SdRwR7TUGGG2mMTw5ZoQIbKNgSXprM8W5BRkfCnyxowvqrIgQAeE
	JK19glARo9PJyC32vcdPWnjPS3lAu9skzqOxfNzBwWjBDam2+FT2JZxdvmKZPhv/Paao4cRnr5J
	zEAAGFE+b/0uSuBwS8WH+/18NfU4YA3mkmmR/jie47omAAKSF8HEtg2dOuSVIh+IFyC2vVhq4uJ
	C0IlWuKmah912V3qz6pLD+6pojXPO+ncNkyJINcNarOIKi7KV8jy/7dNZX/GAE057G419BVp+34
	mcJUVKktiDuG4XePPyrgopwYaDq+E9NC53lrNVKqzY8rELb69ZpszzWShrEV6LhKGwdfgEbnQ9t
	VVDlWlKsdvMRYy8UGw+6QWHp6ILtxn5hGUc+4bZCWPA+hEFQbwIA==
X-Received: by 2002:a05:6122:6141:b0:5bf:93e4:c937 with SMTP id 71dfb90a1353d-5bf93e5351fmr2812828e0c.3.1783681372361;
        Fri, 10 Jul 2026 04:02:52 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfa62d4575sm1051318e0c.18.2026.07.10.04.02.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9696319e14dso303531241.3
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrtKk7wkoaZny3b5O5dDGST8b9lmpf+7PKo3i2Ln5t5alx0r0SDheoi730QLcX1UmJhr+eyss6ijUA=@vger.kernel.org
X-Received: by 2002:a05:6102:5789:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-744e0426fd6mr5821388137.27.1783681371174; Fri, 10 Jul 2026
 04:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
In-Reply-To: <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
X-Gm-Features: AUfX_mypDnJ4qFpPLK-a5R1Mbwkbc6yQr178xDsRkCp5yARGuoX_7FuK_KFx-r8
Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
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

Hi Krzysztof,

On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > Add a firmware property, for systems where SCMI must be used instead of
> > direct hardware access.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> >     Pulse Generator".
> > ---
> >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > @@ -35,6 +35,12 @@ properties:
> >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> >      const: 1
> >
> > +  firmware:
>
> RPi is doing similar, but I have doubts. It looks way too close to
> generic "syscon" which is disallowed.
>
> I think this should be vendor+purpose specific, e.g.:
> "renesas,scmi-transport" or "renesas,scmi-firmware"

The disadvantage of a vendor-specific property is that there are more
cases to handle for fw_devlink, cfr. "[PATCH v2 02/10] of: property:
fw_devlink: Add support for firmware"[1].

> Also we have "firmware" nodes, so this might cause conflicts in dtschema
> validation.  Anyway, the phandle itself is fine for me, just the naming.
>
> I'll ping also Rob to chime in.

Thanks!

[1] https://lore.kernel.org/de34ac0c52695d92c67cf950b3d8e9b30095d305.1783505329.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
