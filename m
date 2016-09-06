Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 3/6] dt/bindings: Add bindings for Tegra GMI controller
To: Mirza Krak <mirza.krak@gmail.com>, Rob Herring <robh@kernel.org>
References: <1472045838-22628-1-git-send-email-mirza.krak@gmail.com>
 <1472045838-22628-4-git-send-email-mirza.krak@gmail.com>
 <de2fb909-829e-6c04-4f6a-442cbb9171c9@nvidia.com>
 <CALw8SCVcPymDZ8NyUbeanRF0TCT1TZzL6iRDticYA42FWrEWqw@mail.gmail.com>
 <20160830170636.GA8741@rob-hp-laptop>
 <CALw8SCUYQGWXn7=Jpn=uvFvvPRVFQGrtSNot+-tVgP73yAEEOQ@mail.gmail.com>
CC: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding
	<thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	<linux@armlinux.org.uk>, <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>,
	<sboyd@codeaurora.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <96929bd4-9fca-634f-d8a4-62ad26abdea3@nvidia.com>
Date: Tue, 6 Sep 2016 11:35:24 +0100
MIME-Version: 1.0
In-Reply-To: <CALw8SCUYQGWXn7=Jpn=uvFvvPRVFQGrtSNot+-tVgP73yAEEOQ@mail.gmail.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>


On 31/08/16 12:22, Mirza Krak wrote:

...

> Taking your comments in to account I end up with this:
> 
> gmi@70090000 {
>         compatible = "nvidia,tegra20-gmi";
>         reg = <0x70009000 0x1000>;
>         #address-cells = <2>;

Does this need to be 2? Seems simpler if this is 1.

Cheers
Jon

-- 
nvpublic
