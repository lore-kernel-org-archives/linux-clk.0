Return-Path: <rjui@broadcom.com>
Subject: Re: [RFC 4/5] clk: iproc: define Broadcom NS2 iProc clock binding
To: Jon Mason <jonmason@broadcom.com>
References: <1444771347-11382-1-git-send-email-jonmason@broadcom.com>
 <1444771347-11382-5-git-send-email-jonmason@broadcom.com>
 <561D84B4.4000002@broadcom.com> <20151014154410.GF15160@broadcom.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, "Hauke
 Mehrtens" <hauke@hauke-m.de>, Scott Branden <sbranden@broadcom.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
Message-ID: <561E88A7.2090808@broadcom.com>
Date: Wed, 14 Oct 2015 09:53:59 -0700
MIME-Version: 1.0
In-Reply-To: <20151014154410.GF15160@broadcom.com>
Content-Type: text/plain; charset="windows-1252"
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>



On 10/14/2015 8:44 AM, Jon Mason wrote:
> On Tue, Oct 13, 2015 at 03:24:52PM -0700, Ray Jui wrote:
>> Same as this patch. I thought device tree binding document should go
>> with the clock driver changes.
>>
>> Strictly speaking, device tree binding document should always go before
>> the driver changes. In the binding document the DT interface is defined,
>> then changes are implemented in the driver.
> 
> I split them off this way due to the clk maintainer not wanting to
> pull in any device tree changes.  Since the documentation is for the
> device tree enties, it makes logical sense to me that they be in the
> same device tree series.  If Stephen will pull these in with the clk
> changes, I am more than happy to have it done by him :)
> 
> Thanks,
> Jon

Yeah the clock maintainers do not pull in device tree changes like
*.dtsi and *.dts. But they do take changes including the binding
documents and clock driver changes. You can confirm with Stephen.

Thanks,

Ray
