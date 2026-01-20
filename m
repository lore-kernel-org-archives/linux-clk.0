Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D843CEC1;
	Tue, 20 Jan 2026 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920464; cv=none; b=q+OGMw+p4S6hKtxxoSb0VITXPSa5MdVhx6R8g6G+EOqYPziEvi0SZ5nwj4t8v9CpintEJ9iFSznkuv7Sw9SgqHL19B5Eaw2OIuJX3ZtMmSAHMFPsQyAfoxAcXCfk4RIPY2/eMVi0GsDY6M+Ov+mFhTKW5rekEpveciqquj3Y79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920464; c=relaxed/simple;
	bh=S+YzY3yWLHJBzPQ+BP8F0P/REajJo7wlTKOXADK+CNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzjR/vSP7c5eFirFRcj1/JmUvFUDN6Fk+elcBCNAkUDCbCIN1VG+fch0ey0c53K9SYfdg8LLemgan9D9sTbKCxHK7aDfle5gdHOH0zN6EzvdyXSTZWLJv1TSWbNAKVkMWkSIcFfXu1UlgF/xfBepnd/DOdxfa6UscCDz9JP3cjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=gCp7kAsk; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="gCp7kAsk"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD18B148AD3E;
	Tue, 20 Jan 2026 15:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919905; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3hoXMVRSQSHzlrc6BbneIFGzDKJfR415NtQHWKx5Mxg=;
	b=gCp7kAske59StqI62JOTq91WMYEzRi/kuFO6Kgah5eMF6sbw8oWBk7eY2Xgw+L/xV6KKoS
	L8mESPh9n3EW0iIeJzDepuQzirbqipPiVsY7dI4w6cmWiCnTveSNapWDAhJNaoJXEqJjJT
	HbTbcmc9XAn73oHmwbgxmXbpqDjHntg5ZwlOWnrj4wIc+dblxxNh4Orwnr0zCn6xyLB7hs
	dpWpKyFtNbdpOmZ2XugdmRig8X2melFBk0fEyNp9BpmYMpd5+F1gy4ffsCwi/IzTaRpZeO
	jXtNx4hr2MrEbAlvzQqf009jtjLxmvi4VTPkOvClSCECQtPWLkNRDaVvZOF19Q==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 01/19] MAINTAINERS: Add sam9/sama to (AT91) SoC support
Date: Tue, 20 Jan 2026 15:37:22 +0100
Message-ID: <20260120143759.904013-2-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Will catch previously unmatched files in include/dt-bindings/*

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - new patch, not present in v2

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index da9dbc1a40194..c882399c5e4b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3033,6 +3033,7 @@ F:	include/soc/at91/
 X:	drivers/input/touchscreen/atmel_mxt_ts.c
 N:	at91
 N:	atmel
+N:	sam[9a]
 
 ARM/Microchip Sparx5 SoC support
 M:	Steen Hegelund <Steen.Hegelund@microchip.com>
-- 
2.47.3

