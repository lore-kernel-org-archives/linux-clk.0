Return-Path: <repk@triplefau.lt>
Date: Wed, 16 Dec 2015 08:57:26 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <info@lategoodbye.de>,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/4] clk: bcm2835: Add PWM clock support to the device
 tree
Message-ID: <20151216075725.GF453@cruxbox>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt>
 <1449418969-5565-5-git-send-email-repk@triplefau.lt>
 <5664A5A9.4030204@lategoodbye.de>
 <20151207181752.GA453@cruxbox>
 <5665D30F.2060809@lategoodbye.de>
 <87wpspeg38.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87wpspeg38.fsf@eliezer.anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Dec 07, 2015 at 08:09:47PM -0800, Eric Anholt wrote:
> Stefan Wahren <info@lategoodbye.de> writes:
> 
> > Hi Remi,
> >
> > Am 07.12.2015 um 19:17 schrieb Remi Pommarel:
> >> Hi Stefan,
> >>
> >> On Sun, Dec 06, 2015 at 10:16:25PM +0100, Stefan Wahren wrote:
> >>> Hi Remi,
> >>>
> >>> please send this patch to devicetree@vger.kernel.org.
> >>
> >> Ok, just to be sure I understand the process here. I should resend a new
> >> version of the whole patchset including the devicetree mailing list as
> >> recipent. Then the first 3 patches will eventually get pushed by a clock
> >> subsystem maintainer. And finally this last patch will be pushed by a
> >> devicetree maintainer.
> >>
> >> Am I right here ?
> >
> > sorry for the confusion. I mean that you send a copy to 
> > devicetree@vger.kernel.org so subscribers have a chance to review.
> >
> > I'm not sure but according to your subject you suggest that this dts 
> > patch should go through clock subsystem which isn't optimal. This should 
> > be better applied by Stephen or Eric.
> 
> It would be applied by me, but that's for me to worry about, not the
> patch submitter.  The subject prefix would be "ARM: bcm2835: ", but
> that's trivial for me to fix when applying, not the kind of thing worth
> asking for a respin for.

Thanks for review.

I'll submit dt patch to devicetree@vger.kernel.org for review. Is it better
to submit the whole patchset (patch 1 to 4) to provide some context for the
device tree patch or just this patch alone ?

Best Regards,

-- 
Remi
