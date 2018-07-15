Return-Path: <manivannan.sadhasivam@linaro.org>
Return-Path: <manivannan.sadhasivam@linaro.org>
Date: Sun, 15 Jul 2018 19:45:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Saravanan Sekar <sravanhome@gmail.com>, sboyd@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com,
	mturquette@baylibre.com, will.deacon@arm.com,
	linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com,
	darren@cubietech.com, robh+dt@kernel.org,
	jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
Subject: Re: [PATCH v4 1/5] clk: actions: Add REGMAP as dependency
Message-ID: <20180715141551.GA9980@Mani-XPS-13-9360>
References: <20180715123145.16975-1-sravanhome@gmail.com>
 <20180715123145.16975-2-sravanhome@gmail.com>
 <b0e29fe8-c16a-e783-8877-d01f052ba963@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <b0e29fe8-c16a-e783-8877-d01f052ba963@suse.de>
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Sun, Jul 15, 2018 at 02:35:53PM +0200, Andreas Färber wrote:
> Hi,
> 
> Am 15.07.2018 um 14:31 schrieb Saravanan Sekar:
> > Add REGMAP as dependency to avoid undefined reference to regmap symbol
> 
> Is this a bugfix for S900? Then please add a Fixes: line. If not, why is
> it a separate patch and not in 3/5?
> 

Yes, this is a bug fix for S900 clk and should have Fixes tag.

Thanks,
Mani

> Also, the subject is fine as is, but please add a full stop at the end
> of the sentence in the commit message.
> 
> Regards,
> Andreas
> 
> 
> -- 
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
> GF: Felix Imendörffer, Jane Smithard, Graham Norton
> HRB 21284 (AG Nürnberg)
