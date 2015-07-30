Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Liberman Igal <Igal.Liberman@freescale.com>
To: Scott Wood <scottwood@freescale.com>, Mike Turquette
 <mturquette@linaro.org>, Yuantian Tang <Yuantian.Tang@freescale.com>
Subject: RE: [RFC PATCH 8/8] powerpc/fsl: Use new clockgen binding
Date: Thu, 30 Jul 2015 15:32:32 +0000
Message-ID: <DM2PR03MB50986F3471DF3DD74494002E68B0@DM2PR03MB509.namprd03.prod.outlook.com>
References: <1434682158-7243-1-git-send-email-scottwood@freescale.com>
 <1434682158-7243-9-git-send-email-scottwood@freescale.com>
In-Reply-To: <1434682158-7243-9-git-send-email-scottwood@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Madalin-Cristian Bucur <madalin.bucur@freescale.com>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


Regards,
Igal Liberman.

> -----Original Message-----
> From: Wood Scott-B07421
> Sent: Friday, June 19, 2015 5:49 AM
> To: Mike Turquette; Tang Yuantian-B29983
> Cc: Rafael J. Wysocki; Liberman Igal-B31950; Bucur Madalin-Cristian-B32716;
> linux-clk@vger.kernel.org; linux-pm@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; Wood Scott-B07421
> Subject: [RFC PATCH 8/8] powerpc/fsl: Use new clockgen binding
> 
> The driver retains compatibility with old device trees, but we don't want the
> old nodes lying around to be copied, or used as a reference (some of the
> mux options are incorrect), or even just being clutter.
> 
> We will also need the #clock-cells in the clockgen node in order to add fman
> nodes.
> 
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> ---

Tested on: several e500mc, e5500 and e6500 platforms.

Tested-by: Igal Liberman <Igal.Liberman@freescale.com>


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
