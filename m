Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B54C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 18 Mar 2022 21:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240991AbiCRVFT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Mar 2022 17:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233725AbiCRVFS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Mar 2022 17:05:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0653E7804D;
        Fri, 18 Mar 2022 14:03:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA342B825A1;
        Fri, 18 Mar 2022 21:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D1EC340E8;
        Fri, 18 Mar 2022 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647637436;
        bh=N6JXDVvD2qwFn3Rghw33dUyxvWQeDTHpcOM38Jqnf3c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YWfH7Ee4z5uJ4+LgCcYfFWIZqOHHRHRIRbyeBU0wHPpYzDAgv67BO0Y2f54Rtihax
         2zYlsDS+iCpki0w8ch4WQZhnEUDATIPG4KE0UmFs0lJqUEcz82cVH6WPhkq02r1wLr
         NN+uJ3bwC//97kaSnCpqVUJbnAkQWalPQgIvc1klTQaVrnL5up67+Sny3eFEPiYdtp
         N9ulZs3eLrPUX1zlUmph2YmEiiGiksPI0obSXNqmaE7l50lVLRjeHoPd0NN51vjlOF
         z58qmz0uOAehCdEt5pJXtCYvyQoo5bhIW/YpG+6VQiL/eY20rHrNHg76ED/d+LETfi
         UElV9qrKVjtSQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220226040723.143705-2-marex@denx.de>
References: <20220226040723.143705-1-marex@denx.de> <20220226040723.143705-2-marex@denx.de>
Subject: Re: [PATCH v3 2/3] clk: Make __clk_hw_register_fixed_factor non-static
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Fri, 18 Mar 2022 14:03:54 -0700
User-Agent: alot/0.10
Message-Id: <20220318210356.55D1EC340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-25 20:07:22)
> Access to the full parameters of __clk_hw_register_fixed_factor()
> is useful in case a driver is registering fixed clock with only
> single parent, in which case the driver should set parent_name to
> NULL and parent_index to 0, and access to this function permits it
> to do just that.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---
> V2: - New patch
> V3: - No change

This isn't exported. Given that we don't typically export an internal
function (hence the double underscore) I'm going to change this to be a
new function. See the attached patch.

---8<----
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 81d8c9e430a2..54942d758ee6 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -76,7 +76,7 @@ static void devm_clk_hw_register_fixed_factor_release(str=
uct device *dev, void *
 	clk_hw_unregister(&fix->hw);
 }
=20
-struct clk_hw *
+static struct clk_hw *
 __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 		const char *name, const char *parent_name, int index,
 		unsigned long flags, unsigned int mult, unsigned int div,
@@ -131,6 +131,28 @@ __clk_hw_register_fixed_factor(struct device *dev, str=
uct device_node *np,
 	return hw;
 }
=20
+/**
+ * devm_clk_hw_register_fixed_factor_index - Register a fixed factor clock=
 with
+ * parent from DT index
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @index: index of phandle in @dev 'clocks' property
+ * @flags: fixed factor flags
+ * @mult: multiplier
+ * @div: divider
+ *
+ * Return: Pointer to fixed factor clk_hw structure that was registered or
+ * an error pointer.
+ */
+struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
+		const char *name, unsigned int index, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, index,
+					      flags, mult, div, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
+
 struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index cd8229dd8123..59d9cf0053eb 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -250,8 +250,8 @@ static int rs9_probe(struct i2c_client *client, const s=
truct i2c_device_id *id)
 	/* Register clock */
 	for (i =3D 0; i < rs9->chip_info->num_clks; i++) {
 		snprintf(name, 5, "DIF%d", i);
-		hw =3D __clk_hw_register_fixed_factor(&client->dev, NULL, name,
-						    NULL, 0, 0, 4, 1, true);
+		hw =3D devm_clk_hw_register_fixed_factor_index(&client->dev, name,
+						    0, 0, 4, 1);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
=20
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index d216221448d3..b7a7923f6bbb 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -992,11 +992,6 @@ struct clk_fixed_factor {
 #define to_clk_fixed_factor(_hw) container_of(_hw, struct clk_fixed_factor=
, hw)
=20
 extern const struct clk_ops clk_fixed_factor_ops;
-struct clk_hw *
-__clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
-		const char *name, const char *parent_name, int index,
-		unsigned long flags, unsigned int mult, unsigned int div,
-		bool devm);
 struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
@@ -1008,6 +1003,9 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw=
);
 struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
+struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
+		const char *name, unsigned int index, unsigned long flags,
+		unsigned int mult, unsigned int div);
 /**
  * struct clk_fractional_divider - adjustable fractional divider clock
  *
