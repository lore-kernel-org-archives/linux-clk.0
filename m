Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D175C4248A0
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 05:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315391; cv=none; b=GFGCy/AlHnuuYCSg1Gt9WTMrZDO4DVyF9HeRLFJf/PUT8WqF16XKVBk832XwbgoUOqZUaeDnjDH1f56EZzsPaKlYYBAsEsBW1Fh6/q0TXZFs8XuWhstF6MZzADoATKmsCbzDkDJL5v3I9a9xwrDsyCjf8zLB8BcNIZ+uOU9Mhxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315391; c=relaxed/simple;
	bh=CMUAdTOQsl3zxRJz65ORDRt0Z6fLyb+XQaRIbRhIx7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FyibO92UcsBA3VJAiyxh5cnMyPHy4exAdj4y9Wh5dXVEiOLRCV4/+m8gxwLfcFowhnRjPuPRVK4nNbmnU7G6b0BTugJvi4SOxLjeKRoelt84HIIo9V/GUXolUoCawgpQt4WFvF6XnKvQuGH/FS1lSskO6Lb3Vb2ni+31bcVaugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSzf4Pcu; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSzf4Pcu"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f7915355so501217c88.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 22:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790315389; x=1790920189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpsFMQhFIaN3WfMajRs3T925X7ybvvJkOFygMeT7WvM=;
        b=SSzf4Pcu/RqY4GXFvJwQpeq67l+6KPag7VZ8sJe5g5Ii7eqA918FISNpKeGP15wdA6
         kCDvABvaUYibBZEdQxwCuYH2y6uQevLaHQlKVJ6Kl5rHphtq+SnF7MbW/5Vqb22DcMD8
         9iJtdxrzFHo3Sz5wBWo9X/f3/FzuCWpKCw175WaFMg1RC2uk3GW1gxxCTSFzKwKdgujz
         Q9i+X8KwfXjeozlmzueybZrx0JQcbsKRC3un0LXbwhTIBv477Xx5ISPb6gyO26FOfzSy
         Rs1gwtgkMas4TYxWAaOJ89NMh44afqcUWKhe3xw1e6cRaSGaYK6ftyIXOnjnfke5DjKC
         Owgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315389; x=1790920189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpsFMQhFIaN3WfMajRs3T925X7ybvvJkOFygMeT7WvM=;
        b=P69KYS8Wl20IhHvdm3XdYw32ITJRiDbKzxOHV8YwR7VDtL9V8SHyXEN7BXt4pPbA6e
         ggSeGllZ1d0Q+TkLMMC15cmLiVXpwr9ucN7FfsgctyV+dDtIi7+kkqL6c0Az2w4XJEj5
         VhLMaLVjQys7ATAPynei6I43MJc4BM3qJfq7cSpwl/gA53a2m9E2XwdkAw7cuPbCTmiq
         T+evl+rm8DDt0V7Uquwo54dks8T6yTQqp0NV7XzQl1dgzC8ZkjnGlLA8dr9gf0IP0O4h
         HYHad9kMvYTQv8rmWNMGjp2b9COKn8mFazqDltPT+G82hYI0BUWu8ZcAPtzfnTZuytH+
         wVkQ==
X-Gm-Message-State: AFuF++mOYvTg27nOQoEleLeHLiXIVVV0EM71oi/p8QsdMOkpZFSex5zz
	WbxlXamW+YhneGxu98f9E7AUb26xnBpkqz0mfW3ROAGZf4bSpTIxXn1XsnjPyykz3vhZRg==
X-Gm-Gg: AYBFou1/R4M+eKiaxwp6gUZVc3ChBnyFi/tlizW8ixPfC7zLcGYrzCoNCwYF2nrdZwe
	G0kBKOhd7HLQpGGfx4Qb8JYEgjGSIu3L+D5yzVaIaPbgYz/txUnm9xB+gCLKIZPqYQSk6r2Z4xP
	J98PAnnot+eaKTnvM2qgl8sK57ESeTiihDrDMUv/SFeEfe0UP1/Ezfb67yRW857JbipkSiZ1fJ3
	DJNTawY7A4jg7VU4IRMJLmkkDqg4+NBwXZe52ZvNKz40zgJFpcRV2bzBVidMYA4zCOPOAaBaLEe
	OXCHIwlkJKGzVoyy/y/xYwuIrvAk26vjy69AZ7U5KWy5MQPpE/lKciRjxXq27nk6WiSU3L134OP
	s+558wDNRDM2VFaSYETW5eZh0bBuuxJoAkgnfKHjTwFOhpVQapRse7JkqDWjl6YfJT5FXhDPoK8
	KwWNyvQE96gpUIYM1nEQVO+N2o42OKoC/S33pIP+SFk3A/aKLr7sK3SgQ1mmXcfQffVcrDYKTGt
	mqk9XJ0ApVi1z2ORMA4xR2m0m0sy5830HJ3rK/Q68BTvKZLH3cMLF8VKDNbtmhkzTnibkJ/qT17
	sDCe3UkF2Qq5bFiLjQIDloPYBnKRRhoYenyPJxTOP13iX6udwl1pZoFHZSw=
X-Received: by 2002:a05:7022:1009:b0:143:5722:55be with SMTP id a92af1059eb24-14504033d55mr4092505c88.30.1790315388475;
        Thu, 24 Sep 2026 22:49:48 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm3237181c88.0.2026.09.24.22.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-clk@vger.kernel.org
Subject: [PATCH] MAINTAINERS: name the clk/linux clk-next branch
Date: Fri, 25 Sep 2026 13:49:43 +0800
Message-ID: <20260925054943.2964129-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T: entry for COMMON CLK FRAMEWORK names clk/linux without a branch.
The repository's HEAD points to branch master, which mainline already
contains.  linux-next merges the clk-next branch of this repository
(Next/Trees).  Name that branch in the entry.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..88ff97fde3ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6500,7 +6500,7 @@ M:	Jerome Brunet <jbrunet+clk@baylibre.com>
 L:	linux-clk@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/linux-clk/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
 F:	Documentation/devicetree/bindings/clock/
 F:	drivers/clk/
 F:	include/dt-bindings/clock/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0

