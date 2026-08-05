Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB553E9C2F
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 19:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785958609; cv=none; b=iOH8jHb0wOtAHDCRwuVfwEXmdtbSjefDxmXIHaOnFeVYdSC95vAykS+yW8IJHF/tHUlz1A0QlgqVhgFi2V7fao+oD8JafFGDqo6+c8Y+7MSFA8055d6YP56aGA1viCj2j16KeywdjAAt5tdkzNZsTCeaWWG0I4p+HwtiO5xz7lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785958609; c=relaxed/simple;
	bh=iF9CeaCV/MT5QTis9XK16zAZl3wKMHXZrO5Be4dodzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9Z3qBrwXr0arMzzwwk2fTEupuhKd4qdcqkhfkyq5SAqLV+z8XXkAq0nO9wOz9SqVsxOZtokNfiNSbA26aZ+ei+oK2/HhpxFO9AwbEcOReS/OUtYk8Lbn9qyVPTpTxPr3jw1c9m6X+gwei80ysIWbXvUBSpToYEmn1qfoVXn6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGXHQpM4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGXHQpM4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49558ce01afso10100205e9.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785958605; x=1786563405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h2GbKMrBFLa4j0QbS4fEp7fC2n/Rdosi/gfxLWH5ik=;
        b=OGXHQpM43B5G4GgLGAdmeDG7ApPRQmoM6xXy0urfv15RPmGiSaRBPYuE7SUlZBMsvi
         88GuU+lDHb3QWNKqV4VH10mMOrRnPhjO3hDHBawQuVVl6xfM6HbN3c3dxF87gKWj4m8D
         6El69V8Y+WFBWJMS7XM0Bii0qCXfjeZFVzwTn2291cIdCSFuG8gEITxr4FoARn9sEsgW
         5rvax1t9yrPnFQQ03Nucm6ntxX/BpEGuSYTNmnrv2GTrBZcvvEj5aFjgRDdmv0oKrNKq
         uKMP+hfk9ZTvLc+J0eLRt1ouUAqZHy1jmiDCVQDLGH1vgPlHulNWNpUpzT7ABPy600hA
         Q29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785958605; x=1786563405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h2GbKMrBFLa4j0QbS4fEp7fC2n/Rdosi/gfxLWH5ik=;
        b=WWRWJaFUlLVHlaO5+7zqtKVbZofJmbutRHubwwXK/ecoiDnSaZnzGGLVpegTw4YdN8
         A+9CJf5f5Wf6cue30OrCIUHUzE0sNis3kVoWtV+E5EGrPPy/681q5twTVG9LoakPzooQ
         /84j/V3bv5C+MNbGhAqR4sIHVvfGGoGEaw/vK8bp30D+KY8ooLNR/3QbNjzsXsc9+biM
         1SPmpMbtGC/K/RrD8Sz1OxDbhRtuOlEZOHqsiFBYiz1mAQBRMg7Q2e2NJ5Y29GOvK3Xa
         kZFa8frhD/mS3oDwYayMsT9af7Hxc9+VzTakrgkvqEa08OyRNuEH2lhdPMFf9Fi9I58a
         Ofgw==
X-Forwarded-Encrypted: i=1; AHgh+RqhFaezZ4c2+KdmCkv1fLcr317ZCm0ZpHHLa+/1t9tzC1j0mJKVyme7yLm6FJCWbtLChAHJDFX3rtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytET96FeSWHtkGlM5j/936DremdrRn0QLqV5wjH6NTKcdEkoGm
	EwS9dscA44LM2iGQoamEPoZ+53BB+CzksrpPOt0apFk99U9PfSIyFHQw
