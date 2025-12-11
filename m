Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEF1E7C23
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495007; cv=none; b=WLLJ4QDyeh77qUp7wxUXAw0xsbXOnVMBEixKL5VRKvBcwpBM0z1+RjWnESaZpONUzZ5UShbq3cMhXImhhMqcE0UFI25ZIu1xOE6CZ/wXehHRTXoH1lZhtYaLnQUyWAuFPU2V8T8RXyGQFp5VhFS/5JcX9Elp75s/MTQi+587qUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495007; c=relaxed/simple;
	bh=ZY0h85yve8h09n3VMoGeby1rYSEr9a4xEaJTa8s51lM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TRLCMuA30FcVv/m0yCwHWRQ+acBRucy+gYINyQ3A4i0l/Oh7236nMeCnjnJKhUF0594yMf1lErcrJBltBhB8sqwxqYr6HEt+rGgpObC1fUfp1rHh6du6c84hTirSOLKhucH1GYvYZQmsNW8AKqRAlFzGz81Y5XBs5YgWiNO6k6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iOPTr7aA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=klSoMiP9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iOPTr7aA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="klSoMiP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
	b=iOPTr7aAzjXA5ovzETnQZVWPZtx90pu55Em4PbzUdqoJ4El064dVOFGfytEz9C10pcECc7
	ZMRCWKB75Dxge9n17sX8GQfnvPG9aCNUrsUgM6KKGBQ1Zmix9oISbC5Drqz1sKecqbz0PR
	g6dTtn6XJaj393/dpq2qLoSJI0LPFPs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-GD8bGjyQOJCImUBplFHXtQ-1; Thu, 11 Dec 2025 18:16:43 -0500
X-MC-Unique: GD8bGjyQOJCImUBplFHXtQ-1
X-Mimecast-MFC-AGG-ID: GD8bGjyQOJCImUBplFHXtQ_1765495003
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso127352885a.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495003; x=1766099803; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
        b=klSoMiP95yZQFcB4JBgpl/obxA64bOgUNeNOH0zEjVBqxVHXhPf/4zuPH3rol0S18g
         cjvV1D8m0lUeKn+PTW33DYVar40pWvTCvOJ2TdIsbYEZVDgQxeUZG04JcYWDZDSxOxJk
         UEWhr6ROXnyjeiEhSyiB9rUT6zY6TTHhZY2y11wyBx8hbfWK5hldckZV5L6HDlrcs9NT
         OlXI9vJV/phTXkAqmOjfxqpSL/L0exVBaVk3NK/skVeEBiY1VhxWkJlvR+Ev8BXpvO2e
         oOS7b00HP/P5Z3RBywEk00J64UjvIwTDJNDJjYkQw1+fmpTb+IZ2xRVfrJpBSrfimn0N
         cxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495003; x=1766099803;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
        b=YCEIehHkktAsD1WJhFyNGiQVaHQY9iNAZ31f2oJbhMkNJsaeK1ZhGjhcgAjhsNmHUj
         jgYunUZws2XJKhnsqFQT9XIZga7MYN+Di5BNruiIDorr/SzBu9oxdMTTHCRMA156ctMP
         iC35GY2+gj4klou5gcWy7ZHn/PWHNsfCRz8gG3EF2vftdAwkK1B8tfOWtIKz5EyqIHnw
         u9rLvUJ3TTmNIB9Zvu9n4QSB2ylMwLIfnpTcq9urLhgzqrF62KXVHzXa43ikLXTOmFsq
         iad6Rt3Ic+pwK7WI6hi2PboEPA6n0xdmKXz2PqyylnV3heH6yjWd+9S5Mw7xrAZ7uWSX
         aS2g==
X-Gm-Message-State: AOJu0Yy4+Xd1qSoHb/mrxC9Ke8bQfMqMj8KkZAkwB/Dhz4r0E/Kk4zXs
	ghJTETVKI9AX40FaNj+2qYDqq6Zlf07sl6ngbeJQ7wBQ0yfG8PzGLt/PzQc3tbcY9OtV83CX1FU
	NkPJ+sDRumZ4wA2BmpC7fhzn8zsW9E3HjN4GVbOITXY8lEv7FYjndvX11rwU65Q==
