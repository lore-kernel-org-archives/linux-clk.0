Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6A72FD1B1
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447582; cv=none; b=LdDVyCillidygwCn9jXr0U2ziGtWX8Bq7K/NdPdVkurPXX7fAcrd/nMGj3A0lRN/0tbB1hR1/ymNHh/QuqhWiDBmDjJ1vbh7xFtdTYre80TShKut8vDZl++CbI4I+tcz8+HaIBWOFgjvJ6No4UOnQyLgt2Mmiy7Ik33QeDe1F54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447582; c=relaxed/simple;
	bh=/i7oD+HdEV5+FKpKWf+g///6ddnKCJYwQMS7LWp2oV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0YdAt7vJRt/WPmgQTW2VpnQUhG/45ljbKjJS56ffLjGp3LS2E18oO4G13lMC/+y/aGJOO7CjkaT5DRbBYPzgrnjumbSTXaxhMJW7bk1AIjLaezpAbEfu7z07M4BKpOEYbX6artfW7miloKczImxOvujpDU3lTXONlsC5L8//Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CBBUe1eN; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CBBUe1eN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dJUICxDk015PLfzQs3JF41wFjRVpYrqT9S2gtAwBHi0=; b=CBBUe1eN3YrWLixRbeYzi0iD/U
	NPfAu7N+i5EBiT6p0VJKmMUEhZ3nc3hKBdBSi+bzeNBGUD/u5Lb1v7Yj9B0kLAIPqNqAGDkozC5iE
	HjbnYhY5n3bbLePKDfSOSAcn2+Nav4gDYfOD+wVjTnYTJs/mbTMa6Hr0tIbop868PufozLrJw7ubc
	8+IvOnHvQduFpZTkEjG3S1mVmOnEVAwSELgv/pxtXtJbZCB9tN+RB8JJK2Mt++6FJ4aJ+0yXklOoQ
	JOrJT92gT0ckNzJTvsph32M7WXj6fAfg3EpvVrmNWRD08h2unLV7notQgsjrYRnn1ZZZJcivdH+vL
	94OSSQgQ==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoR1-002Czn-8e; Wed, 18 Feb 2026 21:46:11 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Feb 2026 17:45:01 -0300
Subject: [PATCH v6 3/6] pmdomain: bcm: bcm2835-power: Increase ASB control
 timeout
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260218-v3d-power-management-v6-3-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
In-Reply-To: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=/i7oD+HdEV5+FKpKWf+g///6ddnKCJYwQMS7LWp2oV8=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliT5P9XiXDOHTDoiVcbz9TJ9qIpK79AuFWnau
 IyPfH2YHBWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk+QAKCRA/8w6Kdoj6
 quUhCACIysUXtrkRvQYkkrInI6yjQJvz67fNCnfp1u2KrfJgVeR0VMGQGnjA+2o9mhe+uE2Om1A
 gqYZCSsCo+s6ovFbvYg9lvQXoXfWSWzGzWaJ8chw8ulwNQ6ly2zFOn9uRxzc5SCRhU8x4/MXEGP
 nY4vNB9Uo9cNAqvjmPg/Pt0+TtyG1VOqz6a0EaorKDUHhMC7E1971vbRRDP0QApPAUNYBx2g0qr
 d6uNPX4pdT+5x5k+YnSOxEWL6tNStyWRnoD7NU+LKVqmQwFHtew+NWhVkeqcWQBEenWXjweLa7h
 +IsBXIdXTGRHqhfSBYNUJ5XHtHZD26kXhYT5aKflei/+WosW
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

The bcm2835_asb_control() function uses a tight polling loop to wait
for the ASB bridge to acknowledge a request. During intensive workloads,
this handshake intermittently fails for V3D's master ASB on BCM2711,
resulting in "Failed to disable ASB master for v3d" errors during
runtime PM suspend. As a consequence, the failed power-off leaves V3D in
a broken state, leading to bus faults or system hangs on later accesses.

As the timeout is insufficient in some scenarios, increase the polling
timeout from 1us to 5us, which is still negligible in the context of a
power domain transition. Also, move the start timestamp to after the
MMIO write, as the write latency is counted against the timeout,
reducing the effective wait time for the hardware to respond.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/pmdomain/bcm/bcm2835-power.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
index 1d29addfe036348e82293693b4059e504bb25575..7b9eea10a24e26835deeca84c60ccb616b99a508 100644
--- a/drivers/pmdomain/bcm/bcm2835-power.c
+++ b/drivers/pmdomain/bcm/bcm2835-power.c
@@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 		break;
 	}
 
-	start = ktime_get_ns();
-
 	/* Enable the module's async AXI bridges. */
 	if (enable) {
 		val = readl(base + reg) & ~ASB_REQ_STOP;
@@ -176,9 +174,10 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 	}
 	writel(PM_PASSWORD | val, base + reg);
 
+	start = ktime_get_ns();
 	while (!!(readl(base + reg) & ASB_ACK) == enable) {
 		cpu_relax();
-		if (ktime_get_ns() - start >= 1000)
+		if (ktime_get_ns() - start >= 5000)
 			return -ETIMEDOUT;
 	}
 

-- 
2.52.0

