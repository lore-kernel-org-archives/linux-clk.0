Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Sun, 21 Feb 2016 20:54:17 -0600
From: Rob Herring <robh@kernel.org>
To: Wenyou Yang <wenyou.yang@atmel.com>
Subject: Re: [PATCH v3 4/4] Documentation: atmel-pmc: add DT bindings for
 fast startup
Message-ID: <20160222025417.GH15973@rob-hp-laptop>
References: <1455507630-29592-1-git-send-email-wenyou.yang@atmel.com>
 <1455507630-29592-5-git-send-email-wenyou.yang@atmel.com>
MIME-Version: 1.0
In-Reply-To: <1455507630-29592-5-git-send-email-wenyou.yang@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Kumar Gala <galak@codeaurora.org>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 15, 2016 at 11:40:30AM +0800, Wenyou Yang wrote:
> Add DT bindings to configurate the PMC_FSMR and PMC_FSPR registers
> to trigger a fast restart signal to PMC.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> Document: binding
> 
> ---
> 
> Changes in v3:
>  - update the property description.

This is not helpful. Assume I don't remember what I told you and you 
need to jog my memory what exactly changed so I don't have to go look it 
up.

> 
> Changes in v2:
>  - change the property name and property description.
> 
>  .../devicetree/bindings/arm/atmel-pmc.txt          |   63 ++++++++++++++++++++
>  1 file changed, 63 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
