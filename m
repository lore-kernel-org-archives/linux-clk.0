Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
To: <arnd@arndb.de>, <mark.rutland@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
 <linux-clk@vger.kernel.org>, <olof@lixom.net>
Subject: [PATCH v4 06/12] doc/bindings: Update GPIO devicetree binding
 documentation for LS2080A
Date: Sat, 24 Oct 2015 01:01:55 +0530
Message-ID: <1445628721-10483-7-git-send-email-bhupesh.sharma@freescale.com>
In-Reply-To: <1445628721-10483-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1445628721-10483-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: LeoLi@freescale.com, bhupesh.sharma@freescale.com, Catalin.Marinas@arm.com,
 will.deacon@arm.com, stuart.yoder@freescale.com,
 Liu Gang <Gang.Liu@freescale.com>, scottwood@freescale.com,
 bhupesh.linux@gmail.com
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Update the FSL, GPIO binding documentation to add support
for GPIO controller found on Freescale's LS2080A platform.

Signed-off-by: Liu Gang <Gang.Liu@freescale.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
---
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
index 805ddcd..f2455c5 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
@@ -1,9 +1,9 @@
-* Freescale MPC512x/MPC8xxx GPIO controller
+* Freescale MPC512x/MPC8xxx/Layerscape GPIO controller
 
 Required properties:
 - compatible : Should be "fsl,<soc>-gpio"
   The following <soc>s are known to be supported:
-    mpc5121, mpc5125, mpc8349, mpc8572, mpc8610, pq3, qoriq
+    mpc5121, mpc5125, mpc8349, mpc8572, mpc8610, pq3, qoriq.
 - reg : Address and length of the register set for the device
 - interrupts : Should be the port interrupt shared by all 32 pins.
 - #gpio-cells : Should be two.  The first cell is the pin number and
-- 
1.7.9.5



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
