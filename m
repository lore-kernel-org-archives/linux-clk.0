Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822969;
	b=yR6WGqCvWveP2TKiIHWgdkyb3NPBNs5lz7pvGVt600B/C+K9KjoqZN3r09rznkpHeDds
	 D06R73FMygWNiNatoD3fV3JCh0IbEp2tbwUhyJUPQ97n+B88yjSVeSuflsg46WeI2fHqr
	 /wqVZvLk0pznGANNq5PtC9adMLNoaLqh7RktbV2kGR4kqWNmN8ZDm8nP9b55TRofrfYcd
	 iWOMjmGYvpqH61M+IOBVcp53sCCDoS3FofspMRJ1sMHyyWJKOcZ4O8dzJhq5MhrJa8AMM
	 0XNYzPkoqpP1yuDunUqfxw72yG5KUoahkkAfl2uGtXMivJzWtZIuWUCmQphkc92xxXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822969;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=K02zgxdGQWTbk3ueckkKkjJyj/QzbSgab6J/PqtEmnQ=;
	b=2AFeBiLsCXosboF0HY/sPmubXgZMAFS+e7PHMZYNes3garzYcF7xvQeA8FgxE/eXM5q2
	 6LnYMG9sOuomGYoFF2xggsAbruSuaVQ0aAvqy15IC7XlbNApTV6DuJz350LvcRbBmep01
	 2Sk/zJQvYAhg+HnfnjynAUrHmNc+WCMY4i3oOPxQxmAwdguC8vvAixEUQN0cV5xu2Z//u
	 S2NNbJNSl2RyS7ao/GyT0dgQi3v+59IMbwf2vLGxIBLYumkBDi9sUAH8MX/hPgYQdt2KT
	 bAogeWxtNm2oYEBaK+dVqCSRlvE7zTlkdh28jwJNQULiSTmtI+tW3NunU+J0z1Zx7DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6Z4qrN1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040C606A31C;
	Fri, 27 Nov 2026 23:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6Z4qrN1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2ACD1F008A0;
	Fri, 27 Nov 2026 23:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822969;
	bh=K02zgxdGQWTbk3ueckkKkjJyj/QzbSgab6J/PqtEmnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=k6Z4qrN1vtbaB79gvwpyv7wdR2AimXzGWshElx4T5MJW7+314fCN21twB2NYbdAN0
	 kuTHSLwq8y7635ze6zOnW3lt1wwDWSqt/c8aF4BVj59ud2Lyo6uXvYW2woNhIbOHC+
	 Owy/n2OFBEjJjVg8GRJPtTvwySlbjFKTzTXuaMO2V9XR5uhVo/aE1Hx2O0u/tIzshX
	 iX+YNWriDlvbB5z1dk+ghQ1310uyDaUkuurYtsiJGktgW2MDjmiOd6m9VUzoGyTxOs
	 051NATv5H6syDmR4JBV/+d8IqlKNzzsQunMe+zJ9Rvympg4KYc50FfAMvDeJAw2e/R
	 mxY9g/XMvxgJQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:34 +0100
Subject: [PATCH 6/6] mfd: db8500-prcmu: Always submit an explicit APE OPP
 request
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
Message-Id: <20261128-ux500-prcmu-clock-move-v1-6-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0

Do not infer the hardware state from a cache of previous Linux
requests. With firmware starting in an unknown state, the old path
could report success for a 50% request without sending it.

Accept the two supported firmware levels and always check the
acknowledgment. The clock driver will decide when to request a
transition.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/mfd/db8500-prcmu.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 98ab0dc3d145..080ab61d7a29 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -366,13 +366,11 @@ static struct {
  * mb1_transfer - state needed for mailbox 1 communication.
  * @lock:	The transaction lock.
  * @work:	The transaction completion structure.
- * @ape_opp:	The current APE OPP.
  * @ack:	Reply ("acknowledge") data.
  */
 static struct {
 	struct mutex lock;
 	struct completion work;
-	u8 ape_opp;
 	struct {
 		u8 header;
 		u8 arm_opp;
@@ -692,14 +690,11 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 {
 	int r = 0;
 
-	if (opp == mb1_transfer.ape_opp)
-		return 0;
+	if (opp != APE_50_OPP && opp != APE_100_OPP)
+		return -EINVAL;
 
 	mutex_lock(&mb1_transfer.lock);
 
-	if ((opp != APE_100_OPP) && (mb1_transfer.ape_opp != APE_100_OPP))
-		goto skip_message;
-
 	while (readl(PRCM_MBOX_CPU_VAL) & MBOX_BIT(1))
 		cpu_relax();
 
@@ -714,10 +709,6 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 		(mb1_transfer.ack.ape_opp != opp))
 		r = -EIO;
 
-skip_message:
-	if (!r)
-		mb1_transfer.ape_opp = opp;
-
 	mutex_unlock(&mb1_transfer.lock);
 
 	return r;
@@ -1760,7 +1751,6 @@ void __init db8500_prcmu_early_init(void)
 	init_completion(&mb0_transfer.ac_wake_work);
 	mutex_init(&mb1_transfer.lock);
 	init_completion(&mb1_transfer.work);
-	mb1_transfer.ape_opp = APE_NO_CHANGE;
 	mutex_init(&mb2_transfer.lock);
 	init_completion(&mb2_transfer.work);
 	spin_lock_init(&mb2_transfer.auto_pm_lock);

-- 
2.56.1

