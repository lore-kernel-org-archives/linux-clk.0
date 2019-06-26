Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A9FC48BD9
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 09:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5023820659
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 09:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OI251nww"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfFZJGo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jun 2019 05:06:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44936 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbfFZJGn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 05:06:43 -0400
Received: by mail-wr1-f65.google.com with SMTP id r16so1751436wrl.11
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2019 02:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0YLGRK88mV5vZE4LqM30CD7m71X58sUA87fhljEjqxY=;
        b=OI251nwwamcbJiqoK+UB/Xvd/6flu0o1NsCNHXMNnGjCJucGdtYeU2BAOR5pxbDyIf
         3pcHb7SWZ7lgPOjn1NIwpQYiA7oY+GdaCy6w/RtniLVSjwqYJ5cEFwjlahGpDEOakzRp
         HojdXsl4mFeJdV8ZNlbA6T0vu90xrCXQbrOlfVFNH4oBIt7JPA9v1saJYXvJx+/PtD2E
         MC0CU7+d0AYzSPCQ1tTqW5c8DYy437GAzhZxBp4YLmEvRW9MPhLqvd1wbk6SvPNkE/Eh
         6GEhofow4tZR9QuXfCR3+WMeVfmXi2KdOOKX3T/LxYMsFKsELkXaDRSxvQIm3Bm66Esk
         MM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0YLGRK88mV5vZE4LqM30CD7m71X58sUA87fhljEjqxY=;
        b=fhuxkOMG7FtUzaHha53IGO6E0mJZHCnd+N5jJpPwZYT9lFbOZrtwZxWIxXLp82i5YJ
         dT/90XHzNyfJTMwnm1xMeuJPYcAloyzeNcbCo0aAEmoBRIj/z3tM1ozdpkwRpokG/LBR
         WXAWhOD2pf98sX6yh6EbcvAQMwPRbrWlxqtfYqDitXct4XPYcx1hQix+9tJB2Cbt6x5+
         qkjfj0in3xl2cbmIP45RRJEGdz/h5v0KcfHlKK38WC69hXWtO62hU7Jc6pVd1EEieJpt
         S92mKbhAbREoS1JHayulRmTQk1iFd5BZzmMxaTgUb4CEGLbMU/oLiVmMnrCHR3QXNI5j
         CThQ==
X-Gm-Message-State: APjAAAW57aABTIXAQU3zWOGhLjKa4qaW7xmKi4TLYU6TX3TvngQEtKI1
        FsqlePtLoXAvC6y3sGUrGWIHsg==
X-Google-Smtp-Source: APXvYqz3vdyXnAtP1SpNLPKWrEQyz94x72h+b+vO8Fr71mlivyvfBRlVQGi5Jlk1VZVxT9rHkUqXTA==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr2735671wrv.322.1561540001249;
        Wed, 26 Jun 2019 02:06:41 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:40 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 04/14] clk: meson: eeclk: add setup callback
Date:   Wed, 26 Jun 2019 11:06:22 +0200
Message-Id: <20190626090632.7540-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
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
index 9ab5d6fa7ccb..7fdf424f71a6 100644
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

