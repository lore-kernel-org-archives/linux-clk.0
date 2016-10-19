Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 19 Oct 2016 10:27:15 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Y.B. Lu" <yangbo.lu@nxp.com>
Subject: Re: [v12, 0/8] Fix eSDHC host version register bug
Message-ID: <20161019082715.GA6140@kroah.com>
References: <1474441040-11946-1-git-send-email-yangbo.lu@nxp.com>
 <CAPDyKFoit0sTPpfi2=AHcdZsDwOJxbBX68O-1jBFL=5JN0m6_w@mail.gmail.com>
 <AM5PR0401MB2529BA70C6E7AF7C71631A47F8D20@AM5PR0401MB2529.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB2529BA70C6E7AF7C71631A47F8D20@AM5PR0401MB2529.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 "X.B. Xie" <xiaobo.xie@nxp.com>, "M.H. Lian" <minghuan.lian@nxp.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Jochen Friedrich <jochen@scram.de>,
 Claudiu Manoil <claudiu.manoil@freescale.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Scott Wood <oss@buserror.net>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Kumar Gala <galak@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 19, 2016 at 02:47:07AM +0000, Y.B. Lu wrote:
> + Greg
> 
> Hi Greg,
> 
> I submitted this patchset for a MMC bug fix, and introduce the below patch which needs your ACK.
> > > Arnd Bergmann (1):
> > >   base: soc: introduce soc_device_match() interface
> https://patchwork.kernel.org/patch/9342913/
> 
> Could you help to review it and give some comments or ACK.
> Thank you very much.

Now acked.


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
