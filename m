Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868FE242D77;
	Mon, 12 May 2025 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066317; cv=none; b=SAPBHwZ+KQ3rDIOyJzK8cDj1fLLotQ50Cr0u/VDvomaM2JVphZ7k/IKFKNCqwFcTV9uJXBg5+bMYn0DlhCtT/BSnV62+40cRpQksQgAv4sLCZRelnWTtsZRMy+ergCjtSp4ZCfyU4lXjTRM/Lqc01ic58Q6s0xAfSL0DdNqVFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066317; c=relaxed/simple;
	bh=AGq95O3KyZmWjk2iYwpbAiyR9nSg2nnoAy8dCA89qb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rFRzXNGo2tHIIxzu/ayXIcJJwCu50Hsck2zerzTkRTspk+VsgfLXlpQgGsOP0vvJ6MxPZF3ekG8BKcP2ktm+UwXaLukviilWa5oaHU6UfsNHwJ6kkxCrz0RoRGWkve1Oa8knNHPk1b+PrlLQ5qgU6XRx6UTlYASysxT39E0oG70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DF8C4CEEE;
	Mon, 12 May 2025 16:11:55 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 6C9195FCCA;
	Tue, 13 May 2025 00:11:53 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Chris Morgan <macroalpha82@gmail.com>, 
 Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
Subject: Re: (subset) [PATCH v10 00/11] drm: sun4i: add Display Engine 3.3
 (DE33) support
Message-Id: <174706631341.3565911.17660791573528353464.b4-ty@csie.org>
Date: Tue, 13 May 2025 00:11:53 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 11 May 2025 22:31:09 +1200, Ryan Walklin wrote:
> v10 of this patch series adding support for the Allwinner DE33 display engine. This version is largely based on the previous v8 patch, with Chris's changes to the mixer bindings in particular from v9 to add names for the new register blocks. As discussed, the H616 LCD support patchset (which are largely device-tree now that the clock/reset binding definitions from v9 have been taken as a subset) will be sent separately with the rest of Chris' updates.
> 
> As noted previously the new YUV support in the DE3/DE33 and RCQ/DMA shadowing in the DE33 requires more work and discussion, so that support was removed from v8 and this patch supports RGB output only.
> 
> Regards,
> 
> Ryan
> 
> [...]

Applied to sunxi/clk-for-6.16 in local tree, thanks!

[06/11] dt-bindings: allwinner: add H616 DE33 clock binding
        commit: ab1a94b504b6f19c294786b5920574fb374fb5cc
[08/11] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
        commit: be0e9a3727872783bad0752dc82e0857f4776049

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

