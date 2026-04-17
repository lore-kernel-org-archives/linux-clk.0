Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D75F3CAE7D
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438729; cv=none; b=DchTqFiYbPCEFiO/Xo4mCMcTCDvgKUCUB6lZ9NEusim2iBPyJYKS9E+6+zkTG78tEm5VViQlFnzFKDVZ2KVo0YoDeBaWrWzzj7HmYxqAy+jlbxGxGcs8ej8IxUME7Z9GcPec5heDTDh8IWlpamDJyq9TGzRKJQ4d8e1pdGu8do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438729; c=relaxed/simple;
	bh=9E+GVCevJV58fhmm0CYyTjqLcW41sUgTRpTXQLHwLHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4jPnvyp+qE+ya/3GX8MHlc+YDMFoQDMyzroh5peaa2HZsnXLfsiJGSl01prpRTwEDbRn2b+dJJUEEElZHniuosmBC7Rji083OO7cvyfQZZlfADXwMeVz8MKUm/hkrw7EF6teW8jLNasmoCevvrXS7jemmWWarPzcJDrsy7uEq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=k74u2ayo; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="k74u2ayo"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b936331786dso102914066b.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438727; x=1777043527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqX8mavnBNkgyap63RnjubBar/UFOY4VCctk2eUAZ6g=;
        b=k74u2ayoWLC5DNpd0RYI/7CyHOOrl6NjtuyotJuzimx2kLmYsuIsu+dOK/1FE1a1sj
         cW8DaIzIj6olQSWRKm1w5NOKoEx2itYe2paLCOJLL65+VgBUJCcZrSqoOiwBQJd76h6T
         o35K7Q6UGM84LBlAkraWW9gpfZeDexU2rB54YXGRJNE6onOZI3aLFG/eWcEFutJoUNni
         q9UCUWn+3Yl7D0tm/jZ/7IRDi6Ymg193nyyzV8ZcqOWTgOP7zOAQGBE+MeQidalU5ahI
         kq6bE8KQYeYxcBPP3oPNVHWFRxjp1REzZkMrBmV55gbxy3uwegEOj04c64U1iT5Er4zX
         mjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438727; x=1777043527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VqX8mavnBNkgyap63RnjubBar/UFOY4VCctk2eUAZ6g=;
        b=sXgwNbmepJMBPjxKB61GDnyBaXtOSgj+A0FksIhrtdud3JF3xYawT5qCJWbIimYJwK
         gT4/G8wGrhpWF6akk+TNw6voCim8aj3e2rCsyNcu9+iJqnHWQvT6ZCmJ1VGTqwAkWQhQ
         4dLULZnXvT8AzDIyP7dAJBtYeTO8GqrswtPOqBXVJ0wn7sgtBnjtrWlASXjFUzI9e56C
         jQ/WiAzHEc7oIpyHg4gJonuaJED9cuB7X0bFXEB3gaMEQNMRQ2ipDUjnRwhbZ8+aJ4AH
         XAEmH/klrPWEH9zmUaVlytlcJmdwWotLbjAvT+Kk1jCCaeDMQ3wko6+wPyHC8iz0vIV9
         H6kQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NyyQ5drI7FhP3n5hEI6e6rzrM2ctjbMo2HqVTSS1QAk3zf7jx2cv+yrzyh+svc20KDk9D30t70vU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu0L5ss4ObhvpG4UF3vfE6TNd+xJY32aqpiPxAptpZrfbx4X93
	OkVDmnYy0g6oNzdlMB2QCxo3i94lFZuficYJKd5pYYXfBhdtz4MFt5TftcYLLnb9j3M=
X-Gm-Gg: AeBDieuExYvczKHt+xD3PJDkdSZV3yL10rdpEfw/czKnDCA6RqRyzWkppYsiAv/EQ8i
	cubX6ft93yQcqDiT+F9P6QyAt+v2BxFbfscELjxQxBin+V9WrigGeDJSd9/JQdMW9K3RptrPcXN
	lluMCGI/hY1t6xtjNwl4Uf9KacGUOQWJbYXdDxZsREYzZ5ZfRILaMxDq8yku+b6TmSx7+dxY2hp
	7ZNyDAjHmbx6if27K6t3hJ5zZuIf/qC54jEE+8JBbssoG5E8Ev+uZl8MCqJhrDIy88iVsjSAUuJ
	3PymS3rUeUEDalpgwlcChNtlEurP/Y4SvWFdquZNw4hEwbjP1soPRnpDOM11BzzhhAc8GJWQBHO
	Fhdq7NyNahuduUj9oNAAU4VVjyyxqM4DbZny542f/IGl8wnXkxb97wSN+RENy5jbSHw71jC4Auc
	T96BsIWSxarjjCUYhOk0raiWNbGcQXFVdABrozTO7H5kplinM/FvtfsjRPBehlrK+Lqm3E5itQG
	DU08OcRPRc0b+AVk3NsI8W7c6Q=
X-Received: by 2002:a17:907:3c8e:b0:b9c:b069:8abe with SMTP id a640c23a62f3a-ba418e853b7mr164954266b.12.1776438726689;
        Fri, 17 Apr 2026 08:12:06 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:12:06 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 17 Apr 2026 19:11:46 +0400
Subject: [PATCH RFC 3/4] clk: rockchip: rk3576: allow dclk_vp1_src to
 propagate rate to parent PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-rk3576-dclk-v1-3-26a9d0dcb2de@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=alchark@flipper.net;
 h=from:subject:message-id; bh=9E+GVCevJV58fhmm0CYyTjqLcW41sUgTRpTXQLHwLHc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t127xRniY258Vemr65Gvz625DB3Scj+eCYSeP5gs
 fcvv3b1joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ6aiEjQ3+bJOvdiLL/kZfbGnlnOLHPfHN8uXm/VpTI9PfMj8VenmJk2Fa/+au
 BLrPpiRN5S0p7vgYdNTL//2592W/rcMcA1r3zOQE=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

dclk_vp1_src feeds the display clock for Video Port 1. When parented to
the default GPLL (1188 MHz), the 8-bit divider cannot synthesize the
248.88 MHz pixel clock required for 2560x1440@60 which VP1 supports:
1188 / 5 = 237.6 MHz (-4.53% error). This exceeds DisplayPort's +/-0.5%
tolerance and causes black screens on strict sinks.

Add CLK_SET_RATE_PARENT so that when dclk_vp1_src is reparented to a
programmable PLL (e.g. VPLL via assigned-clock-parents), the CCF divider
can ask the PLL to retune. For example, VPLL at 1992 MHz / 8 = 249 MHz
(0.048% error).

This flag relies on reparenting the VP1 source clock to VPLL at DT level
to ensure no consumer calls clk_set_rate on dclk_vp1 while its parent is
set to the boot-time default of GPLL.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-rk3576.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2557358e0b9d..28eb5a802e83 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -1105,7 +1105,7 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 	COMPOSITE(DCLK_VP0_SRC, "dclk_vp0_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,
 			RK3576_CLKSEL_CON(145), 8, 3, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(61), 10, GFLAGS),
-	COMPOSITE(DCLK_VP1_SRC, "dclk_vp1_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,
+	COMPOSITE(DCLK_VP1_SRC, "dclk_vp1_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 			RK3576_CLKSEL_CON(146), 8, 3, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(61), 11, GFLAGS),
 	COMPOSITE(DCLK_VP2_SRC, "dclk_vp2_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,

-- 
2.52.0

