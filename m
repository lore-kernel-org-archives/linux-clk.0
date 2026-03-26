Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6C5336883;
	Thu, 26 Mar 2026 05:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501779; cv=none; b=VrKlIBhXxEYVOzIjy8sy/ts/hTEd/XByTvFaFVxgAUCRIstIqRNm4Fp8U4MUXYN6Ydbv9IMwiFykghps0FEW6uv+CiWYbjXUB7CAUOK8teenawHoxgycCDMCu6M1zKOdyqHOKs2ZAWysoHjGtAfy4dks9xXSxGNFMD2b5PiATsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501779; c=relaxed/simple;
	bh=RdXwQI+XXGedLVzuXE5s1FUgXjz5iYqPidXYohs0/ZY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6RjJCuRKwq+vxqwzlEfmfgclrztgyQmK8YWMljVSDOcnWog3CVe8ujpdSaGmJK4P+iXqGSY13x3k7nRgNoPiElIYRt/fZOEaEACjhurbpdcGwBFgiCsjb3I+zQThI2m5bpdpLSEueKiUh98hHrtVYOK7K2RdblPkrjAbPt39Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w5cyC-000000006pt-3pea;
	Thu, 26 Mar 2026 05:09:25 +0000
Date: Thu, 26 Mar 2026 05:09:22 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Ikjoon Jang <ikjn@chromium.org>, Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/3] clk: mediatek: fix gate-less mux definitions
Message-ID: <cover.1774499536.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Some MediaTek clock drivers define gate-less muxes without an update
register using MUX_GATE_CLR_SET_UPD, passing -1 as a sentinel for the
absent gate and update fields.  Since those fields are stored in u8 and
u32 struct members, the -1 truncates to unexpected values.

Add MUX_CLR_SET, a wrapper around MUX_CLR_SET_UPD that hardcodes the
absent fields, and convert the affected mux definitions in mt8192 and
mt7988 to use it.

Daniel Golle (3):
  clk: mediatek: add MUX_CLR_SET macro
  clk: mediatek: mt8192: use MUX_CLR_SET
  clk: mediatek: mt7988: use MUX_CLR_SET for gate-less muxes

 drivers/clk/mediatek/clk-mt7988-infracfg.c | 80 ++++++++++------------
 drivers/clk/mediatek/clk-mt8192.c          |  4 +-
 drivers/clk/mediatek/clk-mux.h             |  6 ++
 3 files changed, 46 insertions(+), 44 deletions(-)

-- 
2.53.0
