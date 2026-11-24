Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515155;
	b=rNWjFrxCi+KBqhpifSWkdbM+2ODW5yuffnbhGa18IbTAUhISkVhVB7dQHu9EwOqOLyzR
	 Y1IdSvI4p6Mkk7q/660dhChD2tIiYWDh4eSXvvXMN5N3d4CTaUaG5k3yjtWtss+ATIjLi
	 d5hyWL8RmXmkvI4xjP2RPtdtPIMUNxYxKyMM9/8es/FExaK9yPWkyTVaM7ByHf73AFdm/
	 DaZehd6/3irKLiZ4cP7ReYfcFa5NUWfZnmXX4AWZbOWyK6G3NOU49SV51G0a9i+7F2qVd
	 uzOWjbEmsaX4OOdkyc7qhcreG0xdwM99C+GaszeEXM25wF65KFw25RB2Sc0XCU2fktw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515155;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=fDOAqY01wDITLAbk/WnOb7VdNKOa+PuNOrY69sphacc=;
	b=ZeeB1145fJyTrUGYYZuLrSoh0Zxuq08srYW3mFe3HLzo6jYn81pR/bAXEh5gPbypQwSr
	 NqaXtF1CzM+3m2ypyR04EaG+oue8cE7XfrbB1ylNH4+IJOOMk/NWQ/G5BBS78FPEP0uH5
	 +8oYF11A8TRkIYEr/2+KOiqkJGn8xcE8IdNxzJhU0O7jmnBAZsc9mmTOKBrvRWjFks9lv
	 zWfczcoeIc9aZiayrOs1bEDn5q/wlcDDTsxBpFXw96kWvoae6RuGMqoStP9aFsIuDkFIB
	 BBYzD2RCTkUbJ9s079YClRFH/TfWDELLrZcer5cjEAH23wCMRaLQHhtgs4aKNMK3G8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF13606A31E;
	Tue, 24 Nov 2026 10:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF13606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnVj-007edJ-0c;
	Tue, 24 Nov 2026 11:12:27 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 3/6] clk: en7523: decouple base clock count from clock ID count
Date: Tue, 24 Nov 2026 11:12:17 +0100
Message-Id: <20261124101220.3888170-4-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124101220.3888170-1-john@phrozen.org>
References: <20261124101220.3888170-1-john@phrozen.org>
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

en7581_register_clocks() walks num_clocks entries of base_clks[], and
num_clocks also sizes hws[]. That holds only while every clock ID below
num_clocks has a descriptor. A SoC that leaves an ID unused, or whose
largest ID is not the last descriptor, either reads past the array or
writes hws[] past its allocation.

Carry the descriptor count separately. num_clocks keeps sizing hws[].

No functional change.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/clk/clk-en7523.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index d044841cdc05..2799b550401e 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -149,6 +149,7 @@ struct en_clk_priv {
 struct en_clk_soc_data {
 	u32 num_clocks;
 	const struct en_clk_desc *base_clks;
+	unsigned int num_base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -1006,7 +1007,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 
 	soc_data = device_get_match_data(dev);
 
-	for (i = 0; i < soc_data->num_clocks; i++) {
+	for (i = 0; i < soc_data->num_base_clks; i++) {
 		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
@@ -1527,6 +1528,7 @@ static const struct en_clk_soc_data en7523_data = {
 
 static const struct en_clk_soc_data en7581_data = {
 	.base_clks = en7581_base_clks,
+	.num_base_clks = ARRAY_SIZE(en7581_base_clks),
 	.num_clocks = ARRAY_SIZE(en7581_base_clks),
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
@@ -1538,6 +1540,7 @@ static const struct en_clk_soc_data en7581_data = {
 
 static const struct en_clk_soc_data an7583_data = {
 	.base_clks = an7583_base_clks,
+	.num_base_clks = ARRAY_SIZE(an7583_base_clks),
 	.num_clocks = ARRAY_SIZE(an7583_base_clks),
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
-- 
2.34.1

