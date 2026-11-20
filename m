Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161884;
	b=BKYWWhhJdbhIbWa2mh5iKa5WJVSt1SIggKLqyup6FePB1u4nWLNHzlujbqYkpjyUKsMF
	 zsPjX2ltsGbXHYBm8oE1Bow9EjRnzF6z2sFFemOYoCxduj1k9WLZiclk3jsgCVkpPsdJn
	 oLVJPymOK65LX5ppjolMjpPIQcZFIreGxq+86HJoVLqZnG5ZzuhM4BlGkbzsZbl501zoy
	 fJWTBNr8jhBooRmyYFA1HR+OWji79aOZXqJ8ZS/+wMGJKPitKivSGwxb811nI8E5TTgjq
	 0Xj/rUfjA65lHk8OB+4tWfV4ItSGRKhbR411XE7kOVMvSAh+YYVELE97xaJgus5ZDIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161884;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
	b=VODokDK+TS4OsriTmE0wJijoslIBjFvtiq+MxTgyndH3cAGKC0ISfrzFbbAmZ9d+HQbj
	 gmWzFKL3/yhK2E1rUcYH3VPljSbNzGA/u+rvLBY1k6dTQTH9xOwtZlZQfAQIevHeikkZJ
	 leDcuiO3VaTU7Wzc5ON4EZAg2WspF7V3iMHDMohpPNGqAQ9/v0q2JFIb72NkZvJOF0wRA
	 9o86nNm+if+D31PaLF658dLkkj0Nsvo/Md/VSjgKvilivl1uhRtYKH7gSsMcwblQAmBOg
	 sZ4O9WC/jKewP9QJTabSf1JWkmLbMS8GI1d/DpooV3qCj63UpmZQbiCOg2XwyJ/FX4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C7606A32A
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eafb65e169so350012e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 00:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161882; x=1795766682;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
        b=HGDzCmzJyxrOYAwbA0T1neiHF+eu7lRIR5IUlUo2XLJvi+TFpMa55fbUE6OB85JV8/
         Tv86fLtoYda2jzQCSXG2gGp5+aYfx7F0nT/0zuZ145s2AbqctN3gAFZ/saeaoWnCdn9M
         vRtqGuiMbOTgW1abHEFHcqQrjJbbmQpUoKShmYMguGN0+dsjmmX+/bOhtrGTH1fVGpFx
         UQaoCgjoYNo2qVO9ATLXbcj1CMD6q1bUtDU014Rza1rdVfjBtFSJ8fbP90IpPvfQgUai
         Hf/ZSO9R+3y5KbitM7/Qk7oG68f4TRa4c4oLx5gXC/OWJAs2VEE+ZmsrywVH69h7qLqQ
         gopw==
X-Forwarded-Encrypted: i=1; AL+hErGquZBL3qaZxL2bwWPSCebEnRJi5XhdVosFkC9dEK09qEnVVwhPZIPimPhk1j9M9SPD6X7BC7xK85Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z++TR4ev1ND8wZdyJXRdJZGEwoPr0rXxkiInG17uNMzTnB+PxRb
	JzG28tP/pWmwNsixA5EFnlEQoS8d712a19c0wj2o2OXGrMK9kaTF21E//DROqSZp
X-Gm-Gg: AZFdTZeVtKt+tobJA/Ud83p2t0/8X7L3K1yeRiG8hm5jht8/vgAePEXiQaf0wc3Tfw2
	A+Xeb8SBZADxiFq5wVO5b//RRUefl+I1nVxGFxJ04VNa3kTLxJJfZoF8us/Ra3tKvzpSXsvy98A
	eAtePUpgmLVLkE79tjEWUm0NhQfI2Ay7mKjc3xRV7aTiuREg2ItuGLiRlnJ963ZuZstY4676iUY
	T8UEdNaAAiI6wU3PzZ7x4p8iYiYCACbxF03q3Tz1GTLoPE94s7XbXlgFsBHxOhKXYH2dwwrKo0v
	NhaWFDj9PkYONtFi+2mdOp4L3JAUajl5axp/hOkr9mNqDPpa/tLGa6l2kJn7xw1hexekLSLkCAc
	uOTrojwd5KoP5jup24wp0SSCgE02PyP0UnKvf7OoVzg7c+NfLJDhoxdbMOZD1+xGn9HltNvTCWv
	yTPkjb1vcGYf3MdcMtFikrOkBLrsLmSUxb3AvQq6xV/NWxHIQFvVYh0JlcQIpZGCImQj5vEERNp
	BIyrEcjxluzvXHIm/Nl6n+7aAM5zPOO1Mzl2paWTvfCwcYX8alKdbSYHG6GzEg9fBjgcdoUmHnr
	wKTqn1B/oy5+i5I97u/53IUgkiDG2p/wSlF5y0h2JjbpTN3Nb5mBUOSEmkcZwz6hI60=
X-Received: by 2002:a05:6122:1b8e:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee8af58289mr1253294e0c.23.1795161882541;
        Fri, 20 Nov 2026 00:04:42 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5564a9sm1883727e0c.5.2026.11.20.00.04.42
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:04:42 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2da1667b2so370241137.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 00:04:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFxoI0sUhOGHGII3ElairMGRUp0HtKiR/CwHIdOfDMkEIGp5GwC16W3lVz+EG63d7nIXdSC92HmIJk=@vger.kernel.org
X-Received: by 2002:a05:6102:448b:b0:7cc:26a8:e726 with SMTP id
 ada2fe7eead31-7d739567d98mr1003780137.26.1795161415051; Thu, 19 Nov 2026
 23:56:55 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <cee843b319c9eceba2339f14a134e305a2b05d7e.1795029012.git.geert+renesas@glider.be>
 <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
In-Reply-To: <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:56:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
X-Gm-Features: Aa3M54pzvZjiNE5ltwUGvGnHop8D2bVYiqyWJcr5J_J0ppW6-NxZAErFEYs73QQ
Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/15] clk: renesas: r8a78000: Merge debug prints in r8a78000_clk_get()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 20 Nov 2026 at 06:28, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > The two debug prints in r8a78000_clk_get() are very similar.
> > Merge them into a single debug print.
> >
> > While at it, unwrap the (wrongly-indented) continuation of the
> > r8a78000_clk_get() function header, as it fits on a single line.
>
> It might be worth mentioning, that this now also uses
> clk_hw_get_name(hw) instead of map->fw_id .

clk_hw_get_name(hw) was printed before; fw_id will still be printed
in get_hws() after PATCH 04/15.

>
> [...]
>
> > -     dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
> > -
> >       hw = priv->fixed_hws[map->fw_id];
> >
> > -     dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
> > -             clk_hw_get_rate(hw));
> > +     dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
> > +             clk_hw_get_name(hw), clk_hw_get_rate(hw));
> [...]


Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
