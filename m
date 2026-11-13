Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602114;
	b=P6mH6iwXsmdSn7a3aqgSLwyS5uJfpUAQ5dtQDig1O8lQAjKDMvCQWntRt7utCrcw8ItZ
	 FF0XpwsB4ITXX/gIfwL0uvYK5uAdDvWaZhE+c5fHOu/t6KEKVK+0SEtYpLWIF0oe5TS2/
	 BlLtI0n/ufRegCcN/1HDyz5aKe9nueXjVCv48OB+o27/LCOs7AuVwkUZvOLffVQhv18hL
	 ZYivr019Cv06exu8qXogFP0vZxzn9JHhebw7em1lx2iP5ngOARf2bjZIQkmZvEhiFbNH3
	 8wP1kedm+Dg11m2Nh5nBSd6k9NQlwckcumzcidOp8qGK9gAk946DFu9cbhXtCwhce8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
	b=VresHC+0tWCUUdwcUMsx797cCd+B7CAmY0s3xVWO4/2ykEeVVCGT0GDkn713uzpe4weR
	 /nc47iVhtEbs0VDGz395UvJ7+12BQkyYC6L3GQwYvGUjGtSprgkMK5TmOMjygTvK4wXuo
	 +UQlUJ4+l+Tg/2LfX9PJ0npll/Dqej0I1btNVyutI2AMaI9WO59mEY4Y7Un+hgNps5tb5
	 CjhexW6bIjYoUm7W6IaC8LfaHvbWb5YZxGFN0SEQ+tddImVygcQkVlRCZaoBJpBTR22Rl
	 CO12VdkrSt2fXhxF+U8gDp95YvkM5JrWMYejrGv0+QtqVUTXlv8GVopvKa/f7FA6saA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyARAhSR;
	arc=none smtp.remote-ip=74.125.231.193
Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58A606A337
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 20:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B58A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyARAhSR
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-539d2baa897so505669b6e.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 12:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602113; x=1795206913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
        b=JyARAhSRNNQZm/PQ8PycF6gvp+ozKGUNMr+qEuggpUblBZNKsUaYmg6O62DVZ+dOwj
         PbDGEeYJCNqtwQlhhGVES9upVFcZjYtaqnUYMg/EkjMNHK58ZKgln4EKWTcndpMxeesk
         uhSs92sVD9ub5eLQiAt2XK+VXJcuxTUXdX8aPOoVq5Ob2VrQ5frB3OKL9HU/aVBrJAR+
         VAeJo3YDhGyFj+Vh8R5uYis16dJMJC9Z6HOAVBCtI/CpibWHjASiDUhmu/N50CHdp34S
         NjW9C37iCVouYwntzFqj7UHsjtJVj41dfAKoN3zuL+oPButyoLj+fUaakJF+YfKUNagB
         Zz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602113; x=1795206913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
        b=dp9WuNqbDBalaY8sQaTox0LhGZ9u+Zj7tl3i/W5Ndy7l3yczDrgbgfsTh+FM+ySJq5
         O+/2IiiShmENWiTeUXfeu9/EoarcvQrohD3XfItZ935KToCKRPR1ldiJ/9++elwLdH4/
         g4LnR07wB9wJrU7N0TMPAwqWThqLegLqXD1FlObaRE7Yxqyum41b6th+YMOWgACGnzg0
         RdUuUr7S5PVGYqEN6Y6Ni0ht70RjPumDku0RjHVuKKPlt0rmuSIyHxRyigSN8cBFIotg
         B/E7M2ZoTlkR7d5HHA7fixQIDVSWSi6qYBJqZ2+e+3aJY0xUwyj/zMVJnuYTFyWvHrAq
         Y/Zg==
X-Gm-Message-State: APuU4Z+geuQqo0Aw46AdKHi8duG00EUoBs8FbMU9EwhGw9wswPNqjcKL
	61DiweBNpCQLTmc2uphSPCOeVrGPi3Zugurtnfenuzl+gBIM72ebcjXV
X-Gm-Gg: AYBFou3yCXjIlCcECgIf8/aiCNXabGv2kHRqu5K/QHQjREvtkYgeQeqgBdkYIuKx3wq
	kbyrkFp4b3hWaVZFPeLj3K9zeKiDeAv9LhR2kVdcxDxh0jJFKo1hsRjNRKWeYH53SgOOVVuq9RM
	lua8StQhYss7H5WP1pODQDuJXlhitiui375/GL6jk9s9d+e3eEsEClLLz3exLgQQd0KabvfFaOr
	NRFgLu54yHo7EWc8+aNPt3+LKT6H3qSN5TdQakVJymwyDriZnh6ZH2nwbxrvNSEjZXa1fJ8dMuH
	6F0KogoAY2frCjx3IaDfGDZLZjkzPgM62WxdTEAM8RT1pFWO9Aq66aWe4SzhajOoZfK/Q/uw9e+
	M4QgQ51OjqDA9GMbJ09eMLWEGKEA6zm9/a5goQ7yxsUk914wJUcdb4EoSZIrIoAUd70H5biMm62
	tbWzBelXQMSRzs86ge19I2PGjioGDMxXnIcDb6xTYspTyWDs8x6NUBVv/xv5slOdssmU6ZQqAi6
	yt6dPwqI4xkgvl0SJwP5OUdR74ycsEicMc/U1D5pde5Qxqm9NEZa5UQt+fOLI6EBXODsrcIZPXU
	nhXJmwCmbQuPEy+VQEGYOPxHYOctg6k9cW6fAnP9gQitcKku2GIjej88rTlEpMU3cGmDYA1rvfs
	jgfk7l3JzapPeP0tA/sk=
X-Received: by 2002:a05:6808:10cd:b0:4ed:7045:d3bc with SMTP id 5614622812f47-56e641d6c13mr3204181b6e.32.1794602113421;
        Fri, 13 Nov 2026 12:35:13 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:13 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:34:55 -0600
Subject: [PATCH RESEND 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask
 width
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-1-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1762;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+CADWjqc22AUSeVeKeNbBWk6vnVbnoxXOpZ/q/waG+w=;
 b=iLQXE6+fT67k/1+QXFmsj0CBbRIh+BBShAboAlWwKdNv6JETp70VldtQbm1fwLYVRqDFJsRNd
 EbaohlTqIw/A4R5rO4Jb0oapwZN+1s1+IeGmBrmEnDmvq7F1aGrFtC+
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
a status bit that comes up once a hop has settled, and new_dds from
mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
never matches and every hop runs to the 1000 us timeout. The PLL does reach
the requested rate and clk_change_rate() discards the error, so the cost is
1 ms of atomic polling plus a warning and a register dump on each rate
change.

Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
with GENMASK(20, 0).

mt8186, mt8192 and mt8195 share the constant but are correct, as their
hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..327240cd34fb 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -100,7 +100,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = 0x6003c97,			\
 			.slope1_value = 0x6003c97,			\
 			.sfstrx_en = BIT(2),				\

-- 
2.56.0

