Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA534C753C
	for <linux-clk@vger.kernel.org>; Sun, 18 Oct 2026 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331523; cv=none; b=nbw6qsF2S6cKxdrMTIqrfJOmyYgVFWZ0Q3/9JLAY9kUQuzJJrc7gdoWqd0LQdhZ4CXRmlnDqT/AHRvZtSqyx0wznkgZQo99pLCTirWtsZ3AvkqNcJYkUdWaZi6VZLmkZ/tPfXb/pwojWg/EEmxDjy43smLTh3PE5SnmYPo959MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331523; c=relaxed/simple;
	bh=rCFulCS196Fw/DBDyF9OMjFHIxiu7hy/WMzgUHoLoLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3F4w3u8JCZV6O4+bl6Lp14Oem/iv5C7cikHERTgae14oBZH/2TMMtEOc2WciKF8VYCkH+ZChKvZK/M5iJH3/UW2Kg6z3sayEue3CqK9vOEAena7fVCgZnMTChg9rHUlEkF9SvnZ7Zeq8KopbeU8XNBnx7EvYO8wiKLrB2l+z1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e7834687easo289511e0c.3
        for <linux-clk@vger.kernel.org>; Sun, 18 Oct 2026 06:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331518; x=1792936318;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhGyumamsbJwvfAtfGydBWyfBrT9VHxtfq0yzwmUVgA=;
        b=IOAk90UT2mE1haVusUntuROzk2ZNJhl1qp/jQRVQfNo6eM68HvwclJgYuyW5zKmJO+
         FtjbtblImlmEtkWejGLy6wm4ffCYhTccfs05qybtLkOwELr0KR5BXRNlHM+MRKfPa3K7
         O0gFvlpGRTwjKL+kSr6sT8vKcvSjZnl9GzijoKtPUyVVW+pessKraLJmSfroJhO/BjtP
         WH0cbSa4WV9gZtQ3Ky542NUxWrUuSTa9REig3xviyeUK98HrqSrnG1c/g3HX7afkWX4W
         NrIfZffGLN4djmPAie5Uyei8bYupvFCCmvOqywgPqXHw47kvUobh6CZWS9+FryYLhEdx
         0gWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzInOlgbM5GsswY0Hq9VJ/CI3geHn616jp7AnaL+0kqnLfvKPtwDg3ZJK50Ul4pLS/+bNraEREm6SA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKow5vLxKLkWgVY8S9nI3kJXL286Cmj1QAPmr5UV7mc2t7qe+pI
	v2V7qVrXxGUCwNYRqelw0NHfmqg5dy0TL88axs+AgEdndDbFNDV30PECcddL0pFn
X-Gm-Gg: AYBFou2EIEmyd1mNrWAaDAzLQp7Pqi4BeUg2BrmznMefykhcaia4jm7RYHd4mSWnutZ
	F0SythgP0vJ9HIuRfkVVP/99Fmduaf9zBD5u9Bi3V8SL7f+jgMbcKauOVeaC/936MtqoXI6eVPO
	FHg47m0ceuhJ7Y70zA06clxEJQoQtBX7+U0gkCkfzaV7oQC/asd1/Cew6+Ttph7LlEjAXpwwlex
	QBZt6aKLC0SXNONjz9zfQIdPPs6/9JRs5MHwO/2Ob2Bj7hwlzP5/hy55HdY23jda0YSOLwif+r/
	bFmKfI5a8YeiSwaCSmC5W7JDIyvdNdSVoph4M9YjR8We8hBOe5yH90XaoVPoausjfsNEUACpBnv
	zUQ9vMUh04HdPmsRmOTsJu3tEOZZzp5BkiTVChNnF3hs4VxLiinIHBsJ7crkJoejJPUAPB7O0UX
	vwKg23kG0HhnAMWqAjtGKHyPV3pAioujCiB+AsQgEpPRklcprsZpL/mi7sSW8Hmidwi8Ytev5YR
	rXqmhUfmYLYKcsI6LIKQQK2+G+BHUUInlVkJJKZImwmOCJ9
X-Received: by 2002:a05:6102:3c91:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cc36a1af41mr1216818137.17.1792331518658;
        Sun, 18 Oct 2026 06:51:58 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm6959723e0c.3.2026.10.18.06.51.58
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 06:51:58 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7cc603a168fso13982137.3
        for <linux-clk@vger.kernel.org>; Sun, 18 Oct 2026 06:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwihHz4WTTvEFzIUNps7J/ATSpzLwEejpIKu7ypOgUpjO7BaPs9fqho9D9z3GlaEcu6HyEurX3QMlM=@vger.kernel.org
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id
 ada2fe7eead31-7cc36b49079mr1291606137.34.1792331517781; Sun, 18 Oct 2026
 06:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
In-Reply-To: <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 18 Oct 2026 15:51:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
X-Gm-Features: AclHuK8HjL2MgNJEhgQ8UPYzZV_qfVLea-QA-Rw_khapKdsDEf1HaCakMPT5y5o
Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
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
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 17 Oct 2026 at 19:34, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/26 5:55 PM, Geert Uytterhoeven wrote:
>
> [...]
>
> >   static int r8a78000_cpg_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> >       struct r8a78000_cpg_priv *priv;
> > -     const struct clk_map *map;
> > -     int ret;
> > +     const struct clk_map_in *map;
>
> Super-nitpick, use reverse xmas tree ordering here if there will be V5.

I believe that's already the case. What am I missing?

>
> >       map = of_device_get_match_data(dev);
> >       if (!map)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
