Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165044;
	b=EQkny8NupNK+UNPtimDONp01w9bzQV19VmDg+su3jtvnU/y3dj0OjjOkKxiVe2ugUfPj
	 9dt5+XwvbGJZlwOvclOT0aSVyXJVRR+U3q4LlDeZfoNqh+/RNegJtzpfNEyRnVYX/vZOz
	 hu6LmHSe0Pq5xglBuc8BNE3LSDDROqLtEHlHj+syRY9xRdvzzHr8PfwFkuKz8r+0Bai5p
	 RyN5IvXP40rRpW33lrG/zGS10Sc30wcVRwWtCbDVjPZ2q98lBhWvhA+YebK9gGJdq05P1
	 PVBTSMAAvd3/JIxtrT6ebhxSTwc4bPFi29Ei6QyKjE+mwuB0mfRTffsJLLCXeUNWo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165044;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=slnLzkdmpwFbnxdOJOf8j6Mw1PiHOu2DMR+OPWGMV3g=;
	b=kNV4Tz+MQcCy0hWUUWpjpEvyxsEEci8APIEfeDHKhZR3rcr77BWUdwCvkgo8K/esDRYx
	 g6axw3iw8EykfK+lj7Bq/RggmdV1F0aZOlE3UzQ5vg983zpJL1FAd54PL5YCwvLWCDyAM
	 dwMoumtjHbff4c7TW5m+2Yju6qtEsGIq5C4uzUaU5bjkRWhx3Iq+ZI9I2LE2ksftebDg5
	 87uTj4wWtPxD+F3Tt4zk+aqW+0IldmBY74OjQESDq9FcBzTjWHuVdisT7OFlyM259NeuE
	 cmhT2Yq/tIsmBsYWxDIsShZs6PgZ2QaVtL5rO39GX6sEumWq9m4ZYsz9rwLI0hfycPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C0D606A320
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C0D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9495d543c42so74250485a.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 00:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165043; x=1795769843;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slnLzkdmpwFbnxdOJOf8j6Mw1PiHOu2DMR+OPWGMV3g=;
        b=G29LuMvjRay9ipgdjzHFCCuUdPXDWrpSSTjXGxOTSufP16hnRlpwyNsRrHA1Bhbyjm
         ikrzrRO9OREUN2h5CXAA5ZqAZsUDvwEM+5hDszD6twsT3lK7G0XYnlbUW8d+aY/p2Psv
         Xxqd5fgstW57EsRWRoK/A+yRqPV3BUXe5NJjyyd5O8v9a0y8/fQAIWXELjVGhsiQwaoA
         J/E+sgxV/dkI3qnBI8//cVQN8kxVxpP96mnwwSmBvb188nCaPhRnQe8J2Nck4oTPWCME
         wHMX4awDdIVG81UVg7zst8AuSQ/XCXp1TXqfIqExaSA6wULUtsVqJEZpR8R3/4jyHvh3
         bFwA==
X-Forwarded-Encrypted: i=1; AL+hErHhl9eUMhg45da+l6+4fLyRD/drKtp+vbN9lcGobYE+Wuh82u+4pcfG9F4YOebJpoky9+iQZaZ6QlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uCaMFCRvHgZ279S/qI7teRWzU3VcSbQO4LXiRb+B0ohyHLg8h
	bznQx3/LNc3QAUIPpauModcb9OP9oO1y9KikOFbNBF5YmCK6WpY7OVZhHkeLSouU
X-Gm-Gg: AYBFou2I3iclUVh6hmLPAxKVufgyRpGZ27r2+tDe/qyHkmSrrvCHnS/G1+r42aVfFYG
	Eo2tEGzkfrvaV1FJ2j1IwjcP/zRtzLWUah8vIji3biP3+dGFG/LI8cLXMo53EBJTXLEJxrihEts
	4Q1F7tTWfz/a/+plILsMZKN9UqRPAwCWs3Amqbtcfps5oNAp3/gvO5ep5RT0Aruc0lLYUiqjtAB
	g3boi0NO2FLLMs8J7AveDNGko8a/g/oA48z7MbReX7oJM/7IiAQY44yZu6pnqqu5A2mtlmV90W/
	uRBIlpEsrbZbDVn42KE4/mjns364gwGoWtO15Eu4UBnEOPDg6kf7J0tH7i/xwg4TFSw/EKQayhr
	vCDO/Wx4016KNZlh0Ewa+Sksfr9/zAZLs2oogcRmb1XLYrGbmM78RSZYNd0BKIjHmd15swIQldM
	WrpoB8Wmr8NPVDuVWSmaYYjMAS9DQtwJTCe5URMCXCoZNLugB3TPfT9D+LmVjehDXoM/lkBtiGy
	zz7Vev/0wpH8tSb1GPSMEhb2Zg0VQoWHtuHEplctQdMAFAjBAFnE+pGTiOgNIJj0MECVrY1lprv
	0z+zlTV6yoWBkffxjR9nOIbj9zXvhKskySRNcpmdLA0rsLYT/b2MjfAhKdNBsyleV+eK
