Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26A215F6B;
	Sun, 22 Mar 2026 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774167609; cv=none; b=VZ8KxkgmeKZ1ucQjPRbbTJikEeSi6576sZs5OMM67lxs4aSa4N9iliNd7THUONS+YxUhk61KOSWUrI21Z53ajKeFR8Fc952UYrdxQTZbzutJq5TDa6j4NgMtBjwFJRUCDq6DIA7MX7XIWdt69pk0hKZ7GDG6I+cT8tZOY1v2pIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774167609; c=relaxed/simple;
	bh=DA/JD6zz2kNjdIT4XwCDtcQAuO6OX7Jips84FZy7tLk=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=FLEM8Z6dI90UqqLZRdyaci2fZgzPh5Z0SCHYMXQCHFS2t+e/9Mlwky+aE5lKeodgeFqkcdFBmag2wx+dRtQ9Zodo36qYurKJInHJo/w6rHlLU6rNa5m80k7EiK9yn9+B4YNXntv5LYotIbXvq9zzvJzvkQHcnp55QZR5P5gPRkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=n+YO8Xwa; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="n+YO8Xwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774167603; bh=n55yWK1Schao3JnG7277KpB/5AihrSuLemaDN1vfRNg=;
	h=From:To:Cc:Subject:Date;
	b=n+YO8XwaNF3T6q+DkBilJXpdXTlqosWSBPDKeaGxvRXj89jSjl/U0SsVjWSX9FKfX
	 OIrjyjYL73AiknQTgbVImizjoFQ1HBqydRN1s4yV7FRgh8n53MeSF1QWb6e4HGlDJm
	 9uXxpiq98SZJjT9PhabGiv3WV72GPNrVNx526fZM=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 500854EA; Sun, 22 Mar 2026 16:20:00 +0800
X-QQ-mid: xmsmtpt1774167600t0cvhcqrz
Message-ID: <tencent_58AAF3ACDEC5402AD6B4CBEB501A10609906@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoe+YP23izIm8w9gAqPvrjwySsi6Wcp+7EkflnG2j5Q1lA8UvXeuL
	 j/p3CRrShYaCcyOXZxKPEeLYrbsJPZfnjRxZLQl69r6ZjhlUbrSlmz/zIpyj3h9uxdKceVJ6UUUw
	 ZrzOfTu7vls3QsVxtI1Z8bBPk+dRWfBXGno91vHYf/F7DpW9uy+GRi63gMQHIObwcedQzbUnN0iR
	 idgSZE8QgwLJFzlVHV+hZt6+Umc1Y2Llmmd1qoGlxlsmovvH8OR+ciV5L6FHSRoz7VNyDk3JMpLp
	 v6mR+OxlBqcRR6Fv3sII9e2jPA9T0ETHdWwIwj6kbizEeqmi/sJtaPnQsjCOtAjEPqg8y5oXQ7rq
	 ZHxAdNcAorlaWRv5sxyoZYH9r8eNZX6BSZUrD22YXxBErW5MgVdNGHmC8HAR2V9INxoHRObhdzj1
	 yI7sAllX3GnGYSiI0ym0BXwRvq9t+FpHRzSzwAhLmj/LpQSpG6HZrzpZ1Bm7+5gFYg+W28vlmW/F
	 iR8evfb73MKKZYCn1qIxAlpzqpPC2nZ3dctWSGmQcvB0ucxrg36BvVORwu6H8tAuyoAXJCZ8cv8P
	 jg+mFv4ZWLGyuTvp7KPtYEb6QYoJKjqgXTLTJtn4waM7uL6xPFfspDyPXt1+keIsHJ/BWsfCX5/3
	 Yg/o0BSWd6pinfhQwAMCKmArp8PER1rJxyKf4HZLupm04axI8EjUT4cPNUfU5MnFhvGSxn3d9bqs
	 bSyKWzq33/JBBsDwkE0BAigqv4CJWG3ZZUVYWrT+gOS7rC7Os4U+Ks3Fd/uDqnbrXWSmCfTcsO2U
	 N6k5CRmGKMylwrz3z/09BZZoq7yy/4c+DEOU4iUPAGMY2bMJ9Z2f1z2QGc9nhut9YCoivGROatvD
	 gZRL1C+wBNQiNG8ChfRGMtoD0e8OdsX61hPWtbKaJJZkSYg38XkEW70pLy/cwgBxQE9+CEhBchVo
	 3XfJFD+bjWK0/xHoJk4PXu7/2DmSKDRmddfz3PuAnoIIe/RbaapTLKqamNB5Yo9HXIx3SmSUZ0Rw
	 FTi8pWEOasct3yjFrl/i4FBKiBLZ3ieItVZnU06k0hWTSDsn1Onoech2A3grereo3pB1iG6w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	zhuyinbo@loongson.cn,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	devicetree@vger.kernel.org,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH v2 0/2] loongson2 clk: introduce ls2k1000 specific compatible
Date: Sun, 22 Mar 2026 16:19:13 +0800
X-OQ-MSGID: <20260322081915.1626723-1-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- Consistently use wjjsn <wjjsn@qq.com> for both Author and Signed-off-by fields.

The "loongson,ls2k-clk" compatible is currently used for the
Loongson-2K1000 clock controller, despite being generic.

This series introduces a SoC-specific compatible
"loongson,ls2k1000-clk" to make the binding more precise and
consistent with other Loongson-2 variants.

The existing "loongson,ls2k-clk" is retained as a deprecated
fallback for backward compatibility.

Patch 1 updates the devicetree binding documentation.
Patch 2 adds driver support and updates the DTS.

wjjsn (2):
  dt-bindings: clock: loongson,ls2k: add ls2k1000 compatible
  clk: loongson2: add support for ls2k1000 compatible

 .../devicetree/bindings/clock/loongson,ls2k-clk.yaml        | 6 +++++-
 arch/loongarch/boot/dts/loongson-2k1000.dtsi                | 2 +-
 drivers/clk/clk-loongson2.c                                 | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.0

