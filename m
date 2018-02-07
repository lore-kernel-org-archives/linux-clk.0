Return-Path: <pdeschrijver@nvidia.com>
Date: Wed, 7 Feb 2018 14:37:51 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>, <robh+dt@kernel.org>,
	<mark.rutland@arm.com>, <devicetree@vger.kernel.org>, <lgirdwood@gmail.com>,
	<linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Message-ID: <20180207123750.GA5850@tbergstrom-lnx.Nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
 <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
 <20180207104351.GA6003@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20180207104351.GA6003@sirena.org.uk>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 07, 2018 at 10:43:51AM +0000, Mark Brown wrote:
> On Wed, Feb 07, 2018 at 10:47:44AM +0200, Peter De Schrijver wrote:
> > On Tue, Feb 06, 2018 at 04:35:44PM +0000, Mark Brown wrote:
> > > On Tue, Feb 06, 2018 at 06:34:02PM +0200, Peter De Schrijver wrote:
> 
> > > > Add API to get min/max rail voltage configured from platform for
> > > > given rails.
> 
> > > because...
> 
> > of the next patch where this is used to retrieve the minimum rail voltage.
> 
> And that in turn is needed for...?

To calculate the required voltage for each frequency.

Peter.
