Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795267754;
	b=IozGrrSIRg/gPZ9qeteKXSulg45YHcKot847yrSzyqdMHYJvCAuJk2OIj7AcIs66HuQX
	 DLXILqyMiTPAX4nDr6nkznCMDdL/aqWzs+wGpbYtZeeS3GVAghFL2tYmUdbDx+7P1Frv7
	 J1y4cyRYU2Dk8G0sHou30iDVk4S0HN5xk9xhe2iPz6kOH+QBnetO3nkBwk2Cv+OolRv1I
	 KI2isX71fE/eJbpQIZ1S8IvXgxpGi4LQ0YxWjhUhPcJfNKhj2OfKyc8tQLQL7pbD9uXFv
	 FdeT0qNEnIyuCnOG1yAxQncE6hPZ5OCeKfRvnQoi6h8v03N9iFyBfKO41yNGNnbUKwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267754;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pESN0fZmE1qbESAN/BPJHFCdbc4APrRQJJ1YKHCn/b4=;
	b=xYPC2FmscX2tJiZ638LvT7m3nLzXzwRcL6iXfMEp0jwepJGMdIeM2ffdLeslcNzTD/Li
	 AD0SULp1AC1JpDeId0Hgvqjg4/2d7zypSZQhrYxK462cuwX/AH2gAOKd6O5SC6DPtoVun
	 3IqWd+4rvlxgtUcRpwh6EvmS1M5r3WFOsNLt+ULZdwAcxCNu6o/ZBKL8Y0f2OtureanVg
	 KS55vljIl5n3i5B+JPXpXGI4/rFvlV4Oi6zWQSeuXQAIuAlmH5plrdK82FsT6l/gpcL5d
	 xhAG3W6Ac5UTAsXftduTnrDlkL6WZmmTaNshQMe6IFTR/XvS8XLv03iyKiDMUMcug5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlTUR674;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6F9606A685;
	Sat, 21 Nov 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlTUR674
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795267754;
	b=Ps9IHMgMdPx7v4HEpaeulxDIbt3jo7mpNtQmHrH4InCnQ0IWUclx2j09/RkSr7DIouUj
	 PXJXXF6NckalJOUXJwufS6HTMsCZsx8vodJwIGJV/0r00ODFDseeGurngtI0gr5sBFStt
	 8JbPbFh/uxuhz+un/kMcmsYhdfxXUOygjJ/+TxUlySHqYIy5g8HKR697OzzvnVbQViiRm
	 7TO7QGxNmd1yHbyMCQdYyXuxk80ShF3G/yoCSQovV/ye2fCYEVy9+4tJrFbSWUyf8E47l
	 rtDztQw2ZoHmi0sH3Flt+TVWFBzffCcE/As/KXGBXpixuZ8XSxdDfEXo7PQIowvqqgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795267754;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pESN0fZmE1qbESAN/BPJHFCdbc4APrRQJJ1YKHCn/b4=;
	b=LbKlVIdEJ5qzx+vqTPIoGP0fUogy95Fwmkx68DJS9RZqqyS/avfaqGttYu/prc4UhzrZ
	 wJidJgXgy0R1nec1Wbgoq/ow4uj14d6mQkfrrGbHZ/UVN47yYIi27mcf3Wp5AEZ6WucBT
	 5TTRq3mtdMwY0Zq9sn+fom6kbYEPKeu2d71tkjJTAJe+BOsbKgkpQnMX2DWrph4VQJRi0
	 2NC3D8ld/aEmnYXoAWB0JLj6ccjeE+YYEEpfkD9Zw6tX8Ari9ITHqaat6qFFjzt3PvBbp
	 KbnKOOYL+8d3rHLIgTH0rKIh+FLuaGu0AccfDjgUVCxaXLREp4aD64pdRcidNTn5pkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A65CD1F000C6;
	Sat, 21 Nov 2026 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267754;
	bh=pESN0fZmE1qbESAN/BPJHFCdbc4APrRQJJ1YKHCn/b4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SlTUR674x90ToJg9E9L6pzFao7fUXQD0z4XFHU1E+58GthYjedDaI3F/7rBkW9Tnq
	 PwWSX96tuDfu5VCpXnyPwa8nWbKifBCrZB0DZIrAEAEl9g1CCas7mm8yVD+NyQqR9j
	 RNZ5EsbsEc6iEoN253MAa/I33GiIbrhsWQSYz8shI99M9yxsxIw0Uxi4OI+96WBOOi
	 W/ibPMFMftDC51pg+QzVM0rmRo/5PAtx1MaBd5KhknbIhwLLjOV+gQn+E7c56r4lZj
	 C81wHe+5dPc1iyTBqSwMG8KjYhKpIPWUqchu6a3FeH4mH0SU7gzGBsEpF5M9bltHWY
	 nNZ70cujSY4Ew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2FB634BC89;
	Sat, 21 Nov 2026 13:29:12 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sat, 21 Nov 2026 13:29:11 +0000
