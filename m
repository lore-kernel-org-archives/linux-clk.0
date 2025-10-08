Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0962F39C0
	for <linux-clk@vger.kernel.org>; Wed,  8 Oct 2025 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908686; cv=none; b=SNIPJsmi98uIQXvE1TZqx2fWABWemKUHdfDFN7CzW8IxRXsicW1EQ9u84bZXJizre5rjwrWnNqT2f4YNQ0fYJT5hFeNvPUiCGMzksQpSE8+yqDJuJqed7KqEYI9xcSjR8FXKt6JS+sOqNdVFeT2D6OwPm3uQcvryPzlQ25qDJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908686; c=relaxed/simple;
	bh=a/48XUdptj6+42+EZNzEr2TY6pY90ELY94jo1ZmZXkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXZWmiD3I0m+n7L8456fd7utw3G803HddPZZgOHREeJS5TS9aUl7nOet8BMdNWrZV6EmYWzVfOMEopbRcIOAZVB7xqYL54HauqE3A+lGBNkGzdcJj5KDFwpZxMiawCaWHwG5JVExnc7O6MOJifX9wXQJrXNAJgfD9xsuVaIbbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFxri1BG; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFxri1BG"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so8512884e87.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Oct 2025 00:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908682; x=1760513482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
        b=MFxri1BGnTXCgJLKZIkkDXzYe+Udpa8KvMxzEar/jDzmg5BO5WeObqk+AWF4zOht3z
         wofDFdZPFiY5oRoXd8KJmNOTmZLs1Z1P9eWNBt117/Mdrpc6fU2Mp0vbJs6y/mamMH0m
         75JjJvkCKMJXPr1N37phYMpszpvbfFo3Dy95MhgFUQCvrxNtOGxF+vh37g6/0+VkKF6P
         TNf/Ciq7r/xqJ4HygPpCfsJ3JkAAVDBzX1kReSim6yIXZde6vN66TGn3YKLWy/1ljTpY
         ISP3kHPsyXzX7hQBXh1szEr7XRInyDoKFHV4+s7ml7gA0ImJdc0+BPv+XQN02zzNgk27
         Ezog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908682; x=1760513482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
        b=omT0nAj00Scy6eOJ0u+nCdKBsyOsAMNS6ZCO1lKHUFC34f71lclw2TlCEX5y3Xfnh2
         HacYcNM3OJxojsXfs7Ur2dLJ/Rlye35YXXfvwCaAuIJgeacbUVC58+iu80CZWrgCUqKa
         zCo7ndrKrsoKef7ATx3Qzh9vLtIQAuO468bN/PoZ5GNoR5WBxc1/Xqj3aKtJMpZqpcR4
         K91fWs7bfeH+fyIDqJhmFPZEruhptApml6LQ92r1ewjCppCLFxO/ySrG4N7oKyw9Kcux
         /cJ97elxaxYliZYAU/ZWqwl5KFoS8MxM7epi4CmTbceCZ5FwzT62LELveN0t9JUIJFzD
         TLcw==
X-Forwarded-Encrypted: i=1; AJvYcCUcxsx58z+FKj/f/U528uqCzVxzu9W9n2NJmOmrpQ5iRYS3e8dNDs47YdJBMlSqdvdT4gYGTGz/1ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuLWvhMFEBWAGAd+rCOLMG54gz0Kt8cECC/QCE1pC7eln06Md
	PqSJu2K4btjJMYqEUlU1bWIWoWgbfiT0o5aK0oj2RKWw0Zo4bcekasij
X-Gm-Gg: ASbGncsaPofqBAJJg2GP2DMfvBvlHCaw4q7Wgd7n2iybQ2fvdscAgclZ0mH1X8luXsc
	f0N2SiYXjRBuJZgmf9Ureod+IlRF6ZYjumkr3KtsD+cqJYrY8LrKcOQRPsaSgzdz78BJ7hKk6vi
	d6UWaTlCFg6wwHAV4KjJiYuaC1K7BECKvuXj+OT5hH9djYmPW+GaEZsNdc8eDl/PCf/ffJ+1w2e
	riVvH7RYPS2i7E0TP3pfjwcyOEah+6CeWY8bIQ4BaWx5LpoQPA+JyrBYtdFloPIT3UDRulvHGvh
	e4eUEFfQOY+iX45bLE09zKYi6HBDrdXZhZJtZHGG5PnNUZtLXcNcI7zh3mVMfqAqmAmfo1FHMuv
	xdLKYLOAeRIKIjpH8GelSW0V+ka9k2ZOS3/u7rQ==
X-Google-Smtp-Source: AGHT+IE6CzpQ7p9cWL2g2u1KCij/uULFzIog+MKLpggK4YVhbmnkBbPJg12jiL753WYqBvss1sNwdg==
X-Received: by 2002:a05:6512:ac4:b0:581:7f39:d34f with SMTP id 2adb3069b0e04-5906dd74a07mr738319e87.43.1759908681823;
        Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 05/24] dt-bindings: display: tegra: document Tegra30 VI and VIP
Date: Wed,  8 Oct 2025 10:30:27 +0300
Message-ID: <20251008073046.23231-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing Parallel VI interface schema for Tegra20 is fully compatible with
Tegra30; hence, lets reuse it by setting fallback for Tegra30.

Adjust existing VI schema to reflect that Tegra20 VI is compatible with
Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
an enum instead of list of const.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
 .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 2181855a0920..dd67d4162884 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -16,16 +16,21 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra20-vi
-      - const: nvidia,tegra30-vi
-      - const: nvidia,tegra114-vi
-      - const: nvidia,tegra124-vi
+      - enum:
+          - nvidia,tegra20-vi
+          - nvidia,tegra114-vi
+          - nvidia,tegra124-vi
+          - nvidia,tegra210-vi
+          - nvidia,tegra186-vi
+          - nvidia,tegra194-vi
+
+      - items:
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra20-vi
+
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-      - const: nvidia,tegra210-vi
-      - const: nvidia,tegra186-vi
-      - const: nvidia,tegra194-vi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..9104a36e16d9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    oneOf:
+      - enum:
+          - nvidia,tegra20-vip
+
+      - items:
+          - const: nvidia,tegra30-vip
+          - const: nvidia,tegra20-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1

