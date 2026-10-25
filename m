Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=81.169.146.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792955940;
	b=cA9ghy/x5TUq+QHaqCUZHq64ut88ZQ5ngmxQdrlWm4rkhuT4twcpqNHA/Q3L/LyOt07p
	 4fL90m6MV2VgfboPikdjopwor1aHU9/AEf/hDi/A86t5daThxcLKbBafS8HWExWYOVf+i
	 Pc84mX+MDNfe//HTWtpZKnrDZZUWglAJQlyjZthi86XSaAjX/Q8e6IOOtGKCZCR6CKiuK
	 jjvdY6DqCJz/22iTOmmzuy8mGfCXDiCDIN5j3cVvhSXLz3knU4pUnPz+iquYZaW2G1z7v
	 Y5Sbwygg2dGJ+EueFjgB7CS4nhc3/LDrFsICoS+ZMvntcZQ/S3W1ZUA9lIy6ltTa/iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955940;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GR1Zkr3JOGJ3P9/L9tpJQObHGTH2vR+RT1E9tq2bJyw=;
	b=0jXGbqcxrzO45sfCKQy532mNUzVRnhl8MJYz+kf8WddOCxRnnxrt1OGJahpQEBz0euIc
	 w0/+D8pwYOvRjbypDGQYXzQEHimzNYMKlEpizJWuniuSvV6iuqBT/kbahn2df/WLWlSOa
	 BSjXZ1SSpiMSAWR43/BH0EspU2xUBCyhyeu8gtV9h9YPAPWcRMvw1fQTtcKbUkb4TxLq0
	 jJGfN0X/XjSYUrLnCj5B9GSZ/OSZhDa51NwcFINbZVDGBnP7TQyH0+YP0iHIgKLFs0u5B
	 NxVHLxeAvlHwDQfA8nkOLt3eWRD9dIt0lwJMM34r/UtgtxSWNm7z0duBn/gF2T5rbig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sT3iznNo;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=049zk7Uz;
	arc=fail smtp.remote-ip=81.169.146.169
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE345606A320;
	Sun, 25 Oct 2026 19:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE345606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sT3iznNo;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=049zk7Uz
ARC-Seal: i=1; a=rsa-sha256; t=1792955914; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AVz3gPb4Pfxj07mSLC9cDHhkDFwEJPE6S3vdSG1TXwTj7vvf8dFSkzPKA45qp5X7e9
    GD+GzuAeQTR/ZdKPRfiT2VVOl6sgdZJ6b4vhsYebKa3TKiPkouHSn7OpDT5vbeLrpLSa
    2uGY36T6TCjPW+QWPbAcYg3pRn5JubR7snsKNvaT4r/SFeUWWIBcduV+LIei74BLg3dF
    Y1r8gCDSNKYYU3jKfWrnqn7vYxittHrPOH3vZ+7XtJWrXsbIkNoFp7AapLqFjsTu8KYh
    LbSNuN6ciZtFC6zZ1b/x467+PJWnsB9m7djMHryWC9ZJE0UDj21n633aZjyi3SPmjVXw
    w3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GR1Zkr3JOGJ3P9/L9tpJQObHGTH2vR+RT1E9tq2bJyw=;
    b=B+FvJxVNf9L5V1AAI2yiuW0ECe73CV2h3JEjQWrS6Bs2sZgOS6iBDVR1UgpSAOA/1J
    QC7LPZWF9yfsGvEWL5TGWs1qH9KrNf0OO54fW0udKSd7d0RQKmyxYMhB8xAjhO+T/IKW
    Yv9MfHiewG53kXyNy5MsEaTRkwsm2fYd+TbCS4B3yAupL2m7EmbfBNhElJsxo7DntUnl
    Qb6YNBws/I1UJ50N+RIykmhVEmNxVaQTX/PvHZ28dwaQ96tOU5KNt7Gj0o4vQNnYDG8E
    2a+3tCxGASOhqCanHi6bD0fN4Qm4k/txgvfXwLrFsEbPMSx6GUgDDDhb0L2wLXM/h0xs
    NJSA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GR1Zkr3JOGJ3P9/L9tpJQObHGTH2vR+RT1E9tq2bJyw=;
    b=sT3iznNom0cLqGrzyM1/j9ZzknMT2aRW3nXOr0Mo5cN8/yth1CECogxeL6HEx3aXxX
    UQk8Hp5OxLVKw82b59/amrZT5BwQP2W1Nm491t0VLpvjaEzbKRs0chLR5B9YS/2AEtnY
    IaJ4aGD9Ab9Kcx0OcvbMqE4VcTksiDx7ZFjXgm5ALPfMUu2oJNf4Uni06gAfZrRotRSU
    Yv1J5ua/TmK/Kia8CLSsaDMDuGjo/9tPYVAG8X1h6oVV/bAxBiE6Gyo7Y6wa+tsr6GuR
    jmpjpm6atgmM7woWkzl5OneWxz0XX4m7993Q4iE6JLHEL2p0l9G1AGbq09suzmeuLPRK
    eKAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GR1Zkr3JOGJ3P9/L9tpJQObHGTH2vR+RT1E9tq2bJyw=;
    b=049zk7UzReZmTCnsvovAwmwiyG80T/J7e+dsxQ+jR3KL7VUAc+T2WGvqSL+nusTpti
    fANauiG7U1qB/QwKObBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJIYzQp
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:18:34 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	Paul Boddie <paul@boddie.org.uk>,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 2/4] clk: ingenic: Add Ingenic X1600 CGU clock driver support
Date: Sun, 25 Oct 2026 20:18:25 +0100
Message-ID: <50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792955907.git.hns@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

