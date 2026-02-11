Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E57207A32;
	Wed, 11 Feb 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770819809; cv=none; b=E35H1vuzIZbET2GamIAZYITbg79YPixpIK/dhXaU4mZmyAgWBM2OLbGDx6GS6j1fiW9oUM67UZjQurXwVtzp2tJdP5WLyDcFMdOd1yx1b80JbV8nBqEJaaC1aC7VJmEl1qbm6iSvNo2QaZdOYWA+sjP4heTpIVHIDwR3HFd0ad0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770819809; c=relaxed/simple;
	bh=N/7eEnN+HiyL9etKEOczHnkDOPiApMWEXth+P0IHcyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRwsKkdD9yqrvCexWFYPTTp+3FiHGKd1/Wn/npHoi2G2qQvVmedIr+oRvMGtht2oDGxnoU3aVpib/oK31CXQPPwmV+NOddnp0ZqxJZMtfZloIF15S9BhLYZFtSCTR1dfkeApaO6D+3oRj4QAhtVb9eep3GdK/x2YISOPMBFadmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IreDnOfU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IreDnOfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFC5C4CEF7;
	Wed, 11 Feb 2026 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770819808;
	bh=N/7eEnN+HiyL9etKEOczHnkDOPiApMWEXth+P0IHcyU=;
	h=From:To:Cc:Subject:Date:From;
	b=IreDnOfU8XisToO2yxhMcnkzvWqHUyoBViMpgE/9jal42Kn+ZUIEAgi2nKXkW/88/
	 dRdj8ELyE8z/Y6GuzzYVbexVNmWWdAst6GzenJsYlfOq1K2hFoKv/aVCpJK/FOiqJo
	 AIOKpIo5VMhditCBAGF8TCgBvR9vtKIlV1EZeWxLKqmNcxq/t/0bk+h34VFvYJ7mG9
	 2Pll2apcmkgt5zRGa8UfmgalkIEZu24yyA1yUWeMPKU+C2beE9gCwplHt24QNz5VeP
	 X2bG8nczKZYsHio7irZnwhA6nWoTGqO/iSaQO4CzqOnYuZXEF/3gXWb+Z79bWk6d1B
	 wrSAOMzLbkbcg==
From: Danilo Krummrich <dakr@kernel.org>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
Date: Wed, 11 Feb 2026 15:23:16 +0100
Message-ID: <20260211142321.55404-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
called from IMX driver's probe() callbacks.

However, it neither makes sense to register drivers from probe()
callbacks of other drivers, nor does the driver core allow registering
drivers with a device lock already being held.

The latter was revealed by commit dc23806a7c47 ("driver core: enforce
device_lock for driver_match_device()") leading to a deadlock condition
described in [1].

Additionally, nothing seems to unregister the imx_clk_scu_driver once
the corresponding driver module is unloaded, which leaves the
driver-core with a dangling pointer.

Hence, register the imx_clk_scu_driver from module_init() and unregister
it in module_exit().

Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
I plan to send the driver-core PR for 7.0-rc1 soon, which will also contain
commit dc23806a7c47 ("driver core: enforce device_lock for
driver_match_device()").

It also contains an IOMMU commit similar to this one:
https://patch.msgid.link/20260121141215.29658-1-dakr@kernel.org

The commit was originally scheduled for 6.19-rc7, but was deferred to 7.0-rc1 in
case more of those cases pop up (which now happened).
---
 drivers/clk/imx/clk-imx8qxp.c | 24 +++++++++++++++++++++++-
 drivers/clk/imx/clk-scu.c     | 12 +++++++++++-
 drivers/clk/imx/clk-scu.h     |  2 ++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 3ae162625bb1..d89a2f40771e 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver = {
 	},
 	.probe = imx8qxp_clk_probe,
 };
-module_platform_driver(imx8qxp_clk_driver);
+
+static int __init imx8qxp_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&imx8qxp_clk_driver);
+	if (ret)
+		return ret;
+
+	ret = imx_clk_scu_module_init();
+	if (ret)
+		platform_driver_unregister(&imx8qxp_clk_driver);
+
+	return ret;
+}
+module_init(imx8qxp_init);
+
+static void __exit imx8qxp_exit(void)
+{
+	imx_clk_scu_module_exit();
+	platform_driver_unregister(&imx8qxp_clk_driver);
+}
+module_exit(imx8qxp_exit);
 
 MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8QXP clock driver");
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 34c9dc1fb20e..c90d21e05f91 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -191,6 +191,16 @@ static bool imx_scu_clk_is_valid(u32 rsrc_id)
 	return p != NULL;
 }
 
+int __init imx_clk_scu_module_init(void)
+{
+	return platform_driver_register(&imx_clk_scu_driver);
+}
+
+void __exit imx_clk_scu_module_exit(void)
+{
+	return platform_driver_unregister(&imx_clk_scu_driver);
+}
+
 int imx_clk_scu_init(struct device_node *np,
 		     const struct imx_clk_scu_rsrc_table *data)
 {
@@ -215,7 +225,7 @@ int imx_clk_scu_init(struct device_node *np,
 		rsrc_table = data;
 	}
 
-	return platform_driver_register(&imx_clk_scu_driver);
+	return 0;
 }
 
 /*
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index af7b697f51ca..ca82f2cce897 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -25,6 +25,8 @@ extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8dxl;
 extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp;
 extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qm;
 
+int __init imx_clk_scu_module_init(void);
+void __exit imx_clk_scu_module_exit(void);
 int imx_clk_scu_init(struct device_node *np,
 		     const struct imx_clk_scu_rsrc_table *data);
 struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,

base-commit: 192c0159402e6bfbe13de6f8379546943297783d
-- 
2.52.0

