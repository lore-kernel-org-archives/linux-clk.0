Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84FE1EB193;
	Wed, 28 May 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424305; cv=none; b=Zod9r5/GKfKtSV7ZWNtHxoRJBHRC/lUBXQC68KPzXneH+A1bWwzvrvAsuxmKfqsHUizMyglu/cgqz3mTkxEd7NRJJahpTjUghBVKKUtQor1Z4tGE2baZJtSPubG5dkg0zVdswvQIFQXVdX9fZktioQkRcGdE9lKhLe1lUymdfMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424305; c=relaxed/simple;
	bh=Kf3A/6Ulzfar2XtF0mo2HMHaS+2CAvVsHGsFV8dZwrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFSEtKHGGOVo7MR2H+lNp3ENbljuOTZRfre3CHNI0srtax6oNq/1diEi2ugsWvpDOTu9EeNvAMm5T62Ddf5nqUu64zvQurhiYja4zhfNrPfOOf+Q35b9lEtyWHxGvTThK0cxqz91E9v4a/6HyaPptf09/SVrVJFO0E5aCNEGy5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=O/VLU+oU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CriTHz4j; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="O/VLU+oU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CriTHz4j"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 10763254015F;
	Wed, 28 May 2025 05:25:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 28 May 2025 05:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1748424300; x=1748510700; bh=zBGKEikn8s
	OkH8ifRQ7NlBifMPHUZcjmHH/o8wnfxQo=; b=O/VLU+oUWxZk7sqparaKE5qfyu
	YoOpgNPhu262RPk6CilrxbkzaYhBa5YQYi/FMyZEtj+xTMAvPdF7RVe1LlQCOFYy
	ikdgMLcMJdfr2wf+MpcLCjF72rdZwI/7PMosx6ncPOENkAust6KkFeeBzMAv37cn
	qf867JHUIJ0iv/fI+WNn9odm2nRyIWY8UHILRVO+1pQiY+pKcgBBmXve5LBk6pla
	SAYpMPPRAikWwEwxOiByL2Myq9zQJsmVl9FX3PpzvIFYjJfp2E6SLBfPHRKo3tCX
	jy9aLcEnLMNCj4C27pd7aHscBUwjkrT0ssdb1VxtGd/dyEKg+SuMffH9x91A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748424300; x=1748510700; bh=zBGKEikn8sOkH8ifRQ7NlBifMPHUZcjmHH/
	o8wnfxQo=; b=CriTHz4jm1M3j/TvCn02m1RyagJFon/APVekoU0dUi0SZbe0jcV
	X8ECpsupQLZzpmewxZFhX1U7Vro+fHEULuQOILnpv93soyM+ATpczIusCMIlU3qq
	Xj7dnGZIVYmKG81Hg6QwZL50wLz3IDJM1o2wSMI2GiLWVtZYyWGhtjIXFUlicwCC
	F3R8CxxNA/YprKncCrnxbPhnpJmD8YyuDq80iXLf/huQH64ZCnPrktLODmIYhWsu
	X16kgLD3sWNYq3MPHjoDncXVN+zKyTTWdYNZWgt+vWSAnHwIVbnN2cnHM6G0tiyo
	n6n0x1HIR915xUBT0LX16QmM4YFsl5ioFvA==
X-ME-Sender: <xms:a9Y2aFGKaxL4GsWdzp93Xp8LObzHvlxEtJF5KeLab-7MTIxZ84tEXw>
    <xme:a9Y2aKXGsH7FcavMSBnswCaWfdBlxIIyTiCNcRN2yyNOeGumNPEEe3VHvy04ICwoU
    QM7cZ-MafRRKnBuSA>
X-ME-Received: <xmr:a9Y2aHIqOfEEUrdAxmIaDUhb0aoVYOG7RO5vnDgmpb_qP20bVpQKPWN2WsrNdI3hza6qUlOjaFe9eZgJeYieDPfqAEM7iJJmyo32jMK3QypN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdeltdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    ggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnh
    esthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeu
    ffetveevgeehhedvhfefudduveekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshht
    rdgtohhmpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegt
    shhivgdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhu
    shgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpth
    htohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhk
    rhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllh
    grnhgurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:a9Y2aLHqdFO_JkNcTpm99HFf3LVwJidnWLb2wtLlsY2bOmI8zcxV6g>
    <xmx:a9Y2aLW3Eqkg6eukZiKHTQK5GIrdoA0z_0e4dULxg7LRaluSRM2XSw>
    <xmx:a9Y2aGNyx5_7cYUqgYvsVMZ8KEA5P8wS99fXRE85Eqml6hrO6i0mVw>
    <xmx:a9Y2aK03kvhg40LpptJsDHZsjBJ9_akNvbI2anDOnwwdvAWpa5uPeg>
    <xmx:bNY2aBciyYTcOErPVoeyrRPHSm1oSMqb7sIc63L-Qm75xJ-bCPYC9CWH>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:24:53 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v12 0/8] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Wed, 28 May 2025 21:22:05 +1200
Message-ID: <20250528092431.28825-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

V12 of this patch adding Allwinner DE33 Display Engine support. Just a single change from V11 to add missing documentation for a new sun8i_mixer_cfg struct member, and add Reviewed-by tags recieved on the previous version.

Regards,

Ryan

Jernej Skrabec (7):
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add mixer configuration for the H616

Ryan Walklin (1):
  dt-bindings: allwinner: add H616 DE33 mixer binding

 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  34 +++-
 drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  33 +++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
 8 files changed, 225 insertions(+), 63 deletions(-)

-- 
2.49.0

