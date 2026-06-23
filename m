Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF4D306757
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231645; cv=none; b=Pxkg49yq430ELVEq0JGYT06yUxhXz7Dv33FUtGaBOUzoR5ompw4vtEwOLn864NBLlAJvkhTIjzRpMkzuDZZ6B/213LUSBVpF42TG5rLbTdUEHf/8U7aCU8ALcftQ8l2IgtbGynloDgJ3udcoOw9WYi4rZN5UO9iTUgcxVeJVCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231645; c=relaxed/simple;
	bh=GB0v1r56p2oKIDWODMeWfe2Saf0feOje1AnHCDa5egc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GShuAXDQnOiEzHbcNaX51n7GQqLvpF32OkGz8YOuynSL/VdAqXGEtm5isaxGndEifmhklPO8Cl/IaJKKN7BaJDEpWGsK9bqWcg9OVZeIja8ozLP0brpofbSYrB4lq2fT3Jaiw0jE3ltAhwwvvcmD3TDKCTJcf79BvcvI9UvsbxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb/xaqsO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb/xaqsO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4908b92904fso1089665e9.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782231642; x=1782836442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6zsFhyNg4v20o6k8uh0sFiRqoOz/yr/BnKKUxkYNu8=;
        b=Hb/xaqsOYWh00j+By+dzIeD1W39JXmnFX3rygPSF4rkYGobjv3cj7tUjEJcdbGhdaW
         V0TkZPtwXyk8h2WtZbLn158jGAeCb1QNvaPemTxjanJtWM+BSU98lj7aLyEN2AZMEKkl
         hgUARZgbqVXC4vFI3q6FL/ZxeOxX+67EGAlEYmRmJEqQUMD/bObqNy3dO5tJfnjixDcJ
         YCuF/NPZc2lToyBqm+H347cwtfEmWIiwr/i9DrpvuTRVpAQl5SRljeKEN0Qf4yQ/qKyv
         2p6UdMhRlqGRSrW4bsZdqMXRPsr7eS3SfeNWeSJLisKSPjCk4N5JuyF+RjnBoYi3yefQ
         WsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231642; x=1782836442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6zsFhyNg4v20o6k8uh0sFiRqoOz/yr/BnKKUxkYNu8=;
        b=ZoqXRYWzKXDcdzAR9u4sfN+LAb57lw4iIv3OoVBi1EucI30VX85TkGcXpYIUsBd4rd
         cgGXRej8m+z5WmPLpxG4TVkvDJVbNLQKo7LjZKJExgl/Q5s0hMm6QBxJfv207Tp+SJXl
         /awDWB4cB8HbOeJKFdYZjw/+w0nvzelYNAXcJzak4j5HmPWYmzzqy31AtzXSuRNabGq8
         5qsy+TalaDZ54JHCDU53F5yfxD4gu79jWznfiPfUK1QZwxZOYCYSNn+bIWB4yN7iepUc
         UhQDBlj2Kw2fgWJNma2TW2vyhZhDr9+/9ejrTxgVucAORQtzuUTWFePexWMO14nHdKLh
         12Gg==
X-Forwarded-Encrypted: i=1; AFNElJ/63UVPtBPDN9vEwkTLR5Kky6ZLjaxBk9C4JAwimaaD58/49u14mXcEOQtYtM/7ErEgIsJhmUtL4gM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKHb/tdnFoEhzhR3hhoDOBl1Hxe5+XIy9tCdLKcfHoNyoVur+j
	QmjJTNMM61v6pZxyxbUiy4lyg/4Ova1W+toWU2n4l1KhmFuG7QiQVtyw
X-Gm-Gg: AfdE7ckLEqMH5cxagMS8DkgawrtZvU73cRCO8cIYR16ynO9nrW1EMJjNzqp9nZCM29f
	DwRxYLBeZYY40hSSiymXU9MhQI9D806YYjQeDI4cePObnZrU8f054udCzg5sxe66otLomxsJwjR
	dkKNx+Ya153iy7IFE2RGN9BdlFovdAGg1ZK5endySWUWhb9u8t6DS/uwrpjNyybFwRPEENvCyBG
	eKzbeOibu6YUbSvk1MkL7Z4LgbsXEw26DdO8mFHmXWktV3lsaNBDpwKzI85CH63Xu+h1nrD4M3p
	0GjtFLA/lHPwFf/shj+oZjZpNzfjVbXfUpAQNJoIRYmKGwXUlBr7vr7ZjCbqEEPb9tBp9Uiauf7
	HYU8Jjrej2eKY19euFkPIU4gCzvUbzYusVjkNYW6LwsaG41a+zYKhHgPNtDbhLUNiiVdHxG+heG
	scMqGavf3knRsgIHImKBiioYU7p1SfeNtfMOM8
X-Received: by 2002:a05:600c:4504:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-4925b35d6camr50930705e9.15.1782231642037;
        Tue, 23 Jun 2026 09:20:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:866b:1811:6889:f05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923914fsm315495185e9.6.2026.06.23.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:20:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
Date: Tue, 23 Jun 2026 17:20:37 +0100
Message-ID: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Alex's email is bouncing. Update the maintainers list with my contact
details to take over the schema maintenance.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref [1]
[1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
---
 .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
index b339f1f9f072..990d287d0a90 100644
--- a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Renesas Versaclock7 Programmable Clock
 
 maintainers:
-  - Alex Helms <alexander.helms.jy@renesas.com>
+  - Biju Das <biju.das.jz@bp.renesas.com>
 
 description: |
   Renesas Versaclock7 is a family of configurable clock generator and
-- 
2.43.0

