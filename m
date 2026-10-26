Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016576;
	b=aH9rpUX9ebiPc+jsRHIdUaNKM3z1lCOTZg3k0B7xdqa7LsavM6q+IPnHzTELbnsOu4Gl
	 BUEXZkecvmbD2W2WT/NkcLxdNkxRWCFmyjvJhJDMBtypISmJT8DUsFBVgFYBv29sLsVUa
	 S5YC5S+kYW5Vhw1sS3N++pyws/GkFY7dOUWs4Si6VgKyYNT0zokiOFTly/inixGrGcrXI
	 z6sQzA5JQLxH03Oh/Le22X3E/mY/yvrBOGketAx2Yzql15NPVyGB4RBGmEAvAJsZvlRK0
	 f56VFTLr/SKOTEyXLEUCx54h4INOs3iqqP8TQS63MwngLbCpi1bY4E3ure3fPlC2o6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
	b=cYmstAv7tx2Sd7U5iPEYpG4b1uloHTGQwMujh0A3TeE4jHZNh2UXiAD3xEemb4pQrho2
	 2oKj7/t1rERFDHDsPAjG83GSc5eRMAi9B3abyyftP79FIQpGfOuPbJLDgs7+E20/9PZwZ
	 /cXh9VMVZdQyQSh4i6ojHQM4QDQ5XpAMfEMudFQW2UC4QpAZPRdkE6TIPIuug+WFLnY8e
	 f7eTy8exr9+6NXfuqVxWHRxHYYfrLVumuqjiNRFWpHcJcoQJFRgFOewqF/pUSJmbJjgHP
	 FXhqj9Q6NUawiPZaSt8q/RVYfObbbmPI2Nodli5nxEuxvtmV5S9P8PLqIUjzW9B4E6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iIUte97a;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13843606A335
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 12:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13843606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iIUte97a
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so27738395e9.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016574; x=1793621374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
        b=iIUte97aZggi1ofFx441f7srimg+KRDXl/VmYiuWpcYhadX+Ovwfl4Rh6DwuiJo3Yr
         B6X1SRL1QwmK1NMBD0B9Q443BGgzJTdLi+MZCawjeW8rN90arvLoMnrtTpJc7/mLluS4
         TVxwb82PiDs7/jGS9D5e5z+nMd4j2zGYcmvtwiqzFC9q+AzKtbc0u3feJuOs9cjhQyDl
         49qgIVHn1kly6YBjJCy9qpQpl8DOvzZFmpOBvIGdf5dbFTx4OKjtpmvG8CyNceLUNMSb
         JWMhYaKHBzu1TsYp5uIqVXGuUTnWEgON/ZpQPtZ8AhZAE3spwZVntcErtvMPpPR9vwzm
         fWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016574; x=1793621374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
        b=Q13iUBwE+02IniRiUuEpcsxwIB+MPlxu3NsGNsHD6Hx8T+YcGXuAPX+LS00+CpCnjl
         X0ph33r2LXpkxAbCLpdyh0oG+IFAo3bL8CbggC+4tf9fwZMRijYHp/dASI0lGdgn9upp
         3HNaXwgFHxCyRoQgfad/9oASVA1FEzt7FEtPqyYoZhXJSM0dAUWn+jESkHep8S1AadD9
         ZCZERImf4h470oaXeHfVGpTHHb7bv4LaKacWVk2+eFV+ShoS0aFQX0GU+7WKJ/TyKQVz
         qBtZ4rFKUaYnUSuDNWZGZId7WYx5SMM9cQ4Zyb1bFF60SV/MHQXXM12dRpHYICFH3vqO
         KUUg==
X-Forwarded-Encrypted: i=1; AKwUvBwQIiRi2uv41IBUUB4GdblK/M22A1c1uRQFKje4wCJTp3DanyPQxMSSxK8T6Wfsl9+QtxenDCzaiCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKND1t8PXFpQraiUHhW7KNFeypp0oz2WYVEGrur4t3uxpAYh+m+
	LYUJzz6USU6LEBuiKRSQ85Up0DkewD7hcxJbQjiMwwgEBFHlTCghSZo9
