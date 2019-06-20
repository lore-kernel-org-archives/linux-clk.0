Return-Path: <SRS0=jKhQ=UT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D98FC48BE4
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 084022084A
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:01:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sVjb13m/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731952AbfFTPA1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jun 2019 11:00:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37468 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731837AbfFTPA0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jun 2019 11:00:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id f17so3510412wme.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2019 08:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BTgzDGLM/ROVQf5F0ngjAOq0Ibk1O1YBIUhnq8jWYwo=;
        b=sVjb13m/4Abjxcelx9dk0B2n0Gz48wNUKtEvFQSB6xjURfrJ8rVJunYzemrjIso0+O
         w1nuS/IZOyrwLZjCU/rKMeGAmxQNp35eHQcKJ4WmO8fHr0xXb4hkFZxWbWAa0yyS02Sj
         LubycPz4gZcpi6SRA+gvfvmvLemvvjHI/OQK9g8H5FLFwO6XfIDRKtml019xxHEv1iDK
         4YDCXsWc+bscbSaOySuV/XfMZobok6vF5h9JuKY43v9AC+RymMy+mStnpkUqOMalExwk
         Hcuz1qHDK8vh8koQP3omgI0YxWklCijA3BABZFVBnjpZjLUVwxnN1nHEzuzL42GfNpuQ
         +PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BTgzDGLM/ROVQf5F0ngjAOq0Ibk1O1YBIUhnq8jWYwo=;
        b=Ec2oAe1rsGljZZD/Ix8KjEsFblHWOvuRb6wJF1alzjtvae26sL7y8i5HTegi1kjdv/
         omfP57NzUUYinRIT7BuvcNlJgXwbfIxsnkxFgMtByV+rzl2PMS6P34VhIcdsIC0/ud9C
         fTc2xcaRhaitOcV+h7hv0MtYRHTYM42VtiSxT+0dRKKZ+rS4L1qtNl+7GnMeAwO/LsS5
         VUbPMy7Nr0ivM+JRx5eeABJaVmf3C4rqZaOmXsnjMyVY8xH08teR4j94AgS9yNaVxq64
         rcqS3okIxedGbBIdUqGLtXKABePxwiMgEQj5x+2MbQLpOFoJdtXUL1BFjeNlSQGXuyAC
         Af/A==
X-Gm-Message-State: APjAAAWHzhkFh3cMgcYvybvvSk9u2w+p7CK9YDVl5oUiZ8iqP/5Sj9Ok
        owaZUjVmaoGTPWiXUjXrH+vcxQ==
X-Google-Smtp-Source: APXvYqzMhLhcvV17323ZfwIYU4iAPa4KaU3gRalLKZq0KpBFZBYD+bml5U5CtROED7DHXD+AIE9uOg==
X-Received: by 2002:a1c:a952:: with SMTP id s79mr85112wme.28.1561042824707;
        Thu, 20 Jun 2019 08:00:24 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 08:00:23 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT 04/14] clk: meson: eeclk: add setup callback
Date:   Thu, 20 Jun 2019 17:00:03 +0200
Message-Id: <20190620150013.13462-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a setup() callback in the eeclk structure, to call an optional
call() function at end of eeclk probe to setup clocks.

It's used for the G12A clock controller to setup the CPU clock notifiers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/meson-eeclk.c | 6 ++++++
 drivers/clk/meson/meson-eeclk.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 6ba2094be257..81fd2abcd173 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -61,6 +61,12 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (data->setup) {
+		ret = data->setup(pdev);
+		if (ret)
+			return ret;
+	}
+
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 					   data->hw_onecell_data);
 }
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
index 9ab5d6fa7ccb..c22b57781e3e 100644
--- a/drivers/clk/meson/meson-eeclk.h
+++ b/drivers/clk/meson/meson-eeclk.h
@@ -20,6 +20,7 @@ struct meson_eeclkc_data {
 	const struct reg_sequence	*init_regs;
 	unsigned int			init_count;
 	struct clk_hw_onecell_data	*hw_onecell_data;
+	int				(*setup)(struct platform_device *pdev); 
 };
 
 int meson_eeclkc_probe(struct platform_device *pdev);
-- 
2.21.0

