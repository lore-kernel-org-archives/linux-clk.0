Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672313BED7D
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540058; cv=none; b=BWw6DpuEobb48dKfbE9sprS3KDCwVelhfHK+ciwVymA1QcjTbbi311uW5Z2/mjgwLIH5wzyVS59y8g3Y4HMo/LWK0yF7aTjJR8hE+weP/ptT2J1klFaa0QobTfyxtF0xl3FYgmnOUK27TZEZtXGlsO1v6V9lQ9oVc/R3c/zrxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540058; c=relaxed/simple;
	bh=WAeuXX+lP9ApAmDxLig8RAtvnn0hthSMmgK7I/B9wz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fs8LiIQF2kEpYk8tfxi+EDp95cQMHla59Y8hJesSGzS5fdgPBqKozvYzK/4naZmd8UY5/F092AmQ0V3cgEfSWrHnRSXejVLiRiUifsfgiITApdjtTYrO0UvjknhiGlbPopbHyD1YwQYh7r5uQv6TGTlYD8RTHkKxKy6pU5/+3qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4FJHz+d; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4FJHz+d"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so12795605e9.3
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540055; x=1791144855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNSR66L+rsqa5I9ez3liVlAc8gcWggGRjRYsUUY8qc8=;
        b=i4FJHz+dghTgirW+lh8vcphIEwgpvUuBig+g3WYbJw42MZc+KeXaCJg3d0vhL1UY3y
         gWX748pUEVDEVPP4RqlFgY4k+Eq3c+c+jySewBJ+DMYBQj9diQSsnFW7+NPDVHhedQ2y
         AdobLtPZcRTeHUqIojZYoMa//BjEMJ5T6iClEXEGl86a7Z3pOpUccqIxho9NowMWyDXG
         tUxi/fsqC3bSPyjOlLd86w9F7TT2Hn4LNFrwMfYPwOPPa3RSAH1qIwkVwvwf34z8g5kr
         /S/A5utY5g1huiHVPQKuXpae796R/CEHGO9VUa6Ew/IdLf0nLl+hm03yh954X4FRsm6P
         +1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540055; x=1791144855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNSR66L+rsqa5I9ez3liVlAc8gcWggGRjRYsUUY8qc8=;
        b=MOTvNrEFTTNd7OoDH0lqrMQzrEb4ak5vWxeBte/OSGXV+Gii4X/U8ho/QlRagCOcvT
         4r74aGR5nXK+0pwwn9YF+fmJtfwShL+DG5e8uXfIcLU/WURfYnMixjA4bFxoksOL7VoX
         w4g/ydLSq1T76+d8xEArquazvn+XoM++7Ecv89lzDwU+hywmKaiavbzWtb7/d7xThuRk
         487NdhFvaWWdHuxnwOGRcNNPh0G7tk7J2h63qHF/4YTrKIxi3+W4VFwdHzCz/99a1B3d
         EKdk8DYCYFtpSkT4zlfDQhVV78GFiR9aIAehJ6/T5D0GPzy+v7HiPe/chQh/Yt4BhLUM
         88Qg==
X-Gm-Message-State: AFuF++nf9NIItMGo831zpUfdESFfVilwroSy93hHHXETvsyRTa7IbUDf
	jLLETLIj0G6NmTcSnqKQmwujo/uV5C8rRRvclsZ+TFZBbQs3BUbKil9/
X-Gm-Gg: AYBFou0QdggZl9p1ueGrzxDXv41VpvQU3fBPcVcoiD1u+rHxcxjkIlxEe/GD6neYg9o
	SxpqWhZx57gBhklA54d3RoqJmHmyh3SF8vtUQyca1ft6+68MJghsCxydtNQ2DzoZuQzCF43zu4j
	aNe3FGRd2Fi5smLGXHf1hafwVq+GKC3yOyn5jD8TotPWiBCAKuPhNBcWyOatFyaKQvRLPxP0xlG
	4ZFERzs+GS0NNMXBIeYFH93jCmsTJ8Kvb2fXX3EQ+sFTduBx1o09ZsZXSGc3zaLXHIB6XJ4Y5Ak
	CIOjAevgJSAUQEThINuGThyilNUkWRnCpQukprO8L+Ft61tCm40qfyPEuAUAAaD3gaxioeJHqJA
	CTA3Oqwc5O7wBknlFQjRgbBL3QhMfN0ktld3b+1rTvpeN/+UOpZkVYb+icS5iRjxQsW/t3AZJ7P
	FBttj7hHkJB5RfkxGiHGXrz9VHoxcoX7mzb5D/lTgNtx+WFTjuIyqAN2wJpvqIV4hZTtANYqs+R
	wF/trdSJw==
X-Received: by 2002:a05:600c:698e:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49fe66f1491mr205824235e9.27.1790540054611;
        Sun, 27 Sep 2026 13:14:14 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:33 +0300
Subject: [PATCH v13 05/13] Maintainers: Add entry for
 drivers/mfd/zte-zx297520v3-crm.c
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-5-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=WAeuXX+lP9ApAmDxLig8RAtvnn0hthSMmgK7I/B9wz0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj0S3ciOtiZ4TddTH93kGsp4UXVIfMt7n79s
 r0ElotOL/CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKW/BAAmpXG/xbFgkzgIfhZqAl49ngI7YFzIm4
 nlz4d2lVrIFvPWl/QBMAgDtvhzz9OJNp6NEDOEqvNzyqT1VxxeNeQ4zJG6SUIAIgd20+957sTR3
 Nhs4WqZ4SuSyLxnIyK74JInCTsYoOHXd62yllcHYuxsPMrYNsqYj/zz7LJCSOkAasbwHg48i6Vq
 Tz64Img1+QUAIeCyAxKNi3fN1pNY6xASp9UIDE+ZeI9hLi/pHeNRnW1Mt4aCGvMt95mqSB+HbLB
 DDEyFDIh7VAHtst8NTkqz25FsA+hwBk3NH6L5qXbTHABfXFJHoOZ/HrdFRMQXjguwYT/0DAGiAN
 AOwbkj4Focx/6CCTNpcqMBIWFs4RpuauE1YVAUWGue8mlYgk5hVbNCFcfuhKj3wG34yv0TjUxwO
 QyphlSKqxLu14akUrCjKnmftBa4RlZEnuvs/bVzNQXAmdeY9wvGjMNyAl5fkZPLRDF589mBbs5h
 vkhnlFUiNa/kCEeCtncbCB2fFJmkAH9AFA0+Z328yU81QFo62/A90VHRK2J1zpBnuaS+ATNc2xh
 b9bVAEUy2R4AsN6qkkp4prbioRkXdYmz+s23mKBOSZAc9AnqbUcUiB7u5flJk45geDUcbvPNmFR
 g5XFhBuQSAb97ggmKp7jjD53F2dstl/Rmc3oo2k+B0lD9v1OMpfI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This was broken out of the patch introducing the zte-zx297520v3-crm.c
driver by Lee Jones' request to prevent a patch dependency just due to
the MAINTAINERS file. I plan to send this patch to the mfd list once the
bindings, clock driver and their MAINTAINERS entries are merged.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06dbf9305518..41c287316d0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3927,6 +3927,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h

-- 
2.55.0

