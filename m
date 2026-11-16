Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841384;
	b=DitPr91DCwoIq48o72vgPN8K36NwYhgXvH9ndVAB+P2tDP3aQ2iPSrmCA53TtuhWKSuJ
	 BycrxD49TQ4Dt3BMR6WKjsQ1LUZd1XbJU91vX04T1q1PGLFNTOdQDtTUC/OApM35KOG+x
	 tgKoHF2aVJ8RnAlB9NQHQiKh9/0r7GnarkVh7Q+q4OgkKlZ5FUCh3VhUR6a7idPMZijPe
	 7GO2eca69N8jO69j08FOhvOnZKR+6QwgouXY6Fl6F2h2miahcfSyOzD5ClilDmV1wloSe
	 WbwsVq6Fuc4rFX3G6TbLAZZHdeU0aq0U5uEKC3axDgBdcmvvM21A4qxYKYhqiCcj51w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
	b=pHcwPaIq+G2lM9HBbVu8kqTj0hAfZGBoaJojDiymLpACwxyUCzOuUPV917czcWpxwpIi
	 1jgvx3DHcrcd/RlkUxzk5j1TnI3mk3W854HnfEQvPRL6pd4/trbA0HcSZsaVZlJiTmGDI
	 gQsFIfDADSzHiIo0zNw4bDFoOF9kMrJP3N9m6x2lQs9HhVlrKWyJhPsVqcaf3xmhizo/J
	 WgThZs9jhHgcCg39iJovcHQkL92j8orKQnGpN7+c15OR/RxoP+IS0aB6H9URNR7e23hA5
	 XUUq6mXGdLe4bdfbzM7YA1w2/nwKkIV49IkHWFn7h2Z2EAw05NxIegDtWM2dEqWcF8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEj0XDIx;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D02606A896
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 15:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D02606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEj0XDIx
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso642490266b.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841383; x=1795446183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
        b=YEj0XDIxnVpNPh1DI2ma2SbX2pA5ZgtjEweikP1Agh+FH9GBYjgKpmyp+ruqzqi5Te
         mEW+DXBtzmB6vAV+BVH1GD+eQAe+yNKdaNHAph/os0MGvxmO/T3cdsH3At+3krs8SAEM
         Aht2+glUmrVQCK1y5xumU0DFyXOYOm1lnAZngFvntBfbT3c31FhLv+pOytir08+XLow3
         CePrFiu12Pf6mqYIzOGPhrq8xJkwceSvVsC1o8ARLU/w1EsHBsOthRsULTp8d2287XO3
         yLVX6XYXNQ/QvPKZnvCsuXN0Z9mWqyNvtDmv8QUTeo/P/1mMKe/uEczz7wOUlykcc/K8
         id6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841383; x=1795446183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
        b=m/wak2wZM1c12HkFsuzkIzyZR9/HUYCDaGZg/YxnJ4CoFTVeADWJ0ot/uJ2oPn5zJx
         xiDpmN4ezedalIVBuwFMLSQE16PhaUeghtOiluktTzuPVkhIF8tCEfcoqhgD4FceAOHV
         jn6uoDLnCUEVa3fjpM3yXVj++WEwoCFD5oU8IHSV4T58nOF43mU2cR950w41H/rwUIgX
         4okNYds/kfFzvS5WTpT7jMypLJ4xc3+IvprcZPEJ5wwtbtTzKH0GQFHji+nEwFMJIkaM
         yAdmNy6JwPRVegTU36z6DMvo5FEvXmJl9d3hX9Z8BgdRAwa3tT9xOWxKz7v/2gwoJ82X
         mJXg==
X-Gm-Message-State: APuU4Z9fn4YAwwO09NQq6V0jTZWFO3pioccj1oHjyKrJYvld9wBgF+P8
	p/w0hLvc0AKngdKKEhR7PQ0ntazvIRxyFx2zWU/47iAt00TyddRSlulj
X-Gm-Gg: AYBFou0ldSsaTXLqG4Lg5AwMM1KMCfUFDSCBm2oXb2dRLs0nWvtO8P+U2XLQI0Zi04v
	Xf52GCsXo1eEv/cjLNW3iaqnFWfKzGZsyg4LdEtp5c2TjWrkZSDZ23LsJEM4f7F3NhCsBM4J/3f
	My27lv8J+ZwzUlA/ODVuvzgEcPqiZW9KY6DhdKBJmyp+OvOiX0loMSud89ysUjfiXqfpY26zlFl
	2dLjBHizm4RxKowxPNjhpWzkpBPPvhXhFAeBkxxhz70l/76QcvWxQdH0Q1/tNrlQFLjorEkkg5F
	ZI1n/UG8eXeaT0nrO2EFwu3+GrWc4/5RplXVz7/vdXHz3Mowl0a1tyfCXx5JwjhOCkHse6Daz4e
	055JIyaD99rHheY7EsNBqF6JlsVSCFZpY2F33JhBGgYDH5Be6Pva0Q9U4hAte2N/q6m0h+aptNT
	E1SpmUCntWNrsrqEs/hI0YMZ9g8yZRzkoVcNN8IC+LdQcA/HfpnOdpVzA6LPqKC40Y0Wdv4Z0g8
	D+5Qf7cDJ3BzNqqR0biWqTU5GW8gefXfzFUCtuTAbsRs8+NGF9TJK+Q2lr4rxR2BzP12wQm6a2C
	cjjT1unaMIW3wFojY1QHMLymzF/1MW7z+aX6Sk34rntSgKE3o5ayzHoHgowdmSN9bMtBY2FUaiF
	ILcVRcDt7POtEkkNkKClZyI/1VWJwvI4=
X-Received: by 2002:a17:907:a785:b0:c46:a607:6922 with SMTP id a640c23a62f3a-c50963d90b8mr891096666b.25.1794841382509;
        Mon, 16 Nov 2026 07:03:02 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:01 -0800 (PST)
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
Subject: [PATCH v2 2/3] clk: tegra114: Add CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:38 +0200
Message-ID: <20261116150239.264139-3-clamor95@gmail.com>
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 80b7f64125d92..53899f2b1772c 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", 0,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA114_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", 0,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA114_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA114_CLK_CSUS,
-- 
2.53.0

