Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC5A1531C8;
	Tue, 23 Dec 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494072; cv=none; b=KwOu2foqgr1QNQD1ZQOZpaiP4wi3+hLjvYr5fYiU7L+5hqII4EkauALAoO1PFFVAzehozZfbnoQgGdFjvfkKzlWgvMaMTHuAfmkteOOdwqDqEfPmM3eYL1jokR6aifyvnCQIVhM5Bpsn57mzoxA8pblMpmeoTFeuOABYbRMJ0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494072; c=relaxed/simple;
	bh=jGxjXld3AbH/E5UJYH7bhKAG0w3LuU6IFlo/+lXXbyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HExM/9C5oaSIPHGtwxTBQ7VoutbgR2/dMsxRYvunnMKIqZhJd4CzywxB5AxXv+6wXUk67s1Bt2JAt8u+FRyyP17COswXm4PGbKsBmaZWyEsDRiWuvB+YSskOYW7TA5R563hD471FoyMex45dKAykU3MepklTtFtSOadieAfZBIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXGBmVIJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXGBmVIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5616FC113D0;
	Tue, 23 Dec 2025 12:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494072;
	bh=jGxjXld3AbH/E5UJYH7bhKAG0w3LuU6IFlo/+lXXbyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gXGBmVIJqJRkCum5iYNnqsEG2H0Wc1XPk6ECg093ArxZO7wPZ97xbuhNMuS1/finB
	 RqaIel3Wh4AuUufa1fMGExYCHqqzuAqMjJq9eYEESh1IBMg9MQOFf08lj6BBFOHjqY
	 EUWEL97hcYYLqpK/+q6gLOhGaNJjeRrOMUYqB8Kc4C7IPHuOaXqLijRFPRZB9Mp39g
	 OeBoHAHsRMF//BwLTgi1YaqmwHdUhbZus0eV919cV/vYFuxWFmhGrpExeJu49Qoycb
	 GsDPSX6Xl+eisCuUhTQUL3HUPYfaDmIJ8POccdzV+dYZOnPEz2BNWfW5rouqJsF5fc
	 f4pNInq4ecxIg==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Randolph Sapp <rs@ti.com>
Cc: linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 2/4] clk: keystone: don't cache clock rate
Date: Tue, 23 Dec 2025 13:47:14 +0100
Message-ID: <20251223124729.2482877-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223124729.2482877-1-mwalle@kernel.org>
References: <20251223124729.2482877-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TISCI firmware will return 0 if the clock or consumer is not
enabled although there is a stored value in the firmware. IOW a call to
set rate will work but at get rate will always return 0 if the clock is
disabled.
The clk framework will try to cache the clock rate when it's requested
by a consumer. If the clock or consumer is not enabled at that point,
the cached value is 0, which is wrong. Thus, disable the cache
altogether.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Randolph Sapp <rs@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..0a1565fdbb3b 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 
 	init.ops = &sci_clk_ops;
 	init.num_parents = sci_clk->num_parents;
+
+	/*
+	 * A clock rate query to the SCI firmware will return 0 if either the
+	 * clock itself is disabled or the attached device/consumer is disabled.
+	 * This makes it inherently unsuitable for the caching of the clk
+	 * framework.
+	 */
+	init.flags = CLK_GET_RATE_NOCACHE;
 	sci_clk->hw.init = &init;
 
 	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);
-- 
2.47.3

