Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C2426D33
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129896; cv=none; b=Fry2nMBVg6m8ustfz3iluC/mgum96VvCMenBhcv9XqdSjmxr/ngPQUTe1LmhVWyhlxHdKiNw9PHh13UU02CT9g3jaOF7Rlp61gTuTLxv8IKQfPY8N8L7OQ6ZxJkA7jjxLFBf0fzWzROU51tA1YDI11JNvv3djZuKomLb4alXLv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129896; c=relaxed/simple;
	bh=LeP9MKAYt4Opy9Gj6GBYew3XXdqskUEBwsEyBG60wWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3d1213KZiiahjQd97FaQSbJugQ41yHI4dNxXoolK+RULCooAma0saIE4hu2GapnhtwXag5h8SEu3Cb96cv5jGnshUDfaVj3Y3If9vAKoIDmmBJr22blT0n4/3ZeQR+c7CH3yy4fdbuY9CkyFqkUPJ4wN9txgaw16nHXF2a01z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTZcZxIe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aOmQ8MHp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTZcZxIe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aOmQ8MHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJvyWcD2R1vJcwrKcZq7vL0j7lhQs29dL+CSSd6zzxc=;
	b=ZTZcZxIeI9lWNhlzjKaZ7NTE/VzqC/lN1yQV+EL582GxEjhLNwYoAJ3Fc/Tt0PgoaFMVXa
	BoKK/pPNYkbsra0hvyy6NitebX9aaHxaNu7yHEJzbiwJIWkgEv643CDX3W4HEuMnBW0/iX
	BqppfkMLC8GjmvsHSO2kr0GUUFi4Guk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-nmKnmapPMb6dU2nHqDGsTA-1; Thu, 26 Feb 2026 13:18:10 -0500
X-MC-Unique: nmKnmapPMb6dU2nHqDGsTA-1
X-Mimecast-MFC-AGG-ID: nmKnmapPMb6dU2nHqDGsTA_1772129890
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb5359e9d3so981210185a.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129890; x=1772734690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJvyWcD2R1vJcwrKcZq7vL0j7lhQs29dL+CSSd6zzxc=;
        b=aOmQ8MHpH9wJ9lEPssUx8DqaeT7rtydfWzwpkRI2PcE5vXXT/kJG2VEfrfwUT2qF70
         vvTYQTz3Cn2Bnw9b5lHpZTP1PiSGYqjNLxKhyhB1gBpa3ZlBelGM1DJ/WFl5BtZ1jqEP
         hNcJZM7rY3B6S8NglB3f8Hu+D64OirRjIQVjirVhb6hMJ2GIhJyuZOjiWhxckiYNdEa5
         KAzifiOu9SqKWP3eRdrvNriKsJrs3072e2GQcSD92fv3IEMX2AbGxHKoBctsPGlawTmz
         kGwM95+GUBb5rXJ/kcwZ/SJmdDAHVwEvrxAqpPmK7yE7bOcE1of1gjL6ZkmACe51PF+4
         qCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129890; x=1772734690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fJvyWcD2R1vJcwrKcZq7vL0j7lhQs29dL+CSSd6zzxc=;
        b=MaAmnLLvPReS3qaN+U85D4zMB2kJtSxlHZ7chzb1g8k6rCj/1/C6ywx4LEoF1GkeEd
         Wfsu5xCB8QIqKvkxnMKanwOV670N8bJ1m6GB8/n9BZPjxltGVHXNvUih5NT9tBO0sLTM
         WxnPommJENELPp+Pm8tGA/hxKOXF6eLexXCPwECvWDCXFlgs//YBK6pBL7KES2XDFxrf
         Y+RwukAZDS6xtfIsyxmq+l6jdKB79NCgItd5WqWzoTNfwBJDLxm38iIqlb1gS+T8VBfS
         3qcumdbFw18Mn+QRwYg5R/9nkLLLsyGnpajOYdEluTFiaHO8t9j/dvFdjUh+0+cTsjFH
         2prw==
