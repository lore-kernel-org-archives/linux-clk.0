Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0942D6630
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754864678; cv=none; b=l732CErpEsT1yv20i0Xnr7jD5Q/8Sy8tPmvcibg8CXi0+snv06VwmoHP3BA0YPp1nJRYpRLgwWf5qA4IZipMriNDI7QjOkXbY3QwEQPgRe0+cH5dgWbzcqqF8hNGG6gzdVxEAktRzNCX8psDrCtJdV+9nW38EdebST55twq25ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754864678; c=relaxed/simple;
	bh=SGSec+EQWjKUsfxRcIYsyrxplqR++XYwLaxooXSSvvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f/NbUmcT4rbGENT8NcQ1Rktfb6KhsenU+jFAI2x/CmOpagF1se3aVre4kNpv8xtSkJ2iFoZ62NQAHV+k7naEbmlAB6qWBRMf2TCQ8BSPPhM876uA20SMedxgDTM2BA5Rr47bzRWyZTtVXTpkBzV0O8AZz8lFDo5zIxoWpu/187A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hLYD4EAH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hLYD4EAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754864673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DsLJnbX2CWZtNzZ1OcDHZ6+zw0frPO9S9vsrOrlu7po=;
	b=hLYD4EAHE4vaRhRFZVQA1BILl3Ykdi5jVuusAphzCNuLjKkYGdFaLbsiOssTuk/vXvqOcW
	o7CrEwyb8S/jBpDGkAAmGYPxiX9Q1k1Ri4aCysjicMxcy0wQTOHNlNIbxb2Uja7AHnjAoy
	KeW/doIMgeZ+ahTnZc4nqFsOw1F0I9Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-dPzOTSebPWibS43G6JFoIA-1; Sun, 10 Aug 2025 18:24:31 -0400
X-MC-Unique: dPzOTSebPWibS43G6JFoIA-1
X-Mimecast-MFC-AGG-ID: dPzOTSebPWibS43G6JFoIA_1754864670
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e69e201c51so908070385a.1
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754864670; x=1755469470;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsLJnbX2CWZtNzZ1OcDHZ6+zw0frPO9S9vsrOrlu7po=;
        b=iqP0V09QKfnlhaYySLIAZUXYN6Iw7C/wstNoy88rOBmzmr9hSEiwVTXVi4E8T3fvi9
         tiReHYB6hhI/wXavktc4NhqAgXddMMBCLSX5qSTQBwcXkLuYuZilsvt6m4uMsB4sPoUE
         EtQgBap/2J//T5LGrYa59Bhxggi45fdZYGbPnpVpLqJb2aYIZNCuToj+tsLGLWY+ecr8
         JUAqa/A/Re4OEJ428CeVAxKwWXuX0VDkIEIZu9pEDekWdQLd/fuGBb8DEBQ8yp1IfDVK
         Dmx/FNqd8r36GUiOaK/498t19X2illq7ZLd+uT1cSRtap1SS5/38mCMKF0puNxh5q8Bw
         sxWw==
X-Gm-Message-State: AOJu0YwtU7GGYYC2NVzev0VCdk6BZfe2HcXoa3/SXOq32OsVm3zuGZP3
	AviY9eTc4XBvWdo9IgTLp1W+WCOo2Pn53Rad90aPaiIQ/WK/M2tsm6PWXSB+s3suKnoQhSZ5ayR
	meptQNkn+dVkC/NGoUQaBPDDOx2Vq+xfguzX0hKdnE9OLJ8pm6EaR2fa/qARD6A==
X-Gm-Gg: ASbGncsbBDnpYL2h9M0Lm2mwV6fU6GQWxreeSVqc3KY9MDGRurwJ0nx+2zCfhtk8VZ3
	BkSULIq+k4nEDmX03+EXU9Qyxk+5+TJs+FPx3Z8oU1Nla2iJmovnRApFjTaHi1rGtXfW5rDTa0a
	qU77CcvPX5YxPNOYSl0OGm7KEhz8rljivXX16J1EgbfW/clvydZ4mP951IjrgBaGxZDM7fqQXGq
	OSvHbmU8KIxNmFyVOAHZFg8d7xZgHtrqRy14pGR+yC/2i21eVN6NXLNIMhUcmYsyLL3Vavw/P6A
	UguzcnfImWXuuKly5h0fWZc/YJ8hhdj2W6tquKxMfkjsmhtJ5vd72zQoTaHn6tvk9BGXAowB01j
	E/9tO/w==
