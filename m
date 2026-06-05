Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA93090C4;
	Fri,  5 Jun 2026 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639054; cv=none; b=d7hrmoCiCkMviNAA72fw2NtnYYgLKPY5I02t9sjZ1upVtjk1QGoTCGa5d/8yKVCcWw/N1Yb2pOktYnpkTEvzdsX59LcGi8jMMzRyFv31XZktqu/ASKsb/cDjR+8QOsySLKaBm+I6iJtyTk25WstvGo/uOYQjPbI/0wWb6xEnpRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639054; c=relaxed/simple;
	bh=5MVQ2p40vp6/QuhT7atlUTGbDhz+7cq4Ty0b8OtLJVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjrXgPJR13D/VdxTtPEh335aMu9BhZDO/2i8OoLiwhZFWnz5TCn7xdYwhtA1whDxRRlH+ZQDhpF30BwMQrkxz0vwnHne90vr+DMFRaWjWL6TF+XOyu2dy1bMPCSfaLDn90bAI9MopWGlTxYei0b/4e8hm0uwFXQ8rKJNH1IJwy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ScIhBV1w; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ScIhBV1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZH
	gu+JGrqQgPjnjWztMAItH0/+Es2yqtkSf5YhCP5lY=; b=ScIhBV1wn6Wd2Y2nj5
	32IxZhtDYc9xy9z/x19InoZJT13v7EHUXSYZ7OMRSAut/F4Jc2GCpAmY8KaC3lWQ
	1H1H/3WU5FjaduQUJUI5umsvo9eNhNrH2+dQUYNofQS+uKFsZ5DblOhtuQzLo2hw
	lWQ1efhWNAIzYJDiEFDPrttAI=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAXkGE7ZSJqxsLwAQ--.65168S2;
	Fri, 05 Jun 2026 13:57:16 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Cc: Haiyue Wang <haiyuewa@163.com>
Subject: [PATCH v4 0/2] Fix aspeed-video driver load failure
Date: Fri,  5 Jun 2026 13:52:41 +0800
Message-ID: <20260605055712.118501-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgAXkGE7ZSJqxsLwAQ--.65168S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1fZw4xXr4UKw1rCFykKrg_yoW3KFXE9w
	1xGwn5JrykAFWj9F1F9F4qywn8KryYkrn5Aryjqry7ua4ayr90gFZ7Gas3Xw1UWa97AFs0
	ya15WwsxZrn0gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRK-eOJUUUUU==
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC7xyL9moiZTyazAAA3J

v4:
  - No code change, re-send with cover letter for more than one patch
v3: https://lore.kernel.org/all/20260302011651.94682-1-haiyuewa@163.com/ 
  - Drop 'Fixes:' tag in header file patch.
v2: https://lore.kernel.org/all/20260227151602.829-1-haiyuewa@163.com/
  - Fix checkpatch.pl warning, and send dt-bindings as single patch as
    the submitting-patches guide.
v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/

Haiyue Wang (2):
  dt-bindings: clock: ast2600: Add reset definition for video
  ARM: dts: aspeed: add 'resets' to video node

 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi   | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi   | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi   | 1 +
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 4 files changed, 4 insertions(+)

-- 
2.54.0