X-Gm-Gg: AY/fxX5WFLfyTNDg6seOqJVXpGyPfQtzNI733RDcTyNkH343VZ2xe2o4+n9dmTLgLVW
	JyfPTCBJhLAJlibqlKzktMeWa4PE9bb8YWA3fRrqeSmskUKLqp1f0ck3pBjJiXiK2/pzAJj3w7l
	oY1KOObJZt5LvVVlwZFA4aqG4COm/StzxxMyeNvGGZEFzlSkH1nHsk48dMqqLQVnf3CHi516QOA
	M1udyD7GPACTS+FovSb4GLpHdqfyNZ7r6Xfu+MZY/DEZS/ecLYJ4UI4EWQLl/fkvOkASAKTSTXy
	LFn3C8wMW5PyCrro7mw/QV2lABiKdD1VArCFW8qplHXbLDzBb72/ZzQdFnEPx9giyNrf6/20iBr
	oOAjZj9U/R85xhO3OvrACobkSGLHXyauTeBCWB0TGQeniIlHtzJfalw==
X-Received: by 2002:a05:620a:45a6:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8bb3a3935d8mr36457585a.74.1765495002862;
        Thu, 11 Dec 2025 15:16:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTgdmowmpGEJXfkwF3JzqsLep6RU6ll2UwJli3c/rdVkRG78nuaQFcWNbYooZO1mfConbh8A==
X-Received: by 2002:a05:620a:45a6:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8bb3a3935d8mr36454285a.74.1765495002438;
        Thu, 11 Dec 2025 15:16:42 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:16:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 0/9] phy: convert from clk round_rate() to
 determine_rate()
Date: Fri, 12 Dec 2025 08:16:18 +0900
Message-Id: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhSEcSV9zAsSpnaRm3JFBsJ4
 e5W3Lp8L/nvLxCJHUU4FwswJRdd8BkOuwK0Vf5G6IbMIIU8iqYUONoZ9eOOHF5+QFYTYaVUQ6a
 shaEW8nBkMu69Ra9dZuviFHjePpL82l/u9D+XJApsy1pWjej71sgL02DVtNfhCd26rh9mQSQJt
 QAAAA==
X-Change-ID: 20250710-phy-clk-round-rate-4aa7ef160fe9
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6172; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ZY0h85yve8h09n3VMoGeby1rYSEr9a4xEaJTa8s51lM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5+Y5i0/XBSw5mcryf95CfUSLo+Naq9ozK7s1HrW
 7Omgj9XRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJd2VkmPPLinP7Iq1VoTP3
 9Fmcfl0v/MP2VI3J6eO5oTW5Ty8+qGdkWPvn/zz548dCZAM+uE9uzc3rkPFRMjjw9Gj7psmZsmf
 W8gAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the phy subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v2:
- Patch 8 (phy-rockchip-samsung-hdptx): fixed merge conflict so this now
  applies against next-20251211. Cristian / Heiko: I kept your
  Reviewed-by since structurally the code is still the same as before.
- Link to v2: https://lore.kernel.org/r/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com

Changes since v1:
- Patch 8 (phy-rockchip-samsung-hdptx): fix returning error code
  (Cristian)

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      phy: freescale: phy-fsl-samsung-hdmi: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt2701: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8195: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-inno-hdmi: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-samsung-hdptx: convert from round_rate() to determine_rate()
      phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()

 drivers/phy/freescale/phy-fsl-samsung-hdmi.c      | 13 ++++++----
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c        |  8 +++---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c        | 16 ++++++------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c        | 10 ++++----
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 10 +++++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    | 10 +++++---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c     | 30 ++++++++++++-----------
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++-----
 drivers/phy/ti/phy-j721e-wiz.c                    | 11 ++++++---
 9 files changed, 69 insertions(+), 54 deletions(-)
---
base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
change-id: 20250710-phy-clk-round-rate-4aa7ef160fe9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

