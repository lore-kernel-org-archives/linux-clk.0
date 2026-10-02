Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F118D636;
	Fri,  2 Oct 2026 06:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921352; cv=pass; b=L615Ip+dJBIzpQXhzeQdNKWEbaSzhW2bmkwp7xXwhq1NVHPR/kAtqcNyKn7DgI+fu8h9h5Ni8+DCCqpC1pKX6XngAkQ64qXluyUGVrieFNKLTA/fGHYmRko36/1dhEf8atYaXeahKDFUHIT9hZUZX3qdmXxXO1iFVipwIF9r7e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921352; c=relaxed/simple;
	bh=dkjrKeFFo83NCP/okhbIBBG6/Y0iD/qUm4cUUFujpdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLPmisFh+W91tdbgKmzKFrN6Gr31hnDYobxHKJdX5FVVSCKYsuc7uI+MdpNIviPhcp7vDGd9XiHxzpRmorfrHjnGu4+kYNOjuOSEfFyZyUTbcZsJwqTMu8Ijz1YjyzLLQw7B9W9YIYKSARb0bveJSXkSfJm+a34weHKbelfdjLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=gdUeOkGX; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="gdUeOkGX"
ARC-Seal: i=1; a=rsa-sha256; t=1790921334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SXYZ3HI/NROTzUqqGYNaTqL2AgRydBHxGHYt3BiER8YYL5eA6OS26qw9giFkfyW22RYyPw1gO3GIFZ7GiLV5yDlH60ZYmHrKyflxl/fDoN6HYUorf5ZzPNDjiFf19qVvRGcTS1epvCy9ErmGvijBhJ2eduGFDQonlsMWskVc5ks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790921334; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JKeVGPFgfQ5lweEBhVgIYAh6odqbkZlVxrmazE1hKcY=; 
	b=QEv/B+jHqi/GC36sNSUGHXNnb3M0aEYEInU0SZaJfRg4PHPgAsNtb5cw7PnzPXoDpSYwG/JW+Fgx6isb8aSw44tKi/WffIl6LSzBNwc+p+8aDddCdRDQMEkqZ4x6Y8/zFXqKJ1GUAGZNrr2s6N7+/vg3Zylsx169iDgoWNCSQa4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790921334;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=JKeVGPFgfQ5lweEBhVgIYAh6odqbkZlVxrmazE1hKcY=;
	b=gdUeOkGXwnJnAb2pbi7Q5Z06cbfsYRRywlhmFa1h85O2Yy2MWOaeuO89PBVGRzHx
	OY5M4saUP3w2DqttGL21T26onXI5EUGphAXfCumRHuSfzq9LOJRCfy/jRRm9BUFRp8k
	SFrvXTVuLSr9n7jb96EAZhTpsD8rC+ABqoajkY30=
Received: by smtp.zohomail.com with SMTPS id 1790921334397660.4618848222665;
	Thu, 1 Oct 2026 23:08:54 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 02 Oct 2026 14:07:01 +0800
Subject: [PATCH 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
In-Reply-To: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=dkjrKeFFo83NCP/okhbIBBG6/Y0iD/qUm4cUUFujpdg=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2e8VOX5y9PpjHVvLJh96ptRKr1hlPFn3lOVXl+jY+9
 TChrL6zHaUsDGJcDLJiiixc/uL/rHV4vh0RaL0PM4eVCWQIAxenAEzE4RzDfw/b1Z7La+fMK2jN
 XBX+2t++5+cX3ic7eo//ultrtmj762KG/wUK4evMd/7unvss8cT0kAdxD2cVrLv917Hna/Fxz4v
 r7TgB
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

