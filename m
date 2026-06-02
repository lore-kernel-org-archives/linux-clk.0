Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D32D3E8C6F;
	Tue,  2 Jun 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409383; cv=none; b=LwNTDAnjQZqWRC5F0HmaPU/wQ/lqYLxXbc225/3ptcC6zHNuf/tKZ1K+0JUFx+c/acPA+RbA1hE9E/slGApgCaQoXETp8IWqYDyvwCiOdQ7ooJaY6FhNd58XIcYyb1WxmqaXYccnQIRe4Qw+q9/alQXpJ5r5L1HX2SvaRqrff5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409383; c=relaxed/simple;
	bh=jEYAFMVR4q9BFgvwfZI1gidudx/a0P4jlxW3mjA6/74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEXNg+jW8CLhxOPqp+RAW8yzZXzg9DMKceUCP+xh18w8njZK5AcrunD7EUuVM5i2KQLhu2JUZKKfOqq3/MtpjsUfJSU+GHW2kDrgdtBryLXUWNYoEQuVUPK2ETgVDsw5ymO4VaNVmuSQS7Lnik8YEn3zzhib3dK09S9JAiVi7GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=af23kXT6; arc=none smtp.client-ip=149.210.149.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="af23kXT6"
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4gVCPr5f4lzYdX5;
	Tue,  2 Jun 2026 16:09:36 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gVCPr1SXczJjhXt;
	Tue,  2 Jun 2026 16:09:36 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 2/3] clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
Date: Tue,  2 Jun 2026 16:09:33 +0200
Message-ID: <20260602140934.796697-3-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602140934.796697-1-github.com@herrie.org>
References: <20260602140934.796697-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780409376; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=QO4+t0ZHSxRITTqc5+EzQDA+h8c/0AsbUZFLsaOlT9o=;
 b=af23kXT6WsDbfC67lDZsPUNBaxZR98uvBYimfdc0cVVUtxAoflaaK2QH4OHKruiLgnStWJ
 aF49q109S62X9NLAbSKVxQuwkYzwuJSyMwqIp81w9HUs6rcfk9XWmSZJrqJxyDzdB5yctL
 8/GTaPckf5AGjJz6ns0BOzWmctoo5fIK/mk1xBTirm+UMyfWSWPmJvqCqxhhLyEeAFfn0d
 +iF+Y8NDmlogoIaNzB9tCLgl7bJnRLx8aNibU1V2dNjI3O+fefc/9+mHTEHl4Qun1JNg3X
 E0ZVQvWKbxjHVELUa48l7VY8au52Mfo1l5zCwKP8foNQo1Ii++BZ0pCPKYGr3Q==
X-Report-Abuse-To: abuse@transip.nl

GENPD_FLAG_ALWAYS_ON requires the underlying domain to be on at
genpd_init() time -- the framework will refuse to register the domain
otherwise. When the cold readback in gdsc_init() finds an ALWAYS_ON
GDSC powered down, the driver tries to bring it back up:

	} else if (sc->flags & ALWAYS_ON) {
		/* If ALWAYS_ON GDSCs are not ON, turn them ON */
		gdsc_enable(&sc->pd);
		on = true;
	}

but discards the return value: if gdsc_enable() fails (regmap write
error, the long-form sequence's status poll times out, or the
HW_CTRL hand-off errors) the code still sets on=true and falls
through to pm_genpd_init(..., !on) -- which then registers the
domain in the ON state and sets GENPD_FLAG_ALWAYS_ON, even though
the silicon is actually off. Subsequent consumer probes will see
genpd report "on" while accessing dead registers and hang or read
garbage.

Catch the failure and surface it: returning the error from
gdsc_init() makes the provider probe fail with the underlying errno,
which propagates to consumers as -EPROBE_DEFER (or fatal if the
hardware really is broken) rather than silently lying about the
rail state.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gdsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index b9b47f584f6d..a80a489763ed 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -481,7 +481,9 @@ static int gdsc_init(struct gdsc *sc)
 
 	} else if (sc->flags & ALWAYS_ON) {
 		/* If ALWAYS_ON GDSCs are not ON, turn them ON */
-		gdsc_enable(&sc->pd);
+		ret = gdsc_enable(&sc->pd);
+		if (ret)
+			return ret;
 		on = true;
 	}
 
-- 
2.43.0

