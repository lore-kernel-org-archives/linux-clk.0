Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156843F9CA
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550124; cv=none; b=B1jcD2CtjD4mhODWIcl8bDZhcrYkM+gPjy9cLNvhXU1o/bCFEIv5M3MHAco/rlpNz12jHdm5ZpTDJb81IWM8t3Yy0kqPUF61dFTLcin7wRt7GM9Pf+oobqzwa6xkU/RTJoc9D6q1o/tTPu8SINslPol9dYbSezthMjOYIOXm9Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550124; c=relaxed/simple;
	bh=XockLcIBDdsNmpd6ix/ucnZWIpV6IperXyESZagDcx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tesHkCZoLpkRdf8ZunYdxgZtyClDN6OHij+sTNzwVYSgwrni1ThK6NUym+qqoKj5C8j1THc6lZdJ6J58neaXtLY0U+KKRYNEtm6K+SWmhwUtIT7zJw9jayXIyRfxaUtnaRZvYonw+EMEzeGjVTje3M5i/BejgVKrTEOWDza+Qj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=me9cGA0E; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="me9cGA0E"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so443285266b.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550120; x=1707154920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXk8/+S7v5krsenTsUmli2T0MASw2Emo0XGTAotRCmQ=;
        b=me9cGA0EUFrX0W+iIdnXGySO4TUUQGkpFYHT74zpHsq2oVO+ubUeP0LJELuERdzyPt
         d7OBKNHf6TpsU6D4tUtvCvuntEiuBJEAgxx9j0cyX0MuuotnVq/vUHFLFn3i6Kb23ZeN
         9TYhxqQ0K++Ul3mdzSV33KJFwqCu57kfeFSnWz0BneZuP/D9QUPp+ijcOVBGOmjfYahQ
         r2CUWOtQLoQlr5neVWekZkM5158/WQz+gezqielAm19N/dtr/eEZRmx6gyHaaNExkjwd
         SCF6oD7ScxgmTX5m04N1ug1tK30R+F2oVA1Gs65DAG7KktoVkv2Tlthz6nED1ndAQ8lL
         G6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550120; x=1707154920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXk8/+S7v5krsenTsUmli2T0MASw2Emo0XGTAotRCmQ=;
        b=kWXGQrU24hRtkCNs/qZxEGQiIT9uuL/v2f6ZzwJ/NTJsBE6pXWNIanbfWsqFAJ6+rV
         gQYImafu/0yTAmJojvtY9Q90cS2rNQwa8jsKaGq3s+RsmC2kFMPmepFqFQgLZSt0pA4G
         oyLb6QygVFyrbO8IUk1veFRaAP5o8mwfHOTC0VigVIDPAeu8BOng0oJlPKnJk6k5PBvp
         8+YUWNzIz7iTMcw0pXU+JtXFR63BA5q2pJo6wgqpOCU1NCLBmIlleGn4rxuDBol46MaU
         Z0uPpECuSzIKjYIfPc0LWi7kFNZ8SL+/K56T76dlubxVHhA8MPSPXE/zsptfZ0/7zzC3
         Il+Q==
X-Gm-Message-State: AOJu0YzHqgONYL/GdAxaypmnRRXN/uP6rJZNZPSoSkvtaGTbMIWxTqJ+
	ovYGorOBUGlDv8tlWQuQAls+s76n1MYm8YAbTxXwIU/hPKJ9NDqUCsuqbLkag1Y=
X-Google-Smtp-Source: AGHT+IGunLZoBTEVBZdI1yEcs5rhi6jXpqBCIk0DL8PFhzzjG2+46lPnju0xv+N8if+ZBexF9oVlcA==
X-Received: by 2002:a17:906:4a4c:b0:a35:f2a6:3172 with SMTP id a12-20020a1709064a4c00b00a35f2a63172mr1154142ejv.43.1706550120260;
        Mon, 29 Jan 2024 09:42:00 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170906fcd900b00a311a360433sm4237765ejb.143.2024.01.29.09.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:41:59 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	inux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] clk: samsung: gs-101: drop extra empty line
Date: Mon, 29 Jan 2024 17:40:04 +0000
Message-ID: <20240129174151.1174248-2-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129174151.1174248-1-andre.draszik@linaro.org>
References: <20240129174151.1174248-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is an extra empty line here which doesn't exist in any of the
other cmu code blocks in this file.

Drop it to align cmu_top with the rest of the file.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
v2: collect Reviewed-by: tags
---
 drivers/clk/samsung/clk-gs101.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 4a0520e825b6..27debbafdce4 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -25,7 +25,6 @@
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
-
 #define PLL_LOCKTIME_PLL_SHARED0			0x0000
 #define PLL_LOCKTIME_PLL_SHARED1			0x0004
 #define PLL_LOCKTIME_PLL_SHARED2			0x0008
-- 
2.43.0.429.g432eaa2c6b-goog

