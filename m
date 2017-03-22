Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,  Jerome Brunet <jbrunet@baylibre.com>,  Neil Armstrong <narmstrong@baylibre.com>,  linux-amlogic@lists.infradead.org,  linux-crypto@vger.kernel.org,  Stephen Boyd <sboyd@codeaurora.org>,  Michael Turquette <mturquette@baylibre.com>,  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: meson-gxbb: expose clock CLKID_RNG0
References: <4e2d12e5-f75b-3ac6-a3f7-18e8a8b7283b@gmail.com>
	<20170316100743.GA12137@gondor.apana.org.au>
	<m2mvcl6pwg.fsf@baylibre.com>
	<20170317083032.GA18512@gondor.apana.org.au>
Date: Wed, 22 Mar 2017 08:24:08 -0700
In-Reply-To: <20170317083032.GA18512@gondor.apana.org.au> (Herbert Xu's
	message of "Fri, 17 Mar 2017 16:30:32 +0800")
Message-ID: <m2lgrxnxlz.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Herbert Xu <herbert@gondor.apana.org.au> writes:

> On Thu, Mar 16, 2017 at 11:24:31AM -0700, Kevin Hilman wrote:
>> Hi Herbert,
>> 
>> Herbert Xu <herbert@gondor.apana.org.au> writes:
>> 
>> > On Wed, Feb 22, 2017 at 07:55:24AM +0100, Heiner Kallweit wrote:
>> >> Expose clock CLKID_RNG0 which is needed for the HW random number generator.
>> >> 
>> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> >
>> > All patches applied.  Thanks.
>> 
>> Actually, can you just apply [PATCH 4/4] to your tree?
>> 
>> The clock and DT patches need to go through their respective trees or
>> will otherwise have conflicts with other things going in via those
>> trees.
>
> It's too late now.  Please speak up sooner next time.  These
> patches were posted a month ago.

Because this will be causing conflicts with both the platform (amlogic)
tree and the clk tree, could provide an immutable branch where these are
applied to help us handle these conflicts?

Thanks,

Kevin
