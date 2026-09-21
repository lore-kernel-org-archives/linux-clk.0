Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FA64746CC
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986345; cv=none; b=bWbb5xfk1Im1YzrS1fiPUMEQF68TVa1Jz9XuT63jt3uAalUWOKar+lJsQ9UQXnEWaOhKBweBGi2s7ylCqJUbNTi6lchzdeyjsegVnEFmedv8uOzuyjAG7lhmqceCAnQuqwLf+hzLvnrr/Yx/rZpva8mV6hKEdIWLsNuyL+o1zbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986345; c=relaxed/simple;
	bh=1aaWeunmdxLEF+OUt09oPIltpF+Nxc0zKIMezFJWPBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+umwCTdx7Z6aBvH/orTELuiR0cBsEeTCMyyObw5AYLUJAuhZq73yBunAHnPhxlVOgADBQVJUsNIClfL2+cvyWRmBXSjtKmJpHR0RH48VdMdbElUMt+tmvsTEhcXRYGfwewao/6+1cr4bOlhcRVH+HexdIFaP+iyH/PfOQGGSFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMdN19M2; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMdN19M2"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so2319655b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986343; x=1790591143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=;
        b=dMdN19M2ytLdg8u40MfyI4omxTam6rciRth6MVIFCvP4SjCvKcaGJCwTZrHEA1siTG
         Ldp0ZHCl/ze+KNj8HFLOj2QmvYOHAUNWs5sPAyFnjt3U3lL761mwbltow+CSWKD9EsXJ
         Cg4kRr1QKjP0pxyTuKGQvcACgeWKvzMHNevG7ilKWAse08oyTorxeuGcD6Zpw53CAter
         nI1kfA2OawpDUUzWsZo1QqsKcuPqxUQH2IihftAYtOqS6mvvFPi2E1g2aipVXgClbzzi
         bhqicSTB4/jrVfPFemWKBP9dQPlTOSAmwfYMoA7a6bzCHWxHP+n7vjpkSQUffnCO/pBp
         v7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986343; x=1790591143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=;
        b=kiDPwi9KOAQlKc+jdWS4hW6YgaVHz3PGrFSpBr5tBTYMZVd+wGkJhJc6J4wGUJUaFX
         TlTp9jQcZIumAtd9MgqWVLX1C6qkU1eqm3CBt60VhDqVMwYJJMJOBsoaGepIcbJ/0a/L
         4NxY7KtQGrr2aZVk+11qytto1KrjI7FLb9iXjiSX/qHxkJstJfTVWsnf6YTi+obqsPJI
         EGeO8Jo00vQFxG3e3MG6Hhta2neCv5Sk7d2FPOcr5A57VM6QuJqC6AWmS5IaU03WiE0J
         Z9kTJgCDoj/Ct0/aeOcgZxnJQUCLFmCgv59NWJtvE8TYaII6N7UUo8QWmkR7RcCohiES
         smaA==
X-Forwarded-Encrypted: i=1; AKwUvBx8O4VWACOqj2XtV1mu5xsomMDofMKXZacSkKFE5OsDpPAkf9j6NJzXET7O5yk+JeAQZzluP1cZH9g=@vger.kernel.org
X-Gm-Message-State: AFuF++m9FHw/1g7kSDSpuPDm7nYIX8RRJ7VkXSLrVLMCxJoIRzCoDRcm
	SfWJ+mALr2rkJFaYnXVgJSPA39IVhDUSkOL3cNIoUKMTDkvlX5pmb6rM
X-Gm-Gg: AYBFou3DaP3imeIl8A6YF75gYcyWkFIXh2MxRxzswu848XOSzd6TXCe0noECa54k7Wv
	zWO3wsldvnoOYGhwn1/d11l69u7yeEGc8DfEQzaUCIHPEuhpZIMWNdnaXFn8o0By/a9m/YkNBE3
	t4yYvc3CC6/0mO9lS8pvTcrW/R4jqEY9urLho8GkVP0HIu41R9ETqb2JCOOcOYH+iLoOqASE5zd
	Or3bVEA3LSA0FiFfG/O+TgECz+vA3hn9z4E+OxQPyEL5BgXRH7FfGNpvCGOfAGVOT1hHxTos2iM
	ofVhirvVup0xv0byeK3RWvH8b/8cS3JJQv3VjsUjDTCu7/sphHRfPBKU3aSJSWLSbTXjLRKWSVe
	sPBo+h8kog1A0OEeqYLhekHl/w+lz8ZwBb4phYYrb2VGYxI64i55cFD2LRqzXjRfDdlaUzq7TyW
	0DdIxMCUvDq+ENO+TMAYRaQ94Foy/2jshRR1NHS7ZD70POX0GNgW95MPFPQNgXlEiIAbX8OJ957
	Euy/l4isravY9OUujZ9u659JPrm5s76Gn2lDt0=
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-874dddfe1ffmr14902028b3a.25.1789986343595;
        Mon, 21 Sep 2026 03:25:43 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:43 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 5/6] clk: mediatek: Reserve missing MT8196 MDP clock IDs
Date: Mon, 21 Sep 2026 19:25:21 +0900
Message-ID: <20260921102522.1640072-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reserve the binding-defined CLK_MDP_SMI0_SMI and
CLK_MDP1_SMI0_SMI IDs with dummy clocks in the MT8196 MDP
clock providers.

These clocks are not implemented by the current MDP clock
driver and have no known consumers. Keeping the slots occupied
preserves the binding-defined ID space and prevents out-of-bounds
accesses in the descriptor-based onecell data.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-mdpsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8196-mdpsys.c b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
index 7667d88f0eb0..2d8997d34201 100644
--- a/drivers/clk/mediatek/clk-mt8196-mdpsys.c
+++ b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
@@ -66,6 +66,7 @@ static const struct mtk_gate mdp1_clks[] = {
 	/* MDP1-0 */
 	GATE_MDP0(CLK_MDP1_MDP_MUTEX0, "mdp1_mdp_mutex0", "mdp", 0),
 	GATE_MDP0(CLK_MDP1_SMI0, "mdp1_smi0", "mdp", 1),
+	GATE_DUMMY(CLK_MDP1_SMI0_SMI, "mdp1_smi0_smi_dummy"),
 	GATE_MDP0(CLK_MDP1_APB_BUS, "mdp1_apb_bus", "mdp", 2),
 	GATE_MDP0(CLK_MDP1_MDP_RDMA0, "mdp1_mdp_rdma0", "mdp", 3),
 	GATE_MDP0(CLK_MDP1_MDP_RDMA1, "mdp1_mdp_rdma1", "mdp", 4),
@@ -118,6 +119,7 @@ static const struct mtk_gate mdp_clks[] = {
 	/* MDP0 */
 	GATE_MDP0(CLK_MDP_MDP_MUTEX0, "mdp_mdp_mutex0", "mdp", 0),
 	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp", 1),
+	GATE_DUMMY(CLK_MDP_SMI0_SMI, "mdp_smi0_smi_dummy"),
 	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp", 2),
 	GATE_MDP0(CLK_MDP_MDP_RDMA0, "mdp_mdp_rdma0", "mdp", 3),
 	GATE_MDP0(CLK_MDP_MDP_RDMA1, "mdp_mdp_rdma1", "mdp", 4),
-- 
2.55.0