X-Received: by 2002:a05:620a:7202:b0:7e8:2998:51e9 with SMTP id af79cd13be357-7e82c75fcbcmr921980385a.32.1754864670042;
        Sun, 10 Aug 2025 15:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfZ1YzRY3j+zDzQiBRzGaCbAkWEl6UfwFm1tYgoAJVmJujnBFCV7yyaVBd09br3SkByw4KDA==
X-Received: by 2002:a05:620a:7202:b0:7e8:2998:51e9 with SMTP id af79cd13be357-7e82c75fcbcmr921977585a.32.1754864669639;
        Sun, 10 Aug 2025 15:24:29 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0867b7b70sm74050441cf.9.2025.08.10.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:24:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:24:14 -0400
Subject: [PATCH] net: cadence: macb: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-net-round-rate-v1-1-dbb237c9fe5c@redhat.com>
X-B4-Tracking: v=1; b=H4sIAA0cmWgC/x3MMQqAMAxA0auUzAbaooheRRyCTTVLlbSKIN7d4
 viG/x/IrMIZRvOA8iVZ9lThGgPLRmlllFAN3vrO9n7AxAV1P1NApcJonWv7yIEGilCjQznK/Q+
 n+X0/6Gb5/WAAAAA=
X-Change-ID: 20250729-net-round-rate-01147feda9af
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754864666; l=3055;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=SGSec+EQWjKUsfxRcIYsyrxplqR++XYwLaxooXSSvvw=;
 b=VlXqvJ2j2K8T7qZ6gDnZKdk0xvGKLfpw0ErL2SsM89sdyKwSzDeTzqTfmr4nlHao+o7kILkOl
 2kuTkv2p1lLBQHzyzOLh+NSk3F84nKm10XJn38FozI5LJMvotkmqP07
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 61 ++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index ce95fad8cedd7331d4818ba9f73fb6970249e85c..ce55a1f59b50dd85fa92bf139d06e6120d109e89 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4822,36 +4822,45 @@ static unsigned long fu540_macb_tx_recalc_rate(struct clk_hw *hw,
 	return mgmt->rate;
 }
 
-static long fu540_macb_tx_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
-{
-	if (WARN_ON(rate < 2500000))
-		return 2500000;
-	else if (rate == 2500000)
-		return 2500000;
-	else if (WARN_ON(rate < 13750000))
-		return 2500000;
-	else if (WARN_ON(rate < 25000000))
-		return 25000000;
-	else if (rate == 25000000)
-		return 25000000;
-	else if (WARN_ON(rate < 75000000))
-		return 25000000;
-	else if (WARN_ON(rate < 125000000))
-		return 125000000;
-	else if (rate == 125000000)
-		return 125000000;
-
-	WARN_ON(rate > 125000000);
-
-	return 125000000;
+static int fu540_macb_tx_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	if (WARN_ON(req->rate < 2500000))
+		req->rate = 2500000;
+	else if (req->rate == 2500000)
+		req->rate = 2500000;
+	else if (WARN_ON(req->rate < 13750000))
+		req->rate = 2500000;
+	else if (WARN_ON(req->rate < 25000000))
+		req->rate = 25000000;
+	else if (req->rate == 25000000)
+		req->rate = 25000000;
+	else if (WARN_ON(req->rate < 75000000))
+		req->rate = 25000000;
+	else if (WARN_ON(req->rate < 125000000))
+		req->rate = 125000000;
+	else if (req->rate == 125000000)
+		req->rate = 125000000;
+	else if (WARN_ON(req->rate > 125000000))
+		req->rate = 125000000;
+	else
+		req->rate = 125000000;
+
+	return 0;
 }
 
 static int fu540_macb_tx_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long parent_rate)
 {
-	rate = fu540_macb_tx_round_rate(hw, rate, &parent_rate);
-	if (rate != 125000000)
+	struct clk_rate_request req;
+	int ret;
+
+	clk_hw_init_rate_request(hw, &req, rate);
+	ret = fu540_macb_tx_determine_rate(hw, &req);
+	if (ret != 0)
+		return ret;
+
+	if (req.rate != 125000000)
 		iowrite32(1, mgmt->reg);
 	else
 		iowrite32(0, mgmt->reg);
@@ -4862,7 +4871,7 @@ static int fu540_macb_tx_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops fu540_c000_ops = {
 	.recalc_rate = fu540_macb_tx_recalc_rate,
-	.round_rate = fu540_macb_tx_round_rate,
+	.determine_rate = fu540_macb_tx_determine_rate,
 	.set_rate = fu540_macb_tx_set_rate,
 };
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-net-round-rate-01147feda9af

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

