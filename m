Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285101;
	b=tLXKuiS7pwBaMPPT3TUhTcHbpwifCvpU+Cl+avFf/w6l02psX/PDPMQNBI/nZpKlGWjK
	 zqApJwpOgHlMEGb9oMtdUO033ca4b+hpObvSBW4n7yyQrausmh0Bm8akI+FozMBvBe88j
	 i4LtYwAlbx/mKt/bryzQ0rwPCB/gU4JdlDWG7XJhCUtTYJwxgi8++aPVordZ0yaFFTk+V
	 bDVMjEhnGNZIcGnFpPri4kqnHLTyo5FhGQGjARBTVWYqbeKHJNJVlgmdkw0L3XHsO7wG7
	 3ArqvIc3wvUGCsnFXVpMsXXHKAt+BPiqn1oAsvnXDQex1YCGoRBxvakteRYOVFU6GOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285101;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m1gnqWwuy37LNfIKTHMUOJxWxBN6DAuoZEotlbuqcgA=;
	b=yDbZlLoCEbPjd+AaZupvvzqnMqTkLKzSUJFR7MBe9eYl69s2D5svvD1SsTlqeI/jF/uP
	 +ev32QlB9ujhoBDBp42SD/FQSfTA3VEfOw6Bz3Ty6p+ZHkl2ifvGEv76Qkokt3BNulV5K
	 UtQClP+lm1C16WlKUxEghSOY6rnB+Q+2SjINNzR1nP9BSMIciH78Ppq1KXN2Q7wBZrdpD
	 N4zJDpELNQvGHBbI8eEH7TIOfRxCxNcgFQntE1Yl/4wL8MOHcQCW9+efXl+/hrG2twssE
	 UBiEKywJLucjooBlsOn9ZXDWa17+SOWg9lm4bn4361veGzX2M4dUW3N3LPzsC9edghA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J84xZG0d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33E606A336;
	Sat, 21 Nov 2026 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J84xZG0d
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795285101;
	b=qK5kQHq5vCZv2v4o8xikgO8S6tiec9Zv1W+7mmBjigLi53PgZr1vbwzrCJb1UyL5Xawk
	 9WDnBUWJWJltIVgjGA2aB0fBzG9fDTz7Kd1x+rIrI8C/GVY9XFQJ0bkiZre7S/uOz2OJ9
	 Q8YCRTpHgIUdgynP//U+YZtRsR19yGuU04v8QcP787pIQG1niXrsMH7Db2vkpWSK7knK3
	 8z29yeSgWIBySGL7BnOgd3kHYGU/bM1BVqCpgtUgagzAUR6i6D3SZHXgPB/8fM44r+Qmi
	 7559QbBe6lDSw0tgIcLdWvclzkkDGmkJYseod1SwoqsHKfCMFq8daUJ4Pgo0m3YTA2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795285101;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m1gnqWwuy37LNfIKTHMUOJxWxBN6DAuoZEotlbuqcgA=;
	b=RFnTsod7DL4qdLlnHE6G2GT4LLiRp2qTYcL1bl+hEd7p0ivRJ8NA4zn+/1s/qnxGx2lT
	 SWnZJcQqHRvUYfr+1y1Qs+xPHa0nD6OJHrmwCeVS3G3nqkTTO8Q7sW0moC41TqHBXp9iE
	 78+nHQDaeeWymdF3wgj2e//P5itf2cfGycQk3kAAL+8dUn8JdaDgsGRZ56vyPIJ9WppFm
	 bvWfk3XaB5GW3TzRXqmPEVF7hkTYcyaLch/j/8rwtOjSAIwCf1uAY6/16aK+E9MuWXUNx
	 IeohdCNiwmCjr+hUCSQFeFvmAEOB+ug178tbWFTMOpuzEqTZoCxVzonPlPrPR2Zna1w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AA391F000CA;
	Sat, 21 Nov 2026 18:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795285101;
	bh=m1gnqWwuy37LNfIKTHMUOJxWxBN6DAuoZEotlbuqcgA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=J84xZG0dDbtJxIshdnzJgdfjYDrQRB6PxKi4qSdKGBQGGv9JPc91wXk5MThmLkQO9
	 M5iacNcuqOU4KIf+zeRLX2vWQW2QP83+uC2QNNlxObsGf7YrlpFuIudZSXHwN/Yi5w
	 blgke7xqLB4/6WOVJ+Ic8hJzkgw1SG05C4ARMcdmbiuCx8Wtfsco8zPYPJH1KNlSfo
	 VXzO1yb9G+8mbqvLl5nx88zMAqZRYBARq5Vi175rXdiH4B7kDg/Vz0zYDViA7MEmYk
	 0N5EBpWujyn3dGqGnnRDqxF0eOV/V8fTvXiRtnLX3LX0AsvfQJWYXM8qhKNWXLsrfc
	 za+sMIjgV4qrA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 020E14BD37;
	Sat, 21 Nov 2026 18:18:20 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 22 Nov 2026 02:18:04 +0800
Subject: [PATCH v2 1/2] dt-bindings: clock: sophgo: Allow protected gate
 clocks on SG2042
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
Message-Id: <20261122-b4-sg2042-efi-rtc-v2-1-6d087e03e4e8@iscas.ac.cn>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795285099; l=966;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=UH/ltGBkhI4HWv393ZO1ftLc3kIT2ZoPiDb2EP7JazI=;
 b=zmlvbZFVIaQrl6XZFIezeydHolQUEOTmc+FSKHQENwcz/B4QFcXIDuxmrFsJuOyhenTIo7DYZ
 Wk2vsHYsIZjD3KfsFhi/e424pM/pBgEO2UuygCb2fh9m/uc99M3suZY
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Firmware may need some gates kept on for its runtime services, such as
the APB I2C gate for the EFI RTC and the AHB serial flash gate for EFI
variables. Which ones depends on the firmware, not the SoC, so let
firmware list them in protected-clocks.

Suggested-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
index e7a9255bcb58..76f123b84309 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
@@ -30,6 +30,8 @@ properties:
       - const: dpll0
       - const: dpll1
 
+  protected-clocks: true
+
   '#clock-cells':
     const: 1
     description:

-- 
2.55.0


