Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956277;
	b=ebclkm7BFfI5aLaE1JeYuKRmlI59pnSXoDXNndh9+sk0bGC7prtGWtsRPyJNeoBF06oO
	 7aLTEjcCvRFjiL23yhPRoDWi53jnbVE/tWu2Yqw5gZtRvpbnvEydbV5zlTgW0zRoywYan
	 r+oqUJJPk1OPwLSh3j+cycCmEzWRztrXEaznUpqitSpPUSzwLvO/Lc8U2NFoU1qF/2uBN
	 ZWbAdWA7uPGNLFS0pFOzFHEE4VqwRE+o1sE/yBkXfG+FzzkydOWp3T90vs/KYfhh2mK1m
	 sKjbUHaJnwuZORbOF+hyZcwCW8FW2diZZMzCugQRaP7ScMs3SiyZwxE3eG7O4iVGmhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956277;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=bj6KPWTo+LHMG++Y0e1ZCHYnbGpBM6MvTOvl5Aw9wpM=;
	b=reOAD9lpdaLG4LeihEyRJRNes5+rx3EP6EjXRbLkDsseElTeOvOztIRBp/X0RO/poNq6
	 3gvris+gMUlh98dMZoDzAnoTGNgJmq0K55awtPlfxvGRKYX6fWnsDb/evQQN3hPENzPM5
	 /E1OFqTIHtzFKp816TptRZwSoeV3vJDt/f9g2StmoPxEc+qhzP065PlKnvEyGKxKBlsCG
	 4sZVNQBeUprvtWiLUJq+Au6kcZ84ZFD9GO7TjPdcr2lVZEvozczTD90AOvy3ogbIUmjW9
	 uJUeXFbQC5a2QNKdmvnnd7rgXKnuAfPTnCLnz6KZAf8I1qfmpztn6BO+DD3rfNrhr1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=LWzyWMI6;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045060A260E;
	Sun, 25 Oct 2026 19:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B045060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=LWzyWMI6
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5If518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:19 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5If518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956260;
	bh=bj6KPWTo+LHMG++Y0e1ZCHYnbGpBM6MvTOvl5Aw9wpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LWzyWMI6J5a0mUiatjH6qhN4sQFR2QFkXuJmA8GrsbpCN7uq9KOfNrlHQ8VJDOxnO
	 pTPrV6Wh9HYWAAqImr8CMUoDM0Lb1JWkriB1Yh764aNMSG/RnrgncF/Oa/riO+7/HM
	 DGJjnh06KhGm7aBfvLTkwynH63VzxwBbvyi0qMGw=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 6/7] ASoC: meson: g12a-toacodec: fix the S4 source mux read-back
Date: Sun, 25 Oct 2026 20:24:03 +0100
Message-ID: <20261025192404.209695-7-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The S4 widget reuses the SM1 mux, whose enum reads the data selector at
bits 19:18, while the S4 match data writes it at bits 20:19: the S4 lane
selector is three bits wide instead of two, which moves the data
selector up by one bit.

Writes therefore land in the right place but reads come from the wrong
bits: selecting I2S C programs the hardware correctly, yet the control
reports I2S A. alsactl then stores the wrong value and breaks the
routing when it restores it on the next boot.

Give S4 its own enum at the right offset.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 sound/soc/meson/g12a-toacodec.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 204bf8654d2e..db7a4470395f 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -21,6 +21,8 @@
 
 #define TOACODEC_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
+#define  CTRL0_DAT_SEL_S4_MSB		20
+#define  CTRL0_DAT_SEL_S4_LSB		19
 #define  CTRL0_DAT_SEL_SM1_MSB		19
 #define  CTRL0_DAT_SEL_SM1_LSB		18
 #define  CTRL0_DAT_SEL_MSB		15
@@ -126,6 +128,19 @@ static const struct snd_kcontrol_new sm1_toacodec_mux =
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
+/*
+ * The S4 lane selector is one bit wider than the SM1 one, which pushes the
+ * data selector up by one bit as well.
+ */
+static SOC_ENUM_SINGLE_DECL(s4_toacodec_mux_enum, TOACODEC_CTRL0,
+			    CTRL0_DAT_SEL_S4_LSB,
+			    g12a_toacodec_mux_texts);
+
+static const struct snd_kcontrol_new s4_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", s4_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
@@ -146,7 +161,7 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
 
 static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
 	SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
-			 &sm1_toacodec_mux),
+			 &s4_toacodec_mux),
 	SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
 			    &g12a_toacodec_out_enable),
 };
-- 
2.56.0

