Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9903FBEB3
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491662; cv=none; b=KU3FYguC5eq2cOFd/+0l7t+CGas76Zt1T8HqvV3vNGJLRgubxhgyMuCr7ZmvemBkVUPJbcIIv3nI+WaPXTIuT8Bc7TFAt+kRRUddziNPgMbgOcqLSW9E7E3OhA1jeyvsfU8ESHTz+fIsNr/VemuJoKgps+RM8nAN6JxMMotzY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491662; c=relaxed/simple;
	bh=Web8zHdcbJNnjkhQ3uoss4lsJHrT9sJ1VoYl5dI7U3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9sePXefiCeG+69oblr5jrP9CuMqq8cD/ZzYlGCiYgZsLM9um5MNzu7pNIso93im2sed5dCXfp8F/z+BL1oskQ1y1zZvM3+lJyh/eJSvFxNIn7pKeI9WWD+QQRuowbJQ9wJm2wWzODo5q9xQlho9PK1MGrg+BcEpFMy/OWBDwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ak6MUpUo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ME7Ld8aa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ak6MUpUo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ME7Ld8aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6ZmeaLy1Q8HlDQIKJFG0Hw1Bpilw3Yl9TkyPcS5OMs=;
	b=ak6MUpUoMjJE5Uy44V+XUP0fvMlkeZq4VK5JHLivfDOImWwYIOA0efAl05On6AMsyePrVx
	aSOoB4Z05RUGNgKaIP/JgklW3Nee/k4++KaVbKuToWosBTWQeY3mxZdW2zpkT9L2INQ5I3
	MpLcVGaSAqpBaw7B9J8fEaWcmYKydOI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-U3UfLPa3OL2Tp-QgCQha2g-1; Fri, 26 Jun 2026 12:34:19 -0400
X-MC-Unique: U3UfLPa3OL2Tp-QgCQha2g-1
X-Mimecast-MFC-AGG-ID: U3UfLPa3OL2Tp-QgCQha2g_1782491658
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ddad6183f9so22710166d6.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491658; x=1783096458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6ZmeaLy1Q8HlDQIKJFG0Hw1Bpilw3Yl9TkyPcS5OMs=;
        b=ME7Ld8aaD2b5VBNpv2RFAYQmEEpzMYsASErkSMjJGgSM+iDiJABc7jFjjGXxvroVbU
         a+QMZAn6oFiAOtO6plFovm6MyWqs2n1FsKolfnY7z/jV/KXv08QfK6o8P8zCpElBMrib
         Ya08GT0prPUQmFRWWpw5gAWJdJVWN+cyx6XXFeiUa52sJLD7l0WMmR4SSIul7lplxTm6
         7lJ47H3weqvck/gekLxPdBTL3n2KvJr4QIdmxMTYQLOchHedFXj9xzgk48Tc2kF2awDa
         hPg1QGXXaSkEh0Yi0HjIctXF+lfaVHbY1eMTec050kwtfCkPIoTpV49fYAmVIHrjOHM2
         QJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491658; x=1783096458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6ZmeaLy1Q8HlDQIKJFG0Hw1Bpilw3Yl9TkyPcS5OMs=;
        b=CV/OpzzwGpbt88uWqaPqmwsszP7X4wSbe9xbHQqTjvMFMT3tIkDxEXINSyafvb6mAS
         8hQV3It7rmXMifSE80t13Z/YqjCt4gQdf8gOAMl7thFQlwPSzty66+VjV0novRNi4IFw
         2kZ7bVAPKERC2o5sX5OpZH4a7kvzZK0AzFSK8ZYjwQl6v7CYjLZiP4uOnsKDm69QDEi5
         lYpcWSzsyuUN8i3vx8Di9TrApb2GSjvPxe1WQH1Wxnxq+5PdDY5IsWByPxHX4xIAy2Yi
         T2MyfZudvDMDYqk6EHMCeysSXhPu/QtZYCMcQdKFMFdd0UFhA1NB1bXTkuBS5Q2P/R0g
         Z7LQ==
X-Forwarded-Encrypted: i=1; AHgh+RotAnYeLaMHdkJp9dwXdNmFIW4SglxEwzwUiQXBQFvBaGLexPMvo+awfU33WKrtppn5rTuElWnJB5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YygfcoPBvVWuDBAukshnQEdik/FeJDH8bGFJvl/maOwuyRqarB0
	t2NxjFoa4rfYpwc4PZRfXPBIG4JpL5LQypevJFH5vwZSXs4c3AZNiVUN4JpVLg/Eko018JtVFfM
	2xJq1tECFE5bGCl7NB2n0eue0QxLjAj05zyCztDSl5CloIPMEG3D8Sz/esPaEYw==
X-Gm-Gg: AfdE7cn2hfIHhpEVwaun0YzY2TwVaNJiN3Rjmt53V5gFW0Vy+nD+X20L/PpmZRxnOwZ
	TKnOTfMTgBP83gZMyU2adaWrX1dgaeLy1utd1jgqrF8X/gIh+TqjoL8sfiawKCMGMXoGDhalJJX
	nULQjOyh3RRkwxwutmO9i1CgQ+8vildLFJo48gTc8tA3HoCTCGErogUR3vAo0T5qxSZ5q/R6KVc
	ytgy/SrENDOKovLrfg+jCpIYBXAHu3J1hnqSb4dDQETXJXU5UHLg4StYyELBx1tDs7wb2zF/sCe
	finkYoC4mFlrCwKB7tkwwNXmazw26ulPejfwPGX9yLKytH3Ajo19i1b5zIIaxhWkroIBl9wPPiF
	GHvsRatZu+jOKSE90Pq03u/8CfLW8PeuACymDsGijfm3pFxbS+w==
X-Received: by 2002:a05:6214:600a:b0:8e9:78d7:6b98 with SMTP id 6a1803df08f44-8e978d76f48mr22134936d6.6.1782491598579;
        Fri, 26 Jun 2026 09:33:18 -0700 (PDT)
X-Received: by 2002:a05:6214:600a:b0:8e9:78d7:6b98 with SMTP id 6a1803df08f44-8e978d76f48mr22129556d6.6.1782491593301;
        Fri, 26 Jun 2026 09:33:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:43 -0400
Subject: [PATCH 2/4] pmdomain: core: migrate to dev_add_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-clk-sync-state-v1-2-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Web8zHdcbJNnjkhQ3uoss4lsJHrT9sJ1VoYl5dI7U3o=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh7yYNlUc+TIRZ0G1oVmcwt2ZrWt1NHLOxWge5JT1
 qG0wX5TRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJ02f4p+C9WPnitnMB29Yo
 i7lum79r8RQDrdfx2yaJpEntXJe5rJyRYcK19uscWg+CuEJXNv13LBWZMbfX9+3CppYlEps+7Qr
 mYwYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

We have cases where a device node represents a provider for multiple
types of resources, like clocks, power-domains, resets, etc. Having just
a single sync_state on the device is not sufficient since other
frameworks will want to add their own sync_state callback.

Migrate the pmdomain core code from dev_set_drv_sync_state() to
dev_add_sync_state() so that this works nicely with other frameworks
that want to add their own sync_state callback.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 drivers/pmdomain/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..22791353249c 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2697,7 +2697,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
 		device_set_node(&genpd->dev, fwnode);
 	} else {
-		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_add_sync_state(dev, genpd_sync_state);
 	}
 
 	put_device(dev);
@@ -2771,7 +2771,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	if (!dev)
 		sync_state = true;
 	else
-		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_add_sync_state(dev, genpd_sync_state);
 
 	put_device(dev);
 

-- 
2.54.0

