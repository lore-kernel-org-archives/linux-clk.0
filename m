Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 22 Feb 2017 14:47:46 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 2/7] dt-bindings: rk1108-cru: rename RK1108 to RV1108
Message-ID: <20170222204746.gcy4j6klz6fidrhq@rob-hp-laptop>
References: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
 <1486983857-32399-1-git-send-email-andy.yan@rock-chips.com>
MIME-Version: 1.0
In-Reply-To: <1486983857-32399-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 13, 2017 at 07:04:17PM +0800, Andy Yan wrote:
> Rockchip finally named the SOC as RV1108, so change it.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../{rockchip,rk1108-cru.txt => rockchip,rv1108-cru.txt}     | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{rockchip,rk1108-cru.txt => rockchip,rv1108-cru.txt} (83%)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
