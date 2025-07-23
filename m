Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D9938DDB
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277145; cv=none; b=eTwdgv9y4LC+0jPVYzPZ9ujxq+nK7i3o316K4p1bEU0f36ryCz9xbA4IVH40K3B9X15GodsqMcpbGpQ0CBoqzJY4W+qEkdfzrkCEDktI9y6szBO1xJjw2Z+4GlcTlWGviDVrZIIMmY2rxP9AMqhuvgnJYy7WdRPMGg4cI4b9Whk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277145; c=relaxed/simple;
	bh=IRWOjBedd9/hnuVTcXrjjqnFUAKjZDKX/qV1HyL1jLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GX0fbwEL2jPji9N69Sj86wA7P+WI4PY7Qop7F6a4o/CsuxJCLxEwnLI0HMANUz6QYRS6SrdVbsibSBoTRUOFCp8RDPMMcEEApTubwq4AN4D8LiKFvStXbXFZA+NU1VsyS/+xDOgj72+UQmXzsNkj4M4T2YS7BOPXqLfbcEJcTuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=vimqZbjm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="vimqZbjm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so3471388f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753277142; x=1753881942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jOFjaGN3CsVqLePSDjEetRndyZpxQTsvQQ0tgo6UDc=;
        b=vimqZbjmm/spvJmXK/kKPHBVAm+U/wAHIaaLk8ZPVLGZGzItLRZcjYh/vxcTTW3un1
         XCslBPt8gt8zlDHgbUflgpoZysDlYVrBwrxpyZdE94z+3BaFz28+eVPa5XsN/79+waGk
         cDAwI4jHBNW7gYSpb7KOSn5QTW40DP1bsZ02nQ4cno9/XPCAzgtwGQ15cT2yRzqWW2MW
         HPaVdQbsZ3EQcynQLhUWWjgd+WCe/qp0FIX3SB0tK2Z0U0DSnDRR2bgs4RISZVinVJrz
         K2zZuYgzwPUuPmrOtm7PmM2oI3XId5t7yZ86MjIveNG81zyfKCPjY/Rv6qcrb4FfV0lZ
         bCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277142; x=1753881942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jOFjaGN3CsVqLePSDjEetRndyZpxQTsvQQ0tgo6UDc=;
        b=c6GsDJ5CXlUACk8hGfO25qWTkFAtADHmPVVi4fnNhYPsFBTB9+UUNh9/8lKeRYW4Ms
         C67xjAJxCwIZC/EuqDWtwfrkSdCkn56u7zRUvk9rVKgxkPOIPe0N0tkkTNMC43fx9Ity
         w7OblMYJWfS4A8mWbwQpSCwMo1UdBD6+M9qshZdiRqiNzDk0yyQF134Vxu+IeCw9yDas
         Q4+sRYstiXPhmLFnMv/wU56pzOzQkXfU18h852FoHCjst9GhVrZL67Fiq320HZ3lZt3B
         2FKMk/D5hjx5mjhKnlnOs9jyr9VfzEU3WWvX2FkPYWcKInvOyddt+lumIQ9WTh5KgugV
         CT+w==
X-Forwarded-Encrypted: i=1; AJvYcCUhPHgXbT9QGeAgTABO+dbzTiNyuuE93L/TiaOb49Es8NVtaj4m1qp1Hjv/+Nf1o+lJwqiurxEtFhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHcy/fjvW7NL8iSWsM1p8UBp/3HvjxROuUcJG0ynNF5puNRCZk
	cyUL1ggzQvTYFEafnMEjkEEZnjqAzhpGA7fZdXEaUNrZLiN5CgzkZ4I4MALxxCYF+9k=
X-Gm-Gg: ASbGnctWGP0rS3iBNQb7hxHvXo0DRgEcobsVjSWU9PzlfWb8BswThV6+EgbAJcDs3Nm
	zUYYnU+TyhNCyYl8/vWOFGkejHLcbheNEz2nUcdK0BwX2dVrCKigjiZ/a1jbLzkaLQ6dzacAUhB
	CEOd0YXyxv3iVuHe2KZE3lvv1l9H7UytEqM2yKS5E0ulUKVHdOAIE9QMO3tqCHx8MYf9HjnaOlz
	aGNxrT1xZLSSGz4LGbcgKEVxvu0EoHfdR6ihSNtXs6INJNVntF/5Oe3Hi4OhhRBn2FZrJz/8NsS
	HB4I7fXkXy/QxYm/9JPDNar7G+Tv3X/WS95ojtE/WMs8QO9OgfRmKjf23CBj7pigchwFvw/xd/5
	oG717xmS0xUhM35rAEYebE6PznzumwhqlibD/+cXQF7+C6uNM0Q==
X-Google-Smtp-Source: AGHT+IG7lEmEEOErHvtFjRdp4cL9IAeiY0R7yViDRurEsfQTfNPWbZmrOYW259gPKET6e12uFu2ovw==
X-Received: by 2002:a05:6000:288a:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3b768f16391mr2725907f8f.53.1753277141746;
        Wed, 23 Jul 2025 06:25:41 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca315basm16320109f8f.39.2025.07.23.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:25:41 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: sboyd@kernel.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
Date: Wed, 23 Jul 2025 15:25:04 +0200
Message-ID: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function spacemit_ccu_reset_register() allocates memory for an
auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
these resources, resulting in leaks.

Fix this by using the appropriate error handling path.

Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- Properly place the Fixes tip.
---
 drivers/clk/spacemit/ccu-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717..5bb85e32c6cf 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
-		return ret;
+		goto err_free_aux_id;
 	}
 
 	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-- 
2.43.0

