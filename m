Return-Path: <gnurou@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1463432860-906-1-git-send-email-rklein@nvidia.com>
References: <1463432860-906-1-git-send-email-rklein@nvidia.com>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Wed, 18 May 2016 13:02:21 +0900
Message-ID: <CAAVeFuLmjZ3vN0Q-7T=kEw_d4P1uS7mBmirpttXkPC+isKELYg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: tegra: Initialize UTMIPLL when enabling PLLU
To: Rhyland Klein <rklein@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Michael Turguette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 17, 2016 at 6:07 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> From: Andrew Bresticker <abrestic@chromium.org>

...

> generations. For instance, in clk-tegra124.c, it used to have:
>
> when the correct shift to use is present in the new version:
>
> which matches the Tegra124 TRM register definition.

Seems like the examples are missing?
