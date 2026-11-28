Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858798;
	b=fOuv5JnZMOOTAKymp1+rD5kfgsKrRJ96PobPxHc8FmBiWWKnMDeGOQDdWsF3sfcatr3n
	 c7oKHtGhgJsu4+Poo8Lc2sQ9+ZIYIjo6wnGs316+l/p1fowIhgXQ8VVLBALyKHANP945j
	 9FZcALOzUT90rXkX0re2EEbdZDIt0+uka9yy3FrAPJm5IJDTH/vHKXXlaQxLi21knzasZ
	 r/LdUtiNZzK2LlPMZTx46v3odCMsxP5ZZmsW8V7HMoW1pw7FWrzmakrNedtHFc7apKA5W
	 9qFLZj2xz1gAF9Vsir/867ctdIfNzYem3a8BkbQuRb1eQXBgC+gaFitdd3Yc/uCmXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858798;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=+yvHY/srlZH50u3ozgJkZIaKzh2iY3Q8C5KA+drSbvs=;
	b=GM3z2/3/jiPvX1VC1dr6HHVIwmShwWJT12nGjNB3wiEkri9m/Zv3EqnsWOPmBcfPaMmk
	 u80nziFpd7VGs42RN4l2uWUTS0ZQ1P5XeKCBMieF0AXZ60+uHqJE3UfM/Nex59ZSlHxCp
	 oUfJ0oODcyO49Lp0CcCpwVUs6+3U4SoMXrBvVItvkO2MaIYferuzjQfgkLDpLxexw0NwF
	 htDr71PwHDQgdxWc11CBhmZKCe8vmCtIA+jS0tuSdOzbEDNN11P8Cdq4mGUk+TtkVuvXi
	 kC5X7wfkbJ5JpNglSegVA4QyoTL2Y3KUiGb0hTbA2MA4lXsKKmACpT0qSJOprmNm1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=estJGjvd;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE30606A31C
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=estJGjvd
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07be;
	Sat, 28 Nov 2026 17:39:49 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: emilio@elopez.com.ar,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	hansg@kernel.org,
	bbrezillon@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] clk: sunxi: Pair platform clock setup with teardown
Date: Sat, 28 Nov 2026 17:39:48 +0800
Message-ID: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa22186745803a1kunme5eaf005451bd2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUtNVk4YSx5CT01NTUhIQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=estJGjvdx7tWrwRpDY019KZme+DGgJJykCc7EuYPTYdqsumxY6UeiOEraqZ/ik2029QDDcZnLPHNmrBMwCdYRnOaVwC5U59xjqKd0CsvKO/ESQWLMTzsec/rOHeqVO1cQhPFUZ1tJe7qa76v9eFlNidqut5hItEAq9MiwOcqEuw=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=+yvHY/srlZH50u3ozgJkZIaKzh2iY3Q8C5KA+drSbvs=;
	h=date:mime-version:subject:message-id:from;

Handle platform teardown for the mod0 and APB0 clocks and the APB0 gates
provider.

Guangshuo Li (3):
  clk: sunxi: Release the platform mod0 clock before unmapping it
  clk: sunxi: Unregister the A31 and A23 APB0 platform clocks
  clk: sunxi: Fix potential use-after-free of APB0 provider data

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9
