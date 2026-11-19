Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076102;
	b=mz8EhGgnI5/vc4cADLa4ANLnzN238s/qZX8LK+ometX4G96sgC7PjM2j7FtUgwCnFAD2
	 JjqyLfpJcOpZqFUK7XdGJtSyO4Tyh/+Ro2BsHBrDW00d26SU5I4/r3MF4dbn0B0ahnw4S
	 fnkUVyyTZVjFfQiWxRW3lnOOltaIYCW+TqolOy+zB6rFXzVoDxGQRrCg0iO5BdWJAsAFM
	 a+bw8L9Mid0Y3D2NG5DKQaQkQDYllgvi4Z9reFc9ED6OZQeSNSnGNbHcGzZC89Am7Jcpe
	 fNNkBt9EYBxejv2BF4396HqCJttvJTDc18ioLS4wmAADhxJWXe0Z/6wBkKxbuOanVGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076102;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=D1dY7f066MKoc6DHSpjnnySbufNUCKf/+aqmf+2mNmg=;
	b=GLazcoWn0ShVb4odC0Lt/hvcW3N5oFWYvYCVdiAbsK9Mj8lIC+uwllx58ZB+t2pEDip2
	 xSrIcUd9umaYxSIX5P7X/YRl9cYKCiA5RfWFi24/s4xQaVX2PEVq/hHUJbfP6mj/qB+b+
	 1kQnFrUOp9fHTmjJggM2aUEjpinP+ToGV6Dn1ggoR3MbSrDbS/77qwbh31piQPZreIPhD
	 3EOp3cKeaJBJX0bjx1M2TGpd2GT8NkOtdpclXUPH2taqnbXb7PPqB1xHkUedUJyCLb0sL
	 DnUIXuoIumM6DUIFonXgLlWGWVEb2xgAzsqmHVLgZ9KhNN0jSBOtmJQUP0Wm397SsQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ehoEUjDz;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E4E606A333;
	Thu, 19 Nov 2026 08:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E4E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ehoEUjDz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=D1dY7f066MKoc6DHSpjnnySbufNUCKf/+aqmf+2mNmg=; b=ehoEUjDzfJb84
	vrgX3NYsyOQheniojAEscDWsLTP4ZycbyUTulXsZoiqtMVcrwsWfXTKwUWEeUkFf
	TqHeAgztiwokFPdapNG7Tai7ZbiFLvOlKKLC3MZLdcLHzyi5SJhK5lZPWF1rRlWo
	RYOFpb8D7SRpKp/eNCyHiCoyp8H8Co=
Received: from 02.eml (unknown [58.206.202.11])
	by web3 (Coremail) with SMTP id ygQGZQCHKYz5r_5q41HEAA--.1411S2;
	Thu, 19 Nov 2026 16:14:49 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] clk: max9485: Disable vdd on probe failure
Date: Thu, 19 Nov 2026 16:14:49 +0800
Message-ID: <1795076089649-2-ff3d027f@mail.zgclab.edu.cn>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ygQGZQCHKYz5r_5q41HEAA--.1411S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr1xGF1DGFW5CF45tFWxCrg_yoW5WFyDpr
	4kWFZYkr1rXFWIkw4DXa4xC3WSyrWUJFykCrn5W34rZ3Z8CayxXF4xA345Z3WjqrWvka1a
	yFZrAFy0yF9F9FJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAaw2AFwI0_Jrv_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx
	0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I2
	1c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8ZwCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjfUeuWlDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQEQD2r+rmUDKAAAsr

max9485_i2c_probe() enables the vdd regulator but never disables it: the
driver has no remove callback and no failure-path unwind, so the rail
stays enabled after a failed probe (including -EPROBE_DEFER retries, which
re-enable it each round) and after unbind, and _regulator_put() then warns
on the leaked enable.

Use devm_regulator_get_enable() instead of the manual get and enable, so
the core registers an automatic disable that runs on probe failure and on
removal without adding a new error path.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: 33f5104624b9 ("clk: Add driver for MAX9485")
---

diff --git a/drivers/clk/clk-max9485.c b/drivers/clk/clk-max9485.c
index 9c48c0c3a998..68df62ac148c 100644
--- a/drivers/clk/clk-max9485.c
+++ b/drivers/clk/clk-max9485.c
@@ -78,7 +78,6 @@ struct max9485_driver_data {
 	struct clk *xclk;
 	struct i2c_client *client;
 	u8 reg_value;
-	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
 	struct max9485_clk_hw hw[MAX9485_NUM_CLKS];
 };
@@ -278,12 +277,8 @@ static int max9485_i2c_probe(struct i2c_client *client)
 
 	xclk_name = __clk_get_name(drvdata->xclk);
 
-	drvdata->supply = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(drvdata->supply))
-		return PTR_ERR(drvdata->supply);
-
-	ret = regulator_enable(drvdata->supply);
-	if (ret < 0)
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
 		return ret;
 
 	drvdata->reset_gpio =

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Device tree injection, spliced into the QEMU virt machine DT:

    xclk: clock-0 { compatible = "fixed-clock"; #clock-cells = <0>;
        clock-frequency = <12288000>; };

    reg_vdd: regulator-0 { compatible = "regulator-fixed";
        regulator-name = "max9485-vdd"; regulator-min-microvolt = <3300000>;
        regulator-max-microvolt = <3300000>; };

    i2c@0 { compatible = "i2c-gpio";
        sda-gpios = <&gpio0 0 0>; scl-gpios = <&gpio0 1 0>;
        i2c-gpio,delay-us = <2>; #address-cells = <1>; #size-cells = <0>;
        max9485@63 { compatible = "maxim,max9485"; reg = <0x63>;
            clocks = <&xclk>; clock-names = "xclk"; vdd-supply = <&reg_vdd>; }; };

The i2c register read fails on the unanswered bus, so the probe enables vdd
and then returns without disabling it.

Trigger:

    modprobe i2c-gpio
    modprobe clk-max9485

Result:

    max9485 0-0063: Unable to read device register: -6
    WARNING: drivers/regulator/core.c:2678 at _regulator_put

The regulator summary shows max9485-vdd with a use count of 2 after the
failed probe.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. The device tree is trusted input (a bad DT
requires root or physical access), so this is not a security fix, but it
prevents a potential resource leak or system failure on a failed probe or
an old or malformed DT.

