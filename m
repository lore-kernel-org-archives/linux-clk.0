Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3903A2F3621
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327412; cv=none; b=dkJ4P0o1j35GIn7Ipsbj5MMtrUJeDPG6V286cVasok0H54f6yamVMA13OivLWqoLcO7DhBlOc3mUbiDfI6nSaISA4EFQQ3g11jcE70ExL9zmA1XZkfoSif0dg2TxOM11U8RYoDQMB5eK7FTqRSMZXWQeE9EpeCNCBDeJ71YNp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327412; c=relaxed/simple;
	bh=ylp76YU0XtE52owKtGGq4bgV6Fwbo7msca70oULOJxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rf2/773RpU01dQDuA5Skrpz7TylkH/wLBX455FG0RLikQ//9xP8EmcH+WJ1t5fVe1V6pOPIaBHMGCXfo09mnTYc9B8hNR6yP8520OYDHYi9Rgwu3BH72ZyOllKzLRQhJiMZoBoKkDG5V7bWR5KZMWqsjGq/NIWnUF8P1dZxxsl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olZiCPOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olZiCPOd"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 26C961F000E9;
	Wed, 29 Jul 2026 12:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785327410;
	bh=LVtqqfOciutVm1DpWKAabmhkfxRdHKSaNxSX1waZZ+0=;
	h=From:To:Cc:Subject:Date;
	b=olZiCPOd9IhSisi8uQz/SS5/26SKodQpImynjaYwlwZJr9Q7tD8h81nCfH7JmKqYL
	 Kkakanhe6MQgIlNGjYqygB7aYpWr6LDLnNIRTKhQX33qlZRUkTIOTmCXkmfKb3CNAZ
	 0ldAfD46CdI1pIaIHYX9r2NQrhVR+PmUUPZpzhDDnKIbXuUvWdsqDMRvBiVFstJ2yd
	 XpppZJPqASR+H2my7+qCHcLBiQLMLwDgd57+8PajNSQZj2Xk6ux0dgQoJzRzkBLhoX
	 4EBs7XQOHVKhFiX+zr2h+xaPm+PsWTqYGdnAsK3zvlECkXn0ne6s1Y8r1CFa8ZHUuh
	 Pc1Gm3dHV8piw==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Subject: [PATCH] Drop Michael Turquette's clk maintainer entry
Date: Wed, 29 Jul 2026 14:16:40 +0200
Message-ID: <20260729121640.3864006-2-ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302; i=ukleinek@kernel.org; h=from:subject; bh=ylp76YU0XtE52owKtGGq4bgV6Fwbo7msca70oULOJxQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqae8p8BPqiLBowFx4VHvgB78qKZK4fYudhdKfd sZwllmgAd+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCamnvKQAKCRCPgPtYfRL+ TgOTCACTycy1WSEeGkgQsVpz29HN3086sdPVgPSAV9UZ02Y+db6DN039cGp2btmifOUBm/yXujN O91LSlAV3WXpMJhzBBQtn6EES/8xMo/4C4v9M3Sp9TphH1EJx01AIrhztWcgEBtvqU7jKXUy/ov B65HHR/e03iFMFAeySQULBjyuqBZIwAZnKVe2OZH4glo5up1qk/E9hHwH/zTypc4DBj6Y7/6kNb kFB0QJAEpI8TwMC7RhAKEhzK7Wyc8nsX3H1HSQiuwQCqZOL8l7/tyg7XzCfCpv4VfPprgGhjEmH XaBEFcoFz6Aa8b/I1E8mWmpZQZecqJotrl2EsoejuYlHhLIG
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Mike wasn't publically active for the clk subsystem since years. Stop
pretending that there is a maintainer team caring for clk.

Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
Hello,

I recently[1] wondered about the state of clk maintenance. I think the
part of my doubts implemented here is not disputed.

Best regards
Uwe

 CREDITS     | 4 ++++
 MAINTAINERS | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 0806ab21c1d3..acab439013cf 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4107,6 +4107,10 @@ S: 4226 Landgreen Street
 S: Rockville, Maryland 20853
 S: USA
 
+N: Michael Turquette
+E: mturquette@baylibre.com
+D: common clk maintenance
+
 N: Stephen Tweedie
 E: sct@redhat.com
 P: 1024/E7A417AD E2 FE A4 20 34 EC ED FC 7D 7E 67 8D E0 31 D1 69
diff --git a/MAINTAINERS b/MAINTAINERS
index e95fc6f2ddc6..686431042bfa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6484,7 +6484,6 @@ F:	include/linux/comedi/
 F:	include/uapi/linux/comedi.h
 
 COMMON CLK FRAMEWORK
-M:	Michael Turquette <mturquette@baylibre.com>
 M:	Stephen Boyd <sboyd@kernel.org>
 R:	Brian Masney <bmasney@redhat.com>
 L:	linux-clk@vger.kernel.org

base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
-- 
2.55.0.11.g153666a7d9bb

