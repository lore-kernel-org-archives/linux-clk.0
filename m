Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CE1410D03
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120382; cv=pass; b=pPEc5n29/cGdhu1jXEexmChyQbTaz+yh3C9HriqUTYzWqsGbe4RiC1DKXP0zLB/JqizUTRn/FT/5laHMtkr5WCEZ2huWpjtJVhpcM6Q4d/vms97XzLXKpG2sBCgQGP3rUcwEUoWq8NatSBWdm5AcXH1oYibi80cONNZV9yohcjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120382; c=relaxed/simple;
	bh=R2v8n89f0c78cnd/TtY73AodxGwbn9p0TmvotZHshjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEsKqXfomp7wPE9KbqfaT5DAbYy6/gKmPyFTwUZyexwbaCyLA9tyqreBjJlVr3CYfcG8p+YtilxEIPUjts2ZEhoK6Cg7Ez01hy1zijPLZrbmZgiHKw2v8gRKgsIXpHBNukeipUNl3h5kMmL4pY/io48iIhZDtshjsS/FUA16FtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Qu2Zv1pC; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Qu2Zv1pC"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120362;
 b=fSkwGLZZ0BNfWxPMDeqyi6GbZFK4M0Qh5meFhy4g85jaOouTQHIu+rkctgmf5OxTNysIc9Tm
 aLPU/zJ0HGsjpaYyeXf53cotSipYv6fZqsTFTJhZ2K0QKcCj0XNPxbGUoAMiXTqAW9XTjdfY3L2
 RyrwiXwMHSXe4joGal96U2spQMs/XSZZgNKHIh21yMJzQPDg6VYAF2yAyvOhFnyjsbORuzFKoQn
 s8YQQH5u8wovQitN5PRCs2a2/w7ia13ZdibDI571pX6ixq+bu/I3bhHhu56i7Nc0iIDm5FXa+n6
 bf2glXQzmsMHbznqwPtwjib1v3R//e6dJXXQ/yM7vhqQw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120362;
 b=P1SIseix/+s7raR9eMVGPPDTOCdAl6KViXfztNGnIcok5eEalBkSy2pzvYtEPMwko1jPz6CR
 MPF9F1NAqaDs/D2p7/qdS9SyDXI+iqGS03Kb+wHOJrnonKKBnnhr4hvZ4CyI7278FV60VxQsegr
 l878XY6bCun8wXtiv9Zf1kv2gdUj+ltGSW8FTFPumeCt2hIHdGU+Vq2rekuOxyZUDVpGfqLGLTI
 3VdMxRAOz7ABNNwbKw5213DTSVBoIz7T2S4wiLLqGH32gqWY+lx7NV8FSX8XedFAPZqAaYiVxlj
 IAn1QhWOHM929B2AacJCfOK1xBd0syH1Oq46k8vdKlhww==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:22 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 37772A41123;
	Thu, 26 Feb 2026 16:39:06 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH v3 3/5] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 26 Feb 2026 16:38:52 +0100
Message-ID: <20260226153859.665901-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fMFxR36f9z3yXpX
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:568237be82892e00f1be80080e855268
X-cloud-security:scantime:1.642
DKIM-Signature: a=rsa-sha256;
 bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120361; v=1;
 b=Qu2Zv1pCK7/FgCK6y3B6FI7Wwd0TxTvdCdp0ecfCaci3kN2gBtEucZBuW+MvqBAK0cYyrJE1
 WWCEg2JRreFtrhmiIq1NewcyNd5x+y7w+zdOwnfuEV4SaUanDdVDOGFmrPrROZfJLa3vMwAAsMA
 lxkxIXRRR420UuXZUvO5nU3KYZtbS0Wxk1gZzADno1kX7J3Sti5iDmf4D0X9hpRnhEpKBdcZH0s
 9SCOxRVI9YG0xZ7OcglEhOVPeORZXRC9jonsGnxsO+577ifr2F3FsFl4VGgIscBNwINAGCObVkz
 NQPJ2hotNkjYDTQfGEI5Yfg/frvoTfrzZLdGksp9LldqQ==

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 910c20bf07a4f..2455358c15ca4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1420,6 +1420,16 @@ properties:
               - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
               - const: fsl,imx8dxp
 
+      - description:
+          TQMa8x is a series of SOM featuring NXP i.MX8 system-on-chip
+          variants. It is designed to be clicked on different carrier boards
+          MBa8x is the starterkit
+        items:
+          - enum:
+              - tq,imx8qm-tqma8qm-mba8x   # TQ-Systems GmbH TQMa8QM SOM on MBa8x
+          - const: tq,imx8qm-tqma8qm      # TQ-Systems GmbH TQMa8QM SOM
+          - const: fsl,imx8qm
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0

