Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6CsrLkr"
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A40B10F;
	Mon,  4 Dec 2023 10:57:33 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-58e30de3933so1309475eaf.3;
        Mon, 04 Dec 2023 10:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716252; x=1702321052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoHBy2Gq0IKDCcd2s7uyWkrAzEtkWU3lQMiTxxVB74E=;
        b=M6CsrLkrDBp9ZGNhzcv9WgV+Rt9dqxqqUfW7Rkf38mpLtKinTeWOLBGxHU57453FTl
         XdkVSzXip1wNwou4zoQaJzAz4RZj8LV/7hxerQPMJDyeEkFG8ObJXWlyWUDecC/9b5MR
         WsVyMYWRP/rgPOCRuuA6I3nM2kxdwgE6i4o+Sph6mm9NcmfqJd7RUNmRu23so4tqZxoK
         JPIokhSooADf+es9MB2xn0i4Y12w9DBbNcooA9xyhcZzD5BTk/8F/5tXfi3QcDiRe4ax
         6qPnx71fZ0BMdsbn/p7J9cOG/Ae4nz3k28e606YzVonqNpVles0r4z8vNsqSv62LHiDi
         UgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716252; x=1702321052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoHBy2Gq0IKDCcd2s7uyWkrAzEtkWU3lQMiTxxVB74E=;
        b=pfVTffK+ceIFS/9uDXB5p6LU/vG0zr/TdM0Sxe07BzqB5KUDAT9mqKD+0WoGdja4W+
         LXRdp27jrYSKASeHT33mL9fgQm5YMm4uaq1S2Iis9VNc1jmPpYPqGd8Q48ygroozCht1
         ZA/3gvZvZxj6/5XEZfozTqDcPyOwT8kEXGCHtV93VX9ALeI3Maj1bNVfqZqEztGLBmAP
         mzG25Db7/JcJ5PdGzNCWgFkDUlf0lpcKQpT/+mQq0tzcjdi5BrmXGYy4p+uA16iEn34V
         7mIkEREMk46hYbz0v54XrzbF0ts7vkfFvZ9DP1UWAinHyuw0OHuMEN1XvmozeJvpk6Zb
         QPiw==
X-Gm-Message-State: AOJu0YwlNoAKHYnfF1bdoK9TvwPTaqOx1SBgZhg9zeMYZAFLIcKFTo1K
	r+DcQEQQx0jLzO+LpRjRZ9E=
X-Google-Smtp-Source: AGHT+IEEs2z0j7U8AWKdw7TYbGtvp3FdOu8z69zTjkf+zoQXSsSDKlIvpLJQGbT2pjBiBT+1eo+/Ng==
X-Received: by 2002:a05:6820:2291:b0:58e:2845:d43b with SMTP id ck17-20020a056820229100b0058e2845d43bmr4007944oob.4.1701716252459;
        Mon, 04 Dec 2023 10:57:32 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:32 -0800 (PST)
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
Subject: [PATCH V2 08/10] clk: rockchip: rk3568: Add PLL rate for 126.4MHz
Date: Mon,  4 Dec 2023 12:57:17 -0600
Message-Id: <20231204185719.569021-9-macroalpha82@gmail.com>
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

Add support for a PLL rate of 126.4MHz so that the Powkiddy X55 panel
can run at a requested 60hz.

I have confirmed this rate fits with all the constraints
listed in the TRM for the VPLL (as an integer PLL) in Part 1 "Chapter
2 Clock & Reset Unit (CRU)."

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index c4fa2375dbfb..fa408fedf625 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -78,6 +78,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(200000000, 1, 100, 3, 4, 1, 0),
 	RK3036_PLL_RATE(148500000, 1, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE(135000000, 2, 45, 4, 1, 1, 0),
+	RK3036_PLL_RATE(126400000, 1, 79, 5, 3, 1, 0),
 	RK3036_PLL_RATE(119000000, 3, 119, 4, 2, 1, 0),
 	RK3036_PLL_RATE(115200000, 1, 24, 5, 1, 1, 0),
 	RK3036_PLL_RATE(108000000, 2, 45, 5, 1, 1, 0),
-- 
2.34.1

