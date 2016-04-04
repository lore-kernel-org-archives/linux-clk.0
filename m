Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 4 Apr 2016 00:15:52 -0500
From: Rob Herring <robh@kernel.org>
To: Yangbo Lu <yangbo.lu@nxp.com>
Subject: Re: [v7, 3/5] dt: move guts devicetree doc out of powerpc directory
Message-ID: <20160404051552.GG17806@rob-hp-laptop>
References: <1459480051-3701-1-git-send-email-yangbo.lu@nxp.com>
 <1459480051-3701-4-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1459480051-3701-4-git-send-email-yangbo.lu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 Zhao Qiang <qiang.zhao@freescale.com>, Russell King <linux@arm.linux.org.uk>,
 Claudiu Manoil <claudiu.manoil@freescale.com>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, netdev@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, scott.wood@nxp.com,
 xiaobo.xie@nxp.com, iommu@lists.linux-foundation.org,
 linux-i2c@vger.kernel.org, Jochen Friedrich <jochen@scram.de>,
 Kumar Gala <galak@codeaurora.org>, leoyang.li@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 01, 2016 at 11:07:29AM +0800, Yangbo Lu wrote:
> Move guts devicetree doc to Documentation/devicetree/bindings/soc/fsl/
> since it's used by not only PowerPC but also ARM. And add a specification
> for 'little-endian' property.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> ---
> Changes for v2:
> 	- None
> Changes for v3:
> 	- None
> Changes for v4:
> 	- Added this patch
> Changes for v5:
> 	- Modified the description for little-endian property
> Changes for v6:
> 	- None
> Changes for v7:
> 	- None
> ---
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/guts.txt | 3 +++
>  1 file changed, 3 insertions(+)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/guts.txt (91%)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
