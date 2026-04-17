Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846BA3CC9E0
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 15:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438727; cv=none; b=MTc9GiX/lOJCUbEdebjbIjBzPSQkBBPu6LE8CyBrbPMXl94IWVinwhBaZ9S0FMy8AHrCPFU9qsPKTY73Qq9MMrpAgdr/QJa3dxqNseEXKWft7WffpuVPeYLBBF4Cgm885ZhtYP6XhDANq1SbO+TKtxsMN7WU6fcFQHjF58P3A24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438727; c=relaxed/simple;
	bh=NvfvyU1IImSrCF3iQB5Qso5w+H1TNTTu2n7InPVjkh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCd4MrmicTvfk26URJGzj46Zl7wg1Exk3hTs23boIsCzoTCuMqJZBfimDr1xAEs2NYXXnteRZ6Y52uKittLRdIAWl10YuU01dygES+xWue2UsGoXbBXTCKPIIRqiqJnhA4PhwOV0l3dIwc8MWid0BzsuTNNynSeGP3LlaglM81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=cOb0JTwT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="cOb0JTwT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so512492f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438723; x=1777043523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0h/bSzKrRDyDdmyG30auftZMv/S6b+0T+VipJS3jxA=;
        b=cOb0JTwTxMCT5bBXyzwgrH3otZk16alJ1iPfSuQFYcX2QKbmqalnu172PPUveLDat9
         ixFlbKB3UY5NIaMiOAZfbfGMzG+cshz3zNrS2W7dr+GiC1nR8sPgbZkQL0S1hnrHERE3
         dwAg0feBP4pPo4Jd/Q6f/aNGSsysfaBTdbmkLwW3GCAXeoXt4wfyC0QSJWGQYDluJ7U7
         m1Sf0rRKgLcRXhT/A3roz+Et+21HbS+4CfBA+klrdBCgsNZwIw0IaOESPkwSptb8T2xW
         CQZ1yj2LxxlBgIqC0ker1eEW0PNwg9gGqsVLiEBBotALFfuWphjA2tzEI7svwk9M2rGS
         VHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438723; x=1777043523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c0h/bSzKrRDyDdmyG30auftZMv/S6b+0T+VipJS3jxA=;
        b=gdB5dC3vz2Sb0Wu8pjHl4awTH+7W55aVyL7KHOwtZH/ueIoQW4/SanAg0NOCui6u9d
         MTjTr28GydnUZsUX48pHlaojknKB62Kch/f93HDmbesK6gALUJJQIhtCDZluwGy1DXJP
         Yk+PTj0U9yU3Qhb043GpRjce2Qcm++lQV4w84AR+w0Xwf/Ln7B6U4Qrn4zUThKuWxJuH
         hjPE7e5XpsJHSzp6mh9D2buyGprkCZGFljAL5pUiJs8utsIFpDVmgxmkarO93Wr/Tqu7
         S6mKkxh52ASoXujiIxmxzshRwQVmdXbFlom1/fwwUaEpUl1sJM1/BYETarpaTTg4Qu/s
         +2wg==
X-Forwarded-Encrypted: i=1; AFNElJ+JqOs5SVv477tqrde+uwRUdEo8JliurzVnVsCtUtGUF6dNsA0jAtQdFzpcggXQ83z3wEgTfzx0Wu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVzalK4ehs2fSWrq5dmROXBEaJX+vot9Y0+Q8347wlADfP5asz
	TNOVpRkEqdhl6GrEeEMLLYEq1KTKJzpX+iyVBNiCShlCFNpOVhITItps1OtxXV0FNTQ=
X-Gm-Gg: AeBDiesmlhVH2R/sWm3jyE1kudDV5+QJvpVnUrxuxnnVsl+KmU+tQ9WH7WYRrjrbxDQ
	d5G/o/JjU4gftFpk+jjnwhoYkaiirEdnLYLrV81NiyOTky6wFbN+kITLXZWq4G19+qZf4mIpqPU
	JwG131RxFnXynz+4aNxYTf2IUaR6UgQ/sGMolGfPw2GMF9ZCqjl7j9Fh957ahYcc2+fOlhBCmGE
	7xD1PsjaD1paQPsC9rL/rVd8sevEGARWcG4x/NYldLh0RsLM2cRDylcIMLyMzh9HDQE5cA2Bl6+
	OElYtlfFu+UGow5DrbvR6UAL0DOaf/6q2HRCyGLXC5JJ6UHmPjSc8+hFtZr2ztqOrCxkzeeb/2T
	ysyoivvON/lK/TBjntaxtPfdIN+VwX2YObUY70JhcyqxWMzHKDkdKNyC79/L/TAE6fR9jXMpfxo
	Zls08P6K0rVD9jqrnEYs+sRJwHQqS8reE/l9b/GJ83gFrvKC/hkgi80EIhuFdQrCyvkGx4rg5FD
	3dC46MeovJUMwKj
X-Received: by 2002:a05:6000:18a6:b0:43d:70de:1c68 with SMTP id ffacd0b85a97d-43fe3e08c35mr4827304f8f.30.1776438722860;
        Fri, 17 Apr 2026 08:12:02 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:12:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 17 Apr 2026 19:11:45 +0400
Subject: [PATCH RFC 2/4] clk: rockchip: pll: use round-nearest in
 determine_rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260417-rk3576-dclk-v1-2-26a9d0dcb2de@flipper.net>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
In-Reply-To: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1952; i=alchark@flipper.net;
 h=from:subject:message-id; bh=NvfvyU1IImSrCF3iQB5Qso5w+H1TNTTu2n7InPVjkh4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t0mFK38Z9ft90/KpYsSdv70XXD10YenzgXaixSqJ
 vwM+vdKo2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpzipnZPiXM6nmzcpO/RZJe/8Jl6LLDT4zicyQ35vOmzlnyhXFdRGMDNM+vyo
 6x3zN912Ur3S2wqWjEzvDkpb/1XCwURZbUfi+iREA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

rockchip_pll_determine_rate() walks the rate table in descending order
and picks the first entry <= the requested rate. This floor-rounding
interacts poorly with consumers that use CLK_SET_RATE_PARENT: a divider
iterating candidates asks the PLL for rate*div, and a tiny undershoot
causes the PLL to snap to a much lower entry.

For example, requesting 1991.04 MHz (248.88 MHz * 8) causes the PLL to
return 1968 MHz instead of 1992 MHz — a 24 MHz table gap that produces
a 1.2% pixel clock error when divided back down.

Change to round-to-nearest: for each table entry compute the absolute
distance from the request, and pick the entry with the smallest delta.
The CCF's divider and composite logic handle over/undershoot preferences
via their own ROUND_CLOSEST flags.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-pll.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..c142f2c4fd99 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -66,19 +66,19 @@ static int rockchip_pll_determine_rate(struct clk_hw *hw,
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate_table = pll->rate_table;
+	unsigned long best = 0;
 	int i;
 
-	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++) {
-		if (req->rate >= rate_table[i].rate) {
-			req->rate = rate_table[i].rate;
-
-			return 0;
-		}
+		if (abs((long)req->rate - (long)rate_table[i].rate) <
+		    abs((long)req->rate - (long)best))
+			best = rate_table[i].rate;
 	}
 
-	/* return minimum supported value */
-	req->rate = rate_table[i - 1].rate;
+	if (best)
+		req->rate = best;
+	else
+		req->rate = rate_table[pll->rate_count - 1].rate;
 
 	return 0;
 }

-- 
2.52.0

