Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646D498935
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648112; cv=none; b=VN8FjCdwI8Rmna3US85WVQnzmezcgvp2R+owX9bo4fr7pwSNGg5o7L3UBFFXSNLiqnHdZyIIHcDHW53mCjiJzg9g1VRP5ZXs2hhBxRrMKBMbrtTuJRsHiltvvKSW81bSd/zEIfhHtJwuoazeGwcGh8HlkMY1aK674TAA28VjCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648112; c=relaxed/simple;
	bh=zTEIKTFLzHZXtE/A3+jk/VVlG2VZw/zJplZ3MmFf0cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ye4qymWZ0oUAy8C8VJhvx4qW7VKf1NfIP3ruDGbPsX0o1WAdXcmMZlljETMu7wYunkhCEhSUyICWl3LETPYeFMiAq7UvSYkaIlwmqrLOIfKXoAvLWWtQQ8JslzZaPYVFUcQECcF5kHj/SwhO/8J9ocb/gDegNM4+nUNUbmksxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npTm5TEV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npTm5TEV"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0584ad71so346730f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 09:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648109; x=1792252909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=;
        b=npTm5TEVWD0nmpjY9pVMJRTtKdSreUOgjWhlzXsl7ts1IujCYWa4EdocjF6wCNvIxC
         +R2W5x/FJwGcn5kHgKpHD8Px26I2Pu57rV5xNjbzVM9riFXItyAbJ1KVQpdYNOUkcgVj
         mCTvERjo1jZeCvtBr2/Oh7YU6H63Qev4/6UvJDHTV0IdZ0fpq1t5bgq99T5O1pO84RN8
         cGMUqr2CDjguq6zCTttHHhLPe5bgajgvqhqsI7739UUenDl+XOo1j0Wl8cc5ASQkwJtf
         cbgUhPQNCIXQRoSck7oxXmcvCuvf+a+m9Knjhlmj5MbHw89U9FFXqLpK3VuX9+qrlkGD
         Xucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648109; x=1792252909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=;
        b=DQMf8Q2bq1xjMeT1UklEizW/Sa0VUPPtcbPkoD3+La7VFmZngK2UZgQkms8k8s1XG0
         C4VEuyT35NRVdmJt7QcvZ8byutj6/pwRPGp9P40RuqFyrRSWBAZDWifhBB21ukZu7K6U
         rferqqcNiE0RVO20QJ1BmPpaPXh9kCjqbDsCuvvsvJuzVOH3rzGrOvHCDl6hvp4qU9P+
         wZG9+vLH4ACsrTU6J4Rfex9U4/hYhehcjcSW+AXBswutRNsGkLhf9UxQPCYo19C+8XeO
         c9nETJrNnwFIlW9kZzEKp0onKf9cXLe2BSwBb1I0aNMnowuC1r+QvGpE4C/IZ+43XZUZ
         PZ0w==
X-Forwarded-Encrypted: i=1; AKwUvBxFI2z9lF4plNSY8cMr1Lgbh/FfSsTFhJcnfPUyN8yWqffiKkeP83Iy9CrcyzHbpGmSs+lPSKW+MUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy8Xt4zWg+sXs2GNWgMMk8MEQexrjNJXG+7aSqG6IpDzD3ZQtk
	2VhgyZOUicaCdJX64gD9O5YUtW80AAgLNP+JjLBBUpIVx74gb9H68nGmxHBcnzP0uaA=
X-Gm-Gg: AYBFou0OA0/UQWGqqDcsiXIHzSizF1Ejp8ElHmQHSFQqWKi2nTsaAQbBkU6vKT8oHKs
	9XSD03SnjgZ/Z8L5DAO1CzNcobnFuilRIaSJwYQM+WFvHN+bp1h/Ig+r9ZFFGlLjZqhderjiz4v
	ddTyrm+lZMRr47FHH/+k8MLZ2wRWhdb7wXPe05yPdWs6qTYCS/goFNa2OnCsOXWWGkOITZ0x4z6
	Hy06NOJ5PNBpxdxgbSQnPtzn1NENLoQXXiwj3bLZ2TFK+HsQ/LVWT2KULQeh5SIxgeJv7SZPjtQ
	vZ47v0fiIksPjZOqaEeakcnOUkAp37PiLTtjAVy2Hov7P6OBgZ5JchLM5ni4ChK7alL+TsOM0Lp
	DFtwoc8/Motd7fY6eanYvu7EI39ZgX3LEerYIlV+rQZZeE/w/ptp8koSe1gKTyL3aa4z+tG05we
	i0anDyGLkeoNmUnBHB9HAswcf3GaJF6q323wPqJxbtdZ8MMPn/fyeMXhBeNLn0MUgSag==
X-Received: by 2002:a05:6000:184e:b0:488:8904:cf19 with SMTP id ffacd0b85a97d-48dbaceb60cmr10490477f8f.10.1791648108898;
        Sat, 10 Oct 2026 09:01:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm8579603f8f.41.2026.10.10.09.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: clk-mt8173-apmixedsys: Invoke platform_set_drvdata on probe
Date: Sat, 10 Oct 2026 18:01:30 +0200
Message-ID: <20261010160134.112136-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove function for mt8173-apmixedsys needs drvdata to correctly
unregister apmixedsys clocks, but the probe function never calls
platform_set_drvdata. Add the missing call to platform_set_drvdata on
probe success.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
This issue was identified by Sashiko while I was working on the mt8167
apmixedsys, but it is present on the current mt8173 driver too.

 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
-- 
2.43.0

