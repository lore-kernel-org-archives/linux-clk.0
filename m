Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B10533D6;
	Mon, 20 Jul 2026 00:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784507905; cv=none; b=EkfoXSLMojOAd857FKLIhs3MqqmUnjlRIUlGt+QRHJdfR20epHV+mqAEr7tnFbSNFzaPbRjqckdZf+e0fhoQUH/4llMZk5sVmRATx1ZUbQKSFM0vXqxUYV4mL8kPYr/CIsV67w0seCtR168f5SSK5iMoM912BhTwLVw+sIJNcJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784507905; c=relaxed/simple;
	bh=sVLL5zFhnEf2mpOMRpAU0zuPeayxIDNDpPLwPVLqsX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5gzjvXJA5QEs3/YoNNxLFZfZXp+/6PCnSWtYoWI7OcCIv6kI7gB7oir4shEJjB+W2kg+TkBc7HCauImu03FdZdvpBvbHKNCXCnCN5hxG0Ny6fGabENwGOCrSVW39GrPlV9fR0T5eHrKck3N3tu+T1wOkq63tKZ/Llhaw++Sj8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOUjsRDi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOUjsRDi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28597C2BCF7;
	Mon, 20 Jul 2026 00:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784507905;
	bh=sVLL5zFhnEf2mpOMRpAU0zuPeayxIDNDpPLwPVLqsX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pOUjsRDiHy0JadQvnzOg8PzdMsnhuT+PeYmZDcxCNgxmYPXQXb9lKpiY1+BzBUiNz
	 8RJVRZ3qoiHzQlTI5XhOttPX/5vzLtu6vlKdO8mq2zUu9+NeBTmbtqNeyEVCUqhHml
	 V02qC2yWHP+NZG6cT7ICEH/qBgxqilM64CuImCdBXOuJidZIqyXBR6xgSyRTmAV9fo
	 L/hmP/dDH6GA83FNcBFWw9VR16BRolaAAONoQqt2iA3RwITBhmsqY7T4FGCmiwp02E
	 L/O8hwQ1ab/0I1fuXm12TXWe9iHjj9zWH1D9p7o30dQU551FtDuguudtkmEhhaNV16
	 2hop0j+ukX/qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E687DC44512;
	Mon, 20 Jul 2026 00:38:24 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 20 Jul 2026 08:38:04 +0800
Subject: [PATCH v4 1/3] clk: composite: Export devm composite pdata helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ultrarisc-clock-v4-1-fe639d63bbac@ultrarisc.com>
References: <20260720-ultrarisc-clock-v4-0-fe639d63bbac@ultrarisc.com>
In-Reply-To: <20260720-ultrarisc-clock-v4-0-fe639d63bbac@ultrarisc.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784507902; l=845;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=mmNYdl//tm5jVxgVHLR5oIpB4MdMweBH1Jbb6olZW8U=;
 b=805WxaH5WTkCWtyOv0d+xqNS/6rgmIa8Pn5/DAoxqF9NAsDUOIPyvRF9xHW2+peiVPbQJ2D1w
 qMDlpUBydL9C8j0gfz5Lx38X/NsQDpMsAZjsoxjjFweorLTWUEW1IH6
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Allow modular clock drivers to use
devm_clk_hw_register_composite_pdata() by exporting the helper.

The non-devm composite helpers are already available to modules. Export
this devm variant as well so users do not need to open-code devres
cleanup.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 835b1e4e5869..11842bce5918 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -462,3 +462,4 @@ struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
 						rate_hw, rate_ops, gate_hw,
 						gate_ops, flags);
 }
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_composite_pdata);

-- 
2.34.1


