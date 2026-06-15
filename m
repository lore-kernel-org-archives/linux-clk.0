Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F473B103B;
	Mon, 15 Jun 2026 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504940; cv=none; b=CjHHYLmoJECrt40Ln33D8lgfadHqMIruxagb/QWhyq3zahinYgaAOcakvPBQh6bv7Q3d1XjSwdpa6Mb12UsFPfuBRmbYObbsmxRVNlPIgjKknp6GxtBncGKKeZY9rK7lzE3b5qkdFVYhNZfxduK62KGRRA13HberqIErZ2NiXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504940; c=relaxed/simple;
	bh=/uF0APLHA6aMnb0M1XzW8idRNbCMlTaZWelbnpWF4Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXBhLgjHwWxhZ5yW6XY2jOySRJPaXPbEWcowgGewLa6Z46Bn4Ne8uTFmjbnv3XE3NhFUvX+JJNc1/i1UcY40ak+kLjagca0Ys8NeTpSwV2oZUi3Zhn8cOQgt79oZHnB0Sxiu6tb4oN170gYl9Qq6Wz/6eMMtabAsr+0PJgH2dCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D+fcCcjO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D+fcCcjO"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3221DC77;
	Mon, 15 Jun 2026 08:28:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781504896;
	bh=/uF0APLHA6aMnb0M1XzW8idRNbCMlTaZWelbnpWF4Io=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D+fcCcjOBltNOkauGc0xjPXYbjw2sr/KEo8mk3Ae2KKpKoiMQeJy97k+wsIqqGR73
	 zn4irXlOW7gohOX81hJr5K3INi+wQ4vanTxsErQ/jTaXIsPI761tNCJPrh9lcpUAz4
	 RIvMg6VsQlEaatPH0r4K5kavDwm2q1fsoqys3RvA=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 09:28:06 +0300
Subject: [PATCH v4 1/7] clk: renesas: r8a779g0: Add DSC clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v4-1-93096a1b56a3@ideasonboard.com>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=dZH6uQVQWsB7Gxixy1guTeTNEQ4KvrhKnhcrz86t38Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL5ubPRFJLqkLFHgqWHtpFZeDzy4Aj5nPfJGNm
 tfWcMmmVaOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai+bmwAKCRD6PaqMvJYe
 9SHaEACkDGvpKan5QsNhlugQVf56L6q+MUrFtjefVOq+ENZ0oBgSEMfxXAgvR0LtlBWkjkGRjjB
 2uShw/BzOHnmziAUHI6Iixenni+Tg6lAYJ0VdXpxT6+MCetUTV4hFIw3D+wNDQse18YLLkWWzlv
 aY8wtB+Fl9RnREArAHLNWOAiiwHhmwsfIloZWZ5qUgfweYFTJFvKkm7NKHqlUUdT9s2r8GZQCnt
 NosJ/1+mz6yms5H8fg0ic1wz0T6PxrTngJRl/BLG4brDl+9zeKMVg9gXstp3Z042JdaojoZGmIz
 ZtchoTnkA+wwXqddxSGGbwtM3TOOtoQQcxVq3PT6drfKkeFd8mGfrkyu4yxU8pWI/+DZpQEG3Us
 zGllnNzr9LiELMs8CSnHnBMMZiAWujHndj93DZT34cLcVkFRIqq8uNVv5CCN+hwEmEx3IfQI7BR
 VLkghK9OecXBdEmhkiGGseBTsFHlKcV+glYcCFSDmmaZfzXwgiQWrdZhuhv67fO1IpoBeOpzbct
 UePXsniN/sUdzA8zcwFslnhsK7b4z2GSHsLFN6afYQ50hsmZF1WT1v648h6030W7aaqjU/ssrtS
 Q1ILX4t/lQ/VvkiQDEpimLKgl9TIHW1t+/4G1UXJkKFhALqzMgetjUzAN4/+gnZZ+dCyLPPSSiN
 YpN2yeTr0vsKYNA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

Add the DSC module clock for Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 015b9773cc55..54ba76ff5ab0 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -245,6 +245,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D1_VIO),
 	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D1_VIO),
 	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),
+	DEF_MOD("dsc",		2819,	R8A779G0_CLK_VIOBUSD2),
 	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),
 };

-- 
2.43.0

