Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455676;
	b=3ewzbmQu9k0kPnEWiZ5cQTsJYK5JEf/P3yuDL6bPHBCk+xfwtRdZBSFkWm78o0eP/Ei1
	 0msuVA/SWlvnD41DvpDV0GiIySHGzIlXwVMVaV7MlILF00V1riitG5xi8+kNUgFoav0Ke
	 mqQBlh6bJNs2hDlx191MVuRzHJBEVzCMtQDge0Pl2v/MerVe6MRpFKaShkFOuw0WTy/xk
	 z6C6iWZlTuyp2x/iKpM9rgWOuifRpAl4jkg5h9kyMgeIDy2ph0Xchc3AHZujrtzrr33NL
	 g1c9UPpdRF72GoK39eyyfyCGPhE+2Vh5R7XkL6f94CVB8iX1+oX+UY3BFnuTfn7c3oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455676;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ESZysrmfQUFNH+m6FpD5eDnva2LetIZ1aC3sdBbrzF0=;
	b=LWLVXJohyCStY0LShpneeSyuK73HVkQhFCzZXK8hkrjloR3B+oeTxJvVQspZvwjvojvd
	 FKPjyPah2kmQRXUOXroF2Gnw1vthrhlnRUTHXs2N2R9zMTCZNotTxuIU/18uGXhjMouge
	 8SVq6ltEt0v62X350OePVrkIYDuEDT8d7MMHDONYEJ1GnhmI5qylrZ8ItSaA2yjoxTSE+
	 x3s2ndzuh8la86uznSwUQbp6k2fU2NfYCyUfaxScvJ8qTwc8oLozlR6q1Iwk1QEd+h8+K
	 RrctfbzVJRnuWv/2Jq3R3qkjEdYBO6l+DYODj+4Hq0NwrPC8koLrfPnfspJIZttNpNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bnri0tWH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C56606A31E;
	Mon, 23 Nov 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bnri0tWH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB8C1F000CA;
	Mon, 23 Nov 2026 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455675;
	bh=ESZysrmfQUFNH+m6FpD5eDnva2LetIZ1aC3sdBbrzF0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Bnri0tWHBrn23F2VelVjctxSJFhVSOS5K59OkscgK/fPM5Vyr6JrKnncud6DdlSei
	 SNXvpTfK3n/ZjTgF+dGy71xSDRTz6pt2UjLQE9ZQfdFK7/1dZAaIRSvR0ngqi7804z
	 xfUNzkX0T9KWnFqeg6zJwBFvu13myfwSkz3119pfTcvYwNAOMVCZkZLjZjIzIFuHeu
	 edpbeNjYPBs3wK4eDLVdaXRLVw6GnSc+Oi2jWITym/vNQVIOuXxe+gZWhpHLYrznPW
	 loGVarnmQwsB3xKO3oA9PKJuURlpizRQcxarAnL70F+82KfdONCgRolDO9VhLG/qu/
	 qQuQMOYCYGruA==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] clk: rp1: allow the clock provider to be probed
 again
From: Brian Masney <masneyb@kernel.org>
To: Joshua Covington <joshuacov@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Andrea della Porta <andrea.porta@suse.com>, linux-clk@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261121181650.143474-1-joshuacov@gmail.com>
References: <20261121181650.143474-1-joshuacov@gmail.com>
Date: Mon, 23 Nov 2026 12:41:10 -0500
Message-Id: <179545567027.246915.947299820828330388.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=4059; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=vYwHTQFaiFcOdFiOEcdPU7jjLxefr+q68VzaqBSCDBI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZqrbf9Dt6NUp5spD0/iMsTMrLGkKEFq70TXhx7toJ5
 Z8+HAfedZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRoB6Gf2rHdxosbp7KZjG3
 8vqlCdNfLEut/fp+3tqc1dPLPs/4w/iKkWHf9W8Zcb7dcpV7Z3gqW/iuMonMZHC1C44TV8wUPPE
 thgMA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Joshua,

> The clock descriptors are static. The clock core clears hw.init when a
> clock is registered. When RP1 is unbound and bound again, the second
> probe registers the clocks without init data and oopses:
> 
>   pc : __clk_register+0x5c/0x9dc
>   Call trace:
>    __clk_register+0x5c/0x9dc (P)
>    devm_clk_hw_register+0x5c/0xe0
>    rp1_register_pll+0x24/0x40
>    rp1_clk_probe+0xc0/0x168
> 
> The clock core also leaves hw.core pointing to the freed clk_core on
> unregister. Some clocks refer to a parent that is registered after
> them, e.g. clk_mipi0_dpi to clksrc_mipi0_dsi_byteclk. On the second
> probe, their parent lookup can use the stale clk_core.
> 
> Restore hw.init and clear the stale state of all descriptors before
> registering them.
> 
> Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
> Signed-off-by: Joshua Covington <joshuacov@gmail.com>

There's presumably other drivers that will have the same issue as well.
Rather than having drivers all try to fix this themselves, let's see if
we can fix this in the core for everyone. Can you try this completely
untested patch? If that works, then you can take it over. It will need a
kunit test.

Brian


diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 673eac47450b..8e5b530d80b5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -119,6 +119,7 @@ struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;
 	struct clk_hw		*hw;
+	const struct clk_init_data *hw_init;
 	struct module		*owner;
 	struct device		*dev;
 	struct hlist_node	rpm_node;
@@ -4450,6 +4451,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	if (dev && dev->driver)
 		core->owner = dev->driver->owner;
 	core->hw = hw;
+	core->hw_init = init;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;
 	core->min_rate = 0;
@@ -4498,6 +4500,10 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 		pr_err("%pOF: error %pe: failed to register clk '%s' (%pS)\n",
 		       np, ERR_PTR(ret), init->name, hw);
 	}
+
+	/* Leave @hw as it was handed to us so that it can be registered again */
+	hw->init = init;
+
 	return ERR_PTR(ret);
 }
 
@@ -4654,6 +4660,7 @@ void clk_unregister(struct clk *clk)
 {
 	unsigned long flags;
 	const struct clk_ops *ops;
+	struct clk_hw *hw;
 
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
 		return;
@@ -4702,6 +4709,21 @@ void clk_unregister(struct clk *clk)
 	if (clk->core->protect_count)
 		pr_warn("%s: unregistering protected clock: %s\n",
 					__func__, clk->core->name);
+
+	/*
+	 * Return the clk_hw to the state it had before registration. Drivers
+	 * with statically allocated clk_hw structures can then register them
+	 * again, e.g. when the device is unbound and bound again. This also
+	 * makes sure that a clk_parent_data.hw reference to this clk_hw is
+	 * treated as an orphan rather than resolved to the stale clk_core.
+	 */
+	hw = clk->core->hw;
+	if (!WARN_ON(hw->core != clk->core || hw->clk != clk)) {
+		hw->core = NULL;
+		hw->init = clk->core->hw_init;
+		hw->clk = NULL;
+	}
+
 	clk_prepare_unlock();
 
 	kref_put(&clk->core->ref, __clk_release);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..a4c60ea06361 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -359,7 +359,9 @@ struct clk_init_data {
  *
  * @init: pointer to struct clk_init_data that contains the init data shared
  * with the common clock framework. This pointer will be set to NULL once
- * a clk_register() variant is called on this clk_hw pointer.
+ * a clk_register() variant is called on this clk_hw pointer. It is restored
+ * if registration fails or when the clock is unregistered, so the clk_hw can
+ * be registered again as long as the init data it points to is still valid.
  */
 struct clk_hw {
 	struct clk_core *core;

-- 
Brian Masney <masneyb@kernel.org>
