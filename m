Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DC4395AC5
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666474; cv=none; b=KJ2xVLUgDXj/oEX9Mu/xg41eAAEl0NXL36jJDAB0R/SBWGnFUuqtQV+MGawAa2mVsRfSPHSgN6gpKoqIW5yWdVjSM1fFTCT8SM1XmN83speIjiq8noN5Dol+D96+Rk+TUdXiAf7emX0/sgdXbYI0IqirflWRC/+y8RJzC+RM9Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666474; c=relaxed/simple;
	bh=5tJfXShcSu4bq2Y9zlq/kcnhcEbBVxjgw1/F8YOzfa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rS54uMRDPRLxvoNx0LX8Dhu6eFmDjUkMvoQucsw144S7+ZFr4T79yHyk/jlyVgnY2Dwf+DsQHToo4qaP5qub5zcDIfvLEL7n53jeqrviYAjXAV2QKtxC0UIS7k6dbSHSAOi5OabZSiBUIyYD601jUMQIkeo9AVpV7FvxGg5BlRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgkX5qCb; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgkX5qCb"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49bd98411so378069a91.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666472; x=1791271272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJVHdovO8wYi2ya3zic+FBCx84rgCtsdjBQID1blqec=;
        b=KgkX5qCbaSoXK630YWUij21tpSEdS93qoLvcMdeTkQPVhBe3AzdCJ0pT9vh5Mj5VC9
         opfGiBaX+JrEG3rvZb7NmWuvTW6WFD3YmVP25Ze155UcZzWQmpr7gJXgkTxVnQ/KQzip
         gLriWoxj7C/brhyjlzcDiHA/aMy1pI17w3j2NdnBG2BWpTBy/DmXX8e32Q/plm2QdxHQ
         NZ988X7Rd24AGcJ4k4a5emtUbayMy4BSlmiz+CGCGWgBKdMggj6sE+lb1NDs3u0w7SGB
         C917KzNzt6Nei3w9grw2semErmeojyQS7alG2r+jQDUAqpTlLrwrOUSkIVZYZ1gc4R6A
         mykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666472; x=1791271272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJVHdovO8wYi2ya3zic+FBCx84rgCtsdjBQID1blqec=;
        b=lpEwKsW2Y6iD7SjPZYjcMmyffVYtba3qYel4YfRFg4vNn8wAsnpJEnbQ8qlfnzQJ6f
         mQMA5LiNBNqwxV5wP37zfjbkutwmltvfqCeDi+XMYKeZLO1EySey5XkHmgukJzDlElz8
         w04efH6wNiEx3D6wtUrDHP8O0aG5+xYix/0Ykj2bdH2psArI7dN0YWoynszIpVzlGovU
         Y0yPevjkQerAHxkpLew4Md85T+61YoHgmQDf7r1Jh+G1NHhgArbkDikg/FSb++Jk4pN0
         9S83fmfJKDw8p6MlNLL7+dz70Se1jjzt+Yunhy91ZTcDvDXi03DoKP413I+Dgbne6SF+
         4c6w==
X-Forwarded-Encrypted: i=1; AKwUvBxs8/5bwoMIIQux3JWkBHBQ4Q8zICGWdi9D6xZgGDDK48O4jTqKj2ZzKR4oqHqqQAdgC+5LFps3nqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYItbIkLHG+tE2AzLsfamkRZ8j/kNKaIKw8Ary+K+s00zQfLTNbC
	+Aqve9gG2ZZHoEhPm+3MNc5nv0NtQtVq+UuKlUhH0JwqreUC8OfrmW6Z
X-Gm-Gg: AYBFou1TdhPF5brgA3iJWAiN58ZZr1uzYmtZTZ5LmEE44WgNtSoKsSgaicGo0vjkhX6
	pSJCC4z+04yexG/lVWetyPDPFmRQB3Jrf8Z2EKnmveE95IReH3R2QY6v0ewuB4eiIokpSydwAJp
	7wBh1n4WxPYykn1JEnZUoQAaSA/r84ilYtrHHtpk5bzj61XZ0RJCrGHZxG9ZqLAS3cpkC1W9QUZ
	I+Auy5jI37xTJOR2zDnSt6XE7FWFajxZikUKfimc+Psno4jSHfkMzBV481ww8kzzhXEfaR249xk
	KNm8ucL7EMh4YpjQrlvl0TeBRIV55vYziEXcwSLfk2xCFw8TN8JL0yffUIGLI+ym36Di2kRFb9+
	m+aLcGZ7AGhYDQyZqs7gY+7kosM0DMdp8HBfp18gNwjeid7QDY6CvekYHNDfA4PAuZL9uXTFCsi
	/45BCkifpdBaunuZVLsx3DWj6W/LQ76tadJwVLIMvVDczBkJyk/z+/ZwSOOUPnoTdshlj0bZd7D
	IIuhmo0NX8Id6cZ+ze2LGIF2egAcAYSBch7WmmZE4M0zNGrpxMvyxxro7MgJW0=
X-Received: by 2002:a17:90b:17c3:b0:3a0:bfaf:2ae with SMTP id 98e67ed59e1d1-3a0bfaf039bmr9440530a91.43.1790666472157;
        Tue, 29 Sep 2026 00:21:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497edd76dsm3833931a91.7.2026.09.29.00.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:21:11 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Tue, 29 Sep 2026 15:21:05 +0800
Message-ID: <20260929072106.175202-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 ADC clock divider register implements a simple closed-form
relation, rate = parent_rate / (2 * (N + 1)), but the driver models it
by building a clk_div_table with one entry per possible divider value
(up to 2^width entries) and feeding it through the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
Replace the table with direct arithmetic in recalc_rate()/determine_rate()/
set_rate(), and drop the unused mask_bit mechanism, whose only call site
passed a bitmask instead of a bit index, causing an out-of-range BIT()
shift.

Joey Lu (1):
  clk: nuvoton: ma35d1-divider: use direct formula instead of divider
    table

 drivers/clk/nuvoton/clk-ma35d1-divider.c | 73 +++++++++++-------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 36 insertions(+), 41 deletions(-)

-- 
2.43.0

