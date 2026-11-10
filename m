Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332037;
	b=fBxS49/lBpamBm43lkeRGp6fTpX7Uwyr0Gc6g5imWTRnkUXRQ+Mf36B3DYj5oQhVon3R
	 giUO0mkmXJpvp3OGTCKYA74F0TGhjHu02byCOCxjm95dDjZPT/A5hGfHwSxim4TFKm929
	 zR4Mal+l1KqUktIr9QCM1OCQcGQM1aJHsfY5n7ioFy+ympZqnRCNBszuKU5POM7MfjUPZ
	 9SEJ/dvNX+V0A9i7AeDJNs2EriViTB61j+xC6qLAqr8FXbU8ZxVAGZKUKU5cBDAbZmTqS
	 w3L5/NI743ZwOYlb/dZOq9caW4jBrLjN0VZ9u2OGnW/sl/zdCgLjJAeuQdYlPpj3L3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
	b=0Ms2o8S/56XcVt8lHRWwz9nboOAOsm3eh9P//A6L56H9eGXEPDkBcnFaANbbvYZM6ZjK
	 g1YZPfYlefE2PsK9omJcVXjs+4LTz8uN0vzwT/G1D4om8e6yTkky111b2k1W4HW8TmVfP
	 9QQCrPUt7iLi1sAitMYbfRnn7H1AyRQppf+0k3dQGzGLHidsi8UF62ehFZzSt/0+DhOeD
	 QDODUKTzbeSdKXrYYm09r8EvQwtqEtn7t97JMUTWbxerFy2qQnpPFzOKmBP671nFNvT3Q
	 V9X6St4akoNuK+DoFCXM3QuKAPTsh72FI3gqipSvJMA6H75KDD1wxvoCcQ1LUjlXyGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyRphzfn;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED344606A320
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 17:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED344606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyRphzfn
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53512cd2f85so24152891cf.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332036; x=1794936836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
        b=eyRphzfngUXPZtGUh4ciZsqVuoJdIbbdOdc0R5SX4iJRArgXjvj7ITIGNm60b6Oyub
         1d0WvouKJHWbAXnc9UddDTEIQnpxJoWMEuZuw2oGyvmrpQBJdVVF/qVFsyz/bME9anR6
         OdZNGDp9nwjuMGwdY+YdfbeQU6V/KEGUg4KKdwMQpZwzQdAEMY/o1SRtzfxbSbMp4DSF
         1B6fC57Jg99jAvGZBDgxsx7IY5krV6bNBcK3owZKjk0rSnQcnDMzRs+XjJoxzwWGBMQG
         2hjuAIoMXqtnbo0kRBwkygFhlkFBkrZ+vTP/ijTQaIrfOrQySqzRLsVdoj9jbIKdX0WD
         OZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332036; x=1794936836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
        b=d3HIll5MBfurH9fY/SeSPtUZoJxbVgwU02+KPfzqZaEo2bx7iLKj6BSgdBgfGJprRG
         Urw+m6BarC+Tmy8gipEfsw4Eilt7xtg+yfxu+NPaNvIHjC25tQeLmxjWjxKbn4FYk7A5
         Jyt+SiqDLmD7vQsuU/0XvxbhjQBDdK2opXCBQHkYMKUsY+QlRJPzYonspFlCbHcULPSt
         PUq7nKLv8tPO4K108GVe2e1UVu4PDqqiLjcMDnMHsxlepVgA1cRQUkrJCF8sxIDL9d9G
         CzQni5HAx/bDeX/fmt8lDjD35rCbEe3+YOHm+LwRpzY1/KXbur7lJMtWd3JLfJu09mnH
         TqIQ==
X-Forwarded-Encrypted: i=1; AL+hErEALgMUS1HQcNogA0JCnQvtmKRw1wpyJ2djOEgRj2l1T7GcCy442Hdm7MC2Y3m6hEJIRl0tgcoyAnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+omFUhsGDrkDtEAiZHYOl2Nq4GTP3Ctgbtbx6K+4YglTvYU143
	6WcM2znarq2Yag2Nl9MqJzvehBtEhs7g7t9pQsOE8KlK7PP+EljRUVTIy2Nl96GJ80CXLQ==
