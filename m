Received: from mx-relay71-hz1.antispameurope.com (mx-relay71-hz1.antispameurope.com [94.100.132.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2B355036
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071325; cv=pass; b=BJpfGs3UebbRwYK0LDJ1BRmG4Z+YWmDD/1Y1uAaVa1+kK7BXo+Mp6sgKksdvBTyuVaK70eLC2gJ+task5nitNy0sAd5EXmOYIKGD3ITAFMuSPTkOPjMQcDnkRPKRI87/oN41GzsswIxsn1i9fSYzbKmWoDkRKo+h5hRnnOCltL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071325; c=relaxed/simple;
	bh=0QtQfNoo5zcJjIoBusJcUUqMqAgbQeNJiAM30UXwxcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTuZ+pbh/+ojxha/Yx4jvlB3+TgVl9Ut6NcfNJxwRviVmbK2W9uImvtmomFW2s2b9kEQkcJkMtyYPTE3IUUBjlPnRLI5GjxR4nJb+jtZixcqmFLNzkYSBZyCvDRYH6vEIvHHMr8kcLNAw89sKzNO7DZjizdf5B5Av0TLGg/7MEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nnsA160z; arc=pass smtp.client-ip=94.100.132.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nnsA160z"
ARC-Authentication-Results: i=1; mx-gate71-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071290;
 b=oVbiesh1jM8bk+t/KmHCeH1tC6n5VlzSyPLXoSuYfERtNtQdOxV8uXl+YkOJ0zw2QkmDH2A0
 2IuxoICJw0bBotZxsMZWoqd7mXA2H3hjE+sr41bpRpx9q7+DHOKOYmaibZH7aoaMxZBKb7Kbry5
 jXgbUGGqeGIgKcUCe/SQtM4h9jtpmMWQv7/nPcd38WTxt9630FXsZ+ygbDr31TO2Qkq8MAil6GO
 0WelI/zr0mdSimzO/vH5iInXf7auN2GMDM9oRMqRdZqRy+ed5bIuV45Th2i1ZLwMD1aHYwU+s6t
 ONBuFhpArZA+LoAKG1pfS3XpNvQOTLORn2JSEFSv1MDig==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071290;
 b=BiBpzJcSNNvEw1Jr3bXRPJZDxxuobhkw0AtZVSZanl2K2irXgBAPqaSF8/lQNgl0g10iR3CZ
 mGESdCqbqqI2n6cQL1Fo19eI9vb089PS5Kd/QH+z1e1jktBmiQBW5Jbb4uH1XpfHweN/1ZAqAOg
 PcagE53yGI/jNcb/CAnc8ITT8DiG4LGgfcmEsXrzOhSuLIJ+GF7b0wt2bP6Q4aiXvaqg1O1Gztb
 DrgdQ+QbBM6k1nYMaLBDjiy3xXSeOOC3+0o3680pj+1Rmqs0pQtWUF08g4CKh/d+R891fxlfP7h
 QO0ky4WgtnjHldRX+RvrGjHmJJMhwipE8XC2KuWMbLimQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay71-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:30 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6B138CC0D7B;
	Thu, 18 Dec 2025 16:21:10 +0100 (CET)
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
Subject: [PATCH 4/6] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 18 Dec 2025 16:20:51 +0100
Message-ID: <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay71-hz1.antispameurope.com with 4dXDs34QP3z3fwGG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:66d9300a35196336384c9a16144f2bee
X-cloud-security:scantime:2.419
DKIM-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071290; v=1;
 b=nnsA160zeC+mS10BJiHiLltjCWiOBI7AtiYNI/U5BDHmEDO3Nkq+7JPBr2DxlJrL4YjHjdqf
 XzzIuQnYKI6bw/+GJ11LAIutBQnLFuYdSzsDNrLlS8u8KyVm9btSKQzs8NPVn0JOlCgqMqDOTJG
 vEk2XcBfDqcrc96SRkfhh3AVSaPMa/13wipCrGYQqGCUYUdH0TdN7XZazU/kuDTH8f3Q4bEcLhK
 9/gNNIV7jo9xvBHETtM/ohDT9jQB8medRQwOs8pjA7eQlm7KGRUvlfPEhMk36QmsSoMMxnAtJih
 lfPntasDvoIsDjEHNY90d229rOYeUUe2Qke5KG0QRXz/Q==

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index dfe9fa5c4dbc4..6384b36b6f385 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1401,6 +1401,16 @@ properties:
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

