Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2A61A00ED;
	Sun, 16 Feb 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731217; cv=none; b=kPZ0n9aBOcAYid2bvc8kpfYaCWCevVvXoi1p381pXc0vv/W4S1rpgGusGKgkvnhaniwJc1sl2e00eW+KrZZ2iqQYNojbRYIMdy5yMsGlNosmNUX7FvOzdm8kRmL5facnv4vtb13HoKB1Lf3uWR0DWdpcePA+e1HYeghXolKdiRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731217; c=relaxed/simple;
	bh=GxmJA29+HiacNFcc1pD/DAk2xoAeB9EDa9VQhsNGzZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMo16ajut9JJHeGnZxLxTk9iGBr2AxkKxMYURnzOyo50bNcCy/ukjgNrRsccMZwRWbeynf4WQRwhzi7A2szfqSrSeAyFpaoOCPTODfO+o3Ly60OJ3nTC1xY3Yx3DKoMtqn07tXamRgNQgz65LMDqmtbYs1FqtOSZDJqdpMo+T1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=K3iTI4vm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H7uFJplD; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="K3iTI4vm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H7uFJplD"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 433FE25400C3;
	Sun, 16 Feb 2025 13:40:14 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 16 Feb 2025 13:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731214; x=
	1739817614; bh=BJw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=K
	3iTI4vmFvxu3qmPRAyN6NKLbUQDs+uvE4PDgBnT1JTOFv+Dki0Id5371AYeYugbB
	maKBucXiOYeXE2qw420KZAhgAyyutpajeyO0padtMIs9cBxtf3GKeLUq14aZpU2D
	qLNDvPi47KymMjoR1BxX1lyteZPUzQy/NPioDGpwcNb7jWXqUMJxQkeiGVEAwoRb
	WfEbqvZDu3ooA+mbD6/kQNIVGw64MMuArZ3Zb4VvPmQYfRcO4Agn1VOyeI3IquFp
	N7h5mbwQpjOoMbdkkjBQJs4ZmxlfIhaV8lkIFjeNvfCvz+nhuMOo3LfkrYxrnCoB
	05n8eo1PcvBVycIMIo5vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731214; x=1739817614; bh=B
	Jw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=H7uFJplDX0y/cWnUW
	8sskksipym/7VyiwoA+cPGFR6fCMDRL9TmA4aHz0oi8tDzOdrTdwFeRH2e5H0VCW
	ojcR32RT5IYoUCA1m22CXvmfSLqspk0bxtqZZpp4d/E+0nAu0S/86H8lQ4kZjQmg
	xu4G6XNOoopCwMbudpCLJflJLkf1Ti/OfJnapjLh/ppF+sT+BnaAPPWoBnFT6cun
	ixUk8LBFyZnWDUwUfB5q5DPm4QrYuuB4CIXHQJVvIdo7q7O58rrJb4EmYrAwRoHK
	+npJ65QQfIhRpdvgjXso4aZ/JVBhLZpepUFomdEzqbp94ypsm+uSjDmlhxs+tPNN
	87Qrw==
X-ME-Sender: <xms:DTGyZ2N290orpzVL4IsITh6Hu_ZwVg6Zz-dYDkqp5X7oBprfQLcVrw>
    <xme:DTGyZ0929IRlCJFfLSiTNJzpOp3oP8eOzbkbCC14F38pbSZmLI1k3eIzT7PfBbggd
    PSyDyqlgJMsxb-ABw>
X-ME-Received: <xmr:DTGyZ9SxlchJi2EFRaaSEQDd1Pql2KZ8AuufblLadY20txgKpid8jBH_aXgijh8w80hF66sOy6g8vW7--L7LTOqrWkF2ClTv42AeWPcqgF_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:DTGyZ2ub1PH5L9YG_AauZQZI8QPFsXA6Jj5PQH9Dp0xCG1RHS5ydgQ>
    <xmx:DTGyZ-cSEEhaTzct0DaM5sv0jDZ-ICWoJa23iqqZrMHCZ-mC-WlpVg>
    <xmx:DTGyZ60yrl-NUxeZgpaysArIa4YE7ficiL2YPqsIo01xv9xNUgiykA>
    <xmx:DTGyZy-TzG5rZISRZQ0eVzy8hlZ3N2X-NXYC9rj5JXXubO0E1dKHhQ>
    <xmx:DjGyZ9kytfZviclP8KqFbYkQpPb2nluA6HKKlZz_JGOB-nyPLClDvPo7>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:40:06 -0500 (EST)
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
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 20/27] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Mon, 17 Feb 2025 07:36:20 +1300
Message-ID: <20250216183710.8443-21-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33 and increase reg maxItems
to 3 to accommodate additional register blocks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf65..317a27cf590b3 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,11 +24,14 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   allwinner,sram:
     description:
-- 
2.48.1