X-Received: by 2002:a05:620a:4408:b0:945:d852:1618 with SMTP id af79cd13be357-949bab14280mr372859085a.70.1795165042784;
        Fri, 20 Nov 2026 00:57:22 -0800 (PST)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm146689585a.29.2026.11.20.00.57.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:57:22 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92134c4592dso6810696d6.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 00:57:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEOvwf6iPFjiSqSLALoy7F6P0EHlDdjZdH9OotInj3Vi+iC7J9sF6QIl3rDRyuuES+donZpcFQ3AFA=@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:7c3:7286:c291 with SMTP id
 ada2fe7eead31-7d739587805mr971622137.19.1795164590827; Fri, 20 Nov 2026
 00:49:50 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
 <20261119225017.15a7b5cc@kemnade.info> <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
 <20261120094320.442d064b@kemnade.info>
In-Reply-To: <20261120094320.442d064b@kemnade.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:49:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWiCODz6RC9Q9-xMM5_k3grHztiLuR+-ikOZYoBawVvZg@mail.gmail.com>
X-Gm-Features: Aa3M54pnWIgbseGoLAFGMXWb1P8DBLFzk6LU-uNSdaE_BgKhwLT8uPsc_3uFT5k
Message-ID: <CAMuHMdWiCODz6RC9Q9-xMM5_k3grHztiLuR+-ikOZYoBawVvZg@mail.gmail.com>
Subject: Re: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to dev_clk_get_from_provider()
To: Andreas Kemnade <andreas@kemnade.info>
Cc: ettore.chimenti@linaro.org, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

On Fri, 20 Nov 2026 at 09:44, Andreas Kemnade <andreas@kemnade.info> wrote:
> On Fri, 20 Nov 2026 08:49:05 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, 19 Nov 2026 at 22:50, Andreas Kemnade <andreas@kemnade.info> wrote:
> > > On Thu, 19 Nov 2026 14:40:38 +0100
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > >
> > > > OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
> > > > used for power management, so the latter show up as "deviceless" in the
> > > > consumer column of the clk_summary file in debugfs.
> > > >
> > > > Fix this by using dev_clk_get_from_provider() instead, letting us pass
> > > > the consumer device, too.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Compile-tested only.
> > > >
> > > > The first change is probably OK.  The second change may fail if anything
> > > > in the oh->od->pdev->dev chain is not available yet at this point.
> > >
> > > Test on OMAP3:
> >
> > Thanks for testing!
> >
> > > --- clk-old     2026-11-19 22:44:59.810807920 +0100
> > > +++ clk-new     2026-11-19 22:26:52.862531880 +0100
> > > @@ -1,17 +1,17 @@
> > >                                   enable  prepare  protect                                duty  hardware                            connection
> > >     clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id
> > >  ---------------------------------------------------------------------------------------------------------------------------------------------
> > > - oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      of_clk_get_from_provider
> > > + oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      dev_clk_get_from_provider
> > >                                                                                                             deviceless                      no_connection_id

                                deviceless
mcbsp_clks
> >
> > Hmm, so the passed device is always NULL, and thus there is no point
> > in making the change.
> > Do you know if these come from the first or second change in my patch
> > (I guess the second)?
> >
> From the first change, The second piece is nowadys only used by the dm81*
> devices.

Interesting.  So that means all/some of the existing use of
&od->pdev->dev in _add_clkdev() is futile, as it may be NULL?

> I would prefer to have this tested on dm81* too.

Agreed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
