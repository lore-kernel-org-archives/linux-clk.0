Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170411025956.GA9067@b29396-OptiPlex-7040>
References: <20170330005029.6472-1-stefan@agner.ch>
 <20170330005029.6472-2-stefan@agner.ch>
 <20170401030312.GB24882@b29396-OptiPlex-7040>
 <5c8339900fa1bd6215fb94d4386f7e06@agner.ch>
 <CAOMZO5CprxqnqRXMFJLBAgYAZGGnXNs3ZciyVz_mSLRnnSQQRQ@mail.gmail.com>
 <CAOMZO5A7QQEe5rgBbJBzo8GY41aYV9WA8e9teCUROyihg0kq_g@mail.gmail.com>
 <c95a7f535296623bdd4e4a640b3c27f5@agner.ch>
 <20170411025956.GA9067@b29396-OptiPlex-7040>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 11 Apr 2017 20:23:19 -0300
Message-ID: <CAOMZO5DOib3PfCOQ-yqKAJnKRJZ2eBnMJnA84y=sv+vsYdbbBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add USDHC NAND clock to SDHC instances
To: Dong Aisheng <dongas86@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Apr 10, 2017 at 11:59 PM, Dong Aisheng <dongas86@gmail.com> wrote:

> This is caused by ahb_root_clk gets disabled accidently and system hangs.
>
> Because this patch defines ipg_root_clk earlier before its parent
> (ahb_root_clk) got registered, then it will be marked as a orphan clk
> temporarily. Until the parent ahb_root_clk got registered, the clk core
> will reparent it to the newly found parent. (see __clk_core_init() function).
>
> Due to CLK_SET_RATE_PARENT flag, the ahb clk will be enabled during
> set_parent operation and then disabled after that.
> Then system hang cause we still get no chance to run init_on clks.
>
> I just send out a proper fix patch with correct register sequence.

Excellent, thanks!

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
