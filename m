Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Yangbo Lu <yangbo.lu@nxp.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
	netdev@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	ulf.hansson@linaro.org, Russell King <linux@arm.linux.org.uk>,
	Bhupesh Sharma <bhupesh.sharma@freescale.com>,
	Joerg Roedel <joro@8bytes.org>,
	Santosh Shilimkar <ssantosh@kernel.org>, leoyang.li@nxp.com,
	Scott Wood <oss@buserror.net>,
	Rob Herring <robh+dt@kernel.org>,
	Claudiu Manoil <claudiu.manoil@freescale.com>,
	Kumar Gala <galak@codeaurora.org>, xiaobo.xie@nxp.com,
	Qiang Zhao <qiang.zhao@nxp.com>
Subject: Re: [v10, 7/7] mmc: sdhci-of-esdhc: fix host version for T4240-R1.0-R2.0
Date: Thu, 05 May 2016 10:31:36 +0200
Message-ID: <4448030.Zs8fVnr3nm@wuerfel>
In-Reply-To: <1462417950-46796-8-git-send-email-yangbo.lu@nxp.com>
References: <1462417950-46796-1-git-send-email-yangbo.lu@nxp.com> <1462417950-46796-8-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thursday 05 May 2016 11:12:30 Yangbo Lu wrote:
> 
> +       fsl_guts_init();
> +       svr = fsl_guts_get_svr();
> +       if (svr) {
> +               esdhc->soc_ver = SVR_SOC_VER(svr);
> +               esdhc->soc_rev = SVR_REV(svr);
> +       } else {
> +               dev_err(&pdev->dev, "Failed to get SVR value!\n");
> +       }
> +
> 


Sorry for jumping in again after not participating in the discussion for the
past few versions.

What happened to my suggestion of making this a platform-independent interface
to avoid the link time dependency?

Specifically, why not add an exported function to drivers/base/soc.c that
uses glob_match() for comparing a string in the device driver to the ID
of the SoC that is set by whatever SoC identifying driver the platform
has?

	Arnd
