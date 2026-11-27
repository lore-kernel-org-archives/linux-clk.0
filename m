Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764819;
	b=2P5v7Zi6HNnfKPx2qaR20ldcFtkoeVb5S4igUZMADhwuZeuDKcSVNZx87WQgnnQmdnTy
	 chIZ6w3En3ELJGsRO5I6RRCkzjmZQw0escjjQqUlT4ilD2jA6pV342eaUy8ks3yvlQPOL
	 RZzkH/LfFm9emBYDw/bEX8BCIluw44oBukMhkGdCMUhP1QcRVavyBtlS8jZ7qgLih+sHx
	 CvtdmAVIpxsS2jY/IGUFpx4Cb/DqZWPbpyIN4CGdZ0US2LL4eY45F7VSAjdMrCMP0S7Os
	 Uty0vjBm+VZhIuE5dtICz6NK1xTQ+UCOck35G1ssHq/wvi2Ki2pdcyHO2Fn65JLetRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764819;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZQnPEju6KfsvOVnoWN6Y7e8NURws113vktNgMx0Bbf8=;
	b=W++P5/JzOof+a5hwtmrNKKH+rJo3Zdum4oSp64EOcH/OOJNJSfEHV8ldhTlxUJ9KNK9u
	 l0Z1Vs8PWrNVXatb329f9jQYvk6mgAyM2V80nO06sEqIWfrCH0E9chsRM8e9Rz6fFoZ5S
	 Bc8210WG4OZSYzSOeyeVAFdVuSFjrPGv8s8SC9qH8tcULcByfxujf88X0UnGGY6vgX4pd
	 /rRMEC5hdnr1vdX69j8Z7qsrIoa3TDxZL+a0LmTpKOEK5Vp1B2Wc+f6sIGv8uYRgTog3e
	 gfLZtZ5o/40pzb+6mxYqn3Y3kWHITqU10yWQ5kbOI7XtQPT7BAFY0SArg0Ih3l/QJLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Wd+zN8D5;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870D606A31E;
	Fri, 27 Nov 2026 07:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C870D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Wd+zN8D5
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 5D56F4C975;
	Fri, 27 Nov 2026 18:33:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQnPEju6KfsvOVnoWN6Y7e8NURws113vktNgMx0Bbf8=;
	b=Wd+zN8D5SsiTKFbMkRvB3K3EE3aQfWbf2lOYZjTZUfTWs9PQ/PmgtTp5AdUwmz+nSCgbgX
	rCBy90MG2pCsTmzHYsdJ0oQtciBQXVe8Ur8z5H60BhC25ee41idgNv2GTjh6OCjYWFw4KH
	yeieOOfoFdgTyoQmyI7uG4JzP3h/lXNP9QivheaoUIivlZ1+fUl02JJWrNmLt9zfnM8WpS
	iB4fm0V7Q5147Kzq4rKE2le/KS2Sxz+c0CzUNVJ/Hm+EHrfPopWNTrw3A+BnxtnS6N7MYC
	feCVIxvfxTNm3ExuMkkwou3pEM0vbxK7BjTxH83zZ6RW8hXgrKwzDxqd87dByQ==
X-GPT-Reason: legitimate_personal_correspondence: The email is
	a technical patch submission regarding Linux kernel drivers (usb:
	dwc3) which aligns perfectly with the mailbox purpose for
	alastair@d-silva.org. The "From" domain (d-silva.org) matches
	the recipient domain, and the content follows standard open-source
	development practices with a clear technical subject line and
	signed-off-by footer. There are no phishing indicators, urgency
	tactics, or suspicious links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 08/11] usb: dwc3: Add Allwinner A733 DWC3 support
Date: Fri, 27 Nov 2026 18:32:28 +1100
Message-ID: <20261127073231.1776847-9-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
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

Add inverted sync header support, A733 match data, and post-reset PHY
calibration on host start.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/usb/dwc3/core.c              | 18 +++++++++++++++---
 drivers/usb/dwc3/core.h              |  8 ++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c | 15 +++++++++++++--
 drivers/usb/dwc3/glue.h              |  6 ++++++
 drivers/usb/dwc3/host.c              | 10 ++++++++++
 5 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f4aa6a01e500..3fe68d085a85 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1503,13 +1503,16 @@ int dwc3_core_init(struct dwc3 *dwc)
 	dwc3_config_threshold(dwc);
 
 	if (hw_mode != DWC3_GHWPARAMS0_MODE_GADGET &&
-	    (DWC3_IP_IS(DWC31)) &&
-	    dwc->maximum_speed == USB_SPEED_SUPER) {
+	    DWC3_IP_IS(DWC31) &&
+	    (dwc->maximum_speed == USB_SPEED_SUPER || dwc->inv_sync_hdr)) {
 		int i;
 
 		for (i = 0; i < dwc->num_usb3_ports; i++) {
 			reg = dwc3_readl(dwc, DWC3_LLUCTL(i));
-			reg |= DWC3_LLUCTL_FORCE_GEN1;
+			if (dwc->maximum_speed == USB_SPEED_SUPER)
+				reg |= DWC3_LLUCTL_FORCE_GEN1;
+			if (dwc->inv_sync_hdr)
+				reg |= DWC3_LLUCTL_INV_SYNC_HDR;
 			dwc3_writel(dwc, DWC3_LLUCTL(i), reg);
 		}
 	}
