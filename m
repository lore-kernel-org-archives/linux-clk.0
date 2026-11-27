Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770721;
	b=Gk2tlQn1i1VhsWtNgNtBfIhd7QFgUoyuD4D8pq3UhWegDcq/KdXInvGPRa+1nXH5zaab
	 /gNOeQcM4n4IYY9iS0oT5T/GAHlCBngYjZO5DsVjgmoEkJWpbfyaAudex+DuqW09bDaQ3
	 QS6IVUhd2bB/c5HgpHwWVWdku5kfHl4PtZr/My14RfgKmoVV7O23PlV3+/0/4DjeLgJHu
	 fjY0TGykou05vFeYZ+0fMjPSSfSpdDOLa0xwFIA/DnI1J9KS76iXqBdPJtF703V8xtbqH
	 c3/GXQ/S/8NxwpIJQk5dOypVp+pwItp3jo5d23eEKq2xC13otm6fvt6W22D8eXn9hlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770721;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	b=tIMWnAmgLggHqTA/vGCZa8O1FjHJOCjIRtgdOLtYlqa/MpTc8UfLl0Ho0LEOCN+DAiWC
	 B1N6pYc2wn+yDAzmU3YyGJoraTWALQBFL8aEy761JkTdUHkMtlO4+JGq+jtL92ZRAEUiQ
	 DQEk1cMM5s6pANSXeGf4lS9zW38Q/uGBvKLSyDngcDvmzfUWU9aBmRzDYTmFT4u0gy1ho
	 34ssoOWZVAk7E9RBexrlw46XriA9WYw4ksrQPANT9QkHMHpvx3SsIrHkVFtDtGmRhoT9O
	 D51DEquLxHA7En/TB/cLTvPDglj3iox//0BCx+d88L7/KJIv6vTzFcZLcum064jbEvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZn3M6ZX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA25606A31E;
	Fri, 27 Nov 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZn3M6ZX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795770720;
	b=zJp1B9Nz+duDBMDFCfLXAK9ccgl+OUtrB4Pbu4U/uTjuMPizQIFhQIZuAkMb0eCF9qDO
	 kxfwtM65Wd3rtx1LPFsItO/W7Itn0X0eyz/9sfsdAzdCXZenowrszYQsISoZviKhjm/y4
	 YViIUg/R/BtHEpk6mYwrPyngNXZt5HeoPlRHH4p/+AgfV4Bb0yQkNawVqmvRJatPk6pR4
	 bamyhRQhPE6BdVQiet32uvZKMHU2iC9yVtq+W3sB4m1Q6wV7zqJ/a1nGS0fcFeS1DaTXj
	 KcTsSaRF9U62rTxW02GHo40ze/kkcphMqCng3fXypdT7+x432vKD3tTkia+Phj6tCtQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795770720;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	b=lWJtTdHLleUyp/0fYIE/xYMQnPa2ERFpX0MrSBx0ApASMZNIoqy9j/cj2VKLi4EVIc8i
	 OuYHrX7M9WoIVHfIQDm/CMlhRrWZT5hhYO29vZXbVPJ6rZEuwYX/DQIrGH4YG3RVKavhx
	 yTVonQdTbOAcj8AlzeROcyiHOtQ91wrJymGgz2KgS4j+Lm+AcSU8lR3j07/miv72n6jRz
	 blrekCo2K2EkgfFXVTupaco8uHsbYqtQx5TsorqunZTjAhjg8Qqjw2IX+6xm8iI7QnIxt
	 qbhDwM7VJ66MxMoY19YkDY0e/wa+xhRGzF8U7Bc13WNXIn2XmvLfn9IDCu+eR8AjEVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EED041F00925;
	Fri, 27 Nov 2026 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770720;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kZn3M6ZXKYb/w8wGbh69m5sDhY7kN7GqwHISqRVzS1Qvzuef1MufRSYWlIXn5AQsF
	 Y/h31N3U4IImKPvBgctgGtvSNzEC68JfRt/pMG4bL1A1LRaHhwM/qXeMiB26VR4W8c
	 SJU7jaMRpSYwN9v0a5/yrZXnoEW38FvMy9ctTw2lZ3dxjhC1m0dFhLGdADI9CImCsJ
	 hJmuRrDvLZfT/+a+FwLCLKrI5G7RJuoTs/4lUNOfIMA2XNaUky8a+V0OXggfo2HmMk
	 sQSyJA3KjTOJe4SNJRM5nuge8P+q81C3x6pqssV9KPUK9esVZakjPsFonHGiPc1eSs
	 8fRmz2CXqEDNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 79CEE4B6AB;
	Fri, 27 Nov 2026 09:11:51 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Fri, 27 Nov 2026 17:11:27 +0800
Subject: [PATCH 2/2] ASoC:dt-bindings:clock: Add audio power domain for S4
 soc
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
Message-Id: <20261127-clock_audio-v1-2-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
In-Reply-To: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiebing Chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795770705; l=1619;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=8FHHLcJZtu8lo09r1PD8utgqmy2N7M4R5lGLzc1tkrA=;
 b=S5/ZguzthjI3gVUjCh7bFSWwXQpt4KWJI/JOEdlhWakZ84ChOO6sR/8sDkcQ47HcXY+LnDgd8
 EVXcg11kSBQDiP1TOsfR/KzzecBkhRsqAjyIHRKX6IB93LBOJjxr+mx
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jiebing Chen <jiebing.chen@amlogic.com>

The audio power domain has been found on S4 device.
It must be enabled prior to audio operations.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..75ddaf8d8091 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -100,6 +101,9 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +119,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,6 +127,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 
 additionalProperties: false
 

-- 
2.52.0


