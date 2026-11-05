Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884272;
	b=kTp+QQsiBTfzmAJ/ETyMC7medFiLJFlAIsXhuuiFDwanzhclSNY1B373jYq85R3YiZX2
	 JF616xWx0wpm+nHjqp2C5xfpmxK08lcNbztJJ1xgyZ3pSQ76o3QPHbJWkUc26/TzzLgMa
	 gE7/osFN3inRz6Nrv8w4FEpAXk/C57dm/wqtcjVvbiphEvfkrHU74cu76D0EPgm/Q5yYk
	 sDAPqnL7iGRyFa2IPStVwKhmSdCUE2dU/EXDQ+FW3uyqtOeEgZ36Kwthu1MpQWVMtSXlq
	 I+Bn/iFCpHXL4kUW5O3LQC7t4cpoHlSvLuSqifuDLv8qHSLg7ssYBU7Zmun6rlGJmww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884272;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=wB7MAZM6DeqfgWnsRCY9GJY0+/kpbyJiFnWeErSJxzU=;
	b=LK4T2Ec3pjbcI7uP9++Z9IMpdArVqwglyj8KbeMh7m5WH3D+68A23y8vqFi1Z23ScHR/
	 c7jmCdItIx/diHK6hqgqoEr1G5xlf9bqMSbRHcNcbQpUg1etT9dLXZnQkG8bLOdodvsOx
	 5jRSpUExdSaAWAnabFTePs9ToAzOL7D4wrTkxHxxJUkmJHDyBgVFSNu5yYHUrchowCJDV
	 DEugQyM6saVRAV9FtZ53zQfc4fUO43NaqsgIRTDb+qZMMIgM5dQf747Ukjoh/PwInYBtt
	 LI2h2vFpedni6shkyd5vxfqgQlAtypnvpJeo4No5UjV9d0Xv+GmDfFj06y7jQarH6dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=BkWi5TWr;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B668606D82F;
	Thu,  5 Nov 2026 13:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B668606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=BkWi5TWr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 411A614966F7;
	Thu, 05 Nov 2026 14:11:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793884305; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wB7MAZM6DeqfgWnsRCY9GJY0+/kpbyJiFnWeErSJxzU=;
	b=BkWi5TWreaofM19/8hMVtrgru8LsDY5r3vF+OF557u4Hq4fmstrJgBv7iu4SpOncLQCBaq
	PTRUHW1RN9hoY3eafJsJMRfwbQdz/ud3iP7/b4XtOpToYT8oLcmlrV5xMVwxOty7KUREg4
	IvackDtLzqMQAB2U/sEiBIColZDTu4ZQghDk5CoV0pPry8Aq0rX07N4EmYgM9j7vsgjfpQ
	In89pJWz/TvSGikjriOfw+6UN9J0gl0z2XJDhOOD5ihNaO3m+p8j7cgpM8RGTMRcqZ56L1
	fpIbIC268A9/MzU5xBtQ2WGAnrb2cmKUlZyGaAo+a3/i0uE13tOKoShWRB78MA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 14/16] ARM: dts: microchip: sam9x60: Add OTPC node
Date: Thu,  5 Nov 2026 12:06:50 +0100
Message-ID: <20261105110715.2486432-15-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
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
X-Last-TLS-Session-Version: TLSv1.3

The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
interface between the system and the OTP memory.  It also features the
Unique Product ID (UID) registers containing a unique serial number.

See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
Controller (OTPC)" for reference.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Dropped new microchip,sam9x60-otpc compatible,
      use microchip,sama7g5-otpc instead
    
    v3:
    - Removed needless header include
    - Removed clock-names, not part of bindings anymore, and not used by driver
    
    v2:
    - squashed with patch adding the clock properties

 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 4b777c61c1e09..996b13300ca06 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -155,6 +155,14 @@ sdmmc1: sdio-host@90000000 {
 			status = "disabled";
 		};
 
+		otpc: efuse@eff00000 {
+			compatible = "microchip,sama7g5-otpc", "syscon";
+			reg = <0xeff00000 0xec>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
+		};
+
 		apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
-- 
2.47.3

