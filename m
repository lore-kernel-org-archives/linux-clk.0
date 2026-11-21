Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795266973;
	b=DnKEROh2QHK1AteTt/8430nZ4lKZtF4Zs9ICtapx+zBdlwB5dMBo68/Ada1TBcpWp8ij
	 YjOffGHDqgMWuoyam8HcNP4bSvx8n3oXWBlRE86vdwOU6GiE7/06of+hbmBGRYqwlBnci
	 +2c9tasrGKP9XNKh/MVa5iZvGNC/nFYxGkfCjvzPzHkRJluTp2xH3AA1krdPjne1RoN+v
	 +VzCEYqdq5y4yP3EY6ogZ/FafoHu8CpChOqvrvkHED1XIYpOzTvG5ZB5jGBRbFmeCpBoU
	 wKVVr8uxWb65Jw1RIqG3fRlgPc8ExuIK2a1FeFJqzwt4vtatrHDrROOuNOQ2OH8vjyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266973;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/sGZqn97tL9illgD8dVqV08HlJBJu9Dy61Ryqg5Ev5U=;
	b=O+MAy3s8DjSJ1tsFEIKeUj/Sv/1DSMjHDYGtJe3RMlpmf19UNR2HNA3/kGKgJzdrkqlP
	 ZoMdppnlZ7ko3vPM+OgUYDC0apt92JoOXfuWKsAsUPF4B//8BHGMhhLimen9vI7ZcqyyY
	 A4QU9nFMuesFIsSVk8aEpnoYK1CD06AtGI3Qtbfi0o4gyshsR79qE6DHUiTgUKHtb/phI
	 hqQ9XwrYoZOeWunTFVGMUEZyo5+c23p3TUUxH6W73ZQvHt61wQ3zz4aGwwp974lz3uqIm
	 /RHSTEPfFSFrzi0K3MCVe6iqoFl3jQbyL/IuiOP3EpM/NWTzw4GZGEmFUYphV1ZK6LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmnZtiXh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FA606A338;
	Sat, 21 Nov 2026 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmnZtiXh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795266973;
	b=k04y7x7TkLQR2eGaL/7XkKAYBWIVcXd5W/JMFpwTqOWopOv3GMkWBlOsIwF8e/vpPTiL
	 KrwvlHtgS9KE1DqUkRb+xA0EZR14u8UsCB4HmMas3JRy93z58vyYtHu2vfTB92cxf+I+V
	 MzgDSq8owsySLDNyGN5jrsI+uhT373iei/54uSg7OIQmrU1FqFUUF6iFC+LbJAGvoXZBZ
	 eWan71wLcTZB7AzbBcAK4xag9QWtpIE+qJ+eEfAz6Dv3gvspanfpP2RhlDzjOphxuyj/0
	 L7bEynkn9pd8QA4Alw1LuZo+r9rhP8HUJQibqXMOh+xEnRn3SVGjV5IqoGVGBHNtLEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795266973;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/sGZqn97tL9illgD8dVqV08HlJBJu9Dy61Ryqg5Ev5U=;
	b=thinHGJOm75rGd0fE/ljFPbVzKUYFW/8s7F6/JoDsCYfj0Diy+w+xcMgOfkxslXipR8L
	 D8RNaVp618D/3Hsd5RPa7ykyb2v8UN/8SQ7ZbTg4a7itDG5aP6hvOWkK/GgClTPPi5K+R
	 9St8g4KJt89v6UWRYk0eSlSsMxI8YGpZ4+NRcphuqEBNKk7CDhHXK5ZvMlNQ7Klb0dkzC
	 x+EmpvJ4bHfyRbxPfcHWF2qITLZerjhpfsGBnjF6wJ19gApdy/Vhrn/RNu6PTCchJofOy
	 QFAS6zF+9y9LMz6fGt7HkExJZxo/ctUVFzxZoxS1rUcdQp0DjstJMiIDmIdBAP38wpA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 576FF1F000C6;
	Sat, 21 Nov 2026 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795266973;
	bh=/sGZqn97tL9illgD8dVqV08HlJBJu9Dy61Ryqg5Ev5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bmnZtiXhu+wKpx4H4jrxw4ZEJGHO4f/5z+InNwu+s8wnP8sWSLt6RLBS7ZsRRmfLS
	 EqKiQlOoNNtDpBUj2z3OW1M0roG69VNajnFF/V9VmXM1ZwZR6D3AoN2MCwLtfvb+uf
	 SBg2Ezwl6zFcsriiC3h+v/8zxAcZ5gW5fM8oE67tEJPR2FhGvWdLxiLQdXlsxE+19k
	 3uc/4rz8Arnxa1so4vfqYaXfgVzGtqG5t7Q5mBxSvSYREBbMe6vdlNg5LhqQdvBhLi
	 SWboFgMyyEgczFtHMeAoU0Ryxd658jyQYU8XEXHCP5lthztbKGu0eRbMcLpqAZCJ93
	 ZKm+xH25QT4ZQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D73B24BC7B;
	Sat, 21 Nov 2026 13:16:11 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sat, 21 Nov 2026 13:16:09 +0000
Subject: [PATCH v10 2/2] clk: gpio: Add driver for GPIO-signalled clocks
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
Message-Id: <20261121-feature-clock-guard-v10-2-5d449739bb8c@bruker.com>
References: <20261121-feature-clock-guard-v10-0-5d449739bb8c@bruker.com>
In-Reply-To: <20261121-feature-clock-guard-v10-0-5d449739bb8c@bruker.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795266970; l=4749;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=dyzkwpsDWy1xsw5+SbD3ygu7Ho/BhopKpUo8Bx6I3RU=;
 b=0pmBPzlfFwjpY1hNo1Yhxzco9CP542ccdODSzyrfxu4lUTpDyvIzkEz3mI8UBLTwDG6UCtyY2
 HGwhrV2XKKOAJga3Keq6YbOFV9YVWv0g9bM9QYmDEVbd5qdDITA/oFx
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
index df0856a39c8d..33f251b209a0 100644
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
+						clk_gpio_enabled_ops, CLK_SET_RATE_PARENT);
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


