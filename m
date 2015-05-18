Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431946983-29554-1-git-send-email-bilhuang@nvidia.com>
References: <1431946983-29554-1-git-send-email-bilhuang@nvidia.com>
Date: Mon, 18 May 2015 09:53:14 -0700
Message-ID: <CANLzEkto_rDBvyM0ra4ymaT-L9q1DxBqKgzxy2GEYKEE9KDuuQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: tegra: read correct iddq register in PLL_SS registration
From: Benson Leung <bleung@chromium.org>
To: Bill Huang <bilhuang@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>,
	Paul Walmsley <pwalmsley@nvidia.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 18, 2015 at 4:03 AM, Bill Huang <bilhuang@nvidia.com> wrote:
> This fixes bug in tegra_clk_register_pllss() which mistakenly assume the
> iddq register is the PLL base address.
>
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>

Thanks for the quick fix.
Reviewed-by: Benson Leung <bleung@chromium.org>

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
