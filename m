Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31226158B
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 05:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770702053; cv=none; b=S7/jzqMua6t5RfMHIy51YatQ/kTx4GFoKmilQVt0yO+ukv2Pff74DFp6jD8fc4Rvuid/xdGfc+BH/zp36IM4JRFWJYj/lYJGFdyT2ASxZX7edfo5el/hvBS1fxOujqMnq4w+6IGd0Ah/YLJBcQnF7aEvMxmSbsm2eO3pg9XX0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770702053; c=relaxed/simple;
	bh=p2dA9KDQRjS45qNOOtBa8QMra+nlcWCB9wGJ5zfkaYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ha57kgFUjleVpuUxGNp3zgxbYOGJL2rUX1z++OgOeOGOtUA+7rhlpmq9/TldiAq0RcAmUOnZ5rxf7g3Js4XUC8pXPa69eD3egOTt19ietZEcfUKilPHRaeXvPhd1Y5+OghfECuVtNpkingK1QWAw4WUOVEGP30eBlkzxmxzmfaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fN1XGimb; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fN1XGimb"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c70ab3b5fcso515631085a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 21:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702052; x=1771306852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onU77N0wQuj5Lnll1/fvZOs/qEnLfPl+2FK8REXemOY=;
        b=fN1XGimbTOWN/1fxT4d/KvhSDiTt0a5Nq1JtdH/FgZjIH5FEDHiA/1cmXs2ZFejXwU
         jhb1qFDF5q3LKZfMbAdtaKxK1rotudiDt1opi41zlq9DVfqvbR/F2qYWHN0fRbe1jO3E
         yeSg5WwFR5P3uxVejBq9DYbu+5ug/iWt2D4sSgMJiiUB/mS1GQOZ+ndnykGZW6vnB5mL
         loJ5uEDoMutT0ehOpFD/0TdlODYzGTRIsFA17NhHX+Ib/q5U03RLyZRbEOXMbUPTzxV5
         yiXEYhybJQzBJ+G2piL/Eq+10RS6Iw7mxCHBugaf2/Sz2ZydMVF6qwm4aNpWDPcL/fuH
         pXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702052; x=1771306852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onU77N0wQuj5Lnll1/fvZOs/qEnLfPl+2FK8REXemOY=;
        b=GVVmer2OPD53OYutkVV2NxkkZPc2+ySeBzoRQ3H7HpE15hWwJjPUUfEbYvTakEHiCg
         lsGwWSZRkJ77/uxKOsfT8Gz3Ze/xDgMb0sZqTeMBwRHlcbkFzWLY4pTkyptdVUgjrAt1
         DIPKOHbI+gPiz16KPOknJ0E3IYRT+Jls5np9nnUMqkDgNaglakyMAJjXQM3E+Smz/dmk
         VseA1L40HkBN/BT2iA5sY1zeQyWqZSAUfLh0sTJTouPJ6ndWEWPjv/c7MLsDvIcaE825
         ZMJ8VO3ia21JsoGgQyKup9/v9/KwlJ8030rky7Xv8K5CojcuOfmWZzntjlFkMKQ4X0yy
         lKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Zx4EK1Oj8bU0xm3xeb0Rclsn1xiXLtfaBRToHNRIYOrGeB1yMmZOrqosCzNP8WDfxjS0VD+6SIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YziKYNaHvS2xFsiRJ0UdMH+5pQNEVaph64om6YIYoofHw/34fqq
	MwRpnEZTtV20GexEfg4mUzBljTEfWsvTirUfUBPODaX6j/3AGoOH7gAX
X-Gm-Gg: AZuq6aLXD4slZJnwJIYnJx1CySb0pS8EoXycBPHNaZAB/q/3E6AL8qIZMpjBPGrecXL
	7N38FaXO9PrqD5mccnxMz3OjCa7KstzNRfEah222gRW1HUtevgP8j6z9a3zPWkVAq4UFRszKayT
	ET9ymcNEbb4roFQ/lO5CksGqYXLVEAerrsVkDu7jcQ26UGUjCCbpIsT3Z/1xUzVTf3UPLt6Dwgs
	QwaF8TQxNeItBP5o1dN70IYYb2KKoiWuZkFkM0Leqr4wUjn2brHbZ5Gd3CqN+9GdsR6h+VQE9yO
	YUkI3gcEF/exFByhKwNBu5nsGpgwGlkAZ2rFpHS++kmduBMwAo/im7OfLV83dpUqUdscwte3FP9
	EH7/eXRAVjscBQhpSV4WCKopV6suxbjN5T0AGhzarA2nGFDrsfIWl18emAXg07d9k7iAgwOawR4
	bz1jNCyQgdI4rNdf5WFZFg2286I8VDOlb2Exv4gxNywCA4HGQhf6ZeQKqpK/0HR2sHC8CgppZJW
	Q==
X-Received: by 2002:a05:620a:1982:b0:8c7:16fb:ed45 with SMTP id af79cd13be357-8caef7e16e5mr1861918185a.27.1770702051590;
        Mon, 09 Feb 2026 21:40:51 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:50 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
Date: Mon,  9 Feb 2026 23:37:01 -0600
Message-ID: <20260210053708.17239-1-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wrong value of the number of domains is wrong which leads to
failures when trying to enumerate nested power domains.

 PM: genpd_xlate_onecell: invalid domain index 0
 PM: genpd_xlate_onecell: invalid domain index 1
 PM: genpd_xlate_onecell: invalid domain index 3
 PM: genpd_xlate_onecell: invalid domain index 4
 PM: genpd_xlate_onecell: invalid domain index 5
 PM: genpd_xlate_onecell: invalid domain index 13
 PM: genpd_xlate_onecell: invalid domain index 14

Attempts to use these power domains fail, so fix this by
using the correct value of calculated power domains.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 58648f4f689b..d2b8d0332951 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	scpsys->soc_data = soc;
 
 	scpsys->pd_data.domains = scpsys->domains;
-	scpsys->pd_data.num_domains = soc->num_domains;
+	scpsys->pd_data.num_domains = num_domains;
 
 	parent = dev->parent;
 	if (!parent) {
-- 
2.51.0

