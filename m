Received: from mail-m15596.qiye.163.com (mail-m15596.qiye.163.com [101.71.155.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E6B32B113
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642174; cv=none; b=kTNXMmEiamsFFtK/y5eYdYgLXBi5Uvft2CPknNef2nmY2Dhs9VcwPwf6Bw27te9zzY4MqzZi2wFwTqVeDOaxdZF8hdSY5yWqL8fxJf0P143ZXRMWSBnESRgyuFS7ubtrEixrNgjpSHXsYa18+L8J82RqOC5Nr3A6vtZUjM50pgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642174; c=relaxed/simple;
	bh=SmGAL3Hha56LytdrjsSxDs4geMfiu0yOOv/HAuzg6q4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=EX7bcmolVt2HbtOyqxeIvDcXMy9nMBw3bXDmQ5iZKvtEEmXMej54++gx6qrrta4hHRVFD408pQcHhbxsRXG5YljbiZ+vb8bYaFqr5AnQ3qUDE+QCvX9ogUXgS7N+WY43N1gD+3c3qyH/R7+nRZGxL4tsboEY8AHvjfKJoFqHaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=I/knpU3B; arc=none smtp.client-ip=101.71.155.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="I/knpU3B"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 509291f98;
	Sat, 10 Oct 2026 22:17:31 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Stephen Boyd <sboyd@kernel.org>,
	heiko@sntech.de,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 0/2] Two fixes for clk driver of RV1103B and RK3562
Date: Sat, 10 Oct 2026 22:17:17 +0800
Message-Id: <1791641839-74584-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0aa1262d14ea03a4kunm7e28e606b1cfd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGk0dQlZOGElLGh5PQh
	kaTUtWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=I/knpU3B8x+5zFDm7w7WnJb1Y7XbOLI1h74X+UlXXPH69I8mmKCZ2WNiS3GNZv5YCTtkYf+lh50arGTXag5kKJFQ0qjo5wfT9JwMjpSe8PNohDobIQmHFFHBjxEtz/ZMjg3swjgzHPODXQ4Bec2Q2CLUxhigyrS/IWcd2nyOj9Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2TqRtsyutnaovlmfbdEDDrDTOCFj2EybIUPzliFBz4g=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>


They are basiclly copy-paste errors from the initial submissons.



Shawn Lin (2):
  clk: rockchip: fix wrong gate register for clk_gpll_mux_to_ddr on
    rk3562
  clk: rockchip: fix wrong PMU CLKSEL register on rv1103b

 drivers/clk/rockchip/clk-rk3562.c  | 2 +-
 drivers/clk/rockchip/clk-rv1103b.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.4