@@ -1694,6 +1697,15 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	if (properties->needs_full_reinit)
 		dwc->needs_full_reinit = true;
 
+	if (properties->inv_sync_hdr)
+		dwc->inv_sync_hdr = true;
+
+	if (properties->calibrate_on_start)
+		dwc->calibrate_on_start = true;
+
+	if (properties->xhci_w1c_port_change)
+		dwc->xhci_w1c_port_change = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f635a9fbc151..e65629f9d437 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -677,6 +677,8 @@
 
 /* Force Gen1 speed on Gen2 link */
 #define DWC3_LLUCTL_FORCE_GEN1		BIT(10)
+/* Invert sync header on Cadence SerDes */
+#define DWC3_LLUCTL_INV_SYNC_HDR	BIT(30)
 
 /* Structures */
 
@@ -1151,6 +1153,9 @@ struct dwc3_glue_ops {
  * @dis_u1_entry_quirk: set if link entering into U1 state needs to be disabled.
  * @dis_u2_entry_quirk: set if link entering into U2 state needs to be disabled.
  * @dis_rxdet_inp3_quirk: set if we disable Rx.Detect in P3
+ * @inv_sync_hdr: set if Cadence SerDes requires inverted sync header
+ * @calibrate_on_start: calibrate USB3 PHYs after xHCI reset
+ * @xhci_w1c_port_change: enable xHCI W1C port change quirk
  * @async_callbacks: if set, indicate that async callbacks will be used.
  *
  * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
@@ -1419,6 +1424,9 @@ struct dwc3 {
 	unsigned		dis_u1_entry_quirk:1;
 	unsigned		dis_u2_entry_quirk:1;
 	unsigned		dis_rxdet_inp3_quirk:1;
+	unsigned		inv_sync_hdr:1;
+	unsigned		calibrate_on_start:1;
+	unsigned		xhci_w1c_port_change:1;
 	unsigned		dis_u2_freeclk_exists_quirk:1;
 	unsigned		dis_del_phy_power_chg_quirk:1;
 	unsigned		dis_tx_ipgap_linecheck_quirk:1;
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index 3e90ddf25809..568fa1a26379 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -72,7 +72,7 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 	return 0;
 }
 
-static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
+static int dwc3_host_vbus_init(struct dwc3_generic *dwc3g)
 {
 	struct device *dev = dwc3g->dev;
 
@@ -219,10 +219,20 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
 };
 
 static const struct dwc3_generic_config spacemit_k1_dwc3 = {
-	.init = dwc3_spacemit_k1_init,
+	.init = dwc3_host_vbus_init,
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config sun60i_a733_dwc3 = {
+	.init = dwc3_host_vbus_init,
+	.properties = {
+		.gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,
+		.inv_sync_hdr = true,
+		.calibrate_on_start = true,
+		.xhci_w1c_port_change = true,
+	},
+};
+
 static const struct dwc3_generic_config fsl_ls1028_dwc3 = {
 	.properties.gsbuscfg0_reqinfo = 0x2222,
 };
@@ -233,6 +243,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "allwinner,sun60i-a733-dwc3", &sun60i_a733_dwc3 },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index a1284c481390..12a24e9016eb 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -14,10 +14,16 @@
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
+ * @inv_sync_hdr: set DWC3_LLUCTL_INV_SYNC_HDR for Cadence SerDes
+ * @calibrate_on_start: calibrate USB3 PHYs after xHCI reset
+ * @xhci_w1c_port_change: enable xHCI W1C port change quirk
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
 	unsigned needs_full_reinit:1;
+	unsigned inv_sync_hdr:1;
+	unsigned calibrate_on_start:1;
+	unsigned xhci_w1c_port_change:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index cd1e5204ac3a..e45d8b14b60c 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -68,6 +68,7 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
 {
 	struct platform_device *pdev;
 	struct dwc3 *dwc;
+	int i;
 
 	if (!usb_hcd_is_primary_hcd(hcd))
 		return;
@@ -75,6 +76,12 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
 	pdev = to_platform_device(hcd->self.controller);
 	dwc = dev_get_drvdata(pdev->dev.parent);
 
+	/* Calibrate PHYs after xHCI reset to complete clock handover. */
+	if (dwc->calibrate_on_start) {
+		for (i = 0; i < dwc->num_usb3_ports; i++)
+			phy_calibrate(dwc->usb3_generic_phy[i]);
+	}
+
 	dwc3_enable_susphy(dwc, true);
 }
 
@@ -174,6 +181,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->usb2_lpm_disable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
 
+	if (dwc->xhci_w1c_port_change)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-w1c-port-change-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.53.0

