Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0840939D6E7;
	Thu, 14 May 2026 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750959; cv=pass; b=llrz4VczzaJ5x4uy23V2NaPfIfuvbb58rJzW4p2sk4mtFQ0+676oLLmRtEeJfSjT/IYUXcy7yagMKAWtFjANQE0fTn/KMrBdlG+gz07YqL2uxxxNTy143Q5viM+t8R7+ozSKZ/eyEzgH2oEP5jLhoYa3RcWKrgGCoI89AnY5/RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750959; c=relaxed/simple;
	bh=3bKVlzCRSrUWEZ3gCwiFPOq+BkySOj+CH4yCIImMNMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdvNUApwxGn3l+9ZgkbK7nYnRHFP2604m5WIxh6DapnuCUgOWft4s7v2KQscfQZjabXj6xdT5YeVyDze1xDdDDwTeppg0u30b71fciNXFQ4EHUnfRQrjeXl9brwtECvphtxgB4dCX6wKYE052gww51GPBTZImUBGC8Qd8+jqHmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=lGVr1PZS; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="lGVr1PZS"
ARC-Seal: i=1; a=rsa-sha256; t=1778750942; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OUztNKNvxKx8BTHIAT0NVd/xlA5EkE7Cnrhe1KKRftdcSOy/6ubJTr4eEORmxjsGhDzPrN5XW6R4gzAhErEZVLUW3mGMDB1qrNgRkLQS3LiFh9Sqs1AUZ2ED7O46KHxO6n/9NviZi4WJVYK2kzn+u4WipgqaJ7CBLsOy3rl9eYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778750942; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9LNCeu8aLN/0ZrXOBXKgi3APh74x/QlkzHTfwujzqwI=; 
	b=e+HGjdYnQX1Ro9oUmYiony9zT6oahREBvyL05Mj6bs2LuZXLbliLmjTxzHAYEJ+xbwlC0MaLBdVvrkhg/6mqGLj9zUVG0Yv9z+PJ5hBkZZa8/m4zpd4WnJK8KT8WgrLxxKAKY24KnWcUjXFLKMSbiOyJdTGrUYj0QBIQcVoqPFU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778750942;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9LNCeu8aLN/0ZrXOBXKgi3APh74x/QlkzHTfwujzqwI=;
	b=lGVr1PZSVyfHG0z3csYaP785oiV5ZlUTrIly+cSmTIDhPakN9G8NrwB2XnoGnoOs
	JYi0syYnWV2QClmHQJUkpJrtJLRMnp8fDRclyzv/XwmjvWwFSxJHSZEdrnEHiVoyDvd
	RZVxaHtD1bfzISpfXCpeJaFbiu+4XVckiQMeky8o=
Received: by mx.zohomail.com with SMTPS id 1778750941232885.290315532009;
	Thu, 14 May 2026 02:29:01 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 14 May 2026 17:27:22 +0800
Subject: [PATCH v5 6/6] MAINTAINERS: Add Anlogic DR1V90 CRU driver entry
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-dr1v90-cru-v5-6-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778750853; l=912;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=3bKVlzCRSrUWEZ3gCwiFPOq+BkySOj+CH4yCIImMNMk=;
 b=eC16vayzbk3SlGcWQ+Jj6qjY7iw8dENwzpW8fCvLtkLSNLi6FaYxcxvY4MK/PhQTBDVGrnP5a
 Nbm25L6BBqKDCKyeZ7jVSWk8AFSqrK64j4EKygiu3xZ53J94fqiBaAj
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

Add a MAINTAINERS entry for the Anlogic DR1V90 Clock and Reset Unit (CRU)
drivers.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..4861bf96b996 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1898,6 +1898,15 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANLOGIC DR1V90 CRU DRIVER
+M:	Junhui Liu <junhui.liu@pigmoral.tech>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
+F:	drivers/clk/anlogic/cru?dr1*
+F:	drivers/reset/reset-dr1v90.c
+F:	include/dt-bindings/clock/anlogic,dr1v90-cru.h
+F:	include/dt-bindings/reset/anlogic,dr1v90-cru.h
+
 AOA (Apple Onboard Audio) ALSA DRIVER
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linuxppc-dev@lists.ozlabs.org

-- 
2.54.0

