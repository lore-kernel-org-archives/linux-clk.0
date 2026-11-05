Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880694;
	b=qqrM4Mb5Ux1fyRPVpATj1xrz6MwJLo3zgE+ACmGMSHk3z9G3z7dCHFbWmceyDHDEPo51
	 Z501O1/DCQVCwylv+4GLMye7B3QTIX+Rfoe/dbeKRCX+8ImZuHxJhdy49d2MEM1w5XOxK
	 ki9/1Q4sBiqI5gVkNXVoqJ/n0786xseRaf6S/OmnLaZO4DEQGgczFFQPeUyrxxDir/aC/
	 Rnw2n9HiVP7jzAGfuCNUo1WF7zjd0Ln812prz9JQWcVPh5yPeKC+BaC/HQJKG1b0fY4e7
	 SKbEZH4URFKQ2ZicEtOic9gwnVtNCP90rPCHNYgiDNCMLpJBrKelYLB33Niet99POQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
	b=IyD8J0LwCtbPu+3pyMfLw2NWgCa08Wcw4QwFOu6JxaR5IEB+7crPd3iCWae4lAYHLZtD
	 55zCGoy0cAgsJZ2CJx/9OVdNUua1V5yr1WS8mk137wg4KG1rjZAdjwa4hC11IbYxxUSCW
	 BJTMro7wiK3cUEdW80XTRTHd/d0JhSbJFPCIgxMBfh7URYK+zRzQKc+1h/M8wvagjd6pH
	 Zn4z2/bNYFJTx1cnoPo8b+nXlytPucWCYNUfCHS5d3PkKPa37I7MYQyouOL9DWXC/ifcV
	 +hpCnK4T0tfm/HSlM5qA0anIt372NnW/ECT07rhQpFjKNj/63acf2FWnH7Ei76+We0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmXZNG6g;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4EC606EE9B
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 12:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4EC606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmXZNG6g
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so16156525e9.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 04:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880687; x=1794485487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=TmXZNG6ghQYIwS8rLb6UXuIOgAX41WufUyU5O4906YvMWU2VO7I9LZCawzVsJi7QVM
         s5R9sjUeo1pl1ba8iTIDNoSUV/J9xo3UHIOqHj8z6PP41JhlB8TOH7Woz3c66VI2k0fF
         iLZqiGNezOOyKJhUktDjTqbfA9C8KPquuzSELgJzVJZmTrGGzKwshu6Ob2IPWTf3BoxF
         WfAlqeDCOSff54ElpzpTVtmbaXb+MRIai8JpxU4MRHgfttVYI3R01l9s5MslzMFiSbVZ
         TLYnOfi5ysE/cP9ZBqoj23wf7Qe6loWoz/SM9yHiO0okrwTuUgM62DXkxnCAkELNHnDM
         fBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880687; x=1794485487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=OqDYycNFQZ4weGBqhYKU4RgHpi9R5PbSLVcHel8HDdybGc035JW2pHMiRuWT8yTHvR
         qHsIT7OexT5MroVKvTiedA8qqVhbMu1c77sCvzBBbC0LPfRrWj4WZj100lxgYQv0yeYY
         HtlGE7mdNAb2PsfGivdGvKPDosv4CIY/eglJTJ1kRcUjSJM6324ONN8FK1/6Plz+4u9+
         xlrRQtepRcPoowhCQlzfD1DrFMYmr8TpL4UDnRu/m1+fdHC9ZluVLToIJoyRsRKllPwP
         iwZTfmnZP9cXkBZQnAF8LgfET3INs4falZ7Bfoe9zdSJT+3sugTzcu+AX+BTSaDqS4my
         akYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmNrWXRDnBvm3tNS1F2z/REM9COYDZ0Q29LDLIZgCaa9qM5opBHF1dJXs36Tz2eIXRrXufUSLHY4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wJ7bRvfBkJtKIGX5zyPM5l+ngGUcpiNHDD/ufGXk645umZtsl
	Ajrmp+OtWiYrVtexSeMfwoTYxbNmpXna8qDStwypvAWPSvpwf1FiTiNdFuusLQ==
X-Gm-Gg: AYBFou01ukKiyKzvLbDyBFA/iEgGdHAsmYrGLu+eQfZHde5ohumBxy/DaMs4YhDSb4N
	OCu28fBJv+gRcO0DvcYsn3gSiEtZSRktl2lghTod8Uwh4Q848QvqChx3+cjKZTP7tc7pJXwsN6l
	6YHjiby22Rk0hTL9kjZVdeduAJGnh26gQqUcIUOuLKUhk1rEBs2ESjJjsmsft91hTi0J7KH3y4C
	si4akEPwjLbPvmpK+XPn7Oz4MVfIXaXNbkiSIuKPYgqKH509pI1+APQVw3rRwUPrOQuRwnqhxto
	5Aw+8r+K2JdZlR0PjLsyN5EC8+FBv6CpYh4XUjsa/790BMuRZDORxqnl311jnY4CXqLSdIrpaiB
	6CCCsMAz1QAJc0QQ7PInfDwk+CdxMDQxMwerfAq7bHN+SRHb86PPkyAnckYVeAEcZZJLT95r6dX
	G7YcOk5ju5oEReIdjbdILMHEYf1rnLrrk1Y53v58jqDwaTyL2pCkcsFlRdB0klAs2mqGbAR1+CR
	DtAFonz3G/jYxBZsLXWv02P5gNBWjPoNHIXEWZgd3ppTkUIlx/kTP3oqLg2kLXz4pjeq60VLXNN
	Zi7dJdrsq4HyH0V0iGYAKPsKtK3fVnLvgobzSEZIjLzn92msA7tS//Gx6kpnmzkqqAdK6hZEoBb
	gzf+VbZONCUanE6BWwMtvZu3C
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr412102875e9.2.1793880687317;
        Thu, 05 Nov 2026 04:11:27 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v10 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Thu,  5 Nov 2026 13:10:55 +0100
Message-ID: <20261105121059.11201-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..2baec734df9f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -708,7 +708,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -770,7 +770,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1105,7 +1105,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

