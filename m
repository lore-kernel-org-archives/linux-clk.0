Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD46277C9D;
	Sun,  1 Mar 2026 01:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329311; cv=none; b=kBrdi+91PkHO0Tv1mYPzC1fi03i8aVeqjaxZX9aNepVD9Rzz8eTWQYt794rOUD2DThRhq4v9/tX+AaQwApt3v1SP0wDqN5yxxb1AUjLHWvTsqiuItSu/qCi+7ypoJM4TSbvC18hA3pVCPcbAPKLTXSbbEOwg7p6egRtNAn7qc2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329311; c=relaxed/simple;
	bh=sWCKkiCKWTg+DMqq+FIDjQiXxA9LlovjboPsGg0rn9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4w/1NFc24WYXfQYjvEeSNjCrMcpTvvXzRcwUNvY5gq+YW1cS+Wv5HWKQk+44OdOBHhZ2VTHmJIQKkZrAgDE4egYyc3Enzu3FwqDJb441GmWqWwG+h/8OaXq7ZXNiWoyA2rvkQNCzyu65y5CiFO9MCS9nBuLjVZBABRQjW6CL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABdCagmw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABdCagmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23E0C19421;
	Sun,  1 Mar 2026 01:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329311;
	bh=sWCKkiCKWTg+DMqq+FIDjQiXxA9LlovjboPsGg0rn9k=;
	h=From:To:Cc:Subject:Date:From;
	b=ABdCagmwU4DsPTscoM91KJokNTS4rCYwDTVfKFICNrNpJPlqQuIpHMo+toOLYGAg/
	 NHETNHZP2KFIFG+h5Is25I6GXQPi2ioCFdnwzaOfdFfbVYACerQv27soMe49lDjIol
	 +dZ3EFgv2fZHeCiByw2Oibt1QKLFsJPhZR61ApvrQi/Lc3opBP2MgA89RiIf1DDSPU
	 VTmCE0jZKwzsy5wdjvazdFTI6jAdmuQhPEw/ijxzKJCeFdzVAhBa+xi2qsrg+w35m/
	 kZizD1ZgyRTyeqq9dxzVXTmFLCHcH1sBQagPuqeATVs+5uPNcbRxluSyhTfWr8uvpT
	 n6rGdjxxN399g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	j@jannau.net
Cc: Stephen Boyd <sboyd@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: FAILED: Patch "clk: clk-apple-nco: Add "apple,t8103-nco" compatible" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:49 -0500
Message-ID: <20260301014149.1703547-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From ef9b3b4dbe767e4ac642a88dc0507927ac545047 Mon Sep 17 00:00:00 2001
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 13:22:00 +0100
Subject: [PATCH] clk: clk-apple-nco: Add "apple,t8103-nco" compatible

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,nco" anymore [1]. Use
"apple,t8103-nco" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
Cc: stable@vger.kernel.org
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-apple-nco.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
index d3ced4a0f029e..434c067968bbc 100644
--- a/drivers/clk/clk-apple-nco.c
+++ b/drivers/clk/clk-apple-nco.c
@@ -320,6 +320,7 @@ static int applnco_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id applnco_ids[] = {
+	{ .compatible = "apple,t8103-nco" },
 	{ .compatible = "apple,nco" },
 	{ }
 };
-- 
2.51.0




