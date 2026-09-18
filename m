Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0D2C15A5
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716947; cv=none; b=Q1CCFdo054nb+QwKV6t5ZxqDMbWCM6v38IqDyLHtOgrx1z/tMNVcEbohA2PiRIAHwTBI9X0+jwcGrMNFfTioF9MLBNgMu0Sl1rNX87Goq/sXMz+kxY0hIYxXbuaDdeYuaqfB7qHUKF4pxbp2uOylO6Yv02wodFqtrqm5OGrWZzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716947; c=relaxed/simple;
	bh=cHVPOWKKfhZVIB7cWuXyuW2OrGOIzBYJeXQE3IvAcLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXQCWdPKWGjio2JLRKEyHYaHTykehO/KKKaYxh/rtgBh2DoLOZfvRgu7mcoQu9hBJJkG6CYvEldKKr50h74wtzLwCnokh12thf18sx3x3QPKRLwAbY+G0D7NOgjKkH4jsCh0n3rcHfS4ABEwcaOTLgVj4vRkITFyseG9+y89n+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-79028ca939aso236296137.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 00:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716936; x=1790321736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WtucTJYH5u+SsiRL/3DRg9hQeKGo+JDwDdtR43iO30=;
        b=Od3xnIZ8mqHAqLP+QieaAp7BN1yCJJaDM58By3fqrhdm9OXMeWBCOaMxBRVxnB3buT
         Op+w+hFe87RwJSQGxoJjiqQbsABMhZNHSmjYPRryiebR6J8RA+1EDO4JsSjzYT611d92
         /TcLavTJkhUuhtzuD5GVhO9+A/ps6jt4CLOCWUwKox5FAKrXjrEp2kYXJCNaHpiW1Caf
         8LVjzgvt5WoE8ZkVmsrT7Wm+/W8g4bEtrKFEJcDMxtePPgwqT6JR6hc/yGvhYpHkTbMh
         oEsFt2Ze/CXt/PmYtSlaUgmX0LUhi0mHb2rdLXn/hq6JDDZALDiIWpGuBhzhE4lW1uOG
         +oLg==
X-Forwarded-Encrypted: i=1; AKwUvByOEyysCl7a4idDmWK1GbK9pVGlqKNsu0iPSpBRJOqIeBnauFyCQA7DcEXikTFaQQWMwfkP1ttKFwM=@vger.kernel.org
X-Gm-Message-State: AFuF++nfVVg5LXjXZMf5x38hi6KbBEVu1H7GAptJruYlXTTtjW15zEgr
	uuJqcfrrM4PsnsdzNiTm537k8DdaX02xp5wE2k7kqZk8Uge0jLPfvI6QLrjZ5RyF
X-Gm-Gg: AYBFou0CVzWIy5dlQ4Frg+d1OT+aCaXBfiRaKAzZlBCVbwVl1rSyellHElooTtWWKzy
	Kja/Qm+f9KWlPALySgKxL56DLJ9ILn6CvpSzZhPDtOywLxN6CZogmzfpd6Aglv/wXlMWl950S0a
	UGvOpdbqPHXtUB6s9C4ZVd8phWM6Nx/tEiL4nLQB9ta+REk53LPGbaVKTHVZlGow8Lb8oB1UrqW
	X2+aqP8D8Khrw2vez7FtqIuJ6gFnt7xTexzx15a3REbeU49DFr1JW+Tqp9+ZMQHcUHPol3GFK/O
	MB0K86aLL3S5iAC1PdyNvgOn4qMoyJjRgFNlXCPkcPZRr2XCFezK/0cVZhbw7lnaggHSSBCVkdq
	kN9kHxIsCV1JwrdiwMaSllNlVEpmwsAZOvFAv8jnUelxXox4ksd3z+Ns+6xB6S+Upd+doGODxul
	/nBiIEzw//9R+VuDgqyqXmzJNRIilNGLqC/avOwYpZCG1JQxg8EIC4qhkVCYrxBRdEJeeG2+UkG
	r3LcwFAIv6zY82+dWPmJtONB8KXKAhEdq5+
X-Received: by 2002:a05:6102:2928:b0:7a2:eb9d:d72c with SMTP id ada2fe7eead31-7a55d28b489mr541789137.17.1789716936625;
        Fri, 18 Sep 2026 00:35:36 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a59c06ed92sm934446137.7.2026.09.18.00.35.32
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:35:33 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79028ca939aso236271137.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 00:35:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4HjqDqTfi7iPAtDOJZmFG+3gU6xTmyHK9550eijzUfNEPRx6LctXWRWwErFJqOv/5jMsicEHqr6g=@vger.kernel.org
X-Received: by 2002:a05:6102:91c:b0:7a3:2e52:1163 with SMTP id
 ada2fe7eead31-7a55da9b0damr516237137.26.1789716931735; Fri, 18 Sep 2026
 00:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-2-4c72d4e086dd@ideasonboard.com> <20260918011156.GB145152@killaraus.ideasonboard.com>
In-Reply-To: <20260918011156.GB145152@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:35:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
X-Gm-Features: AcwNN1Uhv0ZzlOO0pTf4pD3p_OGSBmogWfpHa_8PkhuJrVnrMv3c15ALo4pMZkM
Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: renesas: r8a78000: Add clock for FCPV and VSP
 for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Fri, 18 Sept 2026 at 03:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Sep 17, 2026 at 09:04:41PM +0900, Paul Elder wrote:
> > Add clocks for the FCPV{B,I,D} and VSP{B,I}. They each have one clock
> > from an option of two: a 1066MHz and a quarter-divided 266MHz. As we
> > already have support for the 266MHz one, add just those for now.
> >
> > Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> > ---
> >  drivers/clk/renesas/r8a78000-cpg.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> > index b820d09e1a195068debe8a6eea7a01c534a97b23..17792ff6ab8ae2f7eb5c8f7e3d581b43177e195d 100644
> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -326,6 +326,8 @@ static const struct clk_map_in r8a78000_cpg_fw_4_31_0[] = {
> >       { R8A78000_CPG_SGASYNCD16_PERW_BUS,     FIXED_CLK(66M) },
> >       { R8A78000_CPG_S0D4_PERE_MAIN,          FIXED_CLK(200M) },
> >       { R8A78000_CPG_MSOCK_PERW_BUS,          1667 },
> > +     { R8A78000_CPG_SGD4_VIO_DP_TX,          FIXED_CLK(266M)},
> > +     { R8A78000_CPG_SGD4_VIO_DP_OTHER,       FIXED_CLK(266M)},
>
> Same comment as for 01/10. I think the two patches can be squashed
> together actually (unless Geert disagrees).

DT binding definitions are shared by driver and DT sources.
Please keep them separate, so I can apply them to the shared
renesas-r8a78000-dt-binding-defs branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
