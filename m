Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v6 37/41] ARM: da8xx: Remove legacy clock init
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz
 Golaszewski <bgolaszewski@baylibre.com>,
        Adam Ford <aford173@gmail.com>, <linux-kernel@vger.kernel.org>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-38-git-send-email-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <310debb9-9cd6-35d6-fd4d-664d13a79533@ti.com>
Date: Wed, 7 Feb 2018 20:46:57 +0530
MIME-Version: 1.0
In-Reply-To: <1516468460-4908-38-git-send-email-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Saturday 20 January 2018 10:44 PM, David Lechner wrote:
> This removes the unused legacy clock init code from
> arch/arm/mach-davinci/{devices,usb}-da8xx}.c.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Can you please mention SATA and USB in subject line and in patch
description?

Apart from that:

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
