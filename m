Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057742047A
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230312; cv=none; b=n9bxT4fjjuM8cX8o0eqU23Nqs5FN2iLQsLgLEOXb9CsKfDflpuKVFDb/HkdEsKA3416NTspKxrYltQt34pBoBrUAq5teFh2Irr3wbdzqjE3KUtuqMLengwiwXFUh6/QAE6YWZDA/oK2uhCDGjGEBrotDlJZzNTcJkU6A9I/fB4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230312; c=relaxed/simple;
	bh=aIFMPuRdmJNDMfcNywwoN0iQ5141uX9JSYiOoIkP3dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1YRa4cqZqwZzC78oFFFwFcMtiRrKhF2W+yDZ7iKMBqrqI6+GTx8tn00MFfcrX/EWbUsJ0FG01pi7qrdyzBsm+9ZEGLLB2R4NICgGOlo6kTjEcvLM6DFyyoWjgM4C65FLQfeAvNDxSV3zgpfOS0HbjmyoxX6gNk9CZsYvm43On0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fKDIGodD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fKDIGodD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so42099235ad.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230310; x=1785835110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=fKDIGodDmCiUWxnhOocxFne+yF+hl+36GD2rZZjgY8d7hvScNE0Ty06auHQjGtwoZI
         Pf9JLBh0vbfPVKQi/4qx0+Jb3t3zoxbWiUxM/gWZ3Yi1pAQbxosjPyWqD81AGlUeKVzm
         wuK6X2JzVlt0Cps6uDoKolfwGhlGq14OHJkTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230310; x=1785835110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=sLtDKlDifEK9bVE1VLZzbYzMW2LkCnHs1a5fsEgjILpdEdFVuWU4/MKqn28AA3hqDD
         ijU6Jh90F1+n0NoP8rzcCjpaMyr+jdvJzWkCURfL4BN4Z/GwSaknsm5qXUf8TmEevGTQ
         ENxyRZUBduzjpdrzsh2eIMaEkYyMQUJhjaFK1JHoQyXG/mTYQL8feDVVxnl2hgQOzsJ6
         9qSbNvKnda+rXs8KN1kZBZiGkIThLdDJ0Xv7wJblx2AAOAPu+wzhm/betiNxVszYjJN2
         KO8ONb9gDXbyQ9Q5obpJMVu/4Jidw9lzHMUy6W7PZO+hzQXC61HDnd1caSI1sizc1pfW
         3FDg==
X-Forwarded-Encrypted: i=1; AHgh+RrGTodtlg4bitTPAO6PqLenx6zFeyZVKiCUD1VE1gJGT6jvFKgvKiuyMByThv0WlJ14b03Txrv/9zA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZBfvozbmA0F6/LlpYd1gadmB48Gc6vDpMXs8K0bSpqUJ1vLiG
	tSHPZbghyZHDfhZ0LaNWB2HT25nYIy/5h3o/yWLnG0zEgbx436ngfTR4CvDcj8sygw==
X-Gm-Gg: AR+sD100qAmCr3dP6sAFddLs8N/D+PG6ZyY7+kWnFBn1//9A8REpC1KqJ5OuJVvQlSE
	VZN8Mwa3fOmsn3PkcgAmHBqF6Fx4azMhkjZBQd2EZ6pugeeFIvOzOkAPor7/4KMTTMTfhNEWiIv
	Jm1/RbVEDgjVczl6jsymssqR/sniJ+aDzI3G/l/7kvvRCvYWJvrBemEdzOoXgj5tgm51DsR4tTZ
	7kWuZpXssT6aV3nPAOtKL5j1wqgNkbvNBAHkA4h+sCBJmRcPjPL32gU9Lf6WcyHGWrpU/EKekz3
	BetJREebs7+Jr+qFn6UbVYIGET9vwXdUqny4M0RIvCC9ZRsO8c/4R1wVxCYa2ZLnwVAPMXAi1cS
	DaHQLrUrGmIwlzMCHlaSz+RlTlHmcinKRaqqPuYDuvWZKOQs7+DrtUEXkWhpW7BriR/LvgMVYba
	nC/QkOa+4Ni9LMnTbcO1ogZmm3QitS9Pe5+bUsBk/y6T3/roLrxQXDMkOEjy6+61fz5AAYfEZJa
	b2FbznQcAaM/IC/VBYbtFgK46MYrVkJFncGEq5FetSvvg==
X-Received: by 2002:a17:903:124a:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d015ace749mr18293065ad.7.1785230310643;
        Tue, 28 Jul 2026 02:18:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Tue, 28 Jul 2026 17:18:01 +0800
Message-ID: <20260728091804.382753-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a6bccb600a57..e9218e0f363d 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.55.0.229.g6434b31f56-goog

