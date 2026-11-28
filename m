Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859078;
	b=Xb1rlosZyp1nqkDT13x46mkFsbCAm67jhog8nawH+zDoovwX8aCn4h1uzZYTvaHOu46e
	 bYCcjIPTeFPwrgPQm5/3leRcN7r+Eb4aZxNken8RZ+rFyulQM0G6CMePAcX7fHHoyWojE
	 aG2FfKk9HAe7s0tendJ10qqBygEyyCZFjDMepOeDzC9P4TbNFrOQYsPtQnYFfsyffTH7N
	 Uk3y1jVnUT6cD97l56KJr9vuUX9PCaOvVB2BciNJk59qpdN65kWBfxzeK3LaQBdvfZxDO
	 OTAbEqpAOPgJ4m2V26LmPzKc6qcQyjOvBmRw5qlSboD7pCqrffbPQLF5TvD+uFsbn3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859078;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=xuExEJ56VvYhfQ8sUzmYzljLVVprjtHOk/85uTr1Cq4=;
	b=C7MiB5rdBc5wFUDBFoLDljMvPfkRXGIQhgVhDFTu4aG5POOztYQHTW+ShDwG1juxXMff
	 iZpp3K4GQUo8PpLB6lAHeOkk4AS3nAQbAdbCVYdAn89BorDDuTBjvqAziOoDS/CYVlRLL
	 2ExElpOci/Pt90PCh0u9K8xWKVnNiKOXKZ5e01GXdX4sXs2L6wO6GPEhaj1lyPePWpXof
	 vSQdOKfrX6UaHHo6uiR0hTGUId+yk008zDeGbHHcgyN+pbpqAbLw4MsT574sSDPi5iefA
	 KHI4FILkE+nnz5G2/gHElHJUL/WMfvM87bMxzwlklvdTGCnQunot7SeNVYRhZQ3kFIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hP7rYJvk;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A2606A31C
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B20A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hP7rYJvk
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b083c;
	Sat, 28 Nov 2026 17:44:34 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	mturquette@baylibre.com,
	eric@anholt.net,
	swarren@wwwdotorg.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] clk: bcm2835: Pair clock provider registration with removal
Date: Sat, 28 Nov 2026 17:44:33 +0800
Message-ID: <20261128-f81b700d6c-u05-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2218acb9703a1kunm9e79d88e451fd1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEkZVkpCQx5OGkseQxkfSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=hP7rYJvk7lIikGfOic5yzMqo5ZstJP6qd2I5MVYwuNB0TJca6O2yczxAnyB09s31mXzazuqPj7zmA7HxvJXM7PGxm7H7VVMnXGxy27962KBnchcEozstLoNFNuJFQ9gTxFhMM5FtlnqFdEilT+flTeIAeAuBmFNjnWnCHC2F6HU=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=xuExEJ56VvYhfQ8sUzmYzljLVVprjtHOk/85uTr1Cq4=;
	h=date:mime-version:subject:message-id:from;

Remove the OF clock providers on teardown in the BCM2835 and auxiliary
clock drivers.

Guangshuo Li (2):
  clk: bcm2835: aux: Fix potential use-after-free on unbind
  clk: bcm2835: Fix potential use-after-free on unbind

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9
