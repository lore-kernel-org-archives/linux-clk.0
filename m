Return-Path: <slash.tmp@free.fr>
Subject: Re: [PATCH v4] clk: tango4: clkgen driver for Tango4 platforms
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: clk <linux-clk@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Marc Gonzalez <Marc_Gonzalez@sigmadesigns.com>
References: <562A5506.2070402@sigmadesigns.com>
 <20151029005658.GA19782@codeaurora.org> <563361B8.7090300@sigmadesigns.com>
 <20151030162925.GC19782@codeaurora.org>
From: Mason <slash.tmp@free.fr>
Message-ID: <5633BB93.7010701@free.fr>
Date: Fri, 30 Oct 2015 19:48:51 +0100
MIME-Version: 1.0
In-Reply-To: <20151030162925.GC19782@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

On 30/10/2015 17:29, Stephen Boyd wrote:

> You should add sigma to the vendor prefix file
> Documentation/devicetree/bindings/vendor-prefixes.txt
> 
> Send that patch to the DT maintainers (Rob has been applying
> most vendor prefix patches).

Hmmm, Mans took care of that a month ago... Did the patch fall
through the cracks perhaps?

http://thread.gmane.org/gmane.linux.kernel/2052776

Should I be looking in Rob's tree?
https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/

Regards.
