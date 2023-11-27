Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB9KkC+L"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE5319D;
	Mon, 27 Nov 2023 10:14:36 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00a9c6f1e9so654270166b.3;
        Mon, 27 Nov 2023 10:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701108875; x=1701713675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz+SQoVhosSMRX4vnLdp6vX1tDuM6gc6OEfyVkKHGuA=;
        b=bB9KkC+LjsASCQPKtZFJEGl5mnr4rD2uB2HkFspYEaGb5Qkcw2NMVXh2Nm++Y7qOEP
         9UeIW/0hlCoRVjGGIQaJeUvs6+O2x4oi61DETo6HYNQHr3OZV2hzlg75e3HbfLI6rOKG
         02SK+jLh+mR+Rj4UuFsdhPw87fyVQb+dwV/+y5OB3/7eQuMYbow8uUr08Pw1zxp98yqJ
         CGiDCk792Lu/5wzL5IGFrVfJZuc5SIVPmOYmnv21hMt++dcrW4QFiWnVgWdKwiQ4pvSf
         ehr1RD9WThfL1lhJTGPKi081ymmFPkLmc+BtjepG+haruoJELDV+WIRBOBLHfblgFhIK
         0g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108875; x=1701713675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iz+SQoVhosSMRX4vnLdp6vX1tDuM6gc6OEfyVkKHGuA=;
        b=NmbHi9NsXKDKTTqJbjBjRHGSVIP7us8AQ0Eg1cwztIi3fkiFddjOGfLCrHikEl7tF6
         +WFRxb5qsnoACNNUbPZa4aa+2Fz8TDs0Qs4iMnjfaaaS84s9kzMsWXsUgUGnDB96HWOl
         bmkwvZcqydOf7Kv2Cw/pCucJZNZkoHEXYwRa0/SXCZxOlVms07n3rPn/JwoiGWldijYy
         Ro7+F7Tn5jyyiKvraKowOo1ETgWGXPWWgLgP6bhNi7wJ8Vs5TEQaA7AkTwsNY6nQCacW
         B/dTbogKbmgiXhCWtrDDbkQ2nOoiz8BqmSZzbiMEkWSCR53S0l0jJPnP5d/PK8e26k9X
         mcXQ==
X-Gm-Message-State: AOJu0YzQiGrg5Gk+UBUfEFlp8t6hEeP0aG08l6CwsDiP/JkQREbBwj93
	wVd7wHomVo6zCsF88r1C3w==
X-Google-Smtp-Source: AGHT+IGAzJ4ZDLCBz1Y5mlv1IpMNRjadXbsXoO4z8QEREOSPN3sfahZ6Yi7aDN1uEJk7BP03TLJ5NA==
X-Received: by 2002:a17:906:b299:b0:a03:ad29:a00b with SMTP id q25-20020a170906b29900b00a03ad29a00bmr10533836ejz.36.1701108874929;
        Mon, 27 Nov 2023 10:14:34 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:370c:d8f:2dce:7367])
        by smtp.gmail.com with ESMTPSA id dv19-20020a170906b81300b009a9fbeb15f2sm5952271ejb.62.2023.11.27.10.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:14:34 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v3 0/2] RK3128 clock fixes
Date: Mon, 27 Nov 2023 19:14:14 +0100
Message-ID: <20231127181415.11735-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series has 2 patches which fix some clock driver issues for RK3128.

In v2 [0] there was one more patch [1] which I dropped now, since
it has been merged already (was submitted by somebody else [2]).

[0] https://lore.kernel.org/linux-arm-kernel/20230829192958.250248-1-knaerzche@gmail.com/
[1] https://lore.kernel.org/linux-arm-kernel/20230829192958.250248-3-knaerzche@gmail.com/
[2] https://lore.kernel.org/linux-arm-kernel/20231031111816.8777-1-cn.liweihao@gmail.com/

Alex Bee (1):
  clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name

Finley Xiao (1):
  clk: rockchip: rk3128: Fix aclk_peri_src's parent

 drivers/clk/rockchip/clk-rk3128.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.43.0

