Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
To: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Pratyush Anand <panand@redhat.com>,
 Gabriel Fernandez <gabriel.fernandez@linaro.org>, "fabrice.gasnier@st.com"
 <fabrice.gasnier@st.com>
Subject: RE: [PATCH v3 05/12] doc/bindings: Update Layerscape PCIe devicetree
 binding to be more flexible
Date: Thu, 15 Oct 2015 20:11:06 +0000
Message-ID: <BY1PR0301MB13039481CB958A3323FB03B2823E0@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
 <1444891672-32117-6-git-send-email-bhupesh.sharma@freescale.com>
 <5383901.aC2HYopUNW@wuerfel>
In-Reply-To: <5383901.aC2HYopUNW@wuerfel>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>,
 "marc.zyngier@arm.com" <marc.zyngier@arm.com>,
 "Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>,
 "will.deacon@arm.com" <will.deacon@arm.com>,
 Stuart Yoder <stuart.yoder@freescale.com>, Scott
 Wood <scottwood@freescale.com>, "Lian M.H." <Minghuan.Lian@freescale.com>,
 "olof@lixom.net" <olof@lixom.net>, Li Leo <LeoLi@freescale.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Thursday, October 15, 2015 7:47 PM
> 
> On Thursday 15 October 2015 12:17:45 Bhupesh Sharma wrote:
> >
> > +Note that since this controller derives its clocks from the Reset
> > +Configuration Word (RCW) which is used to describe the PLL settings
> > +at the time of chip-reset, the 'clocks' and 'clock-names' properties
> > +from 'designware-pcie.txt' are optional for this controller.
> 
> If this is an option for the dw-pcie block, should this description be
> added to the generic binding instead?

I think this can be moved to the generic bindings for DWC3 PCIe driver. However
I cannot vouch if the same is true for usage of this IP in other SoCs and it
will not break existing drivers if this property is not defined in their SoC DTSI.

So adding a few old ST colleagues (Pratyush, Gabriel, Fabrice), who I am sure have used this IP in ST SoCs
for their comments as well.

So the question would be - do you think it will be ok to make the clock related
properties optional in 'designware-pcie.txt' rather than required.

> 
> > +Also as per the available Reference Manuals, there is no specific
> 'version'
> > +register available in the Freescale PCIe controller register set,
> > +which can allow determining the underlying Designware PCIe controller
> > +version information.
> > +
> >  Required properties:
> > -- compatible: should contain the platform identifier such as
> "fsl,ls1021a-pcie"
> > +- compatible: should contain the platform identifier such as
> > +"fsl,<soc-name>-pcie",
> > +  "snps,dw-pcie".
> 
> You should document all the strings that will be needed here, otherwise a
> driver write does not know what to look for.
> 
> If two chips have a 100% identical PCIe implementation, just use the
> string of the older chip for both.

The chips are not 100% identical and there is no version information register
available for differentiation. So, does the following seem better:

+- compatible: should contain the platform identifier such as
+"fsl,<soc-name>-pcie",
+  "snps,dw-pcie".
+
+ where <soc-name> for e.g. can be ls2080a or ls1021a.

Regards,
Bhupesh

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
