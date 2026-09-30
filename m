Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DF47208B
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760553; cv=none; b=eamtIfvestrUNVBYeLjAwm/VDbvFoKzN5YLKqVysChKBU8VRfyCWY24A8iXTALOeI2jZdP8FK8tyqppZpukI0cQk/gag82pJxM3doRQvo5OUVbJNzxgZ+R0LDVCx0slQXs3Rynqx2vleA9o1o2IbZqglRA0yChnCeE5W1yRCpl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760553; c=relaxed/simple;
	bh=mknuXwZ95tcNOhem/WwO440N8fKuQ6mt+WRrlOPB8Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQIZM8zPr+Lc2ceSyhezWoSogde0vhVg0EcaHpOT755q3a6kxKeuAcX++5Wz9xmvWmFqRPmYy4YJMtMFaz5gfCiSCbO3YmSY7OjVyPABbkz8Poj/S/MU4hVpt9uDd3tItCsJgMAPd2Z9b1/ZtsXSyIGTamL2SdHG/4gaYBnK+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjp39Ie8; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjp39Ie8"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-853619d9956so190206b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 02:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760551; x=1791365351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCuOczbTp0o8M/OdE7sBIXiBo8j5afblsAbUmAPXWJ0=;
        b=Yjp39Ie8iKUrFARXoyxkWhn0v7rlvOANVnCPkSCYTCpV3wwuQPnDc3lfCzjhgusk23
         HHlmLKzWgP4sz09IK+Aa48Z7Tr6CXvjmYBTlHWbZjwcVod3PoRLus4xMwuHIMm0GrBS5
         uaGLgmiMfI2Y/PVAiCaRvChuDQEuiU6cRd6Xm+X6Fgvf4eHgj27kL3Bj8Yaq5z4o3R2j
         hkFMNGp05A+pwJXecWfgO69GdP7Ahm+E0SN9loPwn9uvkAAHEKGETjB4uswlj6s0p0Om
         WdRpU3c5qFU9psPTG6YK79Vp/9cFUgvFUz2MsTvNS++1DPO8jPWHL/62gmKZyHdJmYVB
         FcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760551; x=1791365351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCuOczbTp0o8M/OdE7sBIXiBo8j5afblsAbUmAPXWJ0=;
        b=SkcM0IkDpgbXrSxDn6y9/fvVIAmPYYR8SwlLGd4HLHgMoo+PRaqtvx6og21Hws6IS2
         ig7katjs2ZWfpBI4Qp37Z4RaEqx6WQo6XKG1wOoHhFdsDLGcgtKPsycm7ZooiTqrkp5M
         zw34qu2dGroDFpVh5A8orYCHwQUPh1CRf2XC8HE96RjeuuqqSCKhor4KqqeZpUIf5gdl
         rzwUakwcii+H7r0oH0d2RwlaYnbsr3cpIeouR58e0kCm1SQI7u6cUSECpODAa24lKPTO
         HyFz2iTbdVgpe2EeTUs/BElK86ZUi2N6ojInszQhOu3wEbLM/81IvjI2k8jTLKydFMJ3
         XB5g==
X-Gm-Message-State: AFuF++nyryowlmbFGX7PB8DKOyFVLe9YrtvJnH10KggKmzfMiR+mdBKN
	nMHkOVPk16ON81mTpL+DUhP+FwrY1usoKOuJsP5DYcIqZHU87s4dqw4bKQio7A==
X-Gm-Gg: AYBFou0qic50SfS+WlVE+qWxb5UT6SF9d/zki6RKSkqiVXRVS2k+DM0dJYz7bvqCn8b
	rfqpLqODezwMcxuDSGAMMGC0IZEXuaP2RuSt/GBVz1jApfqzm52RgtpKMA8/0JtXbzJcL9Uf6Hu
	MUA/XxagQfhRY0E4LfSdQ/q9RHSAot0msKi/9AD2Y1Je3GerAyxBndyGnbOIaV0aT4pievWALOh
	/mVCZ4k0zx8yHZRRM0QDIVKTzI7npjhoE3lZQlOfM/VrnnulQ6sAhLP6Wt4hFHSTgI3O8yneN3u
	iKZB/tdkVi4fR3pGp/YRdwTdYZSCEir+7vdFqKXRoNJPO6ZPLb1L71DsbW2a0j9EGFQbns7M8v5
	yJ//z/hZB2/nBYHYfO2BQQZpEmN3lgQokh1NzcHs+cec6CXFnGWstaGkbzXewOe6RlIWAYSB+zc
	k3Cq4B18j8LG/fYSHJVvHTug/YqXM/r53XA35/69GXSvqqMNTNnLJO9DzUwFVrsnEzpki1H/A0/
	u59KS1R/vDzzw0=
