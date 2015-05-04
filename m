Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1430757460-9478-2-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-2-git-send-email-rklein@nvidia.com>
Date: Mon, 4 May 2015 11:05:51 -0700
Message-ID: <CANLzEkt+jiwCR_W_nszPW-Q+bRqHj5BWGQDjqsxfKtLm6Y=Zyw@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] clk: tegra: Modify tegra_audio_clk_init to
 accept more plls
From: Benson Leung <bleung@chromium.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> tegra_audio_clk_init was written expecting a single PLL to be
> passed in directly. Change this to accept an array which will
> allow for supporting multiple plls and specifying specific data
> about them, like their parent, which may change over time.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
Reviewed-by: Benson Leung <bleung@chromium.org>

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
