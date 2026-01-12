Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAB2C0263
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 22:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258141; cv=none; b=Yd/1NIj8lJ6hdxvd5G5GVGJFkhQx3jG7DaPPSUiwTSVnZ7qhWBJgfhQMpb+pIiPk4Kum7rqvyXrPxE4Dr/u2SYwM8DObBZT8fIl3Jhtd+PCiMkX6fezpojGcW4zc44lSkTzs5bdJRVomRsdPQ1SbPbjBfTQodVRW0608CjkjmGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258141; c=relaxed/simple;
	bh=A4IyjiuETdtKqekO7CrVMzxJYv+C5eM8OE3bwQ5VTqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBNHR0+K0Ht9BpznXH8S/KcGLd/jYFAcUs+EFkr/iECj0mnPxpdXscq3jcwW4L3me0qF4AJ1Q7oH6zR24cnF49+5UaTiCW3/17l0gmrqtZVrsgfWqw8O8an1MbMvGuEEasOc57Gg/AXCiI8KSPFbADtlMrCQ/rLdjVAoEoU6W3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T+Ma2Kac; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jP9LKWti; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T+Ma2Kac";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jP9LKWti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
	b=T+Ma2KacjnLPZ3mg8QaFkGtwuvSXkuFeApstgMLKEmr6Dn+ZayIGlJOq1JBKWPBj3+RmKV
	5UnTAITnv7jH+E45mxXQS7EBDMKBd4rECMbTcP0SGxV55kRGtZyA2KpNMmzI0e/4uk8K2m
	hVtpHIFMtAUCUtcNZgmh65zzQd97YnY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-xxE4oL7aODS_h6bEnaxobQ-1; Mon, 12 Jan 2026 17:48:57 -0500
X-MC-Unique: xxE4oL7aODS_h6bEnaxobQ-1
X-Mimecast-MFC-AGG-ID: xxE4oL7aODS_h6bEnaxobQ_1768258137
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9ff555d2dso1953120885a.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 14:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258137; x=1768862937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
        b=jP9LKWtiBUvK3EaV3hArcFTZIEXVmkbw+cAjfTVY0H3sCYqkdBKDV90iwtbtvr8sa2
         1Tz5HQsHhmOJRNIACzeizm37r2eN3zECBluuUJI+BZdeDHEurnEXBUbGK8Y5dNXvT30g
         sHX/hDqsFihDb10VlorataCLoMFpjzwJ8hyW4+7veTbNIpWUResNIb3NTpd4QME4wTmV
         7FBiRFxxdAWMFyOeEIdJ3RYH4IWspAzuSGwL2LU1uOYEHazLnvrz4wkSGfB0fP0BiP43
         r9jTOgM4czCzzedIiKgnF6jlaKv+zQ0nd7ftk4AUQUYmlYyNyeoQeQW0jICBtXddvl6q
         dnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258137; x=1768862937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
        b=KWncYZKT157kFs81eMlcQp4v9mN8mTeXuwtgXdQlurCVmHxTzYZ3VoO+uhpnN2FxAY
         7vSmo0+hpxJUwGMCxe4cMYOLJg22rzcNQKjr9WJIcrCgM0dG2QRQQuzl7bbEDeM8kChV
         Tq/jDwVecER4vWCelrcsp89Rm/WmDaMaNGVe+8MiSNJXwBoSBuqJ9Y3+nhr5fKQHObyF
         66ymKDIPK/4+DVaK4j/0Gjv/FJcd99LEIrPkP9nnNFgKrSDYyv3ZPbWoc/LbDamc2NN6
         ZvnyH1rLJ7JMJ13IJFJFDAgHKluiOrJRbIpFpjjwNfYpbD9yIKEg0vhpezud89K1GjRc
         rrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNCk7mgrmU4GMXYinEJVA7cMaAsKvdxKwIFjrj/jN/fd2tyGP5EX3R+fJPx8q9PP78gv40aDvobMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBkuncTA5qGMChKA32tUEHSvBDU7+cyTvmg3ZSDuPxwhSDhQ+
	Ia0z8qPtXrvizTz4/1OoSHyJG5yjSbBplsr5gDcPTXHYKZ7xTzbGXTtCjsMOsTKH+ny8mYazUd7
	mLv2E854ZoLu6VrbEw0FS7c+P2MFmU74NaIGsMCD39qJ+F+5L9OfD2nb3QsknZQ==
X-Gm-Gg: AY/fxX73KOJiJg+4VHATIG/1mNjjysFM/4SmSTjgLOXY0+WqDTl5KOhB8mNcuOADaEA
	SBK1Ms5mJI77j4xusHIPgCiYgWe2bx+h+fdPp781gc26iDKPY6rcj/gTqI/IkiYVKSWBxKEKj4p
	VXgcw5n3O69Cbu67T4pOlewrVe8exB2KbNQPEObvdz6/wWyZZahjyrVQLQTxK6J868lS432Yitq
	wNld7QX6jDB0u4w87jcbgAiokmcWSGAUO9GJvKxX6UzTHhv1oQTB/CSRoU2ReRup8tGXNsDgdgl
	DCTOLYsUphLu6DndRaOY+j3Jmo32Mb1ywwNxxhopYFF2Gn53XLQlalUU2sO/0LyQrKuzQUah59w
	+Xysp23xSCCaPXGSk4MHbua4z/uuYjc/JvOjCvnk1miTBbt1DZg==
X-Received: by 2002:a05:620a:450d:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c3893dc9f3mr2464851285a.45.1768258136647;
        Mon, 12 Jan 2026 14:48:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0wQgWJRwo4rzB06Ir+fzlFg0TJaA4jFMPlwq5Ti1+HjjBZ9IGkEaAmczGXthgM7DGDfRSZA==
X-Received: by 2002:a05:620a:450d:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c3893dc9f3mr2464849385a.45.1768258136261;
        Mon, 12 Jan 2026 14:48:56 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:01 -0500
Subject: [PATCH v2 07/16] clk: microchip: core: update include to use
 pic32.h from platform_data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-7-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=A4IyjiuETdtKqekO7CrVMzxJYv+C5eM8OE3bwQ5VTqU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7yvFD+XZz74dHZSu+vUN/v+t4QdZ3/2WPal7r+F4
 VFJpvoGHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykYRbDP61tiz4GGv5yEahd
 EVXxgD9owjR/vvfsKTbCPuvc3zFwz2ZkmP6uSzco1SzLtcJ3X0bix7dad/ccurdgGuPUixeW1b5
 X4wQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/clk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index b34348d491f3e1b576b2b9a8a66bfddd8c2296ea..891bec5fe1bedea826ff9c3bd4099c90e2528ff9 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -9,7 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 #include <asm/traps.h>
 
 #include "clk-core.h"

-- 
2.52.0

