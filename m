Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010BD4E322F
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546233; cv=none; b=M61bmI1v/sgg553ZZl2UYnOqRFcYJ2T0PjPLcwKVroqBMVjDaTKum9StUHAue49VzrF17scqfa02mlNE3zfNcFM4hnDb01Q3qMhdKfZOlP9L7XWpmnGv6K7qxr59xWZXCt/6PJivt3CAl+K0j/sbFyezpVxUG4pa0xE3rJzN2BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546233; c=relaxed/simple;
	bh=y8IGao0BdEhcPl/0jwybUqXyYFAw1AL4j8ic7ATdPEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=pgFKB0IJZOyeKhiSFRG9qM3kQs1qGs219eH6IfVi5T3EFwI+0VNC4H6x7aw+lG6J+if4CZepd1x5c0eZK8Ft1a3nxs//1g+85k8gxb1g+lpmN55lCyNPL4lpCQ/toDpWw+9geDo6ZfCHe1L8sAyAEJ63tlGFXyVCytI6wQ91Ds8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=eXcJOqVq; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eXcJOqVq"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261009114339epoutp02e87a13a5fe0fb6beefb8bfe54bd37ffb~c2ct98E9Z1702117021epoutp02M
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 11:43:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261009114339epoutp02e87a13a5fe0fb6beefb8bfe54bd37ffb~c2ct98E9Z1702117021epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546219;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eXcJOqVqi+aX+wNZBlkXdwZ1hJsf22Ga1DY7dwFz6jTZVdsdWr4Ul48WTllzvWMHD
	 ZH7NrSSOlbWyV/v8UT8TlVdLYBqM/rXbPbcBvlyqGziCiefjwksUTsa/Y/RYiup5fZ
	 QVuBp4jUVb0abgwQBo1hdiwXVB57NgUBjLDDlMm0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261009114337epcas5p1f1c96db9c3e1d67f8b3fe825658c9a0e~c2csFu2oD2444624446epcas5p1A;
	Fri,  9 Oct 2026 11:43:37 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j1Q3q3P1Nz2SSKX; Fri,  9 Oct
	2026 11:43:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114334epcas5p4723a40fefde5ce330b995e94c77dd951~c2co-l5Vg2878528785epcas5p45;
	Fri,  9 Oct 2026 11:43:34 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114331epsmtip2fd9b09b6b9e56e8d5dff51252faebe79~c2cmjw1YK0638806388epsmtip2O;
	Fri,  9 Oct 2026 11:43:31 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 01/14] dt-bindings: soc: samsung: Exynos8855 SYSREG
 compatibles
Date: Fri,  9 Oct 2026 17:31:24 +0530
Message-Id: <20261009120137.2801911-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114334epcas5p4723a40fefde5ce330b995e94c77dd951
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114334epcas5p4723a40fefde5ce330b995e94c77dd951
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114334epcas5p4723a40fefde5ce330b995e94c77dd951@epcas5p4.samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

Add exynos8855 sysreg compatibles in bindings

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..845e0caba15a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -31,6 +31,10 @@ properties:
               - samsung,exynos5-sysreg
               - samsung,exynos7870-cam0-sysreg
               - samsung,exynos7870-disp-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
@@ -103,6 +107,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
-- 
2.34.1