X-Gm-Message-State: AOJu0YyzVx5JCK3F1K1vLsXmgn6iRDbGKejBrflm7pPgP39zIKH5Ij/r
	iZiLQi7O4ymdpPycAgPAPgja7fAeq1HXQ+tqCLQGkDYsQmVWLCTx0qvmrjG6H9WQ52GzgpFmSV+
	RrBx7Zi2bCK0PDNVmYVjieaZdYu5MXyOtossQrOKe3RCQZ1UvGgqNLJb4b4TsVA==
X-Gm-Gg: ATEYQzx7hBgnuFUUsyrbVPGow5XgMMaQFoZ0d2wdXRVQ+SClLLb9kqR2iOLxohrlho1
	WoSln85EbjE+O9UtxrFTsspmKIGeXovYjFgSMbShIRwH3TWmmITA7fbp/uxr/RYezxB/1rNdxnq
	FB646kTEp/WCsqdidCDLh39N4whG6z4Tu6hBHXyT3Zf9SmytWm6l/scbw08AvdVnF1byK5ObH+z
	qWFe2tEW8lKLAPAfqbAab1DC+CpzEFPs8PPpzrLLBf4mUMKufHaneAaLj+2OvN+xchyXrJmalZU
	QBPvnZipqvWtcq92Wwi4Rw0T77Iz09i28WXp+82ciMQBH0gZU6NBRIjGdE0TlRfZnWAbnyr7iD1
	4cmKmEzmHj/KCJJApKZUEv1qOCaoWlWglvlXXoYM1SDihq11jWklDVNFXsbAk
X-Received: by 2002:a05:620a:7118:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8cbc11dd350mr379622785a.74.1772129890361;
        Thu, 26 Feb 2026 10:18:10 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8cbc11dd350mr379619185a.74.1772129889929;
        Thu, 26 Feb 2026 10:18:09 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:18:08 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:57 -0500
Subject: [PATCH 13/13] clk: sprd: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-13-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=LeP9MKAYt4Opy9Gj6GBYew3XXdqskUEBwsEyBG60wWg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9JlqbRGfLnCbcW+V3PKDM9w3aKU5V7wzKDizqni79
 KHGombPjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaivYzhn92p69IzA5/oHG3j
 zvo1oWvN6v2Jgp7d77X4PvHn+zQvuc3wT8vLauKTc+JpC6YFdLXuWr00p/jLNNs/DGmH9t894l9
 /kg0A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Orson Zhai <orsonzhai@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/sprd/pll.c | 7 -------
 drivers/clk/sprd/pll.h | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/sprd/pll.c b/drivers/clk/sprd/pll.c
index bc2db19aec0e9d64bac039260b2fbeacaa61d660..31f016030da371c9fe842eab01f6a1b7043b82f1 100644
--- a/drivers/clk/sprd/pll.c
+++ b/drivers/clk/sprd/pll.c
@@ -254,16 +254,9 @@ static int sprd_pll_clk_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static int sprd_pll_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 const struct clk_ops sprd_pll_ops = {
 	.prepare = sprd_pll_clk_prepare,
 	.recalc_rate = sprd_pll_recalc_rate,
-	.determine_rate = sprd_pll_determine_rate,
 	.set_rate = sprd_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(sprd_pll_ops);
diff --git a/drivers/clk/sprd/pll.h b/drivers/clk/sprd/pll.h
index 6558f50d0296bc2acd43b031e3927c288434fc08..b35f3e13799e93cff9cb184f5a54f862a6756f0f 100644
--- a/drivers/clk/sprd/pll.h
+++ b/drivers/clk/sprd/pll.h
@@ -78,7 +78,7 @@ struct sprd_pll {
 			.regmap		= NULL,			\
 			.reg		= _reg,			\
 			.hw.init	= _fn(_name, _parent,	\
-					      &sprd_pll_ops, 0),\
+					      &sprd_pll_ops, CLK_ROUNDING_FW_MANAGED), \
 		},						\
 	}
 

-- 
2.53.0

