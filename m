Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521533741-8075-1-git-send-email-mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 Mike Looijmans <mike.looijmans@topic.nl>
References: <1521114608-21967-1-git-send-email-mike.looijmans@topic.nl>
 <1521533741-8075-1-git-send-email-mike.looijmans@topic.nl>
Message-ID: <152182467481.178046.2010749144270859022@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3] clk: Add driver for the si544 clock generator chip
Date: Fri, 23 Mar 2018 10:04:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Mike Looijmans (2018-03-20 01:15:41)
> +
> +static bool is_valid_frequency(const struct clk_si544 *data,
> +       unsigned long frequency)
> +{
> +       unsigned long max_freq;
> +
> +       if (frequency < SI544_MIN_FREQ)
> +               return false;
> +
> +       switch (data->speed_grade) {
> +       case si544a:
> +               max_freq =3D 1500000000;
> +               break;
> +       case si544b:
> +               max_freq =3D 800000000;
> +               break;
> +       case si544c:
> +               max_freq =3D 350000000;
> +               break;
> +       }

Sad. My compiler complains about max_freq being possibly unassigned
here, even though that seems impossible I guess we need to put back the
default case. I'll take care of it when applying and assign max_freq to
0 by default.

Otherwise, applied to clk-next.
