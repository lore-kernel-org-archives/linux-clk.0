Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=94.100.137.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794122609;
	b=VsoAGOlLnRgZTX+eK8RWLevaT+DH0+YaAqTy7Xr16GJJWjv+Ca+AnoLlyua+MCJTQOtI
	 /LQypXMkwR1f7mEBwgw7+NI3jVO+R7wsb8ftqYJ55FWlQ4fAa/clmNnNg6rxaPeqi9Amn
	 ZNtD1Dflco0vI0hJaFutBXDtwTtBY3qvxoIGbux0RIjEz7BkPJ9qANuMK8jBvOzeBOuBu
	 HR1QWDhbAQNkSA/jNZhIQNCIbMxmtE4IVTeMJq/EUHT8WWsZF5iFERoUPaa07Nw/6m3a/
	 ivKdnwSeCOd0UR1hQOXWb21fCwHPGsWLg4r35I7G9bYqlW6vV7NWbgiyyFjcJtVxbcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-cloud-security-sender:
	 X-cloud-security-recipient:X-cloud-security-Mailarchiv:
	 X-cloud-security-Mailarchivtype:X-cloud-security-Virusscan:
	 X-cloud-security-disclaimer:X-cloud-security-connect:
	 X-cloud-security-Digest:X-cloud-security:DKIM-Signature;
	bh=iF3RZzWU8Se+cRJ7T9+DnW6N/jqKZYCmrKktze3/CIw=;
	b=S9QuqZm0XYjEhK9W+9ObTKKqO41tT3qHtTc9G0LdCjNC/K2F5rp0BI60O7F1H75+RUI/
	 UPt8CyY9Y1mZ2Wt+8R3nZhYeyQ48sdgptztK5emwaa7gKgh1Y84XuQToAq3FHvdXuMKD7
	 8zYDTdGw86D89UPCEL+WSUq09oUSCvK5IHcVE9wqlWlDeo3+Uh5Qapq93ntR9j5ncnV07
	 tPd4EgIlZNYnH/CsiYJ/Y110q97aeU93Qtj355mjBCvJnSq6d5Lt85kNV9O8fPIYK05xW
	 1Y5aRkUVp1fUXNTVIRrv2K9b2fa7bvEths8x+upsEPkFX4rkK7TpKhWKo7EPH8EN3zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marcant.net;
	spf=pass smtp.mailfrom=marcant.net;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=rjYxRW3p;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=BLvuhd0U;
	arc=fail smtp.remote-ip=94.100.137.107
