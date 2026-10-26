Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000822;
	b=k8GHAr1Xhkpcgl0ocy68ewRxxIG1ilp/JnvlWhB9F+DmnZXZ6b4QZjHtSiphY6pc3b5/
	 vwXIT+bcHmH8sh0CXXFeny+lObjgBX8rk2jGzCuYM9n/aGz7flk0Vi2rSzEMXdcq3zm5L
	 QaUC27qYKpaVgC5UtJpOCBLAFdIKtPBMgb41R1GO/PTE2F6u4DTTs4Fb6h9o7R0qonVx/
	 40qL1l/5GAxBe5AWtAFqOGOCplLQnkCGMo+Fs6I2wpSl74QMjE6icDiwxClIxg2yZgxPF
	 xwqaHyeHyGfVpHmvBV39G8Aq2LGomxmbaXnq01msmBLLcSOujZhxssDJ3GPUtCuvCNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
	b=L5t0M9H1ygOHx7KTdZQ7fm1TVz/whICtkBEg0G0/9Llhd22leCXamG4DGZxvOarSJ5/8
	 rGQ/hwEptHF4nrS1KkH9oMAjCcMc4fESVE7TsMiBpSSXOngfvpjiNztPg/FSTMfSMmFyj
	 D7YGPqEgY9Bf3nrm2CXWtFzxJFlSxsdL2s2FLEsx8DW566WWYOezTQRtSDd5k+AWYGyAh
	 TwV5jvvFTKAHjV4Q9SaLWIpqKb+t6kM5QdwcQ8ty+qaTXNBv952KgA2GZChrP2n6Q5Wb9
	 y4fw90HCgaL1ArXNhk/fKfpl2EI5us243UJs8k8ucX2jyPkclku26T6cY8zN1GeCIPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NCzrwkS7;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57484606A31F
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 07:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57484606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NCzrwkS7
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16593835e9.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000820; x=1793605620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
        b=NCzrwkS7ftLddMPUiiC0UEPgiUmuUYezwx2j9vcNMKeg7NnJRX4sLEAL56vufEIlDd
         Ngvfv7abkzA3fFBpQA4wpjEiNDBjsLalUBTWvlcTMlZXfM6nCt6fUvAmh8M2/ttu4YJO
         Zpuu3rwMZrOq0zCrdz61m64foLZQm/O1Js7Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000820; x=1793605620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
        b=V/f/NfUspnccihQTa4ucRTfrtugjMp1zaAM9d3erXTOIKIu+3BJSpgTnZwIFr/O0cr
         ImiMgf1Ba7qRBnbxT2gd75MegyY8yBGxhAdjUd3Fx3KgbdUYgedRRM6bgFq5ulUBxHvx
         r9qBTuvfaJ83RqXHcnqsGsNAReaIijmfLhZThG1dtunwlCNDgvmOj/R+Wn5CLhqJOfju
         v9RgGH1XEcq7P+U91Kty4XuSD43FvVctONA7h2DrZBcCavXlPS+jW+llbPuU9szjF/6h
         D7+VVR35/84HfQvqtHwxyC2D/Cid3atKl9EBxhCX/H6in4LaYYFBU+MHMadK2g5EkFbZ
         rYYw==
X-Forwarded-Encrypted: i=1; AKwUvBwvAaDv5ErkpC5XAJDB1EOBBHpQmmu7KLXSs4z25qQWC3Xn22X9CuilOy5xPMIn5iuFt+orVOJCT+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxJX9TwucCT1lOBgh1qS4mInJK0dAJq58NQkmGZ3+YjKgYhLe5
	LMQW8hxl2x2gdhsOErlKUfd2vhCPhyykJxpgBA2oOSOFo4E9Y2XWi8w1425vJJlnB/I=
X-Gm-Gg: AYBFou2GmY+yx0PBkhbL8cPB2oEqO5rmDAzC1AnxMjlG4u+BAiYJdk2puWubH3T5Vup
	GcYUDUyFC9+S1kDT6DhWhvEki9fk5hDeOjcA/7lDC6Ac//5l1flykkuoowrcadm3ZRhMckAYEWh
	qiHGSH92Zjx4cFB4wz7tRawNmum4U9uBw+ERcTgQBdHfbbwTq3FztTb2YRDAHRdGj02m7+7rP03
	d5CuZ2+RjsgI7FR69aLIcuvLHRelekBASL9cCSrA2gkaFfL4uPIXsdEtZvtCNj+zBlPkuLGmBH0
	cYCZFgJjdO4JJ06bS3dIwMgJ4AN0NLbVTg32dwSx1wAYC5RH+5vgwC6YKI+R/1A38R3CLOcDFnO
	Q/vrYS+nH88EXkMUQyFSHWhgS2UbeaX7VvCUdMOy9uIDoDwxvekvPGTcCThBUBpfojMA1U9soXY
	9Nvr2ello38YPRUViz8HrrRdjxlgyRE+vuEXhMyz61/F/XCxfiYu3Ut6JKLCs5YXlYpbKcLrODu
	faKxrdBNycD5l/KXd3WPVUEJZhvHLG0ZrxzzKSOyCFx1C9pEc1vc4ykybDzJLISRCHZ2gFHgt+a
	nQyg7H9oLpzlG7j9mwMyOCqHhpZMi4zuhgOgSWJbWQfLR+5U4CxG5yt8ogWmBPzRzzuF/rxkM4T
	m8WouK5AB2NyG7tlDwFRg0l+QpFcyE31PitY5ro6f8OI5e6kQ2GShkw==
X-Received: by 2002:a05:600c:3541:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4a35acc6a2emr107275155e9.33.1793000819693;
        Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
Date: Mon, 26 Oct 2026 08:46:27 +0100
Message-ID: <20261026074654.3997494-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
References: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
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

The common clock binding provides assigned-clock-sscs to configure
spread spectrum clocking (SSC), supported by the clock core since commit
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Keeping the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties would leave two ways to describe the same thing.

The properties have no in-tree users, so they can be dropped.

Existing DTS files using them continue to work, with SSC disabled,
until they switch to assigned-clock-sscs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
If keeping the properties as deprecated is preferred, I can add a
fallback to the driver in v2.

(no changes since v1)

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..ffbe50f46e68 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -56,12 +56,6 @@ Optional properties:
 	- ti,lock : DPLL locks in programmed rate
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
-	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
-	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
-	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

