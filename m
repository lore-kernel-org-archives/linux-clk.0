Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: Initial DTS files for Broadcom Stingray
 SOC
To: Anup Patel <anup.patel@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <1494071686-19098-1-git-send-email-anup.patel@broadcom.com>
 <1494071686-19098-5-git-send-email-anup.patel@broadcom.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>,
 Oza Pawandeep <oza@broadcom.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Pramod Kumar <pramod.kumar@broadcom.com>,
 Sandeep Tripathy <sandeep.tripathy@broadcom.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Scott Branden <scott.branden@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <38356358-cfd1-9a29-2b53-80ed495573c6@gmail.com>
Date: Sun, 7 May 2017 16:30:29 -0700
MIME-Version: 1.0
In-Reply-To: <1494071686-19098-5-git-send-email-anup.patel@broadcom.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Le 05/06/17 à 04:54, Anup Patel a écrit :
> The Broadcom Stingray SoC is a new member in Broadcom iProc
> SoC family.
> 
> This patch adds initial DTS files for Broadcom Stingray SoC
> and two of its reference boards (bcm958742k and bcm958742t).
> 
> We have lot of reference boards and large number of devices
> in Broadcom Stingray SoC so eventually we will have quite
> a few DTS files for Stingray. To tackle, we have added a
> separate directory for Stingray DTS files.
> 
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> ---

> +
> +	scr {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;

Sorry for missing that during the internal review, the ranges property
here should include the 6300_0000 offset such that everything else under
the "scr" node is relative to that base address. This makes it a lot
easier to understand the different physical addresses involved and the
bus topology.
-- 
Florian
