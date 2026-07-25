Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B982319601
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 03:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949554; cv=none; b=r5uJT0VfWKhu9peY8jl1QIVGGgCPDTlZh8qD35sSbS9TtGo6Y9JFkgB8lORkakDEDtCKgoDlqBbnbYGWTtfwzUPe4o4fW3hsExtNutZttgImg0IthMOMOVF1WzgxPdggyQBLlWyjnRl/7R7iHKYTMN36W2T904TgxhB2yjdwupg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949554; c=relaxed/simple;
	bh=sD70Be1EFEVlYgvCDT/fN9L+7DpFEJJVPuxwpoqy0M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s82Su/g4zSrACGWis+qvWySRZM6AG4v0XMW5QN+7zkldwc3ZYGdT9LLe4JaAbiGdRvTkhhFN3yZpvHjtW08124BOavPaf/beAuGC3gF6lDkOydsFjSCBQ0UNVybtKlAFDpq6jBF8Ymjtlhy2kiMhTAWWkrAuIPpswMRTfWCEPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX1LxYjZ; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX1LxYjZ"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca8758e7e94so22054a12.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 20:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949547; x=1785554347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R27OrBVO4c+ZRT7KJNQVX6sAFfpZUPUtgxebharHHoU=;
        b=kX1LxYjZz2r74qdFtcrXGADO46F7Tnx+lNmd4eFbNZQlj5m7zJCdXHT/5UN/WhDtXu
         RIfHdHV2pBsqh2/hQicEjPJhA/tww/wao9TPIl4RALj5PTo+TKgJE9XNlEnaVh788tm0
         P6FDlaRaSH6ord1Rc6ZhiUfCmfSoD4jixv6w0eOCJnHz1jt4lE963DcukqvZIo9urd6W
         2oqSES896pk+4iYbXhCJhu00PyG6mxy1Rr0HVTSiDQXmjUD7G6T9Buhng6bIZ685gvnC
         ZnuWv18lVfFN2o7kk/hc7f8eCvjxRMYnR3n1mCAqkv0Egk5OH4iFv8oF7uQMKWxHkeqL
         1Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949547; x=1785554347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R27OrBVO4c+ZRT7KJNQVX6sAFfpZUPUtgxebharHHoU=;
        b=RGvjozyGi8hAqedq8e9rGb2cGHUA7PajrjQk/e2rvLI/YSRWDbZE6OemVUdyVPOyKx
         7X70Q74o2o5yWCP3EwmMhiuXFT3u5jLJmkpOT/2TLjhctLk9CB0g/l42R3UginiGGmTH
         A+xSWboyWxtPBfXWoxCymcCoi1pmb7hRz4kkOm4HOAJfEddBBEwrTvRbHezuFt8zGgps
         C5fpaGKCytRVGCy+OimQrN7rEf9V0MY5MvdgkkYqI5w5TH9PZFFWemrCw97aTHpoJNLD
         U3xMhJ156qy71dPfL9DOZWbyqSa9EOOUyyp9Kx2vt9gbH/vLk1czava/PS4W2ll4Ilwf
         FDgA==
X-Forwarded-Encrypted: i=1; AHgh+RrghwOVCJ2OUkwQZqbMXbg2CSlGAEmI5v1m9U9ojnrWEMJG3EY0bn8569LEwIchTYFU/hx7Ci3CqbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVnkox+ZSv/wziwD+cqllZZiNUgIrVomoXY02KnGGpeb58syc
	hEI8VBrOwH+qqIHFlFZEFZnm92sJoZXELM7r4m3CuPWbzOmXXG4uy/Ut
X-Gm-Gg: AR+sD13qW67I6+QOdLLpd6vPGtdr4y86nnr2RUs9PqVE2UH2Wyu++kel8pkgVa9mXpS
	EJm2ePgbr2za6L8QdKvJZqxSvYgoTw5NAuUNlEZJiaYiQ1x+Sw7AtTQpjnDefkXCSQCfFFgHe0m
	poU1lld6Rme69y29gjQR7tYPo7QHctbK0dzfnvnjYi+s3GRQSUPPDj5yg1re6hjrRb0LXpQ/aCo
	yt1BAwtZCG116ISBUZR7q7es1GmuUDMnw0pwh1D1VROnxnI9r/FB1CTdLfvfn3rmaZ1QAuzIcc2
	NA8kcSWkxRxXq/jmCkXC6xcO6QOOekGj72REeQ6fgO0iJYbQdnpy4Wd5OriCu6ru0ecpAi810/v
	wWL8ljVHFz50viN1eHO1hmMgdlckBbuwbV2JrVDy+pobbvfmRNLyvYVs=
X-Received: by 2002:a05:6a00:852:b0:847:9919:e772 with SMTP id d2e1a72fcca58-84e595426f1mr573194b3a.21.1784949547576;
        Fri, 24 Jul 2026 20:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:07 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:45 -0400
Subject: [PATCH 13/17] MAINTAINERS: add SpacemiT K3 display driver entry
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-13-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Cover the Saturn DPU, the Innosilicon DP/eDP controller, the DP PHY and
their bindings.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dea93a41962..9f2910a17c38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25436,6 +25436,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT K3 DISPLAY DRIVER
+M:	Cody Kang <codykang.hk@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/spacemit/
+F:	Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
+F:	drivers/gpu/drm/spacemit/
+F:	drivers/phy/spacemit/phy-k3-inno-dp.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.43.0

