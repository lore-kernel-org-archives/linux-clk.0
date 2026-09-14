Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7A041D65C
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 23:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427159; cv=none; b=IdeEqh/ufHcFzI0rwaKQPoZ/w3YpKtJwKGjs0YppGGTVBx65DesD9bcfewvuox6GyQA8vvM2I2r34i+f/Ftf+xXbed2xCqS8zP5y2nmDmpPmDvl1i5ixZfAZUn8anovdOjPbjy5zeFszzlHWL+O9AEBT9so2pnnEQcxcGhONM54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427159; c=relaxed/simple;
	bh=LL9/CFfn7brpN4GoNpkA5AZ4Gnfvk9onVtuLOpwNb0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLda13yT2euIlKXYAZbwC1UHidAyQUKykpkm05ZAmNZTjHBQHbOuhNUJKIz5TtjZd/9a3B9HDJN4rZ//SiCIUhYUyM70xub2Gih25jvw/yJ1EApzefcFlu+S9Cq3rlELjq+XzaNnCIwD+EzANYVaiBVyiVQOonS7gNthJPMTL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdFvL0qE; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdFvL0qE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1366388f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 16:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789427155; x=1790031955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzV23OsQcR796zildVLZdcKUHcQM8u6Rrj7Y41au9L0=;
        b=pdFvL0qEKuFqOG1EQ6XsIo1HIO1tTf4PvjyRqpEcAgzDTPmDnzwUxSGccnQ0rb10ZJ
         qaKfRd00uMJG6hioUkde2OAm3xKUCZ9LLMLpQXbI+8Kw064OHi5wf2Ey/PQBLtjURLfc
         RUrRpvOkdgZO3J6bgWMrWYPkt21RSdgAElcXTydpFfglf7lR1nVhfJF9WW663PwXHBIj
         8qG3qjs5S936lghS6uCF+It6hR7VsMKa+TAUEoL4uvCODNvkwLSmVIXJXTs/aUfTb8fu
         eZLQo9gVMoYNjLlROanHpIHyFbi6O+YdvVgyW4ec9nRRqu3T3YmYkBO6omhTk6FM0/s0
         fMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789427155; x=1790031955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzV23OsQcR796zildVLZdcKUHcQM8u6Rrj7Y41au9L0=;
        b=lrIOQ850xM50SzZz/215H6SMvMquCCd3mZBI8n4dqQrjG9xAKDEgqaVp+Qtu957pPK
         B3pFpxZBvxRits2RQ1rCTLj+OE0gwvLYC/DN4KRrhh55JdSBIMRrk4PSyGC0pT23W0rj
         BSRkXZ2QD8+G/6HW6xzf1XnMTGUYdKMP4blzhVJ/SceFBPiemIpFShRSxCLBxUxL9AIz
         r5hJ5ZwZXDMTmARBc1op+/94CyDUsPML4369Hb7FFtu+WtR2cvFaQMSoWcPZocGD91f7
         7Cx9OgTvZjfLlsYZR9YjAokI6S+zfqeIaYKLM5Y1nsROIFjqnbAkr/026k/g9IToUBb8
         T4oA==
X-Forwarded-Encrypted: i=1; AKwUvBw7ApfEX/FnB5vW4TGAlyvXWuDIzbU+a3g+SzwXhMhWFjRfmOAFGo7bb+OZ1M4ir7b8BJ0LCRMh8vg=@vger.kernel.org
X-Gm-Message-State: AFuF++l57Tz68ZA6Yp+kl2I4l7JtVQ4AATECzfvMbC3CoBL+DtKZ5xlc
	BJEuagXuGfuJC6wIyAzylyC5CiEOGwkFO6juNuPWR6lydtX9WU9/aK/gNItAecq9ZYk=
X-Gm-Gg: AYBFou1c3C+XdPGl5vTzOvbYEMKrz0M1v7s/si4EA0OF4sYodtBC5ZJC7Kfb4xRWFs5
	O9TPBfX0LjXbR3F2layUsi7CMqqlhik0F7fd0ejEAm7qCmL9rNQmBLpbIB/LQxC0mgIAMk7LBql
	lb9wjhzvZttiTvmGsdEejAcDJ+3dssvbZA7IiPrKr4Tv/vEdVOj/XF5OwQZbExP4Z7X6+M3hSwR
	K0qQSgaHO7uZdFpsYG5AhlpjSqULcL15Stl5kCwMJY1UbqSYO4Zf/0gmy0e42PDx96BNF0+mi3l
	WmoLg67qwT/KcspjkOeiM2CzOY1WeIW9Gj/rPFxt/qa2NjazSN+7ZHbp5kJakTzpnhj/NfF0s9e
	lT6thUJvCa+Gi+1kS8anvpbaQtNp8iV9yKkE42odyNbEy1RCyxCiOUNngKFz0FxdvGRQGFnTBhn
	a/niPjBA1qx5vVDZ7FIDne48bSmiZyXUxxb+OQwn67qIUD6sN7YNNNdkRd1jNLQCbmjo+X1N3ug
	DXxmp7CBgNTKFE4RutcYFmDjPiQBzAHefLcqLfh4v/5+ZygUI0dGBQGakCLlf4=
