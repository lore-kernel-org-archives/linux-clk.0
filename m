Return-Path: <info@lategoodbye.de>
Subject: Re: [PATCH v3 4/4] clk: bcm2835: Add PWM clock support to the device
 tree
To: Remi Pommarel <repk@triplefau.lt>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt>
 <1449418969-5565-5-git-send-email-repk@triplefau.lt>
 <5664A5A9.4030204@lategoodbye.de> <20151207181752.GA453@cruxbox>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Eric Anholt <eric@anholt.net>,
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
From: Stefan Wahren <info@lategoodbye.de>
Message-ID: <5665D30F.2060809@lategoodbye.de>
Date: Mon, 7 Dec 2015 19:42:23 +0100
MIME-Version: 1.0
In-Reply-To: <20151207181752.GA453@cruxbox>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Remi,

Am 07.12.2015 um 19:17 schrieb Remi Pommarel:
> Hi Stefan,
>
> On Sun, Dec 06, 2015 at 10:16:25PM +0100, Stefan Wahren wrote:
>> Hi Remi,
>>
>> please send this patch to devicetree@vger.kernel.org.
>
> Ok, just to be sure I understand the process here. I should resend a new
> version of the whole patchset including the devicetree mailing list as
> recipent. Then the first 3 patches will eventually get pushed by a clock
> subsystem maintainer. And finally this last patch will be pushed by a
> devicetree maintainer.
>
> Am I right here ?

sorry for the confusion. I mean that you send a copy to 
devicetree@vger.kernel.org so subscribers have a chance to review.

I'm not sure but according to your subject you suggest that this dts 
patch should go through clock subsystem which isn't optimal. This should 
be better applied by Stephen or Eric.

Best regards
Stefan
