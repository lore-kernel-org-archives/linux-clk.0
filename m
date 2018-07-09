Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jolly Shah <jolly.shah@xilinx.com>, ard.biesheuvel@linaro.org,
 dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org, hkallweit1@gmail.com,
 keescook@chromium.org, linux-clk@vger.kernel.org, mark.rutland@arm.com,
 matt@codeblueprint.co.uk, michal.simek@xilinx.com, mingo@kernel.org,
 mturquette@baylibre.com, robh+dt@kernel.org, sboyd@codeaurora.org,
 sudeep.holla@arm.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1529516435-7315-8-git-send-email-jollys@xilinx.com>
Cc: rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jolly Shah <jollys@xilinx.com>
References: <1529516435-7315-1-git-send-email-jollys@xilinx.com>
 <1529516435-7315-8-git-send-email-jollys@xilinx.com>
Message-ID: <153111415833.143105.8701882244160397855@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v9 07/10] firmware: xilinx: Add debugfs for IOCTL API
Date: Sun, 08 Jul 2018 22:29:18 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jolly Shah (2018-06-20 10:40:32)
> From: Rajan Vaja <rajanv@xilinx.com>
> =

> Add debugfs file to set/get IOCTL using debugfs interface.

IOCTLs and debugfs aren't the same thing. Why are the two being mixed
together? Is some sort of userspace ABI being created here to control
clks with usermode drivers?