From: Paul Boddie <paul@boddie.org.uk>

Introduce clock driver support for the Clock Generation Unit (CGU)
found in the Ingenic X1600 SoC.

To support the X1600 platform, update the common Ingenic CGU core
framework to accommodate a secondary post-VCO divider (OD1) within
the PLL configuration registers. Additionally, prevent a NULL pointer
dereference in the rate determination path by properly supplying the
secondary divider tracking during PLL calculation calls.

Implement custom handling for the I2S clocks on the X1600. Since
complex compound hardware dividers are not yet natively supported by the
core framework, explicit M-divider (mdiv) and N/D-divider (nddiv)
structures are introduced to describe these specialized fields. This
avoids a compilation failure and enables a stable, though limited,
division encoding suitable for current needs.

Furthermore, this patch:
- Fixes the gating of the I2S0 and I2S1 clocks, matching the control
  bit behavior which functions as a clock enable flag.
- Introduces the custom OTG PHY clock operations and initialisation
  routines utilizing the hardware's OPCR registers.
- Registers the independent I2S0 RX and TX gate clocks employed by the
  X1600 peripheral block.

Tested successfully on the LX16 (X1600) boards and CI20 (JZ4780) to
not interefere.

Checkpatch complains about not 4 lines of help paragraph but the
style is the same as for the other machines. It also recommends
using 'unsigned int' for the new struct ingenic_cgu_mdiv_info
and struct ingenic_cgu_nddiv_info but this follows the style 'unsigned'
of all other structs in cgu.h. Finally it complains about the empty
line between struct ingenic_cgu_clk_info x1600_cgu_clocks[] = {
and the comment. But I think it is more readable this way.

Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Co-developed-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Paul Boddie <paul@boddie.org.uk>
---
 drivers/clk/ingenic/Kconfig     |  10 +
 drivers/clk/ingenic/Makefile    |   1 +
 drivers/clk/ingenic/cgu.c       | 150 +++++++---
 drivers/clk/ingenic/cgu.h       |  42 ++-
 drivers/clk/ingenic/x1600-cgu.c | 476 ++++++++++++++++++++++++++++++++
 5 files changed, 646 insertions(+), 33 deletions(-)
 create mode 100644 drivers/clk/ingenic/x1600-cgu.c

diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
index f80ac4f2992b4..9b8b00c9e6d13 100644
--- a/drivers/clk/ingenic/Kconfig
+++ b/drivers/clk/ingenic/Kconfig
@@ -75,6 +75,16 @@ config INGENIC_CGU_X1000
 
 	  If building for a X1000 SoC, you want to say Y here.
 
+config INGENIC_CGU_X1600
+	bool "Ingenic X1600 CGU driver"
+	default MACH_X1600
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic X1600
+	  and compatible SoCs.
+
+	  If building for a X1600 SoC, you want to say Y here.
+
 config INGENIC_CGU_X1830
 	bool "Ingenic X1830 CGU driver"
 	default MACH_X1830
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index 81d8e23c26365..7e93e0893abe2 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -7,5 +7,6 @@ obj-$(CONFIG_INGENIC_CGU_JZ4760)	+= jz4760-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
 obj-$(CONFIG_INGENIC_CGU_X1000)		+= x1000-cgu.o
+obj-$(CONFIG_INGENIC_CGU_X1600)		+= x1600-cgu.o
 obj-$(CONFIG_INGENIC_CGU_X1830)		+= x1830-cgu.o
 obj-$(CONFIG_INGENIC_TCU_CLK)		+= tcu.o
diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 41e4c69131bd6..b4ef8ddf043a7 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2013-2015 Imagination Technologies
  * Author: Paul Burton <paul.burton@mips.com>
+ * Copyright (c) 2023, 2024 Paul Boddie <paul@boddie.org.uk>
  */
 
 #include <linux/bitops.h>
@@ -76,6 +77,40 @@ ingenic_cgu_gate_set(struct ingenic_cgu *cgu,
  * PLL operations
  */
 
+static unsigned
+ingenic_pll_recalc_rate_od(u32 ctl, u8 od_shift, u8 od_bits, u8 od_max,
+			   const s8 *od_encoding)
+{
+	unsigned int od, od_enc = 0;
+
+	if (od_bits > 0) {
+		od_enc = ctl >> od_shift;
+		od_enc &= GENMASK(od_bits - 1, 0);
+	}
+
+	/*
+	 * Use the encoding table if indicated. Otherwise, use the value
+	 * directly, interpreting an encoded value of zero as a divider
+	 * value of one.
+	 */
+	if (od_encoding) {
+		for (od = 0; od < od_max; od++)
+			if (od_encoding[od] == od_enc)
+				break;
+		od++;
+	} else {
+		od = od_enc ? od_enc : 1;
+	}
+
+	/* if od_max = 0, od_bits should be 0 and od is fixed to 1. */
+	if (od_max == 0)
+		WARN_ON_ONCE(od_bits != 0);
+	else
+		WARN_ON_ONCE(od == od_max);
+
+	return od;
+}
+
 static unsigned long
 ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
@@ -83,7 +118,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 	struct ingenic_cgu *cgu = ingenic_clk->cgu;
 	const struct ingenic_cgu_pll_info *pll_info;
-	unsigned m, n, od, od_enc = 0;
+	unsigned int m, n, od, od1;
 	bool bypass;
 	u32 ctl;
 
@@ -97,71 +132,82 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	n = (ctl >> pll_info->n_shift) & GENMASK(pll_info->n_bits - 1, 0);
 	n += pll_info->n_offset;
 
-	if (pll_info->od_bits > 0) {
-		od_enc = ctl >> pll_info->od_shift;
-		od_enc &= GENMASK(pll_info->od_bits - 1, 0);
-	}
-
 	if (pll_info->bypass_bit >= 0) {
-		ctl = readl(cgu->base + pll_info->bypass_reg);
+		u32 ctl2 = readl(cgu->base + pll_info->bypass_reg);
 
-		bypass = !!(ctl & BIT(pll_info->bypass_bit));
+		bypass = !!(ctl2 & BIT(pll_info->bypass_bit));
 
 		if (bypass)
 			return parent_rate;
 	}
 
-	for (od = 0; od < pll_info->od_max; od++)
-		if (pll_info->od_encoding[od] == od_enc)
-			break;
+	od = ingenic_pll_recalc_rate_od(ctl, pll_info->od_shift, pll_info->od_bits,
+					pll_info->od_max, pll_info->od_encoding);
 
-	/* if od_max = 0, od_bits should be 0 and od is fixed to 1. */
-	if (pll_info->od_max == 0)
-		BUG_ON(pll_info->od_bits != 0);
-	else
-		BUG_ON(od == pll_info->od_max);
-	od++;
+	od1 = ingenic_pll_recalc_rate_od(ctl, pll_info->od1_shift, pll_info->od1_bits,
+					 pll_info->od1_max, pll_info->od_encoding);
 
 	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
-		n * od);
+		n * od * od1);
 }
 
 static void
 ingenic_pll_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
 			unsigned long rate, unsigned long parent_rate,
