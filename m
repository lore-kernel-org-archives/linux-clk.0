Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2A2C3248
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 20:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769717411; cv=none; b=gUDFjMDiDW/pDscqRrCK4NqxZ/8pKaWexBV+cecfsluk1s8PI5fyW/7bMCLKMRoiChzPzaqZnaeVnt+PR++jx74oJBiK/83rbGfltUhbG+vulKej4fepoZZfh1Kcj71+sgwJBVJO28k9V3J3+Z1nDp6n2I9Zr4cHoD2SBCISSWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769717411; c=relaxed/simple;
	bh=HTjfiMkq8RWWWUv9jdTxS8NVwKGdN0hsGAeGh5zdU9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=it8HWzzsqfjurA1Xdi3KzkGzhBrhUDtmQkvnOUTfaiJOcXGq2D1RvMsySzbf3oUR78YJ0Uu082X5xmJxUaVmqhtB1XU/LLopYh3QlpLxPfQIBzfaldZBAR40HmO9s9sPFBvkOvzSbpDqP3lzr9/w25wXmD9mWCUPJKFlX3sAb+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l26n+1al; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l26n+1al"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF6331A2AEB
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 20:10:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8939D60746;
	Thu, 29 Jan 2026 20:10:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13886119A880F;
	Thu, 29 Jan 2026 21:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769717407; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=kfgnhySIfhTldLCk3EcEzLPPD58B6WtDCE5MTj3qFJU=;
	b=l26n+1al9VwsTTslKF0cExQ4FYlsd9PDGj8d5lba+I5kumQKNwD8Hs16i/VnCDXHflvlX/
	TRsF15NCPopAOSsURC34s+i80xVt1HMvTzNRqKpFSTMFjCeWuX3CFnpOA9uEgB3G3yMrCU
	61ouO1zFZVlgwNVZaafPAaijKW2/kV6qX4nC1Zo2w4P5Abffy9gAP6pOftsG9p4s+svtim
	Cza9ZzI7Uajn04uLPwG6QgUT1cw+n7Sm7ANPHRWp9oicxJio46WBWVvo5WM5fVjYqpVsuw
	fLCS3QUSmfrF9BeMwEsarZQB9v4tImsuB4euw+5AUoaSjsSNi5+4/1Y1kKYy9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] clk: Add support for clock nexus dt bindings
Date: Thu, 29 Jan 2026 21:10:03 +0100
Message-ID: <20260129201003.288605-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

A nexus node is some kind of parent device abstracting the outer
connexions. They are particularly useful for describing connectors-like
interfaces but not only. Certain IP blocks will typically include inner
blocks and distribute resources to them.

In the case of clocks, there is already the concept of clock controller,
but this usually indicates some kind of control over the said clock,
ie. gate or rate control. When there is none of this, an existing
approach is to reference the upper clock, which is wrong from a hardware
point of view.

Nexus nodes are already part of the device-tree specification and clocks
are already mentioned:
https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping

Following the introductions of nexus nodes support for interrupts, gpios
and pwms, here is the same logic applied again to the clk subsystem,
just by transitioning from of_parse_phandle_with_args() to
of_parse_phandle_with_args_map():

* Nexus OF support:
bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
* GPIO adoption:
c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
* PWM adoption:
e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")

Expected Nexus properties supported:
- clock-map: maps inner clocks to inlet clocks,
- clock-map-mask: specifier cell(s) which will be remapped,
- clock-map-pass-thru: specifier cell(s) not used for remapping,
  forwarded as-is.

In my own usage I had to deal with controllers where clock-map-mask and
clock-map-pass-thru were not relevant, but here is a made up example
showing how all these properties could go together:

Example:
    soc_clk: clock-controller {
        #clock-cells = <2>;
    };

    container: container {
        #clock-cells = <2>;
        clock-map = <0 0 &soc_clk 2 0>,
                    <1 0 &soc_clk 6 0>;
        clock-map-mask = <0xffffffff 0x0>;
        clock-map-pass-thru = <0x0 0xffffffff>;

        child_device {
            clocks = <&container 1 0>;
	    /* This is equivalent to <&soc_clk 6 0> */
        };
    };

The child device does not need to know about the outer implementation,
and only knows about what the nexus provides. The nexus acts as a
pass-through, with no extra control.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/clk/clk.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..bb52837a9f76 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5213,13 +5213,13 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		/*
 		 * For named clocks, first look up the name in the
 		 * "clock-names" property.  If it cannot be found, then index
-		 * will be an error code and of_parse_phandle_with_args() will
+		 * will be an error code and of_parse_phandle_with_args_map() will
 		 * return -EINVAL.
 		 */
 		if (name)
 			index = of_property_match_string(np, "clock-names", name);
-		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
-						 index, out_args);
+		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
+						     index, out_args);
 		if (!ret)
 			break;
 		if (name && index >= 0)
@@ -5286,7 +5286,7 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
  *
  * This function looks up a struct clk from the registered list of clock
  * providers, an input is a clock specifier data structure as returned
- * from the of_parse_phandle_with_args() function call.
+ * from the of_parse_phandle_with_args_map() function call.
  */
 struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
 {
@@ -5374,8 +5374,8 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
 	int count;
 	struct clk *clk;
 
-	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
-					&clkspec);
+	rc = of_parse_phandle_with_args_map(np, "clocks", "clock", index,
+					    &clkspec);
 	if (rc)
 		return NULL;
 
-- 
2.51.1

