Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA11035A39D
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560571; cv=none; b=EJiFzJDlfufv4utU2Z6hsM0XIAuf73yXFwxDUrd9pSKN47xGikVXs3OFCQloFEOHQau3S5Ydx5/NkOZWvMLG7PRmFwF7anuw2JhzTBkPBJoBb/N+gbx3FKuq5u6iqtpTtLmWAea6DRUFqZ8gSjeuBF+wV2EFRWCuL8w3uNNt0Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560571; c=relaxed/simple;
	bh=oxAbotWaFB2N+jjEcpt6qO0uM9bVk5UKzEWYcyG4ePU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NC0QE+a+LR1Ln++yMSACMX0gw8wDU/cEY5SITU3ap5faGQXPI7nsuph77gp08G+zKiK9r8uCqDYm/k3P0vLoRYHlDK3ZrIosilr40KPwU/mER3ub3OirBwdBerPzl4992a2BY6/nlS+PsM8iNuc0xxk4mW0bRVRpqdsUi6xz5to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rm/dVyy3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rm/dVyy3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F7404E40703;
	Wed, 16 Sep 2026 12:09:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 044DE60337;
	Wed, 16 Sep 2026 12:09:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 431A911C7AFE8;
	Wed, 16 Sep 2026 14:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789560555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fyLE9zoLiTs8qfHE4MYa6cDtfGbGDtLzIx/O+uanbMk=;
	b=rm/dVyy3PTLU1baPY74RWGsXoV9PcgfrmD1rzGkajQvXdSeIY2xvX/2NXeTvfVioShUPHs
	oVmXeIZfORLjpvqVBPmCuGJZgIgh+uGBWK53CD3pTwdLgQLB8BSgE4PQxyWQeFpT+76qTU
	fcqY2e3x4Bq3liBsHzKbuxLoUI6rM3GA3J7wK5uM86Rd3FCNtClHyqFKPfdJknEEjpt/Pl
	gKdhfiyRPXWZGkS9ENus5KS33ERyXeB/6vVIxg9qQ0CZLS3Q39NwVnzakSQFZ090y8vT5j
	cVMezkEZDSLt4xLnTeuy67y1SPvNSYMWfvcRIT4cHFU3LnM68dvjYynk3wri9Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 16 Sep 2026 14:08:55 +0200
Subject: [PATCH v3 2/2] clk: eyeq: Add mobileye,eyeq6h-central-olb
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-clk-eyeq-res-v3-2-93a3b831a5d0@bootlin.com>
References: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
In-Reply-To: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add an entry for mobileye,eyeq6h-central-olb without match data: its
clocks are all registered by the early init and it has no auxiliary
devices, so probe() now reserves its region and stops there.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 3c00be00889a..ae0faee31689 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -1183,6 +1183,7 @@ static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
 	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqc_eyeq6lplus_match_data },
+	{ .compatible = "mobileye,eyeq6h-central-olb" /* no data, early only */ },
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqc_eyeq6h_west_match_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqc_eyeq6h_east_match_data },
 	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &eqc_eyeq6h_south_match_data },

-- 
2.55.0

