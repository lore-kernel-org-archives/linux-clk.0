Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F426A0DD
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638402; cv=none; b=FBzC8iQxCv7ueOs9Cu/NKkhl6IA96V65rKzZEoILg4N7hX9/IqB5Vu5tAf/G3Afv7ZZlIl8LImavBtJE8k4tJjbrbKGvwpXsQfKb/zCCvHDE88w1tfoGzjaX5kmno9si2nCV9vV8dmhNoTXlrwLYTc4kqjyjxwauN3P4RBBJDXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638402; c=relaxed/simple;
	bh=cfNqvBT+4t4p82Xzh3cs6GlN0grJes6Be3PtGF5MnJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQCzqB6zTFfWPoxtSSZU75AkU6AlIKZCC1M+/5cugwt961Dvd/gmMJVJSS+P3w46kBlNW43ZhD41lJ3Gb6ESfOtEJTwHJxmc/x3NdLMWZwJEhVa5ues9un+d4Z0t3M1ED2/3RReRGBQRhhn2dDgsW/mzuFKIobbl0LukOzzz7o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JAhHgRbi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JAhHgRbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOLL9fGO5xV3TbAIppZMqjfRBpE7K4vhEZj54a7DmcU=;
	b=JAhHgRbihmAnDlmxv8Pmwgj6bIVjiN06UNHKtAyhfQzkiQaSBjwGUcC6XOHfR4QhusL5wy
	oBUqp4anKvl8HFKTEZftbTaUejhgDexPz/hwAsn0tkk0t7RT+ZIiuT9WK7u2RCueIyzqBv
	ceGQfx4hNGJiIgssFDWBMS/ysCqyaBM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-bgwPRKPDM7quu-fDQFgG6w-1; Tue, 23 Sep 2025 10:39:56 -0400
X-MC-Unique: bgwPRKPDM7quu-fDQFgG6w-1
X-Mimecast-MFC-AGG-ID: bgwPRKPDM7quu-fDQFgG6w_1758638396
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-81678866c0cso984996985a.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638396; x=1759243196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOLL9fGO5xV3TbAIppZMqjfRBpE7K4vhEZj54a7DmcU=;
        b=HqXjPflPeAuU6SOGH5oVO8cmm/EwYNpfV/JFZdULmLyOsj/5Zvq04u4f/a6m5RhW+T
         KP2XL2/VuGuq8TWRqTsRKMbmNomfPhaSL6PmsHBYRQsgax7fA8mhpWZSSgafKmFVuBZy
         hM2RQ3vDIlMbQ9s6TryEY4louFJgeRtMsjaVHhg1TPo0KurW4Z/5nZH/9VBs4MWQIfhK
         ICtwPg25czdG4hVIBHv9m0PFLiiO2As3xKzmsOGwT2Ww3sg+bJelJ1rYf+hZIEDD0QtR
         ZjnRkFPVoeSvo8kEhZvj9+PhE7DEGAmrT75CG/b97y0B4GAwMYK91qJ5AOb07f4966gE
         2uog==
X-Gm-Message-State: AOJu0YyBr96Ypl7CQgRQ1WDZxAtlCwDdUHRjDmV9Y8HaTyWLFbQeT1Wq
	9vNUL5XpLuP7x2dcwt8xsvC713lx4+wrJfpaFVDZoSKmSaV+PEvkdDb2qNf37+PCg4Iv4CfKQ4T
	dC8hZvCOge9hUXaMqM6JXTh7ZpUuR6ObY3CdbN7AvCSuRDGrPzS1zPKiX+py4ug==
X-Gm-Gg: ASbGncsPlz0PYmLkm6R+a3hO5ObEInKbysE8OkUaFvZq1/0EfU+kCTgoBusFUtt9kqx
	3i1iDaY1Z+vQqTkzhBOz905vhTqJv2/XgTlwPRrharB3k0GlQtqugjW8Thx3U9y4E4TsEYgxeLL
	C2rwgRfGsGbhF2iGjTWJp9wjPvUXDE7A71tBJj8MS9/28e2QYkm6cpiyijrCI6Aysz1iG88mH2G
	lT5NypyaKocL8OmUrYaCukhcoCiIWFsAI9ERqi7ugXmNTfuyIYKiFT4pfEwTDvy8RqBqlmgy6zw
	Ooe2NpfedMdv9b8Z32JZg/TNEsEp5845h2BKONj+U/lo+jmtcnhX4fHVeUOWMdfJoLtioXJYeUz
	NyTHwgu0DzBifVV1oE8oKHzDdpAk2VSBduDqxuhg=
X-Received: by 2002:a05:620a:6cc4:b0:810:731f:32ff with SMTP id af79cd13be357-85173701be0mr359452085a.50.1758638395856;
        Tue, 23 Sep 2025 07:39:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9XR7K20CVO+2Sa3lgEN3xj1f6+KE/9jAZOYv1Eg7JSuBt2rHxjTNSu+IgMsqfCnyBEcwOqw==
X-Received: by 2002:a05:620a:6cc4:b0:810:731f:32ff with SMTP id af79cd13be357-85173701be0mr359445285a.50.1758638395207;
        Tue, 23 Sep 2025 07:39:55 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:21 -0400
Subject: [PATCH RFC v4 02/12] clk: test: convert constants to use
 HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-2-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cfNqvBT+4t4p82Xzh3cs6GlN0grJes6Be3PtGF5MnJM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdRXn7B+t4L05d5y9vOdYadeiyq828T9W+dX28Fkk
 evNvGHyHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzEWJWRYQK76J1DzGbvDqb2
 ls2cnGOVbNyZu2Jze/oyDvEHOh2BHxgZzn1Zf3nDqW0t8s/CZmxey9F4UTdN9J/Sm2Tvno0tf2I
 CmQE=
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
2.51.0