X-Gm-Gg: AYBFou27wNcq6rOxODQhWou/uURYe9QDtlANENBAVOatR36HecQFzqnwWAwDQEbdFU3
	Ro5ajJulxdV5pwz/MfEh2FG3JlKiAEzWxw5m566CLYljN65/5voXZ/v1quewhe72VH2GhvaJbg+
	rVfSyd3xZJNcZQ+zhlR/WB2Jv8OzN6B4PGC/qN1JrvwwDHn3+Eiuk1HammPhA3FAKa5CFfBwvpl
	uOZpvjzzWeaI8vNU+tj7fTzCd+Dmh1PCPVvFGSa5t6/4+o6EyuK+QLypiEmWFbSM6PT/4Nj1NpG
	jpH1NcNHDN52I94aFji/Zs/p8VL6HgucgNTajPfbu53vh/p/yrZG0Hv+NrvOzzzpt9GRpKK7I/X
	kreSacvPcGRrLPyVioyUmmy1jVPg/oSlAVD3JocehvlEgO6BiLE8oqt15zMm9OOt0Bn7e9UyB75
	a8+GjwpfGBKTNi2zUt0++TfiENB1BsgCuYRBCxbgDyeJ+JaVUGgaRp3PEu1JPsEsdVro9zCnjhg
	J3bZfFNmLDm3FvBTkfSIaDqXOBa+bbBNO8PXlsQyyNdaiNlyeWhy5sEZ6lufVspO/kA9VrdWgxU
	xUVhhMsWpczRqbe2m8exWS556NIQQ8prf0H/srjoG2nsECdB0C5IdgIlGfv7XF8MCG8Dk4HKlXO
	qcvSn
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr111607605e9.2.1793016574151;
        Mon, 26 Oct 2026 05:09:34 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:33 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with binding
Date: Mon, 26 Oct 2026 13:08:14 +0100
Message-ID: <20261026120920.1667982-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

The GCC binding names the CMN PLL inputs bias_pll_cc and
bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
clocks through DT references.

Keep the existing .name values as fallbacks for older device trees
without these optional inputs.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- New patch to align GCC parent lookups with the binding input names.

 drivers/clk/qcom/gcc-ipq8074.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 1329ea28d703..68c080d49154 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -1132,7 +1132,7 @@ static const struct freq_tbl ftbl_nss_noc_bfdcd_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2[] = {
 	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
+	{ .fw_name = "bias_pll_nss_noc", .name = "bias_pll_nss_noc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll2.clkr.hw },
 };
@@ -1357,7 +1357,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
 	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &nss_crypto_pll.clkr.hw },
@@ -1411,7 +1411,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_rx_clk", .name = "uniphy0_gcc_rx_clk" },
 	{ .fw_name = "uniphy0_gcc_tx_clk", .name = "uniphy0_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
@@ -1463,7 +1463,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_tx_clk", .name = "uniphy0_gcc_tx_clk" },
 	{ .fw_name = "uniphy0_gcc_rx_clk", .name = "uniphy0_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
@@ -1704,7 +1704,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bia
 	{ .fw_name = "uniphy1_gcc_rx_clk", .name = "uniphy1_gcc_rx_clk" },
 	{ .fw_name = "uniphy1_gcc_tx_clk", .name = "uniphy1_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -1774,7 +1774,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bia
 	{ .fw_name = "uniphy1_gcc_tx_clk", .name = "uniphy1_gcc_tx_clk" },
 	{ .fw_name = "uniphy1_gcc_rx_clk", .name = "uniphy1_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -1842,7 +1842,7 @@ static const struct clk_parent_data gcc_xo_uniphy2_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy2_gcc_rx_clk", .name = "uniphy2_gcc_rx_clk" },
 	{ .fw_name = "uniphy2_gcc_tx_clk", .name = "uniphy2_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy2_rx_tx_ubi32_bias_map[] = {
@@ -1907,7 +1907,7 @@ static const struct clk_parent_data gcc_xo_uniphy2_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy2_gcc_tx_clk", .name = "uniphy2_gcc_tx_clk" },
 	{ .fw_name = "uniphy2_gcc_rx_clk", .name = "uniphy2_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy2_tx_rx_ubi32_bias_map[] = {
-- 
2.56.0

