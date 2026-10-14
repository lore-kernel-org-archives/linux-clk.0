Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0B3F5BF5
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994388; cv=none; b=P7qgWYxttDFclt16z9r44nFpLWn3PDe1O+ToLDfB7Als29AMK4QE+BPqOcJ0Qp/7JRKouDCqi/mmo1V+mqY/XJVD/z7OcZAT0zc4xfMU4ButD8ERiaOGp5bIwGAqFlw3RwhdHPqxtKGlCs2Aw7XI/MgQsxVXKXwgJsytCEUgQiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994388; c=relaxed/simple;
	bh=mJCrs+s0ZUwB67FAy55nmz7UoLZvqqXCBpLBXkPUW4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DAXzzPglI9TDbJp98mviEk7xNrV/xkmEyOS9MreCbf5TLIcVWbItXGulQDJTtSdY8KJYfkwe1KRS18DfOV/FkRr4MQO6PA6xST9XJwS3UeqQGA7vUKdyaW8qDhtrj1D8a8OEfENcupO7W5pqK9bYYjtj/sIgWyBdwF1TLvhu0A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gbMKX0bN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gbMKX0bN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso31680155e9.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791994382; x=1792599182; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HDngV/MEWMOz176WZdeYlQIiI34y77WDxTDRN8eDtpg=;
        b=gbMKX0bNlUTJZ7aKCS6g24t4lZbTGdDYVYaJJlLhjIkHKj6wF6qwqCRo8DbyVngoHX
         iEgpYHpPhj/e28rPEAfgcjDzgHJwrf+3X+0Aj6PxsUdTXji3+elW4kw6ydI0cxzRtBVU
         E2yLAekHLxTaHVMYYxOvExh0KASBQ26mCfRQhYOh3Dpu4nGbSMq9/WnA8492cXAquU06
         LIY7DpoZtknUpPaI7TP/mQgM2qHJRaOqncG0g12JO6UfDBggTrgJ/xcadrwJu280UUfk
         l+6PE9JFBmJy0cko83BAGL7eVM6kAi40cl4RZA6Co5v7w5hZSgB+O6EoBVM1caHS+Tj8
         aBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994382; x=1792599182;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HDngV/MEWMOz176WZdeYlQIiI34y77WDxTDRN8eDtpg=;
        b=K5GcwyMxVzNOCsqyjdn3W0Ze7ri6KVA2k3IbExiy5xhG3IjBBHL2uPGSGjiY5mFPzu
         s+aall4lYYvjZaA+9E7o92qt2Jqpi39YboFBm/yTw3qzcnqWacD33kLhUvE/RjDgm1xd
         qr56+MO25z69mewIcySsP18Mw4ehRmIbPRxQ0JbPSTYXdKKnlCKfnm6wTfwWxI24KsHZ
         GFywW8TVRO+tb0jUaLd4uiavA1pUQjpRuH/5n4xD7w2LpP9VHprbVUMzqRYsXRGY4iEt
         +WVs7MQCamLqLhIKBpoYQ6xKppKFMhDxjPpgWz3nNHTmOiSkcnM5xKDXSb25Yhd0MbJE
         TqzA==
X-Gm-Message-State: AFq9FYJ01vYw3xRmONIINS3lcIjJuC/KT8x9/WpHLCaLNFeQy6LmvMsx
	ane7ffhRDAFunTfqD+IUT2rEB/EZL/CCvZW+0WKF50+wDfjcpG8/5YUP9Ducqgwi6PdLKGw39i8
	KhtH3Ic8=
