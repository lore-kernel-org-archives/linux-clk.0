Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Subject: Re: [PATCH v1] clk: Sigma Designs Tango4 cpuclk driver
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	<mturquette@baylibre.com>
CC: Mason <slash.tmp@free.fr>, clk <linux-clk@vger.kernel.org>
References: <5613DBA2.20708@sigmadesigns.com>
 <20151008013054.GC26883@codeaurora.org> <56163BE1.6040402@free.fr>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <56177417.9050203@sigmadesigns.com>
Date: Fri, 9 Oct 2015 10:00:23 +0200
MIME-Version: 1.0
In-Reply-To: <56163BE1.6040402@free.fr>
Content-Type: text/plain; charset="ISO-8859-15"
List-ID: <linux-clk.vger.kernel.org>

On 08/10/2015 11:48, Mason wrote:

> On 08/10/2015 03:30, Stephen Boyd wrote:
> 
>> More discussion will come with the binding, but we're pushing
>> people towards making real platform drivers for their clock
>> controllers, instead of parsing everything out of DT and having
>> one node per clock. So if these are picking things out of some
>> larger clock controller block, please rewrite the binding to be a
>> real clock provider.
> 
> I don't understand what you wrote.
> 
> Could you explain what you meant?

While the other issues are minor, I will need guidance to understand
this request.

Regards.
