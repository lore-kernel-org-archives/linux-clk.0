Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792955941;
	b=rIvkKrgBxQDdoP9Raf12i1MlTWF4of7R29cGI+dvspRks5DoUqqnFg0FI+7bpC42Sj4S
	 XfLrm2tHyh+5ZSMXNYGr6F76TYF4TUN9dza/FxRw0dEIBRAYB2HeHr00uE28cl8eyQPTJ
	 F5lN+9w3YVmk6wa4YGflXd61QNu3F8LLKLnVdBUSHCPaFd+puu4yUbA9XmlJ58dzSN0EX
	 mEmhIUmvTXEwuO6+vLrSCPNBWM7lLUAWEmSim+hA4QSC7+zymMlOYWj4EwyIRKmoegEYv
	 FzLQm51RD+RCsRiOwO+y2qiUHaGUTVe3GCyRJ9aRWJjdHnczzSrXthmEpi0fM2aHLwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955941;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=smoxO3UnUyM5rZ4tq7n6KvypgXtX3hnSKXBHknsMFtM=;
	b=yNyzICzY137lysscXUjH9gCKPrSXrCPeNLvdiKLEr/olVc8carVb+mTrN7xx4ia+VJ3n
	 IpsuUIZqRvPAxdOviAEFAIJfys0WpCqBJ3J2UgsmVawU1Y95HJ+3XQQ4ftMwTFfanId5d
	 Oio/090Dpxywy9romJN67MGreRnBBDmkkDJ1YCyBoEgG/lMo9TWb/GO1WChAe+oX4eiqP
	 j6juDKNx2FyRj3caJugoptc3S3lO+s4OqIg2A5xJThRdy7aAXof7B3mmHsWfVAH4moP7F
	 5nd38odI9ApHzjI7O71VuwNuf5oo4Ce+M8cvVJn8mJqleMBhhawBwecDBZhngn5W+DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=KCZwqjE7;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=YqxZadmo;
	arc=fail smtp.remote-ip=85.215.255.83
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B95606A32C;
	Sun, 25 Oct 2026 19:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B95606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=KCZwqjE7;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=YqxZadmo
ARC-Seal: i=1; a=rsa-sha256; t=1792955915; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pMEJwb/yjYdeA1kw9TFiGsyD+O5PmYR1qKOQbR+NEK5g/mCqiKDxtWjUmJBNmmGouJ
    m7Q/uy4iJB/FCmx8PcQBDI3315bPBp0s2goZoV7m67xAq4mkUj4z0h5IWojPfPwI2J1l
    5nWO9bJ0Z7v9UYO1KihhapCP7E++GDvI9/8yjj8BxuE8bScOYyaUnDz74yA7tYT4oKqG
    v8sHIqNw8YT/RV/UHnPYlBGUFfxu2JPXvfNWh9PBVSUAqE83nhBlXLI6K6AWv64TBblu
    2GZZOo+E+HSLIg/bJw2KxGGeskuDuHzGfeXWXfBcd1lgP7ze3ADjP6m7npRQfHM2V3Iy
    Am9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955915;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=smoxO3UnUyM5rZ4tq7n6KvypgXtX3hnSKXBHknsMFtM=;
    b=W6ve5AE+GhzIcyw7cfCrIcta+HU2j4QU2/PR3Vg5iB8sazHbt4moCqkv61Pvh0lXjg
    R6daofQSa5Wcs6/EaA2i4VfDVlduktKzIMxcKE4lsne0opeL87wIHvkdg++ZAt91JA5F
    p0X5t5LhkoBYGj/bGcWtGeDha9kQhZAps3cORh4paRuRfyd6v65DF/F9iW8B4O9X+DXl
    HbW61mAaGe1GbBxlFoYmJczSUhEAulSvUyCNL8KaA7GgHPOyxGMPO0KqTl+FAZqTvwaY
    tYdxIKkV898rDxkFYUwsjfQg0EWaCtVEmueCCVgbkcGpzTpjhtpFawJkt7ADs9I8KHJe
    wRGQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955915;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=smoxO3UnUyM5rZ4tq7n6KvypgXtX3hnSKXBHknsMFtM=;
    b=KCZwqjE7nNq0GknvbGBxlLxapa+HRVHAUByzf2Ztx+2Y5cMUwq7fbzIf9l1agQkRgb
    fg5d63xCn9pj7Bt20Ywquvf9+zfUUdvQYKy6Cip5bC8eMwWZMubWG7ZExGcxITobfB9x
    92xrlAfWHRVr9fNZc6o806oP4mUdfFmTwwWhs+qLd4PMX7RkSBjz1BnGvj/gWHAQAyMP
    SKt43yivvuxa4zqfcSdo/H2wPVXLB+7UN5mjVHRdG1hIMnAEVgfjKb8/YYjZyASoz5j7
    hWM6ccwJ24OatRRIyf3DOH06r+/hAcO0dJzOp7aqL/tte5nF+m3KWj5VWWmNq/H1Ivjz
    RZnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792955915;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=smoxO3UnUyM5rZ4tq7n6KvypgXtX3hnSKXBHknsMFtM=;
    b=YqxZadmohUxJyq0+4Wp7vlr7MbHUZ9VsqvOPY3xJ2PjfepnM6uW9Eew80rwTXeA+yI
    IMovkLQr2NDuGB689VCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJIZzQr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:18:35 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 4/4] clk: ingenic: x1000-cgu: Adapt calc_m_n_od() to core framework changes
Date: Sun, 25 Oct 2026 20:18:27 +0100
Message-ID: <2ec3746549990bd4a2c1e1542d2b05777b5fd514.1792955907.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792955907.git.hns@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
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
Content-Type: text/plain; charset="us-ascii"

The common Ingenic CGU core framework was updated to support a
secondary post-VCO divider (OD1), which extended the signature of the
calc_m_n_od() callback.

Update the X1000 CGU driver implementation to accept the new pod1
argument, preventing compilation errors. The parameter remains unused
on this specific SoC architecture.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/clk/ingenic/x1000-cgu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index d89bdfb7c219a..cb82d8e6470b6 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -173,7 +173,8 @@ static const struct clk_ops x1000_otg_phy_ops = {
 static void
 x1000_i2spll_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
 			 unsigned long rate, unsigned long parent_rate,
-			 unsigned int *pm, unsigned int *pn, unsigned int *pod)
+			 unsigned int *pm, unsigned int *pn, unsigned int *pod,
+			 unsigned int *pod1)
 {
 	const unsigned long m_max = GENMASK(pll_info->m_bits - 1, 0);
 	const unsigned long n_max = GENMASK(pll_info->n_bits - 1, 0);
-- 
2.56.0

