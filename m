Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20A39B974
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482773; cv=none; b=OMoJ3O3XErcnXloIhycQgCAdyjojX/ubF64PFB+37ko7WRxvrmARqhqN5JIDD1U6CKCz4RfUJFVgb5HDvVrg1Lr4HZP/r6hu9IPKIUepBswCUvpXrtWFXChFGKuq9W1PkWFoSuIkzMp0KLaVQUqVG1RFYvuJDcU0GQjYgLcAWk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482773; c=relaxed/simple;
	bh=+jW3MS7DFLqoUmBWO2hApFPt6x7I6eU55roZMBHG3AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipfPZ1ahfwD732Un2dASBSXwE9KkKIRS6+rplABcsGlITQOgLjWu27HAcdl2Z0XW2Igj/tBvqCjK+KmarX6ShTWzUYTQDzBZaQNCP3FnpAyYO+LIaHAxdTdA2NlXo2iCZSAOjK2m4crFzpk+0dfeccxTsLNi7ODdakWRsh0Q6qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fTy1p++B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r4N6jeit; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fTy1p++B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r4N6jeit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774482769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
	b=fTy1p++BEgqy9W1r/zqMbR5nBQuwISURv9pNNVY8ci26nR4uS8+j8DWJVwZA/vDiIRjY09
	hT/n3gkTKsNdzwHY8htCtdNDFqBuFyqLbRoMYFrK3YUqwzhBZSbYOsVjbKIxzIrDYiwP20
	A82Wgizfl1smyKQZHy68XZY7m5tr3Rw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-PzcQJm5TOja9BOEh3s_5Pw-1; Wed, 25 Mar 2026 19:52:48 -0400
X-MC-Unique: PzcQJm5TOja9BOEh3s_5Pw-1
X-Mimecast-MFC-AGG-ID: PzcQJm5TOja9BOEh3s_5Pw_1774482768
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso172059985a.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774482768; x=1775087568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
        b=r4N6jeitw/yPZH+h/CuxK32PZJ1esrFGazci8dWmNiqWpvPrtGuU0TRcHSnJWP0Ezt
         dDLJhR5195hBS1VJmJdAxtUHlYPgEYZ+y+xH8UzJsyIB3L3ScfmcJRYXhFHJmspVzBo2
         Bnj6J777R/rb681x+Brmhd0IPV53LKV+cjMyS3wvq14QhyrCh52AY2cKvLxqVJyGjVLE
         38LftgZCtJYMpgaoydzwyZDH5oiNtUNvUip99v/SUaAdZkvszzNpUXpSF6jb16qgw/Vw
         95dw4qYuKyOyt1A22+dQLhxjr9+iwMK3JG7KX4g/7cby1OJn8FbjdMP5tCJXrhcIUjfM
         Zhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482768; x=1775087568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
        b=sCc5qWP8fb1DNkCGHxBuFbpshmQr+eYAlbSxCJt7WGwnnIJ1ckn3zlh2kED9p30eBf
         V3uPtBz05++RpSDUR8IV8+x0D2B/T+NQBW1GHp6yVuG56zdcjKZAL764P4DM/wYD9+VU
         /15W3Y09pl7rw+nUZyGFL06bNZpj1GeuwByccph3pSeSYMJXQyi0Z3FJu3IeFrMKc2kS
         rXdHWlXOwA/waxCWmmt8ao5AdjaAdy+UygSOIfm6DEerXvKRDdQsm5X1jLl5zFj0Pt27
         dDmmla8Z7sLxLR/GJLflJGdsu7rebXxiTvsohISNNVJL0LRkRmu8Z027hu8nOouBTGrT
         8AXg==
X-Gm-Message-State: AOJu0YwVPF6weZNYaXDt5Nn1P+DwGDoSzThPgp+iUOg8ebnBjnbI/UyW
	+q+ZG0bLmgeA7b9mDSQon7mnjKlgsIBMXJ0F4uB7OmemyrWfFDhuONsGrGX57W964kk0vbWIcAy
	niBarAApPOlU18xJXcIqPytzKcQtojBzxkVgue6OlMEdc7BShc9zLEjgwbSV+uw==
X-Gm-Gg: ATEYQzxZoMmzXYv2aMc1diBdQOKi9yii6L+VrStf6ubzp3XwpFC8YuulGMbDtOgc/ur
	FjU2KgxY19az2xOYm9X78kqlErHJjqZMupBiyQEaPdMvvG/flfH7xWFTmEqlttBwJ2bhjYNYoqk
	HyyL/Bce2L54pdMFJQTsLI+4heit9GmyY1ZoWXoS2yGBM6R8Qll+Mxi+Bq3XzUiEq4sp1RBOLxy
	S3w6sY+TQucS4oqmLxdM9SXX9cx16YPlwki4j9SijQAuOmQHuEXfm4Pfzy+eZ4fUF/QClB3D3vS
	4RFRFYHcYTggE/lRPr6cFbaQvoF8hG4nQpmGHH3/V/wMAlJAQSMhXBBCkZP7NgPG/a7Gi0zZRBw
	fMIcexweNF/PzHpPXFON2DRHabfFeAwvsKPlZ7aiZvty9qHeqldeL5O4Veype
X-Received: by 2002:a05:620a:44d0:b0:8ca:4545:aeee with SMTP id af79cd13be357-8d00101286cmr801587785a.37.1774482767963;
        Wed, 25 Mar 2026 16:52:47 -0700 (PDT)
X-Received: by 2002:a05:620a:44d0:b0:8ca:4545:aeee with SMTP id af79cd13be357-8d00101286cmr801584985a.37.1774482767454;
        Wed, 25 Mar 2026 16:52:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e501eedsm106346785a.40.2026.03.25.16.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:52:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 25 Mar 2026 19:52:13 -0400
Subject: [PATCH v2 4/4] clk: test: convert constants to use HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-clk-docs-v2-4-bcf660e1ceb5@redhat.com>
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
In-Reply-To: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+jW3MS7DFLqoUmBWO2hApFPt6x7I6eU55roZMBHG3AY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKPlDq+9pR4pOQ7aYO4ngWf48nCF8xr9143nDtDiqv1W
 E7vpUfLOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgInxzDH85ziXPqPLzmfN3p
 s7rusprX8dXTws5tqyztfcznrxbv9oXhf4LZ9UdfnWSP/a879PpEunW6QmDqmi0/jd6Id3PzSzU
 xMAAA
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

