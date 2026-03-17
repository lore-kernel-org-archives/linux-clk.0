Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0BA377579
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768785; cv=none; b=DrEvsNmYfc0WiO7ai4oQcKMxZm2NejKneadGQg9i1mKM8EJDzTA77VklvCU7UfFU8e7Da3zUGoBkYlCBsEAvVemdGI8+EDAI2AvHM/phkH7UtBJ/33yIOy4KTGRFS2LDch08h7cfdub+bjmGYKCzbLY+Oiv1/wNWFXdl059dAZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768785; c=relaxed/simple;
	bh=QjCfN7RY+EItkQZI0L3CAYHaeHS+DOOLxlKQ2SMtCpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnOITtmSwuI2LkCwlyevbIri20FisOzYNwUMyBJn6NDgidaQa9hgbsOtWcf36YgQ73LXceZPkQdyOLQ6LNRIoyBoX6dU4NPgAS8mMcdIrZRBbUtRf/1RWQ0Efr+3DDeGpnlZWp8z2iiyheIgs6YthVGJYT6qzcH8pH9+4PdHxYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLlIZ6WN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLlIZ6WN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b45bb7548so1771983f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768782; x=1774373582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9igAn1ObASXzGMs9YdWfeZEpRzerCdsgZieuD3oVtg=;
        b=kLlIZ6WN3KkW4lKyJINNtQY/epK8eXTh1VP9fMBPuVmtxQ1RndmZ4+9MXmDDFPvXMM
         m0XdS0UVuMSc9351//NxWSQh0q0SnPGGJ5VhGHAHhYyd8iQI6pFEu6KDXs843/HG1tFB
         Cv9uI9AM0A1EAc4faKbTfUmoh9CWGWhjp8VP/xPTb2QwbSeK6StJ1RXI4qH/Y4hA5o4k
         /QA+ODfsJyyid692kKyrcaOwB+gCp1pn5rVj5n6FDKx4nfsrz0AcK16dfv+0X5FxgP4k
         sD7sK33CY1rWqGiK2vJr4uam5se92XcTowrL4DnKxN8MNI2As5h46jCyA2ti2y/4WIEO
         5xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768782; x=1774373582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9igAn1ObASXzGMs9YdWfeZEpRzerCdsgZieuD3oVtg=;
        b=qdq3Dq9UYqdEVAo1m2ni8MGDyyFb7jFlI8fPN/O79zjWCfmEggcESNVyP8oyiBr5Cy
         fGj98MGhsxZ+mL3Y6lN7luSFNvJIil/qtMOviqRwh5sN4MpXJRmh9zAw8ilTznPqxwlY
         qLWfa6t+I1t1x6NfaF3T3a064134PCfqlGtz1PoPp46eSlXmj7oXAu5bBBf4F3vp1Ogo
         fqkW53xNL7nJlCZy6XGFWl7MUfLsJdn1lhz+I4w4f18yMBmAZUhtxEFOa2jDhPwt/d9v
         Icf1y4CGggVnY2DQer3j1lBt1DExZ4/diPxxyzLF5NNUlJT+U2W5EEU2O8u5fQ5FzRrF
         aOnw==
X-Forwarded-Encrypted: i=1; AJvYcCUCRamj1yZEBS8svpEr//qMhl76WDf4TjUX/oOmJzbxPkeARhR6ICAfZQzHAMAm9i4jl+DOcf878VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUjzNhOYXSEFCKSX6GsQkwJ2IpAcIGo3jhV07LhKhS3FoJTLFs
	LnFgpTGixDzRlbkdZju4IRXUWQB8KgqqXsHyGTm2IJYr3xda4ZhP2elN
X-Gm-Gg: ATEYQzwE0TJFqVLI41a8Qy6DYtLCQJJ8WgJmui5Gv5lvRo+QEBXOFS6iww8Fgi0LZIT
	7Jjxxm+aoqsuU++KwtNXLpu96roppYEfxWjEQl29jD6wkbHDb0UbB1dKBANbZSWAZmcHT5x4toA
	vaYpY26oJMJoIAkOZzBAWoYOFadhKbk7urv+RAwKHSSCHMDRc2qIAPIkpsia/B615qlb50RlYEf
	1ld3/pnZ43rX+gSDoV9gDp7to56uEBjpsQJFlAe2tmEuul47HuHlnvYQgIPusazLp8D/SHMhbAM
	MiUx1cHxK+N7tXF1X19Nh9ra11OF7AB191fFOwAT1YUY+vFjhCfZbhdmRLkJ0gNK4a6G3/Mzqps
	F7gvf5ZgnP4wAnkZzwa4UQd+py9oLNPnkmtPfo9vXF0H7hlTErjyYJqti+70oPGCF2L3tSYEq6c
	aURWnMGAbbG5OszGS5XlL7iN0I0vMiURmJOioN8uwhXv4ncnYSARYX8OPPQ9PhNOTjBC87xWM=
