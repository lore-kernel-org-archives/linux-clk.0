Return-Path: <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 4/4] ASoC: simple-card: Support for selecting system
 clocks by ID
To: Mark Brown <broonie@kernel.org>
References: <1455545495-20292-1-git-send-email-peter.ujfalusi@ti.com>
 <1455545495-20292-5-git-send-email-peter.ujfalusi@ti.com>
 <20160215152635.GN18988@sirena.org.uk> <56C2F00C.8080809@ti.com>
 <20160216134233.GN18327@sirena.org.uk>
 <20160216191346.2278.725@quark.deferred.io> <56C42BAF.3050900@ti.com>
 <20160217120759.GO7544@sirena.org.uk>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        Jyri Sarha <jsarha@ti.com>, <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Kristo, Tero" <t-kristo@ti.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <56C4CF8B.5010005@ti.com>
Date: Wed, 17 Feb 2016 21:52:43 +0200
MIME-Version: 1.0
In-Reply-To: <20160217120759.GO7544@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

On 02/17/2016 02:07 PM, Mark Brown wrote:
> On Wed, Feb 17, 2016 at 10:13:35AM +0200, Peter Ujfalusi wrote:
> 
>> With this change we don't need to write custom machine drivers for setup not
>> using sysclk_id == 0.
>> I do think this is reasonable change by itself.
> 
>> However I do think that the current simple-card is flawed regarding to clock
>> selection and the change Jyri and me are proposing is reasonable.
> 
> But you define a new ABI to specify it in the process, I'd rather fix
> the flaws by using the common clock ABI than extend any device stuff.
> If it didn't define a new ABI I'd probably not worry about it but one of
> the issues we have with DT is that we do end up making ABIs every time
> we put something in DT.

I understand. This should have been supported by simple-card since the
beginning. When we tried to move all boards to use simple-card, we hit the
wall by not being able to select and configure other sysclk_id than 0.
I don't want to create yet another simple card which handles only sysclk_id 1 ;)
On the other hand this ABI is backwards compatible since if it is missing it
will default to the configuration we right now have regarding to sysclk_dir
and sysclk_id.

I will look at the CCF implementation for McASP first then for aic3x.

-- 
Péter
