Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956273;
	b=thYWK6ynN/UjhyWlAy+mAtmeSHWVmXhOA58KD517uC1OlTWC7t0rsJVCiojoiTb4/L73
	 Oe4EQhjVNPryJrarILRDJs2iXpOWpN1hLyC/dUZneR5vr25/3IM40/TanaX+S98qK3/rZ
	 zO91F6ztdl/1wYQMl0Pxx2gL7QClg0oaqrebWficCpNMcmGuInVe8oTm4YxoH0mfsRKcj
	 bsTnA2JMb2CE9xdQM1li77uVzV91nLJK+3SKthWXPSLqExLwcNV62s4hkkpjSGSzjrWhm
	 sHML8TMvfnsmUOpHfncGIAZ5CgpXBr0vcZnyCRwfwD7MnvSNWTj6kk4Uy5t47hdDYrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956273;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=NJPxs/DZ0HjQlCbUBgtmSDlVuqx+ElkjMOR/IqIVZf8=;
	b=IUH273HygJ1gkb8vrkXJ0BfS/uabPQKnJhW89gKSa85l+4ioE6yGVWu900Xp1zqMf5ri
	 dV+F9PmxCcNrR0ccBxQ/FTOyU+SVn0MAlYQEVFz/tKsIMF2ZBscSIRiegoh6fNCbZFqWw
	 g4tilJzMOxnP8d2knFJNbM1iEP2M1goZsL7VQ9OwD927NpJMvIVj+cF4bZe5tfnyQEPLv
	 hb9NQSqgV30VeSnpHWTEwG6DASo5Jv6SHVbhKEiPyfj6UdX1ItDZi5pRYMSOQte8QJtkn
	 pF3rMPYtwLFAI667AR9WKXGICeoCaz10sjM87ava1qyHOLiK9RIDBofjK2AD5vNzeYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=FjwiwajX;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E95E60A2615;
	Sun, 25 Oct 2026 19:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E95E60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=FjwiwajX
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ib518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:12 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ib518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956253;
	bh=NJPxs/DZ0HjQlCbUBgtmSDlVuqx+ElkjMOR/IqIVZf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FjwiwajXkgQagVzbN+XIIegq9IWfswZwGq9FRqHTBx9x7Q9G6Ki5wDmeIaJK3OxoJ
	 RNGyel9n+nlf2dicGavNJqDCCbmnGERaNCHYOZZr8meXyuY9zlVFTxeGJ6wLGNok96
	 Lk/xzOLN+l8Cm9brfiJx2MOZSbfU+TKUzsu9Bt2w=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 2/7] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
Date: Sun, 25 Oct 2026 20:23:59 +0100
Message-ID: <20261025192404.209695-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Jiebing Chen <jiebing.chen@amlogic.com>

Add S4 SoC tocodec compatibility support.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 .../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 23f82bb89750..7e053aaa0f59 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -25,6 +25,7 @@ properties:
           - const: amlogic,g12a-toacodec
       - items:
           - enum:
+              - amlogic,s4-toacodec
               - amlogic,sm1-toacodec
           - const: amlogic,g12a-toacodec
 
-- 
2.56.0