X-Received: by 2002:a05:6000:2386:b0:439:c5c5:4146 with SMTP id ffacd0b85a97d-43b5279e493mr169875f8f.11.1773768781662;
        Tue, 17 Mar 2026 10:33:01 -0700 (PDT)
Received: from Ansuel-XPS24.lan (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b518a3e3csm793644f8f.35.2026.03.17.10.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:33:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] clk: add clk_hw_recalc_rate() to trigger HW clk rate recalculation
Date: Tue, 17 Mar 2026 18:32:45 +0100
Message-ID: <20260317173255.5531-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is currently a latent problem with HW clk that only expose a
.recalc_rate OP and doesn't have a .set_rate() and also have the
CLK_GET_RATE_NOCACHE flag set. In such case the rate in clk core is
parsed only (and set) only at init and when the full clk_set_rate()
is called. In every other case .recalc_rate() is never called.

It's also possible that an HW clk of this type, initially report 0 as rate
as the register are still not configured and the HW clk effectively doesn't
return any rate.

This gets especially problematic when a clock provider use such clk as a
parent and require the rate for parent selection for the final rate
calculation.

In such case, since the HW clk rate is never updated after init, it's still
0 and cause problems with any other HW clk that use .determine_rate() or
.round_rate() and search for the closest rate using clk_hw_get_rate() on
the parents.

This doesn't happen if the full clk_get_rate() is used instead as it will
check if CLK_GET_RATE_NOCACHE is set and recalculate the rate accordingly.

Updating the clk_hw_get_rate() to align to what clk_get_rate() does is not
possible as it should be lockless and might cause problems in any user of
clk_hw_get_rate().

A more safe approach is the introduction of a direct function that triggers
the HW clk rate recalculation, clk_hw_recalc_rate().

Any driver that implement an HW clk that entirely depends on some register
to configure the rate (that are externally configured) and have only
.recalc_rate() and set CLK_GET_RATE_NOCACHE (aka the case where the HW clk
rate actually change and depends on the external register configuration)
will have to call clk_hw_recalc_rate() on the HW clk after changing the
register configuration to sync the CCF with the new rate for the HW clk.

Example:

 - All register zero -> HW clk rate = 0
 - PCS configure USXGMII mode -> HW clk rate = 0
 - PCS call clk_hw_recalc_rate() -> HW clk rate = 312MHz
 - Port goes UP
 - PCS/MAC scale the PHY port clock correctly by having
   the correct reference clock as parent (instead of 0)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk.c            | 23 +++++++++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df3..35e0cf627c24 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1977,6 +1977,29 @@ static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
 	return clk_core_get_rate_nolock(core);
 }
 
+/**
+ * clk_hw_recalc_rate - trigger rate recalculation for clk_hw
+ * @hw: clk_hw associated with the clk to recalculate for
+ *
+ * Use clk_hw_recalc_rate() for the hw clk where the rate
+ * entirely depend on register configuration and doesn't have
+ * a .set_rate() OP. In such case, after modifying the register
+ * that would change the rate for the hw clk, call
+ * clk_hw_recalc_rate() to sync the CCF with the new clk rate.
+ */
+void clk_hw_recalc_rate(const struct clk_hw *hw)
+{
+	struct clk_core *core = hw->core;
+
+	if (!core || !(core->flags & CLK_GET_RATE_NOCACHE))
+		return;
+
+	clk_prepare_lock();
+	__clk_recalc_rates(core, false, 0);
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_hw_recalc_rate);
+
 /**
  * clk_get_rate - return the rate of clk
  * @clk: the clk whose rate is being returned
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129..f2865d7876c9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1407,6 +1407,7 @@ int clk_hw_get_parent_index(struct clk_hw *hw);
 int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
+void clk_hw_recalc_rate(const struct clk_hw *hw);
 unsigned long clk_hw_get_flags(const struct clk_hw *hw);
 #define clk_hw_can_set_rate_parent(hw) \
 	(clk_hw_get_flags((hw)) & CLK_SET_RATE_PARENT)
-- 
2.53.0

