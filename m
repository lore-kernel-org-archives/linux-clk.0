Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801C275B15;
	Mon, 17 Nov 2025 15:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393767; cv=none; b=n/80TT0BcT6iJSqhO3onfO6zGRTreQ1F+b9CYgt0ifvmRRxG56C2XBWDeNlc8hErRTD4YRpeKymWcAIugaOmweEMvug9lREISUrUS7MjQ0kbOpbuYupc3zfwG5yjaK0RV+Z7dxZNQJCA0f1Fg3JY1rTh/rxndpg32oX+e3Qk3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393767; c=relaxed/simple;
	bh=/v1QAlCCWNbMx8wdrlD6B9enfAEnlVlEnoMDUomq2iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7nm6vWxjCtPHlEo7Irg+IFsdWgaCa5tPZd1rFlwXXhHCORfjrOZFBxjNQpzOa/jW10NOrjjSCBNO22wHHJiHgSPmuqUT32Ka/czV8odUkTWm4RoLnAVy0m47PKpZCEhGuJSjDEhODfdWaGvvDOsO0Ud+C67uRK24hPGIE3IRnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqbogmmP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqbogmmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C430C4AF09;
	Mon, 17 Nov 2025 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393766;
	bh=/v1QAlCCWNbMx8wdrlD6B9enfAEnlVlEnoMDUomq2iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iqbogmmP3g3V+qa77+i8GG9erc9ZF2tJnX3QDpaiw/uJxk5fh7C8vGLyLNsqwk3IX
	 zZXQMYlKhdgPcFpTE5EM6YEuHFYnrx7NOZ0E5YIKpgFN56LBXfhxnRMzcyLYmf7DaS
	 9Csy/UC+pXDB4JlT2q1c7EV+TRE6pCIGN8KozlVql04Pb275gfESTedP3Na61t+7E3
	 us+822vPug1aJ/gBXbeMJXbHrv93N7XQdkg2JqSvyx71rco75Amtj2cBxAZK0xZ7JM
	 wwd9nSkqXVVSMkfGiJVxHXPgFHYSqhTDiNiR9APVT8sgATFkC1i7ulE75Sh6Qo8Vys
	 75ULQZeOZZH8Q==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v1 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
Date: Mon, 17 Nov 2025 15:35:19 +0000
Message-ID: <20251117-mocha-shelter-4d9aa88e34b5@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-shadow-police-56aba5d855a3@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6u/MVsorAWOBiuYW/sM6Lc9tNpUToYIrlt3K2vcU0zQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSDlusVvftkHSbI/m754E088HkidUdItfEpF5f+V5VL 2zZ3re3o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABN5+ZqR4c6ZvLOPar/VzKzT sd6fnbzU7qJDl9rllttumRelXixtecjI8Lluutw2H93TGrbeBhOrT+1sNy0PSPs3983v5fr33KM 4eQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx SoC Clock Conditioning Circuitry is compatibles
with the Polarfire SoC

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
index f1770360798f..9a6b50527c42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -17,7 +17,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-ccc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-ccc
+          - const: microchip,mpfs-ccc
+      - const: microchip,mpfs-ccc
 
   reg:
     items:
-- 
2.51.0

