Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767362;
	b=dEKHESpDQXuxoHdHIMBiBWovT0ALVD9JF5nbN9d07H/TcpS6XjgIMOd7SvUR7dezKqic
	 a5y/kUTREc+KE+x5tCFRbDuI/eGrirfXtNyqZDENz8IvKxbYepPQRJu3QMkBVAVRktRt2
	 8EKmfZxxz+0y58A49m80TCbxf1EU5JVSBP6a/8/zbBI/T+VJlSXuI6Sie+pCXh5ewBjRK
	 53FTYbEj0/IK10hrQesny1GuGw450X6fzQMsGLFNiMCmWhhqqqUsV5MVJ1jju6GTI1Qip
	 n1/3xSfj/dSIom5fvTmeBNusRFybYSizSe+DBFVTC08PD/nMfXmAZPHzQ7Y+om3dpCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
	b=0+QbQl1n0SD2jBYnw0rW2aFY9k+MaQ9ZJmNUACfYtuEMaxQLPi+XwhfOdrf+Uf5uwFD0
	 fYsxTbZGanUPVwtGw4vIrd6uGtKne0czNfGEf+8E9d8YQVCFVf91QWucpBJB5vdQu0hA1
	 eL8dVKeLp6gkXM3I/uyeVmxQVRmYpMsU1fOaMwG7qAqYxHmIP9nvsf1Mmmai1tZb/4bJA
	 a4R03vWQQj3q7vFEzbQer8Kh4D9k5w5hmeSPotH3IyQUL8t5cAe5oQRm/z1wyrUmV6UP/
	 3iZZYr9X0YzEIH+e0Wg0WNhr8KazhQkyoAOq8XeG1SIOAEthssLaSc0tIQTU+NDHnzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JS4slTlj;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29156606A330
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 14:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29156606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JS4slTlj
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so612053f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767360; x=1793372160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
        b=JS4slTljmmDFN9zzqecOutQb4/qkaxdkf61XRiBOYkMWrNjBIwFAq8E/4eSrH6FkI7
         bLlG8vmt8xQ6eSlB1oyroh/DhTdXl4Nog3M8n2SFkCbOWnnYYf1dc9X8ThNjRMSwLX9V
         JTSYWtL6xt+KjCJ/OJQ+GxTh7uV+2j/OQlCb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767360; x=1793372160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
        b=1QNVoHmFV7AMdhh7q0g/fkAZUQMN0h3earvz8xl4ORx8jnmyszwwnudTRqKSgROdL0
         HB6UwQx6VRCE5hHIr70xmGgQoWv9hUgtOtp3S2010afqbWRQkUOnn/d6RdYWgrFifBs7
         lqOQ9C95HTsIM78jtEaP+NIcUQ+VUEBnNgeyGKEVJVKlzYn/W74KACaOh09aDoBw7iM8
         KKM7MvsIGvCSyAg2cOYUr+rtLUFVxXS3SNVeVQO6Rsl7LE1m4ZLbCZrWqVI4FNeC+0L/
         fMsBr9/50V3PU5cbm3lCJknAdBEwibmQnu+lPgjmH+bdnonrS9xH0oGunYwNG28ttHiW
         PlpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxds9S9XVPAUmU4jOOLmmkrou4AmeJ1qV2c/riDmZxXkdz+xCHV82TJTczE1gSV4dH8tFTnvCXPDbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwMFIbKSnkpSXOAYPUfjrvElp6jiPFAx+tH8l7l5QcfKWiEJA6
	D9O/h+NKLQtX2AGzos0+20/QT8iarjwHbk9i27zAz9fYGcjFtIri1G1oJB+qRx90kN0=
X-Gm-Gg: AYBFou3G2M4qjyaMiyZ252MSUb+PBnNjL2haWJzZ6ErdgP3yaD0TfrceTAH/jrhN6ce
	XK70iJ/SaXaNCD6cVQv2Jk992dd4Q3TB7mfYdjQyv5L9lcGhnsXQzo7UmUFL3GA9w/L6RNb1aRc
	wmiS+zPBj73863t9QwSU89BJaaQtN6vFEiOHdQw+8J7P1WjYktWo/uRf3RauT1phzHUUVuZ+ZZG
	sZ4gq1Z/fERAMhal7/FSW67e5xlz/SwvpReImAO87czbvchSAYUqMGR9qeEoQaiBWlj3wArlHO2
	BGT5HR05FKzbOrJAEsJbpg0iAQUbyJh3SRkm3yxLazwJ8+kwg3TAYaQBQtJyZsn27v2TI+mUxbp
	XKPhe0CAHBwq5d1m+x6w03VRvMtARupSR7lMdphV530h3G/KG79SKjt35s1jNvsxqelwEU63s7f
	6Gt51b9CSTJymaXw47I78+PtYbMcK7NmMw7/ktEitTdxFVv0JOvk8Sj1UBDMQ3BdPSB05NNU1sn
	llI+wS/Py+WH6eIbDebvfOjeAp8zb2v6OkKv92d+qqruWe0UJ1JMCNWob5XYcZMzV9lJdQ1Kx00
	w4NLNdeoZlAabpIM/QB+lJTCmQ7rTlCk/mUdN74ZDLOaHoC3BIiFGOO28ECiDGf92leOpLMQ3vN
	dAhPel/x0JxZWh+/5tHiV3zKkkE/DO+0OEx+H2a3CwnNQgbUV17aJ
X-Received: by 2002:a05:6000:29c8:b0:48e:3cf5:71fc with SMTP id ffacd0b85a97d-48e3cf57222mr508697f8f.47.1792767360463;
        Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
Date: Fri, 23 Oct 2026 16:55:30 +0200
Message-ID: <20261023145555.3578469-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
References: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
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

