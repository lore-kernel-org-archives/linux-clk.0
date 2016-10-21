Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38766 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751259AbcJUE7N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Oct 2016 00:59:13 -0400
Date: Thu, 20 Oct 2016 21:59:32 -0700
From: Darren Hart <dvhart@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Irina Tirdea <irina.tirdea@intel.com>, linux-clk@vger.kernel.org,
        x86@kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Ingo Molnar <mingo@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "H. Peter Anvin" <hpa@zytor.com>, alsa-devel@alsa-project.org,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RESEND PATCH v4] clk: x86: Add Atom PMC platform clocks
Message-ID: <20161021045932.GA90338@f23x64.localdomain>
References: <1476735320-4315-1-git-send-email-irina.tirdea@intel.com>
 <alpine.DEB.2.20.1610202349200.4938@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.DEB.2.20.1610202349200.4938@nanos>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Oct 20, 2016 at 11:52:38PM +0200, Thomas Gleixner wrote:
> On Mon, 17 Oct 2016, Irina Tirdea wrote:
> > The patch has already been reviewed by Stephen Boyd [1].
> > The only remaining question is the one pointed out by Stephen:
> > "Will there be problems if this merges through clk tree? If so we
> > could take the clk driver part and the platform data include part
> > could be duplicated into both trees. Or clk tree could be pulled
> > into x86?" [1]
> 
> The proper thing to do is:
> 
> Move all that cruft including arch/x86/platform/atom/pmc_atom.c into
> drivers/platform/x86. There is nothing architecture specific in these
> files. It's pure peripheral driver enablement. So drivers/platform/x86 is
> the proper location for this. Please discuss this with Darren Hart (cc'ed).

We've been adding more of the pmc and punit drivers to drivers/platform/x86.
This makes more sense than being under "arch". Thomas and I have discussed
moving more of the non architectural stuff in arch/x86/platform to my tree under
platform/drivers/x86.

Irina, please point me at the relevant context if it's more than just this
particular patch.


-- 
Darren Hart
Intel Open Source Technology Center
