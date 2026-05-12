Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119A029C327
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 01:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549747; cv=none; b=JZAPrDXu+v4gkLTpcShWc5scyWjlUQmoD+cIdbSpAojLRbMD6r0VWKSMcj6AEM5kBlDGe637u8Inj7ZXzlADmbbm8/SmR20/l8rs1/fMhOXe2s7wMpsRrsgdBSWDIis+0ujQ5pPMBqeIWPBsOMoojlrk7i+Q4wr1NeQa1C20OJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549747; c=relaxed/simple;
	bh=g+j2MFkZRvRsBFDhiFAG6DyUYIOKWDt1Nt42ezFjD6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYS+58x7/ZMHXVtPUaxcnQOuWy6xbQICFp4W5Aet2peywee7+rjA6MFHbE+/niUXT6BWymNi6BuNRWcT3rusByhNwL5bG6R4EJiPj19rl071SqOyLOoJCsBX5ohm1/yqOitgZWWSUYqbUpo1QwjfthhsgU3ERbm+/CA7NoH3fS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHyBA6YG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=m/k57CBu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHyBA6YG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="m/k57CBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778549744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxuGTicMxGGHlkwI+vY7fNgMYqkX8pEUM+UIKSypDBg=;
	b=OHyBA6YGyc3/tpiTE3ZpV8ogKf8aFtU/a6u8h597amQ1BJVWuTCDJ9Guer6cVTX5mpFTiJ
	waeuRqH4rKoBfG9/OZJs2AvSrcoPk46K/r6UtdPekOiE/2lfdA8gix5Nlh2z5gw2lRQh6t
	lJq4qhIPiv9Hz0l4t1aIzNCoh4VZ8k8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-gjdbDRKPPLGiChuJPLW0BQ-1; Mon, 11 May 2026 21:35:42 -0400
X-MC-Unique: gjdbDRKPPLGiChuJPLW0BQ-1
X-Mimecast-MFC-AGG-ID: gjdbDRKPPLGiChuJPLW0BQ_1778549742
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b7e68098dcso117466086d6.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778549742; x=1779154542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxuGTicMxGGHlkwI+vY7fNgMYqkX8pEUM+UIKSypDBg=;
        b=m/k57CBuxSjiINzG1D0RhbPmuoFU91HCWPop4N8iIVZM+4u55N02hv9zxB8eJS00gp
         YEBriSZTeqSJR1Xg4eISVuQurZNm85UDypMlog17FFc5XMUsimrvK92ISV20RgFuMpoV
         I5zKg/jLKoaLJtyCuXNUa94zoomIss8N78pWuowCOoTBkpkPhd2lK44BgkfwL3bNW4XV
         gPv85evbx4aXMHTVFyoj3/N/mMLoXvloNkR6OqzMRd7g4VJyE4LP2qwHu4sb36mb390r
         VI9p3i0oSJ54Cwrw+829TUVovO4xQ/QDuKr3FJN/Cz05XN9aFnk8NTlN0sdkBAV7Ox7P
         YMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549742; x=1779154542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UxuGTicMxGGHlkwI+vY7fNgMYqkX8pEUM+UIKSypDBg=;
        b=NgaWTJO6fF3mSvr+UffUoawdgdiWFyrX9Pn8vTiZf2d3nWcPH87SAqKq1PjzyGofKj
         6b/dKv/sQ0/Jsi81aszikxMLMpcSSJ7eaXhW/AglSrNRmRBXgnoLf8AdxkL+fFTV7WPq
         6isByJgzmxJojLCT9h7lDzXNN95R0qKO8Kip+4OzSrY50bUkCQ3rx3DHU5Eskz7R/CfX
         tQBJcfmH922Xs3ymft8Zxw8okroxeBj1o01yAiCgvS5Hmu8CZMZQji8DgRHm7xoRZaEv
         btBAxZxQj6LEkWHYOp4r5KNV95I4k9DoiCXvWXyVua4t42YGGOQE0Buy6ZEPIILEbuat
         PnhA==
X-Gm-Message-State: AOJu0YxR9/UZNUP+B//N9fTOmCMvu582MER2XIXAnsVCskN1nY2iRQI6
	onRUyMALvEIaRPHggg9YpSEMkt8q+BsyE962LSaQ+K75jfQN/eF2czMtXuX0aALQ40l2VNVJyzx
	THUc65bHR+Cxse8a6g4q3g/xWFBPJ1TWQc5PDg/fXg0CDQJuNUq6sp6CsHtkoTA==
X-Gm-Gg: Acq92OGDMEO810qZqDi05601Y8LyeHr/ghDHwcC1ZpxWtGwEh8OxFkY+nkrsdzIu3B1
	k3ab+NxxruLQXuVB32g3usM8xuOAKKKhKAqRe8S+Wmk97zkrCPrHK8qkVFZhXrbxEl9tmRie4Vp
	FwFcEZo4dU88Xi0k47Gst/R/BBQFo1xyDXxcvX6+tRcMSLk9KZq09hKDZ92L3itg+d2KCCultUN
	OENXrCTHutyQ/GmvYuK1vJC/vvOnbQQe+jmfuX4O25oYeYli5bhjQtWlLiMxSprt5/Te/PQ3tni
	/1YLD5gQLigVLhfHfbplng6QJ8B+ExpiIku7f0LVahXi48ANmo09M4gG88jmDpUtHJtvW46mjdX
	kTCq0faK4zCU0D/F0Xn126BKeA49wY2KTjsGpG6DzQVTfKt1GGfTaRp3qQXKEIA==
X-Received: by 2002:a05:6214:478f:b0:8ae:6282:df2e with SMTP id 6a1803df08f44-8c1b0192344mr173898126d6.44.1778549742320;
        Mon, 11 May 2026 18:35:42 -0700 (PDT)
X-Received: by 2002:a05:6214:478f:b0:8ae:6282:df2e with SMTP id 6a1803df08f44-8c1b0192344mr173897886d6.44.1778549741856;
        Mon, 11 May 2026 18:35:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm109704006d6.34.2026.05.11.18.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:35:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 May 2026 21:35:07 -0400
Subject: [PATCH v3 4/4] clk: test: convert constants to use HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-clk-docs-v3-4-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
In-Reply-To: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=g+j2MFkZRvRsBFDhiFAG6DyUYIOKWDt1Nt42ezFjD6s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKYmp+99HIpuHBYUXEXd+pW23U7/SaFLio0uFp27k+Hv
 +k7toyvHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExkmwPDX7mJ26axOMeurTNj
 2Xz6+m77C399buwNFGKYw1a0JKZZrJeR4VnV6nMn/b3MTIL1trk+/Tz5+vrO/b15fX+2Wz2K/Py
 ZjxMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Convert the DUMMY_CLOCK_* constants over to use HZ_PER_MHZ.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b1961daac5e2..497db4e54d03 100644
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
2.54.0

