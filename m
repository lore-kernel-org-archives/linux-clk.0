Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+LvPSha"
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2015134;
	Mon,  4 Dec 2023 10:57:30 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-58df5988172so2867882eaf.0;
        Mon, 04 Dec 2023 10:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716250; x=1702321050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt7p+s16vSie2KNcwqFmTas/nYdcYXt7AtlDl/GxmQU=;
        b=i+LvPShaXWHL7mWNFL+JiwTkrNmeiINTcYGs7YOZTBdvxNAYqOnNmRMND1Ncea38m6
         2ooERKo3RKZf+yQbeuQViFQbodTfK6VlUsJOQxPyJjvW/0JiE8WEqZwoNEg26IrbLW2C
         WQmriu6tanmxriKrwELe8O8UbCTqw/NzqYbpS2CO3SU2fJjkUd/1Zq+UagNfOcP5i0HA
         eY9EPaODx6BC0aUGCVMgU8Tx6dWVI1cuzcMMCHJwoe9JEd0KNjc59LL7IFHs2C63D+g5
         hpBNylQg0lw/4e3g7q4wWt5RWUAXkcJztrwUuwdXE2U64hpAS5wKV0/lqK73gM3sFzNF
         5ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716250; x=1702321050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt7p+s16vSie2KNcwqFmTas/nYdcYXt7AtlDl/GxmQU=;
        b=ptIBB/M89uFLicjhnpbTuZ9FEQdnlBE96sRoyLDvEKjbk9R/FvgibkpQrd9LrJEyP0
         53aoqz/hj91SYEbzasjXPyY7NGlWQiWj8RS+B9PB/efqD2MuRz+oM9VZFwVvHNeKNpZh
         MRKMO3eh77tpXojVHG2HEGVIjNSXhgu5ZlkctDkP+ReL7HwRGbbhsq8LDm/yx9WUgDQu
         rJ3xCWE8XBTBZdcToHSnPVaaNfwJxQduxtPVPBNktCJxFfh8yF3TnK/LuPMsAIiQsjv/
         +oeKI24ORNV282B8X3HTafaSTmHNQ0LAUXcHMAub0oi81DB6WIhIE/+Pk20X+7MgMsCQ
         sQOw==
X-Gm-Message-State: AOJu0YzEcFnJHcgt4SMJI8y8Lq3OOClEmL3IBEDjZVUri+wOXid5XDdm
	uZuqHcrkoyWRdnugBAmmb3A=
X-Google-Smtp-Source: AGHT+IEg3mnRFteODCShcmaGK0xSbPP4p55IbSbjlLspWPM6wpaoisrb+f0sfc/+J6PPBDDH5g12Sg==
X-Received: by 2002:a4a:a308:0:b0:58e:1c47:8db2 with SMTP id q8-20020a4aa308000000b0058e1c478db2mr3008122ool.12.1701716250102;
        Mon, 04 Dec 2023 10:57:30 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:29 -0800 (PST)
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
Subject: [PATCH V2 05/10] dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
Date: Mon,  4 Dec 2023 12:57:14 -0600
Message-Id: <20231204185719.569021-6-macroalpha82@gmail.com>
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

Add compatible string for the Powkiddy X55 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 3096debca55c..916bb7f94206 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - hannstar,hsd060bhw4
+          - powkiddy,x55-panel
       - const: himax,hx8394
 
   reg: true
-- 
2.34.1

