Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C1C3368B2
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758495; cv=none; b=Mnzk9GzhWaM9ASOdfYA0YCBRAdJNOWE3KH0F1I6q2UE7oakoaTbE5IPtCW0Z+/bLmnCmpUbSdaxDRy5of6ejUHXoPg6NLk6q07toNsIrg8Od2d6q+3WqRnsgxufif+CQy0uaydy8gy5ZLufJSx/Gm7c1vl6CvEVEdKyC6ZX6XdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758495; c=relaxed/simple;
	bh=okWIOwpaAfBMcyH50oSVfKzplqlhnVTdVosRYGHHdGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3Q1dZS05UnNcGPU5nFxY+yUGzIbAUf4HRy1MFWawqR+oRB1rap3384q5s7gBaLV5w0xS8H1BRApv124HjRrer3/FZ1qq4uRVDCeY9GbzWpRPn4o5Z09T1kVpux38mDqbF2uDRM5a2FJXITq0OGpdZRgmOWfWRGjy1x9583gBuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfaf91daa2so806790e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 05:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758492; x=1786363292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3F2htAaSgkkxvZ/5MPPccMC2gln25kjMNeYIdiRBb0=;
        b=K09ff+M9hL1LshcFeADOlbuLjOFKPpFbC/acTo8+9qbCLy1B3ef0lFsiR8HAnAecE/
         qq+Ki5JJemFJjVhla9e9Iro0Oe8JBN/OnCta12hETuetrd0ovDQf+draiJAbqpWDqTHn
         Mgomp7o5NxTxPsnhPQmU6IrDui+XyQNwZCtpsm5b6UnX4YKDYY3PElbpVa1IMLGYa9cv
         ap/l/7HxL07yEiFr48HiqMcSkDpTCH5OsYCbfXUMnflpfj8ZM7g1QJppVocpLT5xzk4q
         hqY4eWhr9Dvj2/FciXGIjBpekAR1V9q2OhNg+kTYI6wPE8WjgiGvSMt4QPZB18L8hPum
         PT8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpE70P4qRChSA1cp1/+6WWFLobLQ7voaB8Giu+Lj/VlIZ80Lj51AtMAN0I4mEAsCV5DURMrwc0k1ms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdnu8nTGO0tKL2Jt7RDQVYi3tdDJBXlwuA1SnDcQWNGDgGUr+a
	/90lyhqmVFwKj/EVTMzykK9OI+JvKrwQjnjNeOe2r11SFadAxFtK8RqE8oB3hfLc
X-Gm-Gg: AR+sD12VHIJ3Lcjvwlpw0/5Pvdlqsbml1FyIsrCb8OdIPhsM451hNrFo2DQQboKCYsz
	crgQdqjfvqey4HlVfYPI/hsKTxVH8ZFnsCQ60qSwUiCPxU6lLsRJ6hsLaD/wtdqrcoA3cd1B0R1
	ouwatHb/izhSMb6mirz0SOXDVkfQb8AMsdVsdTmwFLbJZXkzeRup5rjsPabPKtdvxklHPvDUzPo
	Vhsz9Q0VXn738Hd9smHv+7xN+ie2SD0GKqTNccj6EQ78nUsXHLX/LrMuJtQE9suLHHGXaRJNFtJ
	rLSjQvF5whIT77Nb3SPKDtU4Aj3BKSqiMwmCxEdHBosnC6kRQb6zweKDXr8BA6rhWpR2kp8iRjf
	3qgo38yk2is952YvFTnx9Z1L8r/7VohY+LiCtx7aSkU7kzr8RJd7mluKnogdjYTAscJaXtGhy6U
	glVu8aO+MqzZ56mlloC5P74gKpT7AeDY2jgsnP/n1/hedl5Mq0oItdVEJ9dmkglybylOcDU4YqH
	Pm4RrQLxB5Wi1AGUQ/QzdAmVwIzNA==
X-Received: by 2002:a05:6122:7cf:b0:5c3:8568:d873 with SMTP id 71dfb90a1353d-5c3877f4c55mr2491774e0c.9.1785758492160;
        Mon, 03 Aug 2026 05:01:32 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977e61a25f7sm6349555241.3.2026.08.03.05.01.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:01:31 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1282260e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 05:01:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoCPrpaq5+1+Ggw/47g6wXEhu5zdJlxS9QQqKL9lO6CL8Obg3VMvkSSwVqvM5Eip/5oTj1g7FjUnAs=@vger.kernel.org
X-Received: by 2002:a05:6122:c94:b0:5a0:370:f12c with SMTP id
 71dfb90a1353d-5c3877ee9a2mr2551587e0c.11.1785758489767; Mon, 03 Aug 2026
 05:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org>
In-Reply-To: <20260716214924.GA1477674-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:01:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
X-Gm-Features: AUfX_mxcGqdlDliYxmfdCYiKuiCZlBR4i5y6ZczTyLGv0wHHqfKRM8R7C8jMMeU
Message-ID: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
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

On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > direct hardware access.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > v2:
> > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > >     Pulse Generator".
> > > > ---
> > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > @@ -35,6 +35,12 @@ properties:
> > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > >      const: 1
> > > >
> > > > +  firmware:
> > >
> > > RPi is doing similar, but I have doubts. It looks way too close to
> > > generic "syscon" which is disallowed.
> > >
> > > I think this should be vendor+purpose specific, e.g.:
> > > "renesas,scmi-transport" or "renesas,scmi-firmware"
>
> If you can tell me the resource that a 'firmware' provider provides then
> it is fine, but you can't.

It provides a firmware API, which is not available until the firmware
provider is initialized.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
