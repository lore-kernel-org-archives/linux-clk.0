Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261280;
	b=ll92/QqMuKtOPWuWJh0wUuaVS75kG5CswopOUSf3x/wOdu+GSii0nblEu7L1UlwG7HSc
	 Xl1ht0A5wTSjxsQEKyBkEkppj8T3G/gX/KEa09kJIBFgIJ7Iu+xAfxjbAkZDOvCcunK4b
	 UoTnwzHM3BhaEYIVS5OTKlTim78o6UAsGxQM1Ob3a+q4n8OOXoKusY9tYw4I6Wn9ZuXe8
	 rWBUR0L03gUNA6UkRIjelt5/3PHkxF0BxqVvgOxFW69SiboDefrfNvn8895x01xt4zrir
	 6h/zL6PMZ+H4+unibqkHuTzCjzuC3geeC3VHUReZbBhEeiCyas+T1MLnBP9HzNIZF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261280;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=H0POKlXJyl1potWBMogKNasbJD7Qe/EdMAgMjh/RQek=;
	b=o/uhE2NywPjO9wSupS9Pa/I0CtEsClEZSVlfhm7ftg7dU28kaA6Pf/roGHhJ/MppH0zi
	 lxaKFPUHc8i+7DbFsVUOoh501TybD/l4dU5E942RnoxzX/QSes3HL6zejyeCNjTjn7rdM
	 ouCa87v9MSKvPZB6eD0pOzQJjfLydIMv/6CA08GVhC3CldmGu34Yi+my3Y7dfFxvGHvkx
	 ZaUeavGbJjDnRJuupk1NVp0uEMXASMB5VWgdAArO7/f8HNcGna+J2U08JYwyloABwxNG5
	 S7EljBV/DtanNP92177v+wizmarAUxv+Sn9oTiYV0wxyyYHuESQi0xvLHUz1ZgKqFyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=UADWpVae;
	arc=none smtp.remote-ip=203.205.221.236
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01031606A32A;
	Sat, 21 Nov 2026 11:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01031606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=UADWpVae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795261270; bh=H0POKlXJyl1potWBMogKNasbJD7Qe/EdMAgMjh/RQek=;
	h=From:To:Cc:Subject:Date;
	b=UADWpVaeOCWWc5JGFF1Dkfd+q0CAOwAIAfalLg+BBuOrhvfeYUKj+OyOahQuIIqxa
	 45E/P8HdlHt1cENeXlqpyk0JvcwowtejB59PBAwLHeps2hvpklxaQTC8PwZw0rrAyD
	 7UaOk9tHEPVAU7dQiVPVMrNN+qt8ZkNZE8guEcps=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id A483CACC; Sat, 21 Nov 2026 19:41:08 +0800
X-QQ-mid: xmsmtpt1795261268tij57gi7q
Message-ID: <tencent_9138CD6157C88BC2D52FE6394AF83E560208@qq.com>
X-QQ-XMAILINFO: MMvVzQSdFuTpJIeV8/5hjtQfotwkZ+jtKyfjhICSDMZIDHT1X/DYkcbH/Lia1j
	 XzXeCAPaRAu+mSZgb7XWYaWJ4aEZkHb3OGQKRr5VE13m7VPNP24J5vbBAWyRJvyaJ7bu/lTKOTyc
	 5U1neCYdoSrqPoiI4FLGrGUfhVfzXyZ/aH0laYFJ38Wx9RWIZMI9n9y9vvtWFAP0j6g/aTM191xf
	 bA6tWzdJK/yJunxXgLqTi/DF/5/D1kC+9mhQl17MIzNjkdxEU0pmELe05j1///XzD4iGUcEqg1nU
	 2ShEWEjwQQ7zWM5FBemnfpXWCn3a3yjz4NXFfWoddtgY8jBlpymIB+EirySYqXEu0j/PU3gC3qn4
	 2L2t/Y207YshOdI0SSUjVMQ4UzGDNfPf0zktGGM8vE0KvlgIqHr500j6wZSeMHUHSUI5YBpkEqLh
	 8hSBlIiZDuEBRbtMbn2Q4u/3VhwyS1wiRTp+qp+ZAKp5K31uec3cPs50VDhFzu8dkLRQkjM+nc7O
	 2PP0PdS+XqL7bXk34rye5nYJzEHXeIyeFn4V91eDFgna9Ao65Xi6ktbGr4ddRdOmgLq85Ji5O84k
	 AEdncFZHbJ/dTwuI1srplAWPy5in07fMLejYV14KxZMKXldi2Q5h0m9vYAdtYdc05AIRG0UTLIXk
	 XVPN6NWcFQ1Y5IuqFQ6UPswh/QzJry9LF3z0nmP5DMR4tIdiqMMpi7I/0tBAncU+kaGvHJWp36rs
	 Yvj8cCJzQqdJZpZQCMKfnBWmJGuxYFlYplciUPPRUpKWp1FfhbsKevW6nm7Sa2Ew2EoT7Yg4Y7nQ
	 S4yPD9ipjb277N0KxNT5dOdVvyRLcxYEcVFW3UmLoi6MP2EUvGl+3ZNkRMNDC6Gt/JBOw/D2/FxU
	 VWjb2N0QFbtq2XrLNi2H2kcH+S9XZ6JytvhonJoGtOnIISj/+cl1V6FuQ/ygiqXtpkwKb+xSClVc
	 LUZ39jg3zvhE52KJynxzHQ0GH3RmzBxZJGlX8Db2EhOxOY3SvjLOKS2dz5bySvKfW7Z9w0+y2/b/
	 iTjzddXsotbsoiVJ+E2mMjYA+ISe9CkTp8ixrHmfB9UE6oerdHByOstz7quGpbE5/Lb0JuIEL6eD
	 JCQlW6e1n33ePa1d8K97hBp3TwZA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: ZhuXiangyu <1194781887@qq.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 1/2] dt-bindings: clock: rockchip,rk3506-cru: add SAI MCLK output IDs
Date: Sat, 21 Nov 2026 19:41:05 +0800
X-OQ-MSGID: <20261121114106.1464639-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock IDs for the SAI MCLK output gates in the RK3506 PMU and
system GRFs so they can be registered by the CRU driver.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 include/dt-bindings/clock/rockchip,rk3506-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3506-cru.h b/include/dt-bindings/clock/rockchip,rk3506-cru.h
index 71d7dda2..708502db 100644
--- a/include/dt-bindings/clock/rockchip,rk3506-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3506-cru.h
@@ -281,5 +281,9 @@
 #define CLK_V0PLL_REF			268
 #define CLK_V1PLL_REF			269
 #define CLK_32K_FRAC_MUX		270
+#define MCLK_OUT_SAI0_TO_IO		271
+#define MCLK_OUT_SAI1_TO_IO		272
+#define MCLK_OUT_SAI2_TO_IO		273
+#define MCLK_OUT_SAI3_TO_IO		274
 
 #endif
-- 
2.47.3

