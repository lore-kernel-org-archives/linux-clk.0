Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A40717C7
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314788; cv=none; b=NDwn8egu3wytiZtgAWy2VRrNZjkhCle3KNysZnM6qJZm2rJtm0bXoUUQkcF1g372SX3c8N3S8fTAU6XSsQwTpAz+gUZv74pfv0SJsDoARnsB7VWgBPvv6eI+RU2a/uKH1i4IYKFMbFILM53pARO+Wu2RephzR7dlF9k+inyFUYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314788; c=relaxed/simple;
	bh=QCBcVoNTtEzs8YaN7v2UFqWn/6iZ4/+D+SQWJIRaEgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QUd7p7ZqQcHUZzM4f7Ts61OwerabgEOJ8RyHzzHguMgMHFFHhdWAWwjBCJbOAuhNJc4tYZa1NnH7YSL6Q4LVoKb2RPoPtF0Ee+MkyIU86WA6KtHHrigkl4movE4zRwzWcemTv9sdrGrDFyZVGZYUpIrq9MMN1iDiWaj8L03fRrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7eOMz9N; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7eOMz9N"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso81016666b.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 16:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314783; x=1706919583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUTiJvJqAJFqpZq0PlR/xTJQ+sgK5+j4/7Vro1qj7Vg=;
        b=F7eOMz9NEri2UlbOPGhUwpOyHWK+0PAmepVVUkLdq2R/yqFgWDMITwtrD9fSwddTy/
         doxvJWOPsQaL0ut/vuHpD3Qa5/S6Cqq+06sKqJTo59Y1p1IlwVQm5YbQhlg8XcpPkrJI
         VV/l+OEyAyF962DzVDRyq/JOXsmCRUJZNj9mFrsSGVyBAr84vcYdlEJuB1GPLtBYd0Lt
         vGzXgkh0WE/RrG7rEUUWJUvXwn3oPSpuTvX5msvC8yitHLHHNoCcEvHEY2zcjsmDWU23
         emgOvxjqISTlr9NrEaSaOfOfCYHGP/IjyJfgeh8fQSQqehaUraZRp9GPw2mDi36Ypnd8
         cdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314783; x=1706919583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUTiJvJqAJFqpZq0PlR/xTJQ+sgK5+j4/7Vro1qj7Vg=;
        b=g16uhdW41D8t8YTRXm378u42CvqGHhlppBsvr+zXEJNcc5RnxiCYZpGPk6Y8pIKFvx
         SsuqB0XYX6x73A1on3eBFwTO1Q3lCXko4f/oEAolY4MgOhgWUKJfiSZcolzbg5UbQ9D+
         qCExIpD/qmHVSS7y6dw2I+vzKh4xdO+RQl2xXiKVrDRTdX3UyXy0QNE5Qm8WEsuJeqGB
         ASR5zawxPOYUXF0xcsIepZGTlH3lKIc8zrEKCt3w8u1k3G7AVetMZSnxt4p1GUNkTPQM
         +ZAAJSoh76nzBL9wIf/VZu/okToDv3ZG1+DVSrjSwx4AYd41VFJzYv59TPy4wC2kdcJ4
         ZeWQ==
X-Gm-Message-State: AOJu0Yw8wgIqqH5DVqrVEZm25YxkY7SJzGwTA3oxPwYWx9TUnX6cJnZP
	8gThZ4gdnmVok7vZvoO4f9OT5v0DIZ8DDS2E6+bUEVsx+q4IZ6fC5YQi/r/nCg0=
X-Google-Smtp-Source: AGHT+IGkm39NfF0E/k3smX/KQGkNB8Zdyio6Yz3gDcfCSJPUy7NuuFl2uvO0Un5oFOG2oyg/lgq0ag==
X-Received: by 2002:a17:906:a456:b0:a31:7ed9:973b with SMTP id cb22-20020a170906a45600b00a317ed9973bmr289912ejb.65.1706314783163;
        Fri, 26 Jan 2024 16:19:43 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b00a339d705a10sm1141359ejb.80.2024.01.26.16.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:19:42 -0800 (PST)
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
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 7/9] dt-bindings: samsung: exynos-sysreg: gs101-peric1 requires a clock
Date: Sat, 27 Jan 2024 00:19:11 +0000
Message-ID: <20240127001926.495769-8-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240127001926.495769-1-andre.draszik@linaro.org>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Otherwise it won't be accessible.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 33d837ae4f45..c0c6ce8fc786 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -73,6 +73,7 @@ allOf:
           contains:
             enum:
               - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
-- 
2.43.0.429.g432eaa2c6b-goog