X-Received: by 2002:a05:6000:5ca:b0:487:24e:27fb with SMTP id ffacd0b85a97d-48702b139dcmr5406922f8f.38.1789427155095;
        Mon, 14 Sep 2026 16:05:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d5f1sm32098817f8f.12.2026.09.14.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:05:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 15 Sep 2026 00:05:44 +0100
Subject: [PATCH v2 2/2] clk: samsung: acpm: add Exynos850 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-exynos850-acpm-clk-v2-2-ffad4a6b3fb1@linaro.org>
References: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
In-Reply-To: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC utilizes the APM co-processor for clock management
via ACPM, similar to the GS101 SoC.

Add the Exynos850-specific clock variant array (including mif, int,
cpucl0, cpucl1, g3d, aud, cam, disp, and cp) and wire it up to the
driver data infrastructure. Add the "exynos850-acpm-clk" device ID
to enable dynamic instantiation of these clocks during probe().

Unlike GS101, the ACPM firmware on Exynos850 does not implement a
dynamic rate read call over ACPM IPC. To return sane clock rate in
->recalc_rate introduce a SoC-specific ->get_rate() driver data
callback. For Exynos850, this falls back to reading the upstream parent
CMU clock rate.
When ->get_rate() is set, populate pdata.fw_name during clock registration
to let clock framework to link the parent clock.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c | 46 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 4b68b44fe615..9f46fbdd999d 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -22,6 +22,7 @@ struct acpm_clk {
 	struct clk_hw hw;
 	unsigned int mbox_chan_id;
 	struct acpm_handle *handle;
+	const struct acpm_clk_driver_data *drv_data;
 };
 
 struct acpm_clk_variant {
@@ -32,6 +33,8 @@ struct acpm_clk_driver_data {
 	const struct acpm_clk_variant *clks;
 	unsigned int nr_clks;
 	unsigned int mbox_chan_id;
+	/* For SoCs where ACPM firmware doesn't implement get_rate call */
+	unsigned long (*get_rate)(struct clk_hw *clk, unsigned long parent_rate);
 };
 
 #define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
@@ -41,6 +44,18 @@ struct acpm_clk_driver_data {
 		.name		= cname,		\
 	}
 
+static const struct acpm_clk_variant exynos850_acpm_clks[] = {
+	ACPM_CLK("mif"),
+	ACPM_CLK("int"),
+	ACPM_CLK("cpucl0"),
+	ACPM_CLK("cpucl1"),
+	ACPM_CLK("g3d"),
+	ACPM_CLK("aud"),
+	ACPM_CLK("cam"),
+	ACPM_CLK("disp"),
+	ACPM_CLK("cp"),
+};
+
 static const struct acpm_clk_variant gs101_acpm_clks[] = {
 	ACPM_CLK("mif"),
 	ACPM_CLK("int"),
@@ -58,6 +73,19 @@ static const struct acpm_clk_variant gs101_acpm_clks[] = {
 	ACPM_CLK("bo"),
 };
 
+static unsigned long bypass_acpm_exynos850_get_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	return parent_rate;
+}
+
+static const struct acpm_clk_driver_data acpm_clk_exynos850 = {
+	.clks = exynos850_acpm_clks,
+	.nr_clks = ARRAY_SIZE(exynos850_acpm_clks),
+	.mbox_chan_id = 0,
+	.get_rate = bypass_acpm_exynos850_get_rate,
+};
+
 static const struct acpm_clk_driver_data acpm_clk_gs101 = {
 	.clks = gs101_acpm_clks,
 	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
@@ -69,6 +97,9 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
+	if (clk->drv_data->get_rate)
+		return clk->drv_data->get_rate(hw, parent_rate);
+
 	return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
 					       clk->id);
 }
@@ -89,14 +120,23 @@ static const struct clk_ops acpm_clk_ops = {
 };
 
 static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
-			     const char *name)
+			     const char *name, const struct acpm_clk_driver_data *drv_data)
 {
 	struct clk_init_data init = {};
+	struct clk_parent_data pdata = {};
 
 	init.name = name;
 	init.ops = &acpm_clk_ops;
 	aclk->hw.init = &init;
 
+	/* If get_rate is set, the SoC relies on parent topology */
+	if (drv_data->get_rate) {
+		pdata.fw_name = name;
+		init.parent_data = &pdata;
+		init.num_parents = 1;
+		init.flags = CLK_GET_RATE_NOCACHE;
+	}
+
 	return devm_clk_hw_register(dev, &aclk->hw);
 }
 
@@ -145,13 +185,14 @@ static int acpm_clk_probe(struct platform_device *pdev)
 		 * The code assumes the clock IDs start from zero,
 		 * are sequential and do not have gaps.
 		 */
+		aclk->drv_data = drv_data;
 		aclk->id = i;
 		aclk->handle = acpm_handle;
 		aclk->mbox_chan_id = mbox_chan_id;
 
 		hws[i] = &aclk->hw;
 
-		err = acpm_clk_register(dev, aclk, drv_data->clks[i].name);
+		err = acpm_clk_register(dev, aclk, drv_data->clks[i].name, drv_data);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "Failed to register clock\n");
@@ -162,6 +203,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id acpm_clk_id[] = {
+	{ .name = "exynos850-acpm-clk", (kernel_ulong_t)&acpm_clk_exynos850 },
 	{ .name = "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },
 	{ }
 };

-- 
2.51.0

