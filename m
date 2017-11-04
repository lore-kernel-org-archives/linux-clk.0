Return-Path: <afaerber@suse.de>
Subject: Re: [PATCH 0/3] Add clock driver for Actions S900 SoC
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 rdunlap@infradead.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org,
 liuwei@actions-semi.com
References: <1509479663-8985-1-git-send-email-manivannan.sadhasivam@linaro.org>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Message-ID: <62797b3b-a622-48a1-9dc5-3cc2b5c7afd3@suse.de>
Date: Sat, 4 Nov 2017 17:05:31 +0800
MIME-Version: 1.0
In-Reply-To: <1509479663-8985-1-git-send-email-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mani,

Am 01.11.2017 um 03:54 schrieb Manivannan Sadhasivam:
> This series adds clock driver for Actions Semi OWL series
> S900 SoC with relevant clock bindings and device tree data.
> 
> This series also addresses the review comments from previous
> submission happened last year.
> 
> https://patchwork.kernel.org/patch/9254471/

Interesting - I had searched for any S500/S900 patches before starting
to work on this but came up empty on LAKML.

It seems you missed at least one review comment from 2016 about the
example indentation, so please double-check for anything Stephen already
pointed out.

> Driver has been validated on Bubblegum-96 board.
> 
> Thanks,
> Mani
> 
> Manivannan Sadhasivam (3):
>   arm64: dts: actions: add s900 clock controller nodes
>   clk: owl: add clock driver for Actions S900 SoC
>   Documentation: add Actions S900 clock bindings

Please reverse the patch order.

Have you checked S500 code whether the S900 vs. common split is correct?

Many thanks for your work on this,

Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
