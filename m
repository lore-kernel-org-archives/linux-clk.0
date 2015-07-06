Return-Path: <vigneshr@ti.com>
Message-ID: <559A1C1F.7000309@ti.com>
Date: Mon, 6 Jul 2015 11:41:43 +0530
From: Vignesh R <vigneshr@ti.com>
MIME-Version: 1.0
To: Paul Walmsley <paul@pwsan.com>, Tero Kristo <t-kristo@ti.com>,
        Thierry
 Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Pawel
 Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell
	<ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        Benoit
 Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell
 King <linux@arm.linux.org.uk>,
        Mike Turquette <mturquette@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] Add support for PWMSS on DRA7
References: <1433332284-10766-1-git-send-email-vigneshr@ti.com>
In-Reply-To: <1433332284-10766-1-git-send-email-vigneshr@ti.com>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>



On Wednesday 03 June 2015 05:21 PM, Vignesh R wrote:
> 
> Hi,
> 
> This patch series adds support for PWMSS on DRA7. The IP is same as that
> present in AM33XX and AM43XX.
> The first patch changes clock domain in which PWMSS is present
> (l4per2_7xx_clkdm) to SW_WKUP. This is because legacy IPs like PWM
> does'nt support HW_AUTO prorperly. Hence, switch clock domain to
> SW_WKUP. This is based on the input from the hardware team.
> The rest of the patches add hwmod and dt entries and enable PWMSS on
> DRA7 based SoCs.

Gentle ping...


-- 
Regards
Vignesh
