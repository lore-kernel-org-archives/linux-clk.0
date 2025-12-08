Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4742264DB
	for <linux-clk@vger.kernel.org>; Mon,  8 Dec 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765188846; cv=none; b=Z2dZGM6ro1wxxozdzB4yEXPjIJpWX9QK/p08Se46iqXGGIKGCkQ+LpNJVyaBiazI+YMie3RDAhuHE302Cb4BRqWziYMg9JE15OW1VbWm89+SKL1gq6ExdqWrMlbrZkT3jZ6KQlWGn9Eh3Dk4VatVrGtDj251XalGEVL1yG34xk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765188846; c=relaxed/simple;
	bh=Nsu5QdW7cglXKeNt1XJm+blUp6u8z3o6UblL9XQIWVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaVXWM3VILi7ytgiDut3b5jA/nA7CrkX+KQqn1CnBXGAvQtiQ8acVC5EBjMV+shvD3ETcVZmsPTdRjEuMDtHC7IVtIDP7rnfjS6AXa/O8OWZO7ot6MCO4xV0pP4RUqktedEcgh2wF1ltFi8h1pIwetI1YEsx/oH1OtdDYXtdRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnUs/ipr; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnUs/ipr"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso7004375a12.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Dec 2025 02:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765188840; x=1765793640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LtzNmN/fAQqQtdMXR9bXRDrRVttkDlCELa4V9ktnFs=;
        b=bnUs/iprrqfAIz6yDZTJT4oHwevh8hO4OSt9qH6FLMRR/B6vWeC8AYjTxP18s3gBQ/
         LspnWiehkLY7UerOKl51FXwaPCfTKPMjyPjJGsVSJik9LcWQ828YHpp83ONpwHopvWzU
         y32yqXXNoeHGa4rBgHkc+n5HVtZ/nyphNtW+aS0EadDIAiE+z2LduGmnXwhawwqZSajj
         al8MnAWYs0GdWZv9x9cFVY82in7hvTxn9Ur95XXSJdPPGj0fz3cGTbja5cSv5xfi/AAn
         clMAA/mbSGV7GNpJA5Hg7MMNXTiSIL6yC5KhxjzdneuZtRyVjQXU+DvCW8DNZFABt9aH
         AywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188840; x=1765793640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LtzNmN/fAQqQtdMXR9bXRDrRVttkDlCELa4V9ktnFs=;
        b=D7DGtCbGLTDlUnl/WZSBy7GzznKR48hOUNciAqGkOT4hqU9BVAq3KeTNBqiSAD4Wnz
         s/LoA2syvFOaWzwJjy/GiaPOWfIvxR7YeLTtF6n9m8t9BXKFKn0VuDF7jx1tfbg6v+nF
         cFRrZRcdridB5rTATJwl6TrrRIqzYKmNztFwSlHnXvuQPCygkyJzKJR2PwFNIkZq0fp4
         LtsztDHREEk/DYL8vaVI29koy9I9t/TTXxm4diM+9CL8G0uvZoMOyag6V6hswYf8Ij1D
         i850JccXzTySoqk2jp0AcOm92d3+pmghdw9g5bXp0uZSOyi+BWJbVqsoI+ADwVMz3e+D
         yIoA==
X-Forwarded-Encrypted: i=1; AJvYcCWAZk6cWiD3YJ6hhMnk+lQuzjxexcRUCaEs46cPDMxZWuHCUBqjbnVlYjParKX2aZR3Os6s967VPo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YysoNEVRvIbwu9vfVzI7mwe8tWVd973x2Zow25nyf+B/g5JpVF+
	5azEnel+I5Jg/NkGIycnBSAvitNH6DvRIBYgKlUhy1IU10BmOiErKKoR
X-Gm-Gg: ASbGncvCCRPJL1sy01931U67+YTyWpatYVzCJBlaUjk9UWndHvIhnAEPLtidOcmBIAb
	PLjGfefhdacwb6BzSY+ktxJteU+uLPw8ia7zKrlTPBrS52a8DFgSCPTQSIHH4OSbOK1u2UJBwVk
	MjwdfN8N6R1U00NxVXQSC0KFmAiuv5K8PxzBYrZRHj3tru4nP5uRAI1M1RQ+WvFAyiHKrjJurkj
	AFqzRtsKD4XVZhteuFzM9fhrLE7NV0C++Y5cVaqsxHJzqsRsPtYdZCfmARqnzZTtH4IZXLJJ4qQ
	P1CS/hmzc8wWibPTKLcok8tmd2bKsHsNmKFveGJNSM0EmRQh7TSOAFRmeuBwCNmXlyMpGnEW0LZ
	BuWFl9/CZhWm2EivTixQOkPqRVEi44lHW9TkSNetCQ3esc38PK+k1QQCdo+WnoHOLTAboAeky16
	jKihqE7FujgKgHl34mO+hVHm9+T0xkpJ4m5hHtXdrb8e+cZ5RakQT8s0/XhrZ4P5Z2nO7TWIuLz
	uYu/q9FxBTlnY4/
X-Google-Smtp-Source: AGHT+IEa7L5JbkY2oQmOETZ5gNSOiGp1Oc0yNIY/+pJO97qukyoubXHoVtql9Ceh0rQQXsT/WdPkAA==
X-Received: by 2002:a05:6402:27c6:b0:640:9e7f:675c with SMTP id 4fb4d7f45d1cf-64919c1fd89mr5914938a12.10.1765188840426;
        Mon, 08 Dec 2025 02:14:00 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b413b590sm10547083a12.35.2025.12.08.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:14:00 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
Date: Mon,  8 Dec 2025 10:13:34 +0000
Message-ID: <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 3f6299b9fec0..c0ee2dcc858c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1366,8 +1366,11 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 
 	ret = readl_poll_timeout_atomic(priv->base + reg, value,
 					assert == !!(value & mask), 10, 200);
-	if (ret && !assert) {
+	if (ret) {
 		value = mask << 16;
+		if (assert)
+			value |= mask;
+
 		writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
 	}
 
-- 
2.43.0