X-Gm-Gg: AYBFou0CU32wgmOA0Qt+dnWNgMFJisep4lw+tXgEQxIEQ45OddIxzipgEdZK+KukO3d
	DILf2LUPHYQQjWdnPPu3qorMrpGv8KmQc7q5mk4aATm9bbFYrZtcnfkY3BClEVd95g60b/Dg/+R
	byXOKu0WxYtXqIy06TW/bTARdx1umQDJX7csF0EwRcMW/9UCWISM1yBoFSxCJ9MDPqsC1nhm+pn
	QNhxxq2EyqPtNc+QIWCbKu6RpsYUv6tLWuD6xh3KeBZaktDOeodPZUjn44BSizUp+/0tXX2i8aF
	XxiC0L+Qte8JvXg53JJNpIqwv9lfiLGYPRl8ybJbb7QgTv/rsM9K0w6SiX+nx5/M6As44JnCu7W
	HMCvahkIlIJVag5GZSrLVK71ilLCHUU/HTgS5SxZW0foZJwlrV9f6SIU4gWph6MVjEP7qk04uad
	QR31AXaU235HTPtFyPnSwCM/sxWf32zgh0dmmGper2RS+A8/B8h19id3fEdUHvVsAAp03uDQ7k2
	Tmo2Z3dMvuRr5ch42BblBkFyiS+3/S/s4aAUPYGOzySq3WV6lgbXER/vEenHckFubm8L+j73M1u
	js9lGzu8b/eWu7uOmqgA7kTieYovWCjmWIqgbKoLtT2+MbtOnjIVEm0FaX8+OorTCDezeHwxiT6
	8gjFEugdjw4Sl54fHv5C2P9aE5a1iq1z6Aa+0QQu2n8pqEp1nm5x14Vd96PaVODf+fHs/Npams1
	nE+MDeGQePSHmBEfddhF7dPbf9BCf4lq22D6qw/zrE2Cp8trojq7cV3Gyx7IwxTqVHN5mrGoat1
	HDojrXgydxMtTPTUnKd+ac+xBAMupzNoC4w/1Lx1iZlMg==
X-Received: by 2002:a05:622a:1ba5:b0:535:1b50:48a6 with SMTP id d75a77b69052e-55525fa6c73mr51407731cf.6.1794332035626;
        Tue, 10 Nov 2026 09:33:55 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555065e4ad7sm29130471cf.0.2026.11.10.09.33.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 09:33:55 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: unwind power domains when registration fails
Date: Tue, 10 Nov 2026 12:33:54 -0500
Message-ID: <20261110173354.41274-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

gdsc_register() leaves the power domains it has already initialized
registered with genpd when a later gdsc_init() or
of_genpd_add_provider_onecell() call fails. Callers only install their
gdsc_unregister() devm action after gdsc_register() returns success, so
nothing removes those domains, and a later probe attempt initializes
the same static struct generic_pm_domain objects again while they are
still on the genpd list.

Commit 86b23609d5e1 ("clk: qcom: gdsc: tear down per-domain genpds in
gdsc_unregister()") made the unregister path remove the domains, and
commit 16ba98dace9e ("clk: qcom: gdsc: Fix error path on registration
of multiple pm subdomains") fixed the subdomain part of the
registration error path. Make the rest of that error path match
gdsc_unregister(): when the provider cannot be added, remove all
subdomains and domains, and when gdsc_init() fails, remove the domains
initialized before it.

Fixes: 45dd0e55317c ("clk: qcom: Add support for GDSCs")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
Tested in QEMU on a 7.3-rc5 tree, running the real gdsc.c and genpd
with a synthetic DT and fake registers, with failures injected at the
first, middle and last gdsc_init(), in subdomain registration and in
provider registration, plus sparse arrays, explicit parents, a device
parent and a pd_list (52 cases). 36 of the 52 cases failed the
cleanup checks before this patch; all 52 pass with it.

Registering the same objects again after a failed attempt still
reports an existing kobject (-EEXIST), with or without this patch;
that looks like a separate genpd lifecycle issue.

 drivers/clk/qcom/gdsc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index be9c14e..8739293 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -647,7 +647,7 @@ int gdsc_register(struct gdsc_desc *desc,
 		scs[i]->rcdev = rcdev;
 		ret = gdsc_init(scs[i]);
 		if (ret)
-			return ret;
+			goto err_pm_domain_remove;
 		data->domains[i] = &scs[i]->pd;
 	}
 
@@ -666,10 +666,21 @@ int gdsc_register(struct gdsc_desc *desc,
 			goto err_pm_subdomain_remove;
 	}
 
-	return of_genpd_add_provider_onecell(dev->of_node, data);
+	ret = of_genpd_add_provider_onecell(dev->of_node, data);
+	if (ret)
+		goto err_pm_subdomain_remove;
+
+	return 0;
 
 err_pm_subdomain_remove:
 	gdsc_pm_subdomain_remove(desc, i);
+	i = num;
+
+err_pm_domain_remove:
+	while (i--) {
+		if (scs[i])
+			pm_genpd_remove(&scs[i]->pd);
+	}
 
 	return ret;
 }
-- 
2.56.0

