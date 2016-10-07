Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/3] ARM: shmobile: r8a7743: add CPG clock index macros
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
 <4289081.UEHqeRI6YW@wasted.cogentembedded.com>
Cc: linux-clk@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8677b11a-64d7-23af-48ef-bc58c9d4b3f3@cogentembedded.com>
Date: Fri, 7 Oct 2016 22:06:16 +0300
MIME-Version: 1.0
In-Reply-To: <4289081.UEHqeRI6YW@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello.

On 10/05/2016 11:54 PM, Sergei Shtylyov wrote:

> Add macros usable by the device tree sources to reference the R8A7743 CPG
> clocks  by index.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

    Probably makes sense to merge this patch to both the clk and renesas trees 
in order to satisfy the dependencies both ways... what do you think, Simon?

MBR, Sergei
