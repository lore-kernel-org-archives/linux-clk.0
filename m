Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595380;
	b=btXnEmuEn60tB5YixTCoMrpPEmuKJqVCrji2FCroENcCC5MKI8VNncim0L597QQy1LZE
	 t8Pw9di2BttnNRz6pYr1qmPNdaQuWMTpegDlnDzsXKiU4KUYSbuMJMp53QWBa5KDZPcaC
	 Yz5F1++mNxtNAK82Pyp/QKae/VYFtzaCAulsJB+e1Ua0HCsm2rru1tMgA0vZFImjgwkdu
	 FvLn0qTMbrpqObQHiYN7qWcbjdCl55cdGnAljSNReKVpViDLaUaI/GAOqKfSmZUd5cMyL
	 Yvtv6tm5PDGior3dCWo837xM7/uqGr7fmP4vLjK8zmT3pOl+bsVgbTB2h4THhNmURYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
	b=389u1hGONA+MRwxK3vPxTmVKzYdvG2wr37oADiA5Gj3unx/cw7dh+w5XJ4GkJI5VCJff
	 PnwyoLDTTwpOPaqb0L/JYU3f4kWdGNmDR28gJpCMGZ2m8W0r38Fx6k/4AC6pD+wWAWJsS
	 YDHCANnn3xnNLDvnX3BiWHaNOXZc2l57VZMPELNig9Uf/kCK7UAQb8OosfTmfyB9yOAij
	 vrcFaBInwCOx5x7y2vgdjR8o+jBVrpytWkfmzP47La/i37/cClv9Tu5DHmAKE7C1cC6ot
	 w99y6xPAqV54IfwRkx7kqMzRZkTkprw36mY2boxnLpWfy/JXAtlKoezsd9c9eP87dAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DujpyMGO;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE9606A897
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEE9606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DujpyMGO
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14394530ec6so1638068c88.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595378; x=1795200178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
        b=DujpyMGOCXwBxNvFAHhXCzNwjDMLag7g/AGwePRGbvSeJuZ+/oWILTWgni9F3/IqTj
         0KnkDUv/wVZJp8mLg3DZS2jQXydz4Fg22cj42Nxck9LIWMsqflqnD0/ytfmwjyoGwn9f
         NDFEx96DKN/LIfxyTk118ydcAeMHEXNm81eVPLQW1yWSgy/u3Q5NviyZ7gTtFUTk8Re+
         oBJkzhSXsQ87/Ou8eFb47KlJEAwcQ0IpyBnydsmBo1inyUe8P9ZfxJMKZGrAHZKXYV7/
         /ATWRR9qwBJYCHbdHR+bHa2MkmXli5quY/ZxvPa7Xy6/8ykSRjyAp2NNF00PHGMfoLyC
         d4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595378; x=1795200178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
        b=yot9Zsx3IFLEWgeKQAaljEqjM69J62h+DTQRuyHZK59NsYaQl88/wVO08o5yUPrPzT
         PD7Tq+MafRQGAAivrnG6ORvXLKDMvuxC96BNwtRQSF0rO/9ZuAB9QlFuD2vUPegRGqHz
         YXNDq4nmYiS4HOeSzxtEVjnF/h6V4RPKCJFyn/R3auyDtywJzhuuL/Y5S2iWmPmqZqVS
         Ya/bTy3yvxmpNsICp2he0DwC5Um9lr21TAMep7gYWUVM9VRiTbD0KAb3k00B79WvKt0i
         Q83jw8b9mDLLnsisM9nkHzJeU+9w0m/tISU2b0TJ6/a7HGV9olDebe/95CLcudCr/NmE
         8BYA==
X-Forwarded-Encrypted: i=1; AL+hErFImcyIGXHo+9gh86V4dgHszdZAbA4k98/t7m8uBl5erb4e1qk5gO+gtWJEayI5C3atV24wDZLdl7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IQk3nFMxNJy/oIlUSkjh5eFKSEAtA8M834EDX2V89y8RZ4D8Q
	kMSKnilknSUlKTRRCk+Wryx56xbzr++9/euvAXhR7jdcFcTeXnqX+sK+w3XwVw==
X-Gm-Gg: AYBFou2nIVPendSiKj5s3uOctVDTcHj9DcXUHS5Op0KTCDCwx5NKAXk0AOz0ML3ygnr
	AzcijTPYmD8PQCIfJtQ5SsBZ5bkEAMqrab1WCH57trz4eLMzMJSBt2v27JBaZQTDf0LV/xB/Qof
	0KhkMCoK2/BDsWujBqRemTaDE0qgEEWXTVLMydToKz7bhQwcIz8oQyNOvLln6vof6HgyHGuXTIM
	1hsWZ7EhBAhCyppe2drL9/6Fc56epG9SNZqTt8PYz2B32VQRfn2Jfau1GG2h1L4aEw82aG1xFVb
	ukHCg1dm5AcodIb5vk6jvGrI2bsu20lvNZt/RQP7HmBn2Tu+ZH8f6E/VwHWEYQImyO3GuftYgEq
	Tvx00sv3AjUdph41E8Ys7/bDEbtoKlLbW8xw5Rt5C+cpAWO8Kem/XrZ97nByL+nIPs63k9KXHPk
	ZsbjNDlfBs1D/+EYQKwvDkoutXD1Sy10JkIYju5G0FRG3y1sE0UQ2ar5GTKb5szsVeJcmVxgpq1
	RPRnWqykM5WtPbvLORJ1pyS4zPLCQzW/TLbw9nf02Vji5096byiECTUvjkVYJrw72To6VSsSGfY
	PrzhE07Ocd2kbe4qp5Nz3+5HFQVW9w==
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b5030eb063mr2749528c88.12.1794595377978;
        Fri, 13 Nov 2026 10:42:57 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:56 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v5 2/4] MIPS: Skip generic IPI setup for platform-specific callbacks
Date: Fri, 13 Nov 2026 10:42:08 -0800
Message-ID: <20261113184210.470320-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113184210.470320-1-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A generic MIPS kernel can select a platform SMP backend with direct IPI
callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
mailboxes, so generic IPI allocation would find no domain and BUG when
more than one CPU is present.

Skip generic IPI initialization when neither selected send callback uses
the generic implementation. Keep initialization when either callback
uses generic IRQ IPIs, and retain the existing single-CPU shortcut.

Sashiko AI reported the XBurst integration issue; Codex assisted with
the change and extracted-function/build checks.
---
Changes since previous posting:
- Split the generic IPI initialization guard out of the XBurst SMP patch
  as a prerequisite, as requested by Paul Cercueil.
- Add braces around the multi-line condition.

 arch/mips/kernel/smp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0f28b4a62e72..086298146dd8 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -338,8 +338,12 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 
 static int __init mips_smp_ipi_init(void)
 {
-	if (num_possible_cpus() == 1)
+	/* Platforms with their own IPI callbacks do not need an IRQ domain. */
+	if ((mp_ops->send_ipi_single != mips_smp_send_ipi_single &&
+	     mp_ops->send_ipi_mask != mips_smp_send_ipi_mask) ||
+	    num_possible_cpus() == 1) {
 		return 0;
+	}
 
 	mips_smp_ipi_allocate(cpu_possible_mask);
 
