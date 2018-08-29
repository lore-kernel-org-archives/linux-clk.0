Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 28 Aug 2018 19:36:10 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Add jz4725b-cgu.h header
Message-ID: <20180829003610.GA23941@bogus>
References: <20180823131744.744-1-paul@crapouillou.net>
 <20180823131744.744-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180823131744.744-3-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On Thu, 23 Aug 2018 15:17:43 +0200, Paul Cercueil wrote:
> This will be used from the devicetree bindings to specify the clocks
> that should be obtained from the jz4725b-cgu driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     No change
> 
>  include/dt-bindings/clock/jz4725b-cgu.h | 35 +++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 include/dt-bindings/clock/jz4725b-cgu.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
