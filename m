Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCxHEOU1"
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B71E198C;
	Mon,  4 Dec 2023 10:57:29 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d8ba6c9b4bso1218758a34.3;
        Mon, 04 Dec 2023 10:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716248; x=1702321048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjmGxTzba5eWWMFHid+3cWm8jzHt4QZZbkOJ/mqzOBE=;
        b=GCxHEOU1+uenKLbYECHmcuusWfGfz3/iF1GmzYh0oOXIc1fbp0Mj8jG8F67S9D1gEd
         45VQmkBQse2n1WrDW8JRbHXGkOse4goevgrdJ2nL1ZSs6ifSHmx8+cqk8PB5uQRfKaRY
         U3MGjfdFFgaPgpYb64BOlXrEsml6WVdxsUaVXOIclNRrMv4aui7tRm/YiU4GsnAtl6gP
         l3uyCZegMSojgsunKug4lxPjPsQX8FZky1L4DEIsNf9VHtLaJXo8stey4ZKYnr38NKJO
         T+t0IcgMRr8inPSeDhjXqWGT7RRy0PYzK5Et11uTqUvF5SiamQer7nC7wLeP9C4scr4E
         8cqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716248; x=1702321048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjmGxTzba5eWWMFHid+3cWm8jzHt4QZZbkOJ/mqzOBE=;
        b=Eeu1TJdDhQkYgYIn3lJJ926xvLhe+x3JqOJYx6EtwtApjUw0n7dRJcZ23nZP7V+vUj
         3xixhq7G9+4ezAYPaSa9SRPQILa7cX4OeRJ09+oMAojmZzZUu4DqTbPqNNVH0LyhGq+D
         n1n/mvV+55i0+gOqv2xTCCPeQi07xDQ4F86ImTvtzGSHCGmQzk/EdLbT+Bw0SibfZ8rk
         0GesuLJXq9KQMYQeBhrUVGCkCT0His4jtA+4TNHI+D5deRrx1QCcxxeW6shYuXINXgqR
         a+74Bjw79zpWuxmRIVdAJ3p9ZAcXdEnB60LVeA/2t5zPEck4xnPQQFOMTuCptu2F/w36
         CFvA==
X-Gm-Message-State: AOJu0Yyh1EOToIeC+K6wXT85qkQMtxE40sssSx2EbIOouaOf4wgQLxKa
	WwrbXzx5CwuWSV4y83XauzA=
X-Google-Smtp-Source: AGHT+IHzaTHpQ8Ye62P0QKbQwCJqXbRnvbwicXwZ+oGcJTkA78/3+GN9vTij/qu8kdADwpJVxnvYZg==
X-Received: by 2002:a9d:6f82:0:b0:6d8:7afe:7867 with SMTP id h2-20020a9d6f82000000b006d87afe7867mr3604849otq.73.1701716248278;
        Mon, 04 Dec 2023 10:57:28 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:28 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	quic_jesszhan@quicinc.com,
	neil.armstrong@linaro.org,
	javierm@redhat.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 03/10] dt-bindings: display: Document Himax HX8394 panel rotation
Date: Mon,  4 Dec 2023 12:57:12 -0600
Message-Id: <20231204185719.569021-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document panel rotation for Himax HX8394 display panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/himax,hx8394.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index ffb35288ffbb..3096debca55c 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -31,6 +31,8 @@ properties:
 
   backlight: true
 
+  rotation: true
+
   port: true
 
   vcc-supply:
-- 
2.34.1