Received: from mx-relay97-hz2-if1.hornetsecurity.com (mx-relay97-hz2-if1.hornetsecurity.com [94.100.137.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD56606A330
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 07:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD56606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcant.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcant.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=rjYxRW3p;
	dkim=pass (2048-bit key, unprotected) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=BLvuhd0U
ARC-Authentication-Results: i=1; mx-gate97-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=iF3RZzWU8Se+cRJ7T9+DnW6N/jqKZYCmrKktze3/CIw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=1; s=hse1;
 t=1794122596;
 b=Xlt0kQuGQ8IYvehTbFWmJyirjcE/qAH5qGOy9cZS9dcD91lSdSgHu5Mld1BxDtA0H7xjfHY9
 +yyTkM2zE24ej7yiD3skLXdY6xZ3/OXnzSchC5qDbVOUIDIK2H8lmtfJ7kqLFpYZPQ0sUSm4HS6
 4pvrlJ3XdnX5hbbOqiKOhqHP9TBiwkKa5vjQ4yDxXaVNJMCPqnvvPNpnxXwzSl7o32JeIcbGdib
 HwppET6y0oeWZqi3f3t6EOq+Qh05FgOvu2kT6VzCNo6hWQ4DJdM1DJ+K3GgDeSAE0yr7hM+Mf0U
 yfjAr4KOFp4HBb1Nm9HPzZ3O0K1ujJd0ut0gGxv2Gmbbw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1794122596;
 b=U1jI10vne8WxONurfFyV/Yn9BnqBiMEhSRIaJrbdLJCiMp0JuX/gM5hyuL4h8avuYM97qrpq
 F3hIw3gDUEaRANRBBZXwdw6DRAKV/VjimLG3rR6/wpzjKOhVCfWmz0vMRA46Tv+hTwcUnoaA4M2
 ZCZd4Z+0XNrVZ0Q9p9v7UpYq+KjBQSELukV56lFsZ025R7TR+vQKrzGxvWoz/xt8bSretmEszxJ
 HkQ0Rq2Jm+quxCSN2n9QslDCvoIQtqnNwyHN09mFpU+3HzeQM7trjdCplEkq2B4/y0qs0eJspXU
 M32Vrx0gkoVqESgTM6geL70hBCswxBdbZxXvZ3hI3ZbDw==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate97-hz2;
 Sun, 08 Nov 2026 08:23:16 +0100
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id 267AD961A85;
	Sun,  8 Nov 2026 08:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1794122583;
	bh=iF3RZzWU8Se+cRJ7T9+DnW6N/jqKZYCmrKktze3/CIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rjYxRW3pASk7MhXSwxWzzAGXCF+Vo0/6lTj2/f6KyGwBSeLmxSVouIdlwT+IL4N7Y
	 cKoxLp33+LGzGFpWGu6Lf8FF1MBFN0pxp5tbSFR43xLMpeJC7+G54conQEfyZcznG2
	 ir2JNWz7eB9lcAqLl9iw0V5m5CyhAaPCPeRQVQXE=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
Subject: [PATCH 2/2] clk: qcom: gcc-ipq8074: keep port 5 on uniphy1 at SGMII rates
Date: Sun,  8 Nov 2026 08:23:02 +0100
Message-ID: <20261108072302.2311227-3-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261108072302.2311227-1-avalentin@marcant.net>
References: <20261108072302.2311227-1-avalentin@marcant.net>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:avalentin@marcant.net
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate97-hz2 with 4jMksM4CWhz1xmss
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest:0367d61256b76bfde461c7e6b794fc63
X-cloud-security:scantime:1.650
DKIM-Signature: a=rsa-sha256;
 bh=iF3RZzWU8Se+cRJ7T9+DnW6N/jqKZYCmrKktze3/CIw=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1794122595; v=1;
 b=BLvuhd0UIis0Cqk/QLCsrAcOmZqpJ1QhNtE72neuOtLy04+/frKE7TjwVUuKeEp3+YEV2o+M
 AIiyzWtmo7VuxRS9mZsxmVOsHvdGAYemUoVaJzaM/iH6hPu06XLwR0zF/Sr019H34+YOHURJcmp
 cYJnGJ6ZZFLyxD0Xcg4l4aHkN/B5Yfkpww+scqc2YCg1WJzFAqKk13KFDG/d+n861MxRg2xHQN4
 DE8AOErorWJnik6z7XJHoAG7dw6ztc/5gt/mKtpWop1RjLklFA1TVzIeuHUZef2CyOG04X9K7Rt
 0jO80Q6w1iRNRmZgjHsW+vQSaf1gjsJP8hwc3JT2y8fyg==

Port 5 can be clocked from uniphy1, which runs at 312.5 MHz with the
PHY in 2500BASE-X and at 125 MHz in SGMII. The port 5 RX and TX
frequency tables serve uniphy1 only at 312.5 MHz: 125 MHz lists
uniphy1 / 2.5 and then uniphy0 / 1, 25 MHz lists uniphy1 / 12.5 and
then uniphy0 / 5. __clk_rcg2_select_conf() takes the first config that
gives the rate exactly, so once uniphy1 runs at 125 MHz, a 1G or 100M
rate that reaches the RCG moves the port onto uniphy0 whenever uniphy0
runs at 125 MHz, and otherwise leaves it on uniphy1 at 50 MHz (1G) or
10 MHz (100M).

Add uniphy1 / 1 to the 125 MHz configs and uniphy1 / 5 to the 25 MHz
configs. They go after the existing uniphy1 entries, which serve uniphy1
at 312.5 MHz, so that 2500BASE-X keeps its divider, and before uniphy0.

The port 6 tables already list uniphy2 / 1 and uniphy2 / 5 next to
uniphy2 / 2.5 and uniphy2 / 12.5.

Suggested-by: Julius Bairaktaris <julius@bairaktaris.de>
Signed-off-by: André Valentin <avalentin@marcant.net>
---
 drivers/clk/qcom/gcc-ipq8074.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 1329ea28d70..fb172b9aec0 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -1679,11 +1679,13 @@ static struct clk_regmap_div nss_port4_tx_div_clk_src = {
 
 static const struct freq_conf ftbl_nss_port5_rx_clk_src_25[] = {
 	C(P_UNIPHY1_RX, 12.5, 0, 0),
+	C(P_UNIPHY1_RX, 5, 0, 0),
 	C(P_UNIPHY0_RX, 5, 0, 0),
 };
 
 static const struct freq_conf ftbl_nss_port5_rx_clk_src_125[] = {
 	C(P_UNIPHY1_RX, 2.5, 0, 0),
+	C(P_UNIPHY1_RX, 1, 0, 0),
 	C(P_UNIPHY0_RX, 1, 0, 0),
 };
 
@@ -1749,11 +1751,13 @@ static struct clk_regmap_div nss_port5_rx_div_clk_src = {
 
 static const struct freq_conf ftbl_nss_port5_tx_clk_src_25[] = {
 	C(P_UNIPHY1_TX, 12.5, 0, 0),
+	C(P_UNIPHY1_TX, 5, 0, 0),
 	C(P_UNIPHY0_TX, 5, 0, 0),
 };
 
 static const struct freq_conf ftbl_nss_port5_tx_clk_src_125[] = {
 	C(P_UNIPHY1_TX, 2.5, 0, 0),
+	C(P_UNIPHY1_TX, 1, 0, 0),
 	C(P_UNIPHY0_TX, 1, 0, 0),
 };
 
-- 
2.47.3

