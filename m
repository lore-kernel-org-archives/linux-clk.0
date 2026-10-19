Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426668;
	b=TBn5xS9umrRPWeFtqnoqHPfCJcm4ajinTgshUOjRmFVGiXDZIs6fAlctgh9TXJ8KvEeW
	 xTLPKt/edEV8t7tyFpxUSqTjiQ80W5CF28r/yb79AG2nfC4Uc/Pmp5Ndl6bH+FkIfjMSx
	 1T4+jMAj/H1p1YOXGYKwtZaStrORFh5Gqb/JvJ44O+Dt8txH3bdkdu1o+E6d7SPzTIAto
	 qZAkwLMoBhCgAknQEgSbg/araPuehSL+aCxm/DfwmHI3LwPRHJVw57B6fFH8k/8Q/FNzh
	 K9tUvjBxAAuMQGsQvjPp9+/ux2VTYVaiemjai6NGfSNcAT66yOipldtCn6B50Qk+iVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
	b=fJ1m10FHTBNEykIrTHg7uQ78OnIC7om1v2taNXnbKO2YoQyZkj7i7SDP4bXZEKcHslB8
	 coW6ocfo+01d2RQ+ALovs3FRXYoom1STiseUgJoqJ0tIZzAWBre402we1wael1c0aMKut
	 B9N2Ja+8D2/rwIuR+NSiOPbnwUKSIys2zLzUJ5bCBN+fr2nXW1jMtHO+BUVnWe3BOKJcl
	 mEW+SaiHgkL5RD8lmuXZ3AkA3rJ/3YtNivo9KY2bapZlPPe6bA0ItBOXyPAA1LY6fD2BD
	 sxOr4v4Bev+yFV7b1BTL2qoSuXfKFkCd1chfcq28sZOWkEF3GfRgPq9lQUVAiLnpyZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K7VaRv01;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A24606A31C
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 16:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K7VaRv01
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so3789594eec.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426667; x=1793031467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
        b=K7VaRv01AhlvkuBbDOCGUqbBkt/N3HMy4qyjvMzbld+rjLvgJIUdgHygzIULhKMqjK
         BkfpKhx7wE5iahfhA45h0klxGuhGmXiN71rjRGuH/ynWvzWQE4vUgucdbtjz14JXPnR/
         vC42iWhgpsIyfYjanqmqNmSsrrclT58wpIbuGikOQUGz48A59cqVCn5J5aO/EydepZ3S
         YOcYUrXfp6Na6c1yhj6vzeQu2BlCJBmATxwUWGFaNFroW61Jx808XkArogBDutixHacw
         8EtK23UKT+QpsNgb58gFh+pKRq7CehUHT11OlOOFhHTPW3vSIB+FNSh5uYlhn7LUzREV
         qkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426667; x=1793031467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
        b=LU7iThVSZtJtaRbt5d7Wvys3O4MvVvLCZmvQfiVer78fdTkixzEMT4N/iLXOiIM7w8
         O1vrNbi5ISF5HU5XORo+YsWkOF8QWZvGEzvClpdKZLZgHX1kAeCpyaYTMlKv9Ts1+hUE
         icQ6LZauISSMGxy15IaaU5pF3QM4PA9tewubIuYI4q7JghXEYMw3ddPIKT/BlKLp1vTe
         I2sKETyuGApSpRq5T7Pj91R0NkTkKsSTRNKkPK/Iz+FNYtQKNoMHKjTUWBF5TuxzZtMx
         I7FOfTiYRY/CFecEMrDVXJO2oGmvztAZLZXqqcRq5VLRO4KCYtfhqy/ZaMHpzXTSwp6E
         I3YA==
X-Forwarded-Encrypted: i=1; AKwUvBwok0U9ni5p6qjgxISXERrK7cD3eqEc/9adaHFTzdGh5rQgEe3naoea5NQ7r6KRmIEXosGp9/bBslw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFzFmeT3JXNuwKu49V4B0654Wdi6wuW/C2nhqr//69YRmwYw86
	Dch6qk75Vjibgry41Qc2qUAds46FWlBAf/FuXmSSMH/glgxvLFpWdYbK
X-Gm-Gg: AYBFou1EJqXEssgYyDQjBZ/yuQvtXynpP0I3b6WthOVPnLbqGBWWhG4YgCWVK+LSjDS
	QvAvjMoe9pMl7HFGMXQYvDM1pLfCpwShn8nDoz4uLK+kdu+YDF7jyn3KHbjOX9Nnbaxg0J66y2X
	qS4mKT6RzIzzKTBs/a5pDbpxenxUZxJhXthwRSgXiogMTeN3EAGP2JtGDV9+YttbHq2cHioAO/c
	ODVHfshChF0ZiU+VoIr8Qqc1q2bOhWbwXS9Fpmkok/mGjdf/LuabvJrzUnYjUuI7jYR3GlMHvEg
	78v662/ldCYxEzEOYni+WGxZeSXiZKBXnBRFVjCCDigsO6ijBPqp3ojlLaztU1OawEZw5zP+wlu
	tHeav5LxZrxM5zepzFlZnaJYd0gd4Y0F2Jl63MxCAGsFv9JrEbk9giQQpy6Pk63PDREk+ZqqT+I
	CN2E36OmvKgZYEJ15dLM5dZpGuEvBk+yAmG8U1iB+FLzbf0PhQXGO/qqXbeO3NvZSGmVZGS+he5
	evAv6fZS4Z/R6KCJwmDNw==
X-Received: by 2002:a05:693c:8955:20b0:35c:707b:acba with SMTP id 5a478bee46e88-3619f1fd96dmr12005989eec.3.1792426666488;
        Mon, 19 Oct 2026 09:17:46 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:45 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: qcom: sm8450: Fix eUSB3 clkref rate and camera power collapse
Date: Mon, 19 Oct 2026 16:17:37 +0000
Message-ID: <20261019161740.2384-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Three fixes for the SM8450 clock controllers, found while bringing up
the Nothing Phone (2), which uses the SM8450 derivative SM8475.

Patch 1 parents gcc_eusb3_0_clkref_en to bi_tcxo. Without a parent its
rate reads as 0, and the SNPS eUSB2 PHY rejects it as its reference
clock, so USB doesn't come up on SM8475.

Patches 2 and 3 fix camera power collapse in camcc-sm8450, matching
what camcc-sm8550 already does:
 - set RETAIN_FF_ENABLE and the GDSC wait values, so the IFE GDSC
   doesn't get stuck off when powered up for the next session
 - park the camera RCGs on XO while disabled (clk_rcg2_shared_ops), so
   the Titan top GDSC doesn't hang the SoC when it collapses after a
   camera session

Tested on the Nothing Phone (2) (SM8475). The patches apply to
next-20261016 and build without warnings at W=1.

redducc (3):
  clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
  clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
  clk: qcom: camcc-sm8450: Park the camera RCGs when they are disabled

 drivers/clk/qcom/camcc-sm8450.c | 113 ++++++++++++++++++++------------
 drivers/clk/qcom/gcc-sm8450.c   |   4 ++
 2 files changed, 74 insertions(+), 43 deletions(-)


base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
-- 
2.43.0

