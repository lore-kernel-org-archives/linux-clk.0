Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C03ACF1E;
	Wed, 23 Sep 2026 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135953; cv=none; b=h1jnmn0xJunhy7jhEgzHtrOs5tqQG6cuKZvPCrUTvSe4LenDvF/021XaepZVbP/aIIk/Rt0V8wqDG4PYPQb/42jQXRntSWBsI0uAksmqXxZrYsBomlXaxpUwP7sA3oWf/2wK70wHq2cva2/IpaTzdfmCIAiyszNCi8aoDW3/rHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135953; c=relaxed/simple;
	bh=pf0wyrYzcGMNnF77ElJcnYY847tmZvB6uBdaPg8n9Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NQlXO0h6cRk2+mJxOq860iYdNB65Km0tlZsCjXzE+N2W6ADtAun+y8EehfFKMXNWLZWvO6byxYZNWu47+/F+9h+ETSmAZmetZfM9mwfh+N3r2Z1JR7ArvrUXAG7kHC7wv8Lr0ocldzJUKD6b8sKs1Vh1XBdlIClmh73CzCYABzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nPwe3HVb; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nPwe3HVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=H+VbIqBtyAmD1pKOCvC6gZ69VL4JxTY/WRkUV4dXNVw=;
	b=nPwe3HVbVLL2oTL3Xk32qH2Z97vonuFKpbLrLs84g8QA1EwRimcbRiQJj46W6W
	CI6vLS/WV3VTrAwuoCYdq3ImKAZrxU8zO2SGMN4sVdq8v2T3AsjO1jCOvORhjKwO
	G+n3WR6D8QdXkbPUCgoJjmjCIEJW5uZiemb9dzLGpfgYY=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3xRZ4TrNqHo4pAw--.28539S2;
	Wed, 23 Sep 2026 11:58:51 +0800 (CST)
From: yong.liu <binary_world@163.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	binary_world@163.com
Subject: [PATCH] clk: Reject positive return values from init callbacks
Date: Wed, 23 Sep 2026 03:58:34 GMT
Message-ID: <ccf-patch-f7a5fae0-beeb-4667-93c7-3a4ce9321890@163.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PCgvCgD3xRZ4TrNqHo4pAw--.28539S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur4DJF43Zw4rurW3AFyUtrb_yoWkKFXEgw
	4rKr97Wr1kKF43CFnFyF4UZr9YvrZ5ur13X342qFsrJ34xZr47WrnIqF1DA3WxGrWIkF9r
	Crs0kw1xury7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRK-BM7UUUUU==
X-CM-SenderInfo: pelqt2p1bz02log6il2tof0z/xtbCzxs5+mqzTnuY1gAA31

Clock init callbacks must return zero on success or a negative error code
on failure. If a callback returns a positive value, __clk_core_init()
already takes its failure path and __clk_register() releases the clock
before returning ERR_PTR(ret).

However, a positive value encoded by ERR_PTR() is not recognized by
IS_ERR(). Consequently, clk_register() returns an invalid pointer that
passes the caller's error check, while clk_hw_register() and
of_clk_hw_register() report success through PTR_ERR_OR_ZERO() despite
registration having failed.

Convert positive init return values to -EINVAL before taking the failure
path. This makes the registration failure detectable through the public
registration interfaces while preserving valid negative error codes.

Signed-off-by: yong.liu <binary_world@163.com>
---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4053,6 +4053,8 @@ static int __clk_core_init(struct clk_core *core)
 	 */
 	if (core->ops->init) {
 		ret = core->ops->init(core->hw);
+		if (ret > 0)
+			ret = -EINVAL;
 		if (ret)
 			goto out;
 	}

