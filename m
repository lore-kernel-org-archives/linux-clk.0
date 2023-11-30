Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL7UPPJr"
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07C510F4;
	Thu, 30 Nov 2023 07:56:38 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6d64c1155a8so688709a34.2;
        Thu, 30 Nov 2023 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359798; x=1701964598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkS0F614/zYSCaqFBeaQwkOCeCxZ+aA+0mnevTE93Gw=;
        b=lL7UPPJrDfQjaNAIWXw/bEzhOtbNmHAYkJnS5nm2zuUsLBFx5YCEF8a/LRsZyYgmvp
         jYd+OTbl7TusWwZnclUmB+nCXfBQqTHJcrx7rGfMo3uWvtGlDEGIIOLUIe+G8SuYy2ax
         mJIIbJqyssShuFmM/+KklfOl/jUOufrJ/fc0c1D2KhhCuJsiCgGTUT6YzLv4LrGjC+e1
         Ko2VL/GWEqZvBB17/PuLlUfOFo73rrwjZhe5Hdwuzd3GLDBCgMTa7cym2Jj8GBNxzdV0
         oGt+6OiV59B3jyoDouLmvizD0OgWEaI9h/kBoVD3jlFoQTi6406RGe7EOorkpprM98Nx
         SXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359798; x=1701964598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkS0F614/zYSCaqFBeaQwkOCeCxZ+aA+0mnevTE93Gw=;
        b=YK9geb9yp9W1hHSQmA2P4igiKeYCtvAJqPECImE3IOEGUMuPDjA9TOaT+22WoU/zFm
         taQuyNu8bDk7IVoP0fI1b8CNFE5wNcElnTj5l6Yo4pOWS7KgcsJrJyzPTQP4IElrw6jv
         Hz1b6N0c9Ll143sG7Kip8tS6QoM6qFdi5MecJBgDxtlcs/AiZ8x0nUj4g87B/DEl5mtn
         wrHRShwo9O/Se9JetYCbxhxvFYXUUF+b5Od5DJR4zX3knKkZt3yvoaVPdtCevxk2zVmk
         n6G6ZtWOZovsxSgWEn9+phnaiJ4QQ2iHlvPh/oUDfM8QNNruInd8H/8JEKl41o07eyCw
         4dbg==
X-Gm-Message-State: AOJu0YyKUWeVMsG3uM3HQJHVee7rgvkS2bW7aEiav94ElKhuQnY8cwsD
	tYjycdeAGluk2dzZHRuneJQ=
X-Google-Smtp-Source: AGHT+IGYwEDgb2oRRJdUhgFlR+f+8NClC5+pTm0V8TeeHR8MPP8qJH+kd/qwXxUEZ1fod/sk372crg==
X-Received: by 2002:a05:6830:4783:b0:6d4:726f:6899 with SMTP id df3-20020a056830478300b006d4726f6899mr21447899otb.1.1701359798063;
        Thu, 30 Nov 2023 07:56:38 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:37 -0800 (PST)
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
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/9] dt-bindings: display: Document Himax HX8394 panel rotation
Date: Thu, 30 Nov 2023 09:56:18 -0600
Message-Id: <20231130155624.405575-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
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

