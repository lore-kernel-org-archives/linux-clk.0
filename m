Return-Path: <tomasz.figa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1464095957-25851-3-git-send-email-b.zolnierkie@samsung.com>
References: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com> <1464095957-25851-3-git-send-email-b.zolnierkie@samsung.com>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Sat, 18 Jun 2016 23:53:36 +0900
Message-ID: <CA+Ln22FwQ_e5OHg_8WHEWGER=X8g_Yq+NpVLONgb0ZAShJLjzA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: samsung: cpu: prepare for adding Exynos5433 CPU clocks
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Bart,

2016-05-24 22:19 GMT+09:00 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>:
> Exynos5433 uses different register layout for CPU clock registers
> than earlier SoCs so add new code for handling this layout.  Also
> add new CLK_CPU_HAS_E5433_REGS_LAYOUT flag to request using it.

Have you considered abstracting this? Comparing existing code with
newly added one, the differences don't really seem to be that huge and
it looks like there is more common code than different, except maybe
some numeric constants that could be put into a struct.

Best regards,
Tomasz