X-Gm-Gg: AR+sD13wrPdYRV9QaMccKdB4XDGiwQ3mDDnfn+jcC0fm9owVwegtbJTRVQLCPyE7qBF
	ofgVh4q150ZmkXn26zx+HukAIk2YjzYI2Z4WZQ17sdX2v+GJZvvYY2Cs/g13AKpXVrPefhUYtEq
	dg7Zns5CAtjwrX/yHJXPIow3Oec1ZEzOP15lLUGive/sb5gojMwL5hv1mE/32kJMsSAUNrENxAY
	LR8HEBxpcV5vFjrL7GwTwahbydxvEx9gEsPzschvHuPw3p/IxfpH/uppQpYmw54+hN3Ctm756n2
	ekceVq2DwSECAn4nlRdHQfAu7N3tjS5a9130M38k7akbHOl6kXhfgxEuyRf/NUpU58ZqYNyfhS1
	nOx0zrFRDy+KjR9VEDx8hC5fFZ52XH/XIptf9Y4lrzoK9zpMRHQkEytuLJ7ckaqMb98TnpiS+HF
	t9D79EhG24OIW8ky/Qb1diDfjoyNzatJJUUyEFHeBxDmM4YlcsLVqEN2yUXYdrn7gScU6iuevRt
	We9k5IjIQ==
X-Received: by 2002:a05:6000:25c4:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-47fec530687mr15302387f8f.17.1785958604669;
        Wed, 05 Aug 2026 12:36:44 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:cc3:6030:335:e595:4fbb:65b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23ede6sm12682789f8f.30.2026.08.05.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:36:44 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Jie Luo <jie.luo@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Wed,  5 Aug 2026 21:36:38 +0200
Message-ID: <20260805193638.15327-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804115359.16633-1-kuncy7@gmail.com>
References: <20260804115359.16633-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function takes a runtime PM reference to enable the GCC AHB &
SYS clocks of the CMN PLL block, registers the clocks, and then drops
the reference, letting pm_clk gate both clocks a few milliseconds after
probe has returned. The clock ops access the CMN PLL registers without
a runtime PM reference of their own, and on IPQ5018 gating the CMN
block bus clocks makes the SoC hang on a subsequent bus access: boards
died silently within milliseconds of the CMN PLL probe, up to a 100%
reproducible boot loop, depending on binary layout (micro-timing).

Take a devres-managed runtime PM reference in probe, so the bus clocks
stay enabled for as long as the driver is bound and the reference is
released again on unbind.

Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
Changes in v3:
- Fix a reference leak on the devm_pm_runtime_get_noresume() failure
  path: v2 placed the call after pm_runtime_resume_and_get(), so an
  error return skipped the pm_runtime_put() further down and left that
  reference unbalanced. Spotted by Mieczyslaw Nalewaj.
  Rather than unwinding explicitly, the devres get is now taken before
  pm_runtime_resume_and_get(). Both helpers undo their own get on
  failure (devm_add_action_or_reset() runs the action,
  pm_runtime_get_active() calls pm_runtime_put_noidle()), so no error
  path needs cleanup at all. Happy to switch to the explicit
  pm_runtime_put() form if that reads better.

Changes in v2:
- Use devm_pm_runtime_get_noresume() instead of simply skipping the
  pm_runtime_put() on the probe success path. The v1 arrangement left
  the usage count elevated with nothing to balance it on unbind; the
  devres action releases it.
- The diff is purely additive; the existing error handling in probe is
  left untouched.

Note for stable: devm_pm_runtime_get_noresume() was added in v6.16 by
commit 73db799bf5ef ("PM: runtime: Add new devm functions"), while this
driver dates back to v6.14. On 6.14.y/6.15.y (both EOL) the equivalent
is to move the pm_runtime_put() out of probe and add one to
ipq_cmn_pll_clk_remove() instead.

v1: https://lore.kernel.org/linux-clk/20260730191353.557494-1-kuncy7@gmail.com/
v2: https://lore.kernel.org/linux-clk/20260804115359.16633-1-kuncy7@gmail.com/

 drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -433,6 +433,17 @@ static int ipq_cmn_pll_clk_probe(struct
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add SYS clock\n");
 
+	/*
+	 * The clock ops access the CMN PLL registers without taking a
+	 * runtime PM reference of their own, and on IPQ5018 gating the CMN
+	 * block AHB & SYS clocks after probe hangs the SoC on a subsequent
+	 * bus access. Hold a reference for as long as the driver is bound
+	 * so that the bus clocks stay enabled.
+	 */
+	ret = devm_pm_runtime_get_noresume(dev);
+	if (ret)
+		return ret;
+
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
