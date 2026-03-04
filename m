Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061AD373C0B
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 22:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664701; cv=none; b=Kc9rrZvkkWlhreQaCa8EDFCOswC8mJY01iDEWARsdykxz/bwvJH2Fpvb2PowtetjDJclVxnsPJgoEjV5ehYKfLODaKBQeXkNllW6QPKo89vEO0PGxCsjc6oGoCjGYehOaEPskeAMvjzRzipGcusbuyd7ZikRyQysB/pfXFdQoFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664701; c=relaxed/simple;
	bh=+jW3MS7DFLqoUmBWO2hApFPt6x7I6eU55roZMBHG3AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIDsi0C8HgFDP9dfWBQZoihlJwhacIjhrLbLC4keWKq3fC4DyLvG1cVvHhg3D5GPC24nRvDR2Y/vlqMViK6TsKM74CZ9T5fS1ari5tZ/AfhY3jhbfKhiIYLLrhVV49AT3PK6arLpNSasfDweK8l9C4KkEUZi4ATS9rdcYk6LVEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhdIwUmF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ethVQs6O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhdIwUmF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ethVQs6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772664699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
	b=fhdIwUmFQlfj/JRs5mo1yWIN/goYOpKWLITNB+LHX8B4lTR1VmeEmE59paGe1ucI57Qi7/
	xNg6TG//XelM0loiNCHwYtd/Z0aY/SVJhyq1Phz6tCwzPfoCvmphU1YCQsFtoG6VNsqBzz
	/GGLRIrD5OoXVhVMY5DRr62LdJuvjcU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-OxLheqijMPqKPFAZKNb2Bg-1; Wed, 04 Mar 2026 17:51:38 -0500
X-MC-Unique: OxLheqijMPqKPFAZKNb2Bg-1
X-Mimecast-MFC-AGG-ID: OxLheqijMPqKPFAZKNb2Bg_1772664697
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-503810dba87so57217381cf.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 14:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772664697; x=1773269497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
        b=ethVQs6OKdSM86yy0g7ZJQ39Hk6IwhbcsNyjiMktaNcqwU3nYh4wRidJyAOkaC+8qk
         W0USlASM69BrVGNbqQDJMQ3l1YG3XocQyu5zEHB1rt8qE7aWpV6M/aFe7slf9WXoLY3q
         L8SqKBTKltNV+wCpWzKLsIVQ8kQ0hsZxCqGZ+Zr1ELJ5R2b2mISxJoeHsVeHnfMgEOh0
         zG42dNRxhb8HnOG8/Ri9Xvi/bVCcNOPEsajiLVOn8L0xtNF08spN+oBS0QvXvS6jW8Vv
         86oyrRiBQwDXDbDr7NfgI+JJHfIuyzoT9myQBY14OrDs0B7EsiDQHoWtENRwrT6cwXrW
         2BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772664697; x=1773269497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
        b=FimE8YcwL8BcinzPPnIiqmg78DxAlkoaaAOxrsaTke/2D9Ph/qaXXwg3YEkfkiIOuf
         e3bKCV23ZYhM/LXk5inh8cyq2txoJeoLMZu4cx5u325q1me+9WPF8ljBJXun10QptdrU
         vFfC6RyN+2WqfqHo0gDsAtYEPSPEabxsU17EZEsc+veIbhaMkDIXF17PwN/PNDixJRsc
         K6hrVRvsKadpZ1suQzxnjZIKenpwANbrpKC7PJdxlV3AnnkLchq7V+yWOxiOVQlp2XCZ
         Y4QVek3zNa/Rj098AwFvPcRK7dzmJt3AaS5qWC2h+tQLPZ2scsRrZnvErJPiRRlcrM5y
         crXQ==
X-Gm-Message-State: AOJu0Yxqemti568xoRphP1w27DKI1VD+9Xyn/8IdGQ94mJUGx7Gj+bxi
	aD58uHxE42dGMDpHH9sIegP8tYyCUHWAqBB1N11xR+2niqZikLqHbNMJVpnR84toVevFolprv1J
	vY+nGh7ByKbCmT8DUSoJCreEu11Nx13m6P1bUv6K2k3Fzvp6udIJugju33GyPDg==
X-Gm-Gg: ATEYQzz128Ng8EZN0McdkE+aS+DPWByvhlCIubOmFDocCnbqKLAajUwq0dQrfxX2LMl
	oDO5uVH6m+np31P/ET9RoRHzORefJ+IG16itdIVemBGCWajCcqjr5WQ/yJgahC7J6q5lXsgkUty
	dJElKH3cEDt+upJOKkxMSHxUuMrHnjUeYu3Zf6hKEOmJqYtn+sXJ0bmzgg4Syv1habeZvqKiKE3
	QMSwqQfVH4inYgZmcmLK/ASpDcqVJ1/8TGRfDAcJVsPfEMCRUrU6Alal0PpAX8GvagUiWuhvf1M
	G5B3vZPJsN0Qd5gU/3xMRbisJyqUYcLcRR6tEg+xLResf7Zx2WWSzYr4jy605CWeor0jv1GA2aZ
	4oo/0szH+ZiaKWqIsUa77gs43m6ej
X-Received: by 2002:a05:622a:3d1:b0:503:2b0b:ebee with SMTP id d75a77b69052e-508dadfe8e2mr52202021cf.0.1772664697419;
        Wed, 04 Mar 2026 14:51:37 -0800 (PST)
X-Received: by 2002:a05:622a:3d1:b0:503:2b0b:ebee with SMTP id d75a77b69052e-508dadfe8e2mr52201911cf.0.1772664697106;
        Wed, 04 Mar 2026 14:51:37 -0800 (PST)
Received: from [10.125.247.224] ([2600:382:7705:162f:3db4:e16a:e5d8:352e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449b4dc0sm157558891cf.14.2026.03.04.14.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:51:35 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 04 Mar 2026 17:51:04 -0500
Subject: [PATCH 2/2] clk: test: convert constants to use HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-clk-docs-v1-2-fee468db99f1@redhat.com>
References: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com>
In-Reply-To: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+jW3MS7DFLqoUmBWO2hApFPt6x7I6eU55roZMBHG3AY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJXbM8vlJ6xzfPu+sOu607cu7N6pY3HVoaWwJKVdXP9r
 jpPtLSc0FHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEEvsZGTrOisn0r/0X7Pj4
 +PyFfrfY1z3nu68steBDSZiCkv//1MmMDHNWJJ3vX8GmM//JPlE1PW+D0gMzQh1ezuuer7z/6qk
 Pe1kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Convert the DUMMY_CLOCK_* constants over to use HZ_PER_MHZ.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..372dd289a7ba148a0725ea0643342ccda7196216 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -7,6 +7,7 @@
 #include <linux/clk/clk-conf.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 /* Needed for clk_hw_get_clk() */
 #include "clk.h"
@@ -21,9 +22,9 @@
 
 static const struct clk_ops empty_clk_ops = { };
 
-#define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
-#define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
-#define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+#define DUMMY_CLOCK_INIT_RATE		(42 * HZ_PER_MHZ)
+#define DUMMY_CLOCK_RATE_1		(142 * HZ_PER_MHZ)
+#define DUMMY_CLOCK_RATE_2		(242 * HZ_PER_MHZ)
 
 struct clk_dummy_context {
 	struct clk_hw hw;

-- 
2.53.0

