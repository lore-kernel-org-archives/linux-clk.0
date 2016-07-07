Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
To: Yangbo Lu <yangbo.lu@nxp.com>
Subject: Re: [PATCH 2/4] soc: fsl: add GUTS driver for QorIQ platforms
Date: Thu, 07 Jul 2016 10:30:29 +0200
Message-ID: <4094106.qfxJu3tJbO@wuerfel>
In-Reply-To: <HE1PR04MB0889646206BFAD68046F3473F83B0@HE1PR04MB0889.eurprd04.prod.outlook.com>
References: <1462417950-46796-1-git-send-email-yangbo.lu@nxp.com>
 <1465609853.22191.151.camel@buserror.net>
 <HE1PR04MB0889646206BFAD68046F3473F83B0@HE1PR04MB0889.eurprd04.prod.outlook.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Xiaobo Xie <xiaobo.xie@nxp.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Qiang Zhao <qiang.zhao@nxp.com>, Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Claudiu Manoil <claudiu.manoil@freescale.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yang-Leo Li <leoyang.li@nxp.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Kumar Gala <galak@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

T24gVGh1cnNkYXksIEp1bHkgNywgMjAxNiAyOjM1OjMzIEFNIENFU1QgWWFuZ2JvIEx1IHdyb3Rl
Ogo+IEhpIEFybmQsCj4gCj4gQ291bGQgeW91IHJlcGx5IHdoZW4geW91IHNlZSB0aGUgZW1haWw/
Cj4gSWYgeW91ciBtZXRob2QgZG9lc27igJl0IHJlc29sdmUgdGhlIHByb2JsZW0sIHdlIHN0aWxs
IHdhbnQgdG8gdXNlIG91ciBvbGQgcGF0Y2hzZXQuCj4gCj4gVGhpcyBndXRzIGRyaXZlciBoYWQg
YmVlbiBkaXNjdXNzZWQgYWJvdXQgb25lIHllYXIgYW5kIGJsb2NrZWQgbWFueSB3b3JrYXJvdW5k
IHVwc3RyZWFtLgo+IFNvIHBsZWFzZSBoZWxwIHRvIHJldmlldyBhbmQgY29tbWVudCBzb29uLgo+
IAoKSSBkb24ndCByZWFsbHkgc2VlIGhvdyBtb3JlIGRpc2N1c3Npb24gaXMgZ29pbmcgdG8gaGVs
cCB1cyBoZXJlLiBJIHRoaW5rCkkndmUgbWFkZSBpdCBwcmV0dHkgY2xlYXIgdGhhdCBJIGRvbid0
IHdhbnQgdG8gc2VlIGFub3RoZXIgcGxhdGZvcm0Kc3BlY2lmaWMgd2F5IHRvIHJlYWQgYW4gU29D
IHJldmlzaW9uIGFuZCBJJ3ZlIGV2ZW4gc2VudCBhIHByb29mLW9mLWNvbmNlcHQKcGF0Y2ggdG8g
c2hvdyBob3cgdGhlIGludGVyZmFjZSBjYW4gd29yaywgbm93IGl0J3MgdXAgdG8geW91IHRvIGZp
dCB0aGUKZ3V0cyBoYXJkd2FyZSBpbnRvIHRoYXQgYW5kIHNlbmQgYSBuZXcgcGF0Y2ggc2VyaWVz
LgoKCUFybmQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
