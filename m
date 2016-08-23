Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/6] dt/bindings: Add bindings for Tegra GMI controller
To: Mirza Krak <mirza.krak@gmail.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
 <1470512452-8322-4-git-send-email-mirza.krak@gmail.com>
 <901be576-a810-c630-9b83-de922e945df0@nvidia.com>
 <CALw8SCV9AyaAPKpRwRp72-dUz=cW2QZyywqjzS1noonTyGDYag@mail.gmail.com>
CC: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding
	<thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	<pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>,
	<mark.rutland@arm.com>, <devicetree@vger.kernel.org>, <pawel.moll@arm.com>,
	<ijc+devicetree@hellion.org.uk>, Michael Turquette <mturquette@baylibre.com>,
	<sboyd@codeaurora.org>, <linux@armlinux.org.uk>, <robh+dt@kernel.org>, "Kumar
 Gala" <galak@codeaurora.org>, <linux-tegra@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <07157e79-a22c-2b49-24c8-3a2c266f899f@nvidia.com>
Date: Tue, 23 Aug 2016 15:48:25 +0100
MIME-Version: 1.0
In-Reply-To: <CALw8SCV9AyaAPKpRwRp72-dUz=cW2QZyywqjzS1noonTyGDYag@mail.gmail.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>


On 23/08/16 11:33, Mirza Krak wrote:

...

> Like we discussed I am now trying to implement this but without
> success and I am starting to think that it is not that simple unless I
> am missing something.
> 
> Below tree
> 
> gmi@70009000 {
>      status = "okay";
>      #address-cells = <1>;
>      #size-cells = <1>;
>      ranges = <4 0x48000000 0x7ffffff>;
> 
>      bus@4 {
>           compatible = "simple-bus";
>           reg = <4 0>;

I don't think you want reg here.

>           #address-cells = <1>;
>           #size-cells = <1>;

May be ranges here?

>          nvidia,snor-mux-mode;
>          nvidia,snor-adv-inv;
> 
>         can@0 {
>               compatible = "nxp,sja1000";
>               reg = <0 0x100>;
>               ....
>      };
> 
>      can@40000 {
>            compatible = "nxp,sja1000";
>            reg = <0x40000 0x100>;
>            ....
>     };
> };
> };

Have a look at some other drivers for example:

Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt

Cheers
Jon

-- 
nvpublic
