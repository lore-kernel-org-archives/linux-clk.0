Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617504F85C5;
	Fri,  2 Oct 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958575; cv=pass; b=UA91E0btmdujn1ECUyxagQ5xOxhNs3OM1ZJ83+LVeZMILSERCLWfDGspamZ3LPv3gzVBgnNnr4erKttibFKoWxeo3RF0s6bmip1yghbwCMv3glO8Sz7Qayqj6X8Dmf66iFpjPgqXjb7Mz4eTjwIm661Cwk4nctujhP9HpVSSTdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958575; c=relaxed/simple;
	bh=vak7rymGzJwopaet2ROwEI9RUjVD+UnzLMycs5d+uEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqgSvKylkC23JoRpSGzZjkjPCGWiRWP+zwVEucernaCHIrbs93RIscAWCL7RqSEYLZZ1mMG/SID/jCTKSH434AMpAmVDawYYsNPw1yFRcaqe911jr6YICb5+8cOYY+WDL+FdpsuyOcqf5ZlS4rtVaK14nrKmYVSLVjBO0VP6eww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=A+4b+wI/; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="A+4b+wI/"
ARC-Seal: i=1; a=rsa-sha256; t=1790958561; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YSAiN8oZJ03FXKrv8bJpP1GQmQHQy1Rtsa+kompP/6KbvCdxmJ0VWf8lx1eVCytdPzn7WWnF9USl0UErS0nxVXvu4MrMbFgXDqtm9nggUNIrF+bUGyAj7pB4DmMU2EqY8c0jPzvz9xQPDwl+rMhQdOwZy16T8OlDVc/OXtUi7WA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790958561; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UvmIj1JJZ9BdEqm2dPeUXYXk/sWwp25/bJEGMfAEkF8=; 
	b=e05MiFOPdpVhRMZBdrZgdLrc+D5k5xqA+LVhtpPeZiE0l7LL/IRoVnyS2wZOMy3dzYGjmlBtQEwEmyxCGjo2zb5Ew4iRLzaeNDlp4BJK2R58OVbxYHZvohshVbZrZS91kGZFfTiFsIL8gfB9FbFsYfMV0GUwq/OOUY/BizrrYBg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790958561;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UvmIj1JJZ9BdEqm2dPeUXYXk/sWwp25/bJEGMfAEkF8=;
	b=A+4b+wI/U0tT7CaNKCTRko9YViK6RSbWawDRA0oSKFddpwzpPs4Ab/f1VD8DjiyS
	0qeVxmQADQuBbndrg37QLEXiNoobmWMf6lWGQs9AeGNYumSOs0u4IRTYT4pyzp6N8Vw
	qLA8x9yjbxGWHMf2rLjMhrdZ+DDog7eS0DnVIzCc=
Received: by smtp.zohomail.com with SMTPS id 1790958559695614.4589575589154;
	Fri, 2 Oct 2026 09:29:19 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 03 Oct 2026 00:28:40 +0800
Subject: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=vak7rymGzJwopaet2ROwEI9RUjVD+UnzLMycs5d+uEc=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL23z5SFSIld2rFtnvlU5Kzd+2cLXlVvl/AiGnmT0XGG
 ZMi6uUYO0pZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZjIxHWMDK9ueuv2rD1o1LH6
 W68q07/zKR1+0rbnlYwKLvK6MPX/CmNkeNHm/N3covTOjbt3d9zZPeV9w7MFNa5HmuQdn7ld1NO
 4wQ8A
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The external CAN and watchdog clock inputs are not routed on the MLKPAI
FS01, the only board currently supported. Drop the two fixed-clock
placeholders from the common dtsi, as fixed clocks require a valid
clock-frequency property.

Both clock muxes select their internal parent clocks after reset, so
the CRU operates correctly without the external inputs. Keep only the
required oscillator input to the CRU.

A board using these external clocks should define them in its own
board-level dts and override the clocks and clock-names properties of
the CRU node.

Reported-by: Yixun Lan <dlan@kernel.org>
Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index 574c6608aef0..fe85d01563ad 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -44,23 +44,11 @@ cpu0_intc: interrupt-controller {
 	};
 
 	clocks {
-		can_ext: clock-ext-can {
-			compatible = "fixed-clock";
-			clock-output-names = "can_ext";
-			#clock-cells = <0>;
-		};
-
 		osc: clock-osc {
 			compatible = "fixed-clock";
 			clock-output-names = "osc";
 			#clock-cells = <0>;
 		};
-
-		wdt_ext: clock-ext-wdt {
-			compatible = "fixed-clock";
-			clock-output-names = "wdt_ext";
-			#clock-cells = <0>;
-		};
 	};
 
 	soc {
@@ -128,8 +116,8 @@ uart1: serial@f8401000 {
 		cru: clock-controller@f8801000 {
 			compatible = "anlogic,dr1v90-cru";
 			reg = <0x0 0xf8801000 0 0x400>;
-			clocks = <&osc>, <&can_ext>, <&wdt_ext>;
-			clock-names = "osc", "can_ext", "wdt_ext";
+			clocks = <&osc>;
+			clock-names = "osc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};

-- 
2.55.0