-			unsigned int *pm, unsigned int *pn, unsigned int *pod)
+			unsigned int *pm, unsigned int *pn, unsigned int *pod,
+			unsigned int *pod1)
 {
-	unsigned int m, n, od = 1;
+	unsigned int m, n, od = 1, od1 = 1;
 
 	/*
-	 * The frequency after the input divider must be between 10 and 50 MHz.
+	 * The frequency after the input divider must be within the range
+	 * defined in the programming manual as FREF:
+	 *
+	 * JZ4740: 1 MHz - 15 MHz
+	 * JZ4780: 183 kHz - 1.5 GHz
+	 * X1000:  10 MHz - 50 MHz
+	 * X1600:  1 MHz - 800 MHz
+	 * X2000:  5 MHz - 200 MHz
+	 *
 	 * The highest divider yields the best resolution.
 	 */
 	n = parent_rate / (10 * MHZ);
 	n = min_t(unsigned int, n, 1 << pll_info->n_bits);
 	n = max_t(unsigned int, n, pll_info->n_offset);
 
-	m = (rate / MHZ) * od * n / (parent_rate / MHZ);
+	/*
+	 * The frequency after the VCO stage (parent * m / n) must be in the
+	 * range defined in the programming manual as FVCO:
+	 *
+	 * JZ4740: 100 MHz - 500 MHz
+	 * JZ4780: 300 MHz - 1.5 GHz
+	 * X1000:  300 MHz - 600 MHz (low-band), 500 MHz - 1 GHz (high-band)
+	 * X1600:  600 MHz - 2.4 GHz
+	 * X2000:  2.4 GHz - 4.8 GHz
+	 */
+	m = (rate / MHZ) * od * od1 * n / (parent_rate / MHZ);
 	m = min_t(unsigned int, m, 1 << pll_info->m_bits);
 	m = max_t(unsigned int, m, pll_info->m_offset);
 
 	*pm = m;
 	*pn = n;
 	*pod = od;
+	*pod1 = od1;
 }
 
 static unsigned long
 ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
 		 unsigned long rate, unsigned long parent_rate,
-		 unsigned int *pm, unsigned int *pn, unsigned int *pod)
+		 unsigned int *pm, unsigned int *pn, unsigned int *pod,
+		 unsigned int *pod1)
 {
 	const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
-	unsigned int m, n, od;
+	unsigned int m, n, od, od1 = 1;
 
 	if (pll_info->calc_m_n_od)
-		(*pll_info->calc_m_n_od)(pll_info, rate, parent_rate, &m, &n, &od);
+		(*pll_info->calc_m_n_od)(pll_info, rate, parent_rate, &m, &n, &od, &od1);
 	else
-		ingenic_pll_calc_m_n_od(pll_info, rate, parent_rate, &m, &n, &od);
+		ingenic_pll_calc_m_n_od(pll_info, rate, parent_rate, &m, &n, &od, &od1);
 
 	if (pm)
 		*pm = m;
@@ -169,9 +215,11 @@ ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
 		*pn = n;
 	if (pod)
 		*pod = od;
+	if (pod1)
+		*pod1 = od1;
 
 	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
-		n * od);
+		n * od * od1);
 }
 
 static int ingenic_pll_determine_rate(struct clk_hw *hw,
@@ -181,7 +229,7 @@ static int ingenic_pll_determine_rate(struct clk_hw *hw,
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 
 	req->rate = ingenic_pll_calc(clk_info, req->rate, req->best_parent_rate,
-				     NULL, NULL, NULL);
+				     NULL, NULL, NULL, NULL);
 
 	return 0;
 }