X-Received: by 2002:a05:6a00:4787:b0:882:b2a:4840 with SMTP id d2e1a72fcca58-88749bed3e0mr770897b3a.2.1790760551234;
        Wed, 30 Sep 2026 02:29:11 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8872624c5b5sm493474b3a.43.2026.09.30.02.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:29:10 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: [PATCH] clk: qcom: dispcc-x1e80100: don't disable display PLLs in the unused-clock sweep
Date: Wed, 30 Sep 2026 17:28:55 +0800
Message-ID: <20260930092904.5222-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UEFI leaves disp_cc_pll0 locked and running for the handover
framebuffer.  clk_disable_unused() runs before any
display driver probes, finds it unused (no consumers, no
CLK_IGNORE_UNUSED) and powers it down through
alpha_pll_reset_lucid_evo_disable().  When the DPU driver later
enables mdp_clk, alpha_pll_reset_lucid_evo_prepare() performs a
full PLL reset and relock.

On X1E80100 that relock can end up marginal, and whether it does is
a per-boot analog lottery.  A marginal PLL degrades the DPU core
timing just enough that the DisplayPort controller drops every
other MTP (micro transfer packet) of the pixel stream fed by the
DPU.  The result is static black vertical bands on the eDP panel:
at 2560x1600, 24bpp, 4 lanes, one MTP is 4 * 64 symbols / 3 bytes
per pixel = 85.33 pixels, so the screen splits into exactly 30
bands of which every second one is black (20 bands at 16bpp).
This reproduces on roughly half of all boots and persists for the
whole boot.

The corruption is invisible to every register or clock-state dump:
the PLL locks either way, only the lock quality differs, and all
programmed values (DPU, DP controller MSA/TU, PHY, dispcc) are
byte-identical between good and bad boots.  The controller's
internal BIST pattern stays clean on a corrupted boot, pinning the
failure to the pixel ingest timing fed by the DPU.

Verified on an Acer Swift SFA14-11 (X1E78100):
  - clk_ignore_unused on the cmdline:                7/7 boots clean
  - keeping only disp_cc_pll0 from the sweep:       10/10 boots clean
  - keeping any other clock from the sweep:        still corrupts
  - with this patch:                                10/10 boots clean

Keep the firmware-provided PLL state by marking disp_cc_pll0
CLK_IGNORE_UNUSED, the same way gcc drivers protect CPU hfplls
(cf. gcc-msm8960).  Other drivers using
clk_alpha_pll_reset_lucid_ole_ops for their display PLLs (sm8550,
sm8650) may carry the same latent issue.

Fixes: ee3f0739035f5 ("clk: qcom: Add dispcc clock driver for x1e80100")
Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Assisted-by: LLM

---

 drivers/clk/qcom/dispcc-x1e80100.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index aed06203a886a..5613f1fdb2e4a 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -94,6 +94,21 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_pll0",
+			/*
+			 * The boot firmware (UEFI) leaves disp_cc_pll0 locked
+			 * and running for the handover framebuffer.
+			 * clk_disable_unused() runs before any display driver
+			 * probes, finds the PLL unused (no consumers, no
+			 * CLK_IGNORE_UNUSED) and powers it down.  The DPU
+			 * driver then has to relock it via the reset-prepare
+			 * sequence.  On X1E80100 that relock can end up
+			 * marginal (per-boot analog lottery), degrading the
+			 * DPU core timing enough to corrupt eDP output at
+			 * MTP granularity (every other micro transfer packet
+			 * delivered blank, on ~50% of boots).  Keeping the
+			 * firmware PLL state avoids the relock entirely.
+			 */
+			.flags = CLK_IGNORE_UNUSED,
 			.parent_data = &(const struct clk_parent_data) {
 				.index = DT_BI_TCXO,
 			},
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
branch: dispcc-x1e80100-keep-disp-plls

-- 
2.47.3

