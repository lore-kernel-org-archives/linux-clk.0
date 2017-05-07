Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1493373403-23462-2-git-send-email-varada@codeaurora.org>
References: <1493373403-23462-1-git-send-email-varada@codeaurora.org> <1493373403-23462-2-git-send-email-varada@codeaurora.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 7 May 2017 09:45:53 +0200
Message-ID: <CACRpkdbvUBMMnY90gmAUMrUiEx3+gSdvm_oLPTLYej3vJivf1A@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: qcom: Add ipq8074 pinctrl driver
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Sricharan R <sricharan@codeaurora.org>, absahu@codeaurora.org, sjaganat@codeaurora.org,
	Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 28, 2017 at 11:56 AM, Varadarajan Narayanan
<varada@codeaurora.org> wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for ipq8074.
>
> Signed-off-by: Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>

Bjorn Andersson is the maintainer of the qcom pinctrl drivers so you need
to put him on the To: line so he can review and comment on the patches
for new qcom pin control drivers.

Bjorn maybe you should patch MAINTAINERS so you do not get missed...

Yours,
Linus Walleij