@@ -208,12 +256,12 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 	const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
 	unsigned long rate, flags;
-	unsigned int m, n, od;
+	unsigned int m, n, od, od1;
 	int ret = 0;
 	u32 ctl;
 
 	rate = ingenic_pll_calc(clk_info, req_rate, parent_rate,
-			       &m, &n, &od);
+			       &m, &n, &od, &od1);
 	if (rate != req_rate)
 		pr_info("ingenic-cgu: request '%s' rate %luHz, actual %luHz\n",
 			clk_info->name, req_rate, rate);
@@ -229,7 +277,18 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned long req_rate,
 
 	if (pll_info->od_bits > 0) {
 		ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
-		ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
+		if (pll_info->od_encoding)
+			ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
+		else
+			ctl |= (od ? od : 1) << pll_info->od_shift;
+	}
+
+	if (pll_info->od1_bits > 0) {
+		ctl &= ~(GENMASK(pll_info->od1_bits - 1, 0) << pll_info->od1_shift);
+		if (pll_info->od_encoding)
+			ctl |= pll_info->od_encoding[od1 - 1] << pll_info->od1_shift;
+		else
+			ctl |= (od1 ? od1 : 1) << pll_info->od1_shift;
 	}
 
 	writel(ctl, cgu->base + pll_info->reg);
@@ -531,7 +590,7 @@ ingenic_clk_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	struct ingenic_cgu *cgu = ingenic_clk->cgu;
 	unsigned long rate, flags;
 	unsigned int hw_div, div;
