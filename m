Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956280;
	b=xWNdMLYAfkSLLk0QV/AxtTGh3MAH2OhibAb5IZl3XONupr1C2iOKiZ+Ch/Tc5Kcm2DDy
	 ZJP8mUz/517+B/OvI0oT9BKSj6tnGx2kKl+yCJar/FQPypdICMCcTqt18cNYLPh2JN3m5
	 eT/O6XAl+btxsC9fZS/26S/05iDh39+SRsw5RexUSX0Aq9Snd1fjFh7KGUx5BaRPZEFmk
	 onlBlAZDsbFzvIQLl2u4rf+OR2DFXF2yEH2NCrFlxCRL79skPpCOaHt/EI/lFUWgzxUmK
	 rciXx0K4DPy1ubV26aixX/NF/jIx86oAIT7VdQv7t45gBG5XYOaaSkaJYMh24x2uWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956280;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=SeMk/djFpll7ZlqK1Xj5r+CEpbpIWtTIPN8oDjZMJfA=;
	b=cJm6AXyHsxzLlSqrfTux10LDC7TIsRYWX4ql0p5HsDnq0uHUAh+Li4wuuni7l0ie6FZS
	 HHaZXYwUPrjITd5/6GaWANuAykIVv4xLgKKNlIStU6Vm48xiSZI3ByFBmy4OmmtX7Zb0u
	 y3wo2LCHUKkY39K/u6XhaEPF4WWzxqk1qZSw6+BXeC86nb2LkXKT9woJle8PngncC/kv5
	 IAXldd6JzgMDIXJJdtrBQNnzR8b91zTQM4H0q+JwOgV/Ew+ybuJnkVKJvr1QdYdpwK8ZY
	 C6wOXI2iZCW/Z5I/pRwBA5ng0A1e2THQt9It2xTceH7BTumkisQ+mgeTxRZ8VUSxc+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=QpAgwFWz;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515F860A263A;
	Sun, 25 Oct 2026 19:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515F860A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=QpAgwFWz
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ie518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:18 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ie518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956259;
	bh=SeMk/djFpll7ZlqK1Xj5r+CEpbpIWtTIPN8oDjZMJfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QpAgwFWzHpoyZPbyXyW0Jo0y9zf1jyDjIHZVgyCu+Dq8crqwZZD5Xx3E868wM7ouz
	 3ZXXQdmxfXjlrNPUp4JcX8+Cqb2lpdE2cSK2SRaBjYrThrCyfiNrzg0Eq+aBP3WpOt
	 w7fj6yZJ0B6w3EWXoTQQPRhDSoD3COoP6KRTbklg=
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
Subject: [PATCH v7 5/7] ASoC: dt-bindings: amlogic,g12a-tohdmitx: add S4 compatible
Date: Sun, 25 Oct 2026 20:24:02 +0100
Message-ID: <20261025192404.209695-6-christian.koever-draxl@student.uibk.ac.at>
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

The S4 HDMI TX glue has separate data and clock enables for its I2S
and SPDIF paths, so it needs its own compatible.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 .../devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
index b4b78475c5b8..016d3cd3eb03 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
@@ -22,6 +22,7 @@ properties:
           - const: amlogic,g12a-tohdmitx
       - items:
           - enum:
+              - amlogic,s4-tohdmitx
               - amlogic,sm1-tohdmitx
           - const: amlogic,g12a-tohdmitx
 
-- 
2.56.0

