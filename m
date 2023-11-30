Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqgfXjpP"
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3FC1700;
	Thu, 30 Nov 2023 07:56:40 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d7eca548ccso615012a34.3;
        Thu, 30 Nov 2023 07:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359799; x=1701964599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaHm7z9yY7JhEbhzyWmBl6MrUO4DRuFVOID91e7Rsas=;
        b=bqgfXjpPy/jr77AzHNq7Ysp94Y1Asj9l+oeTn2uyZaihS0c5B0WMqKEdIpRPIiK9z/
         qIi6Vx7HJDBsOwzjUscsJihCaTjDo5XQkPyyTlZ8/Opc2hKaq6FediQ6M6o12jCjzK9x
         cL+zmhN7MAipkEBTWEppZAAD4kFuGTC8qV5+Zgk4ksqlMGFTZDn0dYuXRiM7n2Acl6x8
         PT7bTIpv0+0qRwFEFFdyCyIqqZGjUivr2yxA0Nu+M0Rw7xNzh2mehMqFSasVF/mPF/M3
         WBIc2lrjx4mhOs8cwW1X9Xu8k8Vgi9wJ9PlHzYcOQYtCSoZcWr23rm1wzTvK4q+E56Va
         cN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359799; x=1701964599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaHm7z9yY7JhEbhzyWmBl6MrUO4DRuFVOID91e7Rsas=;
        b=T38cuyXkZtXK9+bGRi66tQp8DNHTZsHJxktdbgOAUNiX0/J7pDWRlXVJjmpH1Uwlx3
         /MTLuYi7h0zY1YokG9RHiDYsr25zRhzQ/mlhcLnr2RGEoeo7srXBt2Yj1Ut2Z73/MSMK
         YocX5q09oWphY+dKA3W0MooHJdyb/VTc5tfO7KuNl39bZCsL84oCEIAuWEpzd+WxZg4l
         1kVWvLkYOeo8XVDz2pn9HCu4ly9xacCSoVZ9lAZ4Tfc4Ej2BNVLM6zIhD8mtZ+C8NWfT
         mIQwlBVmo+ALduvxaEGpz6HQm1mn19Z4/+JkHzerby0XcFi9Guj2x+IEj/5eiPtID/ph
         CYEg==
X-Gm-Message-State: AOJu0YxIPK/z9EABna89Di9fozjyKV+Bz2tAL1uhndmVdy9LHZmb2TCs
	KFhMtN/bQiJYxNj0wSB3fN8=
X-Google-Smtp-Source: AGHT+IHRrQ9qQNsi6yG3nqPiEdlso2YvHwKneV/qHu4W+YUFgHARSucqfgOTC/owBcTkL1lolpTTlA==
X-Received: by 2002:a9d:7c91:0:b0:6d8:5a35:ee16 with SMTP id q17-20020a9d7c91000000b006d85a35ee16mr3439943otn.27.1701359799460;
        Thu, 30 Nov 2023 07:56:39 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:39 -0800 (PST)
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
Subject: [PATCH 5/9] dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
Date: Thu, 30 Nov 2023 09:56:20 -0600
Message-Id: <20231130155624.405575-6-macroalpha82@gmail.com>
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

Add compatible string for the Powkiddy X55 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
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

