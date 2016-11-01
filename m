Return-Path: <vinod.koul@intel.com>
From: "Koul, Vinod" <vinod.koul@intel.com>
To: "wens@csie.org" <wens@csie.org>, "maxime.ripard@free-electrons.com"
	<maxime.ripard@free-electrons.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "moinejf@free.fr"
	<moinejf@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
	"lee.jones@linaro.org" <lee.jones@linaro.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"alexandre.belloni@free-electrons.com"
	<alexandre.belloni@free-electrons.com>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "mylene.josserand@free-electrons.com"
	<mylene.josserand@free-electrons.com>, "sboyd@codeaurora.org"
	<sboyd@codeaurora.org>, "perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 01/14] dma: sun6i-dma: Add burst case of 4
Date: Tue, 1 Nov 2016 13:46:26 +0000
Message-ID: <1477922460.2837.5.camel@intel.com>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
	 <3a2404510b5f8b16ae3bb193982d70f158700b2b.1475571575.git.mylene.josserand@free-electrons.com>
	 <20161004124011.d7f5754a082d5f17d5185fc4@free.fr>
	 <20161004165553.GS5228@lukather>
	 <20161023183107.5b75b6aad62853378713299f@free.fr>
	 <20161027175154.v4kuhyvm3r5n6tdo@lukather>
	 <CAGb2v67SSZF6XL-HXv83nuwTKpJc53h8gsrb2r2V98LNZBzqEA@mail.gmail.com>
In-Reply-To: <CAGb2v67SSZF6XL-HXv83nuwTKpJc53h8gsrb2r2V98LNZBzqEA@mail.gmail.com>
Content-Type: text/plain; charset="utf-7"
MIME-Version: 1.0
Return-Path: vinod.koul@intel.com
List-ID: <linux-clk.vger.kernel.org>

On Sun, 2016-10-30 at 10:06 +-0800, Chen-Yu Tsai wrote:
+AD4- Looking at the dmaengine API, I believe we got it wrong.
+AD4-=20
+AD4- max+AF8-burst in dma+AF8-slave+AF8-config denotes the largest amount =
of data
+AD4- a single transfer should be, as described in dmaengine.h:

Not a single transfer but smallest transaction within a transfer of a
block. So dmaengines transfer data in bursts from source to destination,
this parameter decides the size of that bursts

+AD4-=20
+AD4- +AKAAKg- +AEA-src+AF8-maxburst: the maximum number of words (note: wo=
rds, as in
+AD4- +AKAAKg- units of the src+AF8-addr+AF8-width member, not bytes) that =
can be sent
+AD4- +AKAAKg- in one burst to the device. Typically something like half th=
e
+AD4- +AKAAKg- FIFO depth on I/O peripherals so you don't overflow it. This
+AD4- +AKAAKg- may or may not be applicable on memory sources.
+AD4- +AKAAKg- +AEA-dst+AF8-maxburst: same as src+AF8-maxburst but for dest=
ination target
+AD4- +AKAAKg- mutatis mutandis.
+AD4-=20
+AD4- The DMA engine driver should be free to select whatever burst size
+AD4- that doesn't exceed this. So for max+AF8-burst +AD0- 4, the driver ca=
n select
+AD4- burst +AD0- 4 for controllers that do support it, or burst +AD0- 1 fo=
r those
+AD4- that don't, and do more bursts.

Nope, the client configures these parameters and dmaengine driver
validates and programs

+AD4-=20
+AD4- This also means we can increase max+AF8-burst for the audio codec, as
+AD4- the FIFO is 64 samples deep for stereo, or 128 samples for mono.

Beware that higher bursts means chance of underrun of FIFO. This value
is selected with consideration of power and performance required. Lazy
allocation would be half of FIFO size..

--+AKA-
+AH4-Vinod
