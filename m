Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CBA372696
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789195261; cv=none; b=KeusjZTq+wLVoQQi4Wf4QRvN77LVPauIIFbVGQTGU/9AiDuS+SAOnrk9qwzr6KtW8sW6sRDIrKb/+WLmW+argY54NV/xG9+1UUxlP/U9Rx7OdpuRDOwwR0LnN8UQ2PHbMGa5eH59fHPdup8TS34YbB1pdJurGtHrGYKMuupwR7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789195261; c=relaxed/simple;
	bh=rK3LI6EEJl+1gc/J0Nqb7f1MnKq7lREyQo2mSnW3Hpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lStXdRbmz+DDUXYO4IgUPhHMWTG9Fev83kCBJ12mVQ2Zot+6ok0VsErJjm848ltZhnuDKSLSRedoCFsQVGf2w0BE3MGlcSo3pZuib5YXPESnWc9WT1G6+vnzy1dtEMeOwIsmmlCalSdI//qCyJHCYh/lPB2vzgUY4KINVoXAy6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQ87XUg+; arc=none smtp.client-ip=74.125.231.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ87XUg+"
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-7f66624aa21so346566a34.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195258; x=1789800058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=;
        b=HQ87XUg+C+/FcxQn0aTEfApjtD4uPso5oIWgiFI5xlDiy4I2BrztSeb/7OBTlX43WW
         FzrYf6qlz7UwIaaTyTonKNqCCpFRn/zp8PAfveRjub9lFyYE2d5YaCUw779hIKlQ36u9
         YIKkMSCFUGzLc5c/umWzl9VjI5xNyxOAn748lkHTUFrbzApzmMrUXLuniVSnUeaWoD2/
         65R22BPe/NlaOcXlPCIRnnMu7LpsTQRnO1l8U/ONAGagN5EBYguFDw/FNrOohjfwBMtw
         UPGseuLxmFoCEPMnESwKH/0UgtvZNNZi8UCeCJQ0LmbI8oCDO6VG5V/doMhGfl62iX0T
         YVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195258; x=1789800058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=;
        b=Is4tso91lAoR8yjONDZNRVpP00z4lM/DbTOf49VTBSXNZ9ZHC2pTOAh57M2wMMhsoq
         YnQGMyWrCXCPRfN5A3IweHY63wLtNvWIJ4jp7RATTEekcAMyorboKFsLt5BdrXtAchIL
         0Tu7Axb8QaFoOQclSnoeCUtP4dHVp52HoUq5RnSmBJrTcqLTOPfomkJSSj2f9p0S4gRj
         WnceNN94uEp+BY8VcBw389RzqoYULUnMt4S6G2pXCfNUXI4ZfvEwydMoWi9ZM2PpjQTH
         +Qt3YUU/f4ioGsHYq7Qv0/B0XxMzUhEwGWO0mctx1BWzynwmhHWHymdSg97wH+mi+SAp
         qkIQ==
X-Gm-Message-State: AFuF++kj9/qRTEuahFj3mZmQposdmiPfULLPBXCPkbqgmetecMBmuaeB
	31xY+wcJdnckLt4xzS3kKBEPxcixJXH9CJLz+yfajSBXJZ8MEVy3hY2i58i3CgEHK8U=
X-Gm-Gg: AYBFou27IcLdSNKgzv84FIB4+9xyE/AzcHxPchMge5KoneFmzyGMP3HdRy8nzthvenX
	xtaJIUJoNdwRy35ne75AQZfPRR+aagqkMZ4LQ4e7ypFLDX37wv0ZfFaEvJH27MrfC4xF087Q3iL
	zab6uO/D0NejFTxBJfrtf8PWHTVIKIXQR8P20+WAIrvrWhpwMcaBGVvJJE8VzOZ9Tmy/B/vxhX6
	uoZkTtfKzsBwj/ieTQYF8kWIXkcWAd/r+npP4P9fp2fuLbvZuRfWAY90ZY+iIoZcK6QT/luvJ0j
	w/c7kcoVfO4f1a3j1FguRjdYp8AkXwYU+U1s6u1zw/Sq3ELjcApuHKPAspeIwcUy1o7dx4+Vw0z
	am6Dtkzxan/kQyZB5LuvFFQM3Xr0C+bczfZ5zEd6Y4bPW4tb1K8PombJWu6wpfmuGOtRI8ySchS
	xiOMgyTm0lYcXVcxy3WTBJKnSyDGkXAQlB34TXFEQj29m2GhH+iTxybd/AUjgMFTtbJk4=
X-Received: by 2002:a05:6830:dc6:b0:7fb:547f:98bc with SMTP id 46e09a7af769-8059e14b758mr1096817a34.5.1789195257717;
        Fri, 11 Sep 2026 23:40:57 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:56 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 01:40:37 -0500
Subject: [PATCH 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1697;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=rK3LI6EEJl+1gc/J0Nqb7f1MnKq7lREyQo2mSnW3Hpw=;
 b=aEEsL7VWo3CfcnRgQNR4pSp2BW0HTS7IMmCb+Oc21O48+SIoUTLwp4mzW8r7juB7bII0JxlDE
 J6mym376UJXBuM4QPyxPLfo+9VhIWv/sGKsTw5ZFgYRdJ6Q1/Kq1x2Y
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
Assisted-by: LLM
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
2.55.0