Subject: [PATCH v11 2/2] clk: gpio: Add driver for GPIO-signalled clocks
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-feature-clock-guard-v11-2-00c633a667a2@bruker.com>
References: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
In-Reply-To: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795267751; l=4750;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=cm+xAsBcZvHlAEI+Z16PHKMDJAr3QW0YuJhJX4wbTBY=;
 b=uBsai6fFlA5kP/t9P/K004f790KdwlkIpOcle7U1vi1q1qu9wD3VaV+R9nNVhECU8iDruinmq
 JFbmYbFKRpAB0y93MG0EEsaJFr0nAMtP2J2kW2wseP+mxGMSJE7rgVS
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com
Content-Transfer-Encoding: 7bit

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

Some clocks are not under CPU control: they are generated and enabled
by external hardware, which only reports through a GPIO whether the
clock is running. There is currently no way to describe such a clock,
so consumers either initialize too early or rely on ad-hoc delays.

Add a "gpio-enabled-clock" provider for this case. Its prepare
callback polls the GPIO until it is asserted or a timeout expires, so
a consumer's clk_prepare_enable() succeeds only once the clock is
actually running, and fails otherwise. is_prepared reports the
current state of the GPIO.

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Our use case: peripheral clocks generated by FPGA PLLs, with the
PLL-lock signals routed to GPIOs of the SoC.
---
 drivers/clk/clk-gpio.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index df0856a39c8d..66ed639db4bb 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -15,6 +15,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/err.h>
 #include <linux/device.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -241,6 +242,112 @@ static struct platform_driver gpio_clk_driver = {
 };
 builtin_platform_driver(gpio_clk_driver);
 
+/**
+ * struct clk_gpio_enabled - gpio enabled clock
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @gpiod:	gpio descriptor
+ * @timeout_us:	timeout that is used to get a GPIO value
+ *
+ * Clock whose status is determined by a GPIO signal.
+ *
+ * Implements .prepare and .is_prepared
+ */
+struct clk_gpio_enabled {
+	struct clk_hw hw;
+	struct gpio_desc *gpiod;
+	u32 timeout_us;
+};
+
+#define to_clk_gpio_enabled(_hw) container_of(_hw, struct clk_gpio_enabled, hw)
+#define GPIO_ENABLED_TIMEOUT_MIN 10
+#define GPIO_ENABLED_TIMEOUT_MAX 1000
+#define GPIO_ENABLED_TIMEOUT_DEFAULT 10
+
+static int clk_gpio_enabled_is_prepared(struct clk_hw *hw)
+{
+	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
+
+	return gpiod_get_value_cansleep(clk->gpiod) > 0;
+}
+
+/* The clock cannot be turned on, only waited for. */
+static int clk_gpio_enabled_prepare(struct clk_hw *hw)
+{
+	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
+	int value, ret;
+
+	ret = readx_poll_timeout(gpiod_get_value_cansleep, clk->gpiod, value,
+				 value != 0, 10, clk->timeout_us);
+	if (ret)
+		return ret;
+
+	return value < 0 ? value : 0;
+}
+
+static const struct clk_ops clk_gpio_enabled_ops = {
+	.prepare =	clk_gpio_enabled_prepare,
+	.is_prepared =	clk_gpio_enabled_is_prepared,
+};
+
+static int gpio_enabled_clk_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_gpio_enabled *clk;
+	const char *clk_name;
+	const struct clk_parent_data gpio_parent_data[] = {
+		{ .index = 0 },
+	};
+	u32 timeout_us = GPIO_ENABLED_TIMEOUT_DEFAULT;
+	int ret;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return -ENOMEM;
+
+	clk->gpiod = devm_gpiod_get(dev, "enabled", GPIOD_IN);
+	if (IS_ERR(clk->gpiod))
+		return dev_err_probe(dev, PTR_ERR(clk->gpiod),
+				     "Can't get enabled GPIO property\n");
+
+	ret = device_property_read_string(dev, "clock-output-names", &clk_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "missing clock-output-names\n");
+
+	device_property_read_u32(dev, "poll-timeout-us", &timeout_us);
+	if (timeout_us < GPIO_ENABLED_TIMEOUT_MIN ||
+	    timeout_us > GPIO_ENABLED_TIMEOUT_MAX)
+		return dev_err_probe(dev, -EINVAL,
+				     "poll-timeout-us is out of range [%u, %u]\n",
+				     GPIO_ENABLED_TIMEOUT_MIN,
+				     GPIO_ENABLED_TIMEOUT_MAX);
+	clk->timeout_us = timeout_us;
+
+	clk->hw.init = CLK_HW_INIT_PARENTS_DATA(clk_name, gpio_parent_data,
+						&clk_gpio_enabled_ops, CLK_SET_RATE_PARENT);
+
+	ret = devm_clk_hw_register(dev, &clk->hw);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register clock\n");
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &clk->hw);
+}
+
+static const struct of_device_id gpio_enabled_clk_match_table[] = {
+	{ .compatible = "gpio-enabled-clock" },
+	{ }
+};
+
+static struct platform_driver gpio_enabled_clk_driver = {
+	.probe		= gpio_enabled_clk_driver_probe,
+	.driver		= {
+		.name	= "gpio-enabled-clk",
+		.of_match_table = gpio_enabled_clk_match_table,
+	},
+};
+builtin_platform_driver(gpio_enabled_clk_driver);
+
 /**
  * DOC: gated fixed clock, controlled with a gpio output and a regulator
  * Traits of this clock:

-- 
2.34.1


