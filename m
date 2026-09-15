Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159538C438
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468435; cv=none; b=M4hTDBSddm37fSgmurr7Sv+NG2VZrUIar4OwkNf/XD2ZnzeIeei5JCEPzgu9EeWxhvMTd7aWTkrKzyJo2FvA4pugZaQVpH5C82DJ8pV4BBK3Q/EAZZTpVXpqq9AgVjX7L90yxrSaWtFz8AhHRlbEXJw1PDXQz2C7M8lcsv0DarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468435; c=relaxed/simple;
	bh=rMBxBiuiDq4omRt4799HznSfkajEM8cXWvJc5zo6Fcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRNC/ulrY4MyLtYaQDTUO+bTAk06jyEBfzzR8cRnhJUX/17jvdsIqjLXwYVEbknge1NAYeWLldaRPew6oQ2SdfblHRr8jkvjsuNnpSq20b6Nv7qMiYAWbaEIRsgFRFOTqw/EAOjNtc86voIMiK7cjDQU5tL9MCUQT1UTMsm4Ct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdRFWuia; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdRFWuia"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056c2064so189471a12.2
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468431; x=1790073231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=;
        b=QdRFWuia39XWvJOOhE9G5ozho//qCq38VCwn8Rfu49EBNeTOZffNJ5fAQZYscu5MpS
         eqr91eL6pBLxPujcjS2fTL/+KXaeKrqHXiCcVTVjLiirD8YachRPaW1jA1onTGHI87ei
         b5eXNiLj2iI7t7unWQ8zFFU/5aNQPequ+/at5Jj0dTr+LvfU0W9S5+gqMQVzG3SWhKmU
         6nBwcrOAa+s8kQxo+lrKXWq3ZovN7CEKSOQQYyXlh9Vc1J2YQU2uSTiXtdcJWnU+XoJA
         A9hHpk6Xvg9YjCe4HaV4v+xPRqpF92beogzUUbKu5CE00aALIWMrGnByszFn+Jlix5k5
         Z/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468431; x=1790073231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=;
        b=XI+2T66ffRhLc7iPtWfRckD2eVw177HBg8a49ZtKbML0lKQp+elmFKUuSeq57urML8
         flUS0S6xskFftmvr/6NZSF95h4rTmIbosgR/K9g9MRd8Ke0RHLVNQAP3juAnLbVH3F5T
         OLdxNiK0o5+TT6a4RybrSwsYJaCImXwercADkHC9Aysd18m5k7I5plmu8Zvp2AsK5qPP
         DeNHArf5Wx54/zUX2M5jTQWvwqjgkkLOYhopsrMQswm1T48B11huzSv+o8tE1fE5IGCx
         KYRadZUpJR8lcwxbiGRIm5p8dDDupEaaWfm+9kSdJWEf9yO3/ZMRNo0v809IR1MiwN1q
         PXng==
X-Gm-Message-State: AFuF++kDFIhuZcwKJ+HHGNQ3WCXHDsdRutP/pjIt85ymCvKsajpkBlI/
	0CYYmbLP1ags8wNQBl2KaRM9OavJcFMjXpJ41KCcdGt4Vv6Dd73qrlRs
X-Gm-Gg: AYBFou0BaXDJsYGFxAskALrcobblgGchAIebztV78Aqr/6Eag0OzQM8LL3mshkRmlr+
	guDVN3DOi99gLTi4hpo396rbwVBQ/BFLjpYtWEXaVQX4FtqFCIN2AUQ32NlAvypBaRT0NAGGnfT
	mNAKgoIMVu5XcDpUs8R6g5+yCv4f22le/Cppl2QdDBZggBKkAJcL8LW6VM/D7CQ4dQT9qwJJfYf
	N6+MHCo4E3ShO5wdCJ1vzot9RU0wILaRfAtAwV4guWl/xJXxUcdjqezXYc5u+/d8W3+0gyU45ka
	sVdqvkf3kqfqDzyMEUQ8wnKeEZvEavUlCthZ7IepRqsY/RqIX5XOPOpCSZ6HAHxO896NDuO0a/m
	FwIoGNwlo+da36a2cOp7Y1l51bWKshPLRsEm9bI8btWssgJqVzVHC5MnIVes3XeyfYAKIhjK8uT
	ihm5k8r4IZfACxbJg5bHa8S/Po09xG1Dq60XDkXJ1plGEkRM3lcK80rdaCEjKr9FlepgeKKosfW
	hSvbU98/UUbhB2hbW4ACnGxgT647ksrAc4DZa/CoN70w+zGz6N530ykeRh0MtbkEbdXckcoE+Pk
	2bl5UVWNnldn+Lewkbl34Imr3oO1HiZTDeI+jwukf345T1RXok43puvXYr8auhi7h8TcvQpLxrU
	dNUsEKzGgzKFyTLWAVY5AP2Y1zc8bmlNMiw7Db1urQRUBLlw72KWBvrlx9LlpZ87s2mMIBleOy/
	usyN3xSk+KvsWpNUkdaKSB1X3Up2MlR74x7+/r+HZP+/VeRZKESdPwyUM79kRYmRG2xlpMtQ02k
	yLYZcKu6nwo92bS
X-Received: by 2002:a17:907:6d1d:b0:c29:44b0:1428 with SMTP id a640c23a62f3a-c29d79b8aa1mr40465866b.42.1789468430983;
        Tue, 15 Sep 2026 03:33:50 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:50 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: imx: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 10:33:43 +0000
Message-ID: <20260915103345.1334-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers in the clk subsystem forget to call dont_use_autosuspend()
on teardown or error, causing potential resource leaks. This series adds
the missing calls.

The offending drivers were found using a semantic patch for Coccinelle
I'm working on [1].

[1] https://lore.kernel.org/all/20260915064327.1377-1-joshua.crofts1@gmail.com/

Joshua Crofts (2):
  clk: imx: clk-imx8qxp-lpcg: add missing
    pm_runtime_dont_use_autosuspend()
  clk: imx: scu: add missing pm_runtime_dont_use_autosuspend() call

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 +
 drivers/clk/imx/clk-scu.c          | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.47.3

