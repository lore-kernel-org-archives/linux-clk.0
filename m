Return-Path: <sboyd@codeaurora.org>
Date: Tue, 7 Mar 2017 05:53:02 -0800
From: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: core: Copy connection id
Message-ID: <20170307135302.GZ25384@codeaurora.org>
References: <60d115f6c11bc51cd8bc10c64cd222c3cdb43cc7.1487596492.git.leonard.crestez@nxp.com>
 <20170224204439.GD25384@codeaurora.org>
 <1488014402.6461.3.camel@nxp.com>
 <20170228080558.GL25384@codeaurora.org>
 <1488458715.12287.18.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1488458715.12287.18.camel@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/02, Leonard Crestez wrote:
> On Tue, 2017-02-28 at 00:05 -0800, sboyd@codeaurora.org wrote:
> > Sure. clk_get_sys() could be called and then we could have
> > something sprintf the dev_id there. A quick grep doesn't show any
> > place where that happens though so it seems safe right now.
> > 
> > That said, it would be nice to clearly document that we don't
> > expect dev_id to be freed or changed during the lifetime of the
> > clk structure, but we do allow con_id to change. Perhaps the copy
> > shows that, but a comment would also be useful so we don't have
> > people wondering why dev_id isn't copied as well.
> 
> This should be mentioned on the public documentation for clk_get_sys,
> clk_get and devm_clk_get, right? These seem to be the public entry
> points to the clk subsystem and users are expected to read their docs.

Sure. Except those are not just implemented for the common clk
framework, so the wording will need to be generic. Also we have
some more entry points like of_clk_get() too that would need a
note.

> 
> Do you want me to resend the patch with these notes?

No. I've applied this current patch to clk-fixes.

> 
> I'm not comfortable adding to documentation when I don't fully
> understand the system myself. I only discovered this while looking into
> unrelated driver issues.

Ok. I can take care of sending the patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