X-Gm-Gg: AYBFou2ubgvDAnLt9XE8PH138mF7lQVrUxQY8pU2YfDHaIkl6x2ayThKfO4SFht4aAL
	ZuhTM4ZpKpNT/hTxu3jwtJ0CJEynQc/2g681rB7R9mPIMilNrMHK85HU9ksawD2m/is9uCOGTpY
	4bKlaaBIjrabaS+7dNMTfN8AkupWtpf3H7tywC29ARCIUEkFIkP9OPjr/pys8um6uf4AezOWiyn
	l7o4AhulOAfjQbYeceMXpVxjH+1rvKMmHrrAk+DNIr4s1RBPJJ5ldsTnLVdes2tSVPXBd01XQBT
	qIGcLESCvzoYbH2gZi90QSOyHGj0h9JpdkxnfelTFgNTrZtKvdZuh3n8ihhqNyiT0erWVY15LUi
	d0st3cIXgBrDU4fl47bjSbeRR4KzL3WBdZgqEswZuY7X5IzN3SxiVWLVpLZ0whZx4ROy8MQhPjR
	uFOPJoyBgrolStqQTqzKvNexrHXAGb547te5gWIWYfieyFUYkWKu3vox4FCNSXburi3JUBjC7nl
	lsXfbkxLrUznIIAlA==
X-Received: by 2002:a05:600d:4452:20b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a190d7891emr233014315e9.25.1791994382408;
        Wed, 14 Oct 2026 09:13:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6834dasm3937795e9.4.2026.10.14.09.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:13:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Oct 2026 18:11:53 +0200
Subject: [PATCH] clk: cdce925: Size the PLL child name buffer for any int
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-cdce925-truncate-child-name-v1-1-00136be00c49@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAwA0F8hPdtkG2gyf8V4GG2REpxmG4SE8
 O9OPb7L2yFLUslwbXZIsmrWV6ywpwZoDPEhqFwNzriLNbZDYhLvzljSEikUQRp1ZozhKRg69tx
 7GoxpoQ7vJINuv/12/zsv/SRUviUcxwdBEv2AfwAAAA==
X-Change-ID: 20261014-cdce925-truncate-child-name-a4d9db9cf003
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Michael Turquette <mturquette@linaro.org>, 
 Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mJCrs+s0ZUwB67FAy55nmz7UoLZvqqXCBpLBXkPUW4I=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnnV3H/zunklv3VvSry0Ju/XOqSU1pe9anE8ZrFRHaqn
 eM5+39HRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbS/YWRoVFxmVtA/beS7iSn
 jy1b4vdWzlthmujO+uiN8grh4vrXTxgZzpsq5XJaTwnkPzXLe9eD11VXtk47tU4hfkfYfN85Wjk
 mLAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The PLL child node name is built from "PLL%d" in a 6 byte stack buffer.
The PLL index is bounded by the chip's num_plls, at most 4, but GCC
cannot see that bound and, with W=1, warns that the formatted string
may not fit.

Make the buffer large enough to hold any int and use snprintf() with
sizeof() so the size stays tied to the declaration.

Fixes: 19fbbbbcd3a3 ("Add TI CDCE925 I2C controlled clock synthesizer driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-cdce925.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index 4d49cc1659c0..56b69d4fe4c2 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -625,7 +625,12 @@ static int cdce925_probe(struct i2c_client *client)
 	int i;
 	int err;
 	struct device_node *np_output;
-	char child_name[6];
+	/*
+	 * The PLL number isn't a compile time constant so GCC can't infer
+	 * the number. Make the stack buffer large enough to hold any int
+	 * so Wformat-truncation does not complain.
+	 */
+	char child_name[15];
 	struct regmap_config config = {
 		.name = "configuration0",
 		.reg_bits = 8,
@@ -697,7 +702,7 @@ static int cdce925_probe(struct i2c_client *client)
 			dev_err(&client->dev, "Failed register PLL %d\n", i);
 			goto error;
 		}
-		sprintf(child_name, "PLL%d", i+1);
+		snprintf(child_name, sizeof(child_name), "PLL%d", i + 1);
 		np_output = of_get_child_by_name(node, child_name);
 		if (!np_output)
 			continue;

---
base-commit: a5929cbf1406eb3da217d4a182ff6c5b73f3ed91
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
change-id: 20261014-cdce925-truncate-child-name-a4d9db9cf003

Best regards,
--  
Jerome