-	u32 reg, mask;
+	u32 reg, mask, d_reg;
 	int ret = 0;
 
 	if (clk_info->type & CGU_CLK_DIV) {
@@ -554,6 +613,30 @@ ingenic_clk_set_rate(struct clk_hw *hw, unsigned long req_rate,
 		reg &= ~(mask << clk_info->div.shift);
 		reg |= hw_div << clk_info->div.shift;
 
+		/*
+		 * NOTE: Special treatment for the I2S dividers in the X1600.
+		 * Set the multiplier to 1, imposing an N >= M*2 constraint,
+		 * also setting D to "automatic" calculation. This permits the
+		 * treatment of these dividers as normal dividers, although
+		 * they are configured more similarly to PLLs.
+		 */
+		if (clk_info->mdiv.reg) {
+			if (div < 2) {
+				spin_unlock_irqrestore(&cgu->lock, flags);
+				return -EINVAL;
+			}
+
+			mask = GENMASK(clk_info->mdiv.bits - 1, 0);
+			reg &= ~(mask << clk_info->mdiv.shift);
+			reg |= 1 << clk_info->mdiv.shift;
+
+			if (clk_info->nddiv.reg) {
+				d_reg = readl(cgu->base + clk_info->nddiv.reg);
+				d_reg &= ~(1 << clk_info->nddiv.explicit_d_bit);
+				d_reg |= 1 << clk_info->nddiv.explicit_n_bit;
+			}
+		}
+
 		/* clear the stop bit */
 		if (clk_info->div.stop_bit != -1)
 			reg &= ~BIT(clk_info->div.stop_bit);
@@ -565,6 +648,9 @@ ingenic_clk_set_rate(struct clk_hw *hw, unsigned long req_rate,
 		/* update the hardware */
 		writel(reg, cgu->base + clk_info->div.reg);
 
+		if (clk_info->nddiv.reg)
+			writel(d_reg, cgu->base + clk_info->nddiv.reg);
+
 		/* wait for the change to take effect */
 		if (clk_info->div.busy_bit != -1)
 			ret = ingenic_clk_check_stable(cgu, clk_info);
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 0d417d69dab71..d5bdd7084b201 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -36,6 +36,12 @@
  * @od_bits: the size of the post-VCO divider field in bits, or 0 if no
  *	     OD field exists (then the OD is fixed to 1)
  * @od_max: the maximum post-VCO divider value
+ * @od1_shift: the number of bits to shift the secondary post-VCO divider
+ *             value by (ie. the index of the lowest bit of the post-VCO
+ *             divider value in the PLL's control register)
+ * @od1_bits: the size of the secondary post-VCO divider field in bits, or 0
+ *            if no OD1 field exists (then the OD1 is fixed to 1)
+ * @od1_max: the maximum secondary post-VCO divider value
  * @od_encoding: a pointer to an array mapping post-VCO divider values to
  *               their encoded values in the PLL control register, or -1 for
  *               unsupported values
@@ -56,13 +62,15 @@ struct ingenic_cgu_pll_info {
 	u8 m_shift, m_bits, m_offset;
 	u8 n_shift, n_bits, n_offset;
 	u8 od_shift, od_bits, od_max;
+	u8 od1_shift, od1_bits, od1_max;
 	unsigned bypass_reg;
 	s8 bypass_bit;
 	s8 enable_bit;
 	s8 stable_bit;
 	void (*calc_m_n_od)(const struct ingenic_cgu_pll_info *pll_info,
 			    unsigned long rate, unsigned long parent_rate,
-			    unsigned int *m, unsigned int *n, unsigned int *od);
+			    unsigned int *m, unsigned int *n, unsigned int *od,
+			    unsigned int *od1);
 	void (*set_rate_hook)(const struct ingenic_cgu_pll_info *pll_info,
 			      unsigned long rate, unsigned long parent_rate);
 };
@@ -109,6 +117,36 @@ struct ingenic_cgu_div_info {
 	const u8 *div_table;
 };
 
+/**
+ * struct ingenic_cgu_mdiv_info - information about a divider M parameter
+ * @reg: offset of the divider control register within the CGU
+ * @shift: number of bits to left shift the M divide value by (ie. the index
+ *         of the lowest bit of the divide value within its control
+ *         register)
+ * @div: number to divide the M divider value by (i.e. if the
+ *       effective divider value is the value written to the register
+ *       multiplied by some constant)
+ * @bits: the size of the M divide value in bits
+ */
+struct ingenic_cgu_mdiv_info {
+	unsigned reg;
+	u8 shift;
+	u8 div;
+	u8 bits;
+};
+
+/**
+ * struct ingenic_cgu_nddiv_info - information about divider N and D parameters
+ * @reg: offset of the D divider control register within the CGU
+ * @explicit_n_bit: the bit providing the explicit N divider flag
+ * @explicit_d_bit: the bit providing the explicit D divider flag
+ */
+struct ingenic_cgu_nddiv_info {
+	unsigned reg;
+	u8 explicit_n_bit;
+	u8 explicit_d_bit;
+};
+
 /**
  * struct ingenic_cgu_fixdiv_info - information about a fixed divider
  * @div: the divider applied to the parent clock
@@ -180,6 +218,8 @@ struct ingenic_cgu_clk_info {
 			struct ingenic_cgu_gate_info gate;
 			struct ingenic_cgu_mux_info mux;
 			struct ingenic_cgu_div_info div;
+			struct ingenic_cgu_mdiv_info mdiv;
+			struct ingenic_cgu_nddiv_info nddiv;
 			struct ingenic_cgu_fixdiv_info fixdiv;
 		};
 
diff --git a/drivers/clk/ingenic/x1600-cgu.c b/drivers/clk/ingenic/x1600-cgu.c
new file mode 100644
index 0000000000000..627203f5cabe8
--- /dev/null
+++ b/drivers/clk/ingenic/x1600-cgu.c
@@ -0,0 +1,476 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Ingenic X1600 SoC CGU driver
+ *
+ * Copyright (c) 2013-2015 Imagination Technologies
+ * Author: Paul Burton <paul.burton@mips.com>
+ * Copyright (c) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+ * Copyright (c) 2023, 2024 Paul Boddie <paul@boddie.org.uk>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/rational.h>
+#include <linux/of.h>
+
+#include <dt-bindings/clock/ingenic,x1600-cgu.h>
+
+#include "cgu.h"
+#include "pm.h"
+
+/* CGU register offsets */
+#define CGU_REG_CLOCKCONTROL	0x00
+#define CGU_REG_LCR		0x04
+#define CGU_REG_APLL		0x10
+#define CGU_REG_MPLL		0x14
+#define CGU_REG_EPLL		0x18
+#define CGU_REG_CLKGR0		0x20
+#define CGU_REG_OPCR		0x24
+#define CGU_REG_CLKGR1		0x28
+#define CGU_REG_DDRCDR		0x2c
+#define CGU_REG_CPSPR		0x34
+#define CGU_REG_CPSPPR		0x38
+#define CGU_REG_USBPCR		0x3c
+#define CGU_REG_USBRDT		0x40
+#define CGU_REG_USBVBFIL	0x44
+#define CGU_REG_USBPCR1		0x48
+#define CGU_REG_MACCDR		0x54
+#define CGU_REG_SSICDR		0x5c
+#define CGU_REG_I2S0CDR		0x60
+#define CGU_REG_LPCDR		0x64
+#define CGU_REG_MSC0CDR		0x68
+#define CGU_REG_PWMCDR		0x6c
+#define CGU_REG_I2S0CDR1	0x70
+#define CGU_REG_SFCCDR		0x74
+#define CGU_REG_CIMCDR		0x78
+#define CGU_REG_I2S1CDR		0x7c
+#define CGU_REG_I2S1CDR1	0x80
+#define CGU_REG_APLLFRAC	0x84
+#define CGU_REG_MPLLFRAC	0x88
+#define CGU_REG_EPLLFRAC	0x8c
+#define CGU_REG_CAN0CDR		0xa0
+#define CGU_REG_MSC1CDR		0xa4
+#define CGU_REG_CAN1CDR		0xa8
+#define CGU_REG_CDBUSCDR	0xac
+#define CGU_REG_CMP_INTR	0xb0
+#define CGU_REG_CMP_INTRE	0xb4
+#define CGU_REG_CMP_SFTINT	0xbc
+#define CGU_REG_DRCG		0xd0
+#define CGU_REG_CLOCKSTATUS	0xd4
+#define CGU_REG_MPHY0C		0xe4
+
+/* bits within the OPCR register */
+#define OPCR_SPENDN0		BIT(7)
+#define OPCR_GATEUSBPHYCLK	BIT(23)
+
+static struct ingenic_cgu *cgu;
+
+static int x1600_otg_phy_enable(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr		= cgu->base + CGU_REG_OPCR;
+
+	writel((readl(reg_opcr) & ~OPCR_GATEUSBPHYCLK) | OPCR_SPENDN0, reg_opcr);
+
+	return 0;
+}
+
+static void x1600_otg_phy_disable(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr		= cgu->base + CGU_REG_OPCR;
+
+	writel((readl(reg_opcr) & ~OPCR_SPENDN0) | OPCR_GATEUSBPHYCLK, reg_opcr);
+}
+
+static int x1600_otg_phy_is_enabled(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr		= cgu->base + CGU_REG_OPCR;
+
+	return (readl(reg_opcr) & (OPCR_SPENDN0 | OPCR_GATEUSBPHYCLK)) == OPCR_SPENDN0;
+}
+
+static u8 x1600_otg_phy_get_parent(struct clk_hw * __maybe_unused hw)
+{
+	return 0;
+}
+
+static const struct clk_ops x1600_otg_phy_ops = {
+	.enable		= x1600_otg_phy_enable,
+	.disable	= x1600_otg_phy_disable,
+	.is_enabled	= x1600_otg_phy_is_enabled,
+	.get_parent	= x1600_otg_phy_get_parent,
+};
+
+static void
+x1600_pll_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
+		      unsigned long rate, unsigned long parent_rate,
+		      unsigned int *pm, unsigned int *pn, unsigned int *pod,
+		      unsigned int *pod1)
+{
+	const unsigned int od_max = pll_info->od_max - 1;
+	const unsigned int od1_max = pll_info->od1_max - 1;
+	const unsigned int m_max = GENMASK(pll_info->m_bits - 1, 0);
+	const unsigned int n_max = GENMASK(pll_info->n_bits - 1, 0);
+	unsigned long m, n;
+	unsigned int od = 1, od1 = 1;
+	const unsigned long fvco_min = 600000000, fvco_max = 2400000000;
+	unsigned long fvco;
+
+	/*
+	 * Combined output divider range:
+	 *
+	 * ceil(fvco_min / rate) - fvco_max / rate
+	 */
+	unsigned int od_combined_min = (fvco_min + rate) / rate;
+	unsigned int od_combined_max = fvco_max / rate;
+	unsigned int od_combined;
+
+	for (od_combined = od_combined_min; od_combined <= od_combined_max; od_combined++) {
+		od = int_sqrt(od_combined);
+		od1 = od_combined / od;
+
+		/* od == floor(sqrt(od_combined)); od1 >= od */
+		if ((od * od1 == od_combined) && od <= od_max && od1 <= od1_max) {
+			fvco = rate * od_combined;
+			rational_best_approximation(fvco, parent_rate, m_max, n_max, &m, &n);
+			break;
+		}
+	}
+
+	*pm = m;
+	*pn = n;
+	*pod = od;
+	*pod1 = od1;
+}
+
+static const struct ingenic_cgu_clk_info x1600_cgu_clocks[] = {
+
+	/* External clocks */
+
+	[X1600_CLK_EXCLK] = { "ext", CGU_CLK_EXT },
+	[X1600_CLK_RTCLK] = { "rtc", CGU_CLK_EXT },
+	[X1600_CLK_12M] = { "clk12m", CGU_CLK_EXT },
+
+	/* PLLs */
+
+#define DEF_PLL(name) { \
+	.reg = CGU_REG_ ## name, \
+	.rate_multiplier = 1, \
+	.m_shift = 20, \
+	.m_bits = 12, \
+	.m_offset = 0, \
+	.n_shift = 14, \
+	.n_bits = 6, \
+	.n_offset = 0, \
+	.od_shift = 8, \
+	.od_bits = 3, \
+	.od_max = 8, \
+	.od1_shift = 11, \
+	.od1_bits = 3, \
+	.od1_max = 8, \
+	.od_encoding = 0, \
+	.stable_bit = 2, \
+	.enable_bit = 0, \
+	.bypass_bit = -1, \
+	.calc_m_n_od = x1600_pll_calc_m_n_od, \
+}
+
+	[X1600_CLK_APLL] = {
+		"apll", CGU_CLK_PLL,
+		.parents = { X1600_CLK_EXCLK, -1, -1, -1 },
+		.pll = DEF_PLL(APLL),
+	},
+
+	[X1600_CLK_MPLL] = {
+		"mpll", CGU_CLK_PLL,
+		.parents = { X1600_CLK_EXCLK, -1, -1, -1 },
+		.pll = DEF_PLL(MPLL),
+	},
+
+	[X1600_CLK_EPLL] = {
+		"epll", CGU_CLK_PLL,
+		.parents = { X1600_CLK_EXCLK, -1, -1, -1 },
+		.pll = DEF_PLL(EPLL),
+	},
+
+#undef DEF_PLL
+
+	/* Muxes & dividers */
+
+	[X1600_CLK_SCLKA] = {
+		"sclk_a", CGU_CLK_MUX,
+		.parents = { -1, X1600_CLK_EXCLK, X1600_CLK_APLL, -1 },
+		.mux = { CGU_REG_CLOCKCONTROL, 30, 2 },
+	},
+
+	[X1600_CLK_CPUMUX] = {
+		"cpumux", CGU_CLK_MUX,
+		.parents = { -1, X1600_CLK_SCLKA, X1600_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CLOCKCONTROL, 28, 2 },
+	},
+
+	[X1600_CLK_CPU] = {
+		"cpu", CGU_CLK_DIV,
+		/*
+		 * Disabling the CPU clock or any parent clocks will hang the
+		 * system; mark it critical.
+		 */
+		.flags = CLK_IS_CRITICAL,
+		.parents = { X1600_CLK_CPUMUX, -1, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 0, 1, 4, 22, -1, -1 },
+	},
+
+	[X1600_CLK_L2CACHE] = {
+		"l2cache", CGU_CLK_DIV,
+		/*
+		 * The L2 cache clock is critical if caches are enabled and
+		 * disabling it or any parent clocks will hang the system.
+		 */
+		.flags = CLK_IS_CRITICAL,
+		.parents = { X1600_CLK_CPUMUX, -1, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 4, 1, 4, -1, -1, -1 },
+	},
+
+	[X1600_CLK_AHB0] = {
+		"ahb0", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { -1, X1600_CLK_SCLKA, X1600_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CLOCKCONTROL, 26, 2 },
+		.div = { CGU_REG_CLOCKCONTROL, 8, 1, 4, 21, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 29 },
+	},
+
+	[X1600_CLK_AHB2PMUX] = {
+		"ahb2_apb_mux", CGU_CLK_MUX,
+		.parents = { -1, X1600_CLK_SCLKA, X1600_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CLOCKCONTROL, 24, 2 },
+	},
+
+	[X1600_CLK_AHB2] = {
+		"ahb2", CGU_CLK_DIV,
+		.parents = { X1600_CLK_AHB2PMUX, -1, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 12, 1, 4, 20, -1, -1 },
+	},
+
+	[X1600_CLK_PCLK] = {
+		"pclk", CGU_CLK_DIV,
+		.parents = { X1600_CLK_AHB2PMUX, -1, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 16, 1, 4, 20, -1, -1 },
+	},
+
+	[X1600_CLK_DDR] = {
+		"ddr", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		/*
+		 * Disabling DDR clock or its parents will render DRAM
+		 * inaccessible; mark it critical.
+		 */
+		.flags = CLK_IS_CRITICAL,
+		.parents = { -1, X1600_CLK_SCLKA, X1600_CLK_MPLL, -1 },
+		.mux = { CGU_REG_DDRCDR, 30, 2 },
+		.div = { CGU_REG_DDRCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 31 },
+	},
+
+	[X1600_CLK_I2S0] = {
+		"i2s0", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1600_CLK_SCLKA, X1600_CLK_EPLL, -1, -1 },
+		.mux = { CGU_REG_I2S0CDR, 30, 1 },
+		.div = { CGU_REG_I2S0CDR, 20, 1, 9, -1, -1, -1 },
+		.mdiv = { CGU_REG_I2S0CDR, 0, 1, 20 },
+		.nddiv = { CGU_REG_I2S0CDR1, 31, 30 },
+		.gate = { CGU_REG_I2S0CDR, 29, true },
+	},
+
+	[X1600_CLK_I2S1] = {
+		"i2s1", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1600_CLK_SCLKA, X1600_CLK_EPLL, -1, -1 },
+		.mux = { CGU_REG_I2S1CDR, 30, 1 },
+		.div = { CGU_REG_I2S1CDR, 20, 1, 9, -1, -1, -1 },
+		.mdiv = { CGU_REG_I2S1CDR, 0, 1, 20 },
+		.nddiv = { CGU_REG_I2S1CDR1, 31, 30 },
+		.gate = { CGU_REG_I2S1CDR, 29, true },
+	},
+
+	[X1600_CLK_LCDPIXCLK] = {
+		"lcd0pixclk", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1600_CLK_SCLKA, X1600_CLK_MPLL,
+			     X1600_CLK_EPLL, -1 },
+		.mux = { CGU_REG_LPCDR, 30, 2 },
+		.div = { CGU_REG_LPCDR, 0, 1, 8, 28, 27, 26 },
+		.gate = { CGU_REG_CLKGR0, 23 },
+	},
+
+	[X1600_CLK_MAC] = {
+		"mac", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1600_CLK_SCLKA, X1600_CLK_MPLL,
+			     X1600_CLK_EPLL, -1 },
+		.mux = { CGU_REG_MACCDR, 30, 2 },
+		.div = { CGU_REG_MACCDR, 0, 1, 8, 28, 27, 26 },
+		.gate = { CGU_REG_CLKGR1, 23 },
+	},
+
+	[X1600_CLK_MSC0] = {
+		"msc0", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1600_CLK_SCLKA, X1600_CLK_MPLL,
+			     X1600_CLK_EPLL, -1 },
+		.mux = { CGU_REG_MSC0CDR, 30, 2 },
+		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 4 },
+	},
+
+	[X1600_CLK_MSC1] = {
+		"msc1", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1600_CLK_SCLKA, X1600_CLK_MPLL,
+			     X1600_CLK_EPLL, -1 },
+		.mux = { CGU_REG_MSC1CDR, 30, 2 },
+		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 5 },
+	},
+
+	[X1600_CLK_SSI0] = {
+		"ssi", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1600_CLK_SCLKA, X1600_CLK_MPLL,
+			     X1600_CLK_EPLL, -1 },
+		.mux = { CGU_REG_SSICDR, 30, 2 },
+		.div = { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 19 },
+	},
+
+	[X1600_CLK_CIMMCLK] = {
+		"cim_mclk", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1600_CLK_SCLKA, X1600_CLK_MPLL,
+			     X1600_CLK_EPLL, -1 },
+		.mux = { CGU_REG_CIMCDR, 30, 2 },
+		.div = { CGU_REG_CIMCDR, 0, 1, 8, 30, 29, 28 },
+		.gate = { CGU_REG_CLKGR0, 22 },
+	},
+
+	[X1600_CLK_EXCLK_DIV512] = {
+		"exclk_div512", CGU_CLK_FIXDIV,
+		.parents = { X1600_CLK_EXCLK },
+		.fixdiv = { 512 },
+	},
+
+	[X1600_CLK_RTC] = {
+		"rtc_ercs", CGU_CLK_MUX | CGU_CLK_GATE,
+		.parents = { X1600_CLK_EXCLK_DIV512, X1600_CLK_RTCLK },
+		.mux = { CGU_REG_OPCR, 2, 1},
+	},
+
+	/* Custom (SoC-specific) OTG PHY */
+
+	[X1600_CLK_OTGPHY] = {
+		"otg_phy", CGU_CLK_CUSTOM,
+		.parents = { X1600_CLK_12M },
+		.custom = { &x1600_otg_phy_ops },
+	},
+
+	/* Gate-only clocks */
+
+	[X1600_CLK_NEMC] = {
+		"nemc", CGU_CLK_GATE,
+		.parents = { X1600_CLK_AHB2, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 0 },
+	},
+
+	[X1600_CLK_OTG0] = {
+		"otg0", CGU_CLK_GATE,
+		.parents = { X1600_CLK_AHB2, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 3 },
+	},
+
+	[X1600_CLK_SMB0] = {
+		"smb0", CGU_CLK_GATE,
+		.parents = { X1600_CLK_PCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 7 },
+	},
+
+	[X1600_CLK_SMB1] = {
+		"smb1", CGU_CLK_GATE,
+		.parents = { X1600_CLK_PCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 8 },
+	},
+
+	[X1600_CLK_AIC] = {
+		"aic", CGU_CLK_GATE,
+		.parents = { X1600_CLK_AHB2, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 11 },
+	},
+
+	[X1600_CLK_I2S0_RX] = {
+		"i2s0_rx", CGU_CLK_GATE,
+		.parents = { X1600_CLK_I2S0, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR1, 8 },
+	},
+
+	[X1600_CLK_I2S0_TX] = {
+		"i2s0_tx", CGU_CLK_GATE,
+		.parents = { X1600_CLK_I2S1, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR1, 9 },
+	},
+
+	[X1600_CLK_SADC] = {
+		"sadc", CGU_CLK_GATE,
+		.parents = { X1600_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 14 },
+	},
+
+	[X1600_CLK_UART0] = {
+		"uart0", CGU_CLK_GATE,
+		.parents = { X1600_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 14 },
+	},
+
+	[X1600_CLK_UART1] = {
+		"uart1", CGU_CLK_GATE,
+		.parents = { X1600_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 15 },
+	},
+
+	[X1600_CLK_UART2] = {
+		"uart2", CGU_CLK_GATE,
+		.parents = { X1600_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 16 },
+	},
+
+	[X1600_CLK_UART3] = {
+		"uart3", CGU_CLK_GATE,
+		.parents = { X1600_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR1, 16 },
+	},
+
+	[X1600_CLK_PDMA] = {
+		"pdma", CGU_CLK_GATE,
+		.parents = { X1600_CLK_AHB2, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 21 },
+	},
+
+	[X1600_CLK_AES] = {
+		"aes", CGU_CLK_GATE,
+		.parents = { X1600_CLK_AHB2, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR1, 24 },
+	},
+
+};
+
+static void __init x1600_cgu_init(struct device_node *np)
+{
+	int retval;
+
+	cgu = ingenic_cgu_new(x1600_cgu_clocks,
+			      ARRAY_SIZE(x1600_cgu_clocks), np);
+	if (!cgu) {
+		pr_err("%s: failed to initialise CGU\n", __func__);
+		return;
+	}
+
+	retval = ingenic_cgu_register_clocks(cgu);
+	if (retval) {
+		pr_err("%s: failed to register CGU Clocks\n", __func__);
+		return;
+	}
+
+	ingenic_cgu_register_syscore(cgu);
+}
+
+CLK_OF_DECLARE_DRIVER(x1600_cgu, "ingenic,x1600-cgu", x1600_cgu_init);
-- 
2.56.0

