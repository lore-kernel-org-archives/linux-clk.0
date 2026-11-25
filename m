Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618861;
	b=rtYVim5IoIEsF6behGcQBZprSs9m4whSVyagNB22QrLRCPZkyRyDWHNdoFKwUSNcIkaH
	 PK4fnmKDLT2ISz+GxhQkP/wjdUuf6A1X8KxB0vSfPq1nYVmDf0QM+6e1WDEf5CvQ7KRQt
	 VOpLPVio4WSeKxPUrRMc9fF5etupbxXbl0KExBY/n5klZKPjOp5a4zXV2L8lfZFboOzSw
	 VLmA+lTWYjquK9xA2EU3Z0AlyiRdHzjmwl5TIvQ88JGPng+9NQ8zlD2msD8DaZ5LI5HUs
	 DRiBdBdEie+Lab5uk1fVOzcZnyYFyH26wT8Gz0B+XUIcKnd/g1nxpDiy+2gnaPKf/ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618861;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
	b=b+3NSWey9kMb+th1UzqfZle55GEsVnN0IisHY7G1mpQNBmyLGOfkiayn8rLF3+i7IumH
	 O9doiV5hLohU0uj0SpVw150J0j0aD5Er5c9xGELsqMY5LpdhkB+9BFkNguuRPzBPHQK5e
	 wxZwxTbFsKDjTOlOJOE+PFSLULI4VIACqNkH3fUbbBK/F1NqEtA12a80FSgqNCKxCiIYY
	 OO0J3HNsZJD1slia/nsDsIVyvD/maAmEjRbE/ludZVWOvnlDntaLA93Z0LUazFZb+ToDb
	 61o+0Z5HlyFC/t8zJ0HrFYvTJxrRg0msP0h3wtcGzSvWwnSR/spFyvCPl7Nbifq3xnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DAA606A321
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 15:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DAA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so9107328a12.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 07:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618859; x=1796223659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
        b=kC76S6VhaBNkmkXAQXp0AGnWbePsEkwy//wZhvPc44E2HofP5dBHBVb1B1N2UBy59n
         KwyiHo+NfMCijQ0tWeznVaM4hE6BTI9nKu7vrIpbFUeeA9yms8JVcoVEUhd2r5QSwWlT
         jF39JoO9TGZTuA6K6FO7hifavsP7tfxC9IQ94Q9DGRutklpvgJh750Shtq3sMxNEGWbB
         4wQ0R95B9Qq77HOEw3UFlnRSPxSpOR+GNBYEzPGUTLUooRYUchGCpNFscClW9vMiol6t
         LLluTDErU8khKWUkDCIn56GZf/SfmvJAP/W8WSY61ezJAlEYLa9wJl1Z6/UzFQHeKRd+
         j8LQ==
X-Forwarded-Encrypted: i=1; AL+hErF0e04PqGKWvlFts53AggR2Iyzx8u6tmELAc3q1vao/4SwBI7/CeW7o2o9f2/XuZXv9Di4hZ3lk6v0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IrJyjDsaBbYSpb1vFepAtWvRj1baR7A0DmY0+2oAgnGisSLYe
	R/8LajZieRxW/o/FyM/Oh+HoIPD6qaHHMt4quYbjJ8ld2QmEPf5UTr45sOrNcJfI
X-Gm-Gg: AZFdTZdrFkdv5PK2JmpFb/homaZugL4MHJyiudFElj2a+OwrM67wc4xNF5TZJdRzpLM
	buUYpSoAfyPixvj1MIcgnuOktr0Csnvomk6eIV9v6qJt51IA90mG10yihfQs3N1oTjJer1P+aye
	gsy6si7qtT2cm/hHW0CzYxFl6Vghy0r3pgUPcqIPc+FKaJkkwlDPKe88cAa+K+s8fsX3Zk7D7b1
	jrq/lEhGLPfkcXLCJjlIOcv0HuFLGhhz5JoxAe3hobfaXSjtp2CvBzfDHsh0xRDHTjTejQ5J0qz
	gK5cKXwf0IJbiLPvUhH6Fy0xhtzEHn7/TSF7U6HfBF6E5kJFWgQBWNxpbpVk7olHJoI82xPKCLI
	8YtS9/tP36wQNK2qPWAdPtke0PGuepzYVr0MWAfKA+pWXlwK7kmleWqgg5qAo/4Ut7tSAIx+U2T
	EPBcHFg1839g4zwJ27wLUZweBhHNrq8pnqJZnCCqf2tffbQoHJogjJKWCeRsXtlOd4Nl3yg7q3g
	ZYCSQM3aC+MxnfjwcVOZUQuHGLeqz/4xMuIHPEDMDBVF38gA76XQjbFdJZcEOJuO+6iueBJycvT
	sir2FNS2kr/36bizyHHg7MB+GL+44TpAjbwlk1IGuN2xC5U1wwqlUOCEE9g4/IjZJNoy
X-Received: by 2002:a05:6402:899:b0:6b6:eefc:ae78 with SMTP id 4fb4d7f45d1cf-6ba37c76171mr10425066a12.2.1795618859057;
        Wed, 25 Nov 2026 07:00:59 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm8077347a12.14.2026.11.25.07.00.58
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:00:58 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9213e130a16so33439896d6.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 07:00:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGNj2YAI9ugHiXDQ1JuBZoo7eB4y+kV3fvtfOoRB7a4CyWeQOOw945tyoWQsVUyFnk5Svv7rztuDAQ=@vger.kernel.org
X-Received: by 2002:a05:6122:1784:b0:5dc:d0cb:7d74 with SMTP id
 71dfb90a1353d-5ee8adf3de4mr9944668e0c.2.1795618371669; Wed, 25 Nov 2026
 06:52:51 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato> <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
In-Reply-To: <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:52:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
X-Gm-Features: Aa3M54re5ZNPOW-XITDy6yDteWVZ0ZL2EVGMi9yHMlXJRb9PY-Nvu_jZHjCd6J4
Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Fri, 20 Nov 2026 at 15:33, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/20/26 12:10 PM, Wolfram Sang wrote:
> > Yes, this means the driver is then tied to a specific firmware version
> > because it only has this mapping. Not nice for a user. But we didn't se=
e
> > another way moving things forward for now.
>
> I think the DT is that other way.
> With the SCMI ids in DT, only the DT is tied to a firmware version, not t=
he drivers.

This only focuses on the IDs, not on different abstractions offered by
SCMI.

The latter leads to the need for changes in (many) DT bindings and
drivers, to support the same hardware blocks that are already supported
without SCMI in the same and/or older SoCs.  How many different DT
binding variants, with corresponding more complex handling in drivers,
are you willing to support for the same hardware block?
The remapping driver takes care of this in a single place, avoiding DT
binding and driver changes all over the tree.

> If a release that changes ids is already out, it needs a new DT, or a qui=
rk for that one release when the DT cannot be updated.
>
> The hardware stays described

SCMI IDs are not hardware description.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
