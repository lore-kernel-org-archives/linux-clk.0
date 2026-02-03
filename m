Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1021326D65
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116551; cv=none; b=XDDDo7Hv4KH43ApjaRaC3n2iAyQVhrgApn40epTmmAtMOd8/gd1qjiybYTJGmt1Don1hQpE+E8xEMOeB8aRAPHL/TEtFO6ZeyNKP8JgF9YW14LaAJxb/25P0dAEWdzl3hfWTL43ssXMxQeB5gtYn2ET5gvih2nfEDtuUZQIUooQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116551; c=relaxed/simple;
	bh=+YFdaMDpXhd1kssNROsVNnfestvy44gFsrxkDIl/BJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txw2pImwjJI+Z4tP7evT+Cpp4VXjYuNsL3P4QztKzCo8TOl4400I2N44T79ae+ZONV27YOGeHgpuInpy8JGUM/EshhCtOI3S7simZvrrePOCSw55AboaKc8JxrhSazVnqv3C4smCDz1cffFFG8g8R+S1BBPQ9FEs2vSDCZfrhJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWKbD9M2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWKbD9M2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so58236755e9.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 03:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116548; x=1770721348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE6s3RzlI9MLhSRJI6UuaRnNdQS5iQ3GZwPe8O0765I=;
        b=TWKbD9M2tXwI6WjuRs+p/XESNmPWgFYdUFwr1Z63M/ZuoB9ZKj5d/I3ZYO7tNk9LI5
         /Yij2SNZUo3qxQWe6l/+zRPabU7pyGWwYWRxZb5i+ITfNJkMywMbu8tXhSHa256FjbJD
         IDOAqr9rYegfFll+v8KOYTWS5GIg17/xEJUXyh4VOzEZeoxFBfwXZqCdmd9oFUyPoUaC
         lk1r2maF6wyZcvE53ZjRgWdQaYZ6CMKcQs0qg2yl0JoPcQlBOaZVYcKcsgdt2RenEbgX
         73Z9dluoLSnQNC65N0Djrdfd7MCMTVPqVtgEGeJavdk4JV2GwF1A/Uxf+axtnooPn5Y3
         tFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116548; x=1770721348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE6s3RzlI9MLhSRJI6UuaRnNdQS5iQ3GZwPe8O0765I=;
        b=YE9579P532VRqfuDf+DulpVshlWipTU+agED3Qb2nDZtTyJ5mgzsD9RL5clF5k7R9M
         Zbf43ifcdUSEzT41JjViTq7xcNjy1NDB1F9rddHg2n1uu1C0dM0OyihRl69wkefJ4zlM
         s2AxI1LXtD7lSjiIuu7mD7/Z78T77f4mrBDL0ZRtgqSYDj0MaXtxDOJw1KCYneOnN4uf
         yqhCDiuCjL9HyXQnJV5OGPbgBU3IgX6WaApJmIc2XsoyDFjJ48QgK9u2kZjKTX97tuMy
         KVYuENpF5oivYZbc6m+keVbQ/5BbIlmOwEbvfpG+Jbr2pfX/v7ps0DEkVL74ykequQ3M
         o8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXXqAbD+gDb/5c30xvDbgC96KHCuW/tqQ8MfBfYB+pVSy2+ZstIRD1+EQ8JRgeNFbb87vfHt3XuaoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ59jFXITAOpYWubSUmp4oJkXc2kKbpT/vOzabH1/CLqWuTZ8P
	9F3b4CdOcN4p9IM0hWdJkfcKMW6JGNg7FtE9WGD+d6iTlDO3e3a+VStq
X-Gm-Gg: AZuq6aIetF2ne1xR8vKqvl5ygkSjIJTOxUx0gPMWGsG7oIvl+VNofjNJChXIpzaykCJ
	AE6aMjPJFT+Z+n4ZCwkFytp4DnmjOPWby1Xo+s+tF1YPw/1IK6Dw4/4mmecF8LyVoH3qsWGc/yo
	/MNRdwuyk5a7o6XR3xMnwLfxqmxekje3hOVvl7mTXR59RbLL2UWNDafjJwN9tWTLj8u1qfWYaJ2
	CoTpeq3fCh/lfbP+sZFNyD5mYYk1iyHx19AYej3MusRyJzv22N+XfJhtja2427DyJVV+iZxnIe6
	dF8Fu69rCqNMMWCWKePA3OzTHT1RK1pyMwXJOJ0spXI1/dRY6JQeXDUmwQPzRKzoc4rvV2Ty2Ro
	swoqtyDqlHOSN1+o4zNagg1HWYvhn8u4kPy5KAL4q6EKltAfr/mV+SGvcdMxfMPjdqewg3WjZvF
	08IREWl7quUysKC6VvJQ==
X-Received: by 2002:a05:600c:8b12:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-482db44e7f7mr192967875e9.5.1770116547996;
        Tue, 03 Feb 2026 03:02:27 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm54110495f8f.33.2026.02.03.03.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 03:02:26 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Tue,  3 Feb 2026 11:02:14 +0000
Message-ID: <20260203110220.265748-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
References: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for PLL6 clk by registering with rzg2l-cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d77934872cf4..cc7d3872e9e4 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -29,6 +29,9 @@
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* PLL 1/4/6/7 configuration registers macro. */
+#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,
@@ -45,6 +48,7 @@ enum clk_ids {
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL6,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -78,6 +82,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 
-- 
2.43.0

