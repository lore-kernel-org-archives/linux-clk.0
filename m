Return-Path: <peter.ujfalusi@ti.com>
Subject: Re: [alsa-devel] [PATCH 4/4] ASoC: simple-card: Support for selecting
 system clocks by ID
To: Stephen Boyd <sboyd@codeaurora.org>, Mark Brown <broonie@kernel.org>
References: <1455545495-20292-5-git-send-email-peter.ujfalusi@ti.com>
 <20160215152635.GN18988@sirena.org.uk> <56C2F00C.8080809@ti.com>
 <20160216134233.GN18327@sirena.org.uk>
 <20160216191346.2278.725@quark.deferred.io> <56C42BAF.3050900@ti.com>
 <20160217120759.GO7544@sirena.org.uk> <56C4CF8B.5010005@ti.com>
 <5715025C.7070108@ti.com> <20160418162910.GG3217@sirena.org.uk>
 <20160421222911.GE13149@codeaurora.org>
CC: <alsa-devel@alsa-project.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jyri Sarha
	<jsarha@ti.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Kristo, Tero" <t-kristo@ti.com>, <linux-clk@vger.kernel.org>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <571A106B.8040301@ti.com>
Date: Fri, 22 Apr 2016 14:52:11 +0300
MIME-Version: 1.0
In-Reply-To: <20160421222911.GE13149@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

On 04/22/16 01:29, Stephen Boyd wrote:
>>> The first issue with converting the McASP to use CCF internally for clock
>>> selection, muxing and rate configuration is that the daVinci platform does not
>>> use CCF at all. Given that the davinci-mcasp driver is used by daVinci, we
>>> need to have non CCF way supported in ASoC...
>>
>> Well, at least long term we do need daVinci converting to CCF - this is
>> going to continue to cause problems, devices not part of the SoC can and
>> do contain clocks and are going to end up being supported via the clock
>> API.
> 
> Does anyone here know what's involved in converting daVinci to
> CCF? It doesn't look too far off from what is in the CCF today,
> so I'm not sure what's blocking the transition.

Not entirely sure, but most likely new clk driver(s) for daVinci under
drivers/clk/ti/ new set of structures to describe the clocks if the ti_clk* is
not applicable I guess for starter. Support for DT, non DT boots as most of
daVinci is not booting with DT and most likely never will.
It might help to have different daVinci boards for testing the transition. I
only have OMAP-L138-evm. I don't think it is enough for testing an entire
architecture for this big change...

Tero might have better estimates on what is involved when switching an
architecture to CCF from custom, but at least synchronized API - so we don't
need to convert drivers at least.

-- 
Péter
