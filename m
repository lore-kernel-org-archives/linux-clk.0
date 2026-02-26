Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087340F8E9
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120379; cv=pass; b=MhpdJOvqZRc2YOacEm7HBhHKbAC/87ZFPXn/6D3u0p1yOTdbjTfxvgPIDto7t0BcahMfCAppgYWnAr3nb1cCEnvx7rkbK3MhTBjrBl87Po6lk/BwXL91EYWcx+znvoL33rVx940OuYCt1JOunMnRJUkCevlnvBewBcI4tIOQFos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120379; c=relaxed/simple;
	bh=8xptqJuqr6y/XZ8cnubujeOx86XkzhzmPx/rVf1SSn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlMCLbmIIkWbjkrBoCs8fGzG2HPjLgrWqeUBSxSjUa4E9DfDa2g3zHaJN5hCxLtH/yXoewmPpnFG1qGJI8NeJspuCxbnu/w0w8jA9CaOZgb8baTmZDxn5jAZJePEvyRkiqejRFhVATbjNqrMSM//jAKF+Zsg6qmfq2W/0UJf8xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oWRKw1yt; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oWRKw1yt"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120358;
 b=n1J1AoyhIWjPgEdbCO0zX6dkgrq3PYSJRUQ1Kt3ElgxVs6HTMlO5iEqGulnInBe+LBSdN/E7
 r9WMF6od0mICT7U+uXztN23bbq4pef9frqLUn0J7InvZVCX3CBrwSrf33kmzAjFtjx1XWyKiEro
 H8rK7bKk71ztq3TMF029XGWtt25hFxPnRYnq3JPmviO4tfw+swktXd3qhrq3sR9i1L5P6Wg1OPB
 M9yigpsjSO+LmRy1mvw/2dF7GrFqErlIRtd3q/oGjuPeHySSH5U3grzjrljLyShE1WJKCW0bxGB
 5Lp083PRmce6lGFRA0mW4VGMIUh8bj1rkKzIxXhRHNynw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120358;
 b=iaCh/w8d61E2EnZ9wglRn8WQ+HPkw0d68uhanmfsbJIMxCzfiDwOL5vub/DS8g9K8rj+PJx9
 Q1gsQeatEi23jQYHKdFV4wf1Kb7RaE094agvbNkkAAImo434aN++Yo0Ez/QP98peh4BxT3+VhSX
 Qc1AgN6DMm0NAdXfNzHnO+FagVyPo+rIkHz2n+XyBjbTjQVx+TQolUUuuKAH0CbNPA+L33zfAqX
 7XUarnDZx1NbgVnLk41Xu4VYFYgC8uYTTO6tzUJNKCzb4ThBWLAM+OZYVsuDO1DkaCGwa6KZ2D3
 nFApYaxxHkDOomEUgDVnXGjb0THKN1l2Fvh29ZTUwm3lA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:18 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B4D43A40F28;
	Thu, 26 Feb 2026 16:39:02 +0100 (CET)
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
	linux@ew.tq-group.com
Subject: [PATCH v3 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 26 Feb 2026 16:38:50 +0100
Message-ID: <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fMFxN1L01z2nGBP
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:99766f1dadc9c0fd76839a32754897e4
X-cloud-security:scantime:1.750
DKIM-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120357; v=1;
 b=oWRKw1ytQ0zC74cU32UG2PYQIfgUF5Nvj2FBVwnxVhZkGKn3EhMIf7mG1kDEhSWYKZZm6q/Y
 wnk+r5BUAVu0mtGlYmQXVOBcYGYkk0givq7y/VK0zZNDEjAA+qXWzjK7pEuNgiJj6gqtwqcbZs7
 meSbv/Sh0paqyis06jUOn/3DesLWknVmOQXMDlAA+QW3/3Vabg2Be/+hEflVOescxGNjGC2wD6b
 oznXwwbZJbHAO5Jfbkw9miugFuQl8F9OgxMnIfJXlH6KauEeQ50VS1AI/eZcOjHPn9raxUzJaaC
 sBYunu3pAz11RrQbwBSKK9TqdFNeHZi7hTdr7U6KAtHVw==

Reference usb-xhci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Fix commit message typo

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..a199e5ba64161 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,7 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0

