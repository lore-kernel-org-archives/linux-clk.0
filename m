Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dinh Nguyen <dinguyen@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521642012-9770-2-git-send-email-dinguyen@kernel.org>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, mturquette@baylibre.com,
 will.deacon@arm.com, dinguyen@kernel.org, robh+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1521642012-9770-1-git-send-email-dinguyen@kernel.org>
 <1521642012-9770-2-git-send-email-dinguyen@kernel.org>
Message-ID: <152303467206.143116.7701915429594440149@swboyd.mtv.corp.google.com>
Subject: Re: [PATCHv7 2/3] arm64: dts: stratix10: use clock bindings for the
 Stratix10 platform
Date: Fri, 06 Apr 2018 10:11:12 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dinh Nguyen (2018-03-21 07:20:11)
> Use the clock bindings for the Stratix10 SoC. This includes changing the =
old
> binding of "intc,clk-s10-mgr" to "intel,stratix10-clkmgr". The reason that
> this can be done is that there are currently no clock driver for Stratix1=
0,
> thus there are no consumers of the old binding. So changing the binding w=
ill
> not break any legacy code.
> =

> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

This should go via arm-soc so I won't be apply this one.
