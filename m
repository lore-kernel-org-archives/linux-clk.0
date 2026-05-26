Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD943B83FE;
	Tue, 26 May 2026 18:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820898; cv=none; b=PCbfKtMP3yM6YKlQy2d2KKPBQcKadopuiiXDWxHDy+1QHvUBnMiGccVr0R8B/DUZvrgCypUQyzjMoiI7CUE3GpN1Y+bZ/Ilq9M3rKIb+eqp0bTxSRpA3lSRyvrqpWdpQY51/lDuX0hs0y+lWmENkVIhVNeDPwrHGkzZEJQkxIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820898; c=relaxed/simple;
	bh=55AiEH6smbbhrzZPSFcT6eC86ZdJdIV2C1Qu1GWWdbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A9zUJAWf+uSxL0GzuNA3e9NRRleqc51CZY7LfVpvCoQFSvHnvwzSbzZYku4NDAdku7INlcysdh9LboXkJRDNnMpilEewvPkUNzDh7pgtuFowGDEXAQiscZut06MY+16QOgbhGDBgOtVMVoB2BUGB5sclRMLzB+e6BT+iNPfZ+iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=TbuVdwr7; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="TbuVdwr7"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=55AiEH6smbbh
	rzZPSFcT6eC86ZdJdIV2C1Qu1GWWdbg=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=TbuVdwr7TWq/iELF75B2oakH/E6Pod6AmbUskma5KFekshjssa2t
	jv2MVmgEkCf6lnV7kFCoPNEV6SnT7L4MuBWY/slvDcc+34fzPqtLNOUc8jIGcDoovGjlcs
	HzoPCbLaG+Q58rzgFtbby7vo+m8Zdow3qPXizhr9xuHFBToHOlLas1N7zg3pkW45SdQ+JG
	XbIeqQgb02K3yV3sqlU4C00oE5xaa/1Eh96Q9XxXpLN2KFdpH6QR4OHGzzLe37Y4cLiRfe
	uQOKp/SrHvCl4egL5iz7KC2juW+KGuCIqF2uEiWXYtPG/eZQuay1DmUQvqxC1ohAnqn8ty
	1kovtsHJug==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 17521702 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 26 May 2026 18:41:27 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: mvebu: ap-cpu-clk: fix refcount leak
Date: Tue, 26 May 2026 20:40:56 +0200
Message-ID: <20260526184105.18962-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: f756e362d938 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/mvebu/ap-cpu-clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index 1e44ace7d951..7721d5fe50bc 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -312,6 +312,7 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		}
 		parent_name =  __clk_get_name(parent);
 		clk_name[12] += cluster_index;
+		clk_put(parent);
 		ap_cpu_clk[cluster_index].clk_name =
 			ap_cp_unique_name(dev, np->parent, clk_name);
 		ap_cpu_clk[cluster_index].cluster = cluster_index;
-- 
2.54.0

