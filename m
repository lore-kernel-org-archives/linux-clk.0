Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173483;
	b=volm+MnutLxS9e0UtjZa9qCQWSRL3Z/qcPNulvcrQQzCFgn4yjEnK9e5qNAWIlGBKZTP
	 nNb00/j5+HzzCDsIHgOV7VmADIgIYzTzj3E9iuSzrthYQdO1TG/2AAoIAMJbu0E+h6D63
	 hYQHnotM2xaQ/qYXOhcPZpQRDwLxTqDK/nBviDKkUCeVqOTEKYAB5GfmUAbK9Jk1dUvkS
	 gJA+T5Lhxv4xZO4bsrb3jDry4KmrV7MgZEwiRnhTadKHh2YXAjEFk1ks3/6rWX5m1SrKo
	 rd0nyII36CqFC98375Fi4NSNgRa3n5xBQfXw4b3bPdEnXm9McQfQSWVKl+dnZrwWzUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
	b=DqzTvRbGo4j2RWaN5t2Z0qH8ZwKGRmJOjpVxrjASRMIZ/kccT+ALnjXAf6hcBvVQADvC
	 /K+vZ8X1/GvHhtBMLvnQOmFRD/T6Q6hvz/wRe24iipCoIlcj4vQlIPpNgvUFcEVHTkW09
	 m5pOqGx+DNprC9E7x3772+zvmkeVe8OrrQUDvK4A9VlEONBr+fXoj/2MfTL2c2zrfmwz2
	 1wuxMTOne35jws/I7vsnaS8i1VBSR/DP3SR0UqinxSQSmEl0Iv3k8DtTURPxcRWCez7Q7
	 Zs+owpEjF7UeoikItRNE6j8cZSCqWoA5vOGYMpViqFHSxS8Uv2e2oYwcGLZr7N2E9Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=nrdMt9Vw;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A3606A32F
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 07:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0A3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=nrdMt9Vw
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5771605e9.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173482; x=1793778282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
        b=nrdMt9VwmmOe28+pqyx7enI1UOG1KjguwL7POql9xO0XqbrCrqez9lWvBKHlMP5ECj
         7oG0A/C4RLtkdSXO+nusOuulRlJaobkaBE91QmUonmXLjMc2heuWLbjw58LQtQq1SWW5
         cfdJvtdwG63og663E7nszcJuNHHBFKm15t+bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173482; x=1793778282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
        b=zrrsNkMx8nE930RBfE7dJl6gjPJnBDExjs2IgwB4pXQ2PHJOIxbEESuWUvJB6eJ1i+
         /6W0riCitsrk8pIZBD9114wgOqC9XTeG0pbyl2RmcVRChDM2io2IJ+r6u8JUB+cdFSU1
         aemTF1K72/Di7IaCeOmMH02dBXO8o6pVEY/279O/Dc2yUMNxS5N5hsAjplkheRrx171e
         61lP/VZYC0Rogj60jPC43X99tWlxKJdeN+wnKRabaICYcg2NsJWn/wxPzNkMhQF0zVJL
         dyqLCezDusqoYzgWePlVTRlEoNlZQu8vrF+BXME7GIWXMysVE3S9tV13q2l9D3x5FWOl
         qigw==
X-Forwarded-Encrypted: i=1; AKwUvBwqHv7ok4k5s6h8VIpcdUytQcwNfMvCPRWem1Soj5eJcegs0oV7ljaU/lxr2Y6yvSU7SWQ5XuDnOf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJsDvx+mOFklXou4zalG4dMGVovKIXDVNU1r9segaSd1Fr4ZfN
	+PflPGG+ZsX2ceoGVYhJbGXgBREhtVOoXjcWvQFrMRlZcDICGlGKNbjkARb4VkXB3IM=
X-Gm-Gg: AYBFou2J7bgLf4FcFYf06fpJ8KtfeujBsvHqgYaynyV2QZWrAUHozVx8JUEDMLPOB9Q
	7SmChC2k8FgosGFzzxSMs3eK/cgez3SBNTMnQr793IAY4RAJNwLQbsJQ6llibhd16Gg5mbN9zaE
	mQ3KyW7CmmYTL/qhXRC1KEjp4s7Nk7ych37N0+cjz+WkYIuxYfcgYsCtsUBXT/vNRJlAY/kE7hb
	8OUcnmCNBLJ6AVfKVrVjbJa/RSGKCOQetRHcS51htGTjWZr1Cn949ipaD52x2XYmoJc0065A51c
	cqRYhCZ/qfdHlHLa645Kk8hwFrFrBgmmy/6pVimslIzQEv6Be8/57nqydBnbhFTsIShR0CyWgKY
	x598wZhRHgr/4/gyzwbI4GrzUEthJj4HXLg12U6sLQKv9pZ6iAV40/6+cMQGgESH1Mc/iuuB88G
	caoGyDHknV4TAAl8dMTjwby7JOToFDl5IIHybZJMZr0kL8QbqGh8N45FKV3NmJwUlc35unjvZ2c
	bHbFGfJj7ifptlNZaBAVafeZNljR5bZYox/GCN6A0TEHoqwbMkg9yAmgIndWJpEPIZaypYhsHvb
	1dDyFWW9jzL17UCvQGwR+dhzUxoZxnF0DyTQVpo/yJ5UssmtK3/ZrAOa0JB5hMfZqQAJNDGoxj/
	WNCd4f7ZqY8N0flb2Q8SxF/PltnE6TGBQrSR1Jsq89isRvYEPGfNH2NcVaAoSEdZU+mxMWZxPiG
	y25Z71wen2g2e6YbEdTwthxM9EXko=
X-Received: by 2002:a05:600c:3516:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4a966c4175cmr28825045e9.18.1793173481947;
        Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
Date: Wed, 28 Oct 2026 08:44:07 +0100
Message-ID: <20261028074436.1958132-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
References: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
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
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Deprecate the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties in favor of it, so that new DTs use a single way to describe
the same thing.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Deprecate the properties instead of dropping them

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..8759c328e841 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -57,11 +57,14 @@ Optional properties:
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
 	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
+			  spreading in permille (10th of a percent).
+			  Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
+			      spectrum modulation frequency.
+			      Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
+			      to enable the downspread feature.
+			      Deprecated, use assigned-clock-sscs instead.
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

