Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841386;
	b=EPRgVSZbk4KRFuZe9Mvt+Eg9m6elh8IaFAQtv4P57rUPKTAtU+qyyI4+zwMqHvEMuzle
	 UIm2wB4fA1Do79f9wza8Wi3UmnA5ZUF52hDV/rxt4vb7m2C1Qsvqr53XesWMy84fsmnHX
	 oDyumAu1Az7IVz+0nc7LTesMyGZ3WJC89OttJixfjio8DVYnVLVrHqs2So2NC+vRZchp3
	 GZX7j9uEeUXtFRricXzxjltin8q+SsntCZAt6A2DgLfCNUEVcrC7lIqtyLTAGpM4xBss8
	 tlY3+8+4b6dxDSfYsdQpnIWbvnWno8BVBDmxpE0v7FLc2rcPOv9DQdmANY6SLT8Qc/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
	b=rFSJFVpG9e/bdguI4Y4cYYFAqlsomUPMP1PtFFu5ija4bCJYU8y7zmE3fh93VzR4JNjC
	 3nTVUnzctx1sL4ytUfOLI/c6tTuUxm38Q6sO1fUoGRXX0mPZ5//5hqqcLSVscXf4T8xvL
	 XnmXHBRrwyqdrjQsgcev7HDujmYsKeo8j8IB5TBo07LvRtFnhzHwhdXUMdi/xZnpA2JVx
	 6MLVWz9rZYQA9LZmzx8bNjJ+jPt4NFS239/G8H2I2NQ4kOnR9HNLc/1diPOiZWldPaVY8
	 MCoNmWCOYqm1PvzeesABa0NjKP+ZQefyhGOQQG6wQ23gzpBUxgrvKqDy5BXSbzHX/EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AP/7tzAB";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE446606A889
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 15:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE446606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AP/7tzAB
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d30639709so500979866b.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841384; x=1795446184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
        b=AP/7tzABd22mCHY4s/2PcdgvIfVTgRSXHQfn/bR/H134UTLYEiJlsFj5hUlwWsjVl4
         pbJWImgPIjl7qHZ7nbb8WVG2zwkVzq7hMec29IUIZpCX7Vgg11gEaiBvwkAfUsy8bXv0
         zc6ySKUbnVIkvlR4t8xa1vx6UtpTXbaWuV2WtgAaTYHXlii3hBSDu3vZh23HYpYKgHkS
         3edceBcxs8bCjUBmMIqcWYSD3VhEc8XjyApJD3M7VcnmKkbgCaM560iUATqChth+lnu/
         tOOwB4rIIoacqxa5IfVno8RJGGE4lxG5SxAn8qdpyVv6983sAp5Q8zaCvZeoDJYRD5sz
         R9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841384; x=1795446184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
        b=wP+FRx8DRZb36DTq+y1xO9YfPd3LHdR7tXcmKKNrT7Yj4HtHoEhuiK0pqjTrCyg4/s
         lzR7CkiaOFO+Yaguy4X0Sr2hhekTSx1J8dsilmu7gh94XqhppTQXOTkLkMaWmZFlmYrT
         Xr2HG0NcpoX4j9kkYVnlqkdxSylX70PBG/xIHL1rrJh60+BX/SjqB+ecEVjnp0ZhjQBC
         c04yODYYCbeBXZVAm26qcHXk1Yspi3lou2JhwQv8c/BmYg9rRVh9XbZG8Gdk5zOIxog2
         Drq34zGvbHjlKlcjRRjsWgTU1G+KFFp1cldotIuHb/mp2GSNm61wXk5LPeMeoMpbOSAi
         JvUQ==
X-Gm-Message-State: APuU4Z9H3xrSGmRSIq7IsrEI2Thk7IyXAz7Wl0zrryTYtnmVUguzofW2
	U8iVpH7jX0wpQDpbo6mJSxcqeAL2kF7RP22ukNK96tOk0jEzGvChhH0M
X-Gm-Gg: AYBFou3m+kGiyKpDy62Xsf+3+ZrodKSKNEHkbq+1bSjqLasP9QZmWfHM3AzDAn7UHVg
	QCOu4Or/lwCMTWvUxhLhx2AD5reufEdjwV6mJQPqUCAEWG3IMW/QTupBSOl22i5eicNfh++8Vds
	PoZgrfvlkzs740gx/8bcOwOKUuFr0zYdpjxMFa3U7D93B5w95eqEarD+ODoim16U+Oo7fWPDE5H
	ynDZcEImBzhsTI7Jrk1o1ZLGtSNQTdpdc7fo7LGByrX+IJlE7zprS3ciABOohdxSaseNmw5WqF3
	66P2qxKPd8lRPYY3Im8TQEWnSk0xlvbkV0aMEUdfirk2HaN9A7R6wE8U4HTQJXFYE8gSp7FlUbA
	UJf0xtLYlCikiysaz8kgExwQ4QaFzZOlxYnioAtPLF3SJbUU0Nx1ymYHQJIN/JNSor7Qmly6Zu6
	egXZih95075SVBSt349DFsqbVZm5KtpiaMvEyO5twJ5I6lfhlcvO5nrLhg9hWDTbPaQuJBkTzYR
	Jwc0JlYfcxls3OUOC0eZExd/pKDAPYtAygWc65IQoafs91vUpQdCzDTMjPgUTdnL1fIH+FigTBI
	jNm1QJMNSPIeN6QBVXNbpl8Oq4oljcSwrFnfgvFQWOjjqv7okdQJMMkQtXRSjlPJuEON0rOPl2l
	jIu27yJwilAs=
X-Received: by 2002:a17:907:9622:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c50968394b6mr992587866b.44.1794841384189;
        Mon, 16 Nov 2026 07:03:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:39 +0200
Message-ID: <20261116150239.264139-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove CLK_SET_RATE_PARENT from CSI pad clock gates since changing the PLL
clock rate is undesirable by changing pad clocks.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 61fe527ee6c13..f427786a8ba8e 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1010,12 +1010,12 @@ static void __init tegra30_periph_clk_init(void)
 	clks[TEGRA30_CLK_DSIA] = clk;
 
 	/* csia_pad */
-	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", 0,
 				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
 	clks[TEGRA30_CLK_CSIA_PAD] = clk;
 
 	/* csib_pad */
-	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", 0,
 				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
 	clks[TEGRA30_CLK_CSIB_PAD] = clk;
 
-- 
2.53.0

