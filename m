Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5920E22425B
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448443; cv=none; b=EqYqAEA21g4YCj0L4cYq9RbJw52fevQWxiaD/fTtspMO9W5Q4a10e9yu52OBZCwvRqa6lW2NJUGVV2z9f4Va3H3n+Mjn6ts0W1gdeyXwqtzmk1RpzeqZQA8YIyKewOrmfYL4Ij9iJRcimiD9HlZ65DPs5qt3UWLwQrW9oOfNzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448443; c=relaxed/simple;
	bh=Ipw/QvXlOZd12wv1pGCquJWsD6OU8kKbhT5EbVPlBU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bv5BaniqYQbwpAlJaDMLAAohGMVhKiuHNHlJdO6wNP5KEa8Ik5RPDSnwdCdUbWcm71A5rh9pow5Qt0GC9KuZ7IQay+kCJY/J7jPL4u8oxM8wf2CISD7Zsed9Uko/j/rrd4U1EJTA6So9/4aoYvGEr25k01HpaBOLddsYZoB+tLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=cEIwAccb; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="cEIwAccb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0De7nRlzZgKoNpc7KMRM94XZgm+NHhYXZrrxI/qWjOs=; b=cEIwAccbSRPA7QLojMwx5/yuEI
	TG4qFGSPFjZ5wIfJDB7GeoQfvmyssvUX6dxsG6kaxS1yxnKp30onIrxG7wgGf+HhoXHv+owTdEWGd
	8qHHgwz/a2HMIHxJjt+ozENMgJuPkgJz0MvjoWLiTwwofY3RtnzcbCXDqcqep4zvGC6n80PSF9RYk
	iFNb5/Ro2y4K0+eKSVjWWOAV5cBmlS9iZ/qfCiyI0HcSI75WOuVWuBS/XskmK1vvPgptFNISt1ilk
	LfZH7MY3CVQAZUcrHWwtrt3+ujHuqRyXYWE1KdnCQzWvkvffPD5W/M515MvS4HEv5jJ1VXh3sD52i
	DiqaffJw==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQMr-00A8mi-36; Mon, 26 Jan 2026 18:27:13 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:38 -0300
Subject: [PATCH v4 2/6] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-2-caf2df16d4e2@igalia.com>
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Ipw/QvXlOZd12wv1pGCquJWsD6OU8kKbhT5EbVPlBU4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6PdWIgLKW7phUhvdJ6R6PyWSq8aZ3XXhx641
 0jiwpVaNPCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3QAKCRA/8w6Kdoj6
 qj5NB/9KNeLucl/rs8gnnkCbdgPqf0KzP76O/NvCzxKtwAvVviFqV31M8NuvkQrvSdKqQLAdTQN
 kpSJsVtmzk3kQuL3fkJretPiXS+yYWYYbMsDil+9J0Fu7oU4SK3kyXA+71rS7n0FhkxX3WAEQ+E
 7JqM8qaxbKD5YDRWfbHRpxTWVChbMbayQC9id0uLIhTz7FjdodAvQ7olzipqwcLpZBTOEh5RZdn
 4lqEDzPmFH7tkx3VJq8xB8rMP+tgB6J0WtIHCynlAkPjOs0wA1y9BKHMrJwDBycIBRvMrnuq1ns
 0uWBh5wwmCXjXy8iwPIK2P5LMKaeP4NoIaKwj9Ac0I6qk8/3
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. Document this behavior so that clock
consumers understand they may need to set the rate to minimum before
disabling for meaningful power savings.

Suggested-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9783385d5859836898683209e320fcc928dfdc71..2e63121af0900ac9b4874b666cf6d02baa8be11c 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -308,6 +308,12 @@ static void raspberrypi_fw_unprepare(struct clk_hw *hw)
 	u32 state = 0;
 	int ret;
 
+	/*
+	 * On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
+	 * actually power off the clock. To achieve meaningful power consumption
+	 * reduction, consumers need to set the clock rate to minimum before
+	 * disabling it.
+	 */
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
 	if (ret)

-- 
2.52.0

