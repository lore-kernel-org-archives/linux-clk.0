Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1496316482-25468-2-git-send-email-varada@codeaurora.org>
References: <1496316482-25468-1-git-send-email-varada@codeaurora.org> <1496316482-25468-2-git-send-email-varada@codeaurora.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Jun 2017 10:56:36 +0200
Message-ID: <CACRpkdaLhD+ONwDTebT7q+M-CHDVPKUE4eKfusmyWkitQC1ZPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: qcom: Add ipq8074 pinctrl driver
To: Varadarajan Narayanan <varada@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, absahu@codeaurora.org,
	sjaganat@codeaurora.org, Sricharan R <sricharan@codeaurora.org>,
	Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 1, 2017 at 1:27 PM, Varadarajan Narayanan
<varada@codeaurora.org> wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for ipq8074.
>
> Signed-off-by: Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>

It's a good idea that you include the maintainer, Bjorn Andersson
<bjorn.andersson@linaro.org>
on these pin control patches. I'll wait for his review.

Yours,
Linus Walleij
