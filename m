Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>, Scott Wood
 <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [v16, 6/7] base: soc: Check for NULL SoC device attributes
Date: Wed, 9 Nov 2016 11:14:11 +0800
Message-ID: <1478661252-42439-7-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1478661252-42439-1-git-send-email-yangbo.lu@nxp.com>
References: <1478661252-42439-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiaobo Xie <xiaobo.xie@nxp.com>, Minghuan Lian <minghuan.lian@nxp.com>,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 Qiang Zhao <qiang.zhao@nxp.com>, Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Jochen Friedrich <jochen@scram.de>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Leo Li <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

If soc_device_match() is used to check the value of a specific
attribute that is not present for the current SoC, the kernel crashes
with a NULL pointer dereference.

Fix this by explicitly checking for the absence of a needed property,
and considering this a non-match.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
Changes for v16:
	- Added this patch
---
 drivers/base/soc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 0c5cf87..0e701e2 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -167,19 +167,23 @@ static int soc_device_match_one(struct device *dev, void *arg)
 	const struct soc_device_attribute *match = arg;
 
 	if (match->machine &&
-	    !glob_match(match->machine, soc_dev->attr->machine))
+	    (!soc_dev->attr->machine ||
+	     !glob_match(match->machine, soc_dev->attr->machine)))
 		return 0;
 
 	if (match->family &&
-	    !glob_match(match->family, soc_dev->attr->family))
+	    (!soc_dev->attr->family ||
+	     !glob_match(match->family, soc_dev->attr->family)))
 		return 0;
 
 	if (match->revision &&
-	    !glob_match(match->revision, soc_dev->attr->revision))
+	    (!soc_dev->attr->revision ||
+	     !glob_match(match->revision, soc_dev->attr->revision)))
 		return 0;
 
 	if (match->soc_id &&
-	    !glob_match(match->soc_id, soc_dev->attr->soc_id))
+	    (!soc_dev->attr->soc_id ||
+	     !glob_match(match->soc_id, soc_dev->attr->soc_id)))
 		return 0;
 
 	return 1;
-- 
2.1.0.27.g96db324


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
