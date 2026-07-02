Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9021E480DE7
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995497; cv=none; b=FE2tbnXCcDWs0LG/hkibSrSlcy6Y5KImRg7WmY/wZcidURxU+dRRaToWxaUuzHJPKfkr6uiaA8487SWHt+IiA7/STzZ50vFQNrxUIpclrUCyFqS3bVNG4xyKk902/i8DbXERi5J9LFNtdXBiDg1V30yxxcruA3Ybxz8nWckVwYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995497; c=relaxed/simple;
	bh=KlT+vAqF3fImgRh+vi1G/HlEXKdYDmQI0eT/ODYlQg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3qiMhMy90IdUewYB4WvP+Hzdcttj+PIkzZ/pinzfJiyTcj7FbfV0fl/0fd6PMGS61ncqwzMhRE5GN1c4unF9ZYyJnO+wmFsWbln6CbAGmqMRLKeTLcRgozOtcNjpVrLxXR3WMKVA5XLR/pS+5zS87l0yzvFChTVuPfFfzmEgvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ice2rAme; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ice2rAme"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1184830f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995488; x=1783600288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mht4rxb3FmKDNCITNNMglstOGe9jBi788HmIfrM2viw=;
        b=ice2rAmewA/0cKlxCDUKDKvdKv1h1+21KuCop0o38Q0McCyZhPPs4Tao41bKvUlh1Q
         RV2vfQNep18XHuZ5Uk3kOjZhK+K6tG9YroLfv7DJYHNaWiTICOe9hLP7EgheH9FoGEFN
         /+bUiETQTDwHKwookLXP63o9/mz0mvVJ/gWzoGmSIxuH/D6XqJFQfgyQhnMGDQ2R4xbf
         +N/ZTLVZt+bCR4dP+vwhcnk3avtSiWqdYN8dwMsYbPv7Q2zB9zVfiWRTG4KwQP0FiVeI
         fuOMNw98y2myMypsIufofeJR1bLCfKlejSQuss48UvQOR85OZCeiX+c+HQKkPnpoAqiy
         WVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995488; x=1783600288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mht4rxb3FmKDNCITNNMglstOGe9jBi788HmIfrM2viw=;
        b=PSR8w+IT1kxRQuN9GJnmEn1JCVL+izJQJ+7+P6+GHMGVhU1onNH/h2Xp2+7nJSJrnW
         Mg+vpCTG7dDQ/IZ3fEc+VmCXEpR5euSImU9ZC4wOq9sAeQiNsbPm30SDBV07mllUM6Gd
         WdScj11gNRdzKktCKsj/afQo/TbQZjei0AxR4xPISAHaczxO7NEt1Y5FRBQ+BmzmhJwR
         Dol9U5pdEi4J5WvREOIfTgpRBv3GiU9jQgCr2ACULVww/ln7ePrOSaY7kQVbmnOuzjyO
         jS8F3cq7WPzc/ZtyfCrTmFAqE9GiipmlfbbAvFFTB1REKhqdBqkYzuqSHVVs0sTSRqTJ
         vZzA==
X-Forwarded-Encrypted: i=1; AHgh+RrDLSlJ2BUu3ypr2FedWnjzgXhzqFUL2D5Y2JO06onBTwFt0RcTP87mLbrfXwqb15ialv0scnYwJVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3iP0rTgaHZm1JkGOfUcQKTdTh4W0ab7sIevYYmh4D212+ky8
	HdCOuW3wDU6N/TUcIdbF6gEpfsOJsHGPAXoTHAgyJGGg3ZNSCSQzmICK
X-Gm-Gg: AfdE7cnriF8GrLTqyHwH2V6AioN0EaTZR+MaNAoBVBq4G6s5EXUUhdDLIxmt5TcHU5o
	b7CnkP2PGbyJb5pW3m2rKHX9tgo7lFl0QvVqmKRqmMhUnmCNlESy4hp678M7CY+hrkknVo3eE7M
	TvejHG2j8BzXVn8YDpo9sfXAZ2ntRrh7+ZH9wcLizuPMpl4krKHqmfiYlIIECZpygWd7sU7akL+
	5E1PYtrYFf048qCen8Phv8CeVMNyqp+PjKLZHefR/A8luuHdpPAAJ2APlwBqUnGSYZKPSeJAoH5
	CoDDkIOwsIC1bYdfPg/qDFKKKFPMcZa5PumdNTdRKhdg4/+4NR7sYgRLBwVCd8xN3j8S5SgFmk3
	rpBd5nHmgnmWfR+FYXfwsNK7MqnzTlnCLaQX9e3Dsg+MoMldomWRNVplpbuM2c1/QmqKrAMynBb
	YTGHUtTwroN0rfYC3+8o0KamJv75eg9NRqJF3bXMR3mJ0osMYwXDKx0oYAvsyJsby8ZW4LqEm8Q
	qKz13SzP459pkYABUY2juFiCc4=
X-Received: by 2002:adf:ec49:0:b0:475:f0f0:9ecb with SMTP id ffacd0b85a97d-477b5d37949mr5581503f8f.54.1782995487566;
        Thu, 02 Jul 2026 05:31:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 3/9] arm64: dts: renesas: r9a09g077: Add system controller child nodes
Date: Thu,  2 Jul 2026 13:31:06 +0100
Message-ID: <20260702123112.161160-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC contains system controller (SYSC) blocks for low-power
management and access control within the CPG/MSSR address space.

Represent these SYSC blocks as child nodes of the CPG/MSSR controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index bc109035fbac..6f4c1086afcd 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1055,6 +1055,20 @@ cpg: clock-controller@80280000 {
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			sys0: system-controller@80290000 {
+				reg = <0 0x80290000 0 0x10000>;
+				renesas,sys-block = <0>;
+			};
+
+			sys1: system-controller@81290000 {
+				reg = <0 0x81290000 0 0x10000>;
+				renesas,sys-block = <1>;
+			};
 		};
 
 		icu: interrupt-controller@802a0000 {
-- 
2.54.0

