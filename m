Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D872E5B32;
	Wed, 25 Mar 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456570; cv=none; b=MPzx8Ljdvd48WVWct4Lm55y4DNS6ds2XgxYcK4HMGEllo5CivGdOnYIppsdKFkdRlbV2kFk6DeSJflDB6miKay6znkx1/OeaRrHqZJmLpW3a68GusB7rd/hFQznRpKVrA3obw7ztWnY2dxFMc6JQbCQLSE9w4kdEAxoTvq4mbek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456570; c=relaxed/simple;
	bh=iEJ40cjQTuA0hXqbXoq5UKF16f2kX7lK3zTmHw6nEK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LbDaxLs63tZfh5CR4qAqs7Xhkygt6H+9YKVvzCof9f8qLWTOL+MxPLOiUlgjTWETEHFic+auzEBgreMywowmH+6wTVVbQtozSfcb8LF6LbIJ16zjzOZmQnBee3VpdRaYXhaBNNmnC/qgDkVW6dAhQR5QxI1kn8TryDRASkCRpFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OejoQi0Y; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OejoQi0Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=oFiaUt994tgXIcmq5BYOVrSUdNeGQCFgDCIzyi9+nDQ=; b=OejoQi0Y9i5GenYcn8HFErdIBX
	GYvt8H+ymO1opE5GNEdMgAXW5v+NzosX0Bv68DFT5jVoHdZ7Nm5qqm8MaCZQMHoSQIYtcwJ5jo1kZ
	kLXcv03L/3KEcosEtxaDXWNMVAPgLOdPSHBN+jgmPtlj42QhXObPNQCZxP/pY5w+VlgbGUJq8NlU9
	gl0sH9sG56/xwVVFAA/VBTvUGbWPEGcdoSGumLfP4qO2nWzrVv/1beBxHqn6FKAWvRCROFUm1Dx86
	1VJ0ul2Jt2a3L+BE5aCCIOoft/FialTLMjlknyaY0kRUd69YE6eKvCviwr3Kr7MB820PFy+xb59Pu
	F/F7PNHg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5RD5-000Kxr-1f;
	Wed, 25 Mar 2026 17:35:59 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5RD4-000DdV-2c;
	Wed, 25 Mar 2026 17:35:59 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: scmi: Add error message if SCMI protocol handler could not be found
Date: Wed, 25 Mar 2026 17:35:50 +0100
Message-ID: <20260325163551.1081019-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27951/Wed Mar 25 07:24:10 2026)

In case the protocol could not be found an error message is better than
probe just failing with error code -22.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/clk-scmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 7c562559ad8bb..c32b15b272ccd 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -384,7 +384,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	scmi_proto_clk_ops =
 		handle->devm_protocol_get(sdev, SCMI_PROTOCOL_CLOCK, &ph);
 	if (IS_ERR(scmi_proto_clk_ops))
-		return PTR_ERR(scmi_proto_clk_ops);
+		return dev_err_probe(dev, PTR_ERR(scmi_proto_clk_ops),
+				     "No SCMI protocol handler found\n");
 
 	count = scmi_proto_clk_ops->count_get(ph);
 	if (count < 0) {
-- 
2.43.0

