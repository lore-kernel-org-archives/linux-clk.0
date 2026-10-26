Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016574;
	b=iEAYX5duzmAwLsAVK9B7hXVOexQt2vo95zihxypnVf+4T9zvSKsNVfJ/alskqQR0pi/M
	 /U4OewIt8+3tI0MDgwZ7zYCpS3YaNKqEkLBgMx+B6+kA/tsVS8Wj2adq6NMYuxQwy3fAK
	 +FgGWq95SjKft8E49CQdM9pLieMTlqEZiidiwxgYT/o3THlLT2+UFpkzCxr2/Cpwi3/la
	 r3uak7fAVLdqvIpDcp+XWuGGcob7d2AnnTV/Fg/i2fwOJ3xAbcoTWxpfiB7goAKfl7CoS
	 BVppjiF0FCpMgtYeUMNm0qL/m8rnZdQ7+huExtPl5Y02fhIj/ML3kpDJlTShGtknelg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
	b=pxrEOh1t23WC+DEhH7GiG0wKES/s/cyqRWlQbNV5ORZhvum+Q6EeJXPa0giCyzPqt4di
	 RRlNpmeyt182HD72xNQAzniNscx3SYYah0xIZB7ddBv3VBQXRYsfcwNUmX3Qxd8F9UtMG
	 5FThoJMV+XVzNwW0sGZOxtkeJfx0Zffl+S1Pja4pZU/9/VOWUYh3WiEaibQ1aEEmm685o
	 UyM4ISb5eupnUzgk74j2l7g0g1r4D0A+oHn/g0isp/5VYFmX7zhBgbtHDwqYQjXvvCfy7
	 nrk970m9F0dLwYETk+qDPKmmRuL6CNPNKTx3yCJa8Ior38VRIvjBp3Q3hNXRAAzf8ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZ6APpqb;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B90606A32A
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 12:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B90606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZ6APpqb
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so24256605e9.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016573; x=1793621373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
        b=VZ6APpqbtbmtTfKFu7n9KE6Svnl7o5+7gdDW2eofGKywyb9cCi+w3wraqOH6jKRHc6
         fGH0wnw93Dd59K1w2V6c191KMj/pv7vhjM3COFjZW85+BkhqCh4rofAspC4c9os7jCJL
         Oe9182Ht099MIMhZ7FGbKrQ4IQ5qFf8hzc1r0iKnv3LQadJGvqfgQ0KC494dAenmMw0P
         mUAVPfkkdIwJ4DoSmYCGnWybC635Vv7zO9hpalpnwJpEoovHBQdnFj74cOZkLAzsfsmh
         sLn1aDWp9uge8Drm78MOyaO7qwOkreYJcFuWPIUieceKUnCgD0SEZTLCe/Bb6uiVLjXY
         saRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016573; x=1793621373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
        b=Ep4SZL6g+Hx3pyJvBk4u6YRtc3KvnGtjHJwhaLhO8+c/AgECHg7apUiIfM9EpFjxhd
         5mRnu1FsS2CLE0+IlTB9tg+Kud0C7SgNe7p1IbDej3kQ89aH3miWc+3qi0JeaaCZd7bN
         WCjF9flD02ZNle3idxUwToAlIq8YQ/L9JyehBS082OrsYDwxhQK1aw0fiUVY3Q6I/nMk
         gFqEC66YAzIIdMh/76s6K10pnBGqOGQkWMVQRX6d4vMpBBYThe7kLD5Z2z5poD1xfXto
         UGoO3AJJ2G2L+VKpHYh73B7as6PSVHx/yrwDAFSWtnF7yNpnxL+VLFVSjb+7CIJssmZ9
         wfhA==
X-Forwarded-Encrypted: i=1; AKwUvBwBoEE41QI9t5TOhLXsSq4erIyvl8iUhWPk94pU4KVj8sjtNjWEZ4kyf9cEAIIDC52jRfETDQ9dFDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE9kJRB/gDq4j36fxcWtzU+cyr9yN12jrx5RThpoKoNpZxR46Q
	lKIt3G/1chp6UAM/vJ+hsa7FJyJ4uewrwTd/SFkCJ1uXM2VI03bQ7WJh
X-Gm-Gg: AYBFou2kwpjzfqReWFZ+mZkb3a34YXAHy0yRH+5byPDPlS6fBkhJhnKI5/hAvrcsLfa
	YZLzSPRUoS0bC7E85gdMfmPRZXGKr5V8FIUX6roVdVlhb7dZvWnANiOUNpYuXzXFptiUXdNOgyS
	JT/yTF8WqasBBBcpFhuDsz9KvFLIZ93VgmxNo8xIKhdtLMfuQXodi4JZRHndM4WdE0BXXLoLbCf
	fkBGzr+wycShe+Gmi7uaB/QofzG6mm/2exVDfoprWm6UFa46zkyCjYCNfwoakoBdBe1yrWWB2yW
	s5yWrauXuVFfDO2VNCtJTFh/wFTDdEzBCIrdOq5IccJTayxUa/c20ZFJswnZwfcOrIlto6MH5lu
	GRTwxoi0IbSkT3ys8fvMO1cJYLZp4JhfQ27CIuhWCM0A+oUJfG59lpxfEbql4Zy55OcK54M5kL8
	TQhyKkajRlLPNSZysNXM1FTBzgCOje7AwCMhTlSoQqKFTceatVKs0HX0dTscZ2t2yDdmd7+5S+V
	J5DgFLqgvMfo9xl09gyJaY4VmICulQ56kmLk2qpOuOU5oUGyvE2rKJgMx+mCw8Qd/DXKSvCAcPT
	b6FBE0m5H9B0P7gdg2ILTsxMsoCmGOeZGP1dUlD+V4gp90gRRzeXtvdTbenB+y2mpFFbhQ4/JvE
	a2FnZ
X-Received: by 2002:a05:600c:a06:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4a35acaaacfmr122280585e9.31.1793016572849;
        Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: clocks: qcom,gcc-ipq8074: Allow CMN PLL bias clocks
Date: Mon, 26 Oct 2026 13:08:13 +0100
Message-ID: <20261026120920.1667982-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
In order to describe this in DTS, allow passing them as the inputs to GCC.

This has a benefit that it avoids doing a global matching by name.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- Keep the existing four-clock form valid with minItems: 4.
- Drop the _clk suffix from the new GCC input names.
- Correct the NSS NoC bias clock description to 461.5 MHz.

 .../devicetree/bindings/clock/qcom,gcc-ipq8074.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 00d7df75b3d6..1c9854a5c572 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -24,18 +24,24 @@ properties:
     const: qcom,gcc-ipq8074
 
   clocks:
+    minItems: 4
     items:
       - description: board XO clock
       - description: sleep clock
       - description: Gen3 QMP PCIe PHY PIPE clock
       - description: Gen2 QMP PCIe PHY PIPE clock
+      - description: 300 MHz bias clock from CMN PLL
+      - description: 461.5 MHz NSS NoC bias clock from CMN PLL
 
   clock-names:
+    minItems: 4
     items:
       - const: xo
       - const: sleep_clk
       - const: pcie0_pipe
       - const: pcie1_pipe
+      - const: bias_pll_cc
+      - const: bias_pll_nss_noc
 
 required:
   - compatible
-- 
2.56.0

